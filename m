Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C720CA0EEB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSU2qlp0X+pee+KcSqMSEKO2jtsSYXhvFhNJnl486xg=; b=JTsiH5xQtOpTHF
	Z7vJiU1ENuDaIjJSB2lj5Wx2N8CKQNn994XgxIYiDVKhqXKfRuEXDLHmoN4irNczS/sFtIOVAmAgi
	466uZhD89T55/lW7lteAUjUn0y6Deun5OwUf/kFtVc5AvzZNKHO7Svn9KMQFFWve4O/58iH9nlBhU
	IgNZb6udPdLq4kWrrrZ/zDAHxF/AuNNGrJDan/U74shApVAJdrMamGs2TRqHM3wkfdMaLBd7p09M0
	NYwEZOdPbdz11lkiAfzIKlYzes7nzyb5xjFyAbnPuOBxLwSZJvRyyJm7qdjF3pYPKzjrpVA30NdNT
	NOnMpe/8/FCDnu0mjesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX73-0000000C0Fp-36IR;
	Wed, 20 Aug 2025 00:55:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWGl-0000000Bulz-2RTm
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 00:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E2A9613EF;
	Wed, 20 Aug 2025 00:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17486C4CEF1;
	Wed, 20 Aug 2025 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755648094;
	bh=BF2nongohxL86yTybLMjEVN3XQRN/BOzcVk35AHcCzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rfu5sxaPNLk41Bejx8ROFIRMBhuR9rSeRYbQ0taHMw97hCpiCTUd2ayfoqhct1qpm
	 b6ZrfvWbYX5wFgOfJwyBNflzknImgLXRNovwThoTgNfTLtvYnBC4ROi/83Ps6eqVgG
	 ehiaHsbmxGNHAFY06tsO4DlEQCcpHb0FU8THJD3O5t0OloZrioGupdeZLbXg7FXzdW
	 hGsdCC7GUQzQunhWBLSOeeYELF1xuul2CBEGy95Egppr1hhNbm4a//LuXYQoU79icc
	 LUR/FwGaWM1UGJGWvz23W3ccLG89fi/yqIfxUBQoyFC/RqA8DnQmJK/pGG+eUqfN9+
	 8Er9YtcEQPiBA==
Date: Tue, 19 Aug 2025 17:01:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Darius Rad <darius@bluespec.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Florian Weimer <fweimer@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v3] riscv: Add sysctl to control discard of vstate on
 syscall entry
Message-ID: <aKUQXDh4u9xJx+jS@x1>
References: <20250819-riscv_v_vstate_discard-v3-1-0af577dafdc2@kernel.org>
 <20250819-bb1be8c05ebdf7ea751323aa@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819-bb1be8c05ebdf7ea751323aa@orel>
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

On Tue, Aug 19, 2025 at 12:16:02PM -0500, Andrew Jones wrote:
> On Tue, Aug 19, 2025 at 02:40:21AM -0700, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > Vector registers are always clobbered in the syscall entry path to
> > enforce the documented ABI that vector state is not preserved across
> > syscalls. However, this operation can be slow on some RISC-V cores.
> > To mitigate this performance impact, add a sysctl knob to control
> > whether vector state is discarded in the syscall entry path:
> > 
> > /proc/sys/abi/riscv_v_vstate_discard
> > 
> > Valid values are:
> > 
> > 0: Vector state is not intentionally clobbered when entering a syscall
> > 1: Vector state is always clobbered when entering a syscall
> > 
> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> 
> I'm in favor of the clobbering being off by default and creating a knob
> to enable it for debug purposes, but I'm not sure we need the config. I
> think it's reasonable for systems that need the discard behavior to add
> a sysctl toggle to their early init. The config may complicate the
> documentation needed for user recommendations and potentially generate
> confusion when moving from one system to another since defaults could
> be flipped.

If I dropped CONFIG_RISCV_ISA_V_VSTATE_DISCARD, then are you thinking
that riscv_v_vstate_discard_ctl would be initialized to 0 instead?

I would be okay with that as it defaults to the clobbering being off.
Hopefully, Palmer will chime in on whether setting the sysctl in an
init script would be acceptable. He told me that he does want to retain
the strict clobbering behavior on his tester machine.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
