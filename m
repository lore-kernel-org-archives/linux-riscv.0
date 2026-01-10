Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92B4D277D0
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+GWHo3r5/4pfaH8qgpj+cf9/5N2ueRQgmt65/fjtS4=; b=lMMpERdDvXCYWU
	7xD64oHNZ2ixCBElwnOS9FCViIfeVxjoY/BUEJ7j8BYvzeSHwekevsPYWoyk1VTlnrFP+9fSYS+Z0
	VyOGQhsdKwXg3RT5gzNzDuEJ9lQIAdLLtTyXfGaNFGEdXKo9LMrPy+2zHi8ypmM9eTH9eLgFajKrs
	sHDPiQzVG696ulbxNkY+8d7gn/n0gS0vRNQQsql0x7Cwz+blvDk1JfgJH9k6ajewjbLQRjBRVOoUy
	/vWdtegQv9T/agMAfitnesfLUexEFFzgpxZMeNWuLEv3LwDF+SmpNfOThWGwpnS36JeG5B1TuYUUt
	Smk5k5iK/grOEJepTa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROC-00000003FzB-2TqY;
	Sat, 10 Jan 2026 05:19:52 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROA-00000003Fxz-0fS6
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:19:51 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so36278535ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022389; x=1768627189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmyABXvs1SN8VuCBpy/0tab2Fs0I2RX3eOqS1zJrtK4=;
        b=RdE2M0GMtxVEelkAhg4yj3HUgyGoyUfrHjvDD0UWnT7Zqnb2M6YQ7j6pqimK2j850T
         QbK5rCud1yhvMZb2CgZH7oWovyA2VO/r0roLbZxZy4kSrKxasdTwwnINSuEY53+6X/Bk
         6dqme5Vpa5JbyBN9PuaiVNCCZUvQr1Vr0ZZeqNzgXnEM/InE5zRFZtcpMEXowU1xhRR1
         nmNA+MK2b64V1zDEg8ysVc+rC4zteBbuIICxrj3cFNAHlLAMtg2tLHW4d2YRYSINJFLb
         P+ILQmBoTgGvsoRJyRFtZW0argtPWL7eP3FLkpFwTMM/a1vKScTVaoqnLns2/Uktq8Op
         ic0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022389; x=1768627189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmyABXvs1SN8VuCBpy/0tab2Fs0I2RX3eOqS1zJrtK4=;
        b=kqC2ntpAXGWKPW06SxPHt3Hc5V1hhgkTHSGVhFbPxP338gj2sGsL/UXzWLq+m03MDD
         0zklAFw/nZzvCi978ycicUoA1kDKbu0sbbzqq5XodgYDEVmPNrjnKHeJFbO6fEnwtjbL
         kv38qf9UVpMEq+eEa3UgjQPMz6gcgZkqkIFPM4k4+HWzw9hRRxxIHYDhIB2WFsNuL/Js
         w0RiFJHJkTsmfX4dBnhHrg1uTCnaOk5tpFcqqUGv+I70TkQ/YklowOxz145qO1CD5upr
         G4RtzUrOI/q4UPH7N0dFUOyurFG/YTN5VlSHrgDpxXXZYGPNh/5vBqGXo94OsYlmwYaK
         VWSw==
X-Forwarded-Encrypted: i=1; AJvYcCVceRLoVu2hJhYQzWG7/1JHc/E/O27X90CDTgvLjeqURZm/2W1e+/Hmky5PrN560mU/Li9wrMu6FZGSIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN7YFiECmaZ0TXrwz8CpNefdzSleXt+1BNRfcQHaIb2/3MC7A/
	UkwJ6sxsFNH78UVn7hN97ISMqApGt+uQGJB2prYhJrJwVq7t1zreUT+6T2Dr048E/v8=
X-Gm-Gg: AY/fxX4w5FJXgH2T0z2tii5YdruxhnKviKmIRpcHFvMt+7Kf5knBozWEJ1iedU3mYh0
	4MLgCZeNPdeu0S9gs83GFDz2lSydMUFwFALx2lSZuSoCLuHpVaZ/1mVWG7hM0bG0RpJhuV0lisS
	PRFt5y2PHkUBnzzJH5p8dzrCMo1bK+xPg/SLBvoBMASUV8Hi1RfwdR1R0nBh9627HPi42evUfBk
	QFtPYklH5WOww1LMe7hOpbySh1S4qyjGNlWu5fUxytyQZRq0rhxPbGTNGZ9dxL6EN5udBC2J5UF
	lFh81eoiH5PK/Z7UHR+3u7JOgxSk3txkOm7Zo81uVa21instjekOxhd0DT67NZuePjvQ2zLHr9p
	Kud0jtHHEllrcH8nAE4esuWoNeoXz2zU9HfdL3VHc7AodYaM6oV6YjNCDIwLCMVO1F5mS0fSsK3
	VtyBOOSGT9iOkgslxlvcxtQYuNDTLF54sWUDPJO6IOFGeShqoLQ7qUvt3/zq8tQ42U
X-Google-Smtp-Source: AGHT+IEPPeIUWgsSKZBo27LQFfXmf78KQe8uU+5vPpaDED03FOdBQAsZNe/tyTQTcMQjGVrGxwlkJg==
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id d9443c01a7336-2a3ee48ac0fmr115216775ad.38.1768022389213;
        Fri, 09 Jan 2026 21:19:49 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:17 +0800
Subject: [PATCH v4 05/11] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-5-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211950_210215_772FC11F 
X-CRM114-Status: UNSURE (   9.13  )
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

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Adjust maintainers list in alphabetic order.
    Declare spacemit,k3-pico-itx as an enum, which can save future
     code change when adding new boards.
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f7..b958b94a924d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -7,6 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SpacemiT SoC-based boards
 
 maintainers:
+  - Guodong Xu <guodong@riscstar.com>
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
 
@@ -26,6 +27,10 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - enum:
+              - spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
