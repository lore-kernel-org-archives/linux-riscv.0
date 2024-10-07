Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEAFCED24D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 23:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2vYnPv6xqGNwsxhLU3NC1GFCuUeSQdwbI0fLg94IaHQ=; b=MUYJ1W1GtmZQcr
	DGLxLXH/QDvB204kiQBD6cVFJF5xdEjC77c0qFca8DsnxTD3G458U88LYqADtv5iiEIO4cYGSFtVH
	q0Py0iftJOey/bpEB8d2h1HOoZiB8SPqCilDu8BX01wcSwdT6GhGChfUE5qpZsLJrfCf2u+Zk/5oN
	jYP5LThhM8aqU2Tt3DbJZHCHngEbLQmxIQAy7nRW9t5IOyBsUuaNEkXGXP3xYXTwqhs5gfbu8NHqI
	JSXb9hBVWdxp4UFQMIOT010VSS41Uubiv7EjqmMde4liW2pcHWkHAMUrrG4pZwsTxDqEVSc8t4zz+
	1r8myJC+MwXoaMkertMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxxch-000000044AL-3YOQ;
	Mon, 07 Oct 2024 23:58:43 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxi6E-00000001aUR-2Ojz
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 07:24:13 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id E22941FD13;
	Mon,  7 Oct 2024 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728285847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VVxqbpcpXZewZglUoXE5j167IfC1NCYRa8tUWDda670=;
	b=ORmNAPgt+/y2C43V4nq4xzectkjXblHHtN7bO9t5NcoQDleqbZOgs1pBOP0vC5L9dj5o0d
	f13BDzF2HRnzAaLjoLN7itJByDXIcRQjgmH1GwYasxPNQ5Jy6gWCjh2rIAyLtoLAfoiNBC
	W4R5lPAsN6dKBxlnESrHCSZgbhflzKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728285847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VVxqbpcpXZewZglUoXE5j167IfC1NCYRa8tUWDda670=;
	b=jq61R+8MZenGVidiIuZQDmp2CMq48kjPBFa3ju7/oT0qgWtXz6REFbgd8izbe9WXOTFd97
	UKtnK5UqspSSxvDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DSo+sjC8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="E/qq1q0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728285846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VVxqbpcpXZewZglUoXE5j167IfC1NCYRa8tUWDda670=;
	b=DSo+sjC8iNf1Bifsk4jNlIWcPPLInYL9z9mVipp1DO0hBkoCNc2S/IVzsbTw8JZWz6TUJE
	5JCHfjixSZ0Aevek+bzitKkhP7Idz/YHwIcIB3c6q6ylrj5BsHzt98xFvpPcrK+vhCGcBz
	I2oCSRhgIPPR5iNmycJ7tecNBctE8cQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728285846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=VVxqbpcpXZewZglUoXE5j167IfC1NCYRa8tUWDda670=;
	b=E/qq1q0pO8/g/96NKAkfFJMkIsyRH+yVbrfDTb9oVjEHp3fTD31R7hn8YoFbbeqN4MkVNa
	E8vFRBj0Pp9wZbAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id AB2B04A03D4; Mon,  7 Oct 2024 09:24:06 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
CC: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Andrea Parri
 <parri.andrea@gmail.com>,  linux-kernel@vger.kernel.org
X-Yow: FUN is never having to say you're SUSHI!!
Date: Mon, 07 Oct 2024 09:24:06 +0200
Message-ID: <mvm5xq44bqh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [16.77 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[0.999];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.99)[0.995];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_ONE(0.00)[1];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[rivosinc.com,sifive.com,dabbelt.com,eecs.berkeley.edu,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spamd-Bar: ++++++++++++++++
X-Rspamd-Queue-Id: E22941FD13
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_002410_804988_9CF2E76E 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 07 Oct 2024 16:58:40 -0700
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

This is needed so that <asm/barrier.h> can find <asm/fence.h> on riscv.

Fixes: 6d74d178fe6e ("tools: Add riscv barrier implementation")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 tools/include/asm/fence.h | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 tools/include/asm/fence.h

diff --git a/tools/include/asm/fence.h b/tools/include/asm/fence.h
new file mode 100644
index 000000000000..917a173059a4
--- /dev/null
+++ b/tools/include/asm/fence.h
@@ -0,0 +1,3 @@
+#if defined(__riscv)
+#include "../../arch/riscv/include/asm/fence.h"
+#endif
-- 
2.46.2


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
