Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D06CA0EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiMTo5MxOZMqw2L/6Ad2MoOK6dLT8JFMlkNUNW8nLDM=; b=YF82nSTJPoZQ18
	ihG4iFskUFqtC4ZVyWXnrp7igzTRWJx9u22+P0ydNyRMwLje2mD+EuiAqmrCiBlDYje4SLOirZQbp
	VSuqsc7cuhzJEY7ZTWuga75JprGsZU1GUinuzEXoYE+GilXEC+QFI+Xj2BnuM9ZIDgW8NVfm1OHuN
	URQUok9Pm3eInzh4eNyzVRLpGqwTKGm/32gFkpNrvBQcCG9qE/fNDmSxupnuQo50sXD7nY3BiBVIO
	6+d7sxIRa/EDqyXos8Rm4vRu1Wqg9UtwGHe7IhGXzDWWuvCMDojhT2oLvu4XgMng7kKTyARwZ6Lag
	Rzt/qAM6SZgk1SuY2CGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umium-000000010Er-0zEy;
	Fri, 15 Aug 2025 01:07:28 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umi83-00000000rpt-1EyL
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:17:08 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e931ccaa44cso1582498276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 17:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217026; x=1755821826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIb4DEw47nTG0SaTMqagi62gcLVr/AwhogL/DWZeO9k=;
        b=BX6/ynoG/83FKkV11GRBs8kbdLmv8hjmiSNQE2jRz9hInOdaCXL6IZMz03d8sfX+9N
         u6cHJfg8uYIIfeid9+0KZamtv31jcM8ngJB3x2LGKtQu9+4Whpr9OcqNwiyTehLIPbfk
         tbueY67EaT9LDojH+TE5eaWNvoKr5Qw3k18Yh8ovktbo5H+MIzXMxIrNA4Ssz1dM4HgO
         W8HfCkDktiMr1G748NoFuEhyYBXZqPRNE3H4NSG8+p5eVXcTjBUQBBvfAjK3Yeu+wROP
         FqvWWebcxXWvm3lF373Axhy8hPjC8Jes8Fdy8r6yzAVMWyxR5aKjo2Bw93IDkfhrmA3J
         7VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217026; x=1755821826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIb4DEw47nTG0SaTMqagi62gcLVr/AwhogL/DWZeO9k=;
        b=oOiZ+AjiNMML8H171n9iydz08U/PXwgwD4i2s0e9Ib8uN7eNcSKBcgOflok5QmL+MW
         D7K3ZEfh43bnQ93xJzscQHV/uUy8ut7m6cojqNe9SALc0ltW0CAeI05KU0tC+RR5HOC4
         86XxYn2yTq2qKwVrScPsPU6voDh5GtD7oJh8ZrXojV2pOjY6qGIstoJDsHuae41sZ7mq
         3e4bVqaDWI8eRPKpictp85DoTasHBzdndSf21D3YSVzChz1PA6ibYSu3tWz7C6C2PQOp
         kx2Tam2TUuC57gElBusF9bcSxfWM9Od8FdAjn1r6ViweePDqiieIZz82S6ls2jW74IPj
         q/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVww6XUSUkdXsCUoT8xmW7uAMRy/B0JGMfuuSQOzcwtv+BMQdKtDm4F/5c+UqvjyWhnc4rW/HdyvSEgYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQcIZYFitMA8YMZfdC3LVmJKGrv2mnXDwbRiLQnaU4/hoHsmSM
	32cH/CO9fe6KExC74nNRytzf4CObBrVvZJnKbBGB23qcfAiSsws7ncpSokpUcB7u2BemH15edww
	yijNePHevMtlFmSlRB6ys+gUx/9JhQtA6SvxuMDjs/w==
X-Gm-Gg: ASbGncsgvN4XspGDv2dn5EXdLm0atEYsUgc+8er/jecr7Cw+ZQ3nVQNYeeACa5wuItE
	pnF/4BStyLNH1fMg68klNV4+w+Hzj/Mty/10d9gEgdYKdmx/8CwurgS6DPJ6mpQqySjNCJqWXCj
	1y8Zw2DcopFrqjlygueczf/dyuHcUhHQ5uwgls1IsGf69qaRK1yeY3bMy+soyCv+EBvTyQ2uufU
	DudYd6k
X-Google-Smtp-Source: AGHT+IFNcAELmZCtW5xlsegSitNsfdTcRTdgg7kL6zgWJQdycJdLaDsFEfIH4/zktV/oPQX112UV7cBIiymlf91sbEo=
X-Received: by 2002:a05:6902:706:b0:e8e:120b:acc7 with SMTP id
 3f1490d57ef6-e9332110bd4mr348314276.0.1755217025789; Thu, 14 Aug 2025
 17:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com> <20250724123128-GYB748228@gentoo>
In-Reply-To: <20250724123128-GYB748228@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:16:54 +0800
X-Gm-Features: Ac12FXypsuzBkicYnVbqoq7E_JzqM7nw1pio2gCMjc_eN9bFRW8TFMqF6u8aHzA
Message-ID: <CAH1PCMZ7VbLxJbHQt4Ox_nO7yDSBMzTYiczC3FGBbG_oXgjLXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dmaengine: mmp_pdma: Add optional clock support
To: Yixun Lan <dlan@gentoo.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_171707_447258_4E29722B 
X-CRM114-Status: GOOD (  20.84  )
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

