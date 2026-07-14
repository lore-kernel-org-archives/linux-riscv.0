Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A414C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UF4Ax0r1yN3aKAwJrXd8nyxh6yMY41QRhD7UGqIhxmE=; b=Fmz72q0bsf9yZG
	4Gp6hnSasveNnakavhs/hsPl2aBzxAJWmk+0ctVUhKh5Wa4WMCca3Ly4LYNcuqidMaw0xP+924Zor
	KRvCq+lNOD4tXQn0203cf43IVJ3facfHn8IMtXNYPXmuiQm3Xceuyz2IuFHFmMWcSmufwBiJDy5Z6
	vnQboBugvg0nUwiCHPI7defIyPWGbkYsv7KRWfQt1U/i30ylC4L3oI6x+dgJRBT7IP+JGh9UnNB0u
	aa6MS4zBvYXd48vzBygoDYhCs8bftePC6XMVzg5Ddc+4mkW19ikZpyqAcOvQVrjkCkSo5Zpd5v2C2
	dYjthnGRFicH8j3kjseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpi-0000000C5r2-0Z27;
	Tue, 14 Jul 2026 13:05:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpd-0000000C5mU-1moC
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so3260574f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034351; cv=none;
        d=google.com; s=arc-20260327;
        b=AkdBTsKAicYkfesSkNDyUrrBI64Kyl0eC5HHUIypJgejDeo5vcnhJ/1FCaWYwJ9c5o
         V0lnKCLE+ulbBb+vti2f8SYAF4hjr1Aw/8ohtL8A2R2clelOPRhPDPgiNLVXNQ49VXec
         ZNzBaggiiahou9GOBS8/ytQ6DbYHvfxSUrnRNHDFNuOUPl0yWR4WxgwyB2OlHiawRDW2
         L74K8ruIU5DbKIWUWnJlz745hyB5JYqne/YTs6dHD+1swtSJub0WujHjyN9hsxQInLoX
         wkVEo3f83osbf9+u2z/EnCiAt1b0Ey6f+nH7yg29TFlFT9gVOWBEU/wGqTT+OdR6NHPD
         KCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        fh=ZWmqMU4VgiVY1wm3icB0xLnvntgXQwMHNRQZM95U9sI=;
        b=DatAxC2f4yaaM581Tiy9p30YxOcDnD+dmoUrD3HJhpRQFy9v5gleJUy3xdo5NZOKXt
         g4yrVacL0F079auEh5B2vu+ARLBK3SJO6kktsV58kPSSN05pV9w2CHesp59QxYuTEOJO
         qrCZy24FcRX6hpJY2IeyNsf6+pfR32ovP7H4qExn03n3uH1gMrXkALEyOiPToP3Z+GvA
         71p+4PZtSBd/wmraMJJHOvGLAsCgcaRMkhFCfY9S9Bcqr7dtGQAawrhiDkbyYjxiRNzX
         Kl2rdakHRo4HkBRc1js7g9yHnubl0kbppjezlY8Mw05Q3S4OVM6rifNgvVyAHfhSFqxn
         YpdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784034351; x=1784639151; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        b=oFyXMX9ti0YL0qV0iR8VtZKnYAg+wa96yRJMY2cxNFn+NWqW/5lHfb5nblDnvP8ot/
         6nvMU5SzvBnug0T54tikmP47TdMamY38ih0yRybdCHedoCCy1Zd7ISJQ1o2gzt3pztgC
         /JG2F5pOs4oAgkOEgCkC1NiUtYysl1VR1A5XT8CjRfwgN3pOMArfFGieq+AQG2Wj7mx1
         0Ix6g0Yy1nYHiARmyKSNu4Qgr8w4yN1YjBHc3M+a+aCLjdzUist1usXnJfRozGrZejqa
         0Igk/iwDNh9G2yBsKivwciMAn9V7NpQap1CxaWsaj3Cwu5kwTARn2T3wFTtlf9Om2PcN
         ruxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034351; x=1784639151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        b=biBYhcEGZK2ZQ1UXJc/tuFegBsVnjlIShIpY4nlApt0utPpjxtm/DoGFShj1r/BDqm
         gCwlMnQBm6ECYpCfkh5i8zpG6p7WEtcKtwG8p6qCIGLwVv2B/iFBqd8F63CE4nntKxMu
         PWu7PhcN3k6bBRi3NKOgcSBnbCtA2jhviYQiQ6EwoUHSo9YUA6ABycHoK4nFAqkqKz4L
         PDZZnIDqpGv7M6IlsfxpGzBCgpahWV/Bl4Vprw3vBR0izJoeeH1+3sxl+gT0IO7djA9e
         F+Yj3tM97JXVpCkMAGfH/4xkVvxq8RFq8opKABO5c5+nnmgxojdTR8/IqXe3/0m6SFl1
         fVFw==
