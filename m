Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E619D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rtuyfPqgKN40IHVV1XG67smZbAWfcA+ynT7DhXCdLI=; b=jwkbVcD3mX2F/u
	3iGbKbGIIfIsOijwmMc0Ahput6jDzOXDgnrbPGKjNCd+GGF/Od6ZihvOL8T5h9tgl8xLX9+UEr1IR
	fARD/GWWxaAjIS3cZ16z2d8j6THorZ73zjIFhcCAzSiHUrw2A9rwIfd0cOK3SzNZ4HbU1aiXJc0Jx
	X9nH0b1/AkGwquoyq3j/3+icCIHUJ0AqoqxH0H38j8uL8rH4cuQSgXVxA/iQkgtkucKrieN9DnULi
	ZOnY3nYVGmbzPVschTMfaC17Z7iNCoCCcOe9A5QxB9KgGDv7OSfc57EcjNqAH64zE3fPQER0AfUwI
	0hMi14TU01zGzsVRBB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6k-0000000GztR-2unf;
	Thu, 08 Jan 2026 12:27:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp6i-0000000Gzrh-0r8U
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:27:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so2973205b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875235; x=1768480035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQRNhZyBrryZ4W75vN/HbLrPnH9UQ6pAq5yFj98AFr8=;
        b=DasXV1W+hJy1/X/95M3fkoIZ3oDII3HlGLWRughZtr+k8PQNICZq6WZxzTPvYSY+ap
         ayNoa2ax+uZyuVo7aZSYGAtE2Zz+PxZpOCcvxolFh+XcohTX4eNPx7FoksDozIWsFxe7
         rKLGttYr4uhJYr7QD7TDT/WLZZmlvjQqMig1X5leusRRIRuDJTPm5dfYvlozY1tkxnxH
         pmLf53941437W2GvpxcpAwSjHzuxmZOyblng/OFHKM1Bdm/hs5fsoCQ2E9Cf7b+PvVaP
         AQKsUSTfFL831WMb2eJlNT0CDGnifg/OLPd8jVGZAwTpj5RbJxi6czTxR0UyDakocsqv
         hLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875235; x=1768480035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQRNhZyBrryZ4W75vN/HbLrPnH9UQ6pAq5yFj98AFr8=;
        b=lTPStJo1ZNWrQcNeMZqlhX6g6k+8gyRNmch54T3fyjtHMnotutWtwlJcPtHqvW3Q53
         nAkvYRREsNprIKMaIPYHiLE6WVxAY2+Gt0QjhKDZZwFKCdQVlfTJS0J7XuoGhXKi6Mdh
         250JZxHxmbpPZbEeXUKsAs8KqAJrew1EVsFu5l6NOZaMlBICDhscqXgNBgmrKSBScfPD
         hV8O+37no3tf7v2DQqXFNf/gMcxENnlTNPUU/hWQak8ORUj93fqC83pAZ4wW6VzYXWVc
         jRrW/ukRXucdVQOKBtf01duSEoS1TSl1JBP3LhzxNo45GZvQcD/BklbXmbjuWxUsZ6fK
         BXjw==
X-Forwarded-Encrypted: i=1; AJvYcCUAVrT9sjOFnIErGVVtex8P/Z8YPVSf9c2sP+MRPj8U5nhS8ddLDoQ8ri4HppuYm1zenYDOmcmUzNqKxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEBs2ZNwRY77xcByaQudGC6upsND0Lwdkj6UAFz9jdd4bi/1M7
	9BCTtW/a97OYmbxNahp7nfgcX8rGh6OW0c1N3dINMSc66k7nG42OghLSKP3E1AaVr0g=
X-Gm-Gg: AY/fxX45aSKWuVmB5nISVxytZsam6S7ZbgAvFfjegd11iWBLlucXvtWW68hVa8FBjZj
	x74N/ZPrJGBfQK/4dHw52WXgWttHDWQo7KWuU8Z9ilcXY+Cz5yiy8Sq1ztKxsAtrNJUuY7DSgYO
	3uwRLj7XlYEC5UqIGpZEPjHAI99RT+AgzXMg/lnOxIjY+MQkROdsGM8Q+sVrDs5mh39e8GMtTiV
	T+BvOScGbRRFVEw0gOrI4K0hW+W44PKZh+ujl/mogna10b3xFPoAZh/CHcEc+NEf+TvAIrx6d28
	SrFCFYQ4jlTEBB21fGEcOHrAqo/hvmzzp39DD68iQDkVNlRn/JpRN9yrFXVxU1jOoBt3mDlGE5l
	syG2Du9/xmGBj8DAp48RaD8pQUrqtxpkBBz2IGTbbqlRWdK8yB5u5aVuiSm2KxoPUDbMdzFeEfI
	rt07I+1NFXwM/1WhXSgjONjEVEbbDWJ+Y=
X-Google-Smtp-Source: AGHT+IFRYciZVmuwXxqgs2+z9bm/vSux/mZP8+GYdPklVFiskGwlhaojZKgF/mVDfvC0CzsE/D+StA==
X-Received: by 2002:a05:6a00:1d12:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-81b7d3584f2mr5778224b3a.3.1767875235211;
        Thu, 08 Jan 2026 04:27:15 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:57 +0800
Subject: [PATCH v3 06/11] dt-bindings: riscv: Add B ISA extension
 description
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-6-ed99eb4c3ad3@riscstar.com>
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
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042716_249764_A299BA1C 
X-CRM114-Status: GOOD (  11.52  )
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

Add description of the single-letter B extennsion for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.

The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
unlike other single-letter extensions, B was ratified (Apr/2024) much
later than its component extensions Zba/Zbb/Zbs (Jun/2021).

When "b" is specified, zba/zbb/zbs must also be present to ensure
backward compatibility with existing software and kernels that only
look for the explicit component strings.

When all three components zba/zbb/zbs are specified, "b" should also be
present. Making "b" mandatory when all three components are present.

Existing devicetrees with zba/zbb/zbs but without "b" will generate
warnings that can be fixed in follow-up patches.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Update the commit message to explain the retionale why B and
     Zba/Zbb/Zbs should all exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5bab356addc848abf8240991ff525c619b9fc0dc..e026b366c8f5dbe7d6988d3ed374183c165de35a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -109,6 +109,13 @@ properties:
             The standard C extension for compressed instructions, as ratified in
             the 20191213 version of the unprivileged ISA specification.
 
+        - const: b
+          description:
+            The standard B extension for bit manipulation instructions, as
+            ratified in the 20240411 version of the unprivileged ISA
+            specification. The B standard extension comprises instructions
+            provided by the Zba, Zbb, and Zbs extensions.
+
         - const: v
           description:
             The standard V extension for vector operations, as ratified
@@ -749,6 +756,30 @@ properties:
         then:
           contains:
             const: f
+      # B comprises Zba, Zbb, and Zbs
+      - if:
+          contains:
+            const: b
+        then:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+      # Zba, Zbb, Zbs together require B
+      - if:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+        then:
+          contains:
+            const: b
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
