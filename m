Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E840CC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 14:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4C820652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 14:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVz7niZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2JRM2BI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4C820652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1P9wzuCNpIBFid/acdotZeegeWm9mKvxpa86ai450ac=; b=oVz
	7niZ/lMSlg10LWJGJaygQgMLdNxl+2/Ztk0Z07az1N918u+9ukZPJKlN3RWu/jEAqJK4J8cNey6k+
	0Ak4HmNNLeBy7DHiBIi9JwlLMuUACk9v6hJnLe3QnwWHff+1mgV0cH53R8KDBSI0gce0fBu+gYFjC
	7JOEHbNDgequuJ6nwRFf90BFWW+TH1iq/nfVaVA2YSzNtKYh7A8+uWHplz0lsSwzcMltoQCjoQ940
	ebCL+h632wKlEAd/CaDHtLGHu8QHztWZo3Du6obHroGoHQPSpmQwmYKxAoKUNI2pEpIdiumOMXYza
	IpcU7hPVLvj9ZInfbcO9S1WoIaQDO1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC3R0-0001t0-Rw; Mon, 15 Oct 2018 14:01:26 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC3Qy-0001qR-By
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 14:01:25 +0000
Received: by mail-vs1-xe34.google.com with SMTP id r83so16299549vsc.4
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0ATgDVTSpG9ZVjM7FL2hc6Etadu8e8LzS5tKM73SjFg=;
 b=Y2JRM2BIju3CosqwXCB2piC3um3H40hhHgfML43y52SBZow1d3eMJai8arfJng65zk
 7wR/42xuItalWgG0Ay/RI1WYKp9UUYLRFjJA5pwtqN7Qa+3YHDysUR4AqoFKU58qmOBU
 jBbqNX0Qodfdu1tdTO5Q8HEGMJXTqMEJOWxqcV41FpQ9lGkEU7G4KSpziBTbBJSoCghW
 +2Nsw8ynXOYXLRAfeh97gUFg/1KGCmmpNmfxOP3tAEMEVXrdgmolX07wisjfDlgzTTre
 tLL5A8bovrVtRmrNhR+z28Bpp8BXaPm75rPUzMMnpsKn5Im/6AJONkcMifllkPtF+zly
 eabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0ATgDVTSpG9ZVjM7FL2hc6Etadu8e8LzS5tKM73SjFg=;
 b=OhiryTpntbHaDFcY5vnbaB/LyJIJnsmtV3csyVNMeZ+Ld+ARa56r6wwQRhyEFG+0k7
 INYD3xzXqC7/JqeVq7aiKTvRGjx64Qwe45RLIfMRB+OLd7d3+Wtp7bQ0SQT+DOzQY0ZR
 sOdvoNvj04bues2FLFD2n3iR8zNczoxzlJpjlPT5SpsvbuoBaKAw9m19rZcyy/Om4JiS
 X7x2XRZ+avihkILS+YwKEDZ3xncgNp4wu6RlWDqpj3U+mV1BE65wvCsPHMYmPDdwn68v
 trlxWvoUcKmtFc+YPDiZb+UpX6QOrxEI8rC6dNwEtteRyBATSsjM5EjWVju+x0pS7cvM
 yNlQ==
X-Gm-Message-State: ABuFfog/E96a2+wtiL0JWsOex4eHz65YY4sHwmc49wn3f9/GyySDHhzg
 EpK9aUwja851cZQNAZrzZoLuPen1enbLOBoECJ8=
X-Google-Smtp-Source: ACcGV60tqCnYIFuRz/Ett/luHo+ySZHb2S5aj+UnIHnpYfaRaHRWiB9Bxi8DcW3ULns8fdwautWWQGJslBVyIxS75Ig=
X-Received: by 2002:a67:4b0e:: with SMTP id y14mr6750832vsa.50.1539612070830; 
 Mon, 15 Oct 2018 07:01:10 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Kumar <pintu.ping@gmail.com>
Date: Mon, 15 Oct 2018 19:30:59 +0530
Message-ID:
 <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
Subject: riscv-qemu - linux boot is failing for vda device
To: isa-dev@groups.riscv.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_070124_436200_43871F8E 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015140059.wVi7QCH1kqNFV0zExnHYmnOSpBLXhkesquFm8P12kcI@z>

Hi,
I am trying to setup riscv-qemu booting on a new Ubuntu PC.
I dont want to use freedom-u-sdk, so I am preparing my own environment.
I could able to build the following:
- riscv-toolchain
- riscv-linux
- riscv-qemu
- riscv-pk
- busybear

After that, I am trying to boot riscv-qemu, using the following command:
# sudo qemu-system-riscv64 -nographic -machine virt -kernel
PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
file=busybear.bin,format=raw,id=hd0 -device
virtio-blk-device,drive=hd0

But, I am getting kernel panic.

---------
bbl loader
....
Linux version 4.18.0-rc6...
....
devtmpfs: initialized
cpu cpu0: Error -2 creating of_node link
......
SCSI subsystem initialized
....
Unpacking initramfs...
....
loop: module loaded
virtio_blk: probe of virtio0 failed with error -22
...
VFS: Cannot open root device "vda" or unknown-block(0,0): error -6
Please append a correct "root=" boot option; here are the available partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-rc6-13927-gd72e90f3 #3
-----------

Basically, it could not find the "vda" device, even though I passed
the "root=/dev/vda"

What could be the cause of this issue?

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_VIRTIO_BLK=y
# CONFIG_VIRTIO_BLK_SCSI is not set
# CONFIG_SCSI_VIRTIO is not set
CONFIG_VIRTIO_NET=y

These are already enabled in the kernel.
If I am missing any config, please let me know.



Thanks,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
