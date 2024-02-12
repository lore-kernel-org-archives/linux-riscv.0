Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BB2C4829A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sj/ZJe0GWj5fMvR/lVb/j2zskUhuLPwEagKcKJLXWLc=; b=ndEmR7Qhv6TsIZ
	lZCKaMlUI76aFo1BY/BpoR/fshXkZn8DV1uK/eAVv6OqSQsz+klpLycJ482L+sMhBiGQthCRw9Ipb
	Ks5QVSihTJgG+6r41VtL/4WxFX6AGKZfThNxVa8P75jTNkf0chKOoHyrcFaMqcdaRu5co7GCyGqJK
	oJx6TfYAGHDiHqHuv3mxQ7d53Qog3JkGTs+YSrw57cRy4hop0VU1yPGhncU7LOoQAhak9UUGNuBgx
	+n49GTBA1HhT/FN+IAja71xTgtC1xAfU7xqXWxR1979vLv8nBqEXmjSug0kgfKyJ9s+YXXAgmjJWe
	I3f0lfyYTvtOHdqe6sXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTv-00000004DEd-3vKd;
	Mon, 12 Feb 2024 02:55:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTq-00000004DBI-1xx8
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d71cb97937so25990565ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706537; x=1708311337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox1XwYN/8KUHgBEQv3P+eTmNJiT79C/wgnmP2bJX61k=;
        b=FmqdRx5Dfw+UhlYBa/AX+bsneYqGhh6jWViBT/HgIkX6zLbcq7sHN0A4jPGQiCADAU
         Bee0LG+19lB0jAEifDt8vgR9FOuctHtxTGTpezFr/BIKs0qIAOZq+/SCXC5w5CgLTtS5
         HHHASeG7Sa6zsgAUPQghTXgvfxrMPU61OZ+IktJHMiIbI9AYWSXJHqwbIF1XhUOuEzWJ
         geFhbCLAxHzoJcTHYcHRmiEpgtsm5a0slSLhqRCn+FtHC+W1w8A39ReCrWvhhhTTu4Q4
         VVtELpbu4X1GEJOJHlqIgCK/p723ltGL43y9Qxo1YI2/52RcviV6sETWhixsfx4E6+wu
         chLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706537; x=1708311337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox1XwYN/8KUHgBEQv3P+eTmNJiT79C/wgnmP2bJX61k=;
        b=SOZnNljK3Y+mDq8WJjzdNCurUtMQFMBUt7EaUci5vpBHk9DxWhun42DvdAt0PkA3Rn
         NGOCEQyrlaa2jmEfHi0Jf2/krd4FtAvOku0/mLxNKevgvyQqG3EVBGE+MoA816ogShnQ
         fhQ4Tg3NlG++mowZATrOjyg5fqM5HMJk82oI95WqeMOVJEHbu6HD+UIzn2zzaOJz7jnR
         +3E/9cya3LsCtEkK7UXNZohnLSYlgkeSgEC8RxTc3SURMDYalw8eN8JB0fY8iIdaYPzO
         eWu27w9UJOtCov3uwWkhjjtNMD+yF8dLVZpcZQWZIbI3ju2GDbKRrRIDGF6Di4VA8iae
         Uh5w==
X-Gm-Message-State: AOJu0YzNF/6rB70WhlKu0nYtCdYddvaweOIIjjMMvSBEB5si78PfpaCP
	2f+OHxHsjn6bNRdQyO8whbxfZbx/wyi7LThYQXy3lSC4zmCj6oPwDtm5BQhZPHvY+mgK+lpGo6R
	F
X-Google-Smtp-Source: AGHT+IHYkVCajx+MEy/OfBC5bCV7cXqNkY+WfR1rDLZRGVuEpdHJ+RaOhpbXqqJFldLP0UL2Pylt4g==
X-Received: by 2002:a17:902:ec91:b0:1d9:a148:48a with SMTP id x17-20020a170902ec9100b001d9a148048amr6334084plg.24.1707706537479;
        Sun, 11 Feb 2024 18:55:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSKmmJnT8/3BSU7Qh0RzNAg0qQ1juI97gXPgba5vC2fWKScLl4PX6qPshaybpKTz5/v3owJsCFEwiJlXAtPYFw/embDaV2OphOMNya5Shdc8dllDXVfo1lnQ+DisEUKB9rWLv40/ii
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:37 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 7/7] riscv: Remove extra variable in patch_text_nosync()
Date: Sun, 11 Feb 2024 18:55:18 -0800
Message-ID: <20240212025529.1971876-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185538_531491_33F91DCD 
X-CRM114-Status: UNSURE (   8.13  )
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

This cast is superfluous, and is incorrect anyway if compressed
instructions may be present.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/patch.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index b0cf050738aa..80755aa627d2 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -176,13 +176,11 @@ NOKPROBE_SYMBOL(patch_insn_set);
 
 int patch_text_set_nosync(void *addr, u8 c, size_t len)
 {
-	u32 *tp = addr;
 	int ret;
 
-	ret = patch_insn_set(tp, c, len);
-
+	ret = patch_insn_set(addr, c, len);
 	if (!ret)
-		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
+		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 
 	return ret;
 }
@@ -212,13 +210,11 @@ NOKPROBE_SYMBOL(patch_insn_write);
 
 int patch_text_nosync(void *addr, const void *insns, size_t len)
 {
-	u32 *tp = addr;
 	int ret;
 
-	ret = patch_insn_write(tp, insns, len);
-
+	ret = patch_insn_write(addr, insns, len);
 	if (!ret)
-		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
+		flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len);
 
 	return ret;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
