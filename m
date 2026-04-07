Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FD4FEEF27
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNA1xCO8ryZwAOzGTIoGOGYS2by9DXQED3ryL/S1XbM=; b=pcSTtH7Rd6HWdN
	sS6WsH0nQ+mu30HOX3oGQ8Uuz4FanxMrovivezSyZC5vMne0RmittXyfncc2MOaRMuMp2/zW0R8eW
	EjjOhCPsZfksvb83eDJa7VWZgTbl4E45KsE76hiV584JMZgDd7tJj1HaOg8Tk1y3c2K/77jCMvD2T
	yvaoFNVtDZ/VDQyeNHOv8gCR/zLhpvadNWHsrgcak0ZKJHoJOXuDt+PwqW8afsI5hkZOVSag8kFzx
	T76nVqgc5B3WWC95ZrrwL3fdF+t5vcRy5v8OE3gVhGOkGP9djnSxKJMFmZcXGdXmiGaIXWundxlBk
	6VZ9Ux69d1Wqbsx+ZEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4vH-00000006OpA-1umj;
	Tue, 07 Apr 2026 11:48:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4vE-00000006Ooi-3IMO
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 11:48:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775562521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjVuOjI1QhnGNHiP3xYcNfuccyBOIqbuiMz0Wq5xNS4=;
	b=0IxiLLLCOBPRHaIOYcw6Yd4Rnkvhgp/8QG6jnvl4LSogkStbEKzdTeQ5XrXcPQX1l10cvJ
	N5EOGGwYbCSSRYDggsWtKABd8dM7ixPAS05dZcvSZRvnwsF57MayY+o4nZ68VDB3PuEzwn
	T3F3caaOOa40VY9tw6otQOock7zHuXrYnb7O7ulG528YUTsBZCMVpDH3ggxml2Aje9dKyT
	25clCY8jkX4KCIv86Xlgg0x0gMRXVObU+Pfk8rlfmJhIfhTiaow7q+H1lbbr4Rhg8yP+mA
	CHYGq28rJuUiUdIW9J7VS35klYOndF/qhASALV/GakRinLkF7XjUCgx8IhWDKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775562521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjVuOjI1QhnGNHiP3xYcNfuccyBOIqbuiMz0Wq5xNS4=;
	b=d+LPaln9yej9Cx+xdt9S0nXeZsSFTpu2HqKODSNOHXu+C+OPrPp7X1DupsRKhOJZYO/Yt1
	5IQCpqI3MqLoahDg==
To: litaliano00 <litaliano00.contact@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add WFI to secondary hart spinwait loop
In-Reply-To: <CAK-CEVO6h+v-2iRdsR6THbOvoTrxM7xnmsDyXfnP5sAgUdmhYQ@mail.gmail.com>
References: <20260407074534.59179-1-litaliano00.contact@gmail.com>
 <20260407084514.syOsks4D@linutronix.de>
 <CAK-CEVO6h+v-2iRdsR6THbOvoTrxM7xnmsDyXfnP5sAgUdmhYQ@mail.gmail.com>
Date: Tue, 07 Apr 2026 13:48:41 +0200
Message-ID: <87tstnuh2e.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_044845_003697_3DE0111C 
X-CRM114-Status: UNSURE (   7.65  )
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

bGl0YWxpYW5vMDAgPGxpdGFsaWFubzAwLmNvbnRhY3RAZ21haWwuY29tPiB3cml0ZXM6Cj4gWW91
IGFyZSBjb3JyZWN0IHRvIHF1ZXN0aW9uIHRoaXMuIFRoZXJlIGlzIG5vIGludGVycnVwdCBzZW50
IHRvIHRoZQo+IHdhaXRpbmcgaGFydHMgaW4gdGhlIGN1cnJlbnQgc3BpbndhaXQgZGVzaWduIOKA
lCB0aGUgcHJpbWFyeSBoYXJ0IHNpbXBseQo+IHdyaXRlcyB0byBfX2NwdV9zcGlud2FpdF9zdGFj
a19wb2ludGVyIGFuZCBfX2NwdV9zcGlud2FpdF90YXNrX3BvaW50ZXIuCj4gQSBiYXJlIFdGSSB3
b3VsZCBjYXVzZSBzZWNvbmRhcnkgaGFydHMgdG8gc2xlZXAgaW5kZWZpbml0ZWx5IHNpbmNlIG5v
Cj4gSVBJIGlzIGlzc3VlZCBhZnRlciB0aG9zZSB3cml0ZXMuCj4KPiBUaGUgY29ycmVjdCBmaXgg
d291bGQgcmVxdWlyZSB0aGUgcHJpbWFyeSBoYXJ0IHRvIHNlbmQgYW4gSVBJIHRvIGFsbAo+IHdh
aXRpbmcgaGFydHMgYWZ0ZXIgcG9wdWxhdGluZyB0aGUgcG9pbnRlcnMsIHdoaWNoIGlzIGEgbW9y
ZSBpbnZvbHZlZAo+IGNoYW5nZS4gVGhlIGN1cnJlbnQgcGF0Y2ggaXMgaW5zdWZmaWNpZW50IGFz
LWlzLgoKWWVhaCwgdGhhdCdzIGFsc28gd2hhdCBJIHdvdWxkIGRvLgoKPiBJIHdpbGwgc2VuZCBh
IHYyIHRoYXQgcmV2ZXJ0cyB0aGlzIGNoYW5nZS4gQXBvbG9naWVzIGZvciB0aGUgbm9pc2UuCgpU
aGVyZSdzIG5vIG5lZWQgZm9yIHRoYXQsIHRoaXMgcGF0Y2ggaGFzIG5vdCBiZWVuIGFwcGxpZWQu
CgpCZXN0IHJlZ2FyZHMsCk5hbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
