Return-Path: <SRS0=E7Bo=ZP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7FDC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 04:17:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D198A2071B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 04:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chU13Ezs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="j36DMn6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D198A2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0Z+LocwWlEGzaLjs6ErMixwLgFvr2t+VbFktInH57Q=; b=chU13EzsCFSRm2
	J05gggboG9BR1K9APoqmdRZSums2hZK9WpSDpu/Eb/rwjqZ8h8DwXcAUrpfHSd3VuciZflDHgsHzW
	AI9uPaCaJCR7ithmrsJhpxSH5X8gRej9W3UnJyN1VtjrREbsBb5U/zvCidcZSxs1qj2T1F+hJ2Ov0
	qPCJoy5TZj2veTbi0KJXD3bcfUooaMpOoFHafD4YqfOc/+div9l0g5OF1raRRIJmP4LJWifPFumff
	nF/Uv1bET5b/a2ygaqnglqyAIubiIe6xsHT1/DrQ3XciwXfKORfa+92yrygWd4Q66UuQofAvUSkIQ
	aF09GzRBo+KtYZgKckvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYMrd-0000UT-L9; Sat, 23 Nov 2019 04:17:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYMra-0000U7-Rm
 for linux-riscv@lists.infradead.org; Sat, 23 Nov 2019 04:17:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id z10so10985862wrs.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2019 20:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gDRBUuKpP+wNpMW5KqaT4gpqA2dKp4hcDwnNDbud2dM=;
 b=j36DMn6kPFHZgWoHUJ2Rtfbs80kPgyE4ukl7Z/tbaY0QZ9OtKNFycqz0fMZu55AkcF
 /D39gAcldhgjmxqVTgHqlSCNKR/xNQVlXcllgqGCLopuykgzrP5j6Dzhszz3WB6nQV5q
 cPMJG4T/ogSHoFj/Ug5dN3sFRqVQ90+niNkW5ewg9du9jKqHJ+tfodeylsuVeOPmtlrf
 8c6JqBSLh+wkywN6TxmX2L3KeapdAALQyrMkHXFQEE4EfcPGlgZN8DMFH3UT+ezdgywN
 Vr7rx8bMYQm9VEnFP22kc2BPOMA3bdcs9EclDuZ2UI9UW2hfuNrtlmWYeAVk5ATiA0aU
 xC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDRBUuKpP+wNpMW5KqaT4gpqA2dKp4hcDwnNDbud2dM=;
 b=Mw0oe8m41IHQGAKYi6BSYzc4Y7G9gVl+MIB0JDU8KnWRAaw2TsAsN3pIubNkvGuoN4
 ylK507xv9RLQCL/kzo0gwwaUK6YC3WG4wvRFlojXzzAgdegr8m6XLE4AfbER8GU6sXWJ
 Vok9r3uopkeidisayLZMXkzWrJcTH0Vt9pI8zliQNZzRN23WIGY6oh+/NaxCDT+eHPF2
 fJYpiFcO+GN9gZZVxoBCPFNZT8ZWnL8eQuaryXLpWRaTj4kiWRvwwajfCCE/Anl5TF4F
 BzZk8MF3zH6qeHXD4q0IZ/hWCpHn4iy7W8b4rk7NbtgQ0+kkwAJJztSYO7LPzgJjsodc
 DZsg==
X-Gm-Message-State: APjAAAWpuSS+MgT27MNlm2+II11fmRrxgv4eEdVGTgUYG7STFyGuJo5E
 Gvqhxql96aHNLI0S+26rPoA22qHunK0giuqvPcNUQQ==
X-Google-Smtp-Source: APXvYqyn42ZgGo1p04GcxW1ERelAYu47RWFLPCm36JIsphxBjAF4K6sOatZ6aHZVBoF74GoN9tXlaCnqSBdzZ1hZZwQ=
X-Received: by 2002:a5d:6181:: with SMTP id j1mr20153851wru.251.1574482656172; 
 Fri, 22 Nov 2019 20:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20191122225659.21876-1-paul.walmsley@sifive.com>
 <20191122225659.21876-2-paul.walmsley@sifive.com>
In-Reply-To: <20191122225659.21876-2-paul.walmsley@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 23 Nov 2019 09:47:26 +0530
Message-ID: <CAAhSdy3voiLFRVmn-=h9Ltn7=10_FJUGxub063oMuS4znuK+3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: defconfigs: enable debugfs
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_201738_976206_7F8C62B6 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 23, 2019 at 4:27 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> debugfs is broadly useful, so enable it in the RISC-V defconfigs.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 420a0dbef386..f0710d8f50cc 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -100,4 +100,5 @@ CONFIG_9P_FS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_FS=y
>  # CONFIG_RCU_TRACE is not set
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 87ee6e62b64b..bdec58e6c5f7 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -97,4 +97,5 @@ CONFIG_9P_FS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_FS=y
>  # CONFIG_RCU_TRACE is not set
> --
> 2.24.0.rc0
>

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
