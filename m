Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0087ACF58E0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NdwNvjF9t8kmbk4+Tkww4YThPIa14jskt8iJhwB2fDA=; b=Ew/I/hsfe2anI2
	B5U7aQWP6K9OzhXtL0nYp2uZhhYJ5w0fvbgK50FE9e4OsNFwBRgwyeBG0emhkE8ZUxhPNchTZ2Til
	FWAoZcOb7wDzSMxYw0Mk92z7LiunuYZT9tNkiWq/tsflHiAyXMHBCSqFZyZ3eKez0KU0uTMFTzHxo
	ageKn84uOe1uVpCk4Q0jR1D24iALRcCw1dcP4e8+20tBIy+K3UhOBrSEr29MM41EwSJfAQptOxneh
	J6O8gRRF/JPIHkFikMx0doDQC7uuPedS0lgoxcNIiVVLXQuTwNI/IXfJN6KtLK/Do60Wv2pj/Z0pC
	HHrGJt3r/4kJDAnBIgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLotd-00000005VNS-2tB1;
	Wed, 19 Nov 2025 20:35:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLota-00000005VKp-4621
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 20:35:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso1960365e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 12:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763584516; x=1764189316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPjBoOQ0X6tiw7eKt7ufioOYEoA2Xgma4d9CNgYmRXA=;
        b=N2Gf4tyE9Meev7JHOdMWC4IkZhqh00Zion7AmhgwBnsbAIfGcs1sGdFE4Q1kfr4jPX
         jBSv+ijQJgKyupZv3fWXgSceAZ/0l3W/IZNRpbgSUvRKA4Z68IxBmHUBvyYM9c1QjARW
         1WendNG8gVpIkt6rXnr2tT0l1P43LOX6LkYL1vZmWLSSkup7ab9M2nrEmwuXpHW+Hcy5
         aSPVvYnfy7CxBCwBj99ZP9VqWUif1UL9ENoNpYkS0O+sV1c1d9lQ+GtmK0QFS+8tbGe/
         oBw8nFowaW31k8ZWMjwinbwY4f8Bn2fdfiCXJ07vFHrj7OcAjTWM+WFCzhToKVvQgS1F
         xwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584516; x=1764189316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPjBoOQ0X6tiw7eKt7ufioOYEoA2Xgma4d9CNgYmRXA=;
        b=YNLvfzqFBc7nhJDcEKhGnFVbPfylWgvp+UdLyKZvMEiaFgWMkRuEzchig0Wwzaem6Y
         nRIcDEj41I3XHhUKoegpHByzY5XWu2TbwnheZiTTLl0sqJZ1BHqJSmW2jGyoni05+Sc1
         vnSJkhCTOfTbUMjmS/CKdHzLLssrXArRsuYZicF5IK3lxRzCwN6fTHeCUqSeGHT/sg8+
         NZ7J+xNL1Ces4unxjPun5irVjP3nxzTTf91q5fq6spYMhjSAwkwWRdOKftS6eUsXNUDj
         VIZVkBmU6PJNwKaR7PU4mzUBrT38ysjUIRzA8wr7Sf7i0iMAxjfudT8OlrbWVCPpE2If
         fwdg==
X-Gm-Message-State: AOJu0YzjsgDWqU6uopaGAE89anq5OuLT/aPsRuYCXYoqEMepR/5kwd9M
	4FOo/L8lI5SjTzVu7bi+Mlbhbwo/+PTEmtis30N4owuqaVCZF8Xki/RUafji9ZNKil4=
X-Gm-Gg: ASbGncuHAIvo5HrjZWvZaOV09bofNSFZ2mn+8lBAw7mlMfYFrQw5OESivkVKaJw+4OG
	P9OAQrX96xML1SshIGqOBIN+dKPlm62MLOkSR8pEslBnYTb+XUItxxRGfIfWT8v9cbNXoUfO+fM
	horZeeCMUOCOIH6NWHc8gk0mUWTaVOWkRxDsxlI3XvGojopmFfJthk1l31xiCj3ydwm/Rjpk2D2
	r84XQniQz9J2NcfB8nALyuxwOsvbx7oPNT6rYE78Dn+nkKtTxWwxU3VBuQky3S0HA0oJCmEsV8m
	No2VU1+UVwmoKhtuFmwq6AiP56KVURb2TZIYcWUEsLbH3iTMW0ptBNMB1zAxNuVIz54s+cJ/2WG
	b5s/PXcjzkAFKFUckQsOJU05SYftw4ins2YYbXkwtD/DwyTmwxmS+KnBzz5u8sm7lEG+LcBdFY2
	b+yfWM
X-Google-Smtp-Source: AGHT+IFq24ZE90yWikR1WNs6G9qizziluuH3FFv6RjdpPlQ2XJnKH0ssswEw3Z2b4tPjhHGKFdhHog==
X-Received: by 2002:a05:600c:4506:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-477b8c92626mr4124585e9.32.1763584516042;
        Wed, 19 Nov 2025 12:35:16 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm8653205e9.1.2025.11.19.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:35:15 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] riscv: dts: allwinner: d1: fix vlenb property
Date: Wed, 19 Nov 2025 23:35:06 +0300
Message-ID: <20251119203508.1032716-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_123519_041280_36D672D8 
X-CRM114-Status: GOOD (  11.07  )
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

According to [1], the C906 vector registers are 128 bits wide.
The 'thead,vlenb' property specifies the vector register length
in bytes, so its value must be set to 16.

[1] https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf

Fixes: ce1daeeba600 ("riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree")
Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 6367112e614a..a7442a508433 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -28,7 +28,7 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
 					       "zifencei", "zihpm", "xtheadvector";
-			thead,vlenb = <128>;
+			thead,vlenb = <16>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
