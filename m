Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037D9CFD317
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVTemigr4LIffiFFHO+x+hi7nCStjRJoJAGFJAHyc0k=; b=11cDGYAjShjqxs
	gplgOB7vuouvnnX2xbtWgRrSHQJqIrBBZ1qNHY69muGRUKE66r/GyDHsqW1ZdHhluFtZ5JbxO41ag
	EztUQVnL+UIiO2HQRVX8hb4qEQA6cgc+gECVSEn1Vvd6UgS9gJdAxw7Dnw4d02tsjlKUMarYH2bRq
	lKlsu2NI/RhytPpajjCR6OJaZpItvkW8xpN6Tkb6AMRkMCjC4zTk97POMqZmXgcYmDBkrgIXDCM4x
	RGXI00YVdOnprHda3ht/67XkzOgznKqLz8bqFqyU7E466Q7qnhA1S0sBplIUZ9Kj2Yw2bZKzHX7j+
	h5k2+mGnSB09Ag33mrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDf-0000000BSvc-3R8y;
	Mon, 24 Nov 2025 10:54:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDf-0000000BSuo-0DMZ
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Nov 2025 10:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Dy+F+hKCykPaqJ6R99BwSYKWm6GVFKaTddcik5k44gQ=; b=NnPhznlOycbDIJCSADcVAu/Uup
	1/ocqaTo+/TDl5TcoUqZF0e9HaO6JouQ2pp2TVS3dhMGMkt02hNm0KAb2R7X26+luv5nQIYHz6Zie
	cluLjueSiPGMbiHtumTdFyNkvDPc6fmgfscC7JjBtY14Thm+ccnEw85juqCxyLoxFkYjnRgdGBASU
	al+r+hMAXQp2DZmBY4gTSU5xtuCn2ikjhOpecpU4tLDJqgT70hxMarV5cBkWFUQRGVkum9G3Ib3jc
	5Pjgm+X4OF8iwrhJFGyu9IlbhI8hjx6CG907sOeyfatD94HcRpwCwizFYLLLyUrVPnvOVtVMnmfs/
	CVl63YYw==;
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTM0-00000003S99-0fmt
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 09:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763981664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OIsVpKfcVrxSU2gzPLJqk4yb5n7XUPOjYH5M5eBioR6M5DdFWiT6gHDr1h8zIEhR4f44J1ATEVdfgnOe1kaKUqGpezXjfWQ/eukr5E0Mocf1ItegCe2YCzf0pnrqsCWLqzck1DQhzZSepzbBtL/KNi1HECTC1/0HaeAGzfZe9rs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763981664; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dy+F+hKCykPaqJ6R99BwSYKWm6GVFKaTddcik5k44gQ=; 
	b=khfuFXdODYvBWOi1dGP2MymOU++hJSqmOormJO3wN1Qzwbp435JFWx2yeGRh9CVC7EkeCU5CQbY+QbhysLWKjtpcXljBOecQPAJKBN/sZ2ZSpJpz+0PCoRXtaPmQMYnnSjzXLA1fFF+f1bicE857UIIXXknfqjVDs+Wk2S+FOEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981664;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Dy+F+hKCykPaqJ6R99BwSYKWm6GVFKaTddcik5k44gQ=;
	b=TWWz6X2tNdnd4N9YxF4WFYuHszeONjtMZZTCUUMzJovjYlXCN4Sq8cCRMkWHGK0d
	kilQ7F9dcpbcQW2j1WrSa03sZZy06E++4HbqHQ/LkFzSRqKXw6OYmkfpK3r/K9NcQs3
	YuujuphId2JLDSGByTmnZGEjeM4Z04hDUjYyIEsg/PpqmzU2DnQYpyWwWoU5z83foak
	Y0G6quZTPWCwcepxWCCC8DWA3q6sfy7PNRbApu4f4K7JbDhii9fkueo18XtXLB6r3oY
	SaaZ3ott9UW2Y7RlIKcpgP2Gr4z7usV4lBIz2w9bLR4rH1IhgtQGgyfbM9zAXQ/TX9U
	0o/kOHVEyw==
Received: by mx.zohomail.com with SMTPS id 1763981662595209.19285309448685;
	Mon, 24 Nov 2025 02:54:22 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 9/9] mailmap: map all Icenowy Zheng's mail addresses
Date: Mon, 24 Nov 2025 18:52:26 +0800
Message-ID: <20251124105226.2860845-10-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_095928_481861_0D99C05B 
X-CRM114-Status: UNSURE (   7.59  )
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

Map all mail addresses Icenowy Zheng had used to the personal mailbox
prefixed "uwu".

All these mailboxes, except the one of Sipeed (which was only used
during a summer vacation internship), can accept mails now.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
New patch in v3.

 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d6..f023a0c4e565c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -308,6 +308,10 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Icenowy Zheng <uwu@icenowy.me> <zhengxingda@iscas.ac.cn>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.io>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.xyz>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@sipeed.com>
 Ike Panhc <ikepanhc@gmail.com> <ike.pan@canonical.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@redhat.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@citi.umich.edu>
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
