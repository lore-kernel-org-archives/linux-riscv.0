Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB4AC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaJTyC6a3gdFO7zEXBdAHQCHGihghpr4m257ujwe0Q0=; b=IMAsq47ugFx30e
	AmbQPWnBrG7C6zCTv5dGgM0Cqet4c3ExjfyMMk1CALTC9yYa04s66lUzE9Cio7DgCdM0oC50EMKaI
	UyduygfaGaUxcisH/gZsDevpirGvhQpdA7PNFPNwtB16MDQQmCqsMV/KnQslu+sneTFC9oJlzqsel
	jXVPc7Ep3f3VKycJ2KLKf4moT70vTk0XpmKAVfWgJMyQF8JC9SE99PfOjUA0x4P+vRTRgoK4boGjE
	Oz/lVof2WCmCE174IJafpIA7xPt0yKLsphm6eWwylM6sYK5R+BeLycQRIGPjvhOYglh/MkmdHljgs
	NmqeGJrkhBQFbMZHvj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB4-00000009uti-0X3Y;
	Thu, 13 Mar 2025 02:20:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB1-00000009usf-3uGK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 02:20:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22409077c06so12034615ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741832403; x=1742437203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYhELuNh/H+0ZU3yo6Tx42VZD/1lCOeZE6fYEs5O9r4=;
        b=E/JaPdfUInlD0miYOrDoZvnQuvn32/39Q/Q6L5B6+axTRk3ZpYFwi0ARXv9h06fm1i
         uuy9IuhbGCZDHC3yP1Xl2Ec3NUBQWMPIti/EGgv31kzxlgX0TSb41wzPjUVrYGLR2eBe
         aQKESvp/0hR5RFvuPRVAnKMtjKgiA5lRlSaG2vIkarJ65wt7UgMS+GEh7n6gs5izgcCu
         DSswuwoGL3hG61myh2vZTwyl3AikiQO8WCduI6hkz4PtirqXpwC/DjDtxU/8RhLWev4t
         QmMT//24lKIRWuigTf+wErIepDvphdmFk0S/AYje+uEgIHE4YKUu5lHj6X72//osRbFW
         29wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741832403; x=1742437203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYhELuNh/H+0ZU3yo6Tx42VZD/1lCOeZE6fYEs5O9r4=;
        b=E43HvpSKibgt1sdFrMYzsiPJyatXL1MuXiOA0Q51yiEVHe1ub8hy/d534PFLgLhyJO
         Gn+XTZCJRwPcY5llUz1/+BICXQlfk06NV4s6FBQR4LPGN+pil72+RyGPwyXts0TyqaXj
         GVwkyZ5+4z7kXHDT3p8kNfCiTaop86hoy1JXWbmnOYfF7OWYf6I+lFwoXFri/QB38ZVE
         TDgGeMn5JP+eaLyxcyOs6wiflojW8QZkptGb+R2EY0z0j8xTIb5qv0fHILiw2NNN+Ub3
         blViH2i8wYZ30LqPGRFtXQFCp70JDp+mlP06us0moZIuxLjoyml3RcXRCthcRybvKpSY
         66Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWhq5KFgjCqesUlzvZEA6LHgUuFEmUedMqBe/LwBf65o+nkLEwve55dXXXo+XWmKuqn8oAJw9foYoEPVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySh069Dh9eaEJa1vn4n4s+9H22/VH0bhXsSPARyaotovZ1ieKr
	WQKAW51Jx/Fk7bKsyFRLJydtRD1GLzBlocedkhB0GVCxPTcZJBG6
X-Gm-Gg: ASbGncu4lZRvefP106lqJkETSw0HfwXlea5Q0alQ2IW/SG//qR6PvJKMQ8LknJ7gdwQ
	IGOm/RCOIR1AGQst76tArtIX2wht4dvvnDQm7/Yw+azw2zMJ5UXT4qK/m5+UE0DcSJzoNcl5yGD
	50obpe8jX3KHI4ug9pJR50Eiwry+65IKv4Qg8ktaTkE696YnXU5AIqlwsSQeFxFLR9P8n55kkiE
	9SJF3CUAyXByHWkWbRm0F2vPznYxEwMdDGsHwcxhZIJY9WLFWBbXYLEWDEevoMnLya2q64jbY1u
	+EE4pEH6NrleCAo9p2Pd9uMyt1BLQ7GRfA/CMHYaQpoo
X-Google-Smtp-Source: AGHT+IHcxiSU+kMKPherfsGG+ddx6B45jAAx+w+XqsI7BCKH7gfYWRuQvwRSvxc64ktLopvBtjMDRg==
X-Received: by 2002:a17:902:e80a:b0:224:13a4:d61e with SMTP id d9443c01a7336-22428c0a43bmr308389355ad.51.1741832403015;
        Wed, 12 Mar 2025 19:20:03 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68887fcsm2696535ad.39.2025.03.12.19.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 19:20:02 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH 2/4] cpumask: add non-atomic __assign_cpu()
Date: Wed, 12 Mar 2025 22:19:50 -0400
Message-ID: <20250313021953.86035-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313021953.86035-1-yury.norov@gmail.com>
References: <20250313021953.86035-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_192003_971152_C1F0B8C9 
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

Similarly to atomic, add a non-atomic version.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 9289d4612170..f8caa025c6bb 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -1074,6 +1074,9 @@ void init_cpu_possible(const struct cpumask *src);
 #define assign_cpu(cpu, mask, val)	\
 	assign_bit(cpumask_check(cpu), cpumask_bits(mask), (val))
 
+#define __assign_cpu(cpu, mask, val)	\
+	__assign_bit(cpumask_check(cpu), cpumask_bits(mask), (val))
+
 #define set_cpu_possible(cpu, possible)	assign_cpu((cpu), &__cpu_possible_mask, (possible))
 #define set_cpu_enabled(cpu, enabled)	assign_cpu((cpu), &__cpu_enabled_mask, (enabled))
 #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_mask, (present))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
