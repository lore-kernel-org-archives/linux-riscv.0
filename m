Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD588C54754
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiK5MS3lIcWo++AzmK3mlqvnwKE4X/y5yaOo/DzuUBE=; b=EsCOcSAd8yuqY6
	AYyBrLRiJOOxuRIRb34B15rzXtJRPyGxMLU0LmW70/o+Qj9rL3/y4Y8HZs8+tDtFQ57G5S5viqMLB
	HPMXnzTmaZJUnVpaO9Lfudu74QMQn6L0kPLEr8r5NWv3Tyjp3sA7Gp5eJqnu4GeKw79g3fk4vXXTD
	6Y30DtB7JaU/CjRpLBOTTf5gCKliSCkHkQN300uJTyDZJAnZgLLOPrlZYi62yQWvLhocDfJRMGc0D
	9nudP2wdy9OeiJP+3OB4c6JcNSd499seaP+W4NoGxOqg76SqFYICLJ799wltEhc+X/PuAPO1UA+uJ
	vQaLdBnGUvj1DzPyaiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvfc-00000008KAd-1fa2;
	Mon, 19 May 2025 08:16:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvdU-00000008JnE-28rp
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 08:14:13 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32909637624so17475431fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747642450; x=1748247250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwwc7zz8RwpZE+tQomEO7USEBEct1RL32QmkFi3jFrk=;
        b=k9cMFFiPG8MTAM02nVBOY8bwA3ipU1mNxw8irDesRKnsnTR1V5R7EARV7IAydccQzJ
         NKm7iNib6aIzvbBGtmon23+fud7wLfVwFv8ftx0YUrax6MWYXpB6xs/nep+ERlhweyBG
         kmXAI20TKIuMOL/Pjis+NQzrPkTcIPXapyZzEmvnPBZAMp9Pdan5jh1pM1bTHO/qqIIY
         Kb6u7OdHYbnWqDywojpoMoOD9VlNphwY5WeMcpWXw1jAquVIU2m/pFu0RINZRNYcAqNv
         nmwOUaFyqq/xlDgX0hL632vJ1QjjiWA60rmhKwAlLscWtkcwB/k6unGH+W7oRWouRR2i
         fEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642450; x=1748247250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwwc7zz8RwpZE+tQomEO7USEBEct1RL32QmkFi3jFrk=;
        b=S4ZCsssYpiKLI1nKCQkaVG9bnvfbz6NEMSUb4JL/fAux6Ys2raec5KH8vhSnjh+v8N
         TfsqbAFnqzoJjHmL8uQAds8BFMwqkhtPYUN8y+M4fJn71meDQom8CC+lWU5LFBbX3s+b
         hU9lhcJbTjvLbB8dOj7VxRga+v5sX7wsxwnOWug3ydEcMtuxP//cl4CMs6Q71jWbrqpU
         PuWUW3ebu/7NnfWrxnQEnRka3PTR/PpOUkIxG9UreGI/P8esP6EjQTS8EXhk3Pu7R0o6
         E+DzAhVUDW1YerdSk5r9NYNURAiCwLpY0pkv4aJse/h+R+tTkUSac0bSxwhtXQmYKmNS
         vsWA==
X-Forwarded-Encrypted: i=1; AJvYcCVCKB+LshhL6aYqrl7yZmmHUrl8NZowMHBV2GyR8SaY+rUEtnBdzILfo1LPRcHblf58jqqZpHx0/NIrLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHuysf6GzPNOOpMrAIdqS1aEKtcmlcp5HNg229Zi43pR7gdxbo
	tHnE+WhtIYa8p7ZAK8sgo0Mm5yH6wmlxy9IkkE1cwgrmf9YfolzK50m7lju4Kw3UudGJ5Xv888V
	IQZCbzya8rkTjN4NXipzGiqnvbAte5UA=
X-Gm-Gg: ASbGncsvoPp5LRS9/2Yocr0HqWg9YJ4STz/ff5KLVnXBurHhpFsGd4UEE/+cyP8Xk/2
	X/zu4Wqq+auo4Qhh1d9hq8sgw/8Tz3BIF56yuvEGNJuT6XyRkC0Bekku/qX2zrwPH0GL3JciLPP
	qA4eLVV7hc57CKIzs7GnWsS6OC75WljOyI4g==
X-Google-Smtp-Source: AGHT+IEUVdwigpKS0BPeqjXhcYtkYwGsYnqU1X9BSXzUgZ8PdV7fqujNcImjFC9c9smpDP23OqyzE8sMIyHm/q4DQX8=
X-Received: by 2002:a05:651c:31c5:b0:30d:b366:d259 with SMTP id
 38308e7fff4ca-32807700167mr31903171fa.10.1747642449683; Mon, 19 May 2025
 01:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250409025202.201046-1-haibo1.xu@intel.com> <Z_hoH0fu_NnEUUfe@google.com>
