Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964B0C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4E1QDhzRA8eXxK2jYUGz96WBz2Gq4usgR2fdG2Hl2U=; b=YccHXRuc9k6XMW
	GIW+nQoocmQGrh00QF9AwltRu0atyl6O/K0xsX7a34VgqAWUoS3RQmmrpKioAKIMjAqtPg6VNR+TG
	mRhFk5OBLgD+7fh/E7GAlJnnitq5ESbvZb8vuLoFnEUmNYQE7TNDN0E2aO/cRfFVM1P9+iWufq2tc
	ztxVGW/7Zs+Smv5NsEsyYP22OnY0DSdUkVQMZV1HWzt7DV4tMYhLPMiqMddfOjbF/kXigtU8h5mTH
	xZB80uXH5WnU5UFFYTdn+2bdzy3AQMiyoEfB4zQ4uDLRvB6ybuHvdWsocNxcveVEXckIKyk/DqaR8
	lwVC0sdTK5eYpNGWT5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD6p-00000002PAK-1Z30;
	Mon, 01 Jul 2024 09:14:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD6m-00000002P9p-2pqN
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:14:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57d06101d76so2971577a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719825239; x=1720430039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxlECmQDcJb37f5C6V8ZGBnHo3bHH3o9P+OxX8YRfxo=;
        b=EYYWkc1aKWCQVqN1r0bsJ+PWZxHFIlbTfai0QgD+gPogGbEA4sX/vef95+pyr0g5sg
         55b7+bPPUcaNFRpHsJ/wjRg5a578SsAKXoqDRidfijiknqRxQ4d4Dd7nWh33CG7dO0l2
         jSIOYd3zaBlh1T5StnfP1Z6KIOLU8XdzRg4v8HTY9HMr9lydGIK3wNuBm4fbOwPlWQSI
         aLnF8pyxtkyUvFDwz81LxCMbHXjzP/nntXxYNU4vHuCF2P7ISCZrgJlHmvXv1DsdU4ZP
         CwcYBNz8Xnakb5LbLqiHXNPv8KU+dwReXvE+qWY7w0rBcyCsOgLzG4uZstFUdezSUOI3
         3RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825239; x=1720430039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxlECmQDcJb37f5C6V8ZGBnHo3bHH3o9P+OxX8YRfxo=;
        b=biK49WYun95ovVHTByOFEd+ViezyNbmAJpHwWpNhE3ESioFLmESnn/nF/OGMnwTOCu
         LFE5ww0JqeF+dsP+956wD8yDWq0elwKeA3vd6VzfpwItLjuWp5mvpA3Xub/NePVtj/ib
         +aQu4/3NxmpMJPsCHE2VTvQ8gi6iY1Zd82yqH09VqBvL6kLEG7pJxaV+yWSwx6s5vBq+
         JFlE0Nmr3SMMqAmTQbFsHIDliu9qIpmqXiyTUSipnKDcOSziSYTXzqNvW/reVqdzmeaC
         XZNp+duYur68jV0sx+4KWUccy7csY1drC/YWZUHF1U+Nc4DlcKwOiW3n72IKQNKvM3aT
         8l+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7tITFcaJPGNryFbDJDlTYoSz6Ui0FYUOT+3v4wKIpLTPrp5nQ72d4ktfDSidCaoLxEo48GkOykuoXByqdduMt2+WEEfMAqp4sRXkmau95
X-Gm-Message-State: AOJu0YxsPhimn7ceMjhWHLJls9hckF+Q1ZWXPJ6v0NPpp6/vR9DgBnvI
	9kSiB6q5GiWVZddMHdKGvRdX/Rrd/ZNOm0EhH115dpt2YWZ8G32cGjtLzCM7s3C4+7j9IJbEi+a
	5VXDGKjrN7VWDNIrTwKcHiliv4vs=
X-Google-Smtp-Source: AGHT+IG4BaSbK+P09EoyYL8rR1buS3SjQd+OPB1e8j9B6v/dLubPk8we/fGolu3MGxMZLsJbPDat8V6n12a54ElCSvI=
X-Received: by 2002:a05:6402:440a:b0:57c:b7c3:99f1 with SMTP id
 4fb4d7f45d1cf-5879f59a549mr3114841a12.11.1719825238336; Mon, 01 Jul 2024
 02:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240630063845.116307-1-kanakshilledar@gmail.com> <20240630-generous-carnation-c534f5d84a8a@spud>
In-Reply-To: <20240630-generous-carnation-c534f5d84a8a@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Mon, 1 Jul 2024 14:43:46 +0530
Message-ID: <CAGLn_=vG09C49goRkbygZdYch8H1c_kw3p7ar9NGOrgpd0_MiA@mail.gmail.com>
Subject: Re: [PATCH] arch: riscv: thead: implement basic spi
To: Conor Dooley <conor@kernel.org>
Cc: kanakshilledar111@protonmail.com, Serge Semin <fancer.lancer@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_021400_756070_C1E11ACF 
X-CRM114-Status: GOOD (  25.22  )
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

