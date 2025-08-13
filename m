Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9429C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs174+iveAUl23K3eViGckS4k5+8Li1VtEyvMmO5nwM=; b=X8hW4JEpxNQhS1
	ryN1m8tWH+vZZFXZGBGgs4rgiE/jGrhWQI+2trv0+OEZRgjTfoa306otwfBsciv2y/i7Tvv+wf6ZR
	IDS1or6yfxg0NQtDA3BksEMBP7GJhqmo7fb1StbSqzvCnBSYu2eI1zAUKceeCfYAxogCXD5lidE78
	jl00JnerBVt5Y+eGQM0rXvcY16exxZDzRZ7sCH+fKqXg+Y08Tb/7L6hdcRj+vOMY2dQRK5amTqyok
	izG9/fTfOCfAoxNHZ1ts3rXBn9Kfic0GNajbchtv1jn84V6xhNGuewtynfD078KwzO6VaqpqbuvyC
	BkGgisIqd3wyKZ8yvAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7hs-0000000DD8u-1w57;
	Wed, 13 Aug 2025 09:23:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7hp-0000000DD7L-10Wj
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 09:23:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b7910123a0so5675372f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755077015; x=1755681815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=ZXlQoLdMfue5ki4kY82oqqXN+jXh/K2+iGWjtWl9NYxeJ3JApEwCQYa/0T9N7tm39K
         MzSw+taYN9az/Z2t4cDwrP4bngeXuyao+Vz1++EuOTakPCQwpxJoPek+3VYhJmcrjVb2
         bLJShzWjvRCcM1kFxKGrVU+aob0T0EC+93F6LyWJa4ZfxMYbsbVkzHVfBYXqG7d5IXmr
         hzA3szmrh//1Z2kHvgse3h/t08X2w88QehTrUj7dx0kjVE6av+h2Qx7psmmx9KahGtvb
         69VK4XQUV6TCVaC/bzaCre7n35KjcJwwegKUjt2JHtKnRbFCKP1ObDOkI6fuTEUwqMAB
         uh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755077015; x=1755681815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV/LyU13FVZD+Ygh9a2dJ4SQHfL+zi8sFF76wcqrPxw=;
        b=D0JLTWVrt8bwCgdzRGhvc01Xgum8VWibi/TIPpdLALzJSnDDzmB/X/UWYN6ixIJGN6
         mh4Hjxzoaio9YQaWpq6dGClujiH0CHUwn3q0x08zSrg4WDo1kwy8emmyVzbcGm+mkdSg
         OgHp201HPJgORR+9+YQBnd3KGKv9VVI9qdkW63htIY5PiCY4NpX4HTF/d3QHYE+EkYLS
         13Ky5DcchIwEJ6rMXwpkA+oUg9aSbNZAUFshzaMyVkP0yFVHG1Q6LWW6Ib/635hihtBz
         BSMbVzBTODCxaYAnngI2zbT6vgboFq1gWNEi6cTWXH2Czcvgvmhv+YR1eyK7qhG2XxxN
         iR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3KrNs9VSxUXIgiht7d8HW2UcCAiuHKMQIiXvS43qz3z2sPLXO/0yccZScqLhRe/RK9TQB5Jo2rIzoug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2aZJLtdjF3i3uPV5N8iUNXRY93iwKrb3opxEa0JitNLpazQiR
	5huBmKbfXm5eeu5Jt70BhIRtVfL30leeJZr0sSb+cTV0AIczZpsC+rVPkQsjkjcd0TU=
X-Gm-Gg: ASbGnctt3IL0jj71AKqUf6Fsd28eycQmcDlKLdjbCupgqkmnj9AXyJozc5g1PfkMd5N
	3ZCAQit0EZKrBruCuuybdF8jcGcbecP6ZgYBhtNcRBpC+Ctr9RGPJFRcmGC2/FIRecTzKQ5q+zD
	UJytatz+q+jnB7UkTu1UnQawyNoUKA8hkNfPKVwIur0MF+xj9MKmscEEIhhlj2xIpNbaHXkI7+G
	5z7XLvFzQ/oOurKFWJuaECbIFVlGjEXuD16u54MqgewRj65DWp7uWa4s9buPYJLFe18qK7jtIBl
	NjSgnhSZjulnniW5CUt43v/MlVQLgYjPISPQU6NjNgqJrQPmJGW04K6qOBuGr3T/cDEKYsM7NEs
	GeKRFdmNsiXDqBF6BMxNvifyQNPHagdMeou3w1QS1fIXF7B+KTw==
X-Google-Smtp-Source: AGHT+IEWxoI/kRzm9XJtVKTQJfagZa2jXeR/JqY3ScAS+RcLcnu42mBz4ZP0ExrShNWcggbJ1f56TQ==
X-Received: by 2002:a05:600c:4e15:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45a16b73703mr16081835e9.26.1755077015065;
        Wed, 13 Aug 2025 02:23:35 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:d33c:e682:2af6:3c3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm47966077f8f.4.2025.08.13.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:23:34 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
Date: Wed, 13 Aug 2025 11:22:39 +0200
Message-ID: <20250813092240.180333-2-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_022337_513568_DAFBF8E0 
X-CRM114-Status: UNSURE (   8.25  )
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

Document the compatible string for the OrangePi RV2 board [1]. The board
is described as using the Ky X1 SoC, which, based on available downstream
sources and testing, appears to be identical or very closely related to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v3: Improved changelog
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 077b94f10dca..c56b62a6299a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - xunlong,orangepi-rv2
           - const: spacemit,k1
 
 additionalProperties: true
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
