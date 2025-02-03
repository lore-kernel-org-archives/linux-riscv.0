Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB1DC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EJxwJUNkxz0aeiw+s+QU5xvti+11fzjWlc8t+XA7Wmo=; b=mn/D+7eRbc9kxo
	RQH9+m5usdw5zgNxQY47A9RvDWb3izENmuGkOhTiI7G+7MFEducDsoHbXfmd+iSd7eW+WL/0Hg6Co
	YYZCFyZ06r7372cuFkmDm7fjsBovuHtGqT+21oPha5uIqTQer3ylqTWH4qRTXOGfMJ05TRQWUBMiu
	v8GY54zmzFKNNnwKNzBFj9HxLWAwdKqrfK3DVxD7Q1VQClX/re7OqOx6IdtV8po+qkoLgoYLOLR0v
	7ydLujJl4NurL32xBRxMt7rxT4YgwnwuQ5gTsGgqd/keqQPjf/ydy3DktvMVoXrzYa/EBOF2gPi/2
	rEYhNY+DLRIfFUYeXP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetLA-0000000F56D-1HhQ;
	Mon, 03 Feb 2025 10:06:04 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetL7-0000000F55Q-3vDU
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 10:06:03 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 405A81F37C;
	Mon,  3 Feb 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738577160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=k+4MV07YEKE3WVQPcdYfmNRLjGuoGcSkZzHx+QMS7dR+v39cN65qC/so+uYHTvBymFW36W
	1kp40fddEGEyg3Hk4Fw3WSqWCrTYrXTVL07d+iUcZsXc1AFut7DoXGgnqIF6xF2uhRGrRR
	1/JthrOVxXwryIlRBhcpcHJ+XILZpaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738577160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=jL0Yl/3s3T0ZgX1pPpyYOZ0LVh3jtpm+ZmNeR/2Xi4vykMTKIethMnzqQacrRgrOSyFoG/
	cvCib8sF75tQO6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738577160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=k+4MV07YEKE3WVQPcdYfmNRLjGuoGcSkZzHx+QMS7dR+v39cN65qC/so+uYHTvBymFW36W
	1kp40fddEGEyg3Hk4Fw3WSqWCrTYrXTVL07d+iUcZsXc1AFut7DoXGgnqIF6xF2uhRGrRR
	1/JthrOVxXwryIlRBhcpcHJ+XILZpaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738577160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=z8WWUCewt8GWdziJ/b+QfhI909T7AMMSL3etFAdSg5I=;
	b=jL0Yl/3s3T0ZgX1pPpyYOZ0LVh3jtpm+ZmNeR/2Xi4vykMTKIethMnzqQacrRgrOSyFoG/
	cvCib8sF75tQO6BQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 3224F4A0551; Mon,  3 Feb 2025 11:06:00 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
CC: linux-kernel@vger.kernel.org
Date: Mon, 03 Feb 2025 11:06:00 +0100
Message-ID: <mvmfrkv2vhz.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_020602_116829_31D6695D 
X-CRM114-Status: UNSURE (   9.12  )
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

Make sure the compare value in the lr/sc loop is sign extended to match
what lr.w does.  Fortunately, due to the compiler keeping the register
contents sign extended anyway the lack of the explicit extension didn't
result in wrong code so far, but this cannot be relied upon.

Fixes: b90edb33010b ("RISC-V: Add futex support.")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/include/asm/futex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index fc8130f995c1..6907c456ac8c 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
 	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
-	: [ov] "Jr" (oldval), [nv] "Jr" (newval)
+	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
 	: "memory");
 	__disable_user_access();
 
-- 
2.48.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
