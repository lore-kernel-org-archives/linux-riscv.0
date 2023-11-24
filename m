Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C44C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0mZwiHv9kNNVo5f87aYVJXWnt7BqQlVhVrQ2dZCP64=; b=wBg6t3OIJUmGkb
	3XT17pji5Samd4AsDKSYr3L2jhI76HdYEybbpjB3Tc44ItB4dA6/Hp/KWUQ8q4FNV7I7H+5vf6Cg+
	ciV5LwMbtPzO1cs9UZP18IYVkH/3G/KbUsZXxnunAGuwl5a6oe4Fj/6JTPCVNrsWX6AYnBRgMDl5W
	f8JV39CTTC0clbxnkkEyT4kmSSD8v+8eDyylpFUesH1lUG7KaGQ4I5h74hErjZp1JbLzExVf9+xe7
	PTADFv7fY+310aJj4KKw2FmmwUlixLVnBbAV3k5rgLQTMtYfAd2VDUtcvaxlDnIxgIAu2MhnhXyTy
	jxW5dnp4973CKu7xph5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XkI-007Up7-0n;
	Fri, 24 Nov 2023 15:05:30 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XkD-007UnQ-2V;
	Fri, 24 Nov 2023 15:05:27 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58a7d13b00bso1086063eaf.1;
        Fri, 24 Nov 2023 07:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838325; x=1701443125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX6ag15JQklH/2sh4S6Q9NdSDCc91Z9/cyhjI47Mdzg=;
        b=Z587SjxkgMVLPlhnGFBSH9MLxcBBQxAj+ZZC+PFY5iOaKa52PY5IzcO8lKyfgV0oLN
         EwWolayWiQ1ZTQMEkuQvtBuc7n3BD4/UKRjA+SBdTStXYS5fdrJn/3QD7Hv9w0ai3Ann
         XjeDBYhzRx1rHGnEgcVxQ87MTweKc3hRVulMuP1PdwtV1VI2veVLI04lWLePy+iSPFef
         Gz0suuNxgsU+xkUFZSpPhGSGs0fXS0Lt99FKjDGwUOF16l0PNFs8gQXgnvJE6qw44vkz
         tBtulbhFIken3VBii/+JZg2NtUJTt0tFGg8P8Io3KP4ys2tTGsKPQ6xPO0xCsiFU7s7k
         fCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838325; x=1701443125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QX6ag15JQklH/2sh4S6Q9NdSDCc91Z9/cyhjI47Mdzg=;
        b=SOYXTlOM+3z3hzvn9hFwpWkWEEPt37gdkfgAx1m2V5SkcCCQOoLIc/vaA9Sc9dT7Mq
         +kn+YCSqM38tkQyeS1mpY+siXc9cSbCffedUmyE4BE+NOYjX91WlgzLUcsd3z8bbPVvR
         c4iJYTcUq/iZUgYrPkUdgypaT2rACRlb6NBf0Kbg4tseY9uZauVaAGUDqgDyuRtoeiq5
         jhtqzYlF3dTuYO/O58AMpt9OV6bw1lJWZBzPXWTTlzbIQNCE85enmwbO/P42pvOYbDZk
         Mqv3rpjkyuM0NMdmEYoyYqBsyawH9W9EuS6Nnx3y+Zrg46Gb48OJ1nvBPwOp14yacynr
         vH0Q==
X-Gm-Message-State: AOJu0YweC7owsXHKVo6N4MNatljIsxUO/RFLpty99ChijYgK73vXsIjF
	9hoI8J8RWu9tsAqc0stWQQGS6Fs7f1ZGb2NZCHw=
X-Google-Smtp-Source: AGHT+IHJEgTwvm9Mua8eX8HDXk8ny6QHMvkEalIYb/Rn3JabIxQSoGXmU5w6/caCi7qrgTmwdezSoogBDPpKHPRPA+s=
X-Received: by 2002:a05:6358:6f87:b0:16d:e5ab:66e with SMTP id
 s7-20020a0563586f8700b0016de5ab066emr2942380rwn.13.1700838324568; Fri, 24 Nov
 2023 07:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-6-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-6-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:04:58 +0000
Message-ID: <CA+V-a8uhTXrLkndHi8N3AQjHuQLG210o5zyOoekHNLbW+NgTdw@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_070525_818562_E8236702 
X-CRM114-Status: GOOD (  11.97  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MTjigK9QTSBZdSBDaGllbiBQZXRlciBMaW4KPHBl
dGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gVGhlIEFuZGVzIGhhcnQtbGV2ZWwgaW50
ZXJydXB0IGNvbnRyb2xsZXIgKEFuZGVzIElOVEMpIGFsbG93cyBBWDQ1TVAKPiBjb3JlcyB0byBo
YW5kbGUgY3VzdG9tIGxvY2FsIGludGVycnVwdHMsIHN1Y2ggYXMgdGhlIHBlcmZvcm1hbmNlCj4g
Y291bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQ
ZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiAgIC0gTmV3IHBhdGNoCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAgIC0gRml4ZWQgcG9zc2li
bGUgY29tcGF0aWJsZXMgZm9yIEFuZGVzIElOVEMKPiBDaGFuZ2VzIHYzIC0+IHY0Ogo+ICAgLSBO
byBjaGFuZ2UKPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2Yu
ZHRzaSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KVGVzdGVkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaSBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiBpbmRleCBlYjMwMWQ4ZWIy
YjAuLjc4MDcyZTgwNzkzZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDdnMDQzZi5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5
YTA3ZzA0M2YuZHRzaQo+IEBAIC0zOCw3ICszOCw3IEBAIGNwdTA6IGNwdUAwIHsKPgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNwdTBfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YsY3B1LWlu
dGMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbmRl
c3RlY2gsY3B1LWludGMiLCAicmlzY3YsY3B1LWludGMiOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgfTsKPiAgICAgICAgICAgICAgICAgfTsKPiAtLQo+IDIuMzQuMQo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
