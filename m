Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF18E95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km23xSga/6cPtIRg3BctPR/LiCJF4hXsnPRdBXqOuYo=; b=v+6EuK5GjQuJpr
	W96sEF1vl6VNLa1bTrREI4Ws8fDDlRk2KhMoVEgrNMmpGTWl/fZfXhp8zuaUeYLHPKLyTw0D3cCtb
	Pbx4D+xgbxVYIpodpG0qDL8X6Gqs0Yp3UWYn6xc4UrQJnwEVum3Sg5ilSZ5jnN8YX2v8IDxwV086/
	+HxZIpje39u0IGzMTTSZ2gL4yaN6qxYpfCqjZEpV5HUq0JTG2nAyXPEwbvSkH+r4c+Y8SzmgCCG7d
	NMBuq40gJd1Fn2KjKXMS5Fko24g+YUZCfJrPslkWU7ar07RlsFaX42BfV369OTJo2RTwUctvLgDbe
	D+bkJu+Xuf5zKXHneTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp7TW-007bSa-2Y;
	Sat, 07 Oct 2023 13:36:10 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp7TU-007bRw-0d
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 13:36:09 +0000
X-QQ-mid: bizesmtp86t1696685746tumf87vq
Received: from linux-lab-host.localdomain ( [116.30.131.235])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Oct 2023 21:35:45 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: 3M0okmaRx3jgGcczq7ckLHewl2tbA5gqgi51LqUGP7as6L5o4OHQBGbMr+O0K
	Ev5u1YtIpPxQGtJlVHeYgCFGWuSyU4pupUt3i9h5i6zVcsE9kmXpl7AbGbnnLBOxIZeJQPL
	+Uf+RAHoyB1WFXVIuEQ+hM+OUqylNxlzXA9MGEgfMEhjuEEyP835Kv4abK53J0LUbGOnySj
	JxxpaCy54pY0AHvDEJ/5ycR62jiLW/n5w+rhGGqYxuoJG8GNAJr8OBXEIj6XKza1Sw4w5Nj
	27F3twjB0oVAqiVQJOYZP6DupfkRZWP2HbTzQPMtM/u15Tu153r5elnFLt4UgaJcgJmVG0Z
	mQlI8VDelUKWCRAEg97X1DbevJXNLRuEWG8ACCAxcpwN6vtCWNF6jsT4uDBoQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6264558970741984576
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	tim.bird@sony.com,
	tanyuan@tinylab.org
Subject: Re: [PATCH v1 7/7] DCE/DSE: riscv: trim syscall tables
Date: Sat,  7 Oct 2023 21:35:44 +0800
Message-Id: <20231007133544.6580-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e160b4df-92ce-4b9c-96ba-200f259c8216@app.fastmail.com>
References: <e160b4df-92ce-4b9c-96ba-200f259c8216@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_063608_566601_9D0D0AE9 
X-CRM114-Status: GOOD (  19.04  )
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

Hi, Arnd

> On Tue, Sep 26, 2023, at 00:43, Zhangjin Wu wrote:
> > When the maximum nr of the used syscalls is smaller than __NR_syscalls
> > (original syscalls total). It is able to update __NR_syscalls to
> > (maximum nr + 1) and further trim the '>= (maximum nr + 1)' part of the
> > syscall tables:
> >
> > For example:
> >
> >     sys_call_table [143] = {
> > 	[0 ... 143 - 1] = sys_ni_syscall,
> >         [64] = sys_write,
> >         [93] = sys_exit,
> >         [142] = sys_reboot,
> >     }
> >
> > The >= 143 part of the syscall tables can be trimmed.
> >
> > At the same time, the syscall >= 143 from user space must be ignored
> > from do_trap_ecall_u() of traps.c.
> >
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  arch/riscv/include/asm/unistd.h               |  2 ++
> >  arch/riscv/kernel/Makefile                    |  2 ++
> >  arch/riscv/kernel/syscalls/Makefile           | 22 +++++++++++++++++++
> >  .../kernel/syscalls/compat_syscall_table.c    |  4 ++--
> >  arch/riscv/kernel/syscalls/syscall_table.c    |  4 ++--
> >  5 files changed, 30 insertions(+), 4 deletions(-)
> 
> This bit feels like you are overoptimizing for a corner case:
> there is not much to be gained in terms of memory savings, but
> you add complexity in an area that I feel should be made common
> between architectures.
> 
> I hope to get back to working on consolidating both the
> syscall.tbl input files and the build infrastructure for them
> across architectures, and you make that harder here, so I'd
> prefer you to drop this part, at least until the code is
> shared across all architectures.
>

Agree, let's drop it.

Thanks,
Zhangjin

>     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
