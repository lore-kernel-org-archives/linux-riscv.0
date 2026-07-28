Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97362C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 01:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PM/Z6OyECNZOSj6XqBRm1CTxwHKXUBNSOpFx9UjnffI=; b=jy7r3ne4facmwu
	f2upRyqBUbzCvOspVyMg+KMoLGwklbSDiBQkEoQIJaNeW/gQmeErO0yOg1/MmsbBaZi0tqcNqcv6i
	O+Iz9GLFoj66JQsdCx4XUm00rU/NG5DjMPd9F5jlrI7Vv0JOgXjtRUYuz9qTf3lydUxYoApbwHLRx
	/CQ0XksyeUiSz+hBhfflZNgJusGjOkEz5GS85yhDO+KxmtemdbLsuct8e7BO+s9VIHx12sEm7f7M3
	ucw5BVP174/X5ITPo9GdnNgC9QjxsUFgSGXAIMUpKCblu946jnSTs9/Vsv2UTI7OMp2SIJpDOziiv
	wyA+BAVpyL7HrdowsFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWGw-00000004AG3-1sME;
	Tue, 28 Jul 2026 01:06:18 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWGt-00000004AEm-1AHS
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 01:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785200726;
	bh=6cap9a2BbfmYlaJIhCTSwao4KweqQOkNFoHm+CXtfQs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jFASUZ5obEbzFnsF2x5oB/r4yh9bT5Tl9dXl/ifOnBcobg+v6qePr+Pu9N3AGm4ll
	 6BtXdvm2uzktb1DgschRDbIWUohiNrrs7JwLrQn+yosjstiB4EzgdSjdjbM40behyM
	 Jr/S9hdMiDgxwGGION+6/p/vh/TNueKmMvxGd6fc=
X-QQ-mid: esmtpsz20t1785200718tda0b9dd6
X-QQ-Originating-IP: WAyoVSiUnM+sYMQp6Xu4ZdivdB7TbtRNuRU9j6RRMMM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 09:05:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5765152889471409520
From: Sterling-Ash <liangbaihui@linux.spacemit.com>
To: Frank Binns <frank.binns@imgtec.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 0/2] drm/imagination: support GPU probe without power-domains
Date: Tue, 28 Jul 2026 09:05:11 +0800
Message-Id: <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MEnmemzsw09gbmObJ7nVJm3oMj+ouwfy+NO61Ns86Iqo+j7NNKVt+Jz7
	3mmSasm710mCIjdwUb6boFQCFyCoX5ETIuERgv4cjn2pTomq03dyx07m45556IrbUYkYQfw
	oeE137gb81FDQo+/u8pObjT8prRAcFcuMzA3vnDbZMD+rXboshI/bKv/FvxMCkvdar8xeOE
	RalH7V5SBj2T740HQdHgehFNBFCDy/Y3qdN5qUA/3A6R8aeTysBHwld/oaLP0vb6FFrfaaD
	N1OoOJ6ThPnf5E6jSaj5dOcF0iv/dcXLPP/Rrol+A9VGsdiSqA1FWEaJOBp4q0aOENCJFJT
	DeB3szInArK3gnvGxpXkgVmVuuMsNXBv5jyctTkacZrOoeBZPdjjLFQ7mNVIKLYzeBdm3Y4
	fCEq2WE5eYe+CCZaYT3DtLt1yvvPvnjV/GnSYrbxDgu/JfeW2HV0PRiedg2Eaep95Y25h8Q
	TawwRs7XlyRmClUzHLFQPWxmdzy6GWayLRUTkL6ssEazYWkq8EIEZnPcBfuoYGq86Oa/7pI
	AbUvwQpGuCQWrTyAO4TkRBMacceMoeVr6pJAzNjHTf9Gh5mNV5Nr7VlD988Pn/fXGx2kB5Y
	CZE3PH4dkhrQazF7n1yhnPYnTp3OU9mGAk/+IJGIfsXT96KObO0/fBRPRDrXGbdKkMIx21V
	u4VBxMEK6Rk9JqtwuaCjH0NJ9E2UPq/4hYkNLZJecjJmVn21hsXthSzAZlZJEFz9F4K43aH
	dzM0pDi/PI8FtboCBKQKGILwINaRNneMCRvbajnLtmpIN2qTPkJed9eX0sNH+p8sFS8wBWD
	2I0UT4AOKcEGBznn7NymOzl/GvdgDDsgdAWRfGqq/wqYuy/U8m0iHSXlE8Su+5P//Gk8D7H
	9EqPok4V6BnOqkO6ariNvhGY4ZQrylopy7jqVOcN1HoKv5yAprYTLkktg5buZnFgYXx/9Sz
	LalXqXDFwHH7l3SLBPhQnXl+BrtUgt+qL+gsUwPF3mMnBYYaFdMRkJaGB
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_180615_989527_624336D8 
X-CRM114-Status: UNSURE (   8.65  )
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

This v3 addresses an automated ("Sashiko AI") review comment on v2 [2]:
spacemit,k3-gpu didn't match any "if" block constraining clocks, so it
fell back to this schema's general 1-3 item range, which would have
let an invalid DT with 2 or 3 clocks pass validation even though this
platform only ever has one. Patch 1 now also adds spacemit,k3-gpu to
the existing ti,am62-gpu/ti,am62p-gpu/ti,j721s2-gpu "if" block that
restricts clocks to a single entry, since K3 has the same requirement.
See the v3 note under patch 1 for details.

v2 reordered and extended the earlier standalone pvr_power.c change
per Alessio's review [1].

On the SpacemiT K3 SoC, the GPU power domain is enabled once by the
bootloader before Linux boots and is neither modelled nor switched by
Linux at runtime.

As pointed out in review, img,powervr-rogue.yaml currently has no
compatible entry this platform's GPU can use, so patch 1 adds one
(spacemit,k3-gpu + img,img-bxm-4-64 + img,img-rogue) as its own oneOf
entry, distinct from thead,th1520-gpu since the two differ in clock
requirements. This new compatible doesn't match any "if" block that
constrains power-domains, so that property falls back to the schema's
default (optional) behaviour for it -- no additional required/false
override is needed.

Patch 2 is the previously-sent driver change: pvr_power_domains_init()
treats a missing "power-domains" property as "nothing to attach"
instead of failing probe with -ENOENT.

[1] https://lore.kernel.org/all/75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com/
[2] https://sashiko.dev/#/patchset/20260727012231.1025210-1-baihui.liang@spacemit.com?part=1

Sterling-Ash (2):
  dt-bindings: gpu: img,powervr-rogue: add spacemit,k3-gpu
  drm/imagination: allow probe when no power-domains are described

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml       | 6 ++++++
 drivers/gpu/drm/imagination/pvr_power.c                  | 9 +++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
