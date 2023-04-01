Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EF1C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GiS6pDvcsfPsRN8f5apGXhl1/AH17FiTjcDFBJJfps=; b=dmDwYx51wEAGM2
	KkwWrsXCqsmIEIeNhZEZeZ19MpI8UyzwVzqcmjrhavuigZD8OCmnWHcY4YMTz3/EmhP8SZeSLfTXG
	1iDQTjRGvXHZ69MM69VZpLFDNmEl0kriJVulByp6A5n9xRiZxj2uQQAJkAJuTMwYFCVP4tbTghrze
	kTomizqwEi7s3BVZmrkqzIG1e1dG8RhyDlqp7RJl6bN2G9/Kvb3KtXSGSuzYUpLxIOlFX6EAi0O+q
	u8s1S+ADAI0zoOooTrpRsAtFZpIwTqhuunwKXgGfeqQMXes1hWcAaukmdGxzYw1lOeDyTNRcYLkmE
	qr7ljg8vPEqAF1jliN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pib8l-00AaTm-1K;
	Sat, 01 Apr 2023 13:19:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pib8j-00AaT1-18
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 13:19:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1420760DF0;
	Sat,  1 Apr 2023 13:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2FCC433EF;
	Sat,  1 Apr 2023 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680355167;
	bh=62febkaNQnAPXtdyR9VpUShs/vCJRfylF056sOOKvKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=upWKPQmZHPtKFqP2Djjw38dQywaVjwuQ0YfIxJqy6uaBjMYTghJuWxPWnyKJepKaY
	 SZ3R7lj9gAzvTJ+ZvZv61bGdQ7L/Qgi1qfPAGntT8tV457aMsONrxIvgx0g//Doz0Z
	 IXU5ZFfR13im+N2Mx1Df7FRnMpnGAL6QtKoW0XPM+zhxYcT4Syp12nIqDh9pBB+xLM
	 316UVaUBNdzlvo6FXA3PQ6X0hSU6cXkmi4kBSCKAWQgLS7NnhzS5FbcexvKWx8BL84
	 1DnCpjCSCV0zJ6T58lBwqUto6yd7/EDjIVdOVTTMJJ0Rz317uQCex0lJk/VKsU07NR
	 OTNeHRLt9rJ5A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 conor.dooley@microchip.com, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
 palmer@dabbelt.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@linux.alibaba.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yipeng Zou
 <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
In-Reply-To: <2587778.7s5MMGUR32@diego>
References: <20230222033021.983168-1-guoren@kernel.org>
 <23668656.ouqheUzb2q@diego>
 <CAJF2gTSWETHhQFuE19H+RVX6Jbue+UAu8o94QoBFx65NABas1Q@mail.gmail.com>
 <2587778.7s5MMGUR32@diego>
Date: Sat, 01 Apr 2023 15:19:24 +0200
Message-ID: <87mt3rloyr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_061929_453072_AAC6629E 
X-CRM114-Status: GOOD (  13.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>> > > > This has unfortunately broken booting my usual NFS rootfs on both my D1
>> > > > and Icicle. It's one of the Fedora images from David, I think this one:
>> > > > http://fedora.riscv.rocks/kojifiles/work/tasks/3933/1313933/
>> > > >
>> > > > It gets pretty far into things, it's once systemd is operational that
>> > > > things go pear shaped:
>> > >
>> > > Shoulda said, can share the full logs if required of course, but they're
>> > > quite verbose cos systemd etc.
>> >
>> > I was just investigating the same thing just now. So that saves me some
>> > tracking down the culprit :-) .
>> >
>> > My main qemu is living as a "board" in my boardfarm (also doing nfsroot)
>> > as well as my d1 nezha with nfsroot was affected.
>> Can you reproduce it with qemu? Could give me some tips and let me
>> reproduce it on qemu?

FWIW, I'm getting the systemd issue w/o NFS, on a regular 9p virtfs.

| $ sudo mmdebstrap --architecture=riscv64 lunar rv-rootfs http://ports.ubuntu.com

and the rootfs qemu config:
 |  -fsdev local,id=root,path=/path/to/rv-rootfs/,security_model=none \
 |  -device virtio-9p-pci,fsdev=root,mount_tag=/dev/root \
 |  -append "root=/dev/root rw rootfstype=9p rootflags=version=9p2000.L,trans=virtio,cache=mmap,access=any security=none earlycon console=tty0 console=ttyS0"


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
