Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F522C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:55:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACF12064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jf7cRPP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eWEHfWku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACF12064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nR/hHBB2ZDfpcfDLq5OFzEzSbNh+vMCkUfZIhZbrU2s=; b=jf7cRPP4fwKNCl2JEUtqf13Yd
	BiuG2kPNh7539pZkIx3v1omXKAKdleCiA2r9yHlkcqXB1/RZXRIerxetUWSHG5sYo8sl4ksNLBiXU
	OtwMWOHJ5b//PSv7lgmCDPbxD3NExPXOU0Ju19UABcOQEUZ6LS5dPsLdP6jXk6+EiP6URpsK4Sh4w
	LlKZZRCq9lnHJQ53u4od1QIN/LMmPoY5iV9irSZZkxS0HPSxx6OK65nx6BFmF/orWSP+eTEhJXeJv
	QuKS7C/+FeDgUge3E6gmEpWWEYkGFYi28Rel9GN7vEFumT6/Lte/O99u5lxSPBZ7aVgCzTr4jfbpK
	981fsBVng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIHBL-0006N4-Up; Thu, 01 Nov 2018 17:54:59 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIHBJ-0006L8-Fn
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 17:54:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id p7-v6so9299201plk.5
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9KgwBlYpYDkghRGbPCHP71HsA3TMqpUT3WsqDusrMYM=;
 b=eWEHfWku09Oh9mfUM3m0afw2+BjOK0rOuP3lTPJBBLjivYqymLcd6h6tKZ7ULVXK8e
 53ZkASc4vufLxVuVFyJiZGcZr5uKIiPd9eRoUyDbIMQSwRlRhkh4rg0WCVraHZ4FE/Sq
 HIcuIsLWX60wxUfgrY+EpNYKHBNPiH0v9mJS+gtMzH7OO0UBQ7yTQN0KXGO7i2UZAZ2x
 jazxCOPbi7dJVFgSFFMXku4bgEhtj3ZfJpv/3yDNB62udmTF9nAzqh21bfANFFNu/+kK
 2XW9371WZPnv4XM82wzeoR58XN8xIwa7dXogaCkBP9dS2D3QcpjkVYFhT3AiDs7VA2Qt
 hvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9KgwBlYpYDkghRGbPCHP71HsA3TMqpUT3WsqDusrMYM=;
 b=D4Jpb2POJsy//Mrw5SGykQ/eV4WeEwMdCzZVy8liwP1bg470dDtbGIS/HqP6SRodgG
 DqgrSpeyYBGx5n5vcmeM/bYU7JadIyMSt8j4EEEuE0GhPVxj2MhVVP1FT7eYKqb1fu6K
 zfTkpDXO5MSrEYTX3lE58mXFRA5xIyHJa1lC0VLWECtgaD9u+Zjr7QkIY9YwJYUziYpF
 bfRFhJflbCyFqTATAG60jVCylXo5vbdoriqnw8STdTvoQLaZz2vlHr4yTRdRTAlk2X8u
 ntN+Mo9/EDXpp/zw1tIvp1dZkzyIc1FGMZT7ctJ4nELRuklEV8zd79AtRQ0D7IGnAQuT
 EchA==
X-Gm-Message-State: AGRZ1gJoFPgYGH+keRT9P1EOe+qexKHTiKQ8fFCAflaHTXiN4RmGdfeJ
 I6BimBERXrBB9wj62f03Mbla1xdQSUQ=
X-Google-Smtp-Source: AJdET5dAzdlnjsHIdNaxLOOtev7t4PpKsdc2pwkvDY9v/6gCdRpfznXL8YTtW1Y2RrF9gTumkvBKSA==
X-Received: by 2002:a17:902:5ac9:: with SMTP id
 g9-v6mr8651330plm.311.1541094886490; 
 Thu, 01 Nov 2018 10:54:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h25-v6sm31549892pgv.27.2018.11.01.10.54.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 10:54:45 -0700 (PDT)
Date: Thu, 01 Nov 2018 10:54:45 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 10:53:15 PDT (-0700)
Subject: Re: [PATCH v2 1/2] RISC-V: refresh defconfig
In-Reply-To: <20181101051033.10089-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-aa34e7bb-f14c-4fc8-8ff6-cb70ba397746@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_105457_537042_B48FD971 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101175445.8DMuTuuiSQPxnzwyBJuO_WHP7PN4trEkWM_oBi41ukI@z>

On Wed, 31 Oct 2018 22:10:32 PDT (-0700), anup@brainfault.org wrote:
> This patch updates defconfig using savedefconfig on Linux-4.19.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/configs/defconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 36473d7dbaac..07fa9ea75fea 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -1,6 +1,3 @@
> -CONFIG_SMP=y
> -CONFIG_PCI=y
> -CONFIG_PCIE_XILINX=y
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_IKCONFIG=y
> @@ -11,10 +8,15 @@ CONFIG_CFS_BANDWIDTH=y
>  CONFIG_CGROUP_BPF=y
>  CONFIG_NAMESPACES=y
>  CONFIG_USER_NS=y
> +CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BPF_SYSCALL=y
> +CONFIG_SMP=y
> +CONFIG_PCI=y
> +CONFIG_PCIE_XILINX=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> @@ -59,6 +61,7 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
>  CONFIG_VIRTIO_MMIO=y
> +CONFIG_SIFIVE_PLIC=y
>  CONFIG_RAS=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> @@ -72,8 +75,5 @@ CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
> -# CONFIG_RCU_TRACE is not set
>  CONFIG_CRYPTO_USER_API_HASH=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -CONFIG_SIFIVE_PLIC=y
> +# CONFIG_RCU_TRACE is not set

Oh, sorry, I sent my version before seeing yours.  Looks like they're exactly 
the same, which is probably a good sign.  I'll send this one instead.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
