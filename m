Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B079606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sZlimOP/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=t2zp4o//;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tk/gCUx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yp/ATRsCI85BAzdLe5P7WkjvFsSoeETf4q+Eq2QeVd4=; b=sZlimOP/fhw5AC5+qi5fGGY0bd
	j+kFF0BrgdkRBtsaoPkSiUfgAD3ICfORrs0Re/woq8MBqoKEarA8p7S6xRqvUxzw3xJ0v5eFQj+K8
	x7XdcozHTrPJ1TqUz8yMlaAHXkhPKndKYSqwZ94jJRYig07Z2TMPf+Mc7sKx96EJy+7OJAfgNGl7t
	4wOk7JWMZI/h6XCSpMqHiC7vH0MtBW9Jp9BnG2EBEL95aV3f9qmX9cMvLAiClodJyNWnj+l8GBqrK
	w9uYUXjbEXLCJmv+jLscrKT6M62lsEkiD1vYsaiM68/gDozVcNKekMZ+E4sPXyGsmMbWTGrOotsFX
	M0XlKezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToVH-0000000ARMK-18fh;
	Wed, 18 Nov 2026 22:51:47 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToVE-0000000ARLA-2F1a
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:51:46 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B2F897A0220
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 17:51:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 18 Nov 2026 17:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795042301;
	 x=1795128701; bh=5+XtuorylhonqXeUImWVMGAIX8lmQG3o0bBLIzEVaN8=; b=
	t2zp4o//Z6EkDAhYI3tosB3KAxQXYYhzXR7wHXajp6Ymcw8aWuCY9h51DJ9WP22r
	mm2haldNeLLWCWquQ3jqjdrjV21nx1SS6Mj3z6ZXf+aT8DUrXC0e0b9PPDfW7eLM
	ioJXgNc4uEbzkmA9HCGLf4E6UGHiTl/gn1L2dPADYo0SFYd1DR+RDqTSh26jFxyl
	BWHarFe3qtNUjdCWwn6Wu7vqqWp4K7dcjxd6yzo4acjOM0kZZCBNe82JkAoNPUgz
	Ldori2L1j3X8kRje1JP7SDB9/lQ9/4isbOP72YXFx7UhxEc6Q0Svcr/qeczXLHeB
	Jlv3AEC3OpZ3bdW6rPlx3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795042301; x=
	1795128701; bh=5+XtuorylhonqXeUImWVMGAIX8lmQG3o0bBLIzEVaN8=; b=t
	k/gCUx380TGoR0BqFrM8Q9RPUriUvwdEbB1VhBNS6OMTZiaEqrrP6x8BzwW0P08C
	0Snil+J4c5xd761dvtzO3lCxssWwHCM/y21p3LOkyTxlhFUJK2olNwbsj5B2eRVp
	BU9NKEq+QqPRXClF7SrHMNECyVxxWABsJhj+Ldu9ZLEhKokzKVVy9pnWut36W6BD
	CnVtyJQviz5blD7GbhszX+jTBmLL+jWz85MbUNhY5ljoZfRrX/pI8KMGbm5Mnof7
	1yBYRABFHBcVIJZIA7Lwo5Ht5ALQ3K2D6YVouYxNa2HpT1WyTDRuFTx0a9zcsIFm
	JLtIhwrFWnJpcAJK6daug==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795042301; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:mdmW0vJMnBPUD9cAF6Hywuv4iRK6gpBWTSsCn09gZNr/ahN
	2xzNzvBTla7qgrw8hCj04txq/Qzw0zUVatA38ZuUxFNW9HTGcbFCmeuFO6sKBJKJ
	pFbaN5usvkVNhfRMrxO62E1bqQiyHXyioAajVDd14pnjMXWZ0wWj8zVR///+274G
	SI5T3P4TBYy9YyF8k76zax0uqYehkJompYxaaJPCxbgd9eC2jrbjtL5r7k4kz8NA
	GODIN9clE4tJ4rs8nbx11qISz8YBkdjDilki4dLbILq0nx9nwPAsd+AsPNFWoonF
	q4wPJuJo7dkjElX2FBL8e73Y8ML1rsyjg9oXrcg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gwT+p8kA7L84lFFCIpLSyCi9PmiCPy5KF0kAnTVsOyY=:1FBlag0FukFNRxAPA6u1bOZGR6svMgeErrUIKxOpl2w=;
