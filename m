Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95280D2AB3B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CYX6t6wYxBjpG+cuGQ7ZwgijjyDRN5NjOJz4HSEmBA=; b=LdHBPK/fnjX/eM
	vDYo2FYFlfNnZCXzD3kDpeFLrZw6ytjslQY3Bwo2DtxoAHWthKYmBODGH7Wfr44R3EYVWeiJN5s0N
	yYoZtASXEw/ER7yFuws384fPR84NQ+k2xIMz+seVOC3uwlUyQDUxiAH97t1u51pYMSQVy3bo13sU5
	/2v0lV4eUcGyF56PplUTsZhHaRrOaOtRTG/qVaNFr1NIif0AgaBxJUDa7EvllFS0juYKA91Kwlowx
	8VFMrvd1NGIpCL3VXTgJrvNu53gC2H42ekjWsYdd6RWvVKNKbyLCuYubHDlLpSJz5xOBBhsyiwRcI
	Dn/InBrT1WWdw15kqTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lvY-0000000EWKB-1qeG;
	Tue, 29 Oct 2024 13:06:28 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lLR-0000000EPEk-1LeU
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 12:29:13 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 441331FED4;
	Tue, 29 Oct 2024 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730204946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3Vz+dacbqRiljRz+LKhFaDlNU98ZdwgStJ4Tw81PDY=;
	b=UyaDviFZmWlD5ke2+kO5Qc2q1wm2rIpoDGTi5AQEehdzvGdc+y0FbuaXx1IhHKK76T3jqf
	VWVRGNhAFYsbr5Lv00tOpCzo4cznGUC2+m/2u20MyJecozaR5uIvfgx9o4skvlAV2LWPLE
	yA/F2r9PN57U4Z9czXLY9LUN+GD0DYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730204946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3Vz+dacbqRiljRz+LKhFaDlNU98ZdwgStJ4Tw81PDY=;
	b=CcpV7VJYMq5ImLuDSQD7No38skz4DvHQeUm19+Apq+ggs7JDMSC2ket1zak742Yy7LkUeC
	NqBNYR4xtoLPEDDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UyaDviFZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CcpV7VJY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730204946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3Vz+dacbqRiljRz+LKhFaDlNU98ZdwgStJ4Tw81PDY=;
	b=UyaDviFZmWlD5ke2+kO5Qc2q1wm2rIpoDGTi5AQEehdzvGdc+y0FbuaXx1IhHKK76T3jqf
	VWVRGNhAFYsbr5Lv00tOpCzo4cznGUC2+m/2u20MyJecozaR5uIvfgx9o4skvlAV2LWPLE
	yA/F2r9PN57U4Z9czXLY9LUN+GD0DYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730204946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3Vz+dacbqRiljRz+LKhFaDlNU98ZdwgStJ4Tw81PDY=;
	b=CcpV7VJYMq5ImLuDSQD7No38skz4DvHQeUm19+Apq+ggs7JDMSC2ket1zak742Yy7LkUeC
	NqBNYR4xtoLPEDDg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 2C5634A056E; Tue, 29 Oct 2024 13:29:06 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,  Charlie Jenkins
 <charlie@rivosinc.com>,  Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu,  parri.andrea@gmail.com,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
In-Reply-To: <mhng-adb76a44-07c8-442c-8bcf-6f29d061c031@palmer-ri-x1c9>
	(Palmer Dabbelt's message of "Wed, 09 Oct 2024 10:18:40 -0700 (PDT)")
References: <mvm5xq44bqh.fsf@suse.de>
	<mhng-adb76a44-07c8-442c-8bcf-6f29d061c031@palmer-ri-x1c9>
X-Yow: LOOK!!!  I'm WALKING in my SLEEP again!!
Date: Tue, 29 Oct 2024 13:29:06 +0100
Message-ID: <mvmy12714a5.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [4.09 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,rivosinc.com,sifive.com,eecs.berkeley.edu,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 441331FED4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: ++++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_052909_537789_FA2AE471 
X-CRM114-Status: UNSURE (   5.67  )
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

Ping!  It's already rc5 and this is still not fixed.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
