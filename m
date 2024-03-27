Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864F6C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rys4Uj+rinE3POmQ2sWgtzDrgxdOEKWZlrSl3SBHwWg=; b=AMUzXKZfZLoZ/2
	FwqJ8eaqbSxNM1hIAZ7fCCCxhlee6LPtNIjTT2wQkM6bqX53xmw7TXmsbgjKBxA1qwcOmmiqlJvOY
	9vmKanSUpD2rtHhkVE17oDGsHNLC4MIA+6+fti5P+J1QC+uYFhGZWQFP7waJ4EEYBrgcWGPk8vOKW
	qZ5JsXuip6aPTRnLc0+gUc9XV1thQORElqAGk8gRICIRojBJd9kbEP/CfSUwr1d8lqM4bs/2JP8cg
	552hU2XcVQQqt7RybosvdydvIYVq6hNQbI/oYpegeHKqxakFJN3kMIUvPpPs+HIoXLirFV2DpK4HN
	IP63Z5DW4+xwe5eLxRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSIM-00000008p6p-3ME3;
	Wed, 27 Mar 2024 12:22:18 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSIG-00000008p0X-3Qsx
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:22:18 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8DE77604F3;
	Wed, 27 Mar 2024 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711542126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=gM8O9BMvpmcweC/49S6T4WsOquW93fnYjM6IK+bwXKE=;
	b=Ssdt28OT7qmUKLV8uScEd66ypiVH1N+F5aNhuNO1pdtTDLKthe/NdnKwwUIRBrNYWbuhSK
	62GDE5ReODFKOz0CcWBy5WCMSIEjpu+AMO23TwXBW2eoZlZLQgHJz9g778LTBcAFizzeio
	RUioF3j4Tv/bvID9gjEXuAunOCS6eYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711542126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=gM8O9BMvpmcweC/49S6T4WsOquW93fnYjM6IK+bwXKE=;
	b=T238+SQLURftQENgTnWvF65vJFoVbQlKraD9/dCFYuO1oaynJhrNiWDu98IQwa0xCCpc+s
	je9TJAvTDe1u7LDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711542126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=gM8O9BMvpmcweC/49S6T4WsOquW93fnYjM6IK+bwXKE=;
	b=Ssdt28OT7qmUKLV8uScEd66ypiVH1N+F5aNhuNO1pdtTDLKthe/NdnKwwUIRBrNYWbuhSK
	62GDE5ReODFKOz0CcWBy5WCMSIEjpu+AMO23TwXBW2eoZlZLQgHJz9g778LTBcAFizzeio
	RUioF3j4Tv/bvID9gjEXuAunOCS6eYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711542126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=gM8O9BMvpmcweC/49S6T4WsOquW93fnYjM6IK+bwXKE=;
	b=T238+SQLURftQENgTnWvF65vJFoVbQlKraD9/dCFYuO1oaynJhrNiWDu98IQwa0xCCpc+s
	je9TJAvTDe1u7LDA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 53E954AACE2; Wed, 27 Mar 2024 13:21:36 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: 6.9-rc1 regression: irq: no irq domain found for
 interrupt-controller@c000000
CC: linux-kernel@vger.kernel.org
X-Yow: Eisenhower!!  Your mimeograph machine upsets my stomach!!
Date: Wed, 27 Mar 2024 13:21:36 +0100
Message-ID: <mvmplvfg90v.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.29 / 50.00];
	 ARC_NA(0.00)[];
	 BAYES_SPAM(0.01)[46.21%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052213_100701_167AA21B 
X-CRM114-Status: UNSURE (   3.17  )
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

The SiFive ccache driver fails to look up its irqs:

[    0.762329] irq: no irq domain found for interrupt-controller@c000000 !
[    0.769358] CCACHE: Could not request IRQ 0

This is fatal for the JH7100 based boards, since they depend on it for
their DMA noncoherence.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
