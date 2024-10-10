Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4517CF07A9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDCH38K2Pp5jUJh+4gi5sZF1sHLUqxBy6qgNuFUR0Fw=; b=1QKALX/WsjIcu7
	hvVko3r85Q2TDKjTrQQ8xMTO/Qayg0mtdZL5l5jsHZzCsEfw7kn975Wry/Pij26Jf35lQYNMc01P4
	EVAwHFdnKIVytNG7c1g7U7PcIkKBqpFYIejHKR5BtAsBRBwugHG1WKih/04scnH6a24i7tzJIkclI
	Y519qsjL05jDkvy4XsKrFzVuZzKDNEqnJ3zUlnP+Tx7J6vHrVOvPQftQY7baKXW1myNavzd2FDQUn
	5SSP25G+ovbw2dXVKxfujLu2N1ff8euoe59QpBbIu57uTB4mizidpEInpe1E4B6iWeoAI9mOEs2PB
	w1THtGrWgH/n+zzRCOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1symOk-0000000BdJl-1rrG;
	Thu, 10 Oct 2024 06:11:42 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1symOf-0000000BdHW-24Wv
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 06:11:41 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id EBFF01FE18;
	Thu, 10 Oct 2024 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728540694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT2fu9eXrd1TBQvLN0DfKIwD5GlmFEOSKJXIbSwTQok=;
	b=oqKIsuKADR6QeBpYmyZhAW2ml0Et2ciysjjLGDBGOWcjFc5Q+/tNzi2QvhIl1ea32FUZRV
	TeR2vyPqg+jCpbe3FFmXnMG+UmdvRwzvTl5n4lgknSLevq7u18990HoDrrla9yoQnjhRmY
	uihfKEuTRm8QQLFIRoVmje2tYs9eDz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728540694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT2fu9eXrd1TBQvLN0DfKIwD5GlmFEOSKJXIbSwTQok=;
	b=+728j85QKTCr9tRHwIOnCZ9Rp5jkmui6yeJMGRUieH3xRqAwSaG18Ems4RDA6wmJhsTlON
	GUoZjHXTyGLPP3Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728540693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT2fu9eXrd1TBQvLN0DfKIwD5GlmFEOSKJXIbSwTQok=;
	b=LmPlEiIk9Gyv7CTjW3O4KBFEaKCR3Jr3yXX1Wv/Iq0EatR5VnhY86K99Qms28zR5yTn5Ki
	beIpp8jKznIVtr8HQFZcDLVz6QByAF8zeXe5tnlIUSoxqBLIOgRWrQKQ73v1RRF0eDOxzI
	Obw5AI0HXDeMlOJZGxqEPYBHX+y1rys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728540693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT2fu9eXrd1TBQvLN0DfKIwD5GlmFEOSKJXIbSwTQok=;
	b=+ZVo2cfPwyv0AfQmsF4GUuhVb70CwTyA6IsPtGmnTtzkLkn9XZAxzQRQv/MwGT+bEpKxXI
	rpWVX3xtO9Rhj9Bg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id DB5F54A0567; Thu, 10 Oct 2024 08:11:33 +0200 (CEST)
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
References: <mhng-adb76a44-07c8-442c-8bcf-6f29d061c031@palmer-ri-x1c9>
X-Yow: Why am I in this ROOM in DOWNTOWN PHILADELPHIA?
Date: Thu, 10 Oct 2024 08:11:33 +0200
Message-ID: <mvmbjzs32sq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.70 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,rivosinc.com,sifive.com,eecs.berkeley.edu,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_231137_707339_609643D7 
X-CRM114-Status: UNSURE (   6.05  )
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

On Okt 09 2024, Palmer Dabbelt wrote:

> Happy to pick this up via the RISC-V tree if you want.  Thanks!

Please make sure to pass it on soon, since it blocks building a
full-featured kernel.

Thanks.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
