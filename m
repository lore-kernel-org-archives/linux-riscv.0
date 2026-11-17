Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A29606A33A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0Z9YyWN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=p96zj0p6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mrglFu7kMNQIp9457qfUnB1Yh3crCH8yWtKm3qu1f60=; b=T0Z9YyWNjSeb7C/o38OnRj9GB9
	MOcVet0URgLmvIRTnwEBJe+y8MxZCAHJnAOTcrwlN03WDCisBalbHp8UoZWBeHdagsyYrqs3Bj0Um
	fRl+ALc1dtZctVT0RdK75k1maejvoQ0lvvONRO5keD+znUe+AYOkZN5UCeCMgZaXHyOzywpSjRI3R
	/IBpwHbFO0b346StxUCLMsPS9CbGYhgng5U7LJPAy8Pf+Q2PNlZR9pX5xQmXdv/5ylWwFf01Oa10T
	u5t0H81VF13sCZe3mNDZ9FOdYu9gi8dBu6VNgkJFRp2FLXugsATobUt5so/U3VCxqO96CL49ZOK/R
	I+Z9RjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqr-00000005C3H-2ZPh;
	Tue, 17 Nov 2026 09:51:45 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFqp-00000005C2U-1rvA
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:51:44 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 4A09420D7CE5;
	Tue, 17 Nov 2026 10:51:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 27C6D20D7CEF;
	Tue, 17 Nov 2026 10:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 27C6D20D7CEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794909101;
	bh=ie7xlH959msYwz7Ly/QutwaJloMdPwLzBWnER2Gq/kg=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=p96zj0p6vXfJkE1WQkAKbK4G9GFIBWL4KEXcjsJ/+SUXYmPhhfHdJSDn6Dx+O/dKM
	 8ROESkLGDxXKff542XW9p1A5Gdl4ZJtTD0QMxRhjdDNUIBGGvKQRwXPrtqRwIEssli
	 ho7bVtgDTeyuixkftWDMnU1UbgLaHakg+ILAmW1pQkw61ig07DYjyat6rJdWLaI1cE
	 hUcA2FY5VgBwB1tGmE/R9QQmwHDgK56WCQy94/gBE1pu3VdhZc8RPkHnkU6vi+S3k0
	 B+9xv52rARCvMzjMTFz2BmjW0x0fZ46jOC9nydVoBDH0+hwaRnhUojd4580rtuEZzg
	 1LGwgwCbNFjbA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 1qjICo2zv9do; Tue, 17 Nov 2026 10:51:41 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3194820D7CE5;
	Tue, 17 Nov 2026 10:51:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Vlad Banea <montrealtango@gmail.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Yixun Lan <dlan@kernel.org>,
	troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Tue, 17 Nov 2026 10:51:28 +0100
