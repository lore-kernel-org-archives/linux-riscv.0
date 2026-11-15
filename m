Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBF606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppcakObU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0V+/ezRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8l/8toEpnQIJX/3/MNop1uKlUC7Al4bLUkc+8Bc26nM=; b=ppcakObUovaKHGcs3G8bdhZ1DA
	cP114IuiPeQ0OPUrLAL28/6PzEkG+OMNpzTamkl8LPovC6PlQy0Ej7IodhkT1u2aF+aGx8JVlHKst
	vdpK13Sn6w+qZ7E40ABXYIZkPaxIcim/crF42gQw5Bj5ShsjHSFgzGDS6dyJ0JQoUBQb0eQYayzGS
	nAk/A0Edv5TuETC5L3G3DjvslUmQ7oZZt2e1yYAa1Aypcq5Ei3SW5aICAu7qdMJXeMs5dOOSS8QFU
	UTvOuF74evtXN+dpVNR9ium91HTp/JUwLy5LOadpWx5+Y+tF3uQngnc6a1h2cMWguGdJKs4JAg6hP
	qOrkFZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUie-0000000HBHh-3Rwg;
	Sun, 15 Nov 2026 07:32:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUic-0000000HBGq-1nt5
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 07:32:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18775465e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=0V+/ezRK0R9dnVZbpqllL92zne1rqxdUKHsV/hvCGjRC94mL3X7oNlOyI8vIj6tyv3
         24iYsn3ytiJ5ma3Ngk2a6fPttLSTeP/WcMJHuS3eTVPD9AxSx/zB9/uGOltieuX/QO3k
         UtJ04gHRl4LPCM1+dbvihs6CUZKrr9hGmRlsv/Co3HrCX2HkXJgNxQ0XyPPoFMxa/rdM
         QkgHa7Mr6lfYRtzq5JAHVYeS1HVtx6IXGW9cPZFkurR8OkcCL8H9jqCKvlkMtEC/wQuV
         /wb88R4jMxUSqZFodPkiHufy8n96zh1UkRsGweJiLKnU/KHkc3sp4LOESR3OLvlxxUIK
         RA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=0zWG5UddcvPLWaGgePIIdhnQ/FSZ6VBsfVUxYivt55lFiYzpx1ReeIbYeOSe8Mbw1x
         DihvGTfGt9yfsOcwLxhs2q3QsdW//v5Vi0tUNFlI73saaWISzyUBQPfdwJUc58N63EOM
         TvPUKkIIGGzC15uv2LvdmPKRlGbGTjH0LS6DLnkRArZ5qk1b4QQUB5XcC/Gw8Yjbe9ES
         1HK/5EqxJHAS5MuxEPCnWhI8GR8Q6ZENd+F+Tm/x7C4CCdQJBAZJ5QyajeG+Oi9H9gTz
         WdNDbZwR/+C2+mm0IsmXK5xtrbu+supp+GuOPZSdFaEh6hwsX2OclbeFKb82+jwe8MZ6
         8dDQ==
X-Forwarded-Encrypted: i=1; AL+hErFPVTQw5ZRrKAgvOKlSwa+u15/522z1645cugBWI8cg6Aee6ti7znqFz0c6k4PS5igTMetRT3MswjTjRA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8E5NwqY5XFhnBkM7GRrsVYWQiyiYrJbvspn24o+iKitYrWWmn7
	qd9ARU1bxB+Ipk8qJ/rpPWGbBgn+fR2XHReHRy7nNgbiBXuJfiIp/cp1
