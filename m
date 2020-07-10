Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EED6C433E3
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 19:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD9A2075D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 19:13:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhIoGT/u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Dk3H6I22"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD9A2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tHGD2fP1pnQDINfAAVNJ5sBazFMdGG26zuq9M+edWTI=; b=YhIoGT/uMik63vr63sY6puA27
	I81HUa75kNzSt0AMYD4n1SjVP6izyy8NB7nK6U82I4oVvPfcMMhR7gAg14BjIOYSXXwr+dnriRDwS
	jvsl/66of6km1SRwZSui2KGd1+QZ3EtGbh6t9AyPemrWknvkl8iZaUkeEG9qZJt1OpLAzY/VeoYlZ
	fS1Wy/KsYvDbVmlyZuD21B3c7RXdWLlpXmCxVj3tsqbLM7yXaanBY5JtNYcaIrp8omyiMo6fAHPoO
	ltiF8IJAwx9zL3Wvedlq8oam4tr7o1T31OdexcU6eVfz2D1aP92Fr3KqvNrmx0uxSB7JJ+dwhKhef
	N1yhgNfog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtySE-0005XA-58; Fri, 10 Jul 2020 19:13:02 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtySB-0005UT-EI
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 19:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=eeqxCv54+Y/HjWjTYsmA00fhZqCTuhx0ERmpwHo9VjQ=; b=Dk3H6I22U7PPHVi74XIs1knhgi
 D86tBVNQfxWL9FL0synhM6fP2Zn7c4pre5SKCTzG4OQLxehUDhgdI97iQ04w/EeI0px8cR0zy82Tb
 rt5KcO25DrLMXteK4u8neK8S2DqGjMtB9syozvkTFfQylosA/yTV47clYUNNE64AAxugaZzb6vrux
 HOvJKtM3F2/DPBs/jUZnmIlE6zGkAAQU9Y5GfMY3Ap8fu3IWD6lILhQ29jjChvMrz5zKDXCfmhLoQ
 jB/WAJom4CJk4vu/9ZsIyf9Oo0dVK/Aijd4bhT90JaW5RdX3r+1L0hajLxodYm6XIpWKHjS6bawB/
 KTq8BOug==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1jtyS3-0008Mp-0z; Fri, 10 Jul 2020 21:12:51 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1jtyS2-009SrH-Cz; Fri, 10 Jul 2020 21:12:50 +0200
Date: Fri, 10 Jul 2020 21:12:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex Ghiti <alex@ghiti.fr>
Subject: Re: Random, rare, but reproducible segmentation faults
Message-ID: <20200710191250.GA2242132@aurel32.net>
References: <20200708202844.GA2075303@aurel32.net>
 <b7de2a27-d3b4-194e-2f80-664406055494@ghiti.fr>
 <c83cd510-b407-7f57-3850-de53653254dd@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c83cd510-b407-7f57-3850-de53653254dd@ghiti.fr>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_151259_609797_9B735DA8 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alex,

On 2020-07-10 01:15, Alex Ghiti wrote:
> I have a debian kernel downloaded from here
> https://people.debian.org/~gio/dqib/ that runs using the following qemu
> command:
> 
> qemu-system-riscv64 -machine virt -cpu rv64 -m 1G -device
> virtio-blk-device,drive=hd -drive file=image.qcow2,if=none,id=hd -device
> virtio-net-device,netdev=net -netdev user,id=net,hostfwd=tcp::2222-:22 -bios
> ~/wip/lpc/buildroot/build_rv64/images/fw_jump.elf -kernel kernel -initrd
> initrd -object rng-random,filename=/dev/urandom,id=rng -device
> virtio-rng-device,rng=rng -nographic -append "root=/dev/vda1 console=ttyS0"
> 
> First is this kernel version ok to reproduce the bug ? Or should I download
> another image ? I'd like to avoid having to rebuild the kernel myself if
> possible.

Yes, that should do it, it's running kernel 5.7.6 so enough to reproduce
the issue. You just need to increase the memory a bit more (4 to 8GB)
and add more CPU with for example -smp 4.

> Now I would like to reproduce the bug: can you give me instructions on how
> to compile the qt package ?

The following sequence should allow you to build it:
- sudo apt-get update
- sudo apt-get install build-essential
- sudo apt-get build-dep qtbase-opensource-src
- apt-get source qtbase-opensource-src
- cd qtbase-opensource-src-5.14.2+dfsg/
- dpkg-buildpackage -B

Alternatively I can prepare you an image with everything ready.

> Is the page fault address always in the same area ? It might be interesting
> to find some pattern in those addresses, maybe you could also print the
> random offset to try to link both ?

It seems really random to me, with 3 outliers:
0x0000003fe7ef3140
0x0000003fcd16cff0
0x0000003fb9e96170
0x0000003fd3f4a120
0x448173f67cdbc8b0
0x0000003fdfe093f0
0x0000003fdfe093f0
0x0000003fe1d4aa70
0x0000003fc2cfef90
0x0000003fc0f5d050
0x0000003fe1d879d0
0x0000003fe9d3e990
0xf0ef4585be2ae01f
0x00000034484f71b0
0x0000003fde30e960
0x000000156888a430
0x0000003eb8560936
0x0000003fb121a490
0x0000003fb9abddd0
0x0000003fe41fc5d0

> Also print the entire virtual memory
> mapping at the time of the fault (I don't know how to do that) to check what
> the address is close to ?

Yes, I'll try to find a way to do that.

> The 0xd cause implies that the virtual address
> does not exist at all, which is weird, my guess is that the randomization
> "reveals" the bug but that the bug is still there once the randomization is
> disabled.

I have also that feeling. It could even be a userland issue, with the
userland not able to cope with some memory mapping.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