Message-ID: <20261117095129.97140-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117084938.82968-1-frederic.mahe@cirad.fr>
References: <20261113023158.2872492-1-montrealtango@gmail.com> <20261117084938.82968-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_015143_641587_615D3A76 
X-CRM114-Status: UNSURE (   6.53  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QSBmb2xsb3ctdXAgcXVlc3Rpb24gb24gdGhlIGhvbGUgdGhhdCByZW1haW5zIGZvciBlYWNoIHBv
cnQuCgpPbiB0aGUgQlBJLUYzIHRoZSByZW1haW5pbmcgcGNpZTEgaG9sZSAoQ1BVIDB4MV8xMDAw
XzAwMDAtMHgxXzFmZmZfZmZmZikKc3RpbGwgY29zdHMgYSBsb3Q6IGFub255bW91cyBwYWdlcyBv
ZnRlbiBjb21lIGZyb20gdGhlIGxvdyBlbmQgb2YKWk9ORV9OT1JNQUwsIGFuZCB3aGVuIGZpbydz
IGJ1ZmZlcnMgbGFuZCB0aGVyZSwgNGsgcmFuZG9tIHJlYWRzIGxvc2UKYWJvdXQgaGFsZiB0aGVp
ciBJT1BTIHRvIFNXSU9UTEIgYm91bmNpbmcuCgpUaGUgcG9ydCBvbmx5IHVzZXMgYSBzbWFsbCBw
YXJ0IG9mIGl0cyAyNTYgTUIgd2luZG93IGhlcmU6CgogIHBjaSAwMDAxOjAwOjAwLjA6IEJBUiAw
IFttZW0gMHg5MDAwMDAwMC0weDkwMGZmZmZmXTogYXNzaWduZWQKICBwY2kgMDAwMTowMDowMC4w
OiBCQVIgMSBbbWVtIDB4OTAxMDAwMDAtMHg5MDFmZmZmZl06IGFzc2lnbmVkCiAgcGNpIDAwMDE6
MDA6MDAuMDogYnJpZGdlIHdpbmRvdyBbbWVtIDB4OTAyMDAwMDAtMHg5MDJmZmZmZl06IGFzc2ln
bmVkCgpTbyBJIHRyaWVkIGEgdGVzdCBEVCB0aGF0IGV4Y2x1ZGVzIG9ubHkgYnVzIDB4OTAwMF8w
MDAwLTB4OTAzZl9mZmZmCmZyb20gcGNpZTEncyBkbWEtcmFuZ2VzICh0aGUgcm9vdCBwb3J0IEJB
UnMgYW5kIHRoZSBicmlkZ2Ugd2luZG93LCBwbHVzCm1hcmdpbiksIG9uIHRvcCBvZiB5b3VyIHYy
OgoKICBkbWEtcmFuZ2VzID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDAwMDAwMDAwIDB4MCAweDgw
MDAwMDAwPiwKICAgICAgICAgICAgICAgPDB4MCAweDgwMDAwMDAwIDB4MSAweDAwMDAwMDAwIDB4
MCAweDEwMDAwMDAwPiwKICAgICAgICAgICAgICAgPDB4MCAweDkwNDAwMDAwIDB4MSAweDEwNDAw
MDAwIDB4MCAweDBmYzAwMDAwPiwKICAgICAgICAgICAgICAgPDB4MCAweGEwMDAwMDAwIDB4MSAw
eDIwMDAwMDAwIDB4MyAweDYwMDAwMDAwPjsKClJlc3VsdHMgKHY3LjQtcmMxLCAxNiBHQiwgTlZN
ZSBvbiBwY2llMSk6CgotIDE1NTI5IHBhZ2VzIGluIENQVSAweDFfMTA0MF8wMDAwLTB4MV8xZmZm
X2ZmZmY6IDQgS2lCIE9fRElSRUNUIHdyaXRlCiAgYW5kIHJlYWQgcGVyIHBhZ2UsIG5vIGJvdW5j
ZSwgZXZlcnkgcGFnZSByZWFkIGJhY2sgY29ycmVjdGx5Ci0gZmlvIGNyYzMyYyB2ZXJpZnkgKDE2
IEdpQiBkaXJlY3QsIDggR2lCIGJ1ZmZlcmVkKSBPSywgbm8gQUVSCi0gNGsgcmFuZG9tIHJlYWQs
IElPUFMgKDEgam9iIFFEMzIgLyA0IGpvYnMgUUQzMiAvIDggam9icyBRRDE2KToKICB2MiAyNy41
ayAvIDg2ayAvIDEzN2ssIHRlc3QgRFQgNDcuNWsgLyAxODVrIC8gMTkzawogIChzYW1lIGFzIGJv
b3Rpbmcgd2l0aCBtZW09MkcsIHdoZXJlIG5vdGhpbmcgYm91bmNlcykKCkkgZGlkIG5vdCB0cnkg
RE1BIGludG8gdGhlIGJyaWRnZSB3aW5kb3cgaXRzZWxmLCBhcyB0aGF0IHdvdWxkIHRhcmdldAp0
aGUgZHJpdmUncyBvd24gQkFSLgoKU28gaXQgbG9va3MgbGlrZSB0aGUgcm9vdCBwb3J0IG9ubHkg
Y2xhaW1zIGl0cyBwcm9ncmFtbWVkIEJBUnMgYW5kCmJyaWRnZSB3aW5kb3csIG5vdCB0aGUgd2hv
bGUgMjU2IE1CIGFwZXJ0dXJlLiBUcm95LCBpcyB0aGF0IGhvdyB0aGUgSzEKcm9vdCBwb3J0IHdv
cmtzPyBJZiBzbywgd291bGQgYSBzbWFsbGVyIGFwZXJ0dXJlIGZvciBwY2llMSAodGhlIE0uMgpz
bG90IG9uIG1vc3QgYm9hcmRzLCBlLmcuIDE2IE1CKSwgd2l0aCBhIG1hdGNoaW5nIHNtYWxsZXIg
aG9sZSwgYmUKYWNjZXB0YWJsZT8gVGhlIG90aGVyIHBvcnRzIGNvdWxkIGtlZXAgbGFyZ2Ugd2lu
ZG93cy4KClRoYW5rcywKRnLDqWTDqXJpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
