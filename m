Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9793AC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XayqQTTmAh9nYFidoRDMWOgSIvkBDGjordkfdD881OE=; b=J9jPiauJmYt+RR
	x6kkV3R50MOD41yT4c9SvG6Yp6aOUDQXoFniwSq2sFHTPuP0rcC2kfruPF9gZb/jMqXWdaJGQiSfn
	5ed4thlyXeazHMNFscwqR85YQ/1kv0oh4yrF+jPLyAcyqPEzb7g1/2Zbrxw59YF0LTJBAR7nswEJt
	RIZq/0Z42k1SOwQY4JHHziZ6CrmctP/bu2+YPOdcL9cL4taRlvQwZ4/ljwIhJt/yaBS1EI3A0Lpwq
	AA/MW3abGwGLSQFxfuMtkHvfnRuz0DBTnHHH8zboH6rUhHHgHw/FmeOk39OIQVi1WG/nzPfDSCEcE
	Rd5oud8A14FDEjYz2BfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rONyH-003wGo-3D;
	Fri, 12 Jan 2024 20:17:42 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONyE-003wFB-1X
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 20:17:40 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2cda523725bso4194511fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1705090655; x=1705695455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdPl62Kj42qLAAkF8TWMuSZ2lBBKNdyCgrrnQIbbjq8=;
        b=gSBPnzh/ce1Cb2l9dRpeGdrIq167DxW6Z2iUabqk2VPTyYGs9aDVpIODzlAjyDrID7
         FT/eXC69mn/jNIEYVDHEPmg8jmm4I4xepU7+joVsiymaSS5UXlpIq2HRyaKJlr8Rlmt+
         qgcS1OzSh9oOiy8TZofVNlwNfiACwb/c79IC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705090655; x=1705695455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdPl62Kj42qLAAkF8TWMuSZ2lBBKNdyCgrrnQIbbjq8=;
        b=PDneNRTS3Yy4vVFXfJr95K13sXD4tjNilILFHWaufD/7iE+wOYyKnA+n2o9z3W939n
         aZ6HbttQAAWZryhfytBG7RaTH49Zl5dgDisX98mO6snj3+udAINyZ/QQKvYQOR+e/NIg
         ogCxWsKRP5kokTIOpQJ6m9YSNNNxHfTCe85xfLo+rqq3BHWSL/CHlxYm+VCjewgXus7Y
         OLW8OlWmoRtHK0XBksuUKspV0cZU0AmOxZeCPLm6m4H63rCK9xLc0mb2C55G7CxErQIK
         jQGklF1TBJkwkqIByiswSCazG/5DyP84PuhoRgY3Yncpl12kM7Zq2rExbKXSilgUlZZt
         VdLQ==
X-Gm-Message-State: AOJu0YxvMsJUUeFI4Et57ZE2ZhJrPgKmulB/aYC1sIc40iGEn3Kfjpjq
	uFeqNkkaHWe6iecWHwFI6fKC2j3CEZLooq42JgKzkGrKZNLD
X-Google-Smtp-Source: AGHT+IH9QK11T/Suh1c1OYYHTXmVh+no7GMm/AzsKYmS9El+CD8gOLnlidxHzce7VuVJ4ZtS2BQI67YGB4XrpVAbABo=
X-Received: by 2002:a2e:740d:0:b0:2cd:900c:d5ff with SMTP id
 p13-20020a2e740d000000b002cd900cd5ffmr665638ljc.0.1705090654991; Fri, 12 Jan
 2024 12:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com> <20240110073917.2398826-7-peterlin@andestech.com>
In-Reply-To: <20240110073917.2398826-7-peterlin@andestech.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 Jan 2024 12:17:23 -0800
Message-ID: <CAOnJCUJuDk6euX_XKiQ3H=TSGU02fgGgqSq-WycDwurq1XkDHw@mail.gmail.com>
Subject: Re: [PATCH v7 06/16] perf: RISC-V: Eliminate redundant interrupt
 enable/disable operations
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_121738_858642_DF1B9B95 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCAxMTo0MOKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBUaGUgaW50ZXJydXB0IGVuYWJsZS9kaXNh
YmxlIG9wZXJhdGlvbnMgYXJlIGFscmVhZHkgcGVyZm9ybWVkIGJ5IHRoZQo+IElSUSBjaGlwIGZ1
bmN0aW9ucyByaXNjdl9pbnRjX2lycV91bm1hc2soKS9yaXNjdl9pbnRjX2lycV9tYXNrKCkgZHVy
aW5nCj4gZW5hYmxlX3BlcmNwdV9pcnEoKS9kaXNhYmxlX3BlcmNwdV9pcnEoKS4gSXQgY2FuIGJl
IGRvbmUgb25seSBvbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxw
ZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+IFRoaXMgcGF0Y2ggYWxsb3dzIHVzIHRvIGRy
b3AgdW5uZWNlc3NhcnkgQUxUX1NCSV9QTVVfT1ZGX3tESVNBQkxFLEVOQUJMRX0KPiBpbiB0aGUg
aW5pdGlhbCBQQVRDSDMgWzFdLgo+Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDkwNzAyMTYzNS4xMDAyNzM4LTQtcGV0ZXJs
aW5AYW5kZXN0ZWNoLmNvbS8KPgo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIE5ldyBwYXRjaAo+
IENoYW5nZXMgdjIgLT4gdjM6Cj4gICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjMgLT4gdjQ6Cj4g
ICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjQgLT4gdjU6Cj4gICAtIE5vIGNoYW5nZQo+IENoYW5n
ZXMgdjUgLT4gdjY6Cj4gICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjYgLT4gdjc6Cj4gICAtIE5v
IGNoYW5nZQo+IC0tLQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMiAtLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4
IDE2YWNkNGRjZGI5Ni4uMmVkYmMzN2FiYWRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAg
LTc4MSw3ICs3ODEsNiBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc3RhcnRpbmdfY3B1KHVuc2lnbmVk
IGludCBjcHUsIHN0cnVjdCBobGlzdF9ub2RlICpub2RlKQo+ICAgICAgICAgaWYgKHJpc2N2X3Bt
dV91c2VfaXJxKSB7Cj4gICAgICAgICAgICAgICAgIGNwdV9od19ldnQtPmlycSA9IHJpc2N2X3Bt
dV9pcnE7Cj4gICAgICAgICAgICAgICAgIGNzcl9jbGVhcihDU1JfSVAsIEJJVChyaXNjdl9wbXVf
aXJxX251bSkpOwo+IC0gICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9JRSwgQklUKHJpc2N2X3Bt
dV9pcnFfbnVtKSk7Cj4gICAgICAgICAgICAgICAgIGVuYWJsZV9wZXJjcHVfaXJxKHJpc2N2X3Bt
dV9pcnEsIElSUV9UWVBFX05PTkUpOwo+ICAgICAgICAgfQo+Cj4gQEAgLTc5Miw3ICs3OTEsNiBA
QCBzdGF0aWMgaW50IHBtdV9zYmlfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBo
bGlzdF9ub2RlICpub2RlKQo+ICB7Cj4gICAgICAgICBpZiAocmlzY3ZfcG11X3VzZV9pcnEpIHsK
PiAgICAgICAgICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKHJpc2N2X3BtdV9pcnEpOwo+IC0g
ICAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX0lFLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsK
PiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogRGlzYWJsZSBhbGwgY291bnRlcnMgYWNjZXNzIGZv
ciB1c2VyIG1vZGUgbm93ICovCj4gLS0KPiAyLjM0LjEKPgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBh
dHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
