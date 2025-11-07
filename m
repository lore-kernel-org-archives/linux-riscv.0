Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939FDCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXhJRQ7ZLppQUO8zwJiQt9jzTyXKVhhqzHvv2sJ3EH4=; b=GbThee9uU7Inph
	lM/RYS8rub2PjrSRrZ0Tn1hBMf8lyUXnANZ7m58dCLoH/CEb6GJA4L/hJO/qff/HbbanXrnyGMSLj
	NBtL1rbHy71P0HJx7mc8axlu1ov65aYbN4vYsG10CMfgZ5C+6qLH+X0CWKY8+tT6YyAAbhNNeTt1t
	4miNffVpOBGj4C8jfKkzxhfHVjXNa9YMEUbf5f9+aYH0LnU8c3n33audAXPHeJaYNkN6hw8wQ0sWT
	V+CEKicVKX5hDDVwUCvERJGOX23kcHTETbXGZIkgwyiuBvf3hEu2o4AVD6nr2UTlKWU8Z5/+04Ynt
	fiq+rMFxv/uCCXWiJCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQVa-00000000Jz1-3Txe;
	Fri, 07 Nov 2025 17:44:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQVY-00000000Jye-3wpx;
	Fri, 07 Nov 2025 17:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AC426191C;
	Fri,  7 Nov 2025 17:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C74EC4CEF8;
	Fri,  7 Nov 2025 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762537459;
	bh=vUXVxSlqnlNC2tbqdDtNDX2ebfN1pxrOSHo7fEAw12Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPyiuHMehYfo3g71SbYqe2NgLFsFFVMXj4vT7odT8obZ75hR69ps6sjFs7W80FROW
	 hsZ6pFPi88FRX2UD5Cm6+HC771R2+6brdPgwss1tTPliJYG2gsSBF458IPzk2biX4F
	 RNucbaE7viPNG0fA44kswLaF1vDw1xdcVm24mb9XAzFuUudPzZP2zjF7PkN8uRFPi3
	 v/mOgSdMqYEV8CsIQEdTu+nRG2wJjym0S+q1IPuIpdL1evYiCtDNkU1SRaMYdZVVx9
	 XorcU2JIf9Jvp9EVNM6QQghP36vq0hw9+ssncfOeRNtG4AI3En7iA7OjYAWpfAG3M0
	 mh5MCTsRK1scA==
Date: Fri, 7 Nov 2025 09:44:17 -0800
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid
 ext
