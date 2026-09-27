Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C044BC9832A
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPBbK+W+kbyuqFxqTQvWM/w1N32M5Gsb0qNNmxzmPIg=; b=IoSaA5bpRFd6Fh
	FQzdBxQkBaKJfO5+KVetlVPPpMtIdpfkySWn3OP/2DCP9PglN5b2ZJYJvrKNklRn+E3MpvE5SqPed
	t9PQdQUhqfFf8RARUKuHIOLRloWScRTWts6aSloG5xowbd2keVr2hmEJQOINuKfEnygS9r+hKqiJn
	jMVDfigl7DW58y/Xj7w4W4gY5prvkauqx8gulDdH+b/9tidAcvkS6MjSFAmVicR7gQJugBmyVgAEb
	qCdrAtAfUgFXfjHNa51eZea//Zw6nD8berFmE95sA7DnkIGlWXMmlXRbksZ/Rf2D9zTIfiYRjdefY
	tb+vDYHB0P+lWELxA33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4e-0000000Fxgx-1UTg;
	Sun, 27 Sep 2026 02:57:08 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4R-0000000FxZW-2SLe
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:57 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd4b43b20bso8039445ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477815; x=1791082615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=hIye7C3rexDGDQdK+EnHU+tbnMQhSPbfapqUlw58Njy3dPvwtITxPBZIZYgt6x6oJx
         sY5Bh13TV+NWielI1D5sIS8F27YWX+f0sXXyfEu0Uzju+77s47mFeBVgn3sOUCYXskcg
         fqK649qit3NGm+Lp1fdyrb8TPTKz1XJoKoUVBqEv9iWXKV8UTsc6Qf0V7lLKSr6MB1lD
         d3+H9GFSiIjXW9u9gT63RGkO6h8yNw+eJUOtUbjbkJf0vynK6WSXas5sZpfHQSyE1hYY
         12/2+niDcDA9hOoMCY9TccW0NGt/xbj4DOb7MsK56UqGMy1MQEwcsbETdy39LAaavryR
         OgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477815; x=1791082615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=O0T/y3puRSfpT4vfZscP9eTocELNWS+25WVpcbT9IVYMltG0cfYPpiurDc/MGBk3wY
         jSD9mykf8nxPyBOYgSlrez+DNjAsagZIvInYLWzb+TZ5Lt2Os8n/RNCreNswld+yhw/T
         3LZ5gU7wLrem85oGOhHrQlMO/78HdhTn1bAbsrUFB+HnjkzHlszHy4SO9u0cQSIdawcK
         aanIyZDu24B4xDBmmNwUpPTexfnxITj+a9ULuLJrAIIxvxSz2yTm3iZRS/GuMMXOr/8I
         TMjUQJ1q267Q17Ew0K+85tJxAG2wcmrvubcxwEH5DbggeNZLKoFBQ8V/hLG0NSKEk35A
         hesw==
X-Forwarded-Encrypted: i=1; AKwUvBzJEyj8g3rnDHKN7Mg/GQQCuYTVIiW3XMar06HNBq4o7IzxMk/bZawrQHWUlxcPo0Icgs/iBvrKnRGt+Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYIMLkY77XRsBZ7x3hq4NCyOG296TGdhQw9ZXRzYXE/CpHJKBD41
	WSz5qvc4e1pgjs3mqlubTpdvtkEq60Y2PotGTdxJwD7dgsErOJ0AUUju4Z47p4dQnbHv
X-Gm-Gg: AYBFou10UCYCovQSv3D+D6kXXTxU5piWhVLsZJ8dl8xaqh3E0LD8vBUi0upKDvgPdZf
	xtXtbMMdYfAS+Gi5LEq2W5wGQttMvSpmuxYfcyv3PAB9eZlGMaBCysiK8krxrwJn+9rHyLj9XV2
	fCJ7F5ytGi0WT0AlPhNes4huhE6anYzsr8/ytCTay7Itvn9AknQ75zH83e1nsG3qAGGVCafUEvx
	7YB2DLx4HsXjSzoMG2QGL66mHS9wKT70gw3gxNDZT4RWWammr814qGyuOiQQpItutM6iouOxSb9
	V0399dmNOWGWzkttkDVRxo1zibX7obq8Bd2IVPsC/zHFeDMSsn2FZXDVvTTw0Zmie+mINYUxxEN
	g/bwbhHqoYwa2GqvQBDyIcaXOaUp1GoaQPnmdEK58gK8Ka+6JjYGLsHBo2JUr58cJNdP521DMCa
	ChsQaDkX9eHpoh2A5Of6X7S1HsMLh/o6gWo6WbnB17HnFK/Wkt4OGAcqynCuq5yUBwbknLMNKuf
	J1E
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr80615525ad.42.1790477814644;
        Sat, 26 Sep 2026 19:56:54 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:52 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Sun, 27 Sep 2026 09:56:26 +0700
Message-Id: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195655_629655_20E880D5 
X-CRM114-Status: UNSURE (   8.30  )
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

Add the hardware spinlock of the D1 and T113. It goes in
sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
has no spinlock in its memory map.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index 3b077dc086..228cc5c074 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
 			clock-names = "hosc", "losc";
 			status = "reserved";
 		};
+
+		hwlock: hwlock@3005000 {
+			compatible = "allwinner,sun20i-d1-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x3005000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			#hwlock-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
