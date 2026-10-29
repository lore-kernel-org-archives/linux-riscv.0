Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E85606A32E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dou/UoMT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQAuKIxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6BOUTj4zo7KIWDNCTwNQ+fydcWEH2P3vFU42qUSdrLQ=; b=Dou/UoMTDnNDPt1nR2upMs7Fqr
	eCLoiXuFjNK0HgVS7PSgag05mgIwHETHoH83200lNCG/MlW8ah4kbfDf+wKRqP127lVEGHX5TCa4L
	bbLWyk8PJ6hnweKgMorV/nGQUgYDZI4pckzwoWxMgMxeGEL1JZzNs6DKXBxP3XkYXKZP3ZH2PC6WF
	Hgy2eqP0YlIGZYxYOuLW7HMF18otH5NfcQOBWDsfPe01n1+fDajHDJZip8jANwfDfOk1YpYHGdwIX
	MwDiQk3rQikFlXAYyKWfMKvw9jFJbsxY9rTQB092P+jMdfHIQDmjftczT0hfC1Y0/iiPV060ibF6s
	j3Vp/r1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIM8-00000008N8t-23pL;
	Thu, 29 Oct 2026 05:07:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIM4-00000008N5v-3OQJ
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:07:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e987b4a710so1882545ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250431; x=1793855231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=KQAuKIxiWxLwOzDMpDVgD1iRvR06G0gmj9txOw16KTZTYhrhj97RXgJNZsTtJ+LosN
         N1XJpNyDg/d8ZFbKP5RNbM7PEhgMWbViKS6g+Mjd6QGIwHhdpdDTU+IhP2ITY4LLg0ud
         j2si/5mIlP7wATpBaKhACqiW20Vdw7wceAwLUJyXAniWEfoofIfLEHN+BnehhiCmJXA3
         B9a5z7FPADpyIS7O1aL29eo1RBdvHoaguxpXhaVbXzX8kF/KGX2ayFERQTdqR0LKPyN0
         IDSCobIsjbSNZ8y8W1aGRGd+GNoacUdkJpnUr0OgZzymdmVTT/xDEPZcWsUJ6LLwCxPK
         U4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250431; x=1793855231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjNfMp/WtzafGcb6uGtU9HJkhzqRTyKQwukVNkTGdko=;
        b=cDI8xBcRJbOzZo7YzL3yOPINYBQomROnCKtUQ0vmEJ/+WvRr6VkQfbU7wj+jpK/QfP
         ZmPoo1uxMvvPU/GUn+vytK5o/4xBKu4Drz/DMf2J71Qd1PWx8AoXAr6jqk5aflJ1GzZp
         s8j+Z6TNUy8u33iXzRGOVLff8xJxMnZ/T6bsHR+Nz0ecDGTQ5fgsMA0Irgt7fW48Bbyw
         gXvioo3QHD7YKSUQiK+ijpwjy81JavB8Acgg63/jUz7VXVd+c5aBHcauY2oQga0RGjTZ
         2VWEXjymGHfxXuHirBnTVT+z6O8QqQVOKvxLXbZk/YsTfdWMs2WHL5F0R42L7U59FXfO
         Kfog==
X-Forwarded-Encrypted: i=1; AKwUvBxJZhCMLH5NwdNs6wORL6k7f5THh4pM13nyOCr+FWrirwA2g0heTUcMzbT6bAzP60j8K3Gf8ucptKc5Yw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKC5IrACMY9vdT5lN+fiMpEqFMN0igJjPf3oXJHfhFhoyG9BROn
	HpllS+wWoid43UMmHY8FDTYvJ56z2A2Cq03DQHc+/dQBTBOyN/i/ftTV
X-Gm-Gg: AYBFou3xPyyxpXgDYrgOBffVre02nMePVvn6U+rOhgtF8zqneaRR0wYbMqI37SnpKNx
	HLpwyAg2BKGDvAfd3aCGQzHCIoMlNqN+qR7bZwSsTZ7Pwh84mI4J3WwSIcAPTjQOxjAEqL6DIHy
	eO/Noaz0Wr0QUd4f5TeBytA6apmCBz6mepQeVaCGwvgODo6D6TYDXBL7Em92NS2ZS8hmuOqO5Sg
	jYgHrJy/q3+/A5k9YiN8wBew8SK4vaX9USCAVNmKfWBiXesaIvy8P93t9zYV8aXG35gVaFG4sM5
	C33NYqIbwaWFCXwVvtvSX0iq4G6BYYfsgmW3hn98JINBvqAokZ7WUsd8FDtw2eHsxhstW5FyiTd
	kbM4IDTqX+g9gG/Bs0d9guMI681/32dK7nya2apKnbDVHM+3VVzLGT2kiI9SaulDyL9OdD5oSnU
	iCYGFaaw+g9xfoHOI7eGSgvGrCYX+i2jAEY71fRY5khBO1Zhz8pKGTxRcqBOf6ACun2gWQtdsgQ
	ovq001LUKYjbYk1TJF2HFgiJP634UJwvA+RbmwmNdxgbRpLT7LZb+ZNXyiPd8fgWlA6L2ebYKYT
	X1FfEQ3h28oSoQI+d94v6XNwCT28
X-Received: by 2002:a17:903:11d1:b0:2e6:f3ed:a551 with SMTP id d9443c01a7336-2eb1aab257bmr10272905ad.8.1793250431325;
        Wed, 28 Oct 2026 22:07:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:50 -0400
Subject: [PATCH RFC 09/12] riscv: dts: bouffalolab: Add BL808 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-9-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220712_900429_F285A463 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: -2.1 (--)
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

Add the BL808 D0 CPU, PLIC, CLINT and UART3. Leave UART3 disabled for
boards to enable. UART3 connects directly to PLIC source 20; firmware
sets up UART clocks and pins.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..c739c77960c4578b87fcf2bc096ef7c8cda089bd
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "bflb,bl808";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicsr", "zifencei", "zicntr", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	xtal: clock-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		uart3: serial@30002000 {
+			compatible = "bflb,uart";
+			reg = <0x30002000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtal>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@e0000000 {
+			compatible = "bflb,bl808-plic", "thead,c900-plic";
+			reg = <0xe0000000 0x04000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <82>;
+		};
+
+		timer@e4000000 {
+			compatible = "bflb,bl808-clint", "thead,c900-clint";
+			reg = <0xe4000000 0xc000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
