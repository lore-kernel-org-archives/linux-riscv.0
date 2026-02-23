Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8913EC110C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N7wSRYHIsWaU5z9r82KDbx4/IY/vds4lXYyJq7avw8=; b=AKpup2/g5jg3aI
	rh1CBiGTn0A3POjIc50PxjmkabjznVwSrtn3bkHS9CPTZ5ay/8OFBDeCF/ne9prZ9N+LQRLqwY4iV
	qXD5xpPzkwv0E+4ecFOXFPNID4sWZNRACUEePjE1OcYJB6ypvAhAUqo3nIhhrI+BPoJkLSpH4IKOP
	3ngvumQbVThhiTNlGuheazorsXNpihJGT7yjnUnIMfKrZpFgBCaaMJ1s2oWsHzh9IQEoSrcxDFcV9
	d9Ac2xei/IxpPF99NUyeK8HojZJ5G2tv6l3xs05M7VDAmWTmrm4jA+SnRGbwJCEIdNQqMHYKeE59/
	9/tXEeIStFLqR+ABawNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZrP-00000000nMH-0A5H;
	Mon, 23 Feb 2026 17:36:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZrM-00000000nLh-25uo
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 17:36:41 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b904e1cd038so658140866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 09:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868198; cv=none;
        d=google.com; s=arc-20240605;
        b=jKLGAcoM2LWYVBVwi+tUmPkXCzsPkZT72KC2PHDUxXw6LK19UqtpRZn470xhWruKLo
         jcIj1riiHsnUapxQTBqJ4ktjni6XCG6bQnlc9lugil9EtahcaP3leFHuIcC/N1M44OK2
         CXeHYBpVfh+e3ih22s/KwhyZoJZuU6K1A8NWW6xUbJEFt5/zU5xvQ+PJtfgtD4kfLbzW
         fickbOjLydwk1FRGXEKcVRA15OrmgvsEGQiRy8OSNNTEXnq2bz/Lkl6QhomXj4KwP9kI
         XEp3H7xHbIIwtkhSipz2MDR0Q7aZreDsukMlmo0ew8qErJnH46QPSwfo+DIAkLaLkcR9
         vfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        fh=W0T53X3KGYciG7jtYc/yUxKRw27hb8qb8KGUWAQGaFw=;
        b=bnQkM2bBg9S09B3SPw+5hqvA/XiPO3So3kbAnAtu2j9CbQ/cWLrXfkUs+avRrmErjE
         exaGV8hvY5v0hlPc72oxVJrnkxvG+hYtjUs0l0yT0Lfh7qQM6Qcv0SKa0QcY5vWgps+k
         4WSGtS73ZWIExeGIQ3i79V+6uqWPki7EKf8BOJQoqkyJwgUHy19VE5SPa76F6+D1Ub6V
         /XE9x+pKIla7MrReuq1+TPApGrt7Og4GSOX5vrnPrDCU43B6bpbkg/qDJ25rTWsb3QbW
         UjIYiwSCCioU326lpOvCdW/y3+UHyB2ypSFseMwEScfuS4ViMsnV1bjlMM4ZjVjkF+G5
         UZzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868198; x=1772472998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        b=Pwxv1D/xoNswBIkYOFPmyGZAAHg43/PkfXEQ2lp1b3Xh+S/2/PZ/Ac4d+tRgif0jIx
         e2J3gwItJCrgKqtXFkRmuDvP97l8bS4JmU48HvctBOLHXe+kl7uh2advQAMP/2y/UtwO
         aCbK16KvhzQu+Z5MimamvmD8LjPDW7DJOvc/CZPJyuD/il/TKJX7+cVojDDrCFyGyoHf
         jiqs2JvpVMyYDSVb4H42fHyWPlKRYA4y3toeOlZu/IO3Wr34u/Ebcylm+mykHltyhvTF
         QGlWNg5T5SDeSh7vhll2TMKueBOsXJxoIIADMEM7UUQAMR76PbjSP1OnMm3LEH40XjWC
         ZUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868198; x=1772472998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        b=N30L/DRHSYFbIyQNfKlCzGHvs3MO9b1ZkhIlasoILR0gCzsY/EWZilxSeTjczYXIOz
         zy/70TQxJvxDBLlspTDN11+pxYZqa2b8MNb+xldKGZutfWWJL1rE+BkpUrY7Nn+CfN6g
         6/ABPojU+7b2mbwEr08kxS0fmPaNiURbkiZI5TyxaP6GLF/n1u2RVDpXup2FdUVJ+lVP
         McwNJjFT2nerfjG7xAjxy0b0+kUdIB0osQn1Eg0fCwn4FqUO/jNvHu4ec2G1u6onDAPB
         vT09PHa01dNIl/+h0TBO1abYnL2G7tQs44OSzYk4x6fZ/GdMf2qe+xo8wH3005NYBdp5
         M+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCU23AKAgB6LDeXO0Lyz7jJCqvbKcq3+Jg5sSZ5Bq6/RAIdPUw/WOsem+F43HUqjk9PSNw7Li+uv/5o4+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNOjSmYFdcQoS1eCWptqLDLSaMMUbr8o2IbMygAqd73Hi+T0fa
	chv1gdofpySyX3mJBpqY2tBYRFx4GizHnuI1NhY1tKajhlsE6p9UB8L/Rc81OlTML5XOb8s3vSf
	CgOY94+nrGeNSZNAF7Qr8DP58qQVEx68=
