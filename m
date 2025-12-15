Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7528AD41D74
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hBdgzz6GjihcaEInHf0dqWw3O5gaBLZ/RAvOgRbW2mU=; b=kT/jaYgGAE/fLM
	gT/NPG3uhlnmubvtPdChVBPlsw+WhlUt/NER+ouWebAS6SnJXP1S1EBtaA5jHzSzOYobG+JV/6/7v
	HnYeOHpQOJCgQeIckE2DbnMsVjf9yQDzismiNrReXIEIUuH7nqKAwOlOWQ7AZuLNtROP2jonJnbZ4
	nMZLnE+BM8JYgbGYjKNDQAYC9NmnVhfAi5lTyb3KMMd/Rx/1EzKue+8oEIyBYM9uOu8DCHT/UOA+Z
	nScSIp2bLztCBYSWRpxX+kCX8upwZ4S9tvewbmfHmNQXojVz8f1wRHZkM43NjZsO11d8oMh/JTqmL
	oMIH6RpPKGbUF41j7YZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6wQ-00000003XhR-04k8;
	Mon, 15 Dec 2025 11:40:38 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6wN-00000003Xh7-2nMC
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 11:40:36 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 4CDD63381B
	for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765798832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zNfj/jlLvTAEeY+MzqE5tPfnPIij1sHOmQm+jKBVqu4=;
	b=FIpAOIl+M1gnklLuixkvgg4OJGdYxL87K/5h5GAA0xmFP6eTbs4s6wykvM2+HuC2TXeyDu
	lwGfjzxSjhVtqzQSoHraq6nanOEIOoIKtgRXOZxk56fw8Gg2dQnTT5uWCWNA/9jHVIScrA
	vVHWqhBCw+tUIKCKL7kPzhQZZzBc9ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765798832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zNfj/jlLvTAEeY+MzqE5tPfnPIij1sHOmQm+jKBVqu4=;
	b=Dk/ZdNNiy4TD5vMnrnlPvl1T1rEAGdZwV49JkX8SHOyRmBwSwh2o7OLoHfxdBUvC1vHx91
	gGk93cKtk5f9bBBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765798832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zNfj/jlLvTAEeY+MzqE5tPfnPIij1sHOmQm+jKBVqu4=;
	b=FIpAOIl+M1gnklLuixkvgg4OJGdYxL87K/5h5GAA0xmFP6eTbs4s6wykvM2+HuC2TXeyDu
	lwGfjzxSjhVtqzQSoHraq6nanOEIOoIKtgRXOZxk56fw8Gg2dQnTT5uWCWNA/9jHVIScrA
	vVHWqhBCw+tUIKCKL7kPzhQZZzBc9ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765798832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zNfj/jlLvTAEeY+MzqE5tPfnPIij1sHOmQm+jKBVqu4=;
	b=Dk/ZdNNiy4TD5vMnrnlPvl1T1rEAGdZwV49JkX8SHOyRmBwSwh2o7OLoHfxdBUvC1vHx91
	gGk93cKtk5f9bBBA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id E1FA54A04CE; Mon, 15 Dec 2025 12:40:31 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] errata/sifive: remove unreliable warn_miss_errata
Date: Mon, 15 Dec 2025 12:40:31 +0100
Message-ID: <mvmv7i8q8gg.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-1.46 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.54)[0.845];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hawking.nue2.suse.org:helo,suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034035_888158_E18BEC99 
X-CRM114-Status: GOOD (  10.29  )
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

When both the SiFive and MIPS errata are enabled then
sifive_errata_patch_func emits a wrong and misleading warning claiming
that the SiFive errata haven't been applied.  This happens because
sifive_errata_patch_func is being called twice, once for the kernel image
and once for the vdso image.  The vdso image has alternative entries
for the MIPS errata, but none for the SiFive errata.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/errata/sifive/errata.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 38aac2c47845..d0c61f86cba3 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -75,26 +75,12 @@ static u32 __init_or_module sifive_errata_probe(unsigned long archid,
 	return cpu_req_errata;
 }
 
-static void __init_or_module warn_miss_errata(u32 miss_errata)
-{
-	int i;
-
-	pr_warn("----------------------------------------------------------------\n");
-	pr_warn("WARNING: Missing the following errata may cause potential issues\n");
-	for (i = 0; i < ERRATA_SIFIVE_NUMBER; i++)
-		if (miss_errata & 0x1 << i)
-			pr_warn("\tSiFive Errata[%d]:%s\n", i, errata_list[i].name);
-	pr_warn("Please enable the corresponding Kconfig to apply them\n");
-	pr_warn("----------------------------------------------------------------\n");
-}
-
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage)
 {
 	struct alt_entry *alt;
 	u32 cpu_req_errata;
-	u32 cpu_apply_errata = 0;
 	u32 tmp;
 
 	BUILD_BUG_ON(ERRATA_SIFIVE_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
@@ -118,10 +104,6 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
 					  alt->alt_len);
 			mutex_unlock(&text_mutex);
-			cpu_apply_errata |= tmp;
 		}
 	}
-	if (stage != RISCV_ALTERNATIVES_MODULE &&
-	    cpu_apply_errata != cpu_req_errata)
-		warn_miss_errata(cpu_req_errata - cpu_apply_errata);
 }
-- 
2.52.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
