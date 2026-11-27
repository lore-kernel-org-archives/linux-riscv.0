Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A0606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NYfV3Dp8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nqLjBpzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+GpyY5xsfQPddTexKYDU2GwO+K4csJGbbdNXo2HY01U=; b=NYfV3Dp8gp1mr3/IWhOOBejevy
	ZWYMiXH3oMcYvd106q3elDDwORLhloViKse0hLZ7ZEsMoE6NJUgz/HriBwOWaifbcqE2HkwJ4cMrm
	43+LCvTUkTBQuGjJNRXykHNYYtRRTPEoGN+2mQv3themP+D348Q9LWjEm+0IlVHwlB9kw9kTubrG5
	iYXZFby6YSUpMDwNUJ3rxK0bsNyvvfbowbJWsaQN4un7EjrfclTinFnQKL0T1WL89aSvliCMHYW98
	L4fWzpmF0THxnqb1qXOaBN0eSlom9J6R3zjCcyHUh8uUXpq1ipyitrNuc4MwIByxkXk/Cn64UJxtI
	T/aVWvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jk-0000000HLux-2ORD;
	Fri, 27 Nov 2026 18:05:04 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Je-0000000HLr3-2bah
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so13047987a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 10:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795802697; x=1796407497; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RqlkJ/I+EH0yMfrfHVvBSdwYQQPjzHS4s9eY4ppBylg=;
        b=nqLjBpzPZR8/+k/I6YIyF5Aw5BAGWbzguOzm5GLUbu5myt4LN9zU9Nvutlgv9seGds
         t0cPw+5PYSv9DBJIDS9Q1UJi5upvmozNou0oEkoQ9agvu6wZigeF6sN2zlvTpp5TKEOB
         1ygdjN2cJ0Ie+EfXXiaOIicq3SpMUx1fvhNCNDUfjH4btglsqlOB0ap8bdBppOmUq0Yw
         6N356+QYqnaQKYpL7USyl+BjrC+kGQ2hXAXiziflu5mS3Yojs/eSiLd0WLa7Ukt3JOtp
         lMBA0ib3iR0tTS/smhxDaCKHwobFms7iHfrmM+/q+rpkLEmCRksPvK5bELrSZBt6uoYG
         c9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802697; x=1796407497;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqlkJ/I+EH0yMfrfHVvBSdwYQQPjzHS4s9eY4ppBylg=;
        b=DrDXdAlBE2Af6Yo3pILuJwamA9EIg1PL8fjOFvw3VgoCD+lCJdYwjqLCjeyWnWzzon
         nVRVcRicdjFJyN4JZQGDG7ZD73bZVwcCPyiAQqquLSj1OlXTIUdCGSooCtWNfJseF3LT
         ZdcwvZc2pUXIBTXnh+WolDCWCZYaSaygJWBN9bT1PlZfF/+nPbCFJ3prO6rQ9UZlB84y
         KZwM57u24ihabGluoHhqbddvKuROFDUV5cYQFZjxytBqnkY6zTzUpuuHFkdw0Z6A+zgg
         LyROmPAj93dRrX4UI0U3+G0TwPLT+VskU7k1+FnE3WOx7bB+8yuHig+miyAnQ1tZGHas
         jaww==
X-Forwarded-Encrypted: i=1; AL+hErHWgHjWBezjVnu8jDirolPAddNLfOENrg4PZNG2WmeDBv5sSvVIBAQyPXurMaQ452GMYjTj3on8XFbqQw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ekTfyRH9klzqtWdF00JRq3eaTl9bqvLfXXkgyOPKFyLhgVYD5
	8pdudmfo2ghbubV14hDxP/nu+qq9A1ZHEAW/cweF5CO/iJely5lhhAQ33dJRbtylI1Q=
X-Gm-Gg: AZFdTZcbnL8hi7O2vAzpt2+XKLMt5GSuADxBTONaAJsoWCctq1em67PvYCoEa7KZqeC
	oE+XoesBn12VzaGOeSsO05Ox59TqMRW0/wZ2VDJc5yTigd8eGPQbuWLgojFLA0GuAWd/c6vh6WS
	6MSoNzTOgxSWNAJu6PE9p1AdJYwc2IgfTVLq6/moZx4362hegX3qNnA3qCbvIqPAAfchqrwLLBl
	pOQxxXnEIOXTPw1JYz/9ea5+ESCDiqJsxVBNvaEnwgcyDDlHujtsf6usoFjB5IgRkzfqANQheh0
	sm3mDgE1F9ZwJplJHNJVmVvlvEAQCI7A4ckUsvCMYomMhmMCpw4Zewid4BBFAytR4OLbCLtCH/5
	AVMxPte1fu1+h2T6ItHYgYOaxyj+FGiAde606ULHGSAbXyYKRvJb84+ueDwoPvBvadgHBzyjrqh
	60klqjC33qTeklVQy0/wcrRQ47bL7tUIH0IYxk7ispylnjuoAJm0llg6fTPBXJFAYb45F3APcne
	6pCSKsv+PVR23pjLGFVJu97QaXZNowMAfm4JB7MbGKJpFQ2gvjRci8R1OsI4YvxpWrzGqLx0aeA
	k/xuEg6pVFI3LFDSyNodUtUgIi3Ki5voXTdlQ8oGJeUW7uPD
