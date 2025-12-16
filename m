Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF1ED5E151
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d83hfmqcG7N/5wxdwmlLGeLrC7yQLoX9IcnmBxCTOeI=; b=BgbqPviEeoya0F
	jznBQJLN8sSfZbgk2UuT9T8Dn+D3Y7NeC5AFGBkVZliTrrYcUzUWzevQHDbdcoDdLUFhTqthgU3C0
	CQ2IWCdo1X0CGnmLy6OYS8Swz1ORAJYw4LGLbkXplMhYiAjm4eE9xeaNnKHLz+zliTNANLlFr3JL1
	Xxcz/IQ1CHntZqjsymx+NpbueZTteboGe91cDtwmY4ZCY4GChoIyYd1CLIGDjWd5hRBpJx25lhhgd
	MguwQ96pvJushg8RRMk8aDjVwtqpdAvbQSZrSIqJ6RIMWERm57V74zAJrCZm3QPPAEOcpMTof4FZ3
	QDl41ka5OxryQHhkK4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVAp-00000005GXq-0Ij0;
	Tue, 16 Dec 2025 13:33:07 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVAm-00000005GX7-2M15
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:33:05 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a0833b5aeeso48809765ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765891984; x=1766496784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwieFoqD7GSHNJIXxDJ7bzO+eNbv0m3QCXE/uSRPY3I=;
        b=aNfOACxdJAkizcsLkHyL8qjPZH/FmSzdbaSrUjYEfGfA0qVUVAagE+iieH1dAfxMo4
         w2E/UBepNUIlCDFL+kqTAcunbvEWFqAppgpjMfWEr395iFYVQdJg27OJTgXjscvkoNBd
         6tY9IrmccGV1k+LWH+EHqgxE6fkL4XIjE91kZ+Z4i6qoPKtlezCU45KUgRXmpo38CEQp
         B3Wnk5/vrm0AfanWFV28Z3XOatcECIzj+fIqmNfC+s0ojJ/17ZIyUHihw+3/NwR6G0iH
         8FbvyoUiQadDOkWFw3f6r+9hb6FAfaHzriI569W0mqQSzIrTmR5OwXE/85n5sLj+zZqb
         4qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891984; x=1766496784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwieFoqD7GSHNJIXxDJ7bzO+eNbv0m3QCXE/uSRPY3I=;
        b=tp3qT6hSUIcOVR8kaBnFp36YxobdOacKuSSIo4NnBjPYhUjiVPQNHczQH0GRspnyCB
         nmEgdwd6ewulSam2KaP2ryqV5mBdwgil321T5CyIFhG8+0pJVAkBX61hZL+GQNpwRjMA
         WnWsT9LPdngg9fwmv19tvLPjNm91Ogko3PQiE74L/0dZtvFshqYhYv6NX1JLfZ0ZwiNr
         14TfKxgc+zzErpSkYC75HTQKGhY1Kl02JLLA5NFv/4rOnk8IsS2Fi1qvJCNRwHtmnVVq
         PqCFKynK7FWrHfwceGmT5vaqJIiDLfd47LN26kj55sQ+NitkFKxH/dvVln82ffoWPwXD
         u/bg==
X-Forwarded-Encrypted: i=1; AJvYcCWNqhEeJaNLbi45H3MvNdc1dQc/jHpf9mIV/qIHWjzbHf6cvX3jaoqGIhbtjAGK3OGBYvk+pyQsnRb+rg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5b0itFFSpxrT4N6Ot1/tqVLz5uYIGSnXJS77xWF4EbHcfzT/b
	OPwqRUBQAmZGpkplvosCZPHRVGU/kw2EQjo+/V1AFhby8b52JY3bqFg8YwUx1s4UzUc=
X-Gm-Gg: AY/fxX5DCrYrRlDyONglqe2OhLbOb0sj/QUfDkfkh6SlC1ezUJhvRYYUG8gwCeDs4tc
	ARlKFoXqb3HZNfDtCvBV7ICzI5p4IcUjy0u+bPPQ97IUJdOoZpbQlhrBlJobR2EruEeJypw5jSe
	Owm4HsAAxz6hFy/dn1zRsMLWw7S8Qplklp3yOx8rSGhbRRtFHRWAcq47zxnuIdmP9a/gjLhbgOs
	H3dVr1bVf3qyNRFKliN3P344yZOlg2tNJnYiG17hihLHOAvo0Z7b8nfzEaoTR6aWMbx1kKEshRK
	+0bFMQckegsbmN72lDTRIvzs3pN7NpBBC+7a0V+RPT6mX6PgVDBBR6O8Wdh8jPCdLO+C4A+0QYF
	37HmxeemhLudCNTl/wy35VBPgJsp5xtpD1qtYrriqXFXMmiwfD7bcGwJf/BfTk/wtf6x0pktdZS
	+6MDQ6G1J6GviMXfDz7EzliCMhN22p4to=
X-Google-Smtp-Source: AGHT+IGHe5/9SaW81jyDKkQ0OPmaYehcP7QMhJzz2ZDa3a+RaUWBBtXL3A4tMbxbrOk89EkkF+fCWQ==
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr153671045ad.54.1765891983667;
        Tue, 16 Dec 2025 05:33:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:33:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:25 +0800
Subject: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com>
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
X-CRM114-CacheID: sfid-20251216_053304_612644_D38F5C5F 
X-CRM114-Status: UNSURE (   7.75  )
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

Add compatible string for the SpacemiT X100 (RVA23 compliant) core.

Link: https://www.spacemit.com/en/spacemit-x100-core/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154d9a256af6c7b6c19f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -62,6 +62,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - spacemit,x60
+              - spacemit,x100
               - thead,c906
               - thead,c908
               - thead,c910

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
