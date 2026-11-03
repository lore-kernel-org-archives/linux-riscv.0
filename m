Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AA606A32C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNBbK+Es;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MCDQRdDu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFFIM3QB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zH+gQzzFGUOOaYMUIG+vCUFY152g9ie78kdlOzNgU3w=; b=jNBbK+EsnXb96CJSZxohiKIJIj
	yQf5jLTQ4mFDsZnS0Xa7nRI2A5aC3mRFPO6d052e301vMEh3w9UTmFf/3iZV1z3604rmJQwGUN8E7
	Bf007wA0cKQdLlGClpguKd0KphXdf5S8tOlrnYcV5itR5XZqQnActeVA/V6/AQKigiGNNvC7p2tQ7
	OvA56nujYxqIDHNWtwkwuEyusMrbt6EGoo5o3P8PMLnzCMd7DVB7LFOT/vZyIy6eUQxgbh6O5lzcJ
	54hTle9+ASAzcN7nrKZrr3BCDHtoeF8CT8BjAfRVnaGVq/vsLyn2E1lzkw96fmaDp8w/e7ZJbEUN+
	Ie2iW8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMP-00000001f9l-4AtG;
	Tue, 03 Nov 2026 08:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMO-00000001f8J-3TD3
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Nov 2026 08:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=; b=MCDQRdDuU48F8IvbtTe5y2Wc/4
	1A1ybN+2U80IMFne5NlyvA3RsWIx36+9M60bBD6cr6ToIU508O1d8QV1SuBQAA5/tNRjwuTUZg8gT
	4k6VgQy0D2hF9a89uy+zeM6Ji+gRoutESw7ZzJz5E/4Hg4tEVDxaa1F4vViEk7VBfh9mTRKjpbq5I
	gFq+rgiZ74etH21tGbRRyHAxSV+ukdyI0/buU174XMREHvBuMDOQTgUQXhKZ8i3PNms5x+dVyfF1S
	sA+0nwb5T3YX6FL2RkvrUFMK3FQXMpkw32baXSVtzJedShff1ShGthoHYq7urFvV6FHKrz0lbFNo9
	r1RM6xRQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMF-00000000DWD-4BdA
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:09 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso602724a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 00:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696346; x=1794301146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=CFFIM3QBjUl4ShOP2zZT6TO2i/B/N2MieqdXaOtAP8w1NEXWd/vL1U4LwYQ5Ufpo9J
         hw0Cdia7YLkpjvM5rWeyvr2Z1Gh+lawRgCb0UGly1Q361axI4UN++cn2gDAuxdDJrWM1
         ZQEbJsoTjcLnKBnfLgL2K9KiLC/1aFltIIaCt1Id6mfoIAnBGdCBsbi5ve/hdt07BSzl
         74TxyDcPu0xrFEIREqMVbyiJVvuKFenWYu8wYKZKO6quVoHR5PTOiaVLiAfMhxb7bhp/
         3CMzY2JXCddDC3YRqty8FS6AUXa7JsZVJL6Ks7DQPotteolzyFvKMubu6X6d/Sy98WXb
         C46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696346; x=1794301146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=F8nH5hwoqVMniWwwWcv037YJvHG1Q1JtSRK6ApRUeGC7ZdpYHKDm2fUu+R3hTcIJgD
         StMIW01jofZ+W0eCDjqXjnGARv1h8mtFIJesavr6KXobhaU6XhL5OTNJUkVqzO0dDW4H
         WbOFChirkwCIH6WIzx51fTkytEKFJyvel9zjV7e/rMUDMulYpshSTrJGqGX1Kdj6sx+s
         ZueB6vP3jQIv86aosxChJc+6qoeNXhrVlSnpqU87oJYhdX/rPeDH0V4AkLFALVqmDerY
         AeLH2UwKZ7dm/uragaiWGBdoN+cvNdgP/dqEZRHgebIT0ssLe4P+/dFZfzPec7ejD/9j
         Pzqw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Juay1yMKgZJ++y/VMKgysq105DTyF+9qxsinu/IAyoPBPPW/DenqkoxpGksft0xsA37AkFhCJK7ksA==@lists.infradead.org
X-Gm-Message-State: APuU4Z//agnQiOVR+Gr6majPLZF5XSnexyXFY/O8Fyb/+7A8EZDopikI
	hGKrcjV7Ls30UCZ+ml2bj9pOmhTXyMdbpoZOOpDVlWtjYfrY7Y0w5E3B
X-Gm-Gg: AYBFou2MsWxJrR25EzMluXg/hM+hG6Zu2faDF/VoEHjKkHZdL0UrBMYz5CT89UmUDi7
	qIjLX0rgOtaNLJqDMxh54J9sLFAT3maXRCY3K8PaHWw10ch28c+82P2LslXvKXQElA9dUVaZiM2
	dhF5wDKjS+3RKHeCtBAGkRLIWmuU/E9EwO/kOzakH2iXzd+LcexOlK3rOq3sH71jpHLTnLioxmc
	hct3SIudIGhPwB+4qsy98TBViJ5ik7D1qdCee8lwlUOTvGUWAVy09Caae9GdHxxuu5DHr/YM61V
	zxLcY5IpGTynMsbs45hlTw+ehvFVG7ptvKYbGtOU9nbXNDSMV9A+9ni4L1swd4tNBsHjLPUnodV
	xZSQtypUOJBe0RHxOfJOItodi7oIGBEMV69xZqLDvdP/56JiUTd3MTYowuaC7mWU8Qyc5qP0rae
	99Mx5V3mr2vkxj/lxA2LcGNemp9IzD2kUcKkX4c45SqagpTjQT6Xch6FyGEHvkf4Hi4pJX5EyU1
	f/h0DX0qgYf+aNCvvzMAmfzrCRjQyoS1sBq3dbu4bSEccLiEPoZFcPpY2EvEPP91f9Xxjm1z7w0
	5me0THClS5kKk6EK/7PT+B7mvkej7ECAINzvkWv1kvC92y3LjTL3BabJSrPZC8y2Cewv/MfsavU
	hzo1JBLBzgaMR
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3ae89626108mr17481897a91.2.1793696345686;
        Tue, 03 Nov 2026 00:59:05 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:04 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch properties
Date: Tue,  3 Nov 2026 16:58:45 +0800
Message-ID: <20261103085847.338613-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_085908_388315_9F12823B 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB role on CV18XX/SG200X is selected by the ID override in the top
syscon, which belongs to this PHY, so the PHY is what provides the role
switch.

Allow usb-role-switch and role-switch-default-mode on the PHY node. The
default mode only has a meaning when the role switch is present.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
index 2ff8f85d0282..a1d164686b07 100644
--- a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -34,6 +34,15 @@ properties:
   resets:
     maxItems: 1
 
+  usb-role-switch:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/usb-role-switch
+
+  role-switch-default-mode:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/role-switch-default-mode
+
+dependencies:
+  role-switch-default-mode: [ usb-role-switch ]
+
 required:
   - compatible
   - "#phy-cells"
@@ -51,4 +60,6 @@ examples:
       clocks = <&clk 93>, <&clk 94>, <&clk 95>;
       clock-names = "app", "stb", "lpm";
       resets = <&rst 58>;
+      usb-role-switch;
+      role-switch-default-mode = "peripheral";
     };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
