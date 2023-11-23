Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5134C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 00:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMwZ0TgpC0CNaMXwKUbWTH0RdLHXkXoJn2RWObGvbpo=; b=JhoCiLS0JoEYRV
	uSSUPQ3nCFV3LFaAVqUV3PtaNO2oEoqrqCado4pbFjT4ZM+pZViY9xjvakCOpjCO5gxWEkFQL7jCp
	7ZzP5r8Cz0iWuKayVCLl8HzA6st/bo34nzuLmSOKaestCYXAcWbKdxF0We3jDPw8hxTnn6ejW4T5q
	K5SDDpKF1EH6nr5DEdBvLkv2cJ5Swcz/P/YxLhZ4REMgdtkDw+YhJ3IX3U3Ofxq7e1uHerU+VRIXY
	uMn1szwpskJHYh6PnLz+E3B1iQLK3ukSo972kmxxQPIfbK9ya1RPsaz68eeOb+pBGdYxjJvM/nQc0
	TFm1DcHFMRDsca++qCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xwU-003Rod-1m;
	Thu, 23 Nov 2023 00:51:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xwR-003RnU-2I
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 00:51:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so204465f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 16:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700700695; x=1701305495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFSRqxyM60XZYlWMe+LxLHgfBXsOYKs0Arhl5TpCQS8=;
        b=NMoEcRqaVGj1IpIhpkK7hO2dAx0IPccTMdpC0YGiyqBKegMQCM2B35iNNFSfd28fiL
         z/URkBoC4zNgxfKsMFiJCTBJcWWk9tAA7P3JQmrIeZ/AyEelwz8E3LiITtaFOkZVUdnN
         FGZlFx2NB0a016Pl1zFwdLmT6qSQiLdI+4mhl/T5pgESx3ch4DlYE4n0nerPB+JRUGpg
         WmxgGwlvZUZI6plAdku1n9Btm/3u/TSeGzwW/UQk6vglNZjl5wbamZUWOeHR8MV/9ZKO
         9vXKkH1kd9I2Qm8lbQpEurJKDaphiUbwKlGVb6o/zMUxgPwm1hcW1ccTQfupklTd2NoX
         NqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700700695; x=1701305495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFSRqxyM60XZYlWMe+LxLHgfBXsOYKs0Arhl5TpCQS8=;
        b=Sy/fz8RuGNpopsCr6kd3TY9S64y69DVV6XUCYRxfVL3bezzeqOBSXYfLz6GkzcnVak
         HOUFt+iw/FgbVjPa9p03UgYRF8EekDc9j+bV3VY8EHLfCT7qGZYS/kd5tuto96Ulx7yG
         DKBzHGIFp2f7uUEMSN6aMt4gtIPHTq80kpJNhsM4z1sERVhc0MdzXyhDGOgKoZB+KHQw
         0MymeoUIE4g9uViySPt+fhloauZIpT75cfSx2ycr2umZQNwLluJx2vZ+vLnVf8GteDVS
         iriqhfSVfXgLokPqr/qOi+emDPfX8LNj+MTho2ltJM9KXDxWBe1QriB/JAuI7af5bxmm
         OwxQ==
X-Gm-Message-State: AOJu0YyKVgdLNKbY08qPkZJXFpNgaPoDqDyR1lfFsmgNRlIBmn0BW+lR
	aq+Y9yWcAmswcYcyOWO78J469MlGaI+SsHoeRN0=
X-Google-Smtp-Source: AGHT+IFsZynBqDZU07UjtjyWcGDEoU4r8+d4uBQx87ACMaj5T1mQc/a3y5MZDETnfbK00TiUJQ8Ke8+6cd2ruagK5V8=
X-Received: by 2002:a05:6000:144f:b0:332:caa9:72b2 with SMTP id
 v15-20020a056000144f00b00332caa972b2mr3445384wrx.3.1700700695019; Wed, 22 Nov
 2023 16:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
 <20231122111517.GR8262@noisy.programming.kicks-ass.net> <20231122124134.GP4779@noisy.programming.kicks-ass.net>
