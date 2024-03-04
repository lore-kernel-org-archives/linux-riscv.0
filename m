Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B3C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiLeDt9kseXxqyYSM28+lTv1aqou5Cihd4NvwmKWs8U=; b=t6EzHV08oR166n
	mpbn3QOAoGFLkMdXfZTp5D5a8Y/wxaiMFwL7THua+eRsuhCkW7dhAjhRsrJKj5PF/okE2WLWdz9gy
	QWAfqHpObog5Kku1Ffx0wWGz3IgzGlZAQ7D7+xWkaX6jiMyHiRFgqJwbrP7xhLqw11FPYBAZsARs9
	LxCmEG6K7WhM61dBSG2QIgp0ZULmmxTJkYBqrgp44NVSPiqi2N1wU3mBdB9tf6Smt2XSPuuneN+S7
	CaoBSW+o+M/hDMnltsTBelimvw2K7+1LXZNOJb9pIpYd/vqkWt+qAXBeqY0mtgdCz0+Jr1BPCUFOR
	cG5pn33jRdsHYX0q0XMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3Hj-000000082xJ-325P;
	Mon, 04 Mar 2024 08:02:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3Hg-000000082vu-05H8
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:02:53 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d220e39907so62142101fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 00:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709539369; x=1710144169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtlvrgqpZklQkEKYnLjgHRVt/fow+xyugZpWWHGtqds=;
        b=OfeywSCLMTf8a2cJiXV8JzecXx6Wp98appE/KK99hPuFQowE1FxWmTC0x1IVlFkmbV
         4sa3Gn/p8MrrekzJyrpdJLRMQK4fxN+yKTC3e3mKGqxPaK2GwcoL0CxA+OULvCfX/zwW
         J+m0+Z9wYolydt3ZIipUd246ttFjD6eqZqzE75wQHQCSBb4+jk+yORAbPnSVqjLO7hFF
         ZF0BxBPtszjbULQW+K9fp0VVALRw+/iBynJ+ocTwRiEmbNbUM341vCqSZvVzIsNt6OJt
         CYMasR6hF29oAyqh3kGoykgq0J3e3O58aqtVFzhP324tBWJ9VkaYFznMO1g0O+IGrU9L
         2yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539369; x=1710144169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtlvrgqpZklQkEKYnLjgHRVt/fow+xyugZpWWHGtqds=;
        b=p70UDt7RtBzYVhtWEulX5oL4CKgrJ3ZK/69BmSimHXprirb9wzcKEHC+IeMxAKhYZv
         ec3Kmvpbfe99/4/1Xa9BDNqAI74rCwU8th6SrZ0zpYh+ZcGf/E/b5+/zzxvbEVoAE4dX
         pRJIsNq7vvS1giqHu7akKPKa92IR5DR6Mivn4bOXGQ8cgio7Naq9173PATU9/Waea/n1
         vQ8bbQVGupPqROIzpvgeWKtuvthh8ZEApyqt7sY3mAKy3XEmmGNzXXKYucr1ogeX+QOK
         BpjcA8Aqiuz32eadlDMoQFgBjBGlDclZtA4Uphi8AN8l1hSfJFJz2To5iKWHPWk5pYSk
         u3wA==
X-Forwarded-Encrypted: i=1; AJvYcCXF7fYGLIFtPAdlHwFLcK00eahbzNjo8kBCWaFCvntcu0piVYgtxtXDEX898eIOOtlblRVzlZA7s+c+rpcel+uttFwS1EcjCT4ovBP06TBk
X-Gm-Message-State: AOJu0YxG4FhVCx/w9RFq7bTncD8hvvZFP+s/8ORj4+2HcEsEEVOTwgsJ
	LjfqGwj8ye6Mwqbqsc7M2jSzHQOyAkeNY30IXhMz5RKPmQ/F+miF2RFrKiFbSsPsGaISokQlAkz
	u
X-Google-Smtp-Source: AGHT+IFED/yYEBIF1j8I6CFBLLSnSkchoxI3Bvz64nJ6NMI0b0uSnfEaPsXBLlJrn8oZCubMvR0sfA==
X-Received: by 2002:a2e:958b:0:b0:2d2:7e19:f6 with SMTP id w11-20020a2e958b000000b002d27e1900f6mr6052452ljh.23.1709539369591;
        Mon, 04 Mar 2024 00:02:49 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0033b47ee01f1sm11442472wrq.49.2024.03.04.00.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:02:49 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Fix compilation error with FAST_GUP and rv32
Date: Mon,  4 Mar 2024 09:02:47 +0100
Message-Id: <20240304080247.387710-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_000252_320509_44F6E164 
X-CRM114-Status: UNSURE (   9.18  )
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

By surrounding the definition of pte_leaf_size() with a ifdef napot as
it should have been.

Fixes: e0fe5ab4192c ("riscv: Fix pte_leaf_size() for NAPOT")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 25ca14f6942c..54d26a07fa63 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -439,9 +439,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
 					napot_cont_size(napot_cont_order(pte)) :\
 					PAGE_SIZE)
+#endif
 
 #ifdef CONFIG_NUMA_BALANCING
 /*
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