X-ME-Sender: <xms:_Sv-aoUZB_vszS2GIIfPYPLHd7NZK5Y_MQhuJMFPUd6lSW7ahRtZ6A>
    <xme:_Sv-aoQrMiz-WB-d8ji59PcTi_caej1n2yv3EG9Clt0Qp5Siz8iSeJEBqnirfyyJR
    S00UYLI1DKfk4LF-oYB7fZYPrLJW8dm9tHa9xwHLpA6bEOV-Tdob5pO>
X-ME-Received: <xmr:_Sv-anF4bRblPsSl1aVOGZRc0tRo-4pSGRUTCF1tKjq_b5BMjls2x15CYZPk3ReAiPmYuGL4Jseroq58ayM>
X-ME-Proxy-Cause: dmFkZTFhpCaxkrSdjl1bmMJJH+/ejCFr/GqQbJXvXr6UlOIRW2lZZvZP/KmdXAvHUIGyyz
    85TDz7C0/Xb54ijhMfZSKvt45T37yo/K2raDnJEqf9J5UuZK2dagcIqyohcmW9xWXmOwUe
    +4gPxStnhvqvL2tBuq2htXg+XD34Oko58lA4EJv2yXj6gHPsdlcW/Cj+pvvSS+gUR/6CEr
    B8OynZaxZ7qkpVUK570tvkJbqwwnbeKMDuUw2cV/y6j0X6tTg6ntTWYmGXTRxa/YorI8cw
    rQ1L3NyLdYDcxz4IT6re/HcFeAek69CMRarEGPAxn/+6ZUQT6BYi6217KYFUG2kd/9ZURQ
    6g9FJbDw4vvXAkfkC6yLrnmgYU+Dzb4EgyNVc6M9RFizLw7kxcUtxjOjis41aL72147tzG
    JsHUuYZ00K/3PDBEZtNez1CutzNImiNrlrWenYDiE/MoXJIMsGOz2igtxgTuBitbWw3Dex
    zbvdsr3egpnjXSBFVfPG8tNtHLgI90UzOATzb8IJdyyPBE5MA7FVb7MvGssc3z84zZdSnn
    mfo+F+5iON5dgC+vVYjGW6nIduITfpy+S3u/SQoFiHU/lmUdWKBe1DXIoRAko98qVwNQmm
    nAnD0CVlN8CDw+EEviWcmQjhhn7Q2Or86QXKYSfqEaFfVfsKa14nE17qvsJw
X-ME-Proxy: <xmx:_Sv-aoQVKLsWu56hL7EcYlAaIwVOqRvWFGwy2usdAqGsUWQZ8TlHbw>
    <xmx:_Sv-ahoB00kGA5ALynm7ceTiTJq-0yWX9tvcN1UXUkB35Gzk3pDWTg>
    <xmx:_Sv-aurkqAMMjd0xC9J9M0eaTBi54SII-yk6s_phdb2bblRa6fWqHw>
    <xmx:_Sv-ak0GFA8DqmYFGxKqTF51v4feGnZUf3c9yFfIaCj-8hQsIRG1Ew>
    <xmx:_Sv-an17hJfeug1QClumL922umJqTmZ9AQlmscuyGtM-2EoZY0iSl87F>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:51:36 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v4 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Thu, 19 Nov 2026 07:48:26 +0900
