Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C45606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 03:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wA26ZTMR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rd7VFLaP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8CiCDOYZYicaqWzq1n/n4obpq8tHdVRC8FqEdoLOmig=; b=wA26ZTMR1i72NPertbAt2BTzwX
	yoy3nJiEs1wYGXsA2Lv4MoxE1Rvhz+6jN0AaKHyxRxjh4JCTlDUCrjupx3wEaNXRkiupdMi9yEDrT
	0hbo9xdVx+t0wKt0LrESmWmsxtl/xInDDufSVA0gro9GnYmjkXmR4cKdz0aqjvo8zAc0bLvtNlpHE
	X52gcyvypCqkEleL0o3s/T7/8gWfUi+nsuYTJdd8tikp5uaFe+bnQftohaJ+8DQONOYf3Wf/++zjj
	+3+7+X0XOERGpdDlWH2337E/cwljTrw9vOmgd9vGQplQE/TJWcHonSWCfi5pHX+WTPuZisB9buZkI
	N0H4VSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnsd-00000007erk-3Mq0;
	Thu, 05 Nov 2026 03:11:11 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnsa-00000007eqI-1r9n
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 03:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793848257;
	bh=elWbl+OffFQuIIm3yhMS8vybFO0kHurUhaRvfp7EAfw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=rd7VFLaPowHCqUz/0ZqNnCNuCnedb5Ij2k/7h/uKZOENVHl6zdz2w0V2jgdyVPwnI
	 kZkTkbtvtO6/a7bvL58wCmNWJluOiOaxIPOcgECjPKPYGZVls5JwP4+x7yYIYhBuC6
	 ktNKqrjNFdhCNosjBFySIALk8O0equZdRFJqS1sU=
