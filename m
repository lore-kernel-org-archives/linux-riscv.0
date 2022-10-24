Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E9C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRAAxCbnTDfZo2OgIBSnMpf5gpGJ07KuFAtcfDCgOko=; b=uXPR/6cnePhAOf
	CqgfiXG1DMqc6T2mO1Ikfe2BV0dre8PBwrZwzYj+mXP+Ueuk8U7hStHT8inRZR0bYWVWtHQWX6mrb
	QqM6YQqVP3p9kLquIVzYZM+9oT1AMe4qCKN424/KdrnTaI2dKf37wQxEWVMdT5Dzqd9EuK67ajSoa
	a+fP0xZVuzLGeTreBlduMkDEdT4Tw4SSY8Ti0/nDSGXyqH0jckqgGlaS4ege/0CinB4w9y12THZzJ
	biXIg6ItMnVldp3bd9CeE1/i3WZ2Tj4nAE0Mggi9+GuudsjR30HGfV6JXN0/BrNFcVdgkQa0o09EU
	rTdgNoKlr30fA/07FueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsQS-00008G-MS; Mon, 24 Oct 2022 08:03:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsQP-00006s-Qn
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 08:03:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 13298B80E7A
	for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 08:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40749C43142
	for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666598584;
	bh=CXws4eLr0gl3odZwqTEuuhZZp1WDhaclsxdDRXlhMQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YIj6ATKSLfUvngOWKyQpxY0uDpchrCF9EfJF3NhblMSs0sZd1UQFhe3JsKjQx1JOg
	 aEuKTT4mup0cKdPRcGDGVUjf4cpVK14Lz5PXYVL4gAgSMXAxOYefSV7nfIfeCmZPEA
	 0iyRrEbnZ/av/766ux6DZTpYX0aF1r+Iuspd/stry1Stle/WBLw9aZB14gbjaZIPyI
	 8UY4zsjz/drcQgifIw/F/8YYbEjLdNkTJr/0aBcEidr81pJ0zfrWC9rgwjxglsKFaL
	 SrVRRRAExIAkiHYqi11Kf66WHK9dnD/ONhh12JEfcVcH5BmSd/q4I0+s34qKwMgc3W
	 7dtdnWAcYBNqw==
Received: by mail-oi1-f173.google.com with SMTP id w74so10128724oie.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 01:03:04 -0700 (PDT)
X-Gm-Message-State: ACrzQf2ETvAcJrXHBBPiSbQeSBTAKxEvwyOanCFeXCGKZBMxOIoC7Q0M
	aCau3tf+Y7qPwbUpPWASEl4jSZWKKePUFf9nknQ=
X-Google-Smtp-Source: AMsMyM4opuf9ZlLlQKT18CpSvfe9XotBrtNnzZrG6O6GBcHpNVvd4QnPrdeLYevOyANG4WDlsZD5B1GA8zDQRLU5blc=
X-Received: by 2002:a05:6808:14cf:b0:355:5204:dd81 with SMTP id
 f15-20020a05680814cf00b003555204dd81mr15684588oiw.112.1666598583325; Mon, 24
 Oct 2022 01:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221023133205.3493564-1-guoren@kernel.org> <20221023133205.3493564-3-guoren@kernel.org>
 <1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev>
In-Reply-To: <1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Oct 2022 16:02:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSmSR7uKrCGZ24+NSa31FAecOBpUh8G0SMAEV-5oFGJyQ@mail.gmail.com>
Message-ID: <CAJF2gTSmSR7uKrCGZ24+NSa31FAecOBpUh8G0SMAEV-5oFGJyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Muchun Song <muchun.song@linux.dev>
Cc: palmer@dabbelt.com, palmer@rivosinc.com, heiko@sntech.de, arnd@arndb.de, 
	Muchun Song <songmuchun@bytedance.com>, catalin.marinas@arm.com, chenhuacai@loongson.cn, 
	Conor.Dooley@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_010310_026844_57F477A1 
X-CRM114-Status: GOOD (  14.42  )
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

T24gTW9uLCBPY3QgMjQsIDIwMjIgYXQgMzowNyBQTSBNdWNodW4gU29uZyA8bXVjaHVuLnNvbmdA
bGludXguZGV2PiB3cm90ZToKPgo+Cj4KPiA+IE9uIE9jdCAyMywgMjAyMiwgYXQgMjE6MzIsIGd1
b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4KPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGVuYWJsZSB0aGUgZmVhdHVyZSBvZiAi
ZnJlZSBzb21lIHZtZW1tYXAgcGFnZXMgb2YgSHVnZVRMQgo+Cj4gV2UgaGF2ZSBhIG5ldyBuYW1l
IOKAnEhWTyIgdG8gcmVmZXIgdG8gdGhpcyBmZWF0dXJlLiBTbyBJ4oCZZCBsaWtlIHRvIHJld3Jp
dGUKPiBUaGUgY2hhbmdlbG9nIHRvIHNvbWV0aGluZyBsaWtlIOKAnEVuYWJsZSBIVk8gWzFdIGZv
ciBSSVNDVuKAnS4KT2theS4KCj4KPiA+IHBhZ2UiIFsxXS4gVG8gbWFrZSBpdCB3b3JrIGNvcnJl
Y3QsIHdlIGFsc28gbmVlZCBmaXh1cCBQR19kY2FjaGVfY2xlYW4KPiA+IHNldHRpbmcgZm9yIGh1
Z2UgcGFnZSBbMl0uCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRv
Yy8yMDIxMDUxMDAzMDAyNy41NjA0NC0xLXNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbS8KPiA+IFsy
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDIyMDMwMjA4NDYyNC4zMzM0MC0x
LXNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4KPiA+IENjOiBNdWNodW4gU29uZyA8c29uZ211Y2h1bkBieXRlZGFu
Y2UuY29tPgo+ID4gQ2M6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgo+ID4g
Q2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBJ4oCZYW0gcmVhbGx5IGdsYWQg
dG8gc2VlIG1vcmUgYW5kIG1vcmUgYXJjaGVzIGZvciBzdXBwb3J0IEhWTy4KPgo+IEFja2VkLWJ5
OiBNdWNodW4gU29uZyA8c29uZ211Y2h1bkBieXRlZGFuY2UuY29tPgpUaHgKCj4KPiBUaGFua3Mu
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
