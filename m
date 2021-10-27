Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C315C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EC060231
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06EC060231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Wyixa/8bljcDGJ99AtYeAuaLKj6JhOKcwBYWHQUdSFY=; b=gxm611/N+nR4b+XG1pfMsufnlt
	q5+1x0rZigpgI1yVNhn2XFNOdthb6TLihIl2o0iE1S0i6rFp5lkTlfNQyd82LhqBMMH00Ec0VcfC1
	1+nTWc1FyYGG7Q+sLzIAQUdmuGZzivjd8v1jMO/V0P3kIyK954oj1iCgrBS1EROwtBPsdK0+aoybC
	XjsmmVMTvcnPpHDpRgAKxkXFAKEZfxp503o5/+Onn+GtHgKwjXovBtwi2XgMSHvXa33CIIFDCVKTr
	0Qgl4KBJ7SPrubfvrX8SLacUG3bFXDt2P+RUqAM2l2pMuqalZHsPVfa3LQKJS+1oAGPnZwXJOY76A
	AGG3YI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqRa-006FSX-21; Wed, 27 Oct 2021 21:26:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqNO-006D88-5K
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 21:22:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id k26so3950870pfi.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 14:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Cg/j8P5uXcrTRk8plQU0l3GmOiPBDd+Pj7xWYOIDOEI=;
 b=VBNZsF6NQ/ixkGxYASj3KC/GEuP/y6W6CeLxaRis7vuzluAaL6G/w5E5vMRHPhrx8i
 dld3o18CI4Dc4Zdty9h7juuD08X/s7KtxKBElkdClTA46jAqYTo/OX6cybIMvoYsCMtk
 SF0aZUSuBjvp/yyjfTdF+qzqoZpOF2aTTy2QrugdZU7sWsaJspce9kW6CPrQ0WgQzFSM
 ponX13Hk+O+ndH/cBZk8LL66ZTm+IEdY/ZTN34X1GsodG71xjzY2Nu47zvqqzsiOSrxf
 OzWnl42d5ZveG2FvNY7uBIzZG4JD6Zzp0bmBPnQQsZ/guIHwtGo8VyH14B6kY1c5CSB9
 Ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Cg/j8P5uXcrTRk8plQU0l3GmOiPBDd+Pj7xWYOIDOEI=;
 b=V/1521XEzg0uvW3/W4VWkvUG6KyprJpnVnUZhGF6mqjNfGjO1aDiTu5Z4oMccwE8qz
 bygfac9m7oC1p8B5p9Hdb8Z23eBVypzwqRpEErhSmTmAFwryikDtlfF2EI6sMexEt+ck
 7SFknYjYxTEGomIUpqSrX/Wp/3o0y6KVyo6K8A/bCc1dP4yVVXPhtVS3ZYhxQEKZSlBl
 4oQogWRDfKC0SCxEYAHZlihoEHjqzrPJk9Ek9KZGuLhDk8qTXKj2Rg7bNYlqc+Hdz+sR
 OxfZ7sYs/aGrA4B702r8breRY+nNLqEvRhWgHulJd9pyY/7VGZzW7Q1yt4gw1h20+7zh
 Yb8A==
X-Gm-Message-State: AOAM531gYYMXuZ/jwvpWwSkSAGEy0ArPLL2geEZDLIthNmEeYD9FQcOv
 GtQvHQ1MZgMC9yEIvhkAfu729w==
X-Google-Smtp-Source: ABdhPJwlysZ71JpZ1NP3hVtYloRcJHriqqc67RvJogbCqmKB8hmG0g5dJe7cBf/N99WVwxSAx5uJ6g==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id
 s5-20020a056a00194500b0044ca95535eamr99825pfk.85.1635369744673; 
 Wed, 27 Oct 2021 14:22:24 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:d96b:421d:2a73:9190])
 by smtp.gmail.com with ESMTPSA id z22sm928252pfe.1.2021.10.27.14.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:22:24 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:22:24 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 14:12:08 PDT (-0700)
Subject: Re: [PATCH] riscv: fix misalgned trap vector base address
In-Reply-To: <20211018052238.522905-1-181250012@smail.nju.edu.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 
 vitaly.wool@konsulko.com, anup@brainfault.org, seanga2@gmail.com,
 wangkefeng.wang@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 yuzihao@ict.ac.cn, 181250012@smail.nju.edu.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: 181250012@smail.nju.edu.cn
Message-ID: <mhng-fca625ce-8f29-4e27-8f66-bc70e7cff555@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_142226_428803_CF0E097F 
X-CRM114-Status: GOOD (  15.67  )
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

On Sun, 17 Oct 2021 22:22:38 PDT (-0700), 181250012@smail.nju.edu.cn wrote:
> * The trap vector marked by label .Lsecondary_park should align on a
>   4-byte boundary. If not, CSR_TVEC may be set to an incorrect address.
> * This bug is introduced at commit e011995e826f8 ("RISC-V: Move relocate
>   and few other functions out of __init").
> * This bug is exposed with an educational emualtor.
>
> Signed-off-by: Chen Lu <181250012@smail.nju.edu.cn>
> ---
>  arch/riscv/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fce5184b22c3..52c5ff9804c5 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -193,6 +193,7 @@ setup_trap_vector:
>  	csrw CSR_SCRATCH, zero
>  	ret
>
> +.align 2
>  .Lsecondary_park:
>  	/* We lack SMP support or have too many harts, so park this hart */
>  	wfi

Thanks, this is on fixes (with some commit message cleanups).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
