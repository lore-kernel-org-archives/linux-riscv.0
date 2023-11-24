Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A1C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUsq/F57zD9mCHPGbzfGQeE+6tBfQn1Z0Y7jnPSMCN0=; b=2GC02JL2LN2M+R
	yG5naKmY6Q+UDHS8M9h14Dyc1BuRBsN8VF5RY1b6zaAo+Qq5MmRs/0nTNm46SmRs8iZoc4ajwcFMC
	QELfeAfnNOpKvl8WMUgFvGZ4lUkedPhbekeA5Kzh9YLAVm2OmmQzTznvIBEvrRYui1f9/mRdyNDP7
	gfzUAodcSluPkcIlsDVDGf9fGUePP/nkN0hlPbLDuYijhprlb0zD7h3fD6mf3EkKTWYbTqhTaF0Gk
	rfh7/9LMNhqSgOgPdpwq0vx3+hkT3jFDcjw+tODhM5R6kW8+jvS6pHzedPXSwnCRAajj2c6dNQkZv
	Yr0jRmp1N/P/8gyCEG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Xn6-007VRM-0w;
	Fri, 24 Nov 2023 15:08:24 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Xn2-007VQC-0S;
	Fri, 24 Nov 2023 15:08:21 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b84402923fso1052696b6e.0;
        Fri, 24 Nov 2023 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838499; x=1701443299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=gWlB1LtnZc5n34FLQVMz89zYpyFH9u3FIQq2u+hDV3jejTlA99n75T0Clov2KcmIh7
         uWqAlLtnXtm5u8IRxQChu6aRQ5K1Rws7cJTyQWM9jkosFKOcZXMtxHlXet00K7To23m8
         MvvOGDylzlOG5WGvoC7q48dHJuCA+I/mDA4GAyMNooJiLhdWyvr/5EhDg6/VuHLqoNZf
         7Qw57DbWZnlXT4T78wqNceJlEsk8r8ofAzqXy/b6qUzo06VMImVxzxyi7rdqw3V+kFw0
         ReQMjzDF0qRSY/wG2+YeZq4S6NOY2ksHVrBfZoWjdMvI2bu5k8cr/c5ZxmQ0FopKkhkb
         oRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838499; x=1701443299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=TxO36cFj1bvkz3E42Ol5pWpfDHySscs7lvsxe1nDQ5YMoC1l5CSjovsbM452CWKCmp
         TJYclPeLEGxuDXxyfpZSV39C4KP9kETzCjhdF6X9KObcVgp7oifbBchpWXves3r7ogJH
         EMxZEhxq6U/6V5iE30D4zrXJGDialUBQxRDv4kzW+5eYv7oGEQyTGm8TZNlJDi/B+IG/
         +MLZmOf95mBbPncPNU7qXTQMXJ0WTx3flePiCa7I3bAo4HioAejUcFcwPQIRa0y09JcK
         2nIxaQvct4R+KeBjoaNexQgByW4KbvyeM/zzc/CJE+6w1nULn2KCbL1v9HFEn43NVydg
         KxlQ==
X-Gm-Message-State: AOJu0Ywq2xG9MBh9HrMTcdC3LrfUpEnm0QdO3968eQIyWl+okQuUk+ji
	zE4p3EBpTOKkCCtSgxDt/1Om56iV94yRErt5siNRT9JAmdhzKA==
X-Google-Smtp-Source: AGHT+IG77ETgp0DMV9KXOevkcc677tVxeO+ugYI4hI1PX92j15kxePilfPhpPcHEZVQAcN8ZK/GbSo2YogMF+v/oHCA=
X-Received: by 2002:a05:6358:998a:b0:168:e707:2e56 with SMTP id
 j10-20020a056358998a00b00168e7072e56mr2295754rwb.16.1700838499153; Fri, 24
 Nov 2023 07:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:07:53 +0000
Message-ID: <CA+V-a8swHt079fxZfzMnzr3w7MfKpLnceHU_p4zvU+6X-Po0zg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_070820_178148_4AC5D924 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MTnigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPHBl
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4geGFuZGVzcG11IHN0YW5kcyBmb3IgQW5k
ZXMgUGVyZm9ybWFuY2UgTW9uaXRvciBVbml0IGV4dGVuc2lvbi4KPiBCYXNlZCBvbiB0aGUgYWRk
ZWQgQW5kZXMgUE1VIElTQSBzdHJpbmcsIHRoZSBTQkkgUE1VIGRyaXZlcgo+IHdpbGwgbWFrZSB1
c2Ugb2YgdGhlIG5vbi1zdGFuZGFyZCBpcnEgc291cmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUg
Q2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+IENoYW5nZXMg
djEgLT4gdjI6Cj4gICAtIE5ldyBwYXRjaAo+IENoYW5nZXMgdjIgLT4gdjM6Cj4gICAtIE5vIGNo
YW5nZQo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIE5vIGNoYW5nZQo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgpSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgpUZXN0ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5
YTA3ZzA0M2YuZHRzaQo+IGluZGV4IDc4MDcyZTgwNzkzZC4uNWYyZjIxODE2MzhhIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gQEAgLTI2LDcg
KzI2LDcgQEAgY3B1MDogY3B1QDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlz
YSA9ICJydjY0aW1hZmRjIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFz
ZSA9ICJydjY0aSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lv
bnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRyIiwgInppY3NyIiwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIs
ICJ6aWhwbSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiemlmZW5jZWkiLCAiemlocG0iLCAieGFuZGVzcG11IjsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBtbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBp
LWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpLWNhY2hl
LWxpbmUtc2l6ZSA9IDwweDQwPjsKPiAtLQo+IDIuMzQuMQo+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
