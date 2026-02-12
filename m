Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD5EF99D3
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UtwDmNoDPXNa3iAHFurRqBFTViPCxOzp024MxqE4fU=; b=tSboYZyKj7YVDr
	4fPC9QT92bHoQ789282Qpbk8y3+lcunONxNwQ9kjqdZDP4HZcmPMD6vuEKZrfLqXKi8owgEm8n4Wi
	e75+nBKEaZm2jM0NXmqI5NbD9dmb9lezFXP0iHF0qPzxy5j2L1LOBmqPAYyThDgIAJiaTZPD2VK1k
	4PMVXSBRE/4GIGBhEWILLp5wdaHppfZiWA1RiyEFIs+QA2KIzR0CmthL3JrAB5FpPbmjuYfc+YyV0
	RCVJOkhNMJgNnJYNMphWAZ9fSrJo7B34381rU2Ymi1zla7NaeOty2Kurgvftw2e/sbL+BB7zFckW6
	sR4Tga4RInogiCq6Xg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzkX-00000003uM2-29bk;
	Fri, 13 Feb 2026 20:26:49 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqU1M-00000001wf8-0PSV
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 10:34:05 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id C33FC5BDAD;
	Thu, 12 Feb 2026 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770892441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeqIufAnYFkDobcmSJZWZ2CF3hg0EmflNlkkrGIm70U=;
	b=nsLKylHB2RCOPy8131sxnnODIOADcYH6mFmK5mdtcESmMXnNjDYV9fJUN6QJ0+8dNVULwL
	OeiKltQzlUQahubViNh8d4ygNwYOc4um3TApa4/R0ZRycLJdWM6Hx3iUZvCmRECW6xtIF4
	PKFbO6etyfBYAw8rR7+S2mMhtY2rjqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770892441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeqIufAnYFkDobcmSJZWZ2CF3hg0EmflNlkkrGIm70U=;
	b=ctraEmnnzOPGB2pjH+6bObn5UnOpNRFk6wffYbCuXaSwDTXjXcrDSLpgAAUyDMX/a11Wjr
	4spUj71SJeEfgqBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d8llgl8Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UKHSTwsz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770892440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeqIufAnYFkDobcmSJZWZ2CF3hg0EmflNlkkrGIm70U=;
	b=d8llgl8YGpXU3bLR71G4BOLv8H8nzNx0xCNaqYEQBknIKOLnjDf4H5XulvGAl35mQYAyQU
	ZyoB4rYuJ/JgMYuDvVxsafSNZEgwbCmJdaOupDN8LRrLSzgJfLNLTAUBMZ+Ba9hOJFx5+t
	9LuoN6rmuJB16LahLniFFfNRmdCF19I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770892440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BeqIufAnYFkDobcmSJZWZ2CF3hg0EmflNlkkrGIm70U=;
	b=UKHSTwsz4ggPCOXEVZLqlnng5t29saErflvm5qpBVM1LvWZpGvIj4K8uAuyKCXJzH53e20
	QzPVzB+HlRXI3DCQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id A8E114A0A2B; Thu, 12 Feb 2026 11:34:00 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,  linux-kernel@vger.kernel.org,  Ard
 Biesheuvel <ardb@kernel.org>,  "Jason A . Donenfeld" <Jason@zx2c4.com>,
  Herbert Xu <herbert@gondor.apana.org.au>,  Vivian Wang
 <wangruikang@iscas.ac.cn>,  Jerry Shih <jerry.shih@sifive.com>,  "David S
 . Miller" <davem@davemloft.net>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <pjw@kernel.org>,  Alexandre Ghiti <alex@ghiti.fr>,
  "Martin K . Petersen" <martin.petersen@oracle.com>,  Han Gao
 <gaohan@iscas.ac.cn>,  linux-riscv@lists.infradead.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: riscv: Depend on
 RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
In-Reply-To: <20251206213750.81474-1-ebiggers@kernel.org> (Eric Biggers's
	message of "Sat, 6 Dec 2025 13:37:50 -0800")
References: <20251206213750.81474-1-ebiggers@kernel.org>
Date: Thu, 12 Feb 2026 11:34:00 +0100
Message-ID: <mvm1piq9ron.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [15.29 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[0.999];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_SHORT(3.00)[1.000];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[from(RLajr16mudzow8bnf6sy)];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: C33FC5BDAD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_023404_312412_0D51AB23 
X-CRM114-Status: UNSURE (   5.10  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 13 Feb 2026 12:26:48 -0800
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

On Dez 06 2025, Eric Biggers wrote:

> Replace the RISCV_ISA_V dependency of the RISC-V crypto code with
> RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS, which implies RISCV_ISA_V as
> well as vector unaligned accesses being efficient.

That should be a runtime dependency.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
