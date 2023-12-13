Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8FAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLgdZCOr+tAKSbAsTWiEyVWqe4auxkNsEs7y9a+XTR4=; b=I0klKFojZ+yibcTinw+OEtp2ra
	AV7QRzbpP4lpW4Ze9Do73OxTmaCXtIGul6hAeAo5sHIT8fCaFABfexFtQAXSt4OCm+uDNA9ihViT0
	2z3/t1LHkL9srqhprl22X2C2H8606C1S/xLim6zneTsuJ6Oqc1ogo3bDREFfrg3IpUBrsxQQDlHfo
	rNSkIkqnU5TlctZswud9JNDBV+eIGMTDhOv5uwYODpE2LxWGcYT23m79Ucg/EHhV1ncPeBCm9EzDA
	fKgd/Z9eWFBeUS6STQxu/+zyMluwpjQpIi5AnMy4w0EunMCkiOPm1DUS0reaIMD8xVnn9ggIo7faZ
	XTXJuWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDeD-00DG5P-0B;
	Wed, 13 Dec 2023 01:02:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDeA-00DG4r-2v
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 01:02:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d0897e99e0so38196385ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 17:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702429366; x=1703034166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSXCpaBxHdiNua9KDi/vnKPqQf7jzYWRNQ9I/nlItPk=;
        b=bFxRV2LhfQx5ROuT1JSc62PuPIxRaxfqgFQ+MviN1jxHk4NwtFH6vVpoCk/0N7zCaC
         7ohAk0lFu54axC8v4QpaqyEKABnClxAQByBtDpLw9b3Y7V7m8zKMXi7JjWNJa2bmKiBU
         Q44akrsvuD1D/RJfBHtPmDcdBtOTD2Pl0nHgHnhuqz/bCxIQ0YVknAQtxp/cJBJK6qo9
         el8w5wKt/LJYhrXArwECcdX+SE3cRGGkrrewn+1sRDcXQPbqAYc/KuKnfmI32YfRRsYh
         1iZZ1nMM4gdE6+9K/kpD/1Wc3JfHQLyiaNJfKlOfEghcjIEil2mYsV4V25g60J4rR9Vb
         zgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702429366; x=1703034166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSXCpaBxHdiNua9KDi/vnKPqQf7jzYWRNQ9I/nlItPk=;
        b=C9e4hn1VulRSu5Ccn5gXztL2cPo+rVBuiSXsatVQYrqcO9cAhzfmTkYXnVPEo4InBm
         YOpg+257lDoYO9jq266AoQGS/s2MicMbBGrN0V23LYRN94aYiHvBgCugsEPDyXHpcd9p
         xtyLo6jFfJ0bqilHofEYaeF6lpMEsyDvXIMhjsbrPdx4rEyFy9Ybsr9hFIP08sdjvwp7
         NUzLTz/M4g/9hYkg6DBmj/DmT6vRKgRY26jCeXKthluqHbPQh21QXjUBuYitZ/nsj4CT
         9R7XlaTg/X32dWWJxgcW4R648ztmvvrqASV8KJSbkwZpRRjpFFXxmRDVP7uZ5nbYpH27
         zZsw==
X-Gm-Message-State: AOJu0Ywm1G6ZYaD6fXb31s16Yue+SaBkRGw9z+Y3O6ayUqCqsJJyzvz/
	ox65ETn5kFnlnhvUUz11dPks0Q==
X-Google-Smtp-Source: AGHT+IFum8Ift//4Nra1iOHPfHAzmMHgsPr8kZVXLDYsGQ+bYi9tzjcgY6pGrGjQsCDcWHskZtKrZg==
X-Received: by 2002:a17:90a:ec07:b0:286:6cc1:279 with SMTP id l7-20020a17090aec0700b002866cc10279mr3175285pjy.68.1702429365928;
        Tue, 12 Dec 2023 17:02:45 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 19-20020a17090a1a5300b002802a080d1dsm10638490pjl.16.2023.12.12.17.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:02:45 -0800 (PST)
Date: Tue, 12 Dec 2023 17:02:43 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	apatel@ventanamicro.com, ajones@ventanamicro.com, guoren@kernel.org,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, samitolvanen@google.com,
	Bjorn Topel <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	jeeheng.sia@starfivetech.com, Heiko Stuebner <heiko@sntech.de>,
	Evan Green <evan@rivosinc.com>, jszhang@kernel.org,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: envcfg save and restore on trap entry/exit
Message-ID: <ZXkCs9ypok5X/Wx2@debug.ba.rivosinc.com>
References: <20231212235003.2036221-1-debug@rivosinc.com>
 <mhng-ae72b5fd-358d-48e2-87cf-f571b67afe9e@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ae72b5fd-358d-48e2-87cf-f571b67afe9e@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_170246_943056_D1A07E38 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 12, 2023 at 04:53:48PM -0800, Palmer Dabbelt wrote:
>On Tue, 12 Dec 2023 15:49:25 PST (-0800), debug@rivosinc.com wrote:
>>envcfg CSR defines enabling bits for cache management instructions and soon
>>will control enabling for control flow integrity and pointer masking features.
>>
>>Control flow integrity and pointer masking features need to be enabled on per
>>thread basis. Additionally, I believe cache management instructions need to be
>>enabled on per thread basis. As an example a seccomped task on riscv may be
>>restricted to not use cache management instructions
>
>Do we have anything in the kernel that actually does that?  Generally 
>we need some use, I couldn't find any user-mode writable envcfg bits 
>in any extesions I looked at (admittidly just CFI and pointer 
>masking), and unless I'm missing something there's no per-thread state 
>in the kernel.
>

Cache management operations?
As of now kernel blindly enables that for all the user mode. It will be good if
that is enabled on per-thread basis. Sure, all threads can have it enabled by
default. But if strict seccomp is enabled, I would argue that cache management
operations for that thread to be disabled as is done on other arches. As an
example x86 disable rdtsc on strict seccomp. 
RISCV allows this CMO extension and I expect CMO to leverage this (currently it
doesn't).

I was being opportunistic here so that I can reduce number of patches on CFI
enabling patchset.

Will it be okay if I revise this patch to include with a usecase to restrict CMO
(say for case of strict seccomp on risc-v)?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
