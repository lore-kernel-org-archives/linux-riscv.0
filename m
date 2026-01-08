Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77720D185EB
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4xwKRrO+GYLp03TvNMif5Ql9MXxT1VThWIbAQgKxNM=; b=JbGKNOQXpaQQs4
	igrNmxHqLeR7aoPs+li5526DFaBGhW1xRZ0zwF8T47qWpdYzpAtq9jhS0oKdZBbr0MB56zXjA6zYn
	TixhBfGu9cVTmFuQOnHU5Wfe8bjvoKbS61KEsGWZeAZqQQEU9YjWgaQY/3e+UPDyMiKLML5IYGx6R
	VyUi+Y0r4grVPTooGdOVAqLYRgH8vnHpU9sQirJrrBDqO0BH8vsMI1x83UQiAsL1CEmfKQVOjitaH
	6Ct2U8Hs+p4chMbRvzmeKT1JiPETnkvraXJw1Gzlmr8RW3pU2OCDfBQOKamCxYODDVi+yZQgPNoH3
	CxFWzjNqu1Zp86yojiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp63-0000000GzXq-2JQt;
	Thu, 08 Jan 2026 12:26:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp5z-0000000GzWO-3zfn
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:26:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7b80fed1505so2243181b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875191; x=1768479991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rdFmdZfR4eNmRMqejKMXyCR2tEpYJOIzk9O2le0lBU=;
        b=V34EZCn8PZ09v+VyuZ/wH8FY25Z5+lnUX73mSB406xkxaFskbLPPaIxgCqh63Jhvy+
         Wj/4Qb6d9XP8Efs16GVYQRtaFcnR4s6jcOviRXc2hf6OqzBbu8CxID9tE7drCiHO2wSQ
         nDB/0KchzG/yPyvsF7xRon8KJEUORHScT1obpP17vXpVdAiDW0seX03rckwr2noWTQEZ
         xcelSMqymBCRruMN3zS9tFw1UgEC/Iyvit9hZjnHQaSsaw1/HPM6uJPLxdc2DtG6eSYV
         VPNQPfskWcSXSdh1PzxAyX6z80Az93qagHLXFlb50fw4JkTSW5N4VmybNDPWzMQ0Ijbs
         EYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875191; x=1768479991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rdFmdZfR4eNmRMqejKMXyCR2tEpYJOIzk9O2le0lBU=;
        b=cGUSLRasn6BlohwPlbJi3T05y5jfFmt2hmP+IhzET0FQP2JMZ4QkD6J0uKCwBDqdj3
         62IZ6UtvX5TTVSlM57GRGK1EBVQtsMXkYCUooBa1C6gIl/do4V74mrgW+ffNwT5ND0Od
         aG3Shgl1B7bkI7OiGXBLTvgB6WVdIZS6qKUqqENE9UXib7M0fOl1Z9L5VR1B/3GzOD3w
         /tcWdZhQ73qJLRwEknWMlzIOsi6Dm4KKo9oH8Bgad50A81QTv2AnVYSvYORVP94KsdrT
         6BjQP0o6s4VdJUV3m+nyjgcEziq9LOoAuay0WTqjGOAixS4QfQvjAZ4/rNieDoKw6K+G
         eOjA==
X-Forwarded-Encrypted: i=1; AJvYcCUkiWSE1JhYK6Q1X7uXNmDk384y6ynJcylfwQLCyzFP+7n6erCD+ww3p7RbgW+fp0p4ri/VbwKGcy6rLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYS2TnWZS8NEmyazA5U7wAa6AFayctuvJDYYyTZowWOqKiSaQB
	Att30GL/sDKK61/rDSxst/YPdHhY8EHqKtnDEHxQ6fjEd46qnnW0znGq3NIL+zHccmQ=
X-Gm-Gg: AY/fxX6kgMFi2AwSs+XWceJGjQ6mN3yNHFaXghBHnWb9MOW1IMeRwQLfC9dV7N0p25z
	BD0l1qHd586IA45eyD6Ot6vMVkBCUHBnZSXQ7wc0UHaDtbwawFd6dM0unYkbal5App+Xub1T7wX
	MjaeAKI+329mThX3LWpAA8HBii8FP+rBOOGTXWL7DIB96dlhAPRHw8lPTPPBJwN3jPJGB9wi1+h
	A8qE8HOGuF29hEYTwRFdFGYhsjSdBJi1YI8xhz1dfA4cz/VTq1YOafXP96eylPrpk5YTA2fWeA4
	2asFjsuXyY+kjOy4PG6Gf07hrXMPeea5OuS4uwkPIjG7LxsBLUnJD3FKvUK5XIeCguJetBDK2SD
	aFjedJAs6R/jyLgcFXDMx/cFd73AApog8MXvZ5NWeyamnr9JPvIiXGXyk7hvvXtwRRiu+JCwIPU
	rDJ15b2y745qoLwXtTPXSxnCEuPCNSQcc=
X-Google-Smtp-Source: AGHT+IHheKi+WINIX/sN2F5BrXIlf0KDIJbSmAHkyxZzFI0+gQsjVJ9XwXI3CiyqReN01P5B6clk5g==
X-Received: by 2002:a05:6a00:440a:b0:819:4284:365b with SMTP id d2e1a72fcca58-81b7d95f67emr5827148b3a.7.1767875191060;
        Thu, 08 Jan 2026 04:26:31 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:53 +0800
Subject: [PATCH v3 02/11] dt-bindings: timer: add SpacemiT K3 CLINT
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-2-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042632_002910_3EC887B4 
X-CRM114-Status: UNSURE (   7.78  )
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

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