X-Forwarded-Encrypted: i=1; AHgh+RokggsBtfTWFuuyEvcgIEABSom/NtWKTBOIMeKWe6TJsculyXQcVveVqXX3IHl77Y0LcBfUCAwvUeLfLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdF6IQt7yJ+M7NjEgVc5qWPgOcW/iH5PkoBUf3Fi/eh3epz+wG
	EiDQitwLcFawViQHA4LYZQgocTI6eEmo6mKn2QMVpOEbKgqMalSaH5XCuqVbKayEuaF62EVKaj5
	9dBWa8CHWKoxKDe8tIN+zOxaFNJOq+k0skL3Gl7T9kQ==
X-Gm-Gg: AfdE7clSVA2mkROqbWK8N0iePqV++FEMHO9dwFqo3zIRj5lpWRdbCBr84KUBx72iXHZ
	wAy9q5WugJepWaeY2SE/KeHwDfPwRYHzEBj4XaOgPVTB19r3J8tYvKqr2cJOnIvZ9APZo40slu1
	+xEkkunnhpd8+xNaE5164UI14k4ZAJGDIWP/3n6ok6j72wP0SHJ7r2oHvHxJxEQPojYN0QLJGp7
	H2cbGzqsK4Zhn+i4eR3v5mXxQBK4UzmC9KdQUt/Nlcrf0SFopf+ad7SVyD9McBbOdr0ygAch16x
	hk5fidaPnP34heSxOuXDYwO72rKAaM7jrAgJvBnVazDbc8N112+OgzLU5wa1ftRpE3YE7CpZ+Az
	siO7Xr/pW6eTvlHQ=
X-Received: by 2002:a5d:5887:0:b0:470:6dc:848a with SMTP id
 ffacd0b85a97d-47f2dca7fafmr15576550f8f.2.1784034351347; Tue, 14 Jul 2026
 06:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260707122548.281685-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260707122548.281685-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2026 18:35:39 +0530
