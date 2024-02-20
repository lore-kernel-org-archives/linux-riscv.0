Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB5CC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lNMkpr9ztYN1hxn9ffVdC8xLzXSJmHV0cu+DrZ8FNq8=; b=U52ytphw1Lt3ci
	OYF7SZAyTcdkZpXM22Z2LODFURHDyNlJtXPMR/nu8Uucr2zPeiy+yCD76+NOVulZgL0RVq1HVWFgN
	K2bWaTctGTgiVYc0uvr7Fd9f4/VWmNTK+wcqqoTJEXckKQuCmT9mrU7CEY9n5k+60H4TBIr6tUDsL
	04tfVLO4SPF2VOITq7z7Hj/kwAkjohLhouuvIkX1D4zfQ7Gt6wdZNqw8SfPH/4iqZZL/4cBEEIn3f
	J3RDVdbV6lU/JGyGabspWWGgxgaSDkqYBepUTPFDSSC+SHvNWnHFK+i8jpduIVKrQuoKLkuw4omxs
	4TvwgsIKr1ABdYpnZYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVUB-0000000Ftbt-3wyp;
	Tue, 20 Feb 2024 19:08:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVUA-0000000Ftbh-1naW
	for linux-riscv@bombadil.infradead.org;
	Tue, 20 Feb 2024 19:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=u7KHD7RG1W+C5tk/BT6KiPSWci7A42fZiVpBZLG4M2Q=; b=ac/kRgS2KjgbRnKslNlUM/7aiH
	B1pW2UaauRaBFJf9vq5vtTHXfxv1XVVm3iVNJKvshP2N5AbGBLr3SVXHQH7DvmC6SA87oQ5928KeG
	/ZthXlYC+NNBSh0A0VKebJp95M9tzySLCBsjftR1CVBrJDoOWwIAqeTfm9a3XLYmN+G8me2Id6WpE
	fbEyaB+Dq9WWqD/Bbs6r7JVmAvXopYRv9HZiF0FzTb5iPeV/l01cNYQ2ZtURt/T2CTQ3CrtF96g8u
	M3aBotfNVhGPW8nXrpq/9ZisyDXuD4AOSk+aZ4nXX6hHDAWCcJo7eyIipjZppmwUAIBUUwgm6swG1
	KHfm+FSw==;
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcVU6-0000000GLCH-2QRu
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 19:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1708456117; bh=u7KHD7RG1W+C5tk/BT6KiPSWci7A42fZiVpBZLG4M2Q=;
	h=From:To:Cc:Subject:Date;
	b=kwRMhzUrBSgZ3BVXhiLWASLO+cfgmWpcxOMlCLRws2GdFNGOB7+kuniSViGw5I7IS
	 afANUySMWbZ7TXWf1wMJsq4JMuAvA+4em4VQQfShVt15FAnJQSyX7o28MHZMs9BVZv
	 d1u66ABKAh4Nrc6iYLCcG8af6/wvUBa3KrMjNcso=
Received: from cyy-pc.lan ([240e:379:2240:ef00:159c:db93:bdcd:c9c6])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 87A7667; Wed, 21 Feb 2024 03:02:07 +0800
X-QQ-mid: xmsmtpt1708455727tbv094zbu
Message-ID: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
X-QQ-XMAILINFO: NYdHd+5EbUy1IztpfkAF9XOfYQ2NVGTyri3rjQSIy/snEhaonuY3QLUJufgv6v
	 i0sVwFO2yVlC0yzQLvN5XohOm2ODbp+JZWvB0sReiCQU9AHq8wVnqtGq6dDYUCWEDunbiLR6QcKY
	 JrSJuMWeWtOtcTzVtPFIGPeMGujjltZoBzE1/jfe7MEhEpg31EL9cpryD6B5pqzdJLSLWw2f8xMv
	 cwEfocgIzTMScbXZNItQv11F9yGw5xGZp5Jin8ZiED4IgcFnzo+zD2yisTSqVdyAkT2OZSlaxaGA
	 vdaciIrghLbTCm1opuuAQAyEXNLSxcfJApzsxr5rtipTVBtuNOiGKgPvxnzjr+8Tyzj6T/BHtuXW
	 d1YRwWDfK39GiLIike7/gSDwecJCJ7ZAMzXhrEw6Pp3bmrp3nYVEJF5lLv/BiQ8RPWHTENz0mEG0
	 V17rYYCpBeIVPjUwoJNeilvfQ8bitThMobmE3Te3ZWOrI04OGkTLygc5cjxxxQDlVYNSMM+cEHve
	 iVx+P5N4d/uXufURiD1ZnS5gvZZVARZLldNDaaxiqWb/jE0e7qVZuS+xg30PqVi+itKaA/rRgm93
	 E2j4Zc/CPCL78E8pyjij/7baNbu0v7eHjolhFgE5UDE82K15E/eHvTlWT9aWytqDeQoyriD+rdfL
	 J/feLH60fE6PuUR1uwSNrTOuANgmTj73Ldv8PGVTj4tO+JgCcH7yMIv4OD8CY3/dgqU/VWlHJp2G
	 JE9vqgjq4m+kS69Hhd8Yj0IZIevXDTNAwc3kQ087UF5SbYpUa5ZkSMmZrnawYu4/31yNTcKaE1fi
	 5ksrhME0UajffWdSVHvHABXd/YuT+3eBQMBSrxUli1wtxLplB37Nrq2Sz5/+9dqUQnHwxNhasySH
	 7+89ze/GCe2V5V67pMOtERtNyMBW45jwMij5MD0M23PvwULpni115jxI6aZER8CQcT2gazI4FLEY
	 MhmiXySCUt+bKcr9osQEbVBJGEKHsj+Mrg5einmD1g2kR1ddqL3oAB+mVyveK2CnHQsRG2mPUoWG
	 VHnK2IxT78Lya67o6P
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [RFC PATCH 0/1] riscv: dts: Allow BUILTIN_DTB for all socs
Date: Wed, 21 Feb 2024 03:01:53 +0800
X-OQ-MSGID: <20240220190153.3390862-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_190855_154250_C065717B 
X-CRM114-Status: GOOD (  12.42  )
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

The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
patch moved this configuration to entire riscv.

Although BUILTIN_DTB is not a good choice for most platforms, it is likely
to be a debug feature when some bootloader will always override something
like the memory node in the device tree to adjust the memory size from SPD
or configuration resistor, which makes it hard to do some debugging. As an
example, some platforms with numa like sg2042 only support sv39 will fail
to boot when there is no ZONE_HIGHMEM patch with 128G memory. If we want
a kernel without this patch to boot, we need to write the memory nodes 
in the DT manually.

Also, changing DT on some platforms is not easy. For Milk-V Pioneer, the
boot procedure is ZSBL -> OpenSBI -> LinuxBoot -> Linux. If DT gets
changed, OpenSBI or LinuxBoot may refuse to boot. And there is some bug on
LinuxBoot now which does not consume --dtb argument on kexec and always
uses DT from memory. So I would like to do debugging on DT using
BUILTIN_DTB, which makes it very simple, I can even install the kernel in
the distro's way and provide a kernel package for other users to test.

Yangyu Chen (1):
  riscv: dts: Allow BUILTIN_DTB for all socs

 arch/riscv/Kconfig                  | 16 ++++++++++++++-
 arch/riscv/Kconfig.socs             | 32 -----------------------------
 arch/riscv/boot/dts/Makefile        |  2 +-
 arch/riscv/boot/dts/canaan/Makefile |  2 --
 4 files changed, 16 insertions(+), 36 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
