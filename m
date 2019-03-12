Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6F4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:12:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14602087C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 14:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIWH/G5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14602087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qywc/LbuYHb1tfvOt0MGMZzZDMu4TbndHjr/IkNMvOU=; b=LIWH/G5Id7xAUvw7VA5A+Ex9n
	GP7AfmqpeHkbugeM7kDfnBP/uQnvl2N9P7Of8g+ZD7ucyU4OOx04lOqdiCVfp0ccOqlJLaatWFLXd
	oLxsPhyfeCsUJxm9naDx2Xou2JkD1oURgHyu9jppZn0t0Bod2qxMp+2/u/XYLsm3smr8LmQctkqsg
	7StZ+RtxTDX56WPzRiXkUNesdMf56YOnVfJ8QQkjVI8cr4oG1bsFDJgf/HazGuBbEY/JLJc/8RHv0
	vWTew7c02KdijEQCuOYEiytb9lexmXAs7Yq4jppS/hZNPtZWPle7uVz+Xc2XCujyXRYZ/m2b7TWx2
	pYe5lpGSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3i8K-0004bW-Hj; Tue, 12 Mar 2019 14:11:56 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3i8B-0004TY-Ok; Tue, 12 Mar 2019 14:11:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E27A4165C;
 Tue, 12 Mar 2019 07:11:44 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93FBB3F71D;
 Tue, 12 Mar 2019 07:11:43 -0700 (PDT)
Subject: Re: ssh session with qemu-arm using busybox
To: pintu.ping@gmail.com, mick@ics.forth.gr
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
 <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
 <CAOuPNLg4dfoovZ_eqL5XvNW3Ak9dGeCVr=vbG6G5t4Rxo-nC9Q@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <00078ed3-fe1d-722e-0943-80bb189ee3ab@arm.com>
Date: Tue, 12 Mar 2019 14:11:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAOuPNLg4dfoovZ_eqL5XvNW3Ak9dGeCVr=vbG6G5t4Rxo-nC9Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_071147_814260_859F2EF7 
X-CRM114-Status: GOOD (  14.79  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernelnewbies@kernelnewbies.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 12/03/2019 14:02, Pintu Agarwal wrote:
>>
>> -netdev user,id=unet,hostfwd=tcp::2222-:22 \
>> -net user \
>>
>> and you 'll get guest's port 22 to be forwarded to hosts port 2222, so
>> you can do
>>
>> ssh root@localhost:2222
>>
>> from the host.
>>
> 
> I tried many different options, but unfortunately none worked for me.
> 1)
> qemu-system-arm -M vexpress-a9 -m 1024M -kernel
> ../KERNEL/linux/arch/arm/boot/zImage -dtb
> ../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
> rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/sbin/init
> ip=dhcp" -nographic -smp 4 -netdev user,id=unet,hostfwd=tcp::2222-:22
> -net user
> 
> With this the eth0 interface is removed, and I see this message
> (although login works):
> qemu-system-arm: warning: hub 0 with no nics
> qemu-system-arm: warning: netdev unet has no peer
> Booting Linux on physical CPU 0x0
> <skip>
> NET: Registered protocol family 17
> <skip>
> Run /sbin/init as init process
> ifconfig: SIOCSIFADDR: No such device
> route: SIOCADDRT: Network is unreachable
> 
> But, ssh is still not working.
> ssh root@localhost:2222
> ssh: Could not resolve hostname localhost:2222: Name or service not known

man ssh

+

Make sure you have sshd in your custom rootfs and has been stared.

Cheers
Suzuki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