X-Gm-Gg: AYBFou0/aVbglZkdGlE18s290q07XXLUWm+v57Esf8Yid5+SVN+zcvW8SVnusaqL9sK
	9qYEJFPlFuLAxpacsI84nlt7ERGNXlLNm6F3TLMrHH7fgy2XaA77GC77AzlmQ1NJTTDYQn3Jvqp
	WL/w8ndsu6fVg8q8UoGs6MikI+CnMDu3FdzJtjUsPklxm7W0TTvmLeIo3LMj/8X828RQL+lbaWm
	mAIO/4BZUViM3PZwLbOteXjmxms+Lu1r5Do8AOjWucBCxKicvOXrcL3GzleF7MuGV4qyFK9eAq0
	3mtdt21Db2S6/Ceyvrrc1jWU7EI3B6Yzjw9br8++Gt9xmm9yMLEh5Q9Rahw0hu/Pss4+a5EfzRZ
	smNAxnrPXi4h5ypK//HdIgTpnZnLHzWmc3f4qkP6uY2YGt2SbiH0b1q9omzLPsOwc+tiMqJ4tUr
	ITxAdnXlJTRMyQJ5tIFjn32fGn6tGwL/4qtwl7Fdm5Y2LzCCEH5ZHrFkhTuMeV73f2XNoJBti/9
	XNVyIkcsvFpwh3W9olsxeozeEVXVQqTH+KYfTSpaxIHksGXXGI/pu5xuQgSz5lwv0J9EpTFpGsX
	BYDgoKP0m+9G09IpRs65x04J4Grt2O1BE2fawg2kb9SG6Y0yWbuPjnqMIsQ73RA8R3hsttgrGGa
	D7vxhktEQLC6EkeD6oXBeFKGyEP+m958qn00eYMrJ67X0Gz5SZ7J06kQWXvfD4MZ6/N4pryfHTz
	ZelLcM2BYKU8F51mWG2UFXkRWt6i6Rj85QcVF09upBwkx5OQ/2zQu2WctuvU+mcwrIUzYKIpiCd
	xkH7niO0oHbY7DOsx6tY6kwzzPojZja2eTfwk70RZtmF7M=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_233206_488422_995B658E 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-csky@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG5lIG5lZGVsamEsIDE1LiBub3ZlbWJlciAyMDI2IG9iIDA2OjExOjMxIFNyZWRuamVldnJvcHNr
aSBzdGFuZGFyZG5pIMSNYXMgamUgSWNlbm93eSBaaGVuZyBuYXBpc2FsKGEpOgo+IOWcqCAyMDI2
LTExLTE05YWt55qEIDA2OjMzICswODAw77yMSGFuIEdhbyB2aWEgQjQgUmVsYXnlhpnpgZPvvJoK
PiA+IEZyb206IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiA+IAo+ID4gQWRkIG15c2Vs
ZiBhcyBtYWludGFpbmVyIGZvciB0aGUgVjg2MSBiaW5kaW5ncywgY2xvY2sgYW5kIHBpbiBjb250
cm9sCj4gPiBkcml2ZXJzIGFuZCBkZXZpY2UgdHJlZXMuCj4gCj4gSSB0aGluayB0cmFkaXRpb25h
bGx5IHN1bnhpIGRvIG5vdCBhZGQgbWFpbnRhaW5lcnMgZm9yIHNwZWNpZmljIFNvQ3MuCj4gCj4g
TWF5YmUgeW91IHNob3VsZCBwYXRjaCB0aGUgcmVnZXhwIG9mICJBUk0vQWxsd2lubmVyIHN1blhp
IFNvQyBzdXBwb3J0Igo+IGl0ZW0gaW5zdGVhZC4KClVzdWFsbHkgbm8gZW50cmllcyBhcmUgYWRk
ZWQgYXQgYWxsLgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCj4gCj4gVGhhbmtzLAo+IEljZW5vd3kK
PiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+
ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgfCAxMiArKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwo+ID4gaW5kZXggOTNhYmJiMzE1MDY1Li5kZmMzMDBkYzFlYjIgMTAwNjQ0
Cj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gKysrIGIvTUFJTlRBSU5FUlMKPiA+IEBAIC0yNDAz
MSw2ICsyNDAzMSwxOCBAQCBGOglkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4g
IEY6CWluY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1hcGxpYy5oCj4gPiAgRjoJaW5jbHVkZS9s
aW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+ICAKPiA+ICtSSVNDLVYgQUxMV0lOTkVSIFY4
NjEgU29DIFNVUFBPUlQKPiA+ICtNOglIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gPiAr
TDoJbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gK0w6CWxpbnV4LXN1bnhpQGxp
c3RzLmxpbnV4LmRldgo+ID4gK1M6CU1haW50YWluZWQKPiA+ICtGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svYWxsd2lubmVyLHN1bjI1MmktCj4gPiB2ODYxLWNjdS55
YW1sCj4gPiArRjoJYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjUyaS12ODYxKgo+
ID4gK0Y6CWRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW4yNTJpLXY4NjEqLmMKPiA+ICtGOglk
cml2ZXJzL3BpbmN0cmwvc3VueGkvcGluY3RybC1zdW4yNTJpLXY4NjEqLmMKPiA+ICtGOglpbmNs
dWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N1bjI1Mmktdjg2MSouaAo+ID4gK0Y6CWluY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQvc3VuMjUyaS12ODYxKi5oCj4gPiArCj4gPiAgUklTQy1WIEFOREVTIFNv
QyBTdXBwb3J0Cj4gPiAgTToJQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+
Cj4gPiAgUzoJTWFpbnRhaW5lZAo+IAo+IAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
