Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC37C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy2RKu9nmN9DsXW0P1+c0JZM20Y9CGHAJ6G0AGkFWyo=; b=Q57Elfa9Eb391A
	o62W3p0xICXJxjwi29+/OUMQVAt0xaB1Giw59EwHnwbpacdd3S0pfXdLPRgbNFyuqRIV/0axQTQPR
	soklTpUbaEnFKa/AOJsjdF+wvV4xMjLGr0Z7RpQHO28yLqbYgCyhduZ7J8BO2pSvLrQysW6HqIQPM
	0rw7gdGU6/RJOCqL7EkfxP0OgW5aFfnHT0OrI9S/ARJqwBreT3/jjkJS98XAdfa/Wiw5Hsy3JyG/h
	4bAqs3MBnlS+5Vlm+wrTAklIiraDwhBdH0whx16/nMZMTmScwzIX6MyB4dXc3DkG6AQYez2gN8Etx
	p3WDvydKQ/8SqHbmDiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0gQD-003abj-08;
	Sun, 21 May 2023 10:36:17 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0gQ7-003ab0-1c
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 10:36:13 +0000
Date: Sun, 21 May 2023 12:36:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684665362; bh=DHkS6vR075WOjYryzPWplYp9E9UCb+89BMbbIW7FyiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4j6MrFveCJ/eL/P6OzEPwPxvEcIStVL2HPwsp65qDZTBbuEp8VMEP+fnMdzfZbf2
	 p9HOisqOhrsIQUphD72u//kAtFUBo21iub42AsIJuSvOwgng4FF31iLnDhIsqVsKjR
	 keVBHoPhVpG12mpW7Qa4Dht4CO5uXEHOGs6gjsak=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 7/7] tools/nolibc: simplify stackprotector compiler flags
Message-ID: <ccd8a189-0ca1-4462-8478-87b6c6ccb066@t-8ch.de>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
 <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_033612_499448_47AFE673 
X-CRM114-Status: GOOD (  12.81  )
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

T24gMjAyMy0wNS0yMSAxMTozNjozNSswMjAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBO
b3cgdGhhdCBub2xpYmMgZW5hYmxlIHN0YWNrcHJvdGVjdG9yIHN1cHBvcnQgYXV0b21hdGljYWxs
eSB3aGVuIHRoZQo+IGNvbXBpbGVyIGVuYWJsZXMgaXQgd2Ugb25seSBoYXZlIHRvIGdldCB0aGUg
LWZzdGFjay1wcm90ZWN0b3IgZmxhZ3MKPiBjb3JyZWN0Lgo+IAo+IFRoZSBjYy1vcHRpb25zIGFy
ZSBzdHJ1Y3R1cmVkIHNvIHRoYXQgLWZzdGFjay1wcm90ZWN0b3ItYWxsIGlzIG9ubHkKPiBlbmFi
bGVkIGlmIC1tc3RhY2stcHJvdGVjdG9yPWd1YXJkIHdvcmtzLCBhcyB0aGF0IGlzIHRoZSBvbmx5
IG1vZGUKPiBzdXBwb3J0ZWQgYnkgbm9saWJjLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBX
ZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMTMgKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCj4gaW5kZXggYmQ0MTEwMmVhMjk5Li40NDVjMzUyYjFi
MzMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxl
Cj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCj4gQEAgLTc2
LDIwICs3NiwxMSBAQCBlbHNlCj4gIFE9QAo+ICBlbmRpZgo+ICAKPiAtQ0ZMQUdTX1NUQUNLUFJP
VEVDVE9SID0gLUROT0xJQkNfU1RBQ0tQUk9URUNUT1IgXAo+IC0JCQkkKGNhbGwgY2Mtb3B0aW9u
LC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkPWdsb2JhbCkgXAo+IC0JCQkkKGNhbGwgY2Mtb3B0aW9u
LC1mc3RhY2stcHJvdGVjdG9yLWFsbCkKPiAtQ0ZMQUdTX1NUS1BfaTM4NiA9ICQoQ0ZMQUdTX1NU
QUNLUFJPVEVDVE9SKQo+IC1DRkxBR1NfU1RLUF94ODZfNjQgPSAkKENGTEFHU19TVEFDS1BST1RF
Q1RPUikKPiAtQ0ZMQUdTX1NUS1BfeDg2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCj4gLUNG
TEFHU19TVEtQX2FybTY0ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCj4gLUNGTEFHU19TVEtQ
X2FybSA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQo+IC1DRkxBR1NfU1RLUF9taXBzID0gJChD
RkxBR1NfU1RBQ0tQUk9URUNUT1IpCj4gLUNGTEFHU19TVEtQX3Jpc2N2ID0gJChDRkxBR1NfU1RB
Q0tQUk9URUNUT1IpCj4gLUNGTEFHU19TVEtQX2xvb25nYXJjaCA9ICQoQ0ZMQUdTX1NUQUNLUFJP
VEVDVE9SKQo+ICtDRkxBR1NfU1RBQ0tQUk9URUNUT1IgPSAkKGNhbGwgY2Mtb3B0aW9uLC1tc3Rh
Y2stcHJvdGVjdG9yLWd1YXJkPWdsb2JhbCAtZnN0YWNrLXByb3RlY3Rvci1hbGwpCj4gIENGTEFH
U19zMzkwID0gLW02NAo+ICBDRkxBR1MgID89IC1PcyAtZm5vLWlkZW50IC1mbm8tYXN5bmNocm9u
b3VzLXVud2luZC10YWJsZXMgLXN0ZD1jODkgXAo+ICAJCSQoY2FsbCBjYy1vcHRpb24sLWZuby1z
dGFjay1wcm90ZWN0b3IpIFwKPiArCQkkKGNhbGwgY2Mtb3B0aW9uLC1tc3RhY2stcHJvdGVjdG9y
LWd1YXJkPWdsb2JhbCAkKGNhbGwgY2Mtb3B0aW9uLC1mc3RhY2stcHJvdGVjdG9yLWFsbCkpIFwK
PiAgCQkkKENGTEFHU19TVEtQXyQoQVJDSCkpICQoQ0ZMQUdTXyQoQVJDSCkpCj4gIExERkxBR1Mg
Oj0gLXMKCkkgbm90aWNlZCwgb2YgY291cnNlIGFmdGVyIGhhdmluZyBzZW50IHRoZSBzZXJpZXMs
IHRoYXQgdGhlIGNsZWFudXAgaGVyZQp3YXMgbm90IGRvbmUgcHJvcGVybHkuCgpDRkxBR1NfU1RB
Q0tQUk9URUNUT1IgYW5kIENGTEFHU19TVEtQIHNob3VsZCBiZSBkZWxldGVkIGNvbXBsZXRlbHku
CgpUaGlzIHdpbGwgYmUgZml4ZWQgaW4gdjIsIG9yIGZlZWwgZnJlZSB0byBmaXggaXQgdXAgd2hl
biBhcHBseWluZyB0aGUKc2VyaWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