X-Gm-Gg: ATEYQzxFRvRG2OOE+J8A4VIhDflZ16CxHi7BT7hrEw4X28SwXxg/rVa4cfdtakxpOsz
	1753xD4bJzggVqdK8meXvDN6afWM00Brok+7yUKgQHwQlff6gW7csZQmXCF9GpL2Yg/CxC6ksvX
	W5JClOTqO+yz32JNgzFDYYefftVzkRLiM5GxjwavhSSXg8YdZJMei+wsIT66jvuLXF/zT5KHlTy
	ZHhAjhTulPsSNk16geIGriJJqFy0yMpyAYSR1fdxI9YJN7t08oVa1+cp7bLluRmXqHcYV4vxvZB
	5gMMQwfn
X-Received: by 2002:a17:906:e286:b0:b73:2b08:ac70 with SMTP id
 a640c23a62f3a-b9081bbf581mr431440366b.49.1771868198166; Mon, 23 Feb 2026
 09:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20250407180838.42877-1-andybnac@gmail.com> <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud> <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
 <20260223-respect-chaste-60c3403b5bc9@wendy> <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
 <20260223-garlic-sulphuric-0c1574608d09@spud>
In-Reply-To: <20260223-garlic-sulphuric-0c1574608d09@spud>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 23 Feb 2026 17:36:24 +0000
X-Gm-Features: AaiRm52Y5X8NepG34m2dFfJzvs_KysOs_RCa-fhWauLxea9ysucuctUwLTWqJdM
Message-ID: <CANk7y0iokvWz==XQ67v3aztQ268WVmud22Y4gp-dPd4SrFhzMQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andybnac@gmail.com>, 
	linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, palmer@dabbelt.com, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com, 
	yongxuan.wang@sifive.com, samuel.holland@sifive.com, olivia.chu@sifive.com, 
	c2232430@gmail.com, arnd@arndb.de, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_093640_561624_2F045C2C 
