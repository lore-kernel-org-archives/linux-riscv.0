Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D578C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuapEhl0Jdoh2xHqSxP54Jm0GmsOHdAnu/forf6/ca0=; b=dH+k1ErKhOD5VT
	Pm17DJz/AyGbImSpLLXuqu8kKh2arjXM7vTwoNOFwJlKvbikBufjFNba2TXav0cwa44xDxW5+hEif
	xJ4solE288l82iE1JM7PvMOE387KKiNlyMeoyGvEBdVbv0y/10rIAuJba01ZQOMwB/I3NL25G/MWK
	g3Xbt/F+3Bq9AwE6Z7QmGbRjo0tlUzQ7/b93AJGyHvkOYydmTuM9vGesztW9pOegPyADzbUV6+HZN
	NBLMk7dL9hXMCE6WXfwF4ZAQehsxnGBaWDgIPEZ+ba/EXR3+eJI2kKhAyJYBQ47uX5pSFIvLoinrV
	x42tukO17B1wQKmVQCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncp8u-00HWDX-Ek; Fri, 08 Apr 2022 13:59:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncp8g-00HW3m-VP; Fri, 08 Apr 2022 13:59:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70FABB82B6F;
 Fri,  8 Apr 2022 13:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8110C385AA;
 Fri,  8 Apr 2022 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649426335;
 bh=bDBwdys85RCakFFbygvOdphtQTA9miuiqFibn2MIMFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OeA26bBevVgo6sbJzPJXamDO8E3ns/pz20ZNfr/4yRgmVpFBvscC184viL/LX11hU
 CD7+aJE00Kjo9bk1ElwXNi+skHXiJ+iskOUp+OMkltZaxXxTTbfQFqxbL/k7/OSSZN
 N+uMGu37NDp/7VhbOex7Iyhc36pjZYZEjVMsnR23nQy3HLdYE1lLONI3vTtBMweeWI
 PAs2Y0Y+9ghBS7PrZtAc7B5mZRRvCAw8bIi9He0MU67mtZQulVPCrja/esFrjYYuvA
 yrsaXkDTlAvZy+wqrxspiwEm/OT1rSxyL0bGt88Psnktz2ujzjTVPFTrnohVgMCCrD
 6KdtWv3cu8fLQ==
From: Will Deacon <will@kernel.org>
To: gregkh@linuxfoundation.org,
	guoren@kernel.org,
	arnd@arndb.de
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-csky@vger.kernel.org
Subject: Re: [PATCH V4 0/4] arch: patch_text: Fixup last cpu should be master
Date: Fri,  8 Apr 2022 14:58:45 +0100
Message-Id: <164941462755.3967238.7784714539452982763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220407073323.743224-1-guoren@kernel.org>
References: <20220407073323.743224-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_065903_188656_7ECF7012 
X-CRM114-Status: GOOD (  10.68  )
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

On Thu, 7 Apr 2022 15:33:19 +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The original idea: When the
> master CPU patch_text, the others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee the remaining CPUs are waiting. This patch changes the
> last CPU as the master to solve the potential risk.
> 
> [...]

Applied first patch only to arm64 (for-next/fixes), thanks!

[1/4] arm64: patch_text: Fixup last cpu should be master
      https://git.kernel.org/arm64/c/31a099dbd91e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
