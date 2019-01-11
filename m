Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715C1C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 17:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D012133F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 17:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JoNJHet9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PMmkBmSD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D012133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=qYCNMNuO8TtCwJkXO9yrgvGo4w6fRuteO/IC+0yDJjE=; b=JoNJHet9JT0kau9NHNQtnHzcC
	uYj8fTlray+D3yukPHZR6r8St+pX4meeb3iFlVGt52NuxqtFiuRW5qPA1WW139aWWPWRqvGSGqz6Z
	wfWy7mWCpQ5eclWeSEdoKrtxARfQKLaywcJik5deGpfdhF89yByuIaAdRUEJhTq0tzopaxIEAcbqG
	wtwUR3VOYWy0eYcLinC+YKXKezkTYRgWFh9TZ5OthzCMJdrjBGlZ+FVfqaIq3HwExUEzZiv3V+WcJ
	VYA9Lxq9Oly4y+3NvDzBm+iDY6c+v64/Cj7+NfZUaKHOAuWFN5MFeEj3/KY59RYaxey/3hPwNSfyz
	Qq9R0IMCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi0K7-0005Xi-Va; Fri, 11 Jan 2019 17:10:23 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi0K4-0005XA-IX
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 17:10:22 +0000
Received: by mail-pl1-x643.google.com with SMTP id y1so7014945plp.9
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jan 2019 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fQyA7PYCxQENfWhPz6dSiDsgSet3p+Oi1/3rkGt1iow=;
 b=PMmkBmSD+Vz9RzlWKxX9RNTWDg04GgYGQW2Gs/jo17kBjMjKeawGhAaj8qhmBYnSoX
 zWzANO6mvvAJ+ZQg9f/nHWpUHOx9PRX5cDv7NBbBE82bLl8JjDpi1/8kkE3KRlbCqWG3
 fOqiWj+RSTGpycSTmZuPr+03D7NvPDUi2ca/3gULeCIkCiV9xdXJEKUJhbN/kmuL5s8r
 5HE6CEgAmFwzafAjSrfuH2mCRbIS8tpJXSn1JAyM3RAQ5UNUbgG43T5ZXSllne6LtIwJ
 tLkDreprYADo6EO37z9msrFrXtc3oXeIcFSrVwwg3F2SSIAKaayuP2lZncI381vhw2lk
 CCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fQyA7PYCxQENfWhPz6dSiDsgSet3p+Oi1/3rkGt1iow=;
 b=UJ+TcOMao4YTVDoKNWMZNJeReK955xzYGoE/F5oBsdX3n2oY+1stNIFgJOHxzGJLhR
 r7xnsgLsFmGdcfz3Up4BBbJSAjW+8wn7wnoV+DoV+XGPf9Xq5eBFm0Y/myhqfK0P2Gxo
 ePpLw1WgzM1Vy8KiQPMyokWe8gBPoZ7ltOWk2YI95aASYQcVQw8Qgxlv8Mavl2Iu0Cj3
 +fUQa5Lu4qgz9ijzD8+DMCzsQbZjOLL1tDvhluAPh9XMc80NdVg9OikJRpE0EqT0301h
 lfJIM+fBsRBRoW2zvkdyq04j5xLGwZUzyddb5PW2RUHU40xBT0/N3z6usOuQjPCqTwfv
 6gxw==
X-Gm-Message-State: AJcUukfuy6KrB7SAX69ZtWPx5aZFoFyDjQ7LsBCKjM5J/utIE+3VwujF
 vacKrXC6Q/kAG3mCx7fCSlru+Q==
X-Google-Smtp-Source: ALg8bN5cO12OYfU8E7Ho1PEPka1vHwULBxeFyxYKFXdMKDrjmadJjKrQLjCcYUXe/POfjHnsvav83Q==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr15538357plr.128.1547226619481; 
 Fri, 11 Jan 2019 09:10:19 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d6sm109441915pgc.89.2019.01.11.09.10.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jan 2019 09:10:14 -0800 (PST)
Date: Fri, 11 Jan 2019 09:10:14 -0800 (PST)
X-Google-Original-Date: Fri, 11 Jan 2019 09:10:03 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <20190110193451.29016-1-alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-8b2184cd-f91b-465b-bead-f3c2c58e2d44@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_091020_672902_BC1C4DF0 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-kernel@vger.kernel.org,
 Palmpalmer@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Jan 2019 11:35:01 PST (-0800), Alistair Francis wrote:
> Enable generic PCIe by default in the RISC-V defconfig, this allows us
> to use QEMU's PCIe support out of the box.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f399659d3b8d..ccfd3f05223c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -14,6 +14,8 @@ CONFIG_EXPERT=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_SMP=y
>  CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_PCI_HOST_GENERIC=y
>  CONFIG_PCIE_XILINX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> @@ -77,5 +79,6 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_RCU_TRACE is not set
> -- 
> 2.19.1

Odd -- when your QEMU patches came through I tried doing this, which resulted 
in a non-booting kernel.  For some reason this patch is fine, though.  I'm 
going to just assume I screwed this up the first time, so it looks like this 
and the QEMU patch are good to go.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
