Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BAE674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QCN3QK8i3hu0E5iijmHI2qIuNnXelmLayf/kLfApX8=; b=UGxm2wQTy6j8dG
	mq42uzA4JqByRuft6K0fp/lV6IKnrnQeFh0kzVxhZJUa9o4yRiGNe5g81klKkoHurLKqgST5+dW5c
	aZwMbBP1sUO1li7MqTBjM55Z3MlTabr2ZBoJD35CDLRaJ6zU5HGsj5xUmRWMAziY4Yc1H8Auo8oCP
	Y+rk4kserlMCS4C0iKjsuSvP/xBwv/rbMBmIKVH0/v3C7hsbom/DZUN7azyYsN6kFXaPw9HdaQnpe
	NgJxBt74iV1I1XfB5WRoxWEYHR28MqKw3EvPRjyWO2jRWgz/cSwEmDfRpS/NAjUGqMB9eWEhX37DY
	lZIFKrwkqQK4Gjc4RgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcL-0000000Dm69-1hWv;
	Mon, 22 Dec 2025 13:06:29 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcG-0000000Dm5B-3Oi9
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:06:26 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so3050137b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408784; x=1767013584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXhlYUOgp3ayhnB6iDyUlWrJZ3/fHlXGidOq3n++KU0=;
        b=CuS+KD3nluvYIBtmagSI1Gf81RqQihc6EPE9oua8L2wLQ72qO5EtwpCiNTb+TGH28W
         pYo97SAqoXJGpX/45CO0gqI3gpGYtNk/wNoTu4i/2oIbt1bJw2GXM3q/U0oossuOQg4L
         AT0M8NgN+tKNxdr2z879sH6slNqiXSfVHsxToUqIYi6JVoKEZR0v6cCldAweXXKyj51Z
         8uC63DH3uv1SirLw2a+pMHIZnhf5acpYpBjnqfLpFCTCLw5a7NjCR+aHQU0C6pkTsuvb
         Tc0dnzWF7ywQZTNzz7/g/yArvuyhTLUC4Fu7ukoRnlDbHTBvIaqTydDUXyz5U6vBCaiM
         cEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408784; x=1767013584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXhlYUOgp3ayhnB6iDyUlWrJZ3/fHlXGidOq3n++KU0=;
        b=lftfVEohxiv/GsdBm4FXFZRl9pkTdQhgwqbxPmLhnZD3Vzs7GGTebsU94LLSroYLNa
         9IqmOk9xB4o8gqJu5VLqzUsnFE9ILEuRDABacA8mecwyCxbU2ho/b8SQQq5C6N6/oZ+S
         DMsPHLgvJAwfV62refMFhvg5c3c4VIK4+c1oBIPSFQPTqeiPP0zE+i9KPj6DUT8tUCms
         u2eX6WmTENi2WfnAe3vjtZrQ6zvXby2uZCxjii1JOn0NiJZRQkcI+eNWPauYK/EGl/qM
         4gS5ACT3dhldJ+1EOwCzBPO6zGuHWPy9ZpgMnMIdnIemu0+jS6MYaBOBAzMJGZuiCiyg
         tsRA==
X-Forwarded-Encrypted: i=1; AJvYcCUS5aT5x84HPFMQxXV13UbDUQpkbeGpz2eSnlfabNo58u9AKP0lmMNE4Gr9E2xRisSkyv2i4tDHcSSGRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5BlyyOGsIGAdyGI70UgzXBwEg6ZuqJ2DbP1WyIiJUUomnqBSC
	EkFYAqHLgud3Eyq25FEr62QjnEKoWGCGWRKFiVaQ7Yl7ctdXfZ1kynUHJBC96d62awc=
X-Gm-Gg: AY/fxX5RgaJsGWbsjH+RpI5QYTCysUHokV/WoyfliE4vbIXb71SELJBpszgcLUbuzjK
	dAi00NJpJlIZ7IKVmDP/YFl/Y6FImlce9CfzagblYiN25EX0ZQ7h27BPiiRfTlhTiDVhWM9gsE5
	03SvxBCrrVNpEv++daAa6QO9J5eILDa3PFdJrIXpGcTCHlxxhcBLVVDdg9m6A7NuVUefHnpa3qb
	Z2dUeeAxlvikMkTlgeV0xk0eKMB6X2bHKRGJIZPWSGiPpk+AZQwDMHvgD8J0E8zs37qT/xzE9Ae
	4t7BTlEYV/vKNeIVqWNO32iggFJ5V13Sp6HZrP5JaJR5qdHQK18e5bKYx3YdwVhfJEuSaT/Kv7J
	fzjn5V3cjpKlIkMgc6slPcD2vSIXE/MKFk+oQ4L6YCRJHjViTgNMKC42K475ZRB1JWhhWkTu3lU
	/94IrkhuKJEF7kCGwR4vvK0CPD6Tjtzec=
X-Google-Smtp-Source: AGHT+IEMBF+3e0D/+sI/PT1plC6W+n/irFioveOjohAD5bO+6V93DVk5UOwucVi7eXYOS/loRQ/JUw==
X-Received: by 2002:a05:6a20:7285:b0:352:3695:fa64 with SMTP id adf61e73a8af0-376a94bf23emr11214001637.37.1766408783610;
        Mon, 22 Dec 2025 05:06:23 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:23 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:11 +0800
Subject: [PATCH v2 01/13] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-1-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050625_468381_63A4D74A 
X-CRM114-Status: UNSURE (   8.41  )
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

Add compatible string for the SpacemiT X100 core. [1]

The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
supports the RISC-V vector and hypervisor extensions and all mandatory
extersions as required by the RVA23U64 and RVA23S64 profiles, per the
definition in 'RVA23 Profile, Version 1.0'. [2]

From a microarchieture viewpoint, the X100 features a 4-issue
out-of-order pipeline.

X100 is used in SpacemiT K3 SoC.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
Reviewed-by: Yixun Lan <dlan@gentoo.org>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
     as per Krzysztof's feedback.
    Added reviewed-by from Yixun and Heinrich.
    Updated the commit message to provide more information about X100.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534fb63ed7c0eada97c42832431f1fc1..5feeb2203050ae1f1404100ab7ba93e224f72d97 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x100
               - spacemit,x60
               - thead,c906
               - thead,c908

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
