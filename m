Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4CCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvArNHjD9XZVS/eoRpe8BDp4e3fK7MYehpw/l8FIai0=; b=HV8ndiqxhdoDQY
	cXksLQTu52zwof4QPf0e+rnmXt/imYuiCZHUrA13/hEoUTyzzsi05tXlb+Cm4o7tn6n5nMV2H93kA
	jkGOZEIIFzlDJ6N53VUilC4/Kx9LyUA3cKXysweytNXDbKxazH83O3veSsdVKsNb6r1ggLACo6rrC
	wmZVAzguTwAB8ZwiGPkoFpDnSWyWe6QP1Gw1zcir+wA/O6pB65tKoazg1hgz4MuuAYpx0+DnKbPtj
	MyttbC/ilJDMFi2daYywymPKQQzuTYnYgzU4JVcQW9S3NcMZwPFJqSffiG7WYMikO49yk5fsxy13j
	2RqC7i5IbpGo+7P5HLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMih-0000000AQHH-0SN8;
	Fri, 22 May 2026 10:03:07 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMie-0000000AQGL-0F6W
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 10:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779444173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xc0m69owLNfANcQY0LWVnc1BjlfPQ9WXnXGvbMG23jXlQkfx0kFPTtrKMh+7aZZHAZjb7sRgbZAY8y6DPco7B85OILacZI1bDxaVTiE/tv3jCqoaPD92ZBUVVbwnRx4W4UD0PGCIaUSl4fpp8wyeJY8iYZSJ/Sd1dASMORUUbf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779444173; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AlUtXwWUEIpdy2pCmMQSyi1r/hlhyzAXZ22qS4CeVmI=; 
	b=aFtn+ZYpgQ2TYqRDwY3yFungqxXxXE2ovsV8LpzYaTExcTNMv0LFdwUhyHNJyNP/OvVedhWN3hEFjRxvLv4Ia63N39hs8pD8aklg9Skbbxjf/nPdSnX4zsFUsCzVVZr8bLF0KXQbDq0L/TiRmrh2LRtxtMdn19QziMpNOrEQLvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779444173;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AlUtXwWUEIpdy2pCmMQSyi1r/hlhyzAXZ22qS4CeVmI=;
	b=cdUwSwzbyCrCxMfGiqenriZvbjLAOoCA6S+BIhN7a39Fr4cMlqmehsjDjiviHkt4
	xql0k9RSpo4YtFWZ6JI2ZDTqi0qiqLLNsn4mnzN0abK7Do2sUj0viiAo0jjT+/enwNB
	FonfdsuhPmsfJZ8LaZdtW1YIwdcE4pJdHSUYrPG4=
Received: by mx.zohomail.com with SMTPS id 1779444171827541.6484481209804;
	Fri, 22 May 2026 03:02:51 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 22 May 2026 18:01:33 +0800
Subject: [PATCH 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
MIME-Version: 1.0
Message-Id: <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
In-Reply-To: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444139; l=1196;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=z5N+OVVT6EV6yZfhuO94zkxdbEVGsxfaKjRVmwzsiWI=;
 b=cFHT3CkVUnmxwXwbI2bSYm2w/plb8ldyYCcHXucbIdz18H/HUccbB3xs7gEJgHDcm8RLfhIqq
 d0uQH7WwjlXB6TuGOTOm7kordIbplY34lEglG9GVzBIq2s0zFYwvHEK
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030304_692402_4C0D1AFB 
X-CRM114-Status: UNSURE (   7.27  )
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

The Banana Pi BPI-CM6 IO board consists of the BPI-CM6 compute module
plugged into an IO carrier board, which is used for evaluation and
development.

The core CM6 module is based on the SpacemiT K1 SoC and provides PMIC,
DDR, the eth0 PHY and wireless connectivity. The carrier board extends
this by adding the eth1 PHY and external interfaces including Ethernet,
PCIe M.2, USB, MicroSD, QSPI, and serial console connectivity.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index af8030242bdc..3e868383eb4a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -19,6 +19,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-cm6-io
+          - const: bananapi,bpi-cm6
+          - const: spacemit,k1
       - items:
           - enum:
               - bananapi,bpi-f3

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
