Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE387C61DBE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWQqM/a4my10m85Ea8iVpArltpyDlNE/0mW3lg0ZQgc=; b=p+6ohITemcTKAm
	EPhmWHCaJYvNkWWXv97DBCWAlZjT0obmCKk6lS/MHv3/nGvzZ6lzxnbw6hosYo+x3ttXiGjx4NRTQ
	dND0nkhDMX1f140xRmtus9IMW62HOUwQ/fYimhnlYGUFwtvE+OGzR7jVUfiMWY06gxXRReaKdqDTW
	iqlTEXENizMG7YM6TmOcqJLU5TT3CR+8pcr5ivjAT+3POhmg37ZZ0xs9gxO00/lF1HM7rH/Z9lQz4
	oLGJrh81dBMzJfk9K0VD/8xF9zRHWC6h42kWcmHnP5gE3vpM3+hgnzU7Loqz32CjWhCtyEZD5bA0l
	8R3y9vkBlMCm0xx9Qpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys1N-00000000x3S-0DUL;
	Tue, 25 Aug 2026 14:21:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wys1L-00000000x2T-08Ou
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 14:21:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d6b5aa7535so21179535ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787667658; x=1788272458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUIaTnK45WY2vRtazavyY3+ahE3JkVZ6njN4ijbUa/0=;
        b=bFLn9tpbZtDhQtHDWwZCe0yubk2yu1+HJOV09MawomxkdZiU9vP9FBZREXQbEFpA2O
         8UTd84slj/imspiXDg8aAR/Y4+9XvJvgaHWebUReb85pcI3QiX8QKp+WeXXjh26n45+S
         iW6FNmTTosSlDIROtfdGZLalD3bJ5xafMKouW9XBe6XHRFQT94Gwuw7CYTCRfusNsf0u
         SNjUIsicUFWTqXY2KA8HK98Jih7AngxquQ+q1rKRys0dzBTZ55diaTtCK6SkwPZXnjbI
         RiU+Lrm4hgNcbjc1hqqNI90jDAcSCvEtKv+Mn+ljn62eYZkSLEILK5CPHV94M1FfY/Gt
         iGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667658; x=1788272458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OUIaTnK45WY2vRtazavyY3+ahE3JkVZ6njN4ijbUa/0=;
        b=OJcLMdqp+cwq9MAbSlkiCGA/NxwD2gAFHrzxUJIjxyzlePaXma4Bnp4CfPPKjt3UJW
         ZW1r0h+9oNOXFHFPViQGc5Pgx1zH9NR8bIw2trG+rtHieXImile3wehBpJxbsrJYvd5w
         574A25/gS1M7v7p/fK5fTr7Mkv5qEG8nfNFj6trNa4T+ejgd/OLjQzuVDMa/aQWxU98U
         hAU2PGkvj12+6vDtnziEATctUd8/0CgljYLKieQTx2PyrdowlVDZ5JBg86r9azC3jCSY
         cJfScBr1EiCm3AkOvrOyQjs5kePPEi85lvDKejZk08qpfm2UFUMZ7YX5fF1npcU3OiG9
         QBXA==
X-Forwarded-Encrypted: i=1; AHgh+Rppj1R4uf1NOrY1IeOQxzdoi0IKYfQ2x4nPiY0AJa2gSiI+AfR+d/OXtDfC1ebkotB3dJ1KnaQm7/I9hg==@lists.infradead.org
X-Gm-Message-State: AFuF++nbNAJod89ijKgO0cYKYV2tlKTGcye0b6XEwqgPHt0PlXXkntW2
	Mdg+Ca63W560T3cZKFGkkq25kCTs2BwI7UGUUdPOst6Aoe+kQPPUk9fH
X-Gm-Gg: AR+sD1204ek+T/z5w3R2k19pukpkAzae/5eIrDzq7YEKoRlHJyEKVy2iTO+UAhOrCER
	DKWxXnGhzAsPc660reWiadBEUpj5lG5gxoVFPPe3fam18LCvRrS8gF2MP70I/55jwAr5PLIeZHK
	TORuKNE9Y0D06ODfC0m7orMnJ3ezDXVLDCVuNVHoQNcF+b6ipuhgChVJHbi4XICx5Gjzo0SnC6x
	JkWiYOR+TZ0XbGvvLOXRsccZeNLCZ2gj+mYzgZwwgqI5Bt0wkxTFTaCGH2C22I9e+NIUc2Zg7a+
	UrZ7LTMTH+2GKH2zBQ/3E3gl8ZloQvMuyy6xKIYuTCv+0izBdmTPrEovvCAJw9eU24I+H4HtWCg
	3cKpB7fI0gSq35kS4FexjSrlOWF2qKvPRi2uOz+aPPWdpa23285J6JqDM4hmk4ZmPGfUMFe2j2I
	+HANFpQoVduQbJ0dNRlX+W9tO+6Zd8TM9KbqJnhM8+ejJIjxoyzxy6VNA975HMGpZM4jwOjQ==
X-Received: by 2002:a17:903:124d:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d6e4019c44mr109545445ad.1.1787667657237;
        Tue, 25 Aug 2026 07:20:57 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768beaa3sm29867605ad.66.2026.08.25.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:20:56 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	conor.dooley@microchip.com,
	schwab@suse.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] riscv: hwprobe: fix has_fpu() to require D extension only
Date: Tue, 25 Aug 2026 08:20:34 -0600
Message-ID: <20260825142034.31230-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816003216.22534-1-skunkolee@gmail.com>
References: <20260816003216.22534-1-skunkolee@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_072059_074407_01D185C3 
X-CRM114-Status: GOOD (  13.13  )
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

The kernel never supports F without D, since D depends on F. As such,
has_fpu() checking either extension with '||' is incorrect: it
reports FPU support when only F is present, which is not sufficient
for D-dependent state save/restore, and weakens
RISCV_HWPROBE_IMA_FD semantics to "F or D" instead of "F and D".

Fix has_fpu() to check D only, which is equivalent to requiring both
extensions given the dependency. Revert the explicit F && D check in
sys_hwprobe.c back to calling has_fpu(), which is now correct.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Changes in v2:
- Original v1 approach (explicit F && D check in sys_hwprobe.c) was a
  no-op since F-without-D is structurally impossible. Per Conor and
  Andreas, fix has_fpu() itself instead, checking D only. Revert the
  sys_hwprobe.c change back to calling has_fpu().
- Link to v1: https://lore.kernel.org/r/20260816003216.22534-1-skunkolee@gmail.com

 arch/riscv/include/asm/switch_to.h | 4 ++--
 arch/riscv/kernel/sys_hwprobe.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..8186cda88e17 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	/* D extension depends on F, so checking D alone is sufficient. */
+	return riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7f91beb82a1c..1659d31fd288 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -85,7 +85,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	u64 missing = 0;
 
 	pair->value = 0;
-	if (riscv_isa_extension_available(NULL, f) && riscv_isa_extension_available(NULL, d))
+	if (has_fpu())
 		pair->value |= RISCV_HWPROBE_IMA_FD;
 
 	if (riscv_isa_extension_available(NULL, c))
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
