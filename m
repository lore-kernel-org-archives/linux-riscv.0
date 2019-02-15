Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18318C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 09:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15A52192C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 09:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggNUJSXe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="zQY7ysYu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15A52192C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNCaB34b5OS+B2ejFyvU+QURH5gi7J7OQ+BwiPNd3pk=; b=ggNUJSXetBC6zn
	LSDp055NKI0ldp1GicpHfMpcIyonjwQSx2mstGv9l/bj7T3rbU0CndHE4RAORZaAk7biG1ECKfYeT
	QO/X88dbOIC0BkdkxnoMAaApboWluVqPF/NqMuDHZXK3gRTZLRRjZh3d5Bi+cgkxjvmiC+jjRbG/8
	o4EPa0sYMLUXgJW4EnfBf4+Lpwg44OY31FGoT1C9fykTxbf9u63RuDqQQih91ncmLuToOwup2qFDp
	Yu5w1x6qGqVTL96Mq6QHm3G3h/YchH/PL/D3H4ncP3fIEWqavJ6VNxZj5haLGV6ymC4J9i3Soxm6D
	UPc7nrtINqk5Kv2LjyTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guZrn-0007vX-Mq; Fri, 15 Feb 2019 09:33:07 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guZrk-0007uO-M4
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 09:33:06 +0000
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x1F9WiC8019220
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 18:32:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x1F9WiC8019220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550223164;
 bh=HfSfrFBcRoJyhIErWqGfFXClcePQGFMvuVUjWFMMlwc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zQY7ysYuwVczHMsMgKeI6B7gcbndU9KJER3mVo9JGXHnlsqkvAeGw3A+k+GBxA5P5
 EegQBZMk5EaUiOG693YXcueNv/5mChFpsfEGeV+A9oZRYH+Slu/4cREg6byb1h8c8M
 kmyVVMFSViKrcF2bWMxDNqgUaz93rZvzQ2ooW8xQSbIQvzfA7ovW5vlWwh1bnCnVI0
 8zotgOOWHfVBY/9+QyVsXmo/xEkCshX+jUHIwaHsTEMuacO6rIpRRHOZCqKAlPcpWm
 LLyoDDojEKkU7lw/1u0IAcqp6HqI3sKfH0BlGWGD070usffyxVNa5iLwEiF/t8wvjQ
 AhJ1UcMb109Zg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id e16so2996029uam.12
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 01:32:44 -0800 (PST)
X-Gm-Message-State: AHQUAuY0Z3wtQX0ap7onXV7zdtD3dTyb4PBcjsezoSYwej0KLdheMmvO
 w5Cmkg3YczTv+dWYCqmPTttj2qw9BrifNksD7T4=
X-Google-Smtp-Source: AHgI3Iad6W2GsRyuHvKDtKafwtV+B2R19XzTGZgV2/dVRurEYChtPO2shkuyCewm1zFfnDvGU1M6QFYs6DCodW81UKs=
X-Received: by 2002:ab0:3402:: with SMTP id z2mr4355489uap.6.1550223163654;
 Fri, 15 Feb 2019 01:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-3-hch@lst.de>
In-Reply-To: <20190213174005.28785-3-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 18:32:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFSQN=42X1dqt5io+gOG8mUpwXhLmspqryvmzakUCSWw@mail.gmail.com>
Message-ID: <CAK7LNAQFSQN=42X1dqt5io+gOG8mUpwXhLmspqryvmzakUCSWw@mail.gmail.com>
Subject: Re: [PATCH 02/11] riscv: remove the HAVE_KPROBES option
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_013304_944360_69227877 
X-CRM114-Status: GOOD (  12.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
>
> HAVE_KPROBES is defined genericly in arch/Kconfig and architectures
> should just select it if supported.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Do you want this patch picked up by me?

Or, by Palmer?



> ---
>  arch/riscv/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 515fc3cc9687..b60f4e3e36f4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -94,9 +94,6 @@ config PGTABLE_LEVELS
>         default 3 if 64BIT
>         default 2
>
> -config HAVE_KPROBES
> -       def_bool n
> -
>  menu "Platform type"
>
>  choice
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
