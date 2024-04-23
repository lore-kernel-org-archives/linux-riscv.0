Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97721C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 18:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgzwnHIguhwChoo0UA87DaEF5W78U/lYjyflXqtd5cE=; b=YwM6CGJT3NUzrN
	tam3SK4i8rLK/7UR/Q5RlcH+Dhtafo/P+Unl8azYeO+MAB6ZTEAgEyfXo0686JeMvFSVgz0LkLVr0
	QG4f/WNu9KnLtomO3Kdyjoo31zrzsa1IYLAi862Jgh6nBc9y/Z99xbQy39SovJKg4tpfaTP99gUYX
	w/QIAaufXsctro1Uj7Vky1qYsSum3b6Bixt4fZZzRjamDG8v1X4QDh+FKJUQUmoBowu0B8N3061KU
	2++C7wxGtkE+/6DHSJLHI4vbrWTgK6WA5yAJAntln9M6U5R3mWhSBSiYFnXAsgNuNndov8U83LjsW
	NHczb0sizSTvmDczEOcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKvj-000000018Wk-0lAk;
	Tue, 23 Apr 2024 18:31:47 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKvd-000000018V6-22Td;
	Tue, 23 Apr 2024 18:31:41 +0000
Date: Tue, 23 Apr 2024 11:31:41 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Joel Granados <j.granados@samsung.com>,
	Kees Cook <keescook@chromium.org>,
	Eric Dumazet <edumazet@google.com>,
	Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-xfs@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, kexec@lists.infradead.org,
	linux-hardening@vger.kernel.org, bridge@lists.linux.dev,
	lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org,
	linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <Zif-jf8Takojtq7x@bombadil.infradead.org>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2024 at 09:54:35AM +0200, Thomas Wei=DFschuh wrote:
> * Patch 1 is a bugfix for the stack_erasing sysctl handler
> * Patches 2-10 change various helper functions throughout the kernel to
>   be able to handle 'const ctl_table'.
> * Patch 11 changes the signatures of all proc handlers through the tree.
>   Some other signatures are also adapted, for details see the commit
>   message.
> =

> Only patch 1 changes any code at all.
> =

> The series was compile-tested on top of next-20230423 for
> i386, x86_64, arm, arm64, riscv, loongarch, s390 and m68k.
> =

> The series was split from my larger series sysctl-const series [0].
> It only focusses on the proc_handlers but is an important step to be
> able to move all static definitions of ctl_table into .rodata.
> =

> [0] https://lore.kernel.org/lkml/20231204-const-sysctl-v2-0-7a5060b11447@=
weissschuh.net/
> =

> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Cover letters don't need SOBS we only use them for patches.

But anyway:

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
