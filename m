Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C7D3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FIWBEY5D+HSYNplPCAt+k3cxP3gzPLlbmFJ22TSryE=; b=ghEpb2vsgfxUyv
	N11gHCdX9APxbFMWZ9Ia0j+EJ6WM5Xxly0viyZMkeCkCxzHevFDsUJXw9CkuirXfPWpKwtQHrTiQf
	6hD7aTX9u8xTGulYlAgRb0yOmX339KfCGzH8Eo/vIPSEBbfngqix7fl6j+KRzHDrAqENj7HggQ7jp
	8VcI+kMd3nnv/maXulwr7IcZ0HijjiOqrUN+pvVLDH9UsHQIc5iskoQC5C3tCBY7Q4t273L/xxHhp
	81hRWYNSZKP3w8NZtvkygJu2SO4184ASlvli7lfWRfilGiaVAohhDaEWeaOhkcsDtHCzwCscBxXTm
	ymVQu9nD6/Ed7b2r3N3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDg-0000000Bt4Z-2EVN;
	Thu, 15 Jan 2026 06:52:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHDc-0000000Bt3T-3G2z
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:52:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0f3f74587so4311555ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 22:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459952; x=1769064752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkACyF5knfi3YNNtTGrOijDE0psaJA8wPiea8JJZ1Ng=;
        b=Xu5AbcXKqnX7KHP5ouj27RVFlLicJLw0ia8Fj05dNO3V6RFipqaI4qsinvc7VhxyOa
         8cNEVLOM3+vO1JnyygYuw1mNgajk3lvawXaFxnOnp3IdqKLSlF8l8dWQ6P63IQd3nVoO
         snqMl9QBvuCWXGD6W52MPAhJtQVIY+MZoR0Uo0JT8WQOrHPQQp0Urscmw5qh4nTG+Jlg
         xD2g3UDyDeKgX7W1PqJOMdj+k9zihtCxEJBEgf79bUB0iGA00MWF0oERXpnJjx3a5xzL
         4meeOUjlVNLM87PBhERf9KvGInBpOopYNc2jVYBknXyqkVjMQwffuSbv5AZrNhSO9VoT
         ymnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459952; x=1769064752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SkACyF5knfi3YNNtTGrOijDE0psaJA8wPiea8JJZ1Ng=;
        b=kTqvTEr/Dygm9iJcdKu7asWWPYK3RiVd7Jj+ruCZtj0T2znOgnzFr6FszQQzBmWYBr
         By4SiXIwXjAUpXNl4Nqv9QloDEv81nr6Tn+jTVS89/aaega9XTT34SsaffbNYGwnv7CK
         dLEOOzpxJvU8MFlH4/aWYCZOcOXHN5RLA1niggOWHa8K2mXdswOmLZvhhGBW/Qu4y0A7
         ojmGMJZFTrGBW5uN/HQZU4aGC6E61ERd/SEe/cpxBvmAyzhBfjBkV6HqKxSjkyx1GN0L
         CqID5l4Fcf3kvyaVN2jK4IwYtguqVGFIeTsXYD6LRnVZ1bOrM06thBgzcYYGAFk1APxA
         yRNA==
X-Forwarded-Encrypted: i=1; AJvYcCX9YvUiIkbXar7BGo6cpef4/6z0/ZRoqEC+g+KGxkH+6GxtEHJtJhmcGPU4AD2WzmDljWmX4qRdf6Hjvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDV9iT4oNdhKRnjrMNYwcEGSEWKnfCzGwI9T61UmO9Uzg0FIHq
	M5ZfrBIb5tTnFVNcbM0qc/iXxXdr2abA99JHo5iKqiBV4+N5WJgMSuLnzZZv0iOQiDc=
X-Gm-Gg: AY/fxX79y2k4CPsujVO+/6G8qDE2UhBd2vAMlRJKsHGgICUkm4ULZNYMRRIAVPZ/bON
	BlPJSKxP+QbpxV+Pj0Ht/aBaEhe8TwbE8ULwE8ytrjVCvb8mZp0nJj1/pUTjG1ledlBrlxvaiJq
	T7pUPav6iiv4LctVixBMeGztcJ7YO0narE1zgnrVSjX/I0IQHntKsT+UUaYRjPwGqJxQp4w8FYs
	orbMQopAMopLsbZWiMmnwhn2k9FX4uVeaiXpM7+pmexTMpg5eiHFA50L/wkfqD8f9a11/1AV55E
	zIZOjsSoTaLn5DG2zhhjGHKPVgRpZHeMIkPF9vVx1KHJwbCei68MZ1G1M7lXSIBYVzBElJ7qEzq
	hn+hzqsP/9Ls4zLpda3K8rPGMUcJj51dM5vTfQjZkmEiJ0FoZ7wEuWaY416Dp2zF1C9HvwVtK0t
	QX0egH0BknEe3PYM958jMUaddAI2NXDITOFZ0j3oOdv15v5i5hk8cEg+vfTetS6eok
X-Received: by 2002:a17:902:ef08:b0:29f:5f5:fa91 with SMTP id d9443c01a7336-2a599dd69abmr51861225ad.27.1768459951907;
        Wed, 14 Jan 2026 22:52:31 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:52:31 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:42 +0800
Subject: [PATCH v5 3/7] dt-bindings: interrupt-controller: add SpacemiT K3
 APLIC
MIME-Version: 1.0
Message-Id: <20260115-k3-basic-dt-v5-3-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
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
X-CRM114-CacheID: sfid-20260114_225235_132093_752F95BE 
X-CRM114-Status: UNSURE (   7.17  )
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
v5: No change.
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
