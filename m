Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78890C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pijcIQIVC70JQ2fNcTTGiuXL7Jf5/AP0lAlfGUZNKd0=; b=w2C/xuxasLEm/7
	NPJhBcfMBWOvPOf+hbp5pyyxWFYSHKoWxls0jTysAVOZvaQ4q7qDyKFrCBdowftesFX98en+60Evx
	k0gvrX3g9P/cFzaFoQAbhlT50rdbSrWf6GvlHLxpogiekQ3+QP6N7FmBS6hzyBQGWxSh+kO9G075v
	MD7jrgiarzTgyYy1lHk8WpMRG1XxraRhnWliTpj/jaSk9icO0z9ybfBx6uJ0wqLUVe0TVS7vYMRDO
	Q/DyHUNiUb+h8iv1ZV+qfMkOBXNWadepWVK8cjF7C3mjVez5eG1JoOFUzbk6dOPmHlpw9DIHpFQEY
	OpBbMoafkkruQVzxeVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgak-008WvH-6X; Sat, 11 Feb 2023 03:30:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPa-008Rr7-NQ; Sat, 11 Feb 2023 03:18:52 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 452C46602116;
	Sat, 11 Feb 2023 03:18:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085529;
	bh=Ogmcu0djiCm10ycXgbUuJ7cEbzi156f9C1KsCx+q2FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nN13tQTAM5JWAD7C8n8ylR+HsLi/Z1YQ1vwzeCV78eigKOq5MyWsW7yY4s09lgPfx
	 smj3EctbM5vW27EAnfeFp4PcVUWKrr618YXZIgi5iocIEqAA+gwIHuBiJzN+zrLVT7
	 fNBAx4iTnqtPDNXBpakG4TOakUKOw7Qc3EnFjsWMYamdWu9C3ce//NUCHwomRpI4tw
	 jDL30mNX4RuKEYHgIVtvifgpy+Y+yvFbtuYweBpM80bvbAcGdBBvK1gRqroCETAVD3
	 SXFs8mUcpUY/yens+0waJ0SggLIDFFABfzEax2jAnSbwdqqZH9yIF9aaqBejtM+8WS
	 pX3cvWP3J2Xfw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 06/12] dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
Date: Sat, 11 Feb 2023 05:18:15 +0200
Message-Id: <20230211031821.976408-7-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191850_941999_9F60A683 
X-CRM114-Status: UNSURE (   7.86  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Document StarFive JH7100 SoC compatible for sysmain registers.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c828c4f5e4a7..43f564be709f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -67,6 +67,7 @@ properties:
               - rockchip,rk3568-qos
               - rockchip,rk3588-qos
               - rockchip,rv1126-qos
+              - starfive,jh7100-sysmain
 
           - const: syscon
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