X-Gm-Features: AUfX_mwNt_JswCBrkPN8wo_MZe_qdY6E8a8GFKfn-nzYnLb-iI-iMooL3KV8GcY
Message-ID: <CAAhSdy1F3jrK4eiuVvWTL1uidZxEsVbrNoDQ8gXpsK-3MgzyAA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Inject instruction access fault on unmapped
 guest fetch
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060553_551069_23B154C7 
X-CRM114-Status: GOOD (  21.35  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA1OjU24oCvUE0gUWluZ3dlaSBIdSA8cWluZ3dlaS5odUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFdoZW4gYW4gaW5zdHJ1Y3Rpb24gZ3Vlc3QtcGFnZS1m
YXVsdCB0YXJnZXRzIGEgR1BBIHRoYXQgaXMgbm90IGJhY2tlZCBieQo+IGFueSBtZW1zbG90LCBL
Vk0gaGFzIG5vIE1NSU8gZW11bGF0aW9uIHBhdGggZm9yIHRoZSBmZXRjaC4gTG9hZCBhbmQKPiBz
dG9yZSBndWVzdC1wYWdlIGZhdWx0cyBjYW4gYmUgcm91dGVkIHRocm91Z2ggTU1JTyBlbXVsYXRp
b24sIGJ1dCBhbgo+IGluc3RydWN0aW9uIGZldGNoIGhhcyBubyBkYXRhIHBheWxvYWQgb3IgYWNj
ZXNzIHNpemUgZm9yIHVzZXJzcGFjZSB0bwo+IGNvbXBsZXRlIGluIHRoZSBzYW1lIHdheS4KPgo+
IFRyZWF0IHRoaXMgY2FzZSBhcyBhbiBhcmNoaXRlY3R1cmFsIGFjY2VzcyBmYXVsdCBpbiB0aGUg
Z3Vlc3QuIE9uIGJhcmUKPiBtZXRhbCwgZmV0Y2hpbmcgZnJvbSBhbiBpbmFjY2Vzc2libGUgcGh5
c2ljYWwgYWRkcmVzcyByYWlzZXMgYW4KPiBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgZm9yIHRo
ZSBzdXBlcnZpc29yIHRvIGhhbmRsZSB0aHJvdWdoIGl0cyB0cmFwCj4gdmVjdG9yLiBSZWZsZWN0
IEVYQ19JTlNUX0FDQ0VTUyBiYWNrIHRvIHRoZSBndWVzdCBzbyB0aGUgZ3Vlc3Qgb2JzZXJ2ZXMK
PiB0aGUgc2FtZSBjbGFzcyBvZiBleGNlcHRpb24gcmF0aGVyIHRoYW4gbGVhdmluZyB0aGUgZmV0
Y2ggYXMgYQo+IGhvc3QtaGFuZGxlZCBjb25kaXRpb24uCj4KPiBzdHZhbCBjb250YWlucyB0aGUg
dmlydHVhbCBhZGRyZXNzIG9mIHRoZSBwb3J0aW9uIG9mIHRoZSBpbnN0cnVjdGlvbiB0aGF0Cj4g
Y2F1c2VkIHRoZSBmYXVsdCwgd2hpbGUgc2VwYyBwb2ludHMgdG8gdGhlIGJlZ2lubmluZyBvZiB0
aGUgaW5zdHJ1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1
QGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3IgTGludXgtNy4yLXJj
WAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyB8IDE5
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfZXhpdC5jCj4gaW5kZXggMGJiMGM1MWUzYzg5Li42Yzg1MzBiOWYyOWUgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X2V4aXQuYwo+IEBAIC0zOCw2ICszOCwyNSBAQCBzdGF0aWMgaW50IGdzdGFnZV9wYWdl
X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X3ZjcHVfbW1pb19zdG9yZSh2Y3B1
LCBydW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZmF1bHRfYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cmFwLT5odGluc3QpOwo+ICsgICAgICAgICAgICAgICBj
YXNlIEVYQ19JTlNUX0dVRVNUX1BBR0VfRkFVTFQ6IHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAvKgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIE5vIG1lbXNsb3QgYmFja3MgdGhpcyBH
UEEgYW5kIGFuIGluc3RydWN0aW9uIGZldGNoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICog
Y2Fubm90IGJlIGVtdWxhdGVkIGFzIE1NSU8uIE9uIGJhcmUgbWV0YWwgYSBmZXRjaAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAqIGZyb20gYW4gdW5iYWNrZWQgcGh5c2ljYWwgYWRkcmVzcyBy
YWlzZXMgYW4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbiBhY2Nlc3Mg
ZmF1bHQsIHNvIHJlZmxlY3QgdGhhdCBiYWNrIHRvCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICogdGhlIGd1ZXN0Lgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBrdm1fY3B1X3RyYXAgaW5zdF90cmFwID0gewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLnNlcGMgICA9IHRyYXAtPnNlcGMsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAuc2NhdXNlID0gRVhDX0lOU1RfQUNDRVNTLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnN0dmFsICA9IHRyYXAtPnN0dmFsLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLmh0dmFsICA9IDAsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAuaHRpbnN0ID0gMCwKPiArICAgICAgICAgICAgICAgICAgICAgICB9
Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGly
ZWN0KHZjcHUsICZpbnN0X3RyYXApOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAx
Owo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgICAgICAgICAgICAgICB9
Owo+IC0tCj4gMi4zOS41Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
