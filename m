Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E01CCFA1A
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pt+qyndv0AzRUuHEEvj97yjSqkTltNCi2GMIK4Nk4U=; b=mTcWlfwvfsxdK+
	C0Ukt0GSnQepR0E4Mogq0DnyeVGjP1gLFX0ST/wnjFlYnrogmZqu0j7pPxvcxcxSzGFMwh9RPbohg
	9kyFZ59AbLQFvmt7fpJL9qvUOaU/3iVNpf7fyr/tK8Tzx8QUYGC1JoF2QZiKO2uk0+jnsoSHmo7Sd
	8sNmN2jdDhxDPO93GLGhLgs3bvLxsdjl9CxfMHdeXU79Wyc1ZdEj1q31JTs56Eeis3Ld/R1I/mUvs
	91zcee8LW5aru67I3yqD6cthdJVnhG/79iZgnexxjYGi7Aqh2upAhQJvMb9EMMmau+ItXPrAK4HCA
	mg5PCu0wkagMeWDjYeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI9Kh-00000004GW8-13dw;
	Sun, 09 Nov 2025 17:36:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI9Kb-00000004GUy-1cx3
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 17:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C84EE4169A;
	Sun,  9 Nov 2025 17:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE07C16AAE;
	Sun,  9 Nov 2025 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762709759;
	bh=VeXIMFby4++o7k2a7+34n+EeWMLXw+AohCFf3biSWHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzcRUXNT9/f1tDKe4T6F42zpttJ/aX9MBiZ0jM74+dveROq+XbwX3UtiMCATmeKTf
	 pjIXycds0QVgTvGCxyvIZsP4VATkS9eUX5UIEl0DHKGQhP6x9aRQORyAaRUMcpuD7y
	 ymjXrKjvsPZV/l8CjSLfxXAGJ/3k1EXYUZR+EHFeM0nzpKdDlZ8Hcm0QED+Wd4p1XY
	 UdYW5sG8XF3PsxYz1WECWTZWMIvVHok7/eH6feKhJNQ/bTwZrsE1SSVvjpus/BxHsl
	 6MCMvLVfDQKMBSCjN2+mmAFDMbF5WiaTpPkInR3dcTYqhXlnvyJUdltoiZfs4E0JoW
	 TW4t8VSHrHxQQ==
Date: Sun, 9 Nov 2025 09:35:58 -0800
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.19
Message-ID: <aRDQ/sam60PIc557@x1>
References: <aRDFOnmcW6GIJ6bt@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRDFOnmcW6GIJ6bt@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_093601_448755_01378A03 
X-CRM114-Status: GOOD (  12.44  )
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

On Sun, Nov 09, 2025 at 08:45:46AM -0800, Drew Fustini wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.19
> 
> for you to fetch changes up to d8a174babf649346b6dad6784ae1e9bc8417af71:
> 
>   riscv: dts: thead: Add reset controllers of more subsystems for TH1520 (2025-10-31 10:17:11 +0000)
> 
> ----------------------------------------------------------------
> T-HEAD Devicetrees for v6.19
> 
> Add PWM controlled fan and it's associated thermal management for the
> Lichee Pi 4A board.
> 
> Enable additional ISA extenstions supported by the T-Head C910 cores:
> Zfh, Ziccrse, XTheadvector.
> 
> Add reset controllers of more TH1520 subsystems: AP, AO, DSP, MISC, VI.
> 
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> 
> ----------------------------------------------------------------
> Han Gao (3):
>       riscv: dts: thead: add xtheadvector to the th1520 devicetree
>       riscv: dts: thead: add ziccrse for th1520
>       riscv: dts: thead: add zfh for th1520
> 
> Michal Wilczynski (2):
>       riscv: dts: thead: Add PWM controller node
>       riscv: dts: thead: Add PWM fan and thermal control
> 
> Yao Zi (1):
>       riscv: dts: thead: Add reset controllers of more subsystems for TH1520
> 
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi             | 72 ++++++++++++++++++++---
>  2 files changed, 131 insertions(+), 8 deletions(-)

I forgot to cc mailing lists...

+linux-riscv +devicetree +linux-kernel

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
