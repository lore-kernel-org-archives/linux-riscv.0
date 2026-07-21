Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECA0C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 09:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvW9238hfIMU3Y5UB9vMtHSpZVo8JpeEqENA29VehSo=; b=wCOZuDLf6CrYzc
	81Thdn5KEFOhfQjJUmN8pVqhdBe+vCwk2B2ZNINvwUoCgHHydZlTeBe99qWpTIUDXD4T+9nGJGExz
	hOVRNT2gxU9ehG+7aUtnosTyhgfluFGjmx2L5LNmUxsYX9/pfZf+RZr3jTNrpVZeT3uGFKEo2LQPI
	R3CkId09KFjujSBbDWzEvUAnCxvUqQyApE9I/7nAVI8MOfDBmw/oAX0IDrqbS8gGDfc4Xt7yjNL7u
	QI4LgFuarwMjekouK7weJb6CFav3x801B9RQUNphZ+aSivtWgRa8mEtZ9ArTh3x5RvsBUReIr7kFL
	61C+PRdOljmkTcJK2BqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm76o-000000091Fh-2Gf3;
	Tue, 21 Jul 2026 09:49:54 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm76l-000000091Di-1IXr
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 09:49:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784627388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYgDvv/8zUBPOt0Bkan5pLK6f5pZoY2kPjTQUy/vRm4=;
	b=OeuoYatBX+ioCnxSVS4R6sBmsKaLpqM7WjDK8FzR8/j5Kt+29+c5kshBOf1j8+F4ifvCqZ
	lY0HCaIytaGZjHhluZYjzhLbIvNoZpmkBlPGIHFUx/JPOLDPBdWRVwKiGYNNv4mpqUE4Jh
	NvsUldndmot4LxPvgpBsaKcCZTAgtaE=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 21 Jul 2026 02:48:31 -0700
Subject: [PATCH v2 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
MIME-Version: 1.0
Message-Id: <20260721-ctl2301-v2-5-ef5fb342872a@linux.dev>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
In-Reply-To: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=913;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=7uMF/zan9gnF7cZMHx9exe4LLPPvRgc33P/RP9t39e0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnxDqWiHyoN9T7VLE+U33ts00PlQBO+N2Wxyz332nGrc
 a9d8elVRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESmb2dkmLeBsSz8+4kE41yL
 rmPZ246sLnl08YeyX+HU2z6LtWf9n8rI8MEntiN/txV/SdWR/G8CjS6HUm6+5DlmKV7qOduqz6i
 DCQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_024951_537509_787640B4 
X-CRM114-Status: UNSURE (   8.35  )
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

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to
pads 7 and 8. Leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..91cd08099e27 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c6_1_cfg: i2c6-1-cfg {
+		i2c6-1-pins {
+			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
+				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <18>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
