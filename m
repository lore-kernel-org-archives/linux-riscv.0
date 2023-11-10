Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AADDC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 03:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKfyJ7WhT569rBoMQaJUsmSC/J10blLgkAOcwSsl+O8=; b=V8OFsCildyUxPB
	7dOmhjpdPzSS3C4RhqfG5nIH/Nnvnwton/4r73ORLa4XDALYCHCvTLQXHahniIer52BjWCOIZGroS
	VOG+MYK2fBVje5AoOWeaEzv6B93KkbETdmDoDNkUqQH1ugaFmposZhKrqYEhwnCFJ2jCsEolwxUJO
	hrReM9/TsMNARALxsJzAp28YFvAoIM1rr0JISlCa4bY1ECuFUnFFInLxSpXLAHjAPN03FT5Ut5hLh
	bkjUZgoqy9b6aQlWvI1opK11TUMPHQrOqV0yw8jn42il6OtdRbif5xrAB5sGCJThYphA7Y3v7uooA
	2WmqIgLCafPD0p7jH4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Iev-007piq-0X;
	Fri, 10 Nov 2023 03:58:17 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Ier-007phP-1h
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 03:58:15 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7bae0c07086so736184241.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699588688; x=1700193488; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGF1v/gqhKIfK3lN8tg1lEaaH/f3W7AggG6onMYyyAU=;
        b=jtnnWvzc5q5O0vXIzcTZ5IA6ajyiV4/Fbz5o18s1u9VxQ3QLpMhV+4aEv1X/vRNSiU
         dBV+f/YyCCAd60KTteABVIwn/kY5g7U5FFEp4ZgWlg3TCEnGmVub1IkOodelkkNBSwKU
         cmI8JMNX2Lcy1BJjdHLyqO790rLZFMXypVRGba1jyOEK5fYX3EjdfEcsw4qXENPO27Ck
         MmEwkbX6Aot6wDbJmn1ifwbThgBH5dbWPLGBJbiOm1CmeWKFhlq0WwPQiEbxX+gwLBPi
         J0Vy+2KwlLkQtTk5VD2K+qagYO3CkYlSqK0cWIFHEjjIyAggdUpSdzrvs/Had0JyK9Rn
         jPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699588688; x=1700193488;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGF1v/gqhKIfK3lN8tg1lEaaH/f3W7AggG6onMYyyAU=;
        b=KgB1VqtO9ChkwrUUoD8T9eFqhSXaamWwioAZIrdf/7oefSSDGb7mDSOhbFzuzESyiy
         Vy8uMMAazthj3yK6PdOUEbOUKHDFslYUl2Ajs//PbGHprXMvdkwubCkZPud+T3snYyof
         wXjYvMcKJhm/Pz4saAs+06nPB0bh+JCQlrsHnuILylQuoxA5eF7okqL3DmldcRP8EpXF
         8/7IS+mYaj1FMmTJXuR8CnWx/HMJBldoguGuNYSz90hQ+KiiWDWElx3lILeq3uhQUM8/
         A+pK4SNEqsbGryS7xYf0UlrtkvoyTD8qtOyMUn6Y0eos8K+HXq/ZYhONfTynMw53ytN/
         RLuA==
X-Gm-Message-State: AOJu0Yy0jO6tu+9L++9fouZRzgeINwIwSP0a0zXDsVfNztsveMXWJJvt
	f9UFSgGEwNPA0JLpTZ9w8Bg9AQ==
X-Google-Smtp-Source: AGHT+IH9dKkq1F5Ww/wHqKo0Olzi4faKaa+VUqagiGOI3qwKWLaQqIZvl/khSG+4iZp6x2Dc6RGO1Q==
X-Received: by 2002:a67:ef49:0:b0:452:6178:642c with SMTP id k9-20020a67ef49000000b004526178642cmr6819492vsr.1.1699588687911;
        Thu, 09 Nov 2023 19:58:07 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:99fc:78aa:eebe:b7e0? ([2402:7500:4ce:aeef:99fc:78aa:eebe:b7e0])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001cc307bcdbdsm4303356plg.211.2023.11.09.19.58.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:58:07 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231109071623.GB1245@sol.localdomain>
Date: Fri, 10 Nov 2023 11:58:02 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <659DE1CF-4F42-4935-9DFD-E127269CEC54@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
 <20231109071623.GB1245@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_195813_635543_E061ABDF 
X-CRM114-Status: GOOD (  16.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 9, 2023, at 15:16, Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, Nov 07, 2023 at 04:53:13PM +0800, Jerry Shih wrote:
>> On Nov 2, 2023, at 13:16, Eric Biggers <ebiggers@kernel.org> wrote:
>>> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
>>>> +static int ecb_encrypt(struct skcipher_request *req)
>>>> +{
>>> 
>>> There's no fallback for !crypto_simd_usable() here.  I really like it this way.
>>> However, for it to work (for skciphers and aeads), RISC-V needs to allow the
>>> vector registers to be used in softirq context.  Is that already the case?
>> 
>> The kernel-mode-vector could be enabled in softirq, but we don't have nesting
>> vector contexts. Will we have the case that kernel needs to jump to softirq for
>> encryptions during the regular crypto function? If yes, we need to have fallbacks
>> for all algorithms.
> 
> Are you asking what happens if a softirq is taken while the CPU is between
> kernel_vector_begin() and kernel_vector_end()?  I think that needs to be
> prevented by making kernel_vector_begin() and kernel_vector_end() disable and
> re-enable softirqs, like what kernel_neon_begin() and kernel_neon_end() do on
> arm64.  Refer to commit 13150149aa6ded which implemented that behavior on arm64.
> 
> - Eric

The current kernel-mode-vector implementation, it only calls `preempt_disable()` during
vector context. So, we will hit nesting vector context issue from softirq which also use
kernel-vector.
https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/

Maybe we could use the `simd_register_aeads_compat()` wrapping as x86 platform
first in a simpler way first.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
