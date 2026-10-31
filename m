Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82B606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZQexXMUx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=zQ8+bq8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kVtpPlN0jtIxf0zCkdYRxx9tRGqXsYcLJ208fxZGAHE=; b=ZQexXMUx1fjT7zPoKadK1KaIlz
	xJAZOB3Hjnf7/jcWCf5slqbvysSqmiw2GoZljvvubylH6ZAkNVxKORnElHpiHhm/8LHrPvafZ+uak
	z9EGEBvXtbe20A+t452CFmV6uybKM1WgOrezoqCMNzSdGjyqMD4AWdrr84qjo63oQDOVil9mwAvGz
	E+sPa9Z+taNSh38tM1mTzhoMr96gZvVtth3w9V6bNM3dtmmwVRfYywwj1d5aqmx3SFAU+FAnIjJwJ
	6yrSALjxBIiTGgicE5edxXxFMoolp19vMWlYT56s/ojkBkj6oecHdmds8yFP+za/0nqTu9f/xEmf8
	unyCzPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBoY-0000000DU24-2mPu;
	Sat, 31 Oct 2026 16:20:18 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNBoV-0000000DU0b-3hkD
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 16:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lmWTmNuesxAJc0uIdXgg1Y/3RQtDi2m58HS/0OcMlyk=; t=1793463615; x=1794327615; 
	b=zQ8+bq8PPCypUJUGwYV5ivu+HtGExZJa75cbnVjvraiHyNPhSzFzojXz/CIUc40MPOS19XXDpq5
	z7/NN0c5foCZkHDgv0keU9O6Os4NwEkKVA8BzqycYHd+wcMVJL6aBGx2o8hgEpDS6HnmXSO7mUG1P
	LImxoLd8YwWwkS1dkoZbEDLO7R4Vhnd9rM/oBnrOoh+6KyKTN/Ue568ZxFqOTgb5mPap6IEnfHMdk
	mIrYND05ywPpX8Sp7nu3xEyvOs4aNt4Opmb0JPJBavNtfrPONKEbAqb1+RdbCkhYpv3f5XO/al7rw
	WThA6XOUMqHbZ8ey8DLEHcFQRPpBfFiZ/qfA==;
Received: from mail-dl1-f50.google.com ([74.125.82.50])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBoV-00EgG6-4L
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 12:20:15 -0400
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1846bc43c28so1954244c88.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2026 09:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpzfoRMT96ccDD+CXR8AJTAhcDGCi/L6d8h2CyRrmAzewfupXYwCLAIo3sUjRjhavBI7mM50m3lhtktg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJILeuee/Fjpp9xe4gPk7jlrZVbSceoyJpitlsTFSWppooZoMel
	wLrrJL2LhPvrt8q37XRwIw+vYCT7MSyifjBjy5uSn3YsC1NGkOQRFCll6OIJshAL5ikXtr9mEoe
	OvZwxuRdkGGHtEKpSziGHjMqINn/UF7I=
X-Received: by 2002:a05:701b:4644:b0:1ae:b906:773c with SMTP id
 a92af1059eb24-1aeb90678acmr3333147c88.47.1793463614161; Sat, 31 Oct 2026
 09:20:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016160708.790397-1-nickolai@csail.mit.edu> <auUP2yrVl7lwkNkC@Tao-Chiu's-Mac>
In-Reply-To: <auUP2yrVl7lwkNkC@Tao-Chiu's-Mac>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 31 Oct 2026 12:20:01 -0400
X-Gmail-Original-Message-ID: <CADGQE7EUcOebpYG5_R19d0NhukBjZxPiShEgHeNd3Y2i13SS8A@mail.gmail.com>
X-Gm-Features: AclHuK83lGOlIj8EgJp99GFL2iWJP-4RbsNCMWo5hxhuwya0BJw1cO0otTZXMIA
Message-ID: <CADGQE7EUcOebpYG5_R19d0NhukBjZxPiShEgHeNd3Y2i13SS8A@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: signal: mark the FP state clean before
 restoring it from the frame
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
	Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_092016_086007_AC161EDF 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNTo0NeKAr1BNIEFuZHkgQ2hpdSA8dGNoaXVAdGVuc3Rv
cnJlbnQuY29tPiB3cm90ZToKPiBJIHdvdWxkIHByZWZlciBhZGRpbmcgdGhpcyBpbnRvIHJpc2N2
IHNlbGZ0ZXN0IGp1c3QgdG8ga2VlcCBmdXR1cmUKPiBkZXZlbG9wbWVudHMgaW50YWN0Lgo+IFsu
Li5dCj4gV2l0aCB0aGUgdjIgcGF0Y2ggZnJvbSBHdW9iaW4gWzFdLCBjb25zaWRlciBzb21ldGhp
bmcgbGlrZToKPgo+ICAgICAgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9GUykgIT0gU1JfRlNf
T0ZGKSB7Cj4gICAgICAgICAgICAgICAgIHByZWVtcHRfZGlzYWJsZSgpOwo+ICAgICAgICAgICAg
ICAgICBfX2ZzdGF0ZV9jbGVhbihyZWdzKTsKPiAgICAgICAgICAgICAgICAgcHJlZW1wdF9lbmFi
bGUoKTsKClRoYW5rcyAtLSBJIGp1c3Qgc2VudCBhIHYyIHdpdGggYm90aCBjaGFuZ2VzOiBwcmVl
bXB0X2Rpc2FibGUoKSBhcm91bmQKX19mc3RhdGVfY2xlYW4oKSBhbmQgYSBzZWxmdGVzdCBpbgp0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9zaWdyZXR1cm4vLgoKICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzIwMjYxMDMxMTYxODI2Ljg1ODkwOC0xLW5pY2tvbGFpQGNzYWlsLm1p
dC5lZHUvCgpOaWNrb2xhaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