Message-ID: <20261118224826.2491684-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118224826.2491684-1-tomo@flapping.org>
References: <20261118224826.2491684-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_145144_617019_4D7C2A38 
X-CRM114-Status: GOOD (  10.52  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPgoKRml4IHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Igb24gMzItYml0IEFSTSB3aXRoIENPTVBJTEVfVEVTVDoK
CiAgRVJST1I6IG1vZHBvc3Q6IGRyaXZlcnMvcHdtL3B3bV90aDE1MjAua286IHN5bWJvbCAnX19h
ZWFiaV91bGRpdm1vZCcgdW5kZWZpbmVkIQoKVGhlIGRyaXZlciBkaXZpZGVzIHU2NCB2YWx1ZXMg
d2hlbiBpdCBjb252ZXJ0cyBiZXR3ZWVuIG5hbm9zZWNvbmRzIGFuZApjbG9jayBjeWNsZXMuIE9u
IDMyLWJpdCBBUk0sIHRoZXNlIGRpdmlzaW9ucyBhcmUgY29tcGlsZWQgdG8gY2FsbHMgdG8KX19h
ZWFiaV91bGRpdm1vZCwgd2hpY2ggdGhlIGtlcm5lbCBkb2VzIG5vdCBwcm92aWRlLgoKVXNlIGRp
djY0X3U2NCgpIGFuZCBkaXY2NF91NjRfcm91bmRfdXAoKSBmb3IgdGhlc2UgZGl2aXNpb25zLCBp
biB0aGUKc2FtZSB3YXkgYXMgQyBkcml2ZXJzIHVzZSBkaXY2NF91NjQoKSBhbmQgRElWNjRfVTY0
X1JPVU5EX1VQKCkuIFRoZQpyZXN1bHRzIGRvIG5vdCBjaGFuZ2UuCgpGaXhlczogM2MxODAwMDNk
ZmZiICgicHdtOiB0aDE1MjA6IEZpeCBtaXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIikKUmVw
b3J0ZWQtYnk6IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4KQ2xvc2Vz
OiBodHRwczovL3J1c3QtZm9yLWxpbnV4Lnp1bGlwY2hhdC5jb20vI25hcnJvdy9jaGFubmVsLzI5
MTU2NS1IZWxwL3RvcGljLzY0Yml0LjIwZGl2aXNpb24uMjBpbi4yMC42MHB3bV90aDE1MjAuMkVy
cy42MC9uZWFyLzYyNjgyNTU5OQpTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPgpBY2tlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIHwgOCAr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIGIvZHJpdmVycy9wd20vcHdt
X3RoMTUyMC5ycwppbmRleCA3Mjg5OTM5OTg0NDYuLmJkMDVmZTQ5NjUwZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycworKysgYi9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJz
CkBAIC0zMSw2ICszMSwxMCBAQAogICAgICAgICBtZW06OkRldnJlc0lvTWVtLAogICAgICAgICBJ
bywgLy8KICAgICB9LAorICAgIG1hdGg6OnsKKyAgICAgICAgZGl2NjRfdTY0LAorICAgICAgICBk
aXY2NF91NjRfcm91bmRfdXAsIC8vCisgICAgfSwKICAgICBvZiwKICAgICBwbGF0Zm9ybSwKICAg
ICBwcmVsdWRlOjoqLApAQCAtNjgsMTMgKzcyLDEzIEBAIGNvbnN0IGZuIHRoMTUyMF9wd21fZnAo
bjogdTMyKSAtPiB1c2l6ZSB7CiBmbiBuc190b19jeWNsZXMobnM6IHU2NCwgcmF0ZV9oejogdTY0
KSAtPiB1NjQgewogICAgIGNvbnN0IE5TRUNfUEVSX1NFQ19VNjQ6IHU2NCA9IHRpbWU6Ok5TRUNf
UEVSX1NFQyBhcyB1NjQ7CiAKLSAgICBucy5zYXR1cmF0aW5nX211bChyYXRlX2h6KSAvIE5TRUNf
UEVSX1NFQ19VNjQKKyAgICBkaXY2NF91NjQobnMuc2F0dXJhdGluZ19tdWwocmF0ZV9oeiksIE5T
RUNfUEVSX1NFQ19VNjQpCiB9CiAKIGZuIGN5Y2xlc190b19ucyhjeWNsZXM6IHUzMiwgcmF0ZV9o
ejogdTY0KSAtPiB1NjQgewogICAgIGNvbnN0IE5TRUNfUEVSX1NFQ19VNjQ6IHU2NCA9IHRpbWU6
Ok5TRUNfUEVSX1NFQyBhcyB1NjQ7CiAKLSAgICAodTY0Ojpmcm9tKGN5Y2xlcykgKiBOU0VDX1BF
Ul9TRUNfVTY0KS5kaXZfY2VpbChyYXRlX2h6KQorICAgIGRpdjY0X3U2NF9yb3VuZF91cCh1NjQ6
OmZyb20oY3ljbGVzKSAqIE5TRUNfUEVSX1NFQ19VNjQsIHJhdGVfaHopCiB9CiAKIC8vLyBIYXJk
d2FyZS1zcGVjaWZpYyB3YXZlZm9ybSByZXByZXNlbnRhdGlvbiBmb3IgVEgxNTIwLgotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