T24gU3VuLCBKdW4gMzAsIDIwMjQgYXQgNzoyMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAzMCwgMjAyNCBhdCAxMjowODoyMFBNICsw
NTMwLCBLYW5hayBTaGlsbGVkYXIgd3JvdGU6Cj4gPiBpbXBsZW1lbnRlZCBiYXNpYyBzcGkgc3Vw
cG9ydCBmb3IgVEgxNTIwIFNvQy4KPiA+IGNyZWF0ZWQgYSBmaXhlZCBjbG9jayBhbmQgYSBzaW1w
bGUgc3BpMCBub2RlLgo+ID4gdXBkYXRlZCB0aGUgbWF0Y2hpbmcgYmluZGluZyB0byBpbmNsdWRl
IHRoZWFkLHRoMTUyMC1zcGkgYXMgY29tcGF0aWJsZS4KPiA+IGFkZGVkIGEgc3BpZGV2IGRldmlj
ZSBpbiBkZXZpY2V0cmVlIHdoaWNoIHdpbGwgdXRpbGlzZSB0aGUgc3BpMCBub2RlLgo+ID4gdGhp
cyBpcyB1c3VhbGx5IHJlc2VydmVkIGZvciBhIFNQSSBOT1IgZmxhc2ggd2hpY2ggaXMgbGVmdCB1
bnBvcHVsYXRlZAo+ID4gdW5kZXJuZWF0aCB0aGUgY2FycmllciBib2FyZC4gSSBwZXJmb3JtZWQg
YSBTUEkgc2VsZiBsb29wIHRlc3QgdXNpbmcKPiA+IHRvb2xzL3NwaS9zcGlkZXZfdGVzdC5jIGFu
ZCB0cmllZCBzZW5kaW5nIGBceERFXHhBRFx4QkVceEVGYCBhbmQgdmVyaWZpZWQKPiA+IGl0IGlz
IGJlaW5nIHJlY2VpdmVkIGNvcnJlY3RseS4gaSB1cGRhdGVkIHRoZSBvZl9kZXZpY2VfaWQgc3Ry
dWN0IGluCj4gPiBkcml2ZXJzL3NwaS9zcGktZHctbW1pby5jIHRvIGluY2x1ZGUgInRoZWFkLHRo
MTUyMC1zcGkiIGFzIHRoZSBjb21wYXRpYmxlLgo+ID4gdGhpcyBwYXRjaCBhbHNvIGFkZHMgYmFz
aWMgc3BpIHN1cHBvcnQgb24gYmVhZ2xldiBhaGVhZCB3aGljaCBzaGFyZXMgdGhlCj4gPiBzYW1l
IFRIMTUyMCBTb0MuIGkgaGF2ZSBvbmx5IHRlc3RlZCBvbiBMaWNoZWVQaSA0QS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrc2hpbGxlZGFyQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2ku
eWFtbCB8ICA0ICsrKysKPiA+ICAuLi4vYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWJlYWdsZXYtYWhl
YWQuZHRzICAgICAgfCAgOSArKysrKysrKysKPiA+ICAuLi4vYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LWxpY2hlZS1tb2R1bGUtNGEuZHRzaSAgfCAgNCArKysrCj4gPiAgLi4uL3Jpc2N2L2Jvb3QvZHRz
L3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzIHwgMTAgKysrKysrKysrKwo+ID4gIGFyY2gv
cmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgICAgICAgICAgICB8IDE2ICsrKysrKysr
KysrKysrKysKPiA+ICBkcml2ZXJzL3NwaS9zcGktZHctbW1pby5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCj4KPiBUaGlzIG5lZWRzIHRvIGJlIDMgZGlmZmVyZW50IHBhdGNoZXMgLSBv
bmUgZm9yIHRoZSBiaW5kaW5nLCBvbmUgZm9yIHRoZQo+IGRyaXZlciBhbmQgYSBmaW5hbCBvbmUg
Zm9yIHRoZSBkdHMgZmlsZXMuCgpJIHdpbGwgY29udmVydCB0aGlzIGludG8gYSBwYXRjaCBzZXQg
b2YgMyBwYXRjaCBhcyB5b3Ugc3VnZ2VzdGVkLgoKPiA+ICsKPiA+ICsmc3BpMCB7Cj4gPiArICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gPiArICAgICBzcGlkZXZAMCB7Cj4KPiAic3BpZGV2IiBpcyBu
b3QgYSB0eXBlIG9mIGRldmljZSwgdGhlIG5vZGVuYW1lIHNob3VsZCBtYXRjaCB0aGUgdHlwZS4K
Pgo+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJvaG0sZGgyMjI4ZnYiOwo+ID4gKyAg
ICAgICAgICAgICByZWcgPSA8MD47Cj4gPiArICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5
ID0gPDUwMDAwMD47Cj4gPiArICAgICB9Owo+ID4gK307Cj4KPiBJJ2xsIHB1dCBtb25leSBvbiB5
b3Ugbm90IGhhdmluZyBhIGRoMjIyOGZ2IG9uIHRoaXMgYm9hcmQuIERvY3VtZW50IHdoYXQKPiB5
b3UgYWN0dWFsbHkgaGF2ZSBvbiBpdCBwbGVhc2UsIG5vdCB3aGF0IGFsbG93cyB5b3UgdG8gcHJv
YmUgdGhlIHNwaWRldgo+IGRyaXZlciBpbiBsaW51eC4KClllcywgeW91IGFyZSByaWdodCEgQWN0
dWFsbHkgYXMgcGVyIHRoZSB2ZW5kb3IncyBrZXJuZWwgaXQgc2hvdWxkIGJlIGEKInNwaS1ub3Ii
IGRldmljZSBmcm9tIHdpbmJvbmQuCkkgY2hhbmdlZCBpdCB0byBzcGlkZXYgZm9yIHRlc3Rpbmcg
cHVycG9zZXMuIFNoYWxsIEkganVzdCBsZWF2ZSBpdAp3aXRoIHN0YXR1cyA9ICJva2F5IiBvciBh
ZGQgdGhlIG5vZGUgZm9yCnRoYXQgc3BpLW5vciBmbGFzaD8KCj4gVGhhbmtzLAo+IENvbm9yLgoK
VGhhbmtzIGFuZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
