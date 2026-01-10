Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38064D277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhei9tsLPZ/PVLS6zP1fLysrzNNpGMG6O319xonCakM=; b=KnOCQrwIkrVZiA
	5ZXTdlSTE4uqT8Hl9rBKnleOFMhBYyLgt9ZA5/k9elZF4pICLk6jO1x33X2sYrGanmkYbF/fhTreU
	OH2jjBLGsTb4+AJ1EeOn3dsCNb4kY+A9zlDDWDVHxFzOCL84cCx6YNDx981kYlAIA237Y50R3P4yt
	U/KFdXBk01R15B/ETH/xe4EnIHqjB2akH4QEfSCuo9WFocTIkN6v8BBQVzvMf9cteFDkT6QR8sV9B
	1Y5KW1qqPSbcJQW/Rt2mCthh5VO5WAm9LVsRG7vhwEjas+84o82kraSUjTLLKkbNmWo21+voPdi9j
	ys0wbK0kdRdLwyyTZ2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNr-00000003FtO-48Xq;
	Sat, 10 Jan 2026 05:19:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNo-00000003Fsr-44V1
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:19:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29f102b013fso47913275ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022368; x=1768627168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Geuz70LTMH+K1+IqxpgAgsSYEP1GMgnx7rbwvE2Nc=;
        b=Ve7vwPIGi4aOxOKjZwwS9dSmxB58LXYwqdl73fSusQU59AUD70jTKNNBisA0VUXctH
         F8B4iOXImgxx/4RkslLMxNrNTi38DgCjMBdAFfOtgIBWQUwsdofksYqpwlg3PslfjnSg
         r8VuCih53aJYf2BABWvIzO9PSNRuNNYyApuXun+VXhCQq5r3gOvDYia+7CE7LXbYtPlh
         6q206VpsTzk4XoMd/Pxtm4QV2nzvMACsbuCjyAlMMv2Hja3G7PpoHYvvnP9OoCtrJ19z
         izaDEjZyLEXsGdxmKgiAQM9XLhRT3gzL5JPlZrBznDG4jmKKNF4tOkLGra0nSQ+CneRB
         gIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022368; x=1768627168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Geuz70LTMH+K1+IqxpgAgsSYEP1GMgnx7rbwvE2Nc=;
        b=HQX0XN1ZxEbHPpgYVrTBM2Ad4tXux/guahO/ckDsLdapQoTBvxD/zc4S/utPGqfLa3
         CirFBEEq3NNPqS4dy7jgVL190/nyq8y892rB3fDmdLn+trSY3UbLOxFJlLe/h1KB0A+t
         +PqvvjCYbG3O1LUNy8M/tdg4gs8rltSWH13Rnreql7Y6djzZBG0uvutS2zeNK4nUylD2
         JtEfGDsO6ECLu8rUBP0iOiUvB3BxtDW5aQnlQrFpYbrfr2PJchbZ6u6ZmsStRKa6Pkq+
         0ftpai7WqpQnHowmnMpevuLTjWE8Cj6pZ5rStwezce6zdf9Ue5AdwdtlrwZ04qzKHrGD
         WLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9yn5Uq9UJSKg4tPI0CqQpzmQZighn/FlFRJ5nGuMCPSnUU4F4T6CzkA0TPHdddT1W3NmmbUBrS5MBzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkCwlVAl7+m2SfkoioLIQe7FD+22CL1jTXRT1adhwaGjeh5YV8
	B/5891zHeMf2PbGmfQt0zWNb64M3Gpgz517FepVzijtrebLCQJ3th2opcQzcIHpbF7w=
X-Gm-Gg: AY/fxX5hDD1VCQq4MhgEG5hjmJUD+ksb2W6diQ0kZ1wg5Cn+jiWxcc47mRXdiL9hHI9
	0pMV965FucwFi273h0PfqAsfR7DFSab5YmdT0Wyx6LFWpVUYPweOOhA7d3n3wv1VseeRWX2B9Ne
	pPI5wFxBnqq/rExwwN8pwxF/eoVhB8sRD38vzyEL2vE+6UmHwnCbVfjUQzC5SA3NHtpYdCmsu2x
	qlpVUhbhqbnb1hgNfYzc97dgJABi6H2XAdoj4O1+GUXbyQhyyCzRA9IPSZBAtkzt30s44P2cnFw
	m1qnmAzX7V+x0s1PG5D0zjFck3VcDyr4/ZYHSbUwd5X59sM0BrjrUV3OzMcbAlvtS/wqoTo4bc1
	bgBn7gdy+ae+KkQuG/R90FxQbwPWMXuJ8njv0CmYOPeIF0+XXkBgoEFkxbQo5R/RSsJmu2JXvFP
	h7u6lMvxFKAqWjOnCPWmelYsZqpSWBzgEyUKA9TQNBN7FKEuBsRfn3GA==
X-Google-Smtp-Source: AGHT+IEhV3ebl9s1TopC0pjYDvYSTyDIROwqkU+RDAEMZaVwRS5ET19VZ04pbXXlgHjjsJSNiSZYpA==
X-Received: by 2002:a17:902:d58e:b0:295:1e50:e7cb with SMTP id d9443c01a7336-2a3ee444aa2mr109871225ad.23.1768022368123;
        Fri, 09 Jan 2026 21:19:28 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:15 +0800
Subject: [PATCH v4 03/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 APLIC
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-3-d492f3a30ffa@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211929_020055_566C5DBB 
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

Add compatible string for SpacemiT K3 APLIC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5da..0718071444d2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - qemu,aplic
+          - spacemit,k3-aplic
       - const: riscv,aplic
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