X-Received: by 2002:aa7:d94b:0:b0:6b7:df0c:18bc with SMTP id 4fb4d7f45d1cf-6ba37d3b56bmr13992034a12.17.1795802696609;
        Fri, 27 Nov 2026 10:04:56 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba9b131d3bsm8376099a12.34.2026.11.27.10.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:04:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 5/7] rust: clk: add devres-managed clks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <189F36A9-D1C1-478A-A195-F94D037E4376@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
 <DMYELN5M09W3.1SYPKW7DZ70E1@garyguo.net>
 <189F36A9-D1C1-478A-A195-F94D037E4376@collabora.com>
Date: Fri, 27 Nov 2026 19:04:53 +0100
Message-Id: <179580269373.2809466.3866997464599192193.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=EVdcrIGg5JsCx0X3upJdG2WoVOOBbQm+FMplR+16eVc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcx1wf2nxO/vlS7391p4r88j3CD8rvTtqo+zJHx/l4O
 F/jc7mfHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiImTYjwzur9Ptm8U6ip4rk
 vVaFZW/7m3dS40HhpwtLzNJM1yWbmDP8s+KdsNvXYe+JLxfuuvhc1WqSbtuQczJ5c3eeFEuIet0
 GNgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100458_676552_123AE4B2 
X-CRM114-Status: GOOD (  18.65  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAyNi0xMS0xOCAxMTo0NyAtMDMwMCwgRGFuaWVsIEFsbWVpZGEgd3JvdGU6Cj4gCj4gCj4g
PiBPbiAxOCBOb3YgMjAyNiwgYXQgMTE6MjQsIEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0PiB3
cm90ZToKPiA+IAo+ID4gT24gVHVlIE9jdCAxMywgMjAyNiBhdCA2OjA3IFBNIEJTVCwgRGFuaWVs
IEFsbWVpZGEgd3JvdGU6Cj4gPj4gTWFueSBkcml2ZXJzIG9ubHkgbmVlZCBhIGNsb2NrIHJ1bm5p
bmcgZm9yIGFzIGxvbmcgYXMgdGhlIGRldmljZSBpcwo+ID4+IGJvdW5kIGFuZCBuZXZlciB0b3Vj
aCBpdCBhZnRlcndhcmRzLiBJbiBDLCBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGFuZAo+ID4+IGRl
dm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKCkgY292ZXIgdGhpcyBjYXNlLgo+ID4+IAo+ID4+
IEFkZCBkZXZtX2VuYWJsZSgpLCBkZXZtX2VuYWJsZV9vcHRpb25hbCgpIGFuZAo+ID4+IGRldm1f
ZW5hYmxlX29wdGlvbmFsX3dpdGhfcmF0ZSgpLCB3aGljaCB3cmFwIHRoZSBDIGhlbHBlcnMuIFRo
ZXkgcmV0dXJuCj4gPj4gbm8gaGFuZGxlLCBzbyB0aGUgZHJpdmVyIGtlZXBzIG5vdGhpbmcgaW4g
aXRzIGRhdGEgYW5kIGNhbm5vdCBjaGFuZ2UgdGhlCj4gPj4gc3RhdGUgb2YgdGhlIGNsb2NrLiBU
aGUgY2xvY2sgaXMgZGlzYWJsZWQsIHVucHJlcGFyZWQgYW5kIHB1dCB3aGVuIHRoZQo+ID4+IGRl
dmljZSBpcyB1bmJvdW5kLgo+ID4+IAo+ID4+IFRoaXMgbWlycm9ycyByZWd1bGF0b3I6OmRldm1f
ZW5hYmxlKCkgYW5kIGRldm1fZW5hYmxlX29wdGlvbmFsKCkuCj4gPj4gCj4gPj4gUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPgo+ID4g
Cj4gPiBHaXZlbiBhbGwgdGhlIGRldmljZSByZXNvdXJjZSBsaWZldGltZSBjaGFuZ2VzLCBkbyB3
ZSBzdGlsbCBuZWVkIHRoaXMgbm93LCBvcgo+ID4gd291bGQgcHV0dGluZyBhIGd1YXJkIGluIGRy
aXZlciBwcml2YXRlIGRhdGEgdG8gYmUgZHJvcHBlZCBhdXRvbWF0aWNhbGx5IHVwb24KPiA+IHVu
YmluZCBiZSBzdWZmaWNpZW50Pwo+IAo+IEkgdGhpbmsgd2Ugc2hvdWxkIHN0aWxsIHByb3ZpZGUg
dGhpcy4gTWFueSBkcml2ZXJzIG9ubHkgY2FyZSB0aGF0IHRoZSBjbG9jayBiZQo+IGVuYWJsZWQg
YXQgYSBnaXZlbiByYXRlLCBhbmQgZG8gbm90IGNhcmUgYWJvdXQgdGhlIGhhbmRsZS4gSSB0aGlu
ayB0aGlzIGhhcwo+IGxpdHRsZSB0byBkbyB3aXRoIEMgb3IgUnVzdCBhbmQgc2hvdWxkIGJlIHN1
cHBvcnRlZCBpbiBSdXN0IHRvby4KPiAKPiDigJQgRGFuaWVsCgpHYXJ5LCBpcyB0aGlzIE9LIHdp
dGggeW91ID8gaWYgaXQgaXMsIEkgY2FuIHRha2UgYXMgaXQgaXMuCgotLSAKSmVyb21lCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