In-Reply-To: <Z_hoH0fu_NnEUUfe@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 19 May 2025 16:13:58 +0800
X-Gm-Features: AX0GCFtx-eO_q_oMQHBumsX1dzxmSFeZMNLugF74KQnQU0QPQgysXvntx4WvZr4
Message-ID: <CAJve8okP5wy-GNDCsDywgqPPmLSf0q1vGH573vXepxw7j-W8Qg@mail.gmail.com>
Subject: Re: [PATCH] perf symbols: Ignore mapping symbols on riscv
To: Namhyung Kim <namhyung@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_011412_546020_FEE96EF3 
X-CRM114-Status: GOOD (  19.87  )
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

a2luZGx5IHBpbmcuCgpSZWdhcmRzLApIYWlibwoKT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgODo1
M+KAr0FNIE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxs
bywKPgo+IE9uIFdlZCwgQXByIDA5LCAyMDI1IGF0IDEwOjUxOjU2QU0gKzA4MDAsIEhhaWJvIFh1
IHdyb3RlOgo+ID4gUklTQ1YgRUxGIHVzZSBtYXBwaW5nIHN5bWJvbHMgd2l0aCBzcGVjaWFsIG5h
bWVzICR4LCAkZCB0bwo+ID4gaWRlbnRpZnkgcmVnaW9ucyBvZiBSSVNDViBjb2RlIG9yIGNvZGUg
d2l0aCBkaWZmZXJlbnQgSVNBc1sxXS4KPiA+IFRoZXNlIHN5bWJvbHMgZG9uJ3QgaWRlbnRpZnkg
ZnVuY3Rpb25zLCBzbyB3aWxsIGNvbmZ1c2UgdGhlCj4gPiBwZXJmIG91dHB1dC4KPiA+Cj4gPiBU
aGUgcGF0Y2ggZmlsdGVycyBvdXQgdGhlc2Ugc3ltYm9scyBhdCBsb2FkIHRpbWUsIHNpbWlsYXIg
dG8KPiA+ICI0ODg2ZjJjYSBwZXJmIHN5bWJvbHM6IElnbm9yZSBtYXBwaW5nIHN5bWJvbHMgb24g
YWFyY2g2NCIuCj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jp
c2N2LWVsZi1wc2FiaS1kb2MvYmxvYi8KPiA+ICAgICBtYXN0ZXIvcmlzY3YtZWxmLmFkb2MjbWFw
cGluZy1zeW1ib2wKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGlu
dGVsLmNvbT4KPgo+IEFja2VkLWJ5OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+
Cj4KPiBUaGFua3MsCj4gTmFtaHl1bmcKPgo+Cj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL3V0aWwv
c3ltYm9sLWVsZi5jIHwgNiArKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9zeW1ib2wtZWxmLmMgYi90
b29scy9wZXJmL3V0aWwvc3ltYm9sLWVsZi5jCj4gPiBpbmRleCBmYmY2ZDBmNzNhZjkuLjU1YjE0
MDliMDU5MyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9zeW1ib2wtZWxmLmMKPiA+
ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9zeW1ib2wtZWxmLmMKPiA+IEBAIC0xNzMzLDYgKzE3MzMs
MTIgQEAgZHNvX19sb2FkX3N5bV9pbnRlcm5hbChzdHJ1Y3QgZHNvICpkc28sIHN0cnVjdCBtYXAg
Km1hcCwgc3RydWN0IHN5bXNyYyAqc3ltc19zcywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ID4gICAgICAgICAgICAgICB9Cj4gPgo+ID4gKyAgICAgICAgICAg
ICAvKiBSZWplY3QgUklTQ1YgRUxGICJtYXBwaW5nIHN5bWJvbHMiICovCj4gPiArICAgICAgICAg
ICAgIGlmIChlaGRyLmVfbWFjaGluZSA9PSBFTV9SSVNDVikgewo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGlmIChlbGZfbmFtZVswXSA9PSAnJCcgJiYgc3RyY2hyKCJkeCIsIGVsZl9uYW1lWzFd
KSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAg
ICAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgICAgICAgIGlmIChydW50aW1lX3NzLT5vcGRzZWMg
JiYgc3ltLnN0X3NobmR4ID09IHJ1bnRpbWVfc3MtPm9wZGlkeCkgewo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBvZmZzZXQgPSBzeW0uc3RfdmFsdWUgLSBzeW1zX3NzLT5vcGRzaGRyLnNo
X2FkZHI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdTY0ICpvcGQgPSBvcGRkYXRhLT5kX2J1
ZiArIG9mZnNldDsKPiA+IC0tCj4gPiAyLjQzLjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
