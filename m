Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EB8C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936B02087C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlzXFUZy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="upitj2pd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936B02087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SInocwi9PBPY5slPf8omyxKCnmATP2RddzlZbxtRcg4=; b=MlzXFUZyCmVwNE
	xnXQxPu5/UK0dRt0h/SWA+lD5afvqLZVN5rbpdELbgXFLcn6QPb+cuppNrn6YvSK4lnvRZOmlagLt
	jRCLS2+RtFfLeMNRoAGOcPf3fBavZUOKGES/B38oAeRMAUeZ8ztTKJ4kwldj39fFYr18WIIFC+GZg
	xLqL87g1BTkwPlszFjrTiRRDIbHVrQGalITgN0zEwpzcNRlKOYwjXKMQSTV9KoBrqyZ2pBUPiPObo
	MhjbKUwF0JqVV7O18ttfjYR4ovGLKquqF85sHNAzSBHBLA/BihgqWlNMV5aCohG7PVvBwwg7iMy7a
	WhjPXrN9tuPooYKRULsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3i00-0000Z6-VC; Tue, 12 Mar 2019 14:03:20 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3hzq-0000QG-Kb; Tue, 12 Mar 2019 14:03:13 +0000
Received: by mail-ua1-x92d.google.com with SMTP id t7so814379uap.7;
 Tue, 12 Mar 2019 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvaI0VCBVCzTg+3CN9M2PU/lJ1a9ZkyRLn/CJ2kOuIk=;
 b=upitj2pdA9z4IducWBk84T+ll0TxWaillRih4wY/PCZEefKdSb5ILHNiIyZfLoVNv9
 WE+AUu1HBag1IbBeavJSV0p1D0PdHdo7SDTio4UyxYAil/x1zmydzxQUqGAAv0njx8GK
 9HS0Nn8h+A9WGMfpqmeJQjFIRcEAfbv5cTHZlhhbTlp/H+n7bUzvEj3gS+P2q0PB56FX
 orajZ5X3WfFXk4Iyxa4ZzJXOZxe8rpzFbrnGj8nEYpY6WBvzccFEYNE45yflVpcrt+SZ
 FCV16YQNdqI7eSjGT/TkSxI1l5dN1MLLRG768t5Ex8jh3D8zd8+fut7oa2nh9lIwEPiM
 Mk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvaI0VCBVCzTg+3CN9M2PU/lJ1a9ZkyRLn/CJ2kOuIk=;
 b=MdDWIkA+TFJA0Je85sjiKbbDaeOb8Z3wCx932ZYHVHYGVHbLVgd41RcYBkTykMmoed
 yX9zwUQvwNMF8nv9B5DbohiiyTmS/gQuHL3+EKR4maTEAccrD7mqO0XpmT+BiHBUB8eJ
 guOwRPMH2H+M+oUA7blVyoXxS0iBYgdiUNxl6e76lrXZkfDaQ7cY+ta3nVWn5WKpNIQa
 LXDx/q9+m6pCoqKHnVfveJ7zVFT/aQyXUqfuFRnJVFUeTCbzINwbGJdpQIRTN0Xp5dez
 MXVH6vR+WYPwPYY/PH6HjXGqi1E6KUs7jQ+fjf8gVXOAK4gWm/2nWo0qeSFoVAugniZ6
 Xb5Q==
X-Gm-Message-State: APjAAAUi7KK3iGApsZdLhe3xH5lu5CM1UrY19MzpEm0hN0XOX21fO7NM
 MkHMf5gmgPb499PPx9xLlhYbbcdLj1vLTcx0y4Y=
X-Google-Smtp-Source: APXvYqy6XhBwtFoMwZq0HDm9m4Uzw7JNBFdW4J1FiaBosJaBZmncW9aniaEAZwiIHokYb4uR5LhqZvLUw31QuYiTuns=
X-Received: by 2002:ab0:7483:: with SMTP id n3mr19892981uap.131.1552399389065; 
 Tue, 12 Mar 2019 07:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
 <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
In-Reply-To: <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 12 Mar 2019 19:32:57 +0530
Message-ID: <CAOuPNLg4dfoovZ_eqL5XvNW3Ak9dGeCVr=vbG6G5t4Rxo-nC9Q@mail.gmail.com>
Subject: Re: ssh session with qemu-arm using busybox
To: Nick Kossifidis <mick@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_070310_704427_129F0152 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: qemu-devel@nongnu.org, linux-riscv@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 kernelnewbies@kernelnewbies.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>
> -netdev user,id=unet,hostfwd=tcp::2222-:22 \
> -net user \
>
> and you 'll get guest's port 22 to be forwarded to hosts port 2222, so
> you can do
>
> ssh root@localhost:2222
>
> from the host.
>

I tried many different options, but unfortunately none worked for me.
1)
qemu-system-arm -M vexpress-a9 -m 1024M -kernel
../KERNEL/linux/arch/arm/boot/zImage -dtb
../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/sbin/init
ip=dhcp" -nographic -smp 4 -netdev user,id=unet,hostfwd=tcp::2222-:22
-net user

With this the eth0 interface is removed, and I see this message
(although login works):
qemu-system-arm: warning: hub 0 with no nics
qemu-system-arm: warning: netdev unet has no peer
Booting Linux on physical CPU 0x0
<skip>
NET: Registered protocol family 17
<skip>
Run /sbin/init as init process
ifconfig: SIOCSIFADDR: No such device
route: SIOCADDRT: Network is unreachable

But, ssh is still not working.
ssh root@localhost:2222
ssh: Could not resolve hostname localhost:2222: Name or service not known


2) if I give "-net nic" I get eth0 interface but still ssh does not work.
qemu-system-arm: warning: netdev unet has no peer
Booting Linux on physical CPU 0x0

3) With this there is no error, but still ssh not working
qemu-system-arm -M vexpress-a9 -m 1024M -kernel
../KERNEL/linux/arch/arm/boot/zImage -dtb
../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram
rdinit=/sbin/init" -nographic -netdev
user,id=net0,hostfwd=tcp::2222-:22 -device
virtio-net-device,netdev=net0 -net user -net nic

ssh root@localhost:2222
ssh: Could not resolve hostname localhost:2222: Name or service not known

4) I also followed the steps mentioned in the below document, but its
same result:
https://wiki.qemu.org/Documentation/Networking

-------------
So, I have some doubts:
- Do, I need anything to be configured on host PC as well ?
  I am using Ubuntu 16.04 desktop, and it is connected to only one
office LAN network
- Do I need any network configuration changes on host ?
- Do I need to enable any thing in kernel side ?
- I am using minimal busybox and I see there is no "ssh" command
there. Do I need a different busybox or a dropbear ?
- Will it work easily with buildroot ?
- Is there any precompiled arm32-rootfs image present somewhere, which
which ssh can work by default ?
  Because, I really don't care much about user side, so any arm-rootfs
should be fine for me
- I haven't really explored "bridge/tap" network yet. Is that worth to
try in these conditions.


Regards,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
