Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADD0EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT1Jp0pesdXskhWqGWcXyQsafebF9HZ64F22vdgDNS8=; b=qWf6k75wKFdkGu
	/SdOfoPoriE/jmmM/DVid21Jmztq2EPIdnXG+a4MJLFdroIKN/Gwuw7gl/tumbhYFh3VInmjvJrWi
	iUTbbmgTwqT1l/p3EwY7u449mPwNfcg7+7bEtxoFBt7Y059i0sG0/Ov+OaTG5jb76amjUJ/+VwjKG
	K9RUHT5jelJHXuIbee+s+0jwhfntJq6OA8m8AHgCbbeDqdQoZ69JX66SRvKgALCfrH/EtKStV6h6F
	deyolhLEU2AUKTRYUb7aZ+OUtMa+B5aP+eEHwS9Mkw6X4fwJe3uF5lou4c5g4iymNqzbNgShXu0yL
	1LDdPeap3MmeviFfY7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF7V-005g47-1v;
	Fri, 14 Jul 2023 09:29:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKF7R-005g2I-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 09:29:48 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703a0453fso25235851fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689326981; x=1691918981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPuE+yRzqiEB8varg/w30zSn9gbVAkPIryT0l1Bao0s=;
        b=jK5Xtm5jSqA1gQEB1zqIWZrWjhypJYmneNg2c/JPWKd+ea9Kaql368JQ7WEkdFlnDc
         3NyBkZhtAZeJEoB0DyaD+4ec+9G/adfezCCfH+VSTTPf95jFkGBE+PWh5KR5MrVQU413
         puA97e3k8noBO4WvDAM2xRmZO11oKqI0SGP1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689326981; x=1691918981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPuE+yRzqiEB8varg/w30zSn9gbVAkPIryT0l1Bao0s=;
        b=ADZSQslSMNit/DB0fKuE7ozx+NLvQWNiFdsn5u3eB/ubjCHvAEB75eJ+8PIDmZGWBC
         xhCiSPrW1sIQY+AACVA065VXC9QzklsjsF1qIAo/481vpw9wLPQcIMU0q+HS+Kcwicy/
         UWWb+r2Z6jlLf9abUNH/9hEevV9GcAsXei4wz7cUP1+UFpoe+7w22iQ9nLyk2NBFnY+z
         0+P89YF/KmHVOYgDN8BohR1MbAZrQRd15yfBfh72oBmNy2KtPOoEBPgzQ1zs98SnEk7C
         vLIWr4IxOgDA0e7C9Eiz0rjl1/yNj3OSHad1UATN1XflkGnHSc46NGNSzq80ikpWMhCs
         CCQA==
X-Gm-Message-State: ABy/qLb5LVdC5v3pXyg7AEK5cXla7BDbXJycVsL4bsqeWXQ+Hg1j/dyX
	ePIMAO0fUsVy63iIeoiCmdZT3jxIcLrzEoB5g4Z1
X-Google-Smtp-Source: APBJJlH+wwYG8rQHkktJTc9cF2xK2F2ZrpVsAjubYvXyVIMRlsbQTU4ksU6lDxZvd+KH8RWoOin1VgN0rwcYfkVGNd0=
X-Received: by 2002:a2e:b04b:0:b0:2b8:3ff3:cd93 with SMTP id
 d11-20020a2eb04b000000b002b83ff3cd93mr643024ljl.7.1689326981568; Fri, 14 Jul
 2023 02:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-10-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-10-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 02:29:30 -0700
