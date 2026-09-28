Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43FCA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U23WNW90w3V6jBeU5Cg02AYInHhFPYhENsGTQCW0gss=; b=Ai5ZX7GZMqLlvw
	GQ9jrMODuwMZwU/rxmRffOT4bBDP9a+bJ05ydgXLL+yeC10FYQfBhpNdTyo0Z1cs/XJmafsy8s1KU
	tU4WlgYCkm0eD8P4uHyrf0kQ5t5XWK1Uy7CuA4ua1OPujByqXupQiO2PSQqCgI+q3P5UUfQQ9gGIw
	j9U8aGsN5+RRdeh6GDhEid49A4tAsm3BYTVhW7ZjqQKcbL3cFLFpL6v9HHALYiU/fgJTm7iq4N5Cz
	IN2DHIT9HYAdQVKZUoSYsizKNyBBIXfFtkW+4uzL7rC+VglXYKLdtI9nNM7QZVYzf7WlUe3uIHefX
	5rUGGXYx2Oju37pBletA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKer-00000001rQE-0djw;
	Mon, 28 Sep 2026 23:21:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKek-00000001rNf-3nqp
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
	b=GOVX7Gpx/tGSojEKGBmSpxs8377gqpYh4k/Uh07bqEe7qI1vc2rs6pDf5by0hnR9YAIUCp
	rI89ajPCVkpOz6OuoBhsx7Q6Twtq9uu5txfOorK60U6bNkOJ0Os81RNhfpgYMLBG2ti7zd
	NhKvjBPPXeqPxSTnS7xuamqP+G06ixA=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-HmELEWX5OW6yw5Fuo239Xg-1; Mon, 28 Sep 2026 19:19:41 -0400
X-MC-Unique: HmELEWX5OW6yw5Fuo239Xg-1
X-Mimecast-MFC-AGG-ID: HmELEWX5OW6yw5Fuo239Xg_1790637580
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-674098a3b87so6467281d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 16:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637580; x=1791242380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=z3wPAa8XcVVZKu4CjaawmI4RLxb+3tzjaf3bnMD6Xzb3C1UlgDsP1FLAWFKGk7xjm5
         Ke5FMpNEb7SpNQ6drLFSIupcs6gErcqLOT1NX4meQTxvf1HUczr2L1NpVAZhE9Dmjho7
         jvICcaQ5cncClmKYJwVJOdzhQtKGfDEIA9LCYEutnp5nZlOAogNCHpBHUQQ4jPCiSZan
         ncdTBGCdbCCeAAjhNXJkaSxBpJsmu7BDPhE5sMgDRHmzGJsbNtHFACyKwkXWytrJ705U
         2hdhFNXybWhsMd+Uh1W0kfR+W2kRGs05ETim80c0soqKZ5VxmLayyGtYIY+hfC/i3fi1
         Xpew==
X-Forwarded-Encrypted: i=1; AKwUvBxBgH38AYT8Nw/CAOuXmRTokLQVXSKOZQXOY67WiUL6s/RFfXXSkKDJiy2I6tHwL8RqFBDlh14hTpZE2A==@lists.infradead.org
X-Gm-Message-State: AFq9FYIXuBIbKED/+89bDrmcz8Tnocn/4tIYfSre7IVoUva0lXasLO67
	fg2jfeXAPuF3oqAc3Y0VO2judCgCtIHqdQwXH7QHi47I/cgOcRpNHPOAo3oa0QKB0AykgV+MlGj
	HODOkiAI3oZrmlPwdFjMaSc+m5yQJp8f10ROFSns71VSPjxCa4ZQqzx35IfX2IbmIQumOVA==
X-Gm-Gg: AYBFou2rSBcxQ4LIxWT0pfbnIyppU3KJL52HgAsV2DK9dI+O2j74P3G5LM13wHXl11W
	47AiEX+fNmrAzZ8/XAnu1Qm+a9YAWMfNGJ544hUjvEnSBr7k4BmE0dH1vZm5a8Xn5Z1IdLBrrZo
	bMrKuWlPEwWOv5t5C9su7gkt7LfxIcyHYZd1FdOWV81hse3cwVTlJCM1H0Ne+QXTfBMEhwJsXii
	LKegbQhj+7aMhm0rUS2POna4jzx+fYjoiAz7VrLsGA+Pz6lgIIUs1Zo1pai+Q5G8a6PQTa+RWHl
	JSMLp/PQwRf8CP/iCISfNdkrXvhBPs4fLDxPW2ITbaHtwmQ6z6eEmg==
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292545d50.129.1790637580507;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292538d50.129.1790637580114;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Date: Mon, 28 Sep 2026 19:18:07 -0400
Message-ID: <20260928231807.1757995-5-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2-g6MNPe9hg_R7rr_oxcJpW9QcvKEV4MuT2z6f2TiNw_1790637580
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162111_020850_221117EC 
X-CRM114-Status: UNSURE (   8.90  )
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

K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
WLAN and Bluetooth.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 01e286cb05797..cd878340e5add 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
+	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combophy {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
