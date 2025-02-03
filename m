Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11964C02196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XJsMs8duiyfW18oQDdYOd+ZSPQ34mkGtuf6T48Zr/U=; b=xwOX+wZ1Fo2bjQ
	LSsnmA+ZeiCY+Do6XY9C/Aher5e+3/9Q4xvMj2LXUT1vpBEPxS6nnbz+o/BBS+6b/kKwzTxkeWbNk
	sEpBmv7CQvIq+PfZ1AIrwlIUptde18Blg7WwWbDLlLRYBTBdh4tWvbETbySt8Yhx3nR1PrxiP4oOD
	YFB2zVwDsMavyVDxTPov5VjIr4HXBeUouDf5vvujsoi8KLjv/mTJ8gjLH1+R8WwglOrV0lQk4tlgY
	/uRohdB6EuIoIVdCCCmGCwm4525HdRw3VZ0BzzTwkcLyuc54yRT6nRy78qkm2T3iuv0wKn53cEqbz
	GQSSdXfWDi/OvHIp33QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teydO-0000000FuZc-05mJ;
	Mon, 03 Feb 2025 15:45:14 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyd4-0000000FuVJ-02aZ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 15:44:55 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 70C621F381;
	Mon,  3 Feb 2025 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738597492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=lQXKuEEODvVX9SAns9BV/mPBaMxhgf2XJNtICeqN6nbpjMBZWo+aEmortLXgnLfK8V8n6G
	AAXDGBsir9tBQlI3RGTKLIzEEZfrutcC7ENYBBxU7t8lcpzxLVKWSOGHnfA5/e5kLn79eY
	OaLO7jEgkZ5C0rbz0CZc0R9Gtrspw18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738597492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=OTNX7fVmyQbr4QWulI5iJ4zsgek4rKbs7iVUrbJPyVfRMLyd7VAPUfnPozl75k382ddCqt
	VZlaPEkPtpicnbCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738597492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=lQXKuEEODvVX9SAns9BV/mPBaMxhgf2XJNtICeqN6nbpjMBZWo+aEmortLXgnLfK8V8n6G
	AAXDGBsir9tBQlI3RGTKLIzEEZfrutcC7ENYBBxU7t8lcpzxLVKWSOGHnfA5/e5kLn79eY
	OaLO7jEgkZ5C0rbz0CZc0R9Gtrspw18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738597492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U38BP1iA2Wv6XLn0cNaO7LCMdtkWZ8Pq3wyAGjQFYwU=;
	b=OTNX7fVmyQbr4QWulI5iJ4zsgek4rKbs7iVUrbJPyVfRMLyd7VAPUfnPozl75k382ddCqt
	VZlaPEkPtpicnbCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 6098B4A0551; Mon,  3 Feb 2025 16:44:52 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <87jza7oxep.fsf@all.your.base.are.belong.to.us>
 (=?utf-8?Q?=22Bj=C3=B6rn_T=C3=B6pel=22's?=
	message of "Mon, 03 Feb 2025 16:33:50 +0100")
References: <mvmfrkv2vhz.fsf@suse.de>
	<87jza7oxep.fsf@all.your.base.are.belong.to.us>
Date: Mon, 03 Feb 2025 16:44:52 +0100
Message-ID: <mvmbjvj2ft7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_074454_207333_A849229A 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRmViIDAzIDIwMjUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cgo+IEFuZHJlYXMgU2Nod2FiIDxz
Y2h3YWJAc3VzZS5kZT4gd3JpdGVzOgo+Cj4+IE1ha2Ugc3VyZSB0aGUgY29tcGFyZSB2YWx1ZSBp
biB0aGUgbHIvc2MgbG9vcCBpcyBzaWduIGV4dGVuZGVkIHRvIG1hdGNoCj4+IHdoYXQgbHIudyBk
b2VzLiAgRm9ydHVuYXRlbHksIGR1ZSB0byB0aGUgY29tcGlsZXIga2VlcGluZyB0aGUgcmVnaXN0
ZXIKPj4gY29udGVudHMgc2lnbiBleHRlbmRlZCBhbnl3YXkgdGhlIGxhY2sgb2YgdGhlIGV4cGxp
Y2l0IGV4dGVuc2lvbiBkaWRuJ3QKPj4gcmVzdWx0IGluIHdyb25nIGNvZGUgc28gZmFyLCBidXQg
dGhpcyBjYW5ub3QgYmUgcmVsaWVkIHVwb24uCj4+Cj4+IEZpeGVzOiBiOTBlZGIzMzAxMGIgKCJS
SVNDLVY6IEFkZCBmdXRleCBzdXBwb3J0LiIpCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2No
d2FiIDxzY2h3YWJAc3VzZS5kZT4KPgo+IEhtbSwgaW4gdGhpcyBzY2VuYXJpbyB3ZSAqY2FuKiBy
ZWx5IG9uIGl0LCBubyAoaW5saW5lIHZzIG1hY3JvKT8KCk5vLCB0aGUgaXNzdWUgaXMgdGhhdCB0
aGUgYXNtIG9wZXJhbmQgKG9sZHZhbCkgaXMgdTMyLCBidXQgdGhlIGFzbSBpcwp1c2luZyB0aGUg
NjQtYml0IHZhbHVlIGZyb20gdGhlIHJlZ2lzdGVyLiAgWW91IGNhbm5vdCBleHBlY3QgdGhhdCB0
aGUKY29tcGlsZXIga2VlcHMgdGhlIHVwcGVyIGhhbGYgZGVmaW5lZCBpbiBhbnkgd2F5IGF0IHRo
aXMgcG9pbnQuICBUaGF0IGlzCmRpZmZlcmVudCBmb3IgdGhlIG9wZXJhbmQgdGhhdCBpcyBwYXNz
ZWQgaW4gZnJvbSBuZXd2YWwsIGJlY2F1c2Ugc2MudyBpcwpvbmx5IHVzaW5nIHRoZSBsb3cgMzIt
Yml0cyBmcm9tIHRoZSBvcGVyYW5kLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMsIHNj
aHdhYkBzdXNlLmRlCkdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0
QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwoiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBs
ZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