Message-ID: <CAOnJCULxXRx0H30zrozcEJ5Nhmco7+m98kJxf8BGJsob8F97MA@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_022945_519768_BE5BA313 
X-CRM114-Status: GOOD (  17.18  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjU24oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IG5vdyBzdXBwb3J0cyBtbWFwaW5nIGhh
cmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gdGFrZSBhZHZhbnRhZ2Ug
b2YgdGhhdCBpbiBsaWJwZXJmLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICB0b29scy9saWIvcGVyZi9tbWFwLmMgfCA2NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGliL3BlcmYvbW1h
cC5jIGIvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4gaW5kZXggMGQxNjM0Y2VkZjQ0Li4zNzhhMTYz
ZjA1NTQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGliL3BlcmYvbW1hcC5jCj4gKysrIGIvdG9vbHMv
bGliL3BlcmYvbW1hcC5jCj4gQEAgLTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2NCByZWFkX3Bl
cmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPgo+ICBzdGF0aWMgdTY0IHJlYWRfdGlt
ZXN0YW1wKHZvaWQpIHsgcmV0dXJuIHJlYWRfc3lzcmVnKGNudHZjdF9lbDApOyB9Cj4KPiArI2Vs
aWYgX19yaXNjdl94bGVuID09IDY0Cj4gKwo+ICsvKiBUT0RPOiBpbXBsZW1lbnQgcnYzMiBzdXBw
b3J0ICovCj4gKwo+ICsjZGVmaW5lIENTUl9DWUNMRSAgICAgIDB4YzAwCj4gKyNkZWZpbmUgQ1NS
X1RJTUUgICAgICAgMHhjMDEKPiArCj4gKyNkZWZpbmUgY3NyX3JlYWQoY3NyKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArKHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgcmVn
aXN0ZXIgdW5zaWduZWQgbG9uZyBfX3Y7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
KyAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgiY3NyciAlMCwgIiAjY3NyICAg
ICAgICAgIFwKPiArICAgICAgICAgICAgICAgIDogIj1yIiAoX192KSA6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICBfX3Y7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArfSkKPiArCj4gK3N0
YXRpYyB1bnNpZ25lZCBsb25nIGNzcl9yZWFkX251bShpbnQgY3NyX251bSkKPiArewo+ICsjZGVm
aW5lIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICAgIHtcCj4g
KyAgICAgICBjYXNlIF9fY3NyX251bTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgICAgIF9fdmFsID0gY3NyX3JlYWQoX19jc3JfbnVtKTsgICAgICAgICAg
ICBcCj4gKyAgICAgICAgICAgICAgIGJyZWFrOyB9Cj4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3Jf
cmVhZF8yKF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wKPiArICAgICAgIHN3aXRjaGNhc2Vf
Y3NyX3JlYWQoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAgICBcCj4gKyAgICAgICBzd2l0Y2hj
YXNlX2Nzcl9yZWFkKF9fY3NyX251bSArIDEsIF9fdmFsKX0KPiArI2RlZmluZSBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZF8yKF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiArICAgICAgIHN3
aXRjaGNhc2VfY3NyX3JlYWRfMihfX2Nzcl9udW0gKyAyLCBfX3ZhbCl9Cj4gKyNkZWZpbmUgc3dp
dGNoY2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wKPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gKyAg
ICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19jc3JfbnVtICsgNCwgX192YWwpfQo+ICsjZGVm
aW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgIHtcCj4g
KyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAg
XAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSArIDgsIF9fdmFsKX0K
PiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyKF9fY3NyX251bSwgX192YWwpICAgICAg
ICB7XAo+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0gKyAwLCBfX3Zh
bCkgICAgIFwKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVtICsgMTYs
IF9fdmFsKX0KPiArCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHJldCA9IDA7Cj4gKwo+ICsgICAg
ICAgc3dpdGNoIChjc3JfbnVtKSB7Cj4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyKENT
Ul9DWUNMRSwgcmV0KQo+ICsgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgYnJlYWs7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJldDsKPiArI3VuZGVmIHN3aXRjaGNh
c2VfY3NyX3JlYWRfMzIKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYKPiArI3VuZGVm
IHN3aXRjaGNhc2VfY3NyX3JlYWRfOAo+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF80Cj4g
KyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIKPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3Jl
YWQKPiArfQo+ICsKPiArc3RhdGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQg
Y291bnRlcikKPiArewo+ICsgICAgICAgcmV0dXJuIGNzcl9yZWFkX251bShDU1JfQ1lDTEUgKyBj
b3VudGVyKTsKPiArfQo+ICsKPiArc3RhdGljIHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKQo+ICt7
Cj4gKyAgICAgICByZXR1cm4gY3NyX3JlYWRfbnVtKENTUl9USU1FKTsKPiArfQo+ICsKPiAgI2Vs
c2UKPiAgc3RhdGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlciBf
X21heWJlX3VudXNlZCkgeyByZXR1cm4gMDsgfQo+ICBzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1w
KHZvaWQpIHsgcmV0dXJuIDA7IH0KPiAtLQo+IDIuMzkuMgo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNo
IFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
