Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC1CD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfrsRcCh7Jw5mBw2vRLGP+yJJXdI/Tgngw/JK07zJk8=; b=CSCxpz0OLwtGlp
	vtV5fiZlsyRAJf0JPXrv0hqvlHEd8ySCJa4xknGVSTm7gaUkdkCXUt5vOqNc4tx2nwr7ez1LiYsSC
	x9C1G1xVDFD4vQjMEJ9VrgdSd6E2/vMmmN5VSNPXmaFEBR55CaOuegzYRC9tT2UAa7QT6bsqcPunj
	YbeAThO9NN/EaFnAevWX8l04MfBjJ6rzoMUbx+h/IjQaqXOXJoqsy9ceGL/WYOQ4ZDzG482AvXsNc
	Wn7dmRZKn6zHqKcB+3OdFCcl8Xtw9+9YXJgHY4oeqEP9iNGK6bXMryeRNr/ewoLZQ6seF7TIjUO8W
	NmQUgIRnKzRMeqJq73DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvNI-00000005VSh-1Z2Y;
	Tue, 09 Jun 2026 12:16:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvNG-00000005VSA-3uQ3
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 12:16:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4010D442E7;
	Tue,  9 Jun 2026 12:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E501F00898;
	Tue,  9 Jun 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007366;
	bh=XkloCPiWg4P7BbKfmWmzw0cLyp62VYh02fktyXEwlgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZceFMwHuhjMoxPVfsH8i3RA9WME9jhvz50z/QSvrasjf1snaRWcu3SX3UQF2Dj8Cj
	 zblpjWr4SzkcKuVgsj+O76I/HxGr9BJJlZ+98Yqog5W3CdG+f1ClNzm1vUq41l7mDV
	 n6d5aj+L7+Fyrh7QmQaJYQvfwvHecgS83ahpHNx3sHHGuTLsrUFjNF5k9uJpunT4yQ
	 61tyaVplz0K3uMKd92YaOVbBCP1uyl0ZOQRnF1kXy1iUaCYdTjWyduwTG0uP5VYOXC
	 H6SJMMVUAZrZONo3ZCc3EMuOzp/cOs724V1qPC4wLVqJqk//qTArmDEqXa2hTEkD/5
	 72CNQ8gKD4MFw==
Date: Tue, 9 Jun 2026 14:16:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Chen Wang <chen.wang@linux.dev>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Joshua Milas <josh.milas@gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.2
Message-ID: <20260609-free-bloodhound-of-election-d83fe3@quoll>
References: <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
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

T24gV2VkLCBKdW4gMDMsIDIwMjYgYXQgMDI6MTc6NDJQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IEhleSBBcm5kLAo+IAo+IFBsZWFzZSBwdWxsIHRoaXMgZHQgY2hhbmdlcyBmb3IgUklTQy1W
L1NvcGhnby4KPiAKPiBCVFc6IE5leHQgUFIsIEkgd2lsbCBzdGFydCB1c2luZyBteSBuZXcgd29y
ayBlbWFpbCBhZGRyZXNzOgo+IGNoZW4ud2FuZ0BsaW51eC5kZXYuCgpUaGFua3MsIGFwcHJlY2lh
dGVkLgoKPiAKPiBUaGFua3MsCj4gCj4gQ2hlbgo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1ZTczMToKPiAK
PiDCoCBMaW51eCA3LjEtcmMxICgyMDI2LTA0LTI2IDE0OjE5OjAwIC0wNzAwKQo+IAo+IGFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+IMKgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9zb3BoZ28vbGludXguZ2l0IHRhZ3MvcmlzY3Ytc29waGdvLWR0LWZvci12Ny4yCj4gCj4g
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDkwM2E5MzY0ZTQwNTYzZmFmNDczMGRjNjNh
ZDc0NDYyNDZmNDk0ZmY6Cj4gCj4gwqAgcmlzY3Y6IGR0czogc29waGdvOiByZWR1Y2UgU0cyMDQy
IE1TSSBjb3VudCB0byAxNiAoMjAyNi0wNi0wMyAxMDowOTozOAo+ICswODAwKQo+IAo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBSSVNDLVYgRGV2aWNldHJlZXMgZm9yIHY3LjIKClRoYW5rcywgYXBwbGllZAoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
