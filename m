Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AE6C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+8xM16LTFCXswYMGDkLTpWD5YxOqG/OQbOoL6URDvo=; b=fRPaJQs/ib+E6R
	uc/gkkS2GaQ9A5duxCdr6U/SVTwQyIoU9SKWIDSsR5ShmXNKTjQEo6EvIdkEoUn4irq8i+fudfx2a
	n82tZjL1aQc3Hyyp5XZ8DqM4s8XF0nqUXcJKECof5mLiHwm5hrJU48v3UblTSyznOcZbN4pJf4E66
	V7y05KGYLmpC+/+CQCbkViB6g0e1tox0BDAMhhejEjsmkqxuL23HhgAqvn9UxRNyuHumNfmqzU/wX
	bigFhIfm7LVuvoavZhcWnxiCGqyvI6ZXPcjWJzMeXf6Uxiv6UMmm50kG3Wn5hEO04vkvF8oEyJvCN
	kuwYhDGo0bLxoU/BT6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGw7-00000009HhI-3rCR;
	Wed, 11 Jun 2025 08:35:55 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGVd-00000009DcJ-1T3j
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:08:34 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5a88b34a6so621639585a.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629312; x=1750234112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eawpl1GdnYK/zxQR8KIApQjP6GTI21JKF4EJB3XYg6o=;
        b=CMjxW4jSrnlLR28phqXHx47yh22oystY3xzbB+iJIc1iBeYFCDsMl//urQu3IY88lb
         hCsO96NMkYgLAQJa3lXemekc0m156JKVpRE87PLleqqdUseAJ8Fsf65c0D+RTtYVfF6o
         2mJyEGx154QUAnAd87yS5bRqqsMbVE1Qu1C9/lVwkNc3Q6uJIjseBsNDjDPZJX3+3F/k
         UpP/cIbP8oCQwqUJ25TOL5Ys7KbQS1u+KxhX3OIX/eOxc4qQtULqSGNONasl5AaLFFDN
         0tc99lwmSBndyd3VH6NQTUfTxBAoiSdGrFkY6TMiGThuggI6d64qi6MdrB/2Bz3DX0qk
         DZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629312; x=1750234112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eawpl1GdnYK/zxQR8KIApQjP6GTI21JKF4EJB3XYg6o=;
        b=I4miagEjuCF1FWVRSmQSqc79gTiAMRs8DMLJlMSJCDwyb3F0joCAuFzzdugtFnu8Za
         IzZMEdno5c/CWI8TSde41jqXQeOwrbrnM5IMLUbf0P3zrVuCJBq9CGmnY67sHaf7iK5c
         85ZG8aBCrKPTj2Gtr8eOSFqPdl7jYPAdemydrA80XGM+VpYwkXLW8/6Mpxbxav5zI/bW
         k0IsChC/7pM7f/hkAxkFtqr4h0gIKdEniFkhGhOh+4wpWIL4bSyaEO35hLU6bIpHK1Lq
         fNf4sOkET6HMJHLoSzdHNPrFncUXr8/8NyEMxxcwwRVQZilLC/hmNv+YmiuLVaG0CMLl
         Ez7g==
X-Forwarded-Encrypted: i=1; AJvYcCUNh8t6kjq75OjAncusENvbpBK+NEDYdT0RAStAe0M1sIjCaIJKwO/U/i/j1oJDQDiCDHNTmn1lFINuBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHZ3+MswaZLyMBbBQkFFABt9qrOKbc/l2gOHJ4Sw3VK8SODicq
	F/oHNrK8I+LjN27/tDVVJhtONanNEeR/GfDkyOjULKo8tglhCA1Qnbsw
X-Gm-Gg: ASbGncs38zbK3FrN8/pHsKC7SHxdMh7ibXVltqpJgsvrxXiqf4/rE+6MI74C+IHYqtq
	2NdP7w0VnznNJfxtbkIwNfkmermnA/M9Jr+1Ba3J1MiOtyjv3ipv1m6LzuKDWsi0DAmv9YgpA8f
	bWHdMw8HEls+iIwEvmh+X4LxDsmjiyVY1tE2iO4n3zQrCrEVakrua9ZuyvfQJcGQHr6n872dvNa
	nqSZxM14qexXuO57v/D5qgifdiNrD9IVMdy6NuCgizzaGIkm8rRZpF8EoNDJrvMnvZggQlZz+NW
	gfMtyRDm82c6l6cGUYFcskHh9+Hc0glrD3mheN+Fdm4AMcTC
X-Google-Smtp-Source: AGHT+IFnczEgxOSGRihWUwZv2+9Bzf8GJGZO6uYjLD1BPRfJ866LMMcxtdUJOLNxegks0WI+Vt4oPA==
X-Received: by 2002:a05:620a:468f:b0:7d3:9203:206c with SMTP id af79cd13be357-7d3a9546cddmr304354485a.9.1749629312081;
        Wed, 11 Jun 2025 01:08:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6198669b7sm85188931cf.67.2025.06.11.01.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 3/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Wed, 11 Jun 2025 16:07:08 +0800
Message-ID: <20250611080709.1182183-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010833_385480_D6583C32 
X-CRM114-Status: UNSURE (   8.36  )
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..929864ba1b26 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,32 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009000 {
+			compatible = "sophgo,cv1800b-mdio-mux";
+			reg = <0x3009000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			status = "disabled";
+
+			external_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+			};
+
+			internal_mdio: mdio@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+				};
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
