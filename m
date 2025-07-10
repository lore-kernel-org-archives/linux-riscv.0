Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809D1C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3A3TXent8F2vtmZjo7Gc6W0MQTos70Tb8UM+Iy0wEJ0=; b=sq7Duj3c1Wakvm
	q6A4G2w2A6NFMZFpf6MG3iCqfM7ckkxff2/DGUCT4v0sp+FhC5pLlCV2/OKsjkvelp+IUZv0pU9z8
	j1vJ6nNVqySsO4bih16qPsbKituT0BKr/7NCcdvYWWguon6WJQTkLjubhkOxJf8r0FRgJWkbfI1a+
	78MIgXAWc+BWY0UQd+7Nna8ZWOXDR7GR66H8q8k0mu8DVW1LPn9spUxcXOS5mO4esgV8EpViJ0TDJ
	KFQYAI+3XLDXtHYkMHTOGtFjGiaWgUaXFaM6hWOBxHBIWBFDTClUP5QruKLVShSwBQb4nDPC0hnUL
	ov5/vkXOdJq2MW0IWE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZscF-0000000CB37-21gm;
	Thu, 10 Jul 2025 14:51:15 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrNs-0000000BwI8-30FB
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:32:21 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 13ED421224;
	Thu, 10 Jul 2025 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752154339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=T9azPhHwSyL+2rpi64FkvFQN6SjcG4EU0fNevquJrBI=;
	b=VjZ54DtTUeiXdgJ2iLduzmiAwwnH67ACDcdLQbz7fSAerk0MLnRaWOo59JN0Oe7bRtznB4
	WSgTt8932mhFEiZJWvj3yLUCoXLycLNFnU58qKDz2uk2fLjP5kWdwRDNxHykGAW628LDnH
	2o++1iXsrmhJNrMQvcWkR8WW0KdSDJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752154339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=T9azPhHwSyL+2rpi64FkvFQN6SjcG4EU0fNevquJrBI=;
	b=1pxWvLKpQxz1jHebKnfb23w8WRdG5vjQ1nNrTVku5cqtQvvgIhJ1nGYvGQ5JxXchof7bxw
	9bbclzyrhtZPp3Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752154339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=T9azPhHwSyL+2rpi64FkvFQN6SjcG4EU0fNevquJrBI=;
	b=VjZ54DtTUeiXdgJ2iLduzmiAwwnH67ACDcdLQbz7fSAerk0MLnRaWOo59JN0Oe7bRtznB4
	WSgTt8932mhFEiZJWvj3yLUCoXLycLNFnU58qKDz2uk2fLjP5kWdwRDNxHykGAW628LDnH
	2o++1iXsrmhJNrMQvcWkR8WW0KdSDJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752154339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=T9azPhHwSyL+2rpi64FkvFQN6SjcG4EU0fNevquJrBI=;
	b=1pxWvLKpQxz1jHebKnfb23w8WRdG5vjQ1nNrTVku5cqtQvvgIhJ1nGYvGQ5JxXchof7bxw
	9bbclzyrhtZPp3Cg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 043654A0569; Thu, 10 Jul 2025 15:32:19 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: traps_misaligned: properly sign extend value in
 misaligned load handler
CC: damien.lemoal@wdc.com, anup@brainfault.org, palmer@dabbelt.com
Date: Thu, 10 Jul 2025 15:32:18 +0200
Message-ID: <mvmikk0goil.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063220_899038_1C11A712 
X-CRM114-Status: UNSURE (   8.66  )
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

Add missing cast to signed long.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 93043924fe6c..f760e4fcc052 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -461,7 +461,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	}
 
 	if (!fp)
-		SET_RD(insn, regs, val.data_ulong << shift >> shift);
+		SET_RD(insn, regs, (long)(val.data_ulong << shift) >> shift);
 	else if (len == 8)
 		set_f64_rd(insn, regs, val.data_u64);
 	else
-- 
2.50.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