X-CRM114-Status: GOOD (  33.59  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgNDoyOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAwMzo0MToyNlBNICsw
MDAwLCBQdXJhbmpheSBNb2hhbiB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDM6
MjjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMDM6MTg6MTdQTSArMDAwMCwgUHVy
YW5qYXkgTW9oYW4gd3JvdGU6Cj4gPiA+ID4gT24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMTI6MTXi
gK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEhleSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUdWUsIEFwciAwOCwgMjAyNSBhdCAw
MjowODozNEFNICswODAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiA+ID4gPiA+IEZyb206IFB1cmFu
amF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
VGhpcyBwYXRjaCBlbmFibGVzIHN1cHBvcnQgZm9yIERZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9P
UFMgb24gUklTQy1WLgo+ID4gPiA+ID4gPiBUaGlzIGFsbG93cyBlYWNoIGZ0cmFjZSBjYWxsc2l0
ZSB0byBwcm92aWRlIGFuIGZ0cmFjZV9vcHMgdG8gdGhlIGNvbW1vbgo+ID4gPiA+ID4gPiBmdHJh
Y2UgdHJhbXBvbGluZSwgYWxsb3dpbmcgZWFjaCBjYWxsc2l0ZSB0byBpbnZva2UgZGlzdGluY3Qg
dHJhY2VyCj4gPiA+ID4gPiA+IGZ1bmN0aW9ucyB3aXRob3V0IHRoZSBuZWVkIHRvIGZhbGwgYmFj
ayB0byBsaXN0IHByb2Nlc3Npbmcgb3IgdG8KPiA+ID4gPiA+ID4gYWxsb2NhdGUgY3VzdG9tIHRy
YW1wb2xpbmVzIGZvciBlYWNoIGNhbGxzaXRlLiBUaGlzIHNpZ25pZmljYW50bHkgc3BlZWRzCj4g
PiA+ID4gPiA+IHVwIGNhc2VzIHdoZXJlIG11bHRpcGxlIGRpc3RpbmN0IHRyYWNlIGZ1bmN0aW9u
cyBhcmUgdXNlZCBhbmQgY2FsbHNpdGVzCj4gPiA+ID4gPiA+IGFyZSBtb3N0bHkgdHJhY2VkIGJ5
IGEgc2luZ2xlIHRyYWNlci4KPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFt1cGRhdGUga2NvbmZpZywgYXNtLCByZWZhY3Rvcl0KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+Cj4gPiA+
ID4gPiA+IFRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEkgYmlzZWN0ZWQgYSBib290IGZhaWx1cmUgdG8gdGhpcyBjb21taXQg
W2MyMTcxNTdiY2QxZGYgKCJyaXNjdjoKPiA+ID4gPiA+IEltcGxlbWVudCBIQVZFX0RZTkFNSUNf
RlRSQUNFX1dJVEhfQ0FMTF9PUFMiKV0geWVzdGVyZGF5LCB0aGF0IGFwcGVhcnMKPiA+ID4gPiA+
IHRvIGJlIGFmZmVjdGluZyBhbGwgTExWTSB2ZXJzaW9ucyB0aGF0IEkgY3VycmVudGx5IGhhdmUg
aW5zdGFsbGVkLiBGcm9tCj4gPiA+ID4gPiBzb21lIGluaXRpYWwgdGVzdGluZyBvZiBLY29uZmln
IG9wdGlvbnMsIGl0IGxvb2tzIGxpa2UgdGhlIGlzc3VlIGlzCj4gPiA+ID4gPiBDRklfQ0xBTkcg
cmVsYXRlZCBiZWNhdXNlIHdoZW4gSSBkaXNhYmxlIENGSV9DTEFORyB0aGluZ3Mgd29yayBvbmNl
Cj4gPiA+ID4gPiBtb3JlLiBTaW5jZSB0aGlzIG9wdGlvbiBkZXBlbmRzIG9uICFDRklfQ0xBTkcs
IGJ1dCBpcyBkZWZfYm9vbCB5LCBJCj4gPiA+ID4gPiBtb2RpZmllZCBLY29uZmlnIHRvIGZvcmNl
IGRpc2FibGUgaXQgYXQgYWxsIHRpbWVzIGFuZCB0ZXN0ZWQKPiA+ID4gPiA+ICFEWU5BTUlDX0ZU
UkFDRV9XSVRIX0NBTExfT1BTICYmICFDRkdfQ0xBTkcsIHdoaWNoIGRpZCBib290Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEkgZHVubm8gYW55dGhpbmcgYWJvdXQgd2hhdCdzIGdvaW5nIG9uIGluIHRo
aXMgcGF0Y2gsIGJ1dCBzbyBsaXR0bGUgaW4KPiA+ID4gPiA+IGl0IHJlbGF0ZXMgdG8gaGF2aW5n
IERZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMsIHRoYXQgSSB3YXMgYWJsZSB0bwo+ID4gPiA+
ID4gZmlndXJlIG91dCB0aGF0IHRoZSBwcm9ibGVtIGlzIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVu
dHJ5PTgsNAo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IERZTkFNSUNfRlRSQUNFX1dJVEhfQ0FM
TF9PUFMgY2FuJ3Qgd29yayB0b2dldGhlciB3aXRoIENGSV9DTEFORy4KPiA+ID4gPgo+ID4gPiA+
IGFybTY0IGhhczoKPiA+ID4gPgo+ID4gPiA+IHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfQ0FMTF9PUFMgXAo+ID4gPiA+IGlmIChEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MgJiYgIUNG
SSAmJiBcCj4gPiA+ID4gICAgKENDX0lTX0NMQU5HIHx8ICFDQ19PUFRJTUlaRV9GT1JfU0laRSkp
Cj4gPiA+ID4KPiA+ID4gPiB3b3VsZCBuZWVkIHNvbWV0aGluZyBzaW1pbGFyIGZvciByaXNjdiBp
ZiBub3QgYWxyZWFkeSBkb25lLgo+ID4gPgo+ID4gPgo+ID4gPiBJIHRoaW5rIHlvdSd2ZSBtaXN1
bmRlcnN0b29kIG15IGVtYWlsLiBXZSBhbHJlYWR5IGhhdmU6Cj4gPiA+Cj4gPiA+ICAgICAgICAg
c2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxMX09QUyBpZiAoRFlOQU1JQ19GVFJB
Q0VfV0lUSF9BUkdTICYmICFDRkkpCj4gPiA+Cj4gPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhl
IHBhdGNoIGJyb2tlIHVzaW5nIENGSV9DTEFORywgZHVlIHRvIHRoZQo+ID4gPiBmcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5IGNoYW5nZS4KPiA+Cj4gPgo+ID4gWWVhaCwgc29ycnkgSSBkaWQgbm90
IHNlZSB0aGUgcGF0Y2gsCj4gPiB0aGUgb3JpZ2luYWwgb25lIEkgc2VudCBoYWQ6Cj4gPgo+ID4g
K2lmZXEgKCQoQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMpLCB5KQo+ID4gK2lm
ZXEgKCQoQ09ORklHX1JJU0NWX0lTQV9DKSx5KQo+ID4gKyBDQ19GTEFHU19GVFJBQ0UgOj0gLWZw
YXRjaGFibGUtZnVuY3Rpb24tZW50cnk9OCw0Cj4gPiArZWxzZQo+ID4gKyBDQ19GTEFHU19GVFJB
Q0UgOj0gLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9NCwyCj4gPiArZW5kaWYKPiA+ICtlbHNl
Cj4gPgo+ID4KPiA+IFRoZSBiYXNpYyBJZGVhIGlzIHRoYXQgd2UgY2FuJ3QgcHV0IG5vcHMgYmVm
b3JlIHRoZSBmdW5jdGlvbiBlbnRyeQo+ID4gd2hlbiB1c2luZyBDRklfQ0xBTkcsIGJlY2F1c2Ug
dGhleSBib3RoIGludGVyZmVyZSB3aXRoIGVhY2ggb3RoZXIuCj4gPgo+ID4gdGhlIGZpeCBzaG91
bGQgYmUgc29tZXRoaW5nIGxpa2U6Cj4KPiBZZSwgdGhpcyBpcyB3aGF0IE5hdGhhbiBhbmQgSSBi
b3RoIGRpZCBsb2NhbGx5LCBnaXZlIG9yIHRha2UuIEkganVzdAo+IHdhc24ndCBzdXJlIGlmIHRo
aXMgd2FzIGFjdHVhbGx5IGNvcnJlY3QgdG8gZG8gb3IgaWYgaXQgd2FzIGp1c3QKPiBwYXBlcmlu
ZyBvdmVyIGFuIGlzc3VlIHdpdGggb3VyIENGSSBzdXBwb3J0LiBEbyB5b3Ugd2FudCB0byBzZW5k
IHRoaXMgYXMKPiBhIHBhdGNoPwoKWWVzLCBJIHdpbGwgc2VuZCBhIHBhdGNoIHdpdGggZml4ZXMg
dGFnLgoKVGhhbmtzLApQdXJhbmpheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