T24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgODozMeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsCj4KPiBJIHBlcnNvbmFsbHkgZmluZCB0aGUgd29y
ZCAnb3B0aW9uYWwnIGludHJvZHVjaW5nIHNvbWUgY29uZnVzaW9ucy4uCj4gSSBjYW4gdW5kZXJz
dGFuZCBmcm9tIGRyaXZlciBwZXJzcGVjdGl2ZSwgaXQncyBraW5kIG9mIG9wdGlvbmFsLAo+IGJ1
dCBmcm9tIFNwYWNlbWlUIEsxIHBlcnNwZWN0aXZlLCBpdCdzIG1hbmRhdG9yeSBmb3IgdGhpcyBk
cml2ZXIKPiAodGhlICdjbG9ja3MnIHByb3BlcnR5IG9mIERUIGlzIGluICdyZXF1aXJlZCcgc2Vj
dGlvbikKPgo+IGZlZWwgZnJlZSB0byBpbXByb3ZlIHRoZSBjb21taXQgbWVzc2FnZSwgbWF5YmUg
YWRkIHNvbWUgbW90aXZhdGlvbgo+IGhlaGluZCB0aGlzCgpUaGFua3MgWWl4dW4gZm9yIHlvdXIg
YWR2aWNlLiBJIHdpbGwgaW1wcm92ZSBpdC4KCi0KR3VvZG9uZwoKPgo+IE9uIDE3OjM5IE1vbiAx
NCBKdWwgICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCBzdXBwb3J0IGZvciByZXRyaWV2
aW5nIGFuZCBlbmFibGluZyBhbiBvcHRpb25hbCBjbG9jayBkdXJpbmcKPiA+IG1tcF9wZG1hX3By
b2JlKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rh
ci5jb20+Cj4gPiAtLS0KPiA+IHYzOiBObyBjaGFuZ2UuCj4gPiB2MjogTm8gY2hhbmdlLgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9kbWEvbW1wX3BkbWEuYyB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9t
bXBfcGRtYS5jIGIvZHJpdmVycy9kbWEvbW1wX3BkbWEuYwo+ID4gaW5kZXggYTk1ZDMxMTAzZDMw
NjNhMWQxMTE3N2ExYTM3Yjg5YWMyZmQyMTNlOS4uNGE2ZGJmNTU4MjM3MjJkMjZjYzY5Mzc5ZDIy
YWFhODhmYmUxOTMxMyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hL21tcF9wZG1hLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZG1hL21tcF9wZG1hLmMKPiA+IEBAIC0xNSw2ICsxNSw3IEBACj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
YXRhL21tcF9kbWEuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvZG1hcG9vbC5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9jbGsuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZG1hLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+Cj4gPgo+ID4gQEAgLTEwMTksNiArMTAyMCw3IEBAIHN0YXRpYyBp
bnQgbW1wX3BkbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCj4gPiAgewo+ID4g
ICAgICAgc3RydWN0IG1tcF9wZG1hX2RldmljZSAqcGRldjsKPiA+ICAgICAgIHN0cnVjdCBtbXBf
ZG1hX3BsYXRkYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoJm9wLT5kZXYpOwo+ID4gKyAg
ICAgc3RydWN0IGNsayAqY2xrOwo+ID4gICAgICAgaW50IGksIHJldCwgaXJxID0gMDsKPiA+ICAg
ICAgIGludCBkbWFfY2hhbm5lbHMgPSAwLCBpcnFfbnVtID0gMDsKPiA+ICAgICAgIGNvbnN0IGVu
dW0gZG1hX3NsYXZlX2J1c3dpZHRoIHdpZHRocyA9Cj4gPiBAQCAtMTAzNyw2ICsxMDM5LDEwIEBA
IHN0YXRpYyBpbnQgbW1wX3BkbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCj4g
PiAgICAgICBpZiAoSVNfRVJSKHBkZXYtPmJhc2UpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihwZGV2LT5iYXNlKTsKPiA+Cj4gPiArICAgICBjbGsgPSBkZXZtX2Nsa19nZXRfb3B0
aW9uYWxfZW5hYmxlZChwZGV2LT5kZXYsIE5VTEwpOwo+ID4gKyAgICAgaWYgKElTX0VSUihjbGsp
KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGspOwo+ID4gKwo+ID4gICAgICAg
aWYgKHBkZXYtPmRldi0+b2Zfbm9kZSkgewo+ID4gICAgICAgICAgICAgICAvKiBQYXJzZSBuZXcg
YW5kIGRlcHJlY2F0ZWQgZG1hLWNoYW5uZWxzIHByb3BlcnRpZXMgKi8KPiA+ICAgICAgICAgICAg
ICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi0+b2Zfbm9kZSwgImRtYS1jaGFu
bmVscyIsCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFu
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