X-QQ-mid: zesmtpgz9t1793848252t934e3f3d
X-QQ-Originating-IP: PzFdMtmjvpoEZUFriSo1/f1E/ApJhGnMm7BqxTlGO+Q=
Received: from localhost ( [8.218.183.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 11:10:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10634412826085304588
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 11:10:47 +0800
Message-Id: <DMMY4S89W1PJ.WWIUJ905SLXU@linux.spacemit.com>
Cc: "Bruno Banelli" <bbanelli@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Alex Elder"
 <elder@riscstar.com>, "Yixun Lan" <dlan@kernel.org>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, "Krzysztof Wilczynski" <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Uwe Kleine-Koenig"
 <u.kleine-koenig@baylibre.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
From: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Encrow Thorne"
 <encrow.thorne@linux.spacemit.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260825052249.66921-1-bbanelli@gmail.com>
 <DLKRGJBNFVQO.15WZ2SXQLOY0T@linux.spacemit.com>
 <xuafb5qshj6rowe3v6sxyfvtemy4wg2ttqs7lcwu3txu2mpyzm@fr72njh6zgvi>
In-Reply-To: <xuafb5qshj6rowe3v6sxyfvtemy4wg2ttqs7lcwu3txu2mpyzm@fr72njh6zgvi>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M6X4Jj6nmWQyum/iMKz8TxjkkJ7y/4Dfp2UGPg1Nck+98wNvcvLORLQs
	MTB5O+r07L6tCVLtuO8Q2MdhRqzq3TxfbCYqtA8mThs/mJQ42AJCsWlUrjwCKmKxSEB0st/
	IjM7gJMpl0vK+PMSooTN8SVRqieZ9ohDChhZds9zyGQwfDtKk4TQvltDqb+9r330b+XCY+0
	iL1HPFkOuIMKeReO07ijlngEnPv9NVlpprYEv2MMlXcxxS5MCLD0SaCbe3ELsyBUueufj9q
	i+HszP7fBQWcQV5w12SegnqyLOSnvypcpnuwZ7Jgu/+yOTcO/kzScYLVawOCiRNk7qU+/4m
	4/Jpb4G2toR/IWVsOL4uL9sM0yy4EGML/hTPlt/tLUqnceEUCsxsIVnUWOvAzF4Kz292Ne/
	be/SKCQ4e8d3yMAZyYOO+JgK0M6OV7fGiN35oVomkIgnSe3R+1zf1b6vLecf1n+wEev76bH
	P7ireGMJUrUFQ88J3Thhl8TRmVuJIsHY3bBwaGHYSjQWL4jowG6pUBpkYS1/IXP7xByB27k
	edIQjGjNwWIIzRQZunTLQbMYB6A5/Wv/5gRj8Gaf88nmSM54n5K44c1svqCW96ozymjZEwx
	aNP+VCuXVPeulZgLk/NVYczO7u9rrkJ3wGwjkSmzOAQzHeY2EoMOgqgKBMXIDXyGndvFtJO
	25FLZQ89F+jPQBZ+DHVgRICDkuTQ8ff/CMGLFPa5NdTELSRaoQVVCrCeyUft5NIPe6laAfM
	hPXNKGIdq+rjamRW6q7/kOucLU2ryC/KKQgUIVJE52C+F3x0hXXs8hOJu6uFZLA+c3w6aX2
	+bh2Vpc+n13mQuSXsPDfyNKyZRaJH8fdac44JSlLIk4ytcSsBMsBZ1mCSlIB06+ATCh4ePp
	o6IS5E7coP1OgX6UjxVZCmEZsebL1WeTIfXtELzTWMKuzdIAPuvrpRHWfe9WyeU2nMbI0hY
	bE7hxXQzVrocer1d+7Cw0BP3CPTbGcRnrkpXDx8bk7RPCmprqd6HnWyYCqZSMegoHSPu6qq
	HIwRdlow==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_191109_033652_03C3C58B 
X-CRM114-Status: GOOD (  11.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uIFNlcCAyMSwgMjAyNiBhdCA0OjAzIFBNIENTVCwgTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDIxLCAyMDI2IGF0IDAxOjU1OjQyUE0gKzA4MDAsIEVuY3Jv
dyBUaG9ybmUgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4+IEhpIEJydW5vLAo+PiAKPj4gVGhlIGlzc3Vl
IHdhcyBjYXVzZWQgYnkgYSBtaXNzaW5nIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gaW4gdGhlIEsx
IFBDSWUKPj4gaW5pdGlhbGl6YXRpb24uCj4+IAo+PiBUaGUgUE1VIFBDSUVfQ09OVFJPTF9MT0dJ
QyByZWdpc3RlciBjb250YWlucyBhbiBJR05PUkVfUEVSU1ROIGJpdCAoQklUKDIpKS4KPj4gVGhl
IGhhcmR3YXJlIG1hbnVhbCBkZXNjcmliZXMgaXQgYXMgZm9sbG93czoKPj4gCj4+IOKAnFdoZW4g
c2V0IHRvIDEsIHRoZSBQQ0llIGNvbnRyb2xsZXIgYW5kIFBIWSBpZ25vcmUgdGhlIFBFUlNUTiBz
aWduYWwgZnJvbQo+PiB0aGUgbGluayBwYXJ0bmVyIGluIGJvdGggUkMgYW5kIEVQIG1vZGVzLuKA
nQo+PiAKPj4gVGhpcyBiaXQgd2FzIG5vdCBjb25maWd1cmVkIGR1cmluZyBSQyBpbml0aWFsaXph
dGlvbi4gQXMgYSByZXN1bHQsIHRoZQo+PiBjb250cm9sbGVyIGFuZCBQSFkgY291bGQgc3RpbGwg
YmUgYWZmZWN0ZWQgYnkgdGhlIFBFUlNUTiBpbnB1dCBkdXJpbmcgdGhlCj4+IGVhcmx5IERCSSBh
Y2Nlc3Nlcy4gV2l0aCB0aGUgSW50ZWwgSTIyNS1WIGluc3RhbGxlZCwgdGhlIGZpcnN0IERCSSBh
Y2Nlc3MKPj4gY291bGQgcmVtYWluIHBlbmRpbmcgYW5kIGhhbmcgdGhlIENQVS4KPj4gCj4KCkhp
IE1hbmksCgo+IFdoYXQgZG9lcyB0aGlzICdQRVJTVE4nIGJpdCBjb250cm9scz8gUEVSU1QjIG9y
IHNvbWV0aGluZyBlbHNlPyBQRVJTVCMgaXMKPiBjb250cm9sbGVkIG9ubHkgYnkgdGhlIFJvb3Qg
Q29tcGxleCBidHcuIEFsc28sIHdoeSBkb2VzIHRoaXMgbWlzc2luZyByZWdpc3Rlcgo+IGNvbmZp
Z3VyYXRpb24gb25seSBhZmZlY3RpbmcgSW50ZWwgSTIyNS1WIGVuZHBvaW50IGFuZCBub3Qgb3Ro
ZXJzPwo+Cj4gLSBNYW5pCgpQQ0lFX0lHTk9SRV9QRVJTVE4gbWFza3MgdGhlIFBFUlNUIyBwYWQg
aW5wdXQgdG8gdGhlIGxvY2FsIEsxCmNvbnRyb2xsZXIgYW5kIFBIWS4gSXQgZG9lcyBub3QgY29u
dHJvbCB0aGUgZXh0ZXJuYWwgUEVSU1QjIG91dHB1dC4KT24gSzEsIHRoaXMgaW5wdXQgcGF0aCBy
ZW1haW5zIGFjdGl2ZSBldmVuIGluIFJDIG1vZGUsIHNvIGEgbG93CmxldmVsIG9uIHRoZSBwYWQg
Y2FuIGFsc28gaG9sZCB0aGUgbG9jYWwgY29udHJvbGxlciBpbiByZXNldC4KCldlIGZvdW5kIGEg
MSBrT2htIHB1bGwtZG93biBvbiB0aGUgUEVSU1QjIGxpbmUgb2YgdGhlIHBhcnRpY3VsYXIKSW50
ZWwgY2FyZCB3ZSB0ZXN0ZWQuIFRvZ2V0aGVyIHdpdGggdGhlIEp1cGl0ZXIgYm9hcmQncyAxMCBr
T2htCnB1bGwtdXAsIHRoaXMga2VwdCBQRVJTVCMgbG93IGZyb20gcG93ZXItb24sIGluY2x1ZGlu
ZyBkdXJpbmcgdGhlCmZpcnN0IERCSSBhY2Nlc3MuIFRoZSBvdGhlciBkZXZpY2VzIHdlIHRlc3Rl
ZCBkaWQgbm90IGhvbGQgdGhlCmxpbmUgbG93IGluIHRoaXMgd2F5LgoKQWZ0ZXIgcmVtb3Zpbmcg
dGhlIGNhcmQncyBwdWxsLWRvd24sIFBFUlNUIyByZWFjaGVkIDMuMyBWLgoKUmVnYXJkcywKRW5j
cm93IFRob3JuZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
