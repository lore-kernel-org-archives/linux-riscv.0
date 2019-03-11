Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399F0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C6E206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 14:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RnohgFWu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBsCXiJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C6E206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vNQ3jfWOEHxsQA/KPE/ANPvoRaiDDiMWTwPKRTP0EFk=; b=Rno
	hgFWurvhwe5TvbOJIqdvlQ6JFHEc1MCSjPwuxSvYr40pSKVHmqLypzV9cU7z+bP8ahIz++u8ogn4W
	RmGR9cyKVQK+g8AAdbuX69FvNQq+UCAsqEGIXWSKSuue9IqmvCphBLO7MzfuFe9J0VksE37KL4qJ5
	hY3eRKVzmTMQ6OasEBt/Ti8v/8r9EpvTZj52TpIYvj5X5ZaXBeIwBh5hSsoS5ykpO+BekGZyzE3X1
	i+r4U4cdIqJF5Ra8hdFeDPc3tVH0U90TNBlRcRcvBcioZET6BgdlLZS1y4XS1ynwnLkUjIihr8P19
	a5kwyQEsJxGTwesTtd8zPLr5uO+awzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3M1Q-0007Oq-QA; Mon, 11 Mar 2019 14:35:20 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3M1C-00063p-6E; Mon, 11 Mar 2019 14:35:11 +0000
Received: by mail-vs1-xe33.google.com with SMTP id c189so2817521vsd.9;
 Mon, 11 Mar 2019 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IkL3TilxmjLPZ7z5ub8nkczbG3RJDxaWpYc/0Ak8W1k=;
 b=JBsCXiJrFf+/kFrEuFj864Y3//r1GTE1CkDSegx9JB6RjhjtEX2GpmpUIUMzo0mwxF
 JBu4mwzPp5XXx/eMvZ4x4rzxg0xTDZRRAYlhcL1edmhWIf4VAQD1dna0AZuk20RxJN9s
 u4nxd6A2Q+s5UBx7CxpAwqqxyuISWTZqk3ybNSqv70nHYZ7BrHl13LXGznILDNL5FK0q
 WJb8gkzUwQIsp/FMD0ffFgdOJlNc3xZrDcaRLZtbE86gnZ0waYeqoHsIhsZolNInihvt
 SwJEBc9V7fuR2HS/jkyyQP9LpuPP3LsS+nhviHzeakHHEAc86gML2iN2irpqFBlutpAx
 7ITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IkL3TilxmjLPZ7z5ub8nkczbG3RJDxaWpYc/0Ak8W1k=;
 b=Y0qPLiDv2Xwm5Kme+p3Sd5MSQrlzwaNehsvUuMtUWNDw2zIuvS4RP/I/Ew1a3o/sL8
 tJedM0I6550/AcoAfDPkaaC/jHkeRjcti0PnFrmWzmgecixY4udn+RAj6Mubdg2T6G0V
 nh+yCZWqV+RC616bhCQBJtlOTo9zl73vPyAOsWjKTP1RQOGnCNrFe2wWIhaBOF4LutvL
 hZOHPZpZ9TkOqjpyYParBYTCsoTAeshH3UrWY3Ur+6j4VT2b9fohV47LuMds5CpZakUG
 xovlLAzFB+JRPJHHfhaKgzYDhUYwt5GvseeUC8BRXUH1UbtJhravfOaTpY5f+YXOVF2u
 YTqQ==
X-Gm-Message-State: APjAAAUDZax/0QklwucN+e/VcU2XVphLLMYeQ/v0RFMfI5s61kESOiws
 rqIlpy71474esCEaBUGwtOTf8XwY1gLoEhjV9io=
X-Google-Smtp-Source: APXvYqwQf4abKOPNFAlcwbnC36FV5xBg1SpnV4ba02lkB4K0Nmgpx0sH2j86PfLQyvnJD0tnNvsGEQGzaeLOJ+FuK1U=
X-Received: by 2002:a67:7f07:: with SMTP id a7mr16125690vsd.196.1552314904118; 
 Mon, 11 Mar 2019 07:35:04 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 11 Mar 2019 20:04:53 +0530
Message-ID: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
Subject: ssh session with qemu-arm using busybox
To: open list <linux-kernel@vger.kernel.org>, kernelnewbies@kernelnewbies.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 qemu-devel@nongnu.org, =?UTF-8?B?7KCE7KeE7JiB?= <jy0.jeon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_073506_293189_9B2A5621 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Hi,

I have a qemu-arm setup with busybox which I normally use to test my
kernel changes.
I use this command to boot it:

QEMU-ARM$
qemu-system-arm -M vexpress-a9 -m 1024M -kernel
../KERNEL/linux/arch/arm/boot/zImage -dtb
../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/sbin/init
ip=dhcp" -nographic -smp 4

This includes, my own custom kernel and rootfs build.
For rootfs I use busybox and create cpio image and use it as initrd.

But, every time, if I have to copy some files inside qemu, I need to
create create roofs image.
This is painful.

So, now I am exploring how to transfer files from my ubuntu pc to
qemu-session using "ssh".
I know this is possible, but I am still not successful, and bit lazy
to explore these.

I am sure, many of you people would have explored already "how to use
ssh over qemu" and found a easy method.
So, if anybody have easy setup please share with me.

I could see that after adding "ip=dhcp" I get the eth0 interface like this:
/ # ifconfig
eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:56
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1180 (1.1 KiB)  TX bytes:1180 (1.1 KiB)
          Interrupt:22

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

But I could not ping it from ubuntu PC.


Regards,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
