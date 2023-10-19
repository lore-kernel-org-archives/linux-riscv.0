Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FDDCDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC7ihByAZpCbloZ9q/7+cCCJjzJi+Dm0ynIqdZcFaGY=; b=sV1M/Bz99mxbT+
	EifVRT+RasPZyE6ggI1TR94y8wyw51OM4aZkqywCgg2oozEmgcXkpKLJaAZg4GNwB9f6A661zp3ZR
	QGfm5y/Z47xhPDBV+XVLazLUo9qzBGxWyekeeoh3h7y/DvsxScBrme3jyr8DT9H3pcRwfDxNSkLTd
	RHnQWu1nE6XW527Jfaumrr9tgSEu/N3rAJ/x1GtuKz6B+zOWjxLVHumeTe4Cka3CRPTmFyuk5fyF/
	Q6CPgR4+4GWi4FxPczztFyZ2FsJo2k/+fxEq/hdc2egQpcAey3ldvjawAlSqKvNbC+UGvJ3+G0c2W
	LH4V7yL0s0oZhy9ZZSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOWr-00GjZ9-2l;
	Thu, 19 Oct 2023 08:37:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOWp-00GjYE-2c
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AD9161AA9
	for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6DCC433CD
	for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697704635;
	bh=JiPNNgrjBECZwV7Y41hs/uNTObKyCCpK7ADnbCSAHfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g99AoHz9se+ybdS2uYK5ZWykPZwQohb/GpZDuoK+jIlKB3dO0wkfmdUsruQ9uxfa6
	 fjj0XUJNLdXJFDUicOxeO6VPK0cH7AUEUiCPgdKAgFag1DrQY7oEzDtd6wXKD9z3Cg
	 uHdWE75C9/T90lRKVXmOUnABClbQ0I8SedCExHjljJCOKAxRG+bsufa004kCKIBwg4
	 ZCw54hIw2dgveVOSrQ7UPkyIxRrhp919AnJ2dq7+mgYU8PcBkfklqxsb97Xo7RuFFi
	 Ra1s6R9z7rMdV36KtVeFVwcK2+k5rqZIRdfaxdmFjn9S8T00oZ0YS0XyrlK0+S9MIC
	 Y0rfmrNsYNytw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e16f076b3so1146607a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:37:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YxmWWINhEKgVZSWteEtKolYUyJO+UvWTOJ3plOPrvdDY9tzdZKO
	5co3tSwTy7MkqWwgPfUHXGkJjD5QeUxlVMNRaqs=
X-Google-Smtp-Source: AGHT+IFE8SPujeMGxsN/7/AxLK5l9xARaEwY/dEF9MzBT6K6SFkjre6r11SbkHuEdtS3YOTy5xs38AL4+I6A7H3C5jc=
X-Received: by 2002:a17:907:d312:b0:9a9:9d19:b250 with SMTP id
 vg18-20020a170907d31200b009a99d19b250mr899792ejc.17.1697704633410; Thu, 19
 Oct 2023 01:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com> <20231017-th1520-mmc-v2-4-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-4-4678c8cc4048@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 19 Oct 2023 16:37:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_sa8pu9G1chP-ZbsCAba_a5yriuEu-0rKR==b24KUnQ@mail.gmail.com>
Message-ID: <CAJF2gTQ_sa8pu9G1chP-ZbsCAba_a5yriuEu-0rKR==b24KUnQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
To: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_013715_936644_70B681E2 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNDo0NeKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEVuYWJsZSB0aGUgbW1jIGNvbnRyb2xsZXIgZHJpdmVy
IGFuZCBkbWEgY29udHJvbGxlciBkcml2ZXIgbmVlZGVkIGZvcgo+IFQtSGVhZCBUSDE1MjAgYmFz
ZWQgYm9hcmRzLCBsaWtlIHRoZSBMaWNoZWVQaSA0QSBhbmQgQmVhZ2xlVi1BaGVhZCwgdG8KPiBi
b290IGZyb20gZU1NQyBzdG9yYWdlLgpZZXMsIGl0J3MgbmVjZXNzYXJ5IHRvIGFkZCB0aGlzIGNv
bmZpZyBmb3IgdGgxNTIwLgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PgoKPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIHwgMiArKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25m
aWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiBpbmRleCBhYjg2
ZWMzYjllYWIuLmM1YTg1ODMyMzZkMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2NvbmZpZ3Mv
ZGVmY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+IEBAIC0xNjgs
MTIgKzE2OCwxNCBAQCBDT05GSUdfTU1DPXkKPiAgQ09ORklHX01NQ19TREhDST15Cj4gIENPTkZJ
R19NTUNfU0RIQ0lfUExURk09eQo+ICBDT05GSUdfTU1DX1NESENJX0NBREVOQ0U9eQo+ICtDT05G
SUdfTU1DX1NESENJX09GX0RXQ01TSEM9eQo+ICBDT05GSUdfTU1DX1NQST15Cj4gIENPTkZJR19N
TUNfU1VOWEk9eQo+ICBDT05GSUdfUlRDX0NMQVNTPXkKPiAgQ09ORklHX1JUQ19EUlZfU1VONkk9
eQo+ICBDT05GSUdfRE1BREVWSUNFUz15Cj4gIENPTkZJR19ETUFfU1VONkk9bQo+ICtDT05GSUdf
RFdfQVhJX0RNQUM9eQo+ICBDT05GSUdfVklSVElPX1BDST15Cj4gIENPTkZJR19WSVJUSU9fQkFM
TE9PTj15Cj4gIENPTkZJR19WSVJUSU9fSU5QVVQ9eQo+Cj4gLS0KPiAyLjM0LjEKPgoKCi0tIApC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
