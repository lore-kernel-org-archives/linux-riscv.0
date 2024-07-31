Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2077C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh2/ah0WhuFzFQtEkb6oymwZNKRdNjW//UfnhhxyAB8=; b=QI1uhIz7nYqPtX
	aGarSV1FQb64E+uSM+qyPVucl92BSvFMFRhsT1IcrEiGGIiuyG0RJrisjHFYAqslZngD2zbOYjPQf
	BVeI8fGUu0ScAXW/XolxkvCam25RxEdkx7Zwsw65mPZDWZgU4yVgP6Tf4dR7mmbYkjrru403xIKqV
	wzZ9etjypeSo4q+gJ4Z38lppZVfArUtezcNmNoooy72lDTKlEbr8t3kngy7aeEi97xs8N5oYqaLDY
	dVw7H45slRUKQUkFkOF9Ej1ZEyR8G3Ft+jYFXJFLUEuORf4Njr3ur6m3sdWv5hksKg7zwau4OSdGK
	ZeVfSQ+gE5PY7Ysbk/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3iy-000000007A0-0FqN;
	Wed, 31 Jul 2024 07:26:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3iu-0000000078y-1VU2
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:26:13 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52f025bc147so7670737e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410770; x=1723015570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5b/A6qU74AkfxdtYyxiBPFCfAn9Wby9ZSL7Rzcj1cY=;
        b=qjLy4lFXVxiuJmpXn0bEvI0cZANuH3O6CWfzGO34CDgrfebbYDGYcUadOHQeDVG234
         STBKbyyiuOOQs9TgQ0d67oJk6oOM6EWt6Ty9a6XJO0+5I4jkeoIFlluZlKsbd9vCwjzK
         Wsmb0npKryWSSnsCkzjAd0x/vCGJ3PfGnwCdnG/JGNGlxq10KQ38cjJdykT+ZY2eDjM9
         17NpNrJV0My4kqCP02Ur8EUSUxOisbFWnK79QY2KvGf8QuTQg7paGteGqeuEwyIrWmsX
         n2rOjC9yYMMHCKJWlh2qp2d2b4rWqM3RMyckJG1PwJNOnb6bb5huz1K3rFjYZbkGNQrZ
         dzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410770; x=1723015570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5b/A6qU74AkfxdtYyxiBPFCfAn9Wby9ZSL7Rzcj1cY=;
        b=Bld3sHrJJzvI7LgNMLFWvDS+r8UXbjnaiC8SvO5C7gILkn6xpjm9FKE6F8yB4WsPVZ
         crRd7o+N7VgAK2cHotHB2rXfKH9WEZqj1VAFdn/wMnyVCG3r7d+lCnRvGHm3OQz4loVV
         TOWUhPrphUEg+gkmSmd3sV6l/jZW1R6VcYwlT1zg4DYV4b18WFV078S0x1jPN6OGw7zv
         GFdFq1EM8b0QTbayxxSbnC5g9uTcGj97Z8zPP9yqIzjozAG+Wd1yn04ShOrQZhRWkBNc
         ynJ0t9bTAO+0K+Z7f5LqB+jQHH7PuGxOZQ+EAJZMt1k7UF7xr+cIa5NNqg6U0Q8wDCTw
         L5pA==
X-Forwarded-Encrypted: i=1; AJvYcCV21bODghNz8Ry22/LsSsOXYVi2fgaCAUZqGSsgOaeoJdwHEtyaTXtTY3gqs9JI7x5zDWY1zq07TrAB+zbyxT49o9YRbPOEfiLQxLnCtv+z
X-Gm-Message-State: AOJu0YyvpZveoUk4Ndcx4dpx9XPNwN4qscVuRM+vTgJPGDnNhnPdZ6f3
	sPCZe2mMRTl07+kOWuq2C4+/UgqY5lGDouKr6OZiJlnWWr1EWCJkyrQfTo9LnZY=
X-Google-Smtp-Source: AGHT+IElDfoIlakrFYsMBeeLlbntHhhP6Di7Erttb/4pd4dWg5QISN3W8tux4DC9SLwXgyAkaGYd7g==
X-Received: by 2002:a19:8c58:0:b0:52c:f12a:d0e0 with SMTP id 2adb3069b0e04-5309b27a656mr7792329e87.28.1722410770171;
        Wed, 31 Jul 2024 00:26:10 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bac7349sm10525575e9.27.2024.07.31.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:26:09 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
Date: Wed, 31 Jul 2024 09:23:54 +0200
Message-Id: <20240731072405.197046-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_002612_423454_AFF06470 
X-CRM114-Status: GOOD (  11.37  )
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

riscv does not have lr instructions on byte and halfword but the
qspinlock implementation actually uses such atomics provided by the
Zabha extension, so those sizes are legitimate.

Then instead of failing to build, just fallback to the !Zawrs path.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ebbce134917c..9ba497ea18a5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -268,7 +268,8 @@ static __always_inline void __cmpwait(volatile void *ptr,
 		break;
 #endif
 	default:
-		BUILD_BUG();
+		/* RISC-V doesn't have lr instructions on byte and half-word. */
+		goto no_zawrs;
 	}
 
 	return;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
