Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43CC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdC5PjwhjCon+0p1cnwtSewv3pDW/4hNhanfXQFCTQ8=; b=SZjDpwslQCsYZx
	vpXMSfACzmFM4mv6IgJr9tGJ6FtFSF8uXRti5oPzeZtfr/gJtHLx5dO3Kvt6GM23KrtGsAwdVoQCs
	T0r4X56c4ckH72SG9Nib9jvZGxsPf3pKEBuMoZ9d7AMz1SIKg7JV/5ZvjfE4zMkGgHhZqG8VXgzd3
	Vq4wqlkq8C9DZrahwPSnVyFNX32tlctivnhRK/AtBAu2ltrg7NJB+KePkFeHaLwqaCU5+HSrMz2qa
	2n2rGizrNwsNJuSgkXxqaoEvO9dcqegQjqUEPcxuRzUgZ3ksAHYfCoZKpMd9Rm4C/uIJRdUoOk4YN
	JadiR8Ebuwt/umoftk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplwX-0000000DIgO-3LVC;
	Thu, 28 Mar 2024 09:21:05 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rplvD-0000000DHez-3uCd
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 09:20:12 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id E844F33C90;
	Thu, 28 Mar 2024 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711617581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCUD+Fm+27N2UlU9YzPKCx9HxP70bveIrJEb1pJ2WgE=;
	b=lq1NRdOEqAcuyWJNOxAcsqTZYt56wvs4Oa7sisjDWgvuUjJ3V7A9wXvxyYZcKxeSQYCpbJ
	4xE5rzqBfzMZux5RQs7ZuXIOA5yJwe2nmazhVlLM20Yok1Xel+52NkWWsI351kFYgwxEbW
	MnKN7IZgPtp5exDsB3XWiqEe/MKJyOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711617581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCUD+Fm+27N2UlU9YzPKCx9HxP70bveIrJEb1pJ2WgE=;
	b=Dzcrld9BscW+BIGThR36jlBbZ6JLpEd+5TIy+PkJzY3T7cwmWua7HHJg2SAmyhNGtffMni
	7smBvuLH7ripKqBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711617580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCUD+Fm+27N2UlU9YzPKCx9HxP70bveIrJEb1pJ2WgE=;
	b=h9iW08zhQpcFKFcUzo7Air3WTrg3U7WYMvnU5TWAbv9FiWkZCLUo6fgNQii45vFtAej1EJ
	MrLyiCRECilRdkWyM/r8tqupLrCd+fQbJyjQfbdd+wPEa3z+fSpU06VGhY112wS6bWotmY
	TzNYuDeiBwmNvE+Z6MMqCjhuxjsd2D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711617580;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCUD+Fm+27N2UlU9YzPKCx9HxP70bveIrJEb1pJ2WgE=;
	b=whEj5fn7a/34PhtWFfAELCRu0atKNUoNfBgNWASV7r8bUKZZl7K6iGRE6NDloz8Tm0t1jH
	9e/unmnO669lpiCQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id CF2F64AACE2; Thu, 28 Mar 2024 10:19:40 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: 6.9-rc1 regression: irq: no irq domain found for
 interrupt-controller@c000000
In-Reply-To: <b929afe5-c148-499a-906d-fcf208b02fcc@sifive.com> (Samuel
	Holland's message of "Wed, 27 Mar 2024 07:56:20 -0500")
References: <mvmplvfg90v.fsf@suse.de>
	<b929afe5-c148-499a-906d-fcf208b02fcc@sifive.com>
X-Yow: Yow!  Is my fallout shelter termite proof?
Date: Thu, 28 Mar 2024 10:19:40 +0100
Message-ID: <mvmil16g1cj.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.28 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-2.98)[99.91%]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_021944_433119_DF6FCD3A 
X-CRM114-Status: UNSURE (   8.90  )
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

T24gTcOkciAyNyAyMDI0LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKCj4gSGkgQW5kcmVhcywKPgo+
IE9uIDIwMjQtMDMtMjcgNzoyMSBBTSwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4+IFRoZSBTaUZp
dmUgY2NhY2hlIGRyaXZlciBmYWlscyB0byBsb29rIHVwIGl0cyBpcnFzOgo+PiAKPj4gWyAgICAw
Ljc2MjMyOV0gaXJxOiBubyBpcnEgZG9tYWluIGZvdW5kIGZvciBpbnRlcnJ1cHQtY29udHJvbGxl
ckBjMDAwMDAwICEKPj4gWyAgICAwLjc2OTM1OF0gQ0NBQ0hFOiBDb3VsZCBub3QgcmVxdWVzdCBJ
UlEgMAo+PiAKPj4gVGhpcyBpcyBmYXRhbCBmb3IgdGhlIEpINzEwMCBiYXNlZCBib2FyZHMsIHNp
bmNlIHRoZXkgZGVwZW5kIG9uIGl0IGZvcgo+PiB0aGVpciBETUEgbm9uY29oZXJlbmNlLgo+Cj4g
SSBoYXZlIHBvc3RlZCBhIGZpeCBhdAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQwMzI3MDU0NTM3LjQyNDk4MC0xLXNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20vCgpU
aGFua3MsIEkgY2FuIGNvbmZpcm0gdGhhdCB0aGlzIGZpeGVzIHRoZSBpc3N1ZS4KCi0tIApBbmRy
ZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50
ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFu
ZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
