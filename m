Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F26C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Rbf8gaVXHfXIIcuDKGVx3wzXpMN5J3yYwvs8Ul9hg=; b=eixwE6FgSEXj4o
	dG4jLY/v4SOmd+3KO4hNLGIvtXXeufNIHnlk0azothTGy6i8J7HpPUd8BWd+qxA518jMjxkvWt5Cm
	eF/erRdtlNoVRdNzQFrYwjVvXTWW7+lZ/zKY5TrrVNWLyM7znqsHx6aNAwMq4KgJdktpXSdnUWMJA
	+3kCzAVkp8iqTVpsBY4E+d/7+2sTCrWVdAqPjy857EcsACssphqMfd5z5ZsQrGOS8ParP/AG7QHEv
	92TVTbigHXY3zoV8fvuncnSWmwSWie7meu8Zfi63eMs0t/ovCFpmuAwosFsxpVqgHM7u6rhegoEvz
	isoHzQmaSUeYXnGZxtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uYe-0035ND-1g;
	Wed, 22 Nov 2023 21:14:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uYZ-0035Lf-1m;
	Wed, 22 Nov 2023 21:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB878CE2590;
	Wed, 22 Nov 2023 21:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52F3C433CA;
	Wed, 22 Nov 2023 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687684;
	bh=AdLucksemJuNek6Q2mYTXAkYIMbYexxotameJ9QABko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LVnx0uwqLWCYmAWiJKlx+9QZY8fRd84MrS0vGuvyazCtR5o3mZtlr3SkUdoQFEw5q
	 UtNc1CTaNHgDIqW2h7FzeJEGCtMkG4v/XTFdWhixb7x90ya+qqVqmo2fv1mE5lkGcn
	 yMRdvsfvOr+m9J16TK3uAFuZjXCMPiUGrwPR40Vh/UmeYuBQ78UGAd4eOFn1UxVP0X
	 YDLPQGEBxMnwQc5P38fREVZFDBu0Nacjs2ikRl1U8sikSrAqDWzl/Z5iIdeFjiaxCh
	 cFA7xfNn/SJEjNDQeEAkgPJp6T8pfSIMLHhByTGbgBHIfMa67cgtGE3ZoMds8ltKaQ
	 iU/KdKOJmhqqw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a0064353af8so259876066b.0;
        Wed, 22 Nov 2023 13:14:44 -0800 (PST)
X-Gm-Message-State: AOJu0Yw68ynJa3hes9SzhQNx//Zvtj6tHtVXb2OZwJXBe2Ge7YaOKDuh
	TTtAxLVwJR/zOJotpFlnZlf48RXgZ0kzld5mqug=
X-Google-Smtp-Source: AGHT+IGIAQGj/hNQ0yottVsGW32nM9K4Wad//z6CZkRNPSM4tQ2oBX2Rax3OWYHQw9MprWovLzjIL1OmqUf1i6gr5yE=
X-Received: by 2002:a17:906:b218:b0:a04:98ef:c73c with SMTP id
 p24-20020a170906b21800b00a0498efc73cmr600541ejz.23.1700687683439; Wed, 22 Nov
 2023 13:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-10-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-10-peterlin@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Nov 2023 05:14:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_131447_959590_F22B0B98 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgODoxN+KAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBEb2N1bWVudCB0aGUgSVNBIHN0cmluZyBm
b3IgVC1IZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5zaW9uCj4gd2hpY2ggcHJvdmlkZXMg
Y291bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQgbWVjaGFuaXNtLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+IENoYW5n
ZXMgdjIgLT4gdjM6Cj4gICAtIE5ldyBwYXRjaAo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIE5v
IGNoYW5nZQo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gaW5kZXggYzkxYWIwZTQ2NjQ4Li42OTRlZmFlYThmY2Ug
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwKPiBAQCAtMjU4LDUgKzI1OCwxMSBAQCBwcm9wZXJ0aWVzOgo+
ICAgICAgICAgICAgICBpbiBjb21taXQgMmU1MjM2ICgiWnRzbyBpcyBub3cgcmF0aWZpZWQuIikg
b2YgdGhlCj4gICAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCj4KPiArICAgICAgICAtIGNv
bnN0OiB4dGhlYWRwbXUKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBU
aGUgVC1IZWFkIHBlcmZvcm1hbmNlIG1vbml0b3IgZXh0ZW5zaW9uIGZvciBjb3VudGVyIG92ZXJm
bG93LiBGb3IgbW9yZQo+ICsgICAgICAgICAgICBkZXRhaWxzLCBzZWUgdGhlIGNoYXB0ZXIgMTIg
aW4gdGhlIFh1YW50aWUgQzkwNiB1c2VyIG1hbnVhbC4KPiArICAgICAgICAgICAgaHR0cHM6Ly9n
aXRodWIuY29tL1QtaGVhZC1TZW1pL29wZW5jOTA2L3RyZWUvbWFpbi9kb2MKPiArCj4gIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gIC4uLgo+IC0tCj4gMi4zNC4xCj4KUmV2aWV3ZWQtYnk6
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
