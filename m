Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A87CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndfWjnoghScr7d8+Iw1YCQWzFoSzqePcVIQjdoHsW2Q=; b=37iq8WwW0BuDpz
	2xW9X+lf6zFsEk256Bx5B/Kx7PrImqH0Pz9Sn1V+oMVnOjVk+Q34Y8Myf+fOacxjsfXgWjR2BcKUh
	msJyAjc29broblb7njYBAQLbQ+sXjoBEhW0hHvahGij6zqNYlbmCPx/9qWBQ3WBAqGDlP2EYSxWbZ
	hBW90UVcEZnNCvZZ5J2nFVVRFZwYmFEao++SPNfZ8I1+AlxsujUehnj/3OEBAEXkiLW/jDLDpH98Z
	+TtJewlnAz0mJTusNjtolRXWzh+8TpeeNYUxj8jws0ODvz9ch3W+kvvDGFzm5zgjvVXX3BftmyBQ0
	CGpYtZ9rilLRtrVRWrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIg-0000000E1vO-2sSd;
	Mon, 27 Oct 2025 13:30:18 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIe-0000000E1u5-1EUv
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:17 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-431d2ca8323so26020745ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571815; x=1762176615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=kKMZ+gpJ10L6vjYNfPdACXS8UpU85BdlRfgEbh8Spw9koiw6S69Y0lSuBTY9Yc3zO0
         H1Xyp+g3pdFfeDlYpQtrRbSKoODgOjbZWB/Qc5iuAWDTBy9Cu0fxx4OQGeDxExuJzxX5
         ZlPI6SWjqXbC+mj3gECJ1qigGE6EOX4bh6dG1w0qcSVpV2YZhTfGjCWDLuTxkAWJgiee
         HYMktDqANuywxI9sSaq+KaX6l4cHwowEd6BqERFVJdv4j2d2XDZDJfkwnijvhzQZvnFZ
         DSQkKM4VrDZcwZWdvkT9jAGj2gzZIspoE3+ekUkHa/P5f3JuH54BmEaJT0VPdiY2Jd5Y
         qtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571815; x=1762176615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtUb4xhiKPpq0C8FtRKPFcwQ9IWnX8JOlp4x+Bp+m94=;
        b=VuDFhQOvrYhYyUvaxMtkggPlvnLJHefaDFjqpk0oFnJpUaoPRwQOZs+pH96JIebsHV
         e5KJrzrEmEziw9mpENFp/d43iimLkVwKzowag0cv6zlB8lV8zk28i2uf61kRF0Wuj8jT
         afWZFrINz/3V72Wy24IvBHn95AS0GSRvreugDUEPNEP6anCZKVQ9uUL7NYQji186bAed
         BYQ/ECrQNaGn0sumzrY3f2RkHWMhippqumHKx0U4JJW25flgEwXPyiuckFx+VQKHiKkZ
         EvNpaZ5n5L3PKESBJv+0GrrXV8DogcM+6eHfqDjIVbMQW58ebndwlR45r4znRIlx9WWk
         iF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVLZ3jkczSDPjWjOVlJ3jLv68ddSW9BUrevttZQYaJ2DHa9QDEOnluyCnQaYvZ0bE3olg8Keh3TWrxhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/D6QiLTeTpVqXUpi1NK/8dcfi9ft3FrZhpCq8v8rL938fO+qL
	LcGGcEQYSESiHW/TPCDmhDs+pTZ2q253ciLJH/CZ/PaWmoCa4H4XKzuEHY+HNqv0FFM=
X-Gm-Gg: ASbGncu89hJZSYy+7KPPu9HLccJ2ZcMx/eZE7tuH3hBMwCtDLYyUb9WYh9uKymzk4Xb
	T47Dm7YKiHugh3w12qYanz7bjLlFyNDHi/nZRlDlJNytBdspBdUMp+KpIFKu+FlmUZY7rt/gc3M
	C2/3AcmzjY8wkwKGWLcCP/k+/Wst0w5gO8ZNqY4mAsIHmYR6jaJ2Z4YzP8QY+I8QK7lVwbcOUHi
	MsVEGitPSqw7uSzxjUY6D3Off5YBSDRxjC5v+8ghpvCazC9SfSoUQO+9yIF0SIPv1TQsu2h6X5l
	P5v3sqDTuVwUDUfld0FGQaC9XO0HxOQP35R1xiUxabEC9U2rPyaSTNH2Pze7DyqYx3pAWAmXmc6
	NLG+Jo+zxo/Qd9DD0iN+nQuVQWSqfIewZh0/SXGRKZEnnQBd6JWOtGe+cAWAoEbLPhBBcW6xwpw
	aJ4vVo4zAbUMX/b69Y7HYjDNE1aWxXEjL6Sv4wofwVuaxW+kSOcRZ4XQ==
X-Google-Smtp-Source: AGHT+IGIaa9c6711RS9OGQdRfQ7Rb3CKIGdpN5d0nvSIOXYlsYNxZJWsYmkF9NyaMUyPnxGqZ/xfcg==
X-Received: by 2002:a92:cd8d:0:b0:430:cfe4:6e61 with SMTP id e9e14a558f8ab-4320f7dcd73mr1143985ab.14.1761571815189;
        Mon, 27 Oct 2025 06:30:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Date: Mon, 27 Oct 2025 08:29:59 -0500
Message-ID: <20251027133008.360237-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063016_333292_79124A39 
X-CRM114-Status: UNSURE (   7.68  )
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

Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
is the first non-Freescale device represented here.  It has a nearly
identidal register set, and this binding correctly describes the hardware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index f2dd20370dbb3..5e6aff1bc2ed3 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -22,6 +22,7 @@ properties:
           - fsl,imx6ul-qspi
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
+          - spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
