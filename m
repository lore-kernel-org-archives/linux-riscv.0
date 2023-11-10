Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636EAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFK71H/sSbE275xhg1lJSQ+vxLcXR8jyS8uYbtmmpk8=; b=cKsePImLAHwrUo
	wr2Lpb06wq9JZAuUqh6zcFj7GvGrth+KJmrsY1Kpv3C377lGiTVLKVr2Im1k8btd2KhEIeHR1NSR0
	VB9X6ioF8IaKa9ZR4+SUJL9O5Zo0j1PL/Zq+SzpWu90YHTXmF+K1UUeUgqzVPP6TEx8V+7VkhhDce
	fx7ZOxtJJbIS7aIfDdzWaykDN8z5cA+THFNIEUe7dyExfOqSEXqCDfo6loj36m+rNGDAMSzJ751pd
	PcPfU+ZNlwACuZziWuyaZw6kZxcgb9WmDmj1GdsXlS/jwGdpFFSpY3W1yNjA7R6ahDVCRzgv9dfr5
	aHZYGdvFTRzsa/utTMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Imk-007qWE-1H;
	Fri, 10 Nov 2023 04:06:22 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Imh-007qVe-2r
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 04:06:21 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-45db3badadbso712252137.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 20:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699589176; x=1700193976; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUDU8jgptAxW+fbE2XJsHM9R/m1WuxaBgSA3vJN2eHc=;
        b=AIH2Lpo8p+wclVgffOj9quETWOGjJ0yfYRDDcAc85uUlhcj/NplLAiIO3FyoeKho6E
         +LAxHhT1K2+raB4J231sjhZauiRIgUumxSxv+4on35i5CXEUgus6poyoHmh4P+6JZHym
         s/JkFsuqasXVMNSMT5SSo9kUCxC0CYvkSJfZbEPeNHDgRD4Z+i93phBISCyW3SyXh2nE
         xQczfCqwPWmkv4i5nTYdcsX2G+BZ8VM/ru5itkoz/aG+e0UdKadOKCVrVARk8tJmL4wr
         chxGdgs2XXyyYmG67ThCyai0pSEAHzCIIocbM/4qIDjDP8b6grpwG4dc9bCqCp6TfzQ7
         +hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699589176; x=1700193976;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUDU8jgptAxW+fbE2XJsHM9R/m1WuxaBgSA3vJN2eHc=;
        b=KJs7lrT8UwV0LmvHxlh/mrxKqiVWx0pfKEXVnHx0WeZKQVQZ9Dluuy/LUvpFEIvffp
         esTQGI7vaNv5lwhJ6Flfn6TvDUte2mD0Pg8UFDu3+g+MSMluKQme4incUsCYFlcW90qA
         31ji5yc98SaQBmdHY1XdXEM8175zE5gCJI3hGFn7pWRAmxP8KlbbNlr/xOBXNW6+PCOa
         MsIRPuNLOEjt6/cdZTKnHYOOI97yAmT6Bgh5tYZohnmwF5Z+gBc+sukaIL/oH5144NXb
         bUExMcWVqnWRiN9dPgH1jn+H19JqwW3HiN71Sc7VHEmfVFpZZu4VsxOIwgdWn6+bfVFU
         rShw==
X-Gm-Message-State: AOJu0YyIK33vo+7UB4cFE4s0yYydlz3Od/u+numA8+/f8y+R7vSaIEDV
	aZ8tH76uMO2wVSjPgN1BXCIUTQ==
X-Google-Smtp-Source: AGHT+IHRC6A0RYIZ+hAK7pADe4iS4Ng9L/OaXImZUunvvqSvdYwesELoXVdLs1NatCPZXbqISvIX0A==
X-Received: by 2002:a67:e0c6:0:b0:45d:9376:a873 with SMTP id m6-20020a67e0c6000000b0045d9376a873mr7001350vsl.29.1699589176700;
        Thu, 09 Nov 2023 20:06:16 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:99fc:78aa:eebe:b7e0? ([2402:7500:4ce:aeef:99fc:78aa:eebe:b7e0])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902e88d00b001c627413e87sm4301587plg.290.2023.11.09.20.06.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2023 20:06:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231109080549.GC1245@sol.localdomain>
Date: Fri, 10 Nov 2023 12:06:10 +0800
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
Message-Id: <CF7F714A-CAC1-41C4-A43A-DA1273111492@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231109080549.GC1245@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_200619_933074_9781AEEF 
X-CRM114-Status: GOOD (  10.88  )
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

On Nov 9, 2023, at 16:05, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:38AM +0800, Jerry Shih wrote:
>> +# prepare input data(v24), iv(v28), bit-reversed-iv(v16), bit-reversed-iv-multiplier(v20)
>> +sub init_first_round {
>> ....
>> +    # Prepare GF(2^128) multiplier [1, x, x^2, x^3, ...] in v8.
>> +    slli $T0, $LEN32, 2
>> +    @{[vsetvli "zero", $T0, "e32", "m1", "ta", "ma"]}
>> +    # v2: [`1`, `1`, `1`, `1`, ...]
>> +    @{[vmv_v_i $V2, 1]}
>> +    # v3: [`0`, `1`, `2`, `3`, ...]
>> +    @{[vid_v $V3]}
>> +    @{[vsetvli "zero", $T0, "e64", "m2", "ta", "ma"]}
>> +    # v4: [`1`, 0, `1`, 0, `1`, 0, `1`, 0, ...]
>> +    @{[vzext_vf2 $V4, $V2]}
>> +    # v6: [`0`, 0, `1`, 0, `2`, 0, `3`, 0, ...]
>> +    @{[vzext_vf2 $V6, $V3]}
>> +    slli $T0, $LEN32, 1
>> +    @{[vsetvli "zero", $T0, "e32", "m2", "ta", "ma"]}
>> +    # v8: [1<<0=1, 0, 0, 0, 1<<1=x, 0, 0, 0, 1<<2=x^2, 0, 0, 0, ...]
>> +    @{[vwsll_vv $V8, $V4, $V6]}
> 
> This code assumes that '1 << i' fits in 64 bits, for 0 <= i < vl.
> 
> I think that works out to an implicit assumption that VLEN <= 2048.  I.e.,
> AES-XTS encryption/decryption would produce the wrong result on RISC-V
> implementations with VLEN > 2048.
> 
> Perhaps it should be explicitly checked that VLEN <= 2048?
> 
> - Eric

Yes, we could just have the simple checking like:

  riscv_vector_vlen() >= 128 || riscv_vector_vlen() <=2048

We could also truncate the VL inside for VLEN>2048 case.
Let me think more about these two approaches. 

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
