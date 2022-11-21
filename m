Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8842C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C59Op9he17nwZjG/ZEa6XdK/Jop73nGDiAA6QuVHNIg=; b=IyKnxUl4GS4/g4
	PSTTAdO0O3QiEI/rUje6DoEdHWdXWRbXugluzdOxLzGrDXtEZKepoQTL3CrBwTOjl8K8OANCeUeTL
	D/cbtDgZSjSPQfWZovu5ZyzWZP7UhchorxFOT0V5StxHU12NU7PkxXMlCXTSpWbzjB00h56hJU49S
	J48pi1mh+2bLtPFmizIMfMqixNb4GMSC0eFR7kgbpLdNkHn/rt4kUu5RdZok9ldH4Xx/vT1/jPIMD
	w/nT758I8MonbEzeCY1T8rVXcWruikaiZ2ZtDlQk9lneO3UDwZk0c2DZTgBv7QBX/5pERKldpQnSt
	mDiphBhPRVjE5Z40a7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGI-009IFJ-FM; Mon, 21 Nov 2022 04:18:26 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owyGF-009IEf-Ex
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 04:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669004296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G/zTHj12pak8TZy5UTM0TaeQXtk29vVSGC77Ga8410ygc1tJCudOK/ls8rSJmkdb1MuGZEbowlwiKT6L8aec4T2BnuG49jDdWmFpeWPLv5D5lXOUU/x6ieqZUOsoDAhu/JdXB5xq1Cd6GnypgtY+XUk1s2trtePXmxDFjOVcbiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669004296; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=GNYADZcnxx6WkArBGDcoffHOVmoS+nSPURWj3RjmA38=; 
	b=U+UG/qLW098b4/hWy9UdQq1jQzj/athmHatXK5dHYhu2ktHml1Up700LbaIL50vb0ilpB5joef/WtT9c11VE860QJxbzfg9dzzRP4B9FKX4UB3kBwNPPW6psGR9m09H+CDj5RNmOmvTsS1neC0eaJeF/PvQdGrlDuFBf1utNF1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669004296;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GNYADZcnxx6WkArBGDcoffHOVmoS+nSPURWj3RjmA38=;
	b=Nvh9uIP3GO3O1ZJkOo9D6kD3qIcR4T7LtgELBttovaK0uP4XVd6Dczfq2N3SXln7
	enfM2yxMJkQiVT3205Z1fHt0poBujbQySD/tvNpnj9Qm7aPLs8XxKIZR7U/LRVuM2i6
	gYRG5FPaz5VT1ZqOrV6DfuOpRJBRDZmp05ziKyKY=
Received: from edelgard.fodlan.icenowy.me (112.94.100.29 [112.94.100.29]) by mx.zohomail.com
	with SMTPS id 1669004294902760.6808277013304; Sun, 20 Nov 2022 20:18:14 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/3] Some DT binding quirks for T-Head C9xx
Date: Mon, 21 Nov 2022 12:17:54 +0800
Message-Id: <20221121041757.418645-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_201823_568993_87738BD8 
X-CRM114-Status: UNSURE (   9.67  )
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

These patchset is just full of DT binding patches related to T-Head
C906/C910. These cores now have an open-source fixed-configuration
edition, which enables everyone to explore with them.

The first patch adds an compatible string set for T-Head CLINT, which is
incompatible with SiFive ones by not having a mtime register. The Linux
CLINT driver, which is only used in M mode now, does not support it at
all -- having a DT binding is for OpenSBI.

The second and third patches are for OpenC906, the open source edition
of C906. They try to add some DT binding strings for it.

By the way, as we discussed in the BoufalloLab series, C906/C910 do not
have so many customizable options for PLIC/CLINT, so maybe we should
not add additional per-SoC-system compatible strings and allow only
"thead,c900-*".

Icenowy Zheng (3):
  dt-bindings: timer: sifive,clint: add comaptibles for T-Head's C9xx
  dt-bindings: timer: sifive,clint: add compatible for OpenC906
  dt-bindings: interrupt-controller: sifive,plic: add OpenC906
    compatible

 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml | 1 +
 .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
