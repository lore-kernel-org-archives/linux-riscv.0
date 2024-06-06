Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A93BC27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyLVRbJnr7kd45YAeli9jyV2T9tj92ummehT/CBC7QY=; b=qCvACMXmKnQvjc
	dNOonsFCunOm/H7LbqWcSQBlQ3TyW2pO3IQYtfl3Ws8MtUs3oiLS1qyYuJsPgENVGi4dToXegJWjP
	pB1H/ZGxvAc8TsULSG/Ecny6mcsA18pkT+2QzLSB8Xh2fXmJ2zcrIKa8bV8hoR4ahJaGXIVgDkjHq
	0HriMpjVuWTyqsNOM9LPZLvufuLNCgnFTIjgRHJQgsXX6HdVvcdklZXIsdDqeHHmgnxZJqvpwtgZi
	rm5idBB3y5vCNHjqn4toQO40+8ggsTqom3Vz7Hc5EBsd8uAauaF+77ietBnwBwRM3ydQ24qTA/yxM
	xHID9S4u+/CCvx69IOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9bS-00000009EYK-1lKg;
	Thu, 06 Jun 2024 09:40:14 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9bL-00000009EUh-0KJj;
	Thu, 06 Jun 2024 09:40:11 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:10:168:4:11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 0BA9D1F8BD;
	Thu,  6 Jun 2024 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717666802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/emRcecuEPEWjtJsdbqSVkHQav4CDEjorhc3/XLD1hQ=;
	b=1DndqkATBhtrBaxrwi/9LPU4XCDIVMVqaB1mkhPzF18IqNIihZZbtg8qm254BR32pfoq9E
	tXB4uJZbcs+7KMP/+1GSmFaKEX4AcGffHu5IjfVSQ4U/R8ZiQCO6Sxetnq7G6mY2WlRvO4
	O4nZ0ymAV+7kTHPYZYtKFyE5zE2jdNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717666802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/emRcecuEPEWjtJsdbqSVkHQav4CDEjorhc3/XLD1hQ=;
	b=wDTpVDr1+qpCkDVANUi/xfu8TTwhQddk6RfhBRfaLCFz3rsk7xuwgJqHe2fYhtV16sbwsn
	v9IRVfNhVKsNP3Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1DndqkAT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wDTpVDr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717666802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/emRcecuEPEWjtJsdbqSVkHQav4CDEjorhc3/XLD1hQ=;
	b=1DndqkATBhtrBaxrwi/9LPU4XCDIVMVqaB1mkhPzF18IqNIihZZbtg8qm254BR32pfoq9E
	tXB4uJZbcs+7KMP/+1GSmFaKEX4AcGffHu5IjfVSQ4U/R8ZiQCO6Sxetnq7G6mY2WlRvO4
	O4nZ0ymAV+7kTHPYZYtKFyE5zE2jdNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717666802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/emRcecuEPEWjtJsdbqSVkHQav4CDEjorhc3/XLD1hQ=;
	b=wDTpVDr1+qpCkDVANUi/xfu8TTwhQddk6RfhBRfaLCFz3rsk7xuwgJqHe2fYhtV16sbwsn
	v9IRVfNhVKsNP3Cw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 71E5B4A0552; Thu,  6 Jun 2024 11:40:01 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Shenlin Liang <liangshenlin@eswincomputing.com>
Cc: anup@brainfault.org,  atishp@atishpatra.org,  paul.walmsley@sifive.com,
  palmer@dabbelt.com,  aou@eecs.berkeley.edu,  kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  peterz@infradead.org,  mingo@redhat.com,
  acme@kernel.org,  namhyung@kernel.org,  mark.rutland@arm.com,
  alexander.shishkin@linux.intel.com,  jolsa@kernel.org,
  irogers@google.com,  adrian.hunter@intel.com,
  linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 2/2] perf kvm/riscv: Port perf kvm stat to RISC-V
In-Reply-To: <20240422080833.8745-3-liangshenlin@eswincomputing.com> (Shenlin
	Liang's message of "Mon, 22 Apr 2024 08:08:33 +0000")
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
	<20240422080833.8745-3-liangshenlin@eswincomputing.com>
X-Yow: Uh-oh --  WHY am I suddenly thinking of a VENERABLE religious leader
 frolicking on a FORT LAUDERDALE weekend?
Date: Thu, 06 Jun 2024 11:40:01 +0200
Message-ID: <mvmr0das93i.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [1.77 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	ONCE_RECEIVED(1.20)[];
	RDNS_NONE(1.00)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.03)[-0.147];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	R_RATELIMIT(0.00)[from(RLajr16mudzow8bnf6sy)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Spamd-Bar: +
X-Rspamd-Queue-Id: 0BA9D1F8BD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_024007_463697_625CECC3 
X-CRM114-Status: UNSURE (   4.67  )
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

On Apr 22 2024, Shenlin Liang wrote:

> \ No newline at end of file

Please fix that.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
