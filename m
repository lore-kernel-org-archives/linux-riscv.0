Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86133C021A0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8p6DqcWVDZkl2upGoqr8pn0vDUxdXkIuXEz98RzcT0=; b=3956bC/8t/tnye
	OejX7w3qM7WVsxTNl7SZ9G+7205HikiyZ3z/ER7thlw3AK4haCTirzP2BOuyIbA+gOiBVM3h8cD6S
	A2OZZubXVLGTcTFlokvLUJU7/JoJVj7yRHjWkm9qMRgENqfGsaLYskWYbVlhRQ5qqrpGON3fwcO5m
	9Fr8qO1vUPJ9iwchMfcyvKeqUPpsdjVCq7IegecD39Kx9VqKilrgsC8wnxj6NMiJ6M2yz8ptVYXSv
	LEOOrtoUpXjiw/duzaA/iKSenpqu0KedtJqQsQ1LoSF/QZRGOU+49PNCIYw3Bq1MibTd/Zo3wCPm7
	HUrfGf6CRV1bogRrg9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGkd-00000008MAF-0M8j;
	Wed, 12 Feb 2025 17:42:19 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEI9-0000000HWnG-1HEG
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 08:28:22 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id AB8C021102;
	Tue,  4 Feb 2025 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=dFv7EHfmYh3C3Jea8QMhoMa9cE2WwgDaJWHdZx7304SlbraygrFKWmEP/YY9Qix3hUnL5O
	UlcH/m6AX4AR2gcxBKuSySQc4ZY8iZ2muni7cYaSeVi+BpxFusNlq70PMcDcIHngGuFNfS
	iHtUt8QrdHPxmFPKW5EqVPc6isz1eN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=cDFUmSHWzMp1a5BZmIvBbVG7eAHrS4yWLyk7hogKeROH5sp5sh/oV3DMVnIR44M6lIoTsi
	aPK8e2iZG/bAQYAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dFv7EHfm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cDFUmSHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738657699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=dFv7EHfmYh3C3Jea8QMhoMa9cE2WwgDaJWHdZx7304SlbraygrFKWmEP/YY9Qix3hUnL5O
	UlcH/m6AX4AR2gcxBKuSySQc4ZY8iZ2muni7cYaSeVi+BpxFusNlq70PMcDcIHngGuFNfS
	iHtUt8QrdHPxmFPKW5EqVPc6isz1eN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738657699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ueZJENhFmqxCDCfMr0f5hMTIbOvm/X56I5HrFFhEOPQ=;
	b=cDFUmSHWzMp1a5BZmIvBbVG7eAHrS4yWLyk7hogKeROH5sp5sh/oV3DMVnIR44M6lIoTsi
	aPK8e2iZG/bAQYAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 927364A0517; Tue,  4 Feb 2025 09:28:19 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com> (Jessica
	Clarke's message of "Mon, 3 Feb 2025 21:25:00 +0000")
References: <mvmfrkv2vhz.fsf@suse.de>
	<A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com>
Date: Tue, 04 Feb 2025 09:28:19 +0100
Message-ID: <mvm7c662jx8.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [14.38 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	NEURAL_SPAM_SHORT(2.09)[0.696];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_EQ_ENVFROM(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: AB8C021102
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: ++++++++++++++
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_002821_489501_0EAE7546 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 12 Feb 2025 09:27:38 -0800
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

On Feb 03 2025, Jessica Clarke wrote:

> On 3 Feb 2025, at 10:06, Andreas Schwab <schwab@suse.de> wrote:
>> 
>> Make sure the compare value in the lr/sc loop is sign extended to match
>> what lr.w does.  Fortunately, due to the compiler keeping the register
>> contents sign extended anyway the lack of the explicit extension didn't
>> result in wrong code so far, but this cannot be relied upon.
>
> GCC may guarantee this today,

It doesn't, that's the point!

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
