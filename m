Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CD2CFD36C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXBLAyepogd0Xh6FiZ9oWPN93jqSp1p/xs/yRLcliuY=; b=c8a+9nQta1ccyk
	xMNc0H8F1lmrVYsiR0HelUp2+kIX8JtxRk+SfbNlV/2vNTZ+2nBGDT2ZUpy9s+jkUVPNpR4c+Vyqw
	OvVCSH+dvA9fWo4xdk6R/PNV1nN8FEpiogUurnN0vUT8jlQYhLScLJY1E84sRmc8Poz/1yV/expwv
	5oq7HY+8Qj0xO83Jm55XQUdXf+eJCToFm2UDNb3+Ckmn9mzrIcWTnNB0HQH5pE4D/D4PU9MwX2EQG
	8MIt9GyFxH2a6evxyPeQTdeygO45HLBK5C4ULl9zOEaRFG/4MUoiN0hQJJC5trZS8EYHOaF3hHwFL
	bygwjL+Lc1LbG9mIJuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNi1s-0000000CZNK-30q6;
	Tue, 25 Nov 2025 01:39:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNi1q-0000000CZN8-1WdS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 01:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E8960185;
	Tue, 25 Nov 2025 01:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC92C4CEF1;
	Tue, 25 Nov 2025 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764034777;
	bh=XcG+wX+vO5qk7R+ji0dAoSo1q+3C1oPCLIkEdpBcrVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=is4X4yYRxkREM06tbuvKyBKg/zbLJzhlHnAmBctt1fVHWvQJxayE2lwwJbMSZOSRm
	 3rHqkXRHJIz/GXfQw+R26Dgmv4woDo1Oo6VKllGHHx/Qi8Kz3OXcqQHsyPvylZ+Wnu
	 GDGYfdXuJMrQwLdMyg5iEolcEWCmWn7EVI3lV/QdWagysz7b2USsCnFMTBnLKZWAb4
	 PVxu+q96VepjNE+Ba4kKPDfozl69GpRrhDH1LgFYkJs03q5Hl4sWtA2EIMv2vTwPcJ
	 PoWV2dwIvYhAu1CZ2a6jMZnu1jnzexw31BNPN/iXwuUe1nsAkDRMtTxjj9duu6YAss
	 0/9LfmjZpJH9Q==
Date: Mon, 24 Nov 2025 18:39:33 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    Andy Chiu <andybnac@gmail.com>
Subject: Re: [Bug 220795] riscv_hwprobe and AT_HWCAP diverge after
 PR_RISCV_V_VSTATE_CTRL_OFF
In-Reply-To: <20251124-yam-whoever-7f1c635f94c8@spud>
Message-ID: <b5880f78-e3ce-08d9-9865-dc7373c196e6@kernel.org>
References: <20251124-yam-whoever-7f1c635f94c8@spud>
MIME-Version: 1.0
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

Hi Conor,

On Mon, 24 Nov 2025, Conor Dooley wrote:

> I got added to some bugzilla thing last week about the vector prctl and
> how it interacts with hwprobe. I have no idea why I alone was chosen,
> since I didn't write this stuff, so I'm linking the issue here so that
> someone that does understand it can reply:
> https://bugzilla.kernel.org/show_bug.cgi?id=220795

Thanks for passing this along.

> The content of that is:
> | Overview:
> | 
> | On RISC-V systems with Vector support, invoking
> | 
> | prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF)
> | 
> | 
> | disables execution of V instructions for subsequently executed ELF programs, as expected.
> | 
> | However, after this call:
> | 
> | AT_HWCAP no longer reports the V bit, indicating that Vector execution is not allowed for new programs, while
> | 
> | riscv_hwprobe() continues to report RISCV_HWPROBE_IMA_V as present.
> | 
> | At the same time, multiple downstream user-space components (such as libgcc [1]) already treat riscv_hwprobe as the authoritative source of ISA capability information, since AT_HWCAP has historically been polluted by inconsistent vendor reporting for RVV and cannot represent multi-letter extensions (V, Zve*, Zvfh*, etc.).
> | 
> | As a result, downstream runtimes may select RVV-enabled code paths even when V has been disabled for the program by system policy.
> | 
> | To proceed with downstream libc RVV multiversioning work, we would like to confirm whether this divergence between AT_HWCAP and riscv_hwprobe() after PR_RISCV_V_VSTATE_CTRL_OFF is intended (by design), or if it should be considered an unintended semantic inconsistency.
> | 
> | Additional Context:
> | 
> | This concern has been raised before in prior discussions [2], noting that hwprobe reports capability while AT_HWCAP reflects availability, creating ambiguity about which interface user space should rely on.
> | 
> | Reproduce Log:
> | [init] ./rvv_check
> | AT_HWCAP = 0x000000000020112d
> | V via HWCAP:   yes
> | hwprobe KEY_IMA_EXT_0 = 0x038d2bf1200000ff
> | V via hwprobe: yes
> | [init] ./rvv_off rvv_check
> | PR_RISCV_V_GET_CONTROL = 0x16
> | AT_HWCAP = 0x000000000000112d
> | V via HWCAP:   no
> | hwprobe KEY_IMA_EXT_0 = 0x038d2bf1200000ff
> | V via hwprobe: yes
> | [init] poweroff
> | [    1.880906] reboot: Power down
> | 
> | References:
> | [1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=libgcc/config/riscv/feature_bits.c;h=157bcdcad69a939037f6faca3a90c2598dd61f89;hb=HEAD
> | [2] https://lists.infradead.org/pipermail/kvm-riscv/2023-June/003915.html

Will reply in more detail on the Bugzilla.  For the archives: the short 
version of the story is that, so far, this is the intended behavior.  This 
became possible because we wished to avoid a potential ABI break in a 
corner case when non-vector-supporting userspace code is mixed with 
vector-supporting userspace code.  Context:

    https://lore.kernel.org/all/87cz4048rp.fsf@all.your.base.are.belong.to.us/


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
