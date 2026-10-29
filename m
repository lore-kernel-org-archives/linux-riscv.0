Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCA606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLKFInAd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6vD5IFm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0u2LJ3l0nuyCL53pu2DFKG6gb1mClY7oesncYaFMwOw=; b=vLKFInAdwL7y6ke7jtk0aNrb5P
	SS3CnqbC1cTsaIzrIeSTtXP/bL8lOsEnt1ziStGs6rK3uBlUT56irW+w8iZIc7qVpnuhnRdUyhBTg
	yi7pKOriYpRyzKNdIL7b03YDe+9I8yl3rYvX0Z6y9A/cAA7IV3wfk1je3zUFHkEgEKkd7IudmwvYh
	gL+20hflR5Ci6VM5uqZzNATMD++Lv9QB3L/V5P7OGraAxK/URi9sFpgzBrZ8NCbiGLLI64ntpxT0K
	p0XskINMZmdgF7mHs75eUOrNwb8do/HMC8k8l61sn1eTp9AusEcHZbNJIzSazpEdQHjcrgs/xfsu9
	dWAcHnVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIMH-00000008NGE-1vai;
	Thu, 29 Oct 2026 05:07:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIMC-00000008NC3-3pTP
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:07:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e985106c0cso14958145ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250439; x=1793855239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=Y6vD5IFmmWPANBwPEpQGZyDCj/ItTRbYqJ1NPys0CjHRmvUvi6zjtybuLkVNhXSPn+
         gCOSE+1vyUgW3frH0dCbT21Tvzp59s9ZnHo0PhGNm+EE/lNoD2ZQw4a+KiAXmQ5H4tlC
         blaSUEKZd0EFGLUr10adscg08YtzRpb0RX6M+MSQzSWQdXqE6DHinRCjSx1/30lXuQq7
         0gud1sA7gZd5NyMkJxIFFsNzG15tTT+DNyY4A8p+e1vBukfiuQE/XeHu7zlMxI7oqm13
         12oVVzlUSVLCB6+EhzYlE7ZpFIRbpKSV8UTrhjjEZeQsPpUYxPgcxIFWZCFFzdv2iWgw
         ds5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250439; x=1793855239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGV4hq0i8RZtAPVqoljw/C8+Ety28xxbkClqaDK3k9U=;
        b=MkY2MgqhIi8HWUb664C1GRlfEsAvOMqJIn2wVtcgp0ewKO1L13slJMe9uH51AyFHBM
         B4VJ3vKPMLCpOsbvqr6UvCEGAKy9eE9bu5U3M3zmPGPCPOY+lhZ7mkdESFqkIBPXjjGn
         s6nLSSaz0oAHSTJP0V3a+EhCfAJnnBavyprx1ZeT1EXiluII6kRKpfaMEovVSLfc1MI4
         o/klQ/YSsXuhHS1/s25vcZLUI1HPsC09+blzpjXzE6wGZdT/Tir6rneSiJ9jd8n/XVP5
         aFVHKYt5QlBI87XUdz9QguvvA8698Z5n4ypb8cgaLCGJdO/A8Y4E13dkZt6PLM7SllKw
         9ZmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg4z9NLfw4qBA9I7ztUkRWJF1VZLPxehihFETSRMQAfNs5jZlJWj5ABGbvE+Q+UIWOG7qWoEPP2gBCrQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6P5yHpIZUnmsAVE8O6bAhMV+CUtxN6+p9FtjsWTYzP9pvT4AP
	Djepxj+MCnieI3KAlZbKK2YasJ6izowQjFGhiRStGboFsvClGm3n3G8U
X-Gm-Gg: AYBFou0WI41fIDX2emd5KklqjLusfpPDpcWtoClcgFmIgze+2gq9Ym1cCcGqJcQrxYB
	J8Kvopsj7fNZmoBBGiv9Uo4v6RLrJtRbDuuDWlPgtiZ6VVpA9E9iNVHCGQiOhASQ1MmAjRL5xZY
	1AiS/AUqTdFrLZ/nWzAVcUWIMqJTeuChdnZ2FQhUDUO5v9XaUa4CHk/CG9xAHvovijYD173/H0C
	id1dGLEZwxYuw7KYNhMX5zbWztwuvpjXJWKVJSZ92BYXzQBsy8xFPAj9qvNuHC58rOufhzq+ZEX
	J+U2c6lsjo6HMpdwp+TO5SLuJBoTW+GG9X0ZopSOaWjD4/ap33+Tqkkjz5sHo796paSJQADlyC+
	NW4Uc5+TB/cFAXbCpRg6XZXGepBX2Mvx9IBOAF1whhrc8ESeJD2W9vYNTfo19zwZ6TdDGhSmoPe
	AnHL0CvG8q2kpwQQY/KaSmnTowO+uX5UG/pxBkEADhrm3HE8hqVZnuYbm6/UX92o/tulm4XU29O
	6THUV9N85abU+nnqKBx436FKGg8NN//f6HNNN8kqOQd1hRg0VGn4dhE/nJ83+eFxbH0yKSy4TtZ
	ZO2WKHeMgLkMw5EKK1BZDg9nG7gG6Q==
X-Received: by 2002:a17:902:da8d:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2eb0012c7f1mr38007225ad.8.1793250439420;
        Wed, 28 Oct 2026 22:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:18 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:51 -0400
Subject: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
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
X-CRM114-CacheID: sfid-20261028_220721_280193_E648A234 
X-CRM114-Status: GOOD (  12.43  )
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

Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
with a direct stdout path and 115200 8N1 settings.

Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
Firmware using another timer configuration must fix up timebase-
frequency. The declared 64 MiB PSRAM range must retain firmware
reservations or be narrowed by firmware when memory is assigned to
another core.

The stdout path selects the native polling printk console; userspace TTY
I/O is deferred.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/boot/dts/Makefile                          |  1 +
 arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
 .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-y += allwinner
 subdir-y += andes
 subdir-y += anlogic
+subdir-y += bouffalolab
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "bl808-sipeed-m1s.dtsi"
+
+/ {
+	model = "Sipeed M1s Dock";
+	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
+
+	chosen {
+		stdout-path = "/soc/serial@30002000:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "bl808.dtsi"
+
+/ {
+	compatible = "sipeed,m1s", "bflb,bl808";
+	memory@50000000 {
+		device_type = "memory";
+		reg = <0x50000000 0x04000000>;
+	};
+
+	cpus {
+		timebase-frequency = <842105>;
+	};
+};
+
+&xtal {
+	clock-frequency = <40000000>;
+};

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
