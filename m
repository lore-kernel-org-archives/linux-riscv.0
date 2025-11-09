Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988D5CCFA1A
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wjlLnSc9zquJwXANHNhqObV1ryS7H1phkhZHbcMWqgc=; b=1E6Bx3yP45jsnp29Js3p1tHAyz
	3J5y7QAi5V+r/kS0+JKXQR3trgP6wIYvA/pFYEBn354ailoZXxQBfIli5r28lFzPTWeLAen1SZaOi
	Zab/6+K309QJwqDM5T5BPxZ2CeuvjlIXpbfOc24Mrn2ZTkSSuQJ1MY89dsC6LB5r9YO7Miwi19ZGx
	7jqKTietfUkxvktcGFQi1Sl9iR24pyZn0DX1uuL5VQLG7NaFNjOCsirWDN6bGgM7ZiSUOR5M/N/Px
	FfFNp7F1DfNENsFaA4mU6nocPHMdJgfKDGhH44l1oHbKw1NFsq9OsRfeHWHP0NzkDdFdhhE8TY1vJ
	NxRMSiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvB-00000004RX2-2Mtn;
	Sun, 09 Nov 2025 22:30:05 +0000
Received: from insect.birch.relay.mailchannels.net ([23.83.209.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDv9-00000004RWg-1oIe
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 22:30:04 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 57708920B68;
	Sun, 09 Nov 2025 22:30:02 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-125-91-34.trex-nlb.outbound.svc.cluster.local [100.125.91.34])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8924292173D;
	Sun, 09 Nov 2025 22:29:59 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762727401; a=rsa-sha256;
	cv=none;
	b=sKe63SJNYc76WbcrGxlc1h51/BvblCUkfc50XBw6wnxMRApLClbGCKWyiXuRJPCZZ6QoKT
	dGfPZGTtH0rv8q5UY0VBX1r7mxb6qEuU27Hmuui+8bt423Qg6mFojTt7NQSxTIe9tz4a6a
	FZSwvCDtL64o2k0kEP5y+ljhYQMzzWsfnlH5r0R91d/K702rGlnyGJw+dlvFcEwKBgUmHl
	Xjyn39huN38Nc6mDFnnxywB2T0OEDAIgCkBl/KS+rMl3Oz2YrW9O6HfLiu05U5HItl6ijd
	yW/lZDVNo1UdoHCdy1VAwqQP2KO76JbI1i+ipKwC43d0watTyEx/G5oDq/U2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762727401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wv3nqbaAcoK237kl6M6hgh2lZMBA0q3s8XRwe89wOGs=;
	b=IRW4M9T16UKZ9zLV1xYHFaDgLYUWn8x+e8bLay21g1CkXlqTauzJLEonSBw8r3HCrJfG9c
	7YylPBYUvJ0uMKuuFvX71xILG/a8k54hpy1NHEGMpfLH8jZt7hz0tVvSlZU56KwmpL/sZU
	fY/gMwza5iWXDdxqlsCnIMn3U4cGwI64hdSBIV6kAEjUz/rJKxFoEUZuKkHEY0Uh6FxIfV
	ftjiyg557LjocVp6niWsYYWzx3QCSxg9yx2Q7ffudg+qqucPD90dv3OD/ybIZaXhwRNZhf
	pkEbR9sOJpNACYpiyMh4O9teHtSe0KNQSzYrY88gNEs9glIo9CBrfT5UAGcmjg==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-8jqbh;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Share-Plucky: 086ef3524a27b726_1762727402118_2276427043
X-MC-Loop-Signature: 1762727402118:621653610
X-MC-Ingress-Time: 1762727402118
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.91.34 (trex/7.1.3);
	Sun, 09 Nov 2025 22:30:02 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:6854:e5c6:92e9:8517])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4SCn0jlfzyTZ;
	Sun,  9 Nov 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762727397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wv3nqbaAcoK237kl6M6hgh2lZMBA0q3s8XRwe89wOGs=;
	b=OwejLrMHgpjpmxh8Llx3lMs1iwqIOQkxwjiEbTLi2tJUYG7EjQz0/mDf9cLBv/04PXjJE8
	HOfgcOUnq23XS7aTu4DyDM0pXIMsZss8v1tiY/5Uvxycbo5y6s2IxOmdFzEfu+jKO9uehw
	cNC/SuOu+ggBehxnlqBisFu3vROBRejAul2wVhoVOvjzyX2JzVneBuVeLyOrb1BvftY60H
	IhCYwFJjivS4s/jIwMd1RmXO48cRNkE0En7Pnw9otarfUjVOXvwijgFH7i5YUTCYKZFdEo
	SvaSh1m3Jxc21pChv3AWOMl0gixaizy64sM1W48aj6iM15QmppM0vLYm/j1WcQ==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: riscv: spacemit: Add OrangePi R2S board
Message-ID: <20251109222858.3085488-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun,  9 Nov 2025 22:29:57 +0000 (UTC)
X-CM-Envelope: MS4xfGNh7WIdjgfn/ks19BpJjCp0CGvjY1NqXmeOKi40UGNgCtwcYSeRNGp/79jVy+MnyJLS9VGWt8e7Rz3Xv9doyr8rlensGVr8tGhUXw1ymdZKRo78JDVA nmXh7v5Ovv5mw9MfuJ8KTHqM3HeYry6A5as5CjMcMGYpy5Z6Tmv2itPtv6a77Da3K/magnpxnPUqjejxsHHejwoq/syDW1IgEo1AXQnYz7jo9J7fYf3UuPS5 lPXWtWCe2ksdjyvop2NAAXUkRFnRvV5WM/POq1h40AtfAv8JvK3R2wDtl6PeGim3g6nVW39mwXBNjFWcKEwNdnVGy9PM1RFhTrIuRc4E5Jj8rX5FScRDYLT7 2jufgt7bY2mVDxJU32kcS3V3rEtKTDkKVNy/RpnzcrSu30qakh2pGqK2fWMy+F2leoo72p98TiQdAPlHOH4yk3p/hitYlG1gCCuBwTQtQZFgvChw3ZY1PD0F yN346SrvAD3GPgkgK6zrEhwVBjntWXfUc9ViiBvtBcRu8oup//jKnLHUHutxjGCd0JeQ+A6cyVlkRVLxMOY1mcwN4nWM+QP+YUY581h2hWA1ObFaRn5te79t g5I8Ss2O0cf3CHC6fWKowwoYoiG13fDE3+AWnJORpGjN7EwGoo8Kz5HlTD/yJes23+RvitMZb0/0HkFU1EzE68tUF3cn8ZjoMB2rLZPzT6iVs0tqmXcSIQ/U 7iHqAH/Bw1Q=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=691115e5 a=9hvhlO9olek7/vweJUpOAg==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=ahLzFxuTVLoCwVWoPR8A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_143003_565928_32E35651 
X-CRM114-Status: UNSURE (   5.90  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Document the compatible string for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 52fe39296031..1b2f279d31f9 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -24,6 +24,7 @@ properties:
               - milkv,jupiter
               - spacemit,musepi-pro
               - xunlong,orangepi-rv2
+              - xunlong,orangepi-r2s
           - const: spacemit,k1
 
 additionalProperties: true

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
