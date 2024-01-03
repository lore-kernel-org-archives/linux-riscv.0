Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CBFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+dyXd4RSx9ivYbcYBuIOYBPnBo1sehKXVKCkoSj5ZM=; b=uM6dhSG9w9nd9e
	h740YELHJCayhNR+IfhXaVLV2wurUzbHj/GaZnhoBcIDhWFTIr/1o0n1TVJOPnyQTKxe+7ql4HQCy
	L02kubrTnEVt3I6YS4jR6Dve06yzxikU3LJpLN3FAyn89Q9ztOfB8wFcGXZAkSmR0MCYo1gqfZ7pC
	+0333W4jQRKgwJsj+OgQ2AD9+Vtyc8a5pq1PdlEuAxEdH49Q5eXmdw9l9fvl22IgWPq0W/HIGfOlg
	ukA6PKxQbP3Q7VH5+GWluERpgD1sEbOyNRzjOPAdNHzMG1HvJH1mmZVBQg9dQXgxL8XqXfftdE9tL
	zCf0CftBsoKBqbrfYJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzlB-00AgaY-2V;
	Wed, 03 Jan 2024 11:50:09 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKzl7-00AgVk-0n;
	Wed, 03 Jan 2024 11:50:06 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A2631FD11;
	Wed,  3 Jan 2024 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704282603;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zgez0zMWtIyb5Ng80nLKb/YRtWuLRDBmlGiyWt1MzQ=;
	b=lxh76lr9a6cbz3B6qoyE8LPDLwWWQF1FeaeqZtfPa/v5e6hKcT1b41M7ERVBjkC/xW5t+r
	4PtniK6PAw1bQ0db6TZzy63bS9Xy3ljX3Bv8tYmBzteLBuXl69jIDgXZrgOuDOwqbgy7g/
	ZpeFoPPMW1U6qu9iyy8bt74Z3LIk5Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704282603;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zgez0zMWtIyb5Ng80nLKb/YRtWuLRDBmlGiyWt1MzQ=;
	b=NJsmI7frp5883kcBjR9Ni4dpvu/+KpdWksbvv1Sb9NSv14BCefu6tmpAky9P06OONciofG
	3TywemivWGyh+vCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704282603;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zgez0zMWtIyb5Ng80nLKb/YRtWuLRDBmlGiyWt1MzQ=;
	b=lxh76lr9a6cbz3B6qoyE8LPDLwWWQF1FeaeqZtfPa/v5e6hKcT1b41M7ERVBjkC/xW5t+r
	4PtniK6PAw1bQ0db6TZzy63bS9Xy3ljX3Bv8tYmBzteLBuXl69jIDgXZrgOuDOwqbgy7g/
	ZpeFoPPMW1U6qu9iyy8bt74Z3LIk5Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704282603;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Zgez0zMWtIyb5Ng80nLKb/YRtWuLRDBmlGiyWt1MzQ=;
	b=NJsmI7frp5883kcBjR9Ni4dpvu/+KpdWksbvv1Sb9NSv14BCefu6tmpAky9P06OONciofG
	3TywemivWGyh+vCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C665C13AA6;
	Wed,  3 Jan 2024 11:50:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /EQSL+pJlWU9GAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 03 Jan 2024 11:50:02 +0000
Date: Wed, 3 Jan 2024 12:49:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
	Li Wang <liwang@redhat.com>,
	Andrea Cervesato <andrea.cervesato@suse.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Christophe Lyon <christophe.lyon@linaro.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
Message-ID: <20240103114957.GD1073466@pevik>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
X-Spamd-Result: default: False [0.55 / 50.00];
	 ARC_NA(0.00)[];
	 HAS_REPLYTO(0.30)[pvorel@suse.cz];
	 REPLYTO_EQ_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.15)[68.61%]
Authentication-Results: smtp-out2.suse.de;
	none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_035005_436274_82CACD58 
X-CRM114-Status: GOOD (  16.39  )
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgR2VlcnQsCgo+IEhpIFBldHIsCgo+IENDIG90aGVyIHVDbGludXggYXJjaCBsaXN0cwoKPiBP
biBXZWQsIEphbiAzLCAyMDI0IGF0IDI6NTLigK9BTSBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4gd3JvdGU6Cj4gPiBVQ0xJTlVYIGlzIGJyb2tlbiBpbiBMVFAgYW5kIG5vYm9keSByZWFsbHkg
Y2FyZXMuIEFjdHVhbGx5IEkgZGFyZSB0bwo+ID4gc2F5IFVDTElOVVggaXMgZGVhZC4gVGhlcmVm
b3JlIEkgcHJlcGFyZWQgcGF0Y2hzZXQgdG8gcmVtb3ZlIFVDTElOVVgKPiA+IGZyb20gTFRQLiBX
ZSBoYXZlIGJlZW4gYWN0aXZlbHkgcmVtb3ZpbmcgVUNMSU5VWCBmcm9tIExUUCBkdXJpbmcgcmV3
cml0ZQo+ID4gdGVzdHMgdG8gbmV3IExUUCBBUEkuIFRoaXMgcmVtb3ZlcyB0aGUgcmVzdCBmcm9t
IHRoZSBvbGQgdGVzdHMgKHdoaWNoCj4gPiB3aWxsIGJlIHNvb25lciBvciBsYXRlciByZXdyaXR0
ZW4gdG8gbmV3IEFQSSkuCgo+ID4gQmVjYXVzZSB0aGUgcGF0Y2hzZXQgaXMgcXVpdGUgYmlnLCBJ
IGRpZCBub3Qgd2FudCB0byBzZW5kIGl0IHRvIG1haWxpbmcKPiA+IGxpc3RzIChidXQgSSBjYW4g
ZG8gaXQgaWYgeW91IHdhbnQpLgoKPiA+IENhbiB5b3UgcGxlYXNlIGhhdmUgbG9vayBhdCBteSBm
b3JrIG9uIGdpdGxhYiwgYnJhbmNoOiByZW1vdmUtVUNMSU5VWAo+ID4gaHR0cHM6Ly9naXRsYWIu
Y29tL3BldmlrL2x0cC8tL2NvbW1pdHMvcmVtb3ZlLVVDTElOVVg/cmVmX3R5cGU9aGVhZHMKCj4g
PiBCdWlsZCB0ZXN0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3BldmlrL2x0cC9hY3Rpb25zL3J1
bnMvNzM5MjQ3MDIxNQoKPiBUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQoKVGhhbmsgeW91IGZvciB5
b3VyIGZlZWRiYWNrLiAgTWF5IEkgYWRkIHlvdXIgQWNrZWQtYnk6IHRhZyB0byB0aGUgc2VyaWVz
IHdoZW4gd2UKYWdyZWUgdG8gbWVyZ2U/Cgo+IEkgc2VlIHlvdSBvbmx5IENDZWQgbGludXgtbTY4
aywgYnV0IEFGQUlLLCB1Q2xpbnV4IGlzIG5vdCByZXN0cmljdGVkCj4gdG8gbTY4ay9jb2xkZmly
ZSwgYnV0IGFsc28gYXZhaWxhYmxlIG9uIGFybTMyLCByaXNjdiwgc2gsIGFuZCB4dGVuc2EuCgpH
b29kIHBvaW50LCBJJ2xsIHJlcGx5IHRvIHRoZWlyIGxpc3RzIGFzIHdlbGwuCgpLaW5kIHJlZ2Fy
ZHMsClBldHIKCj4gR3J7b2V0amUsZWV0aW5nfXMsCgo+ICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
