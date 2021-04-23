Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29ACC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 07:16:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1907761042
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 07:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1907761042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+0r2fzG4c8b3mMreAm5jPu99h8s7L+juWGoMSfbRpa0=; b=kmZita9HkJxerdu6u3Hos3eai
	0CK/tUVYimz13QtdOwVW2ddwaWcAVO+52S50lpoPryXYQxsqkA1RqHpwLh4rjkWMGBXnodWluPjao
	44PnZ277qnECZvEnQFDZ8lRO2E+MpFIU+X1t/kVg79G+XQod75ZUsVKB0mMpO1HK5X6Nshf5AHEoE
	JEu+Zbnil03/nVAFWCyQk0Lm9P0DjRM/vih/r+taygQaGP4CWnO907IWA5rmpm4Rf5O3Eb7zLcGjJ
	ihzDVlxteB/9FzYNEPh+P7KxwfxEyisvrtF3Ct+29i8LslwJzZzdx1YcPuSqc+Kc4pfOrdniN/8bw
	qFQAkfNEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZq2p-000wSg-6d; Fri, 23 Apr 2021 07:16:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZq2l-000wSN-3U
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 07:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=d3vwsSBvNjlMZS1HnsQu5P2rXD3UhnjfCG/NtiaBq44=; b=PJRcx2QObULrgsu3c3ni/PhGb+
 cG6qVWOlqjQxMgDJFjN10Hichs9yBif2uwARmmDyILoaEEWCCW7OmQZBmaKgQ8Efq6hzY6SZM+MFZ
 0lTinFQPGjbNUfTG4+Ik5iG+xf7T+IX3F6aDxnAmbEMmni7Bncr8qW2/3ct70Tx3j1KNIWZHpc+o7
 rIsNASqw9LDpKn9niRVTugrjmFEo1g/8Fbomcc0pmmWmIaPXiqFnHOqDNBVdfGk8l+BoTbtHXNZwY
 IBf0TW5RFo/ZQdho/5Ll14TL+epL3aBatwqIbKj/oN/Kh8dJDm0vIhyGhA9hedww7PQsM8xm1XahP
 OJorzvAA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZq2i-00EDI3-AJ
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 07:16:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id y1so9143922plg.11
 for <linux-riscv@lists.infradead.org>; Fri, 23 Apr 2021 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=d3vwsSBvNjlMZS1HnsQu5P2rXD3UhnjfCG/NtiaBq44=;
 b=y1stGpxwN4+rJTi10nNbl+O/wMLR5CqX0uWz/DFxFzO1JpQEGolorqCKw8H0vzni6u
 KHfxlxTOGA+oEdNeL3XoKQp0pdNf8uch7YxwlaB1VXicPzOFjXaD9BVBpWSGtVbvQbUJ
 Ym/3bwQBLGHBOo7EeREllCS2f9OdnjSlc1l6XLJ9Z5MTpA6No8092WD/XJi1BJDWpJmJ
 +55ZZHeBJ/Jx309SmH2Jvq0TEIgjpVKFThQ/Aream3/MGxGGLBLf3Z/OKAGNu00+OptS
 bYtaGIz3xn0/rLC2WCslO8G0naiX2QVF0/Pbw26yRYw/SVBvl6dWbr/5FBzSje4hWx0j
 +hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=d3vwsSBvNjlMZS1HnsQu5P2rXD3UhnjfCG/NtiaBq44=;
 b=MJsOwqosetkA/hoRSOpcDlM7wpVUpf5Upgu/2KWHSp9E75mVmtWuL+QKTZLP+dW6O4
 EbC8OpPZVb8J331WzufUyx77ZhHaKty9AmEN486Nb0HiRDkiHKxFYp3LRTePyfLxJgjJ
 9L7szgDrNc+Q8r4ADLJLkTSLaEYjj6yo3UnNkND4J2SIgLhWUVcm0/A1IL4hD3t7ygqw
 cbObjZAWc2TuC5KkCmdWYNPC2GXMrFnmUgcKkASMgVwX2Pz36inFzzuqUH3sZAHs0fch
 uFasqwNtjjDPgISAUOtFRH0hRwPL2RACmQbGc6v8WQMt0BBb21tGF898EW21qeT3qd6E
 Ws2Q==
X-Gm-Message-State: AOAM5338ioN6Q9u8ZQnF5Z80SM92TsTcUQ829qJRML6gfzPp2kbl3AxS
 Ogh0NjMNGScn2nkayeK8+R/taS2mABZPo6PV
X-Google-Smtp-Source: ABdhPJw7PXpo1l1XvSNvmbejE5Mxtoki1oPvjwS+n6m+y1abkj2CuSmf+qnmjADwdgSi5EJYOr5z8w==
X-Received: by 2002:a17:90a:cc0d:: with SMTP id
 b13mr2873798pju.219.1619162155728; 
 Fri, 23 Apr 2021 00:15:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n48sm3804061pfv.130.2021.04.23.00.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 00:15:55 -0700 (PDT)
Date: Fri, 23 Apr 2021 00:15:55 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Apr 2021 00:15:53 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix error code returned by riscv_hartid_to_cpuid()
In-Reply-To: <20210415085522.108624-1-anup.patel@wdc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-b5a84423-0884-4378-9a8c-86c1d00a302c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_001600_383459_D24BDC2B 
X-CRM114-Status: GOOD (  20.08  )
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

On Thu, 15 Apr 2021 01:55:22 PDT (-0700), Anup Patel wrote:
> We should return a negative error code upon failure in

Not just should: the PLIC driver assumed this was the return flavor and 
will overflow a per_cpu because it doesn't detect the error.  IIUC this 
will manifest if we have more harts that NR_CPUS, which is a possible 
configuration.

That said, it's gone unnoticed for ~3 years so I'm inclined to leave it 
out of fixes because I have nothing else and this late in the cycle is 
always a bit touchy.  It's kind of splitting hairs as it'll just get 
backported, but post-rc8 is an odd spot to be in.

Is this actually manifesting as a crash for you?

Sorry I missed this last week.

> riscv_hartid_to_cpuid() instead of NR_CPUS. This is also
> aligned with all uses of riscv_hartid_to_cpuid() which
> expect negative error code upon failure.
>
> Fixes: 6825c7a80f18 ("RISC-V: Add logical CPU indexing for RISC-V")

Also

Fixes: f99fb607fb2b ("RISC-V: Use Linux logical CPU number instead of hartid")

which is what actually manifests the bug -- again, kind of splitting 
hairs as it's the patch after.

> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index ea028d9e0d24..d44567490d91 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -54,7 +54,7 @@ int riscv_hartid_to_cpuid(int hartid)
>  			return i;
>
>  	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
> -	return i;
> +	return -ENOENT;
>  }
>
>  void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
