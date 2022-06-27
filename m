Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075DDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 05:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TvUhqCK03VD25bSvKsxAM3/v+kPXeHcOnBvmmRLLl1c=; b=iZQWgq4/ov3F1J
	lvH9KdqfhBmk7vcS/Q5jXap94T3q2V7ApCKsVqb/F+BJ+9rL6i+KNk1E4269e5ZMgFU0+B5u9XtWS
	YnLo7/8Ae+JblXdzYEWONa3k0qmPnSCe95JhRv7awsFLqLvzs9ED+zGCfqH9zJPXF0/gOmzAf2Ymq
	FLNkTETov+3+wBBjkfR2OmyWsMBABtNEkZhwfY5qOpzuWFkmpVrWETPE0yG3ON7AZPfMFkFtxJ4o5
	lDaeuuzkfjR5ItTz0wD2DqSQZDXWdwJyoCz0h6yG7eooIdLNoBkI11fuuS1uyHHjTIOrBPsZi/LIZ
	B+aESfszWirgEwdVq/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hD9-00Fj4p-O1; Mon, 27 Jun 2022 05:22:59 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5h3U-00FcVV-Md
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 05:13:02 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C3E545C00FC;
	Mon, 27 Jun 2022 01:12:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 27 Jun 2022 01:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1656306779; x=1656393179; bh=dkueX+p0HF
	YN1z2kkJI5unMCYjLIq2dF7wkxiC1Hy0g=; b=XQ6P+XfnaI1AmNkhMSzJl0yEyP
	WFde2eM+YF5jN2Z2CEJ+uYF+sFJ4OLTgq3VlHjdJrExFf2QP9CZjGQuW1rkU61Av
	L18Ttp5KonJEj5ce3vUQ3xb4cIpfZXIE74kh/+brUn0AUS3iLTjBPBUC7pzds/k+
	t6Mnm3a/jSh7Q7F0qmo7lzvlVcQnFYVI0e9Oe7PGNuLGVOsxOzNHEmOnJYfZC7zJ
	Yd+tTSxYqr0dR2lay4Xi4GdYab4ghofuQUwlRMNnkSEfaodBrefb9Ap9xrP1ehyG
	kKz63rpNi1WK0W9kV6FG7Giq78hMmaqXryxvtjmmDscZPl8sk/Kz4A8j12xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1656306779; x=1656393179; bh=dkueX+p0HFYN1
	z2kkJI5unMCYjLIq2dF7wkxiC1Hy0g=; b=t6SDsjptSrlFMiBuvnxyMDicrWH4T
	H2tTDzHLzKigA7+PGp3tkoEZTiBLb9wLGItuKAAyALZtI8VJyql5WBm9n3M7EYp0
	KRv3T1Wq/n8e5cJP3FzZPKvHlf0pR7rBBBt7xSxR8whQQuLKYcBZcKuNIYgpX92U
	+EpSi/mgAl7u9DfSmxMm3CyIHcxsCcEdXn2OsDIyytrXKFIf3kTFzHNIVURmB7yS
	soHAcGiv7grHn5sl19XTmiYLfOMgEj1suynJoAjnI61NtqzfKUFqV76IzY7W2gCi
	3mE/KrpChugBABaXb4SrAACcTUGD+8SVAqkdYf9bCYYA/lwImloPNV67g==
X-ME-Sender: <xms:Wjy5YtpA9epOY7jZ_4B-DR82wBgYNd4GGXnf-BMFySik5TzFf4mmYg>
    <xme:Wjy5YvqUnn-zKWPUUrTZjHD_EQtnM6H43HopfooJF_hvoKmb-t7GuMRTRTK09HjaK
    KMLFsPAT-Ui91-HbA>
X-ME-Received: <xmr:Wjy5YqNiNuohVTQy4gxOkGs_oPPNA3Ynyttx-hnxTQklps_eWsRg5K7f1JxpjsMdMU7LMVonZtL1li-f1XLyIeQZyt6ftitQbg5WSlZ5KGiwUW5iXhwlPvhLV3RuI_8LvjfTdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeefkedvudekfeehgffgteekieehhfekfeegteefgfduhfffvdehvdet
    keegfefgteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:Wjy5Yo7d7SIKWlSRqO19nVFNUmQh1LKTD_zoGC84hPqr1qcHGrCOmQ>
    <xmx:Wjy5Ys6tgDOtNUXgKHycW4cLryTMwwpkf4KCOcLWWfGybqEZZucDHg>
    <xmx:Wjy5Ygixv-gXz66WozkAIBWqBuzeRgc7Cn4HSOQq_Ivd7UITaVqXjQ>
    <xmx:Wzy5YorWnMzBB7hupMhVjcJv19e4QLc_36RXBJ4C6vHVhIrycYGD-Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 01:12:57 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling
Date: Mon, 27 Jun 2022 00:12:54 -0500
Message-Id: <20220627051257.38543-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_221301_092724_27889902 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

This is a follow-up to the series "[PATCH v2 0/2] Add PLIC support for
Renesas RZ/Five SoC"[1].

The change made there is also needed for the already-supported T-HEAD
C9xx PLIC. So this binding change is necessary before I can send the
Allwinner D1 devicetree.

[1]: https://lore.kernel.org/linux-riscv/20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Changes in v1:
 - Use a flag for enabling the changes instead of a variant ID
 - Use handle_edge_irq instead of handle_fasteoi_ack_irq
 - Do not set the handler name, as RISC-V selects GENERIC_IRQ_SHOW_LEVEL

Samuel Holland (3):
  dt-bindings: interrupt-controller: Require trigger type for T-HEAD
    PLIC
  irqchip/sifive-plic: Name the chip more generically
  irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling

 .../sifive,plic-1.0.0.yaml                    | 31 ++++++-
 drivers/irqchip/irq-sifive-plic.c             | 91 +++++++++++++++++--
 2 files changed, 108 insertions(+), 14 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
