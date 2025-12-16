Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B78FD5E151
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ixIHn+gC78wxXw4rQX5gzWFFgW+T5jysIasMh7cB4s=; b=ErCu3qB+rBeeAk
	DXkx6IbfwUIdhX2I/Tx8i2ecdCHwZT+CLx7fv+ZBMlWx4aQLZx5LNWilEsqlVPwk6BurBHUELdlAQ
	PItyQy0NqrwVmy80Cl8RXoVNwU2DVqI+//3AILO/l3PH6c3p/KL+1DTh0cQMYjseMt1mDvPJyVtRK
	3CTVaw8g0JocwIeoLdhZK6u7kwlSBhL+WxO+epi/XDQ1auKnoAAMT9UmgwzBelxWLGvT0Rz2QBxsK
	rnCmKBtaKg2K05Aw96KsYovdpu55C7XZgJAn7klwegw0sm7ju2gFPJo2fbjTrvOVlp92KukXSpfKv
	y51rE6ZV1uqqqnx/ChaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBD-00000005GeH-447g;
	Tue, 16 Dec 2025 13:33:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVBA-00000005Gce-1Mom
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:33:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0ac29fca1so25368935ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892007; x=1766496807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs9VW0IfWPzrbiE9L+0r4Qf5TkuQRPp65nyjMqVUyYo=;
        b=nCbJd3RRF7+bLVpWXyxVrx83MGKtaXTZMal13urr1khKQY7Hrwgnqf/70vZIhZL2qb
         DDVA+4udLQVgNiOv2bCORHPv3dQv2Am/dPVsnMF1lGfJFnf2wBGLbWXy6O4s+9CRKtF0
         NlDb/dCXi1pd8RGmSRi34pfeCTm33oQsNcO5BjwklsY7a0YcbjDA9MScUgkHPm3m211a
         rtSIs3QuHmozT9QCTzPUpRCRlWsz1bbQYDV43GnX6zkXAcQ7DY9XWbIjqwPkzogWpKKV
         4WLIBBVxSSz7Yaog3om+Jv1RFostabzNteDpM4+ePLmwd8HtWDbS2aT3mtG5Sfjo+vGc
         Praw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892007; x=1766496807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rs9VW0IfWPzrbiE9L+0r4Qf5TkuQRPp65nyjMqVUyYo=;
        b=FNK+qFtAq3GD4v38pUBEQDyhnZyl+FD6a96kRmW3s7ngEy1VLUNk+Yxo8H91Qto9DX
         k+w4gImDAXuHTIJ5tvoi514o3zlVtA1u7dZLgBDA+TKGYU4D6NQQQkPUEZ/RBz8kroFG
         uDMLkvWWjup11j89nrxQrTxbc9xF7h4SdTPHbPWAvZq/u8eBHAqmXaqcs6u8v0l2bJ4o
         r5FTsW9j1I3gMvywYH+Ngf1hH9OzBP3BEkkM+Te5slgzP9N4oNVe+X6SPoscDqZ2Ljax
         4ofTbdI5QdccpGgJg0TPtLHOUqCa2NM1zRH17qqMz7ureMio4yBw/wETICXel811mNxf
         dv6A==
X-Forwarded-Encrypted: i=1; AJvYcCV96EXOAvS6ZjXzsiURBht5Zr56dpyYPEAQUrDVhe84X1agyFOYVNZEu2F2azgrHLkD54nENR2AwmUzlg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz9gv9vlCBVsAzAjdIn5Ux3cLlbSrO6whXprNrfmvTTyvlz3Xn
	+qmR2e2l67DjhMDErCrXrS5emMUDcAyDnHUXFk++1LXMhC4RFpCNQgfhYSTxHxR9x5s=
X-Gm-Gg: AY/fxX5dyzUT7EFlNdauOkFEomvYz7KABAqMYX+m7ERolBGc7zie/AsWHUc71kiUYUP
	+x6seBHXZ354hT+RoHe1Ko1637+W9yM1sEKUN6HxPIKp1GgTpCcDWyLUlrTKSlmjNTlJ0tJrlaD
	CH2I5i2cG8vsx28xHOEJuZJLMu9qPWGMA5JLh4psbIrVdiE+4YCf4CTBqO2+qfRs/RAplsJIsa1
	0Dm2tsCr+4bbgp7RIWbyFUq+L5R9+3xitMg1zc0BzS/q1OJI+JkjvPyYfUIuxqEUCioCdIlP0AT
	EWNhlJFaYPRronkOfRJ8MVvfGDHg/9I+fxlJ/5syuceHI2iixj6Xfqvd/RA6kML2LtA8b9ziHv4
	q7FZLHl/JRU+wMW4E1ypyBP3nEQskduIbcpQdQL0ekmpcXLBBZXFhl4bcvat4+A+F51Cy74KqV5
	GezS3wvnHm1alDDOTQwJXykA7TzQnTFS8=
X-Google-Smtp-Source: AGHT+IHYO6VckBIE/NKNbVNQkjVqL/H4F2phLWFUlelSLlWr6JEkHmBJoAON7Tz83USpUb8q2a1UVA==
X-Received: by 2002:a17:902:f686:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a0abbaa7aamr118026675ad.2.1765892007376;
        Tue, 16 Dec 2025 05:33:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:27 +0800
Subject: [PATCH 3/8] dt-bindings: interrupt-controller: add SpacemiT K3
 APLIC
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-3-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053329_318169_A4E03C73 
X-CRM114-Status: UNSURE (   7.71  )
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

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index bef00521d5dacc002d24c50843ebe6380a7d5524..0718071444d29fbfa36283fc9666e8cecd6f77e7 100644
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