Message-ID: <aQ4v8QhQjRYrxNK3@x1>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <20251007-ssqosid-v4-3-e8b57e59d812@kernel.org>
 <DDDL94HT7HYF.3VU2WQYU4WZY5@ventanamicro.com>
 <aOqjggmTr4ioHwB/@x1>
 <DDH2Q0N2HLKF.2QSW4DB5FTJI6@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDH2Q0N2HLKF.2QSW4DB5FTJI6@ventanamicro.com>
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTE6MDY6NTBBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMTAtMTFUMTE6MzU6NDYtMDc6MDAsIERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPjoKPiA+IE9uIFRodSwgT2N0IDA5LCAyMDI1IGF0IDA4OjQ3OjI3QU0gKzAy
MDAsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiA+PiAyMDI1LTEwLTA3VDIzOjIxOjEyLTA3OjAw
LCBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz46Cj4gPj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9xb3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcW9z
LmgKPiA+PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fc3JtY2ZnKHN0cnVjdCB0
YXNrX3N0cnVjdCAqbmV4dCkKPiA+PiA+ICt7Cj4gPj4gPiArCXUzMiAqY3B1X3NybWNmZ19wdHIg
PSB0aGlzX2NwdV9wdHIoJmNwdV9zcm1jZmcpOwo+ID4+ID4gKwl1MzIgdGhyZWFkX3NybWNmZzsK
PiA+PiA+ICsKPiA+PiA+ICsJdGhyZWFkX3NybWNmZyA9IFJFQURfT05DRShuZXh0LT50aHJlYWQu
c3JtY2ZnKTsKPiA+PiA+ICsKPiA+PiA+ICsJaWYgKHRocmVhZF9zcm1jZmcgIT0gKmNwdV9zcm1j
ZmdfcHRyKSB7Cj4gPj4gCj4gPj4gV291bGRuJ3QgcHJldi0+dGhyZWFkLnNybWNmZyBoYXZlIHRo
ZSB2YWx1ZSBvZiBDU1JfU1JNQ0ZHIHdoZW4gZXhlY3V0aW5nCj4gPj4gc3dpdGNoX3RvPwo+ID4K
PiA+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLiBZZXMsIHlvdSBhcmUgcmlnaHQgdGhhdCBwcmV2LT50
aHJlYWQuc3JtY2ZnIHNob3VsZAo+ID4gaGF2ZSBzYW1lIHZhbHVlIGFzIENTUl9TUk1DRkcuIEFy
ZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHRoZSBjcHVfc3JtY2ZnIGlzCj4gPiBub3QgbmVjZXNzYXJ5
IGFzIHByZXYtPnRocmVhZC5zcm1jZmcgc2hvdWxkIGhhdmUgc2FtZSB2YWx1ZT8KPiAKPiBZZXMs
IGl0IHdvdWxkIGJlIG1vcmUgY29uc2lzdGVudCB3aXRoIG90aGVyIGNvbnRleHQgc3dpdGNoZWQg
c3RhdGUuCj4gSSBqdXN0IHdhc24ndCBzdXJlIGlmIHNybWNmZyBkb2Vzbid0IGhhdmUgc3BlY2lh
bCByYWNlIGNvbmRpdGlvbnMuCgpJIGRpZCBzb21lIHRlc3RpbmcgYW5kIHRoZSBwZXItY3B1IGNh
Y2hlIG9mIENTUl9TUk1DRkcgaXMgbmVlZGVkLiBUaGlzCmlzIGJlY2F1c2UgdGhyZWFkLnNybWNm
ZyBpcyBjaGFuZ2VkIGFzeW5jaHJvbm91c2x5IGZyb20gd2hlbiBDU1JfU1JNQ0ZHCmlzIHVwZGF0
ZWQgaW4gX19zd2l0Y2hfdG9fc3JtY2ZnLgoKVGhlIHNybWNmZyB2YWx1ZSBmb3IgYSB0aHJlYWQg
aXMgdXBkYXRlZCB3aGVuIGEgdXNlciB3cml0ZXMgdGhlIHBpZCB0byBhCmNvbnRyb2wgZ3JvdXAn
cyB0YXNrcyBmaWxlIGluIHRoZSByZXNjdHJsIHZpcnR1YWwgZmlsZXN5c3RlbToKCnZvaWQgcmVz
Y3RybF9hcmNoX3NldF9jbG9zaWRfcm1pZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgdTMyIGNs
b3NpZCwgdTMyIHJtaWQpCnsKICAgICAgIHUzMiBzcm1jZmc7CgogICAgICAgV0FSTl9PTl9PTkNF
KChjbG9zaWQgJiBTUk1DRkdfUkNJRF9NQVNLKSAhPSBjbG9zaWQpOwogICAgICAgV0FSTl9PTl9P
TkNFKChybWlkICYgU1JNQ0ZHX01DSURfTUFTSykgIT0gcm1pZCk7CgogICAgICAgc3JtY2ZnID0g
cm1pZCA8PCBTUk1DRkdfTUNJRF9TSElGVDsKICAgICAgIHNybWNmZyB8PSBjbG9zaWQ7CiAgICAg
ICBXUklURV9PTkNFKHRzay0+dGhyZWFkLnNybWNmZywgc3JtY2ZnKTsKfQoKSSdtIGdldHRpbmcg
YSBmdWxsIHBhdGNoIHNlcmllcyByZWFkeSB0aGF0IGhhcyBib3RoIHRoZSBTc3Fvc2lkIGFuZCB0
aGUKQ0JRUkkgcmVzY3RybCBwYXRjaGVzLCBhbmQgSSB3aWxsIHBvc3QgdGhhdCBzb29uLiBJJ20g
YWxzbyBwcmVwYXJpbmcKYSBmcmVzaGx5IHJlYmFzZWQgUWVtdSBzZXJpZXMgdGhhdCBhZGRzIHRo
ZSBDQlFSSSBjb250cm9sbGVycy4KClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
