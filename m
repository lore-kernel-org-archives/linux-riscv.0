Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE75CD3436
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YhVdwZBdrlf4CNYELlaeIQHoJZSYRR3oeatqszDy8R8=; b=Uz1mYO4VLNmo/Z
	M4dErL0Cqv6k4QR3aajCC/RS3aVbs6hyhP097GsFI2yyAB0KMrkI/hhVbJLXoN0cCD41U+AuTI8Qj
	kzoB0FblW28A8E+wSvGM4XCUtyatefzW0dGpdAMCgedEw9y8KEXMLknhT2fBu2/dI2shgMDzr9/7E
	/QB/vKoCq57T6tCkb9h4vGMp16lCjwHvfLTnZq6DgOLrRCPPyHO98iKqSVSbbiCRpr+//In8OikuV
	RsoTLQMS/tcuGfY6kYVHqUHlRhhZypjHgv/kDlsWxhzKhyW0HV9tDeBNNMu1GCb4sK12clkNqe1HY
	f3qYQ7D3k3E5Q1bswksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ18-00000000QGN-3Ls9;
	Wed, 06 May 2026 09:58:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ17-00000000QFe-0oWq
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82F86435D5;
	Wed,  6 May 2026 09:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E674C2BCB8;
	Wed,  6 May 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061488;
	bh=QSMJQ+qo2d/9QKlnpqj/XC1VAZOrvcslyFb4rShhWfo=;
	h=From:To:Cc:Subject:Date:From;
	b=C8+4eyhuvovWq6mc3xqieYOq9rP+hCzGwn0H8Mgh8B99uy5MH/ax2hBokSkgCW+o8
	 eZxZhQD+cT9cai+VpeUww1hPBCUpEZVkRuYSydROOzI4Vx/xV8AgFbIJkccIhgn0rA
	 xvL/tze8Kyir8FhZkIL/f6fNrXTCV5NFPys661tKV4/DgfL2tUU5r4LFQI9NKO+LKI
	 7wzDFYi+zpnGN6HbZY9hleThnNyzfIiYtWZOOzJt0HCxyI3Gm87asYiyxoP2Tmgi/w
	 EWWO6n8bPPgHHedIOY1I51zTeEcVIjacf1e3lTTM2Pmib/meTXzaavoIXuWrfMx3BV
	 /n0WSNKVDuHfQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Date: Wed,  6 May 2026 10:57:38 +0100
Message-ID: <20260506-energize-dramatize-051909e54256@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2283; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vL3K36qzSz+jxyjtup88by9kUgRXxlFkjxJK/EVWVx4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSa1vbz+/sXPt4+nML0KOv1ojrcO6+r3P90V5QT0t 6yYUGSf31HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJFIkzMvROTS2ZUvNc5UWB tbVo2LmGHn1pBv59Cu/togLu1llMP83IMLn4/NKwN1POf7dcvL3xMEO1W1EBp9dX6SIzP7VuduF FnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025809_271691_D9A91E62 
X-CRM114-Status: GOOD (  12.45  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Whipped this up last week, at to a first glance it appears to work,
although the spacemit platform I've used to implement this has very
limited in-tree use of pinctrl so it is hard to be sure.

What I don't love though is how similar the functions
pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
other than which function they in turn call.

Basically, I wanna know if you think that that is acceptable, or if
you'd rather see something that's totally generic between the two
and figures out which foo_dt_subnode_to_map() function to call*,
or convert pinctrl_generic_pins_function_dt_node_to_map() and
pinctrl_generic_pinmux_dt_node_to_map() to wrappers that pass a function
pointer of the appropriate foo_dt_subnode_to_map() to a shared node
parsing function, or some third option that I have not considered.

If you try to apply this, it's on top of Frank's mux series. It's also
here if any of the spacemit-ters want to look at what I did to their
driver:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=spacemit-pinctrl

None of the patches have real commit messages due to this being RFC :)

Cheers,
Conor.

* pinmux/pins + functions/groups + functions I think are the only
  really valid combinations here, so it wouldn't be too difficult to
  arrange that logic.

CC: Linus Walleij <linusw@kernel.org>
CC: Yixun Lan <dlan@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev

Conor Dooley (4):
  pinctrl: generic: change signature of pinctrl_generic_to_map() to pass
    void data
  pinctrl: add new generic groups/function creation function for pinmux
  pinctrl: spacemit: delete check_power()
  pinctrl: spacemit: move over to generic pinmux dt_node_to_map
    implementation

 drivers/pinctrl/pinconf.h             |  20 +++-
 drivers/pinctrl/pinctrl-generic.c     | 139 +++++++++++++++++++++++++-
 drivers/pinctrl/spacemit/pinctrl-k1.c |  70 +++----------
 3 files changed, 164 insertions(+), 65 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
