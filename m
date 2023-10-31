Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCE0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHgoFpJlBWWsMCB6MKmKvaCWmPfD8FG+zI0BSfDmOuE=; b=C3qeBfmYFwQzvx
	Z8t2IDhUPjRVztKR70LkwsSDXh9bNfU5SbnlTZAaTym7MIo+iRkkPf+fDHyujUy+hfdme9Eq4zvvU
	uX4BJCBoTG/Pzuss67SfpbNdpIQirRBU9H5eS0ZjC733WSvow6cNDzvxKx1dofRv3vWPkyOz1VU4o
	mh+coYv74FFe/NC4jrquUwm2ikSBbG81WNRa/UpovHNA0Fkr/FdCcnL13IPqtWDgRYapsHKfCE6If
	0Qkp6wkoxUEaAPVFKs3AzjaAQ5ahvAUDtYbnNonXUIvYUeoXA51VLO/lbC2RNRpL+MCjzAmj398I0
	KT1zl3hHZuIgn9O/gftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqm-005iZz-1O;
	Tue, 31 Oct 2023 16:44:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrqj-005iY6-0H
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 16:44:18 +0000
Date: Tue, 31 Oct 2023 17:44:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698770652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28hTh2QtsEc9f+qxvb2/9jKuUE46qstNvahPdxWDxXo=;
	b=JPvuDL8V7ZGmZZPSa3ue4WUbBK/fgMvhEZMG8Q1pN7FkmxHKTEoBYtFl7Qt2BCFbTv/9Cp
	jT+IZiDKJFrn34Spnf+aOp8FQk+qCnqT1bwCtu0BU1e9lV9ds8H1OLKcFS7mMri3dqd5OH
	8Q+Ge7xNe/JmONwxPtNsEfxNqyrhR7G/dBa+pDDiJNPo8cUxe2/pVw93W+6y6pu0Hhnbgl
	8W6gTtDQSVNCB29zpMHctAXxHnjZjDyorVFH0nmC/PORqWk9cXOB218DVEif1FIYNAOHL+
	kPuwmoIOlBbHnyEPO8B400Xixtasqh4E3IEoBiDmn/vYjN1X8IekAn+EwbpiEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698770652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28hTh2QtsEc9f+qxvb2/9jKuUE46qstNvahPdxWDxXo=;
	b=sY3yLfuTZZpgMxqFcUDNsvPWwc0schcvYnmzaKggzeNd+XGpmaCogSAV13hMDBGV4Tcyr4
	4D1+y4cjCa20COAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231031164411.9YRGasL-@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUEiCUxcd11inlRP@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_094417_264060_71489B95 
X-CRM114-Status: UNSURE (   8.63  )
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

T24gMjAyMy0xMC0zMSAyMzo0OToyOSBbKzA4MDBdLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IFll
cyB0aGVyZSdzIG5vIHRoaXJkIHBhdGNoLiBJIGRpZG4ndCB1c2UgdGhlIGNvcnJlY3QgbnVtYmVy
IGluIHBhdGNoMCdzCj4gc3ViamVjdC4KClNvIGl0IGxvb2tzIGZpbmUuIFRoZSB3YXJuaW5nIHdh
cyBDUFUtaG90cGx1ZyByZWxhdGVkCglodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMGFiZDBh
Y2YtNzBhMS1kNTQ2LWE1MTctMTllZmU2MDA0MmQxQG1pY3JvY2hpcC5jb20vCgphbmQgaXQgbG9v
a3MgdG8gYmUgZ29uZSBhcyBvZiBjb21taXQKCTU5NDRjZTA5MmI5N2MgKCJhcmNoX3RvcG9sb2d5
OiBCdWlsZCBjYWNoZWluZm8gZnJvbSBwcmltYXJ5IENQVSIpCgpzbyB0aGF0IGdvb2QuIEFueSBk
b3VibGUgY2hlY2tpbmcgaXMgd2VsY29tZSBvZiBjb3Vyc2UgOykKSlVNUF9MQUJFTHMgZG9uJ3Qg
dXNlIHN0b3BfY3B1LiBDaGVjay4KVGhlIHRpbWVyIGlzIFBFUkNQVS4gQ2hlY2suCkNhbid0IGZp
bmQgcGVyZiBldmVudHMuIEJ1dCB0aGUgY29tbWl0IGZvciB0aHJlYWRlZCBpbnRlcnJ1cHRzIGNs
YWltcyB0bwpoYXZlIHRoZW0gcGVyLUNQVS4gCkhhcyBIQVZFX1BPU0lYX0NQVV9USU1FUlNfVEFT
S19XT1JLIHdpdGggZ2VuZXJpYyBrdm0uIENoZWNrLgoKZGllKCkgYW5kIGRpZV9sb2NrLiBJdCBs
b29rcyBsaWtlIGRpZV9sb2NrIGlzIGFjcXVpcmVkIHdoZW4gdGhlIHN5c3RlbQppcyBkb25lIGFu
ZCByZXF1aXJlcyBtZWRpY2FsIGFzc2lzdGFuY2UuIFRoaXMgd291bGQgcXVhbGlmeSBpdCBmb3Ig
YQpyYXdfc3BpbmxvY2tfdC4gQWxzbywgc2hvdWxkIGFueSBvZiB0aGUgYmFkIHRoaW5ncyBoYXBw
ZW4gaW4gYSBzZWN0aW9uCndpdGggZGlzYWJsZWQgcHJlZW1wdGlvbiBvciBpbnRlcnJ1cHRzIHRo
ZW4gYSBzcGlubG9ja190IGNhbiBub3QgYmUKYWNxdWlyZWQuIFVubGVzcyBkaWUoKSBpcyBhbHdh
eXMgaW52b2tlZCBpbiBhIHByZWVtcHRpYmxlIGNvbnRleHTigKYKClRoZSBvdGhlciB0aGluZ3Mg
YXJlIGNvdmVyZWQgYnkgdGhlIGdlbmVyaWMgY29kZS4gSSB0aGluayBJIGRpZG4ndCBtaXNzCmFu
eXRoaW5n4oCmCkkgZ29pbmcgdG8gaGF2ZSBuZXcgcmVsZWFzZSBieSB0aGUgZW5kIG9mIHRoZSB3
ZWVrIGF0IHRoZSBsYXRlc3Qgd2l0aAp0aGlzIGJpdHMuIFBsZWFzZSBsb29rIGFmdGVyIHRoZSBk
aWVfbG9jay4KClNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
