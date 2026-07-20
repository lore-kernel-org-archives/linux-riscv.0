Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49051C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOCNLO7lpxjd4LIDg53A0W6iNo9NbJSZRZNOqlPRiUs=; b=2HGU6kd6Su7fC+
	8ab4TMT6PmsrnXT5nzBQfNJzMctpzzFbQ661JFgWm3fSHjdRkTGsJJz6mTESieNklc6w9pfkS+lVX
	19phrWSiTObb5WAvEbJP7licVxzQrpBoYRm8hJ11rgCZlN9RtsJYdZ8lY1QuW9JriqnME9ZzZgn/B
	DC1ovFpXzQCCWFdHjnDHP/muabPQF4ceTV+dT/cumxMq83FtdoaVPmHEnlryO893e4sWpp8ZX7kN5
	nCd9x5Msmn3JOXWlkCOKHLYPxdXsD+yNAkj/429cX/jnc4KgGg5IUQ9bNhZOT5EOPJRIWjL7PmJMz
	mGlYhGIETviAY+LK0YDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmWM-00000006dbl-1CIB;
	Mon, 20 Jul 2026 11:50:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmWI-00000006dbH-3k1a
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 11:50:52 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784548248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iP84Zwl7DElLoZZcw01N9hnyozoySmk9iqXBXJo4/so=;
	b=jBdI2GQ+mT/faQgd7O67+Rjn/Zgqqifrl5fq0qo8oWfjraPV6fNV9giodMPntCMqnxcWPq
	cyJmECeTb+x5EOvvTQJRCItHZvEF7QFDhJqrFfhjHHcOTu0Q4pIzoLaqszf7gsTU87aoS2
	UrBlaiJTv5lG5AO92lGOkDu8PmU04LpWaSgEzPKTQvd9i2JKhD5CrUZfsf4HXje83GkY2S
	kJZL61+sp699Pi0hYzr0iKAXBgHdRhO+0BaKHGMokDcriW9MmzkO6HyWfKsS2MsAZRDaSk
	/CI1fcErFaECx+2BbJ65uunuPkq1ip3B4xg9gH4DSh+v9gPly6eRkgw8zaJomg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784548248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iP84Zwl7DElLoZZcw01N9hnyozoySmk9iqXBXJo4/so=;
	b=oNJsRAjHHPKKfuZ/e7cfazEW9gVugArNW+QhLyDdG86dt2sZ1VvC94q2DVroZatEfk7OAn
	hOy175G/eLq5ezDw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <20260720134032-032dc788-414c-4d7e-b72b-57fa5311adc8@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <b3447fdd87cdd607b685940a1801b841066337fa.1784274927.git.namcao@linutronix.de>
 <20260717142423-c5be3c7c-d4cb-4a68-8e85-3e3754e42666@linutronix.de>
 <87ldb5evs8.fsf@yellow.woof>
 <20260720134032-032dc788-414c-4d7e-b72b-57fa5311adc8@linutronix.de>
Date: Mon, 20 Jul 2026 13:50:47 +0200
Message-ID: <87fr1dev6w.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_045051_081293_4976EDC3 
X-CRM114-Status: UNSURE (   5.77  )
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

VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyaXRl
czoKPiBJIGRvbid0IHRoaW5rIHdlIHdvdWxkIGdldCBzdWNoIGFuIGVycm9yIGN1cnJlbnRseS4K
PiBUaGUgY2Mtb3B0aW9uIGNoZWNrIGluIHRoZSBNYWtlZmlsZSB3aWxsIGZhbGwgYmFjayB0byBu
b24temFjYXMgZm9yIHRoZQo+IGNvbXBhdCB2RFNPLCBidXQgYXJjaF9mdXRleF9yb2J1c3RfdW5s
b2NrX2dldF9wb3AoKSB3aWxsIHRyZWF0IGl0IGFzIHphY2FzLgoKU3dpdGNoaW5nIHRvIC5vcHRp
b24gYW5kIHRoZSBjYy1vcHRpb24gd2lsbCBiZSBnb25lLiBTZWUgYmVsb3cuCgo+IE9rLiBJIGRv
bid0IHVuZGVyc3RhbmQgdGhlIC5vcHRpb24gc3VnZ2VzdGlvbiA6LSkKCldlIHdvdWxkbid0IHRv
dWNoIC1tYXJjaCBjb21waWxlIG9wdGlvbiBpbiBNYWtlZmlsZXMuIEluc3RlYWQsIHdlIGRvCgou
b3B0aW9uIHB1c2gKLm9wdGlvbiBhcmNoLCA8ZXh0ZW5zaW9uIG5hbWU+CjxpbnN0cnVjdGlvbiBy
ZXF1aXJpbmcgZXh0ZW5zaW9uPgoub3B0aW9uIHBvcAoKV2hlbmV2ZXIgdGhlIFpBQ0FTIGluc3Ry
dWN0aW9uIGlzIHVzZWQuCgpTZWUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDcx
Ny1yaXNjdi1uby16YWNhcy16YWJoYS1pbi1tYXJjaC12MS0xLTgyYjViMDc5OWZiNkBpc2Nhcy5h
Yy5jbi8KCk5hbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
