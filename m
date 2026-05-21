Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7CCD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 22:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=weE5P/NbirmE7zwce23QUzMov9l66DhOkUVLyOTrOm0=; b=AHiDiU3VRbRXPK
	YSRcJoWL6KujRy3/WxLwuR98OA0/3lRWgADLUZpXyc6bUknMW+F1XrQKMkxwXK9LL8gloQfqQg5nJ
	hfoWOPEIXawUPuawGK3eyWW7LA1PPyaeRXCPxA1EK1ykJ+8hsQDCFEIkFbrO9fX6JXUyw6QDCV3Rg
	2/+z8wvngCM5xohsfuuXU9P+2PdzRInbeGtvrxKHYl2O9RR8XKM4p6BmsEenDnI2kSW5BjTtaNsrM
	duNhak/YM4bD9CvOeq1u6h5c8AM7cZ8L/JLSMnRAD4jWeuLegnxXyyu4gzjiLwr7BBkoqXGmdZLba
	43WfIQpc3YUonAPdaM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQByO-00000009Eh0-2umv;
	Thu, 21 May 2026 22:34:36 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQByM-00000009EgZ-37CM
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 22:34:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21CF6677AD;
	Thu, 21 May 2026 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779402871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YTRJGjduVvR0At74LMtBEoe5nzeCLt5tu/yYHyKvWKM=;
	b=EZOLIr3lOGwBAXTG0DF7qfO4Ha1oVntguITpW6Le10XPQM5vLoOv/sJw3ysoDCKDzvq31Y
	rRZUjFPeq5gWsso2Rk43mbPSlarMebBxfId+bHcUnmJIrdpCGq/7U0P9UEkmN40v0U4TPy
	raDRHN8rbU/y6Q9NwWsjSIQUgzIjoSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779402871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YTRJGjduVvR0At74LMtBEoe5nzeCLt5tu/yYHyKvWKM=;
	b=WuU2WRI2k7pN+Ayi7u/Lr0DeiVEsYKNlyKhr4qQhzy/l+IQLDyY3Y8hdZx9tZongKnNCWo
	izMLI1JrHJ4u5oCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EZOLIr3l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WuU2WRI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779402871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YTRJGjduVvR0At74LMtBEoe5nzeCLt5tu/yYHyKvWKM=;
	b=EZOLIr3lOGwBAXTG0DF7qfO4Ha1oVntguITpW6Le10XPQM5vLoOv/sJw3ysoDCKDzvq31Y
	rRZUjFPeq5gWsso2Rk43mbPSlarMebBxfId+bHcUnmJIrdpCGq/7U0P9UEkmN40v0U4TPy
	raDRHN8rbU/y6Q9NwWsjSIQUgzIjoSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779402871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=YTRJGjduVvR0At74LMtBEoe5nzeCLt5tu/yYHyKvWKM=;
	b=WuU2WRI2k7pN+Ayi7u/Lr0DeiVEsYKNlyKhr4qQhzy/l+IQLDyY3Y8hdZx9tZongKnNCWo
	izMLI1JrHJ4u5oCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF224593AC;
	Thu, 21 May 2026 22:34:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GQqXMHaID2o/HAAAD6G6ig
	(envelope-from <schwab@suse.de>); Thu, 21 May 2026 22:34:30 +0000
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv/ptrace: Use USER_REGSET_NOTE_TYPE for REGSET_CFI
CC: Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 linux-kernel@vger.kernel.org
Date: Fri, 22 May 2026 00:34:30 +0200
Message-ID: <87y0hcxuh5.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 21CF6677AD
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	internal_greylist_whitelist(0.00)[2a07:de40:b281:104:10:150:64:97];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_153434_942880_26F326C8 
X-CRM114-Status: UNSURE (   9.72  )
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

Fixes a warning while dumping core:

[54983.546369][    C7] WARNING: [!note_name] fs/binfmt_elf.c:1771 at elf_core_dump+0x910/0xf68, CPU#7: abort01/31982

Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 793bcee46182..f336a183667e 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -413,7 +413,7 @@ static struct user_regset riscv_user_regset[] __ro_after_init = {
 #endif
 #ifdef CONFIG_RISCV_USER_CFI
 	[REGSET_CFI] = {
-		.core_note_type = NT_RISCV_USER_CFI,
+		USER_REGSET_NOTE_TYPE(RISCV_USER_CFI),
 		.align = sizeof(__u64),
 		.n = sizeof(struct user_cfi_state) / sizeof(__u64),
 		.size = sizeof(__u64),
-- 
2.54.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