In-Reply-To: <20231122124134.GP4779@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Nov 2023 16:51:23 -0800
Message-ID: <CAADnVQKhpjt0pojdYGXpeyMvJnCUVvyrRKCmHg3cKYjAs-HDmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_165139_747004_AC3B2B34 
X-CRM114-Status: GOOD (  16.11  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDo0MeKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPgo+ICsvKgo+ICsgKiBFbWl0IHRoZSB2YXJpb3VzIENG
SSBwcmVhbWJsZXMsIHNlZSB0aGUgbGFyZ2UgY29tbWVudCBhYm91dCBGaW5lSUJUCj4gKyAqIGlu
IGFyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCgouLiBhbmQgaW4gY2ZpLmggLi4Kd2hpY2gg
d2lsbCBoYXZlIGEgY29weS1wYXN0ZSBmcm9tIHlvdXIgb3RoZXIgZW1haWw/Cgo+ICAgICAgICAg
ICAgICAgICBwcm9nLT5icGZfZnVuYyA9ICh2b2lkICopaW1hZ2UgKyBjdHgucHJvZ19vZmZzZXQ7
Cj4gICAgICAgICAgICAgICAgIHByb2ctPmppdGVkID0gMTsKPiAgICAgICAgICAgICAgICAgcHJv
Zy0+aml0ZWRfbGVuID0gcHJvZ2xlbiAtIGN0eC5wcm9nX29mZnNldDsgLy8gWFhYPwoKSnVzdCBk
cm9wIFhYWC4KCj4gLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvYnBmLmgKPiBAQCAtMTQzMSw2ICsxNDMxLDkgQEAgc3RydWN0IGJwZl9wcm9nX2F1eCB7Cj4g
ICAgICAgICBzdHJ1Y3QgYnBmX2tmdW5jX2Rlc2NfdGFiICprZnVuY190YWI7Cj4gICAgICAgICBz
dHJ1Y3QgYnBmX2tmdW5jX2J0Zl90YWIgKmtmdW5jX2J0Zl90YWI7Cj4gICAgICAgICB1MzIgc2l6
ZV9wb2tlX3RhYjsKPiArI2lmZGVmIENPTkZJR19GSU5FSUJUCj4gKyAgICAgICBzdHJ1Y3QgYnBm
X2tzeW0ga3N5bV9wcmVmaXg7Cj4gKyNlbmRpZgo+ICAgICAgICAgc3RydWN0IGJwZl9rc3ltIGtz
eW07Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgYnBmX3Byb2dfb3BzICpvcHM7Cj4gICAgICAgICBz
dHJ1Y3QgYnBmX21hcCAqKnVzZWRfbWFwczsKPiAtLS0gYS9rZXJuZWwvYnBmL2NvcmUuYwo+ICsr
KyBiL2tlcm5lbC9icGYvY29yZS5jCj4gQEAgLTY4Myw2ICs2ODMsMjMgQEAgdm9pZCBicGZfcHJv
Z19rYWxsc3ltc19hZGQoc3RydWN0IGJwZl9wcgo+ICAgICAgICAgZnAtPmF1eC0+a3N5bS5wcm9n
ID0gdHJ1ZTsKPgo+ICAgICAgICAgYnBmX2tzeW1fYWRkKCZmcC0+YXV4LT5rc3ltKTsKPiArCj4g
KyNpZmRlZiBDT05GSUdfRklORUlCVAo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFdoZW4gRmlu
ZUlCVCwgY29kZSBpbiB0aGUgX19jZmlfZm9vKCkgc3ltYm9scyBjYW4gZ2V0IGV4ZWN1dGVkCj4g
KyAgICAgICAgKiBhbmQgaGVuY2UgdW53aW5kZXIgbmVlZHMgaGVscC4KPiArICAgICAgICAqLwoK
SSBsaWtlIHRoZSBpZGVhIQoKPiArICAgICAgIGlmIChjZmlfbW9kZSAhPSBDRklfRklORUlCVCkK
PiArICAgICAgICAgICAgICAgcmV0dXJuOwoKVGhlIGNmaV9tb2RlIHZhciBuZWVkcyB0byBiZSBn
bG9iYWwgYWxvbmcgd2l0aCBlbnVtID8KT3Igc29tZSBuZXcgaGVscGVyIGZ1bmN0aW9uIGZyb20g
YXJjaC94ODYgPwoKPiArCj4gKyAgICAgICBzbnByaW50ZihmcC0+YXV4LT5rc3ltX3ByZWZpeC5u
YW1lLCBLU1lNX05BTUVfTEVOLAo+ICsgICAgICAgICAgICAgICAgIl9fY2ZpXyVzIiwgZnAtPmF1
eC0+a3N5bS5uYW1lKTsKPiArCj4gKyAgICAgICBwcm9nLT5hdXgtPmtzeW1fcHJlZml4LnN0YXJ0
ID0gKHVuc2lnbmVkIGxvbmcpIHByb2ctPmJwZl9mdW5jIC0gMTY7Cj4gKyAgICAgICBwcm9nLT5h
dXgtPmtzeW1fcHJlZml4LmVuZCAgID0gKHVuc2lnbmVkIGxvbmcpIHByb2ctPmJwZl9mdW5jOwo+
ICsKPiArICAgICAgIGJwZl9rc3ltX2FkZCgmZnAtPmF1eC0+a3N5bV9wcmVmaXgpOwo+ICsjZW5k
aWYKPiAgfQo+Cj4gIHZvaWQgYnBmX3Byb2dfa2FsbHN5bXNfZGVsKHN0cnVjdCBicGZfcHJvZyAq
ZnApCgphbmQgaGFuZGxlIGRlbGV0aW9uIG9mIGtzeW1fcHJlZml4IGhlcmUuCgpJIHRoaW5rIGl0
J3Mgc2hhcGluZyB1cCBuaWNlbHkuClBscyByZXNlbmQgYm90aCBwYXRjaGVzIGFzIGEgc2V0IGFu
ZCBjYyBicGYgQCB2Z2VyLgpCUEYgQ0kgd2lsbCBwaWNrIGl0IHVwIGFuZCB0ZXN0IG9uIGFybTY0
LCB4ODYtNjQsIHMzOTAgd2l0aCBnY2MgYW5kIGNsYW5nLgpXZSBkb24ndCBkbyBDT05GSUdfKklC
VCB0ZXN0aW5nIGF1dG9tYXRpY2FsbHksIGJ1dApJIGNhbiBtYW51YWxseSB0cnkgdGhhdCBhZnRl
ciB0aGUgaG9saWRheXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
