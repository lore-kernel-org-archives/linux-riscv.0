Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E54C369B2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/fcVWY3p2/MnlazO2PabPgXD8ACehazaa2oK57oFfE=; b=BGS51CCl+pk/mK
	WqNxG3RbKP83uyP3WOOUzWFJv9O6luvwazIgQXH3DgnLjCP/jt1bIADsBCT7PWuY4C0N05a39BOUj
	3V6hYhv8gC6g/HUIuRdfck/DxF5W4YZiqhU/o0kMhS9mWqdgCSmMQHL1BuWUerXqg/+pPbPnTQa0p
	i2fS6J1FpgUpZGx/NI87yghHp/m/kWMoesEpDvTPMyGflCf0tsbo+/A3b9FV2rVV9hSQ3IWAngqk6
	zsCEqfnmcQUcUst7Satr4IcqV0+2pUflvaazPNWUNU5Qu6a+pFP/iYEGzI7Pl5aASfLtvXx9OXe0s
	CP8XEqpIZvTnyIw1wDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESC-0000000DvEb-2qCN;
	Fri, 11 Apr 2025 13:29:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EDg-0000000DsKb-0Asz
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:14:57 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22548a28d0cso28302335ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377295; x=1744982095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=hNvyZubmaGtocNj7AoCS0Ae1UQvYGXqh8i6nDGgSWxOYzZQyDq3YDQtSYTYkZCEMhX
         /+OQp8QwZ/4DnCh9vTa/4utEZjOVQDpFvy/+VzWarhwlG5WCo3Eji1hITBOGaf1z7LsX
         4NMTjqBhezB6UADSiwkvi0cyA6yCtdW+jXGkPw4S9kq6wBjGVr4uTQqeY7rOFZIB0B5w
         Hg73xzpGJS3RAwE5A+Hwk7quqP0G7A1BMJBobKVBT2p22UE7Va6w198+XKK3motG78gB
         m5vqsNe9PKPz9RcdbyRss1SJSpOsj5L6No3QPoqPUQsfr66yQfwtJ8CBEOomwu0FxhK6
         aG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377295; x=1744982095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=Z7oc6KDrrMExR38DoqNQFL2Oxd6U/m0phq3f7rpN0HUud4Vp+rP3wtAsSkQZ/nOmYv
         ufMkFN4/kUM4AFeoiCM5kMex7edTawI1502t9J++xsKAY5773ldzYSxVi1pckcnyecH9
         Aqpud9Ylz7DPZYDRY/wrbtVJLhLz+ZUrFm3vN6k/nWTKjgeQiGW0WBJ4ZiVoCQMmMo/I
         inzF2HejEmcVvt7Y2EkVunwv6CG6H8MyVnDfwtGUnzV/2RAYFmqtwc5Q7WH0SBX+9NGd
         XZf2s8ZR+azkOpRaHtboD+Ujd359D80hRab0DMPG9cS9w1pdO7mzhcPf/p18eFr69lKJ
         PW1A==
X-Forwarded-Encrypted: i=1; AJvYcCU5xzyDUvgpmqfMD0gMkHT0fn6PCI9/yaMAYEC4834sbhow3he8KUuW3zkbgbTSU2H7PycMqresReo70A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPOH8yaS63qibCUOAQPTr3uwM+vdflpFuS638B4qYYdSJC6YoA
	m8nHLVNC7BArBCgm0nmbdFs7nSkSZdtMCXn8g2EjqejEdUQfCnACE9OuzrHIZb0=
X-Gm-Gg: ASbGncuoBN8eElUSFJUVf4yS6+AfpXs5hl1OacKRaJVi/Zi21qblE5aWuEzGFA06iS7
	RIPQmPLxESE318qOGhJJ48LnyGCDUjJ1rKxpNucSlhyFIrdBFP+yk4NSSlFZ2Gyxbu/kgijU1QY
	B0sLXkmXgVwYg9eHlHMDEov6jWYTXm1/hlwH/IXaVxA25RNBwgov0Is9AXMQTyKIIA6e+t4dwvZ
	tWkTnPNLoF/753Y2D4nV99n57Chk2y0oS6xP/nlcfki64vC1mE5plBWIqE6JqKXvHC6nBsxc3xN
	WIb9RKhIzKHt7UzhDHpQDkiKybPW94I=
X-Google-Smtp-Source: AGHT+IFvN5I4E6ZSZP8c6xGMaFyJHcwfDhA7M7Bi4ibh+3ktU+m85bf3AQiHdiDWUBpOoQFNec0A7g==
X-Received: by 2002:a17:902:ac90:b0:224:192a:9154 with SMTP id d9443c01a7336-22bea4bd78amr30197535ad.26.1744377295221;
        Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
Date: Fri, 11 Apr 2025 21:14:15 +0800
Message-ID: <20250411131423.3802611-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061456_076287_6C490471 
X-CRM114-Status: UNSURE (   7.44  )
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

Add an optional resets property for the Marvell PWM PXA binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..9640d4b627c2 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -31,6 +31,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
