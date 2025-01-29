Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21596C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ca9VKZIzyHHrKcZyK8yalviHif+HiNNzDkG7csaHcjQ=; b=Ih/mAwquO+Wa+O
	v7zLpWPxr91IUB/x1hcKKBexU4YgA4WjvVx37UJ6H9HLvvQ/AIyRtx5vNLDvU876Lip+/xbiSBBfO
	w1CKTZc3yMMGy4wWlvZxOtvr0qWrt7PFiC3GPFAbqkFUdt8SK8eszAW7iPfM6db6afkwS+ENwNdc+
	LQnVqTgehJiqjYVCmFE+nFYLvaNs/MAvSMgTnZza4hTV0BQPbHftHdXdNO1ZqIwbBdZZL+sdJf6qB
	tvHeijK1yblplYfYzaWAjmh1Hnqn2EUZtWxAauaynRDLO+SSM5mQhludqGdH081Z9MHW27zFCixVx
	OcrIz9wK6jCbG/LyYQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4yf-00000006ilF-1eVt;
	Wed, 29 Jan 2025 10:07:21 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4yd-00000006ikr-12G3
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 10:07:20 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 56CD82110B;
	Wed, 29 Jan 2025 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738145236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5ikMhmS5uA6dvME6rfAVoE9R8KwgeLx7HG7MYXnof8c=;
	b=oEjLPLnlMT6TYPAXEs/HijeCUDeDHFEUpWcXfmevnnQnFsWOmsLd09xlswPgq0UMMH1RwJ
	QPQlGH1mT/8GZwrgXQT3R1vtX4mJukQ7u9kXzhxtkg39HFpbyTKwZdMWTt9AzjTvbHfZjP
	ZgTCEaq/D29QPNsjwWbAfwFvtdbSYSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738145236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5ikMhmS5uA6dvME6rfAVoE9R8KwgeLx7HG7MYXnof8c=;
	b=3uNhU259tVrZHf8CG0+hxpUJzPh8Fk/fBcQcaRl0clkapH+YqI6fBpvrAMY2402FJlcRu5
	OJWxMoFyKJQZr7Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738145236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5ikMhmS5uA6dvME6rfAVoE9R8KwgeLx7HG7MYXnof8c=;
	b=oEjLPLnlMT6TYPAXEs/HijeCUDeDHFEUpWcXfmevnnQnFsWOmsLd09xlswPgq0UMMH1RwJ
	QPQlGH1mT/8GZwrgXQT3R1vtX4mJukQ7u9kXzhxtkg39HFpbyTKwZdMWTt9AzjTvbHfZjP
	ZgTCEaq/D29QPNsjwWbAfwFvtdbSYSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738145236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=5ikMhmS5uA6dvME6rfAVoE9R8KwgeLx7HG7MYXnof8c=;
	b=3uNhU259tVrZHf8CG0+hxpUJzPh8Fk/fBcQcaRl0clkapH+YqI6fBpvrAMY2402FJlcRu5
	OJWxMoFyKJQZr7Dw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id DF14C4AAD7B; Wed, 29 Jan 2025 11:07:15 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: Multigrain timestamps do not work on RISC-V
CC: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Wed, 29 Jan 2025 11:07:15 +0100
Message-ID: <mvmv7ty3pd8.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.18 / 50.00];
	BAYES_HAM(-2.98)[99.89%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_020719_430957_4FC6E31F 
X-CRM114-Status: UNSURE (   5.62  )
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

The statx06 test in the LTP testsuite fails since the multigrain
timestamp feature was merged:

https://openqa.opensuse.org/tests/4800409#step/statx06/7

The issue is that the nsec part of ctime does not change from the time
the file is created:

$ touch xx
$ stat -c $'mtime %y\nctime %z' xx
mtime 2025-01-29 09:43:44.677442605 +0100
ctime 2025-01-29 09:43:44.677442605 +0100
$ touch xx
$ stat -c $'mtime %y\nctime %z' xx
mtime 2025-01-29 09:43:51.641581658 +0100
ctime 2025-01-29 09:43:51.677442605 +0100

My guess would be that something in inode_set_ctime_current is going
wrong.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
