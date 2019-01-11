Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E5CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 06:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CE020675
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 06:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hlQW0IJl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RxeDdcnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CE020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijYGEQC4cH44mpkrJ6qGTZw2XvXQ32QqoqL6b7Nlm3A=; b=hlQW0IJlDDbcPa
	+NdxmcH0FpcEFjlJSH7hZf1DNaW481rj7lf6zPZJgVQ1+SgshYnQUsAsIhCg0CmFXbwTz0CcFY8sE
	O8BZuQlUg4z8uzf8D7wWIPvb5lgQ7WQAM+wSbII4MNxlFTzU7MIyTexjwow6XIej+hroC3CDa1T9E
	xlg38Vq9BUoj/TpyxOzyUTtL1emor+ejCzPU7xBmOxetfRzGy998WuIIyal3GxKk5uub3pEnGJGMr
	dgWSlSj30xwZ+WE/4bM07ZkVre5RmAv5voznx0qYMVd2v4e3XpZ8gwkcVq15KDhVc7hV9n66wSBFz
	lCnWA9QP0rvurtS8PJJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghpyC-0002k4-6h; Fri, 11 Jan 2019 06:07:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghpy9-0002jX-Fn
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 06:07:02 +0000
Received: by mail-pl1-x643.google.com with SMTP id t13so6280780ply.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 22:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ITc9OIf9pik7euIoiRYxplAS/DUu6fViAaIU4Z7ph84=;
 b=RxeDdcnHkS68BD5rjl6DbKx6jn5eTM45xn+iaTtbm+WkOhA2psmuNaPRT4mDSwqw6w
 qgtQmvdiuBdoFsb+N4O2EH9JjQIxrQsdODm9vp0sHCVa96C4bNiRw/COesPFd5KBzTlb
 WMAUdZtiBZVim1QihlcNwyh0IISoMyqbnJTiOt/dzjlaE/+mAbZQjW92CeHHivHkTjKt
 t9NnyA8LzaLvsIBYvt5Q+BC+X63dOIWnG0uGN7kfFN+St+iQjswA41liPDvjb5EM8fl6
 NG48HNdEGGpXnSGwTXpKEZJp7VFqv3865uFDzT40Ain0dSqK+GEcCzJnRC758aniFEdB
 G2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ITc9OIf9pik7euIoiRYxplAS/DUu6fViAaIU4Z7ph84=;
 b=QrHFS4oZLK1VSd718C5kTIQ160/SP5LARCLtJbGkAQKIFBX0lvNshfETE+jr6S1MaI
 F15HiYDHRMspBXFA4mYoRa7NOyEWRIGjkT9EGK3c1oiAzQ+1cfof/4w9iRAJpw72NsVQ
 AjYEGXCKxUBl3yf+th+ngT8eifuDzHzp/v4khMr4WxTrCYq/0v/0aObNMw9YqrIAqk9+
 FHmUh0iyl1j1UDZneQjpZJjh0+kF+M0vC9rjtRsIg+IvOZPLvLboT675p94F4xD/XVD+
 oaen4y78Np3xoqwJf7QyCUmqfRSmlSxMQPynPwzv6/iDUO/Ny9rci7Pl2KMIZG15GPPE
 pBtg==
X-Gm-Message-State: AJcUukeOQr4f9WI4rCAGkTEbgrsRzmx/T2nu0Dy2EB6Ykmig+sn9YwsU
 2NwoF0eqHs6f1Pdp/xP3cvGJug==
X-Google-Smtp-Source: ALg8bN7qtKVwBfycm1wLyrpfQRG7Hi2Xc8xrg4UjeHy+hh/1kojkCS3yR0R+6aUghkv1pyvHXiMKEQ==
X-Received: by 2002:a17:902:850c:: with SMTP id
 bj12mr13141874plb.46.1547186820616; 
 Thu, 10 Jan 2019 22:07:00 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p7sm117530221pfa.22.2019.01.10.22.06.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 22:06:59 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 10 Jan 2019 22:06:59 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v2] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <20190110193451.29016-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1901102153570.22105@viisi.sifive.com>
References: <20190110193451.29016-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_220701_589663_D31997F4 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "Palmpalmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alistair,

Looks like you're still sending patches to "palmpalmer" ?

On Thu, 10 Jan 2019, Alistair Francis wrote:

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

Not sure what commit this patch is against - I picked v5.0-rc1.  Before 
applying your patch, I generated a seedconfig with "make defconfig 
savedefconfig; mv defconfig defconfig.1".  Then applied your patch and did 
a "make defconfig savedefconfig" and then ran "diff -u defconfig.1 
defconfig".

That should have shown me just the patch above.  But it also included a 
line removing CONFIG_RAS=y.  I am sorry to ask you to fix such a nitpicky 
item, but it is good practice for these defconfig patches.  Otherwise the 
defconfig deltas gradually get out of control.

When you repost it, if you verify that the ./defconfig delta from running 
"make savedefconfig" before and after your patch applied is simply your 
patch, then feel free to add a Reviewed-by: line from my E-mail address 
above.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
