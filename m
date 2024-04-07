Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34172CD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31IvXKWMvu1o1D/wZD+vjt9ItUI8KZ8BXkZZobR7wuA=; b=x63TxL1kj06WE+
	wh/qPQv+ioObXEuSlnNw/GlWVNgIzm1S0QT+ue2/IO35X698IiqzTO5VLO/7SHwDz9Bjwry3q+A4e
	ldrwu1PKmuARRrCuOjIidarK0gOsMGG3MF4d/R1xFOhEm6jO46smCq8bQ0FpNm/cUrBjDwyYTJ7FZ
	mRg92g0aowPy1sbZjmB+F4qe+FU8XlwXuskLHvl4X1D1tlIZA+cxwqglw7th3VSBrNRiY9NkKWZvn
	w97OJoeiMmA3sbRjY6zIgmel7EY4JkDm+5coUB2v9EbJ4TUrPWl3YFXnrwamVAG4m3DA5UPUdjuyu
	VWAqdV5WuK8LoxEZt6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtOBu-0000000C8io-3VpO;
	Sun, 07 Apr 2024 08:47:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtOBp-0000000C8iH-3crP
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 08:47:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2a49bce83baso759989a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712479666; x=1713084466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8BgbMnq6VW+9RiAeIDAU8GdhTfZ4s9fXNgPZsg0Nnk=;
        b=qYR268in44RSNX3S6BzXXLBdSVewYjcFqOdEkhEQ1zLTxcU+zNV4yfeCkvnOlTRO1a
         2sm+DjDyZZT/so+dHzzEqrfkcjVx3F0GH+5hUjz9RLjgr1wlqywGMeGeGCbiGl16NIMp
         ZZBiVRFVkw0imXfFBqquAardgJi4a2DllIDbbs7Y8biXMGX+ax3moFX8IO+wbbjPV6Hw
         7ddh6fhDDt9COGo08VuEQ5L/uFn+wTMUapUhKUtxPcayfu6sq7ilYK7rVLywZNERS248
         VZZc2iJo5lKBQ//H2CIBASAdZE8MEywxupoix/3L1ZOmWKDZfoMRiff9Q7kH4j1b3l1e
         rdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712479666; x=1713084466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8BgbMnq6VW+9RiAeIDAU8GdhTfZ4s9fXNgPZsg0Nnk=;
        b=dmVqS0TFatUMTCS8vqEQzBEDc2ePksAMjKRy5HrNlDy9g8iEVv9De8jRkcPwpdgdwL
         116Vqbg48MWY3rSsbI/zVTssW+QtoTE83kB/A+ZH5aL8Aq3XgIyaOTm1Non3W6aRZMBV
         6i8msvmu6p6YVmFctObtiUyHVf0W7Kvg5e+0GjEwhuqYO63w0YsECb6u5ts4PNS5coB8
         RUstk4lRiLjOxOqmCI27l3ZidxgseKXxWmXUCyVtBg6ETQZPHp8/R1wLDDFqY+AATd21
         Of2CaHHfLDSyh0pIizpbgacGrndwKddBpi5rvVTOqUQTsqTEXg88CrOrDbiCQcxkb+54
         5ogg==
X-Gm-Message-State: AOJu0YyLX3lq/ZWBzphqfdVoB75W3ud9bBA8VF//TjMhBNm61jKlZYGb
	5fyLATEaQki4ixAQAx9DhUg0AcIYM6loun2hwEslRAzTWqcO8Az0oRtLRHJmXIh8VWyAGQ6zrL4
	DN6TB6sRuh83DbFuUZeHMKlVDHp2GO6OK27i9LA==
X-Google-Smtp-Source: AGHT+IETK8jKWfPmNm9lCZ0iZfNPS0YKHcp6Lt5hibVOcK3a5DupIIugl5491hzEq34YAewAphhrALCHcQtvoJdq00c=
X-Received: by 2002:a17:90b:3d8:b0:2a0:3d59:4632 with SMTP id
 go24-20020a17090b03d800b002a03d594632mr5237970pjb.15.1712479666428; Sun, 07
 Apr 2024 01:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240329121414.688391-1-christoph.muellner@vrull.eu>
 <20240329121414.688391-2-christoph.muellner@vrull.eu> <0b817fa8-2a1c-4da4-b5d4-f36ac93dbfd9@sifive.com>
In-Reply-To: <0b817fa8-2a1c-4da4-b5d4-f36ac93dbfd9@sifive.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Sun, 7 Apr 2024 10:47:35 +0200
Message-ID: <CAEg0e7g+tRSG35pjQXemyao5OQtgiio5=nq1FGHE_5On_HZejQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: thead: Rename T-Head PBMT to MAEE
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Cooper Qu <cooper.qu@linux.alibaba.com>, Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
	Huang Tao <eric.huang@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>, 
	Qingfang Deng <dqfext@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_014749_972785_998AD3BF 
X-CRM114-Status: GOOD (  28.35  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCA4OjE14oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQ2hyaXN0b3BoLAo+Cj4gT24gMjAyNC0w
My0yOSA3OjE0IEFNLCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiBULUhlYWQncyB2ZW5k
b3IgZXh0ZW5zaW9uIHRvIHNldCBwYWdlIGF0dHJpYnV0ZXMgaGFzIHRoZSBuYW1lCj4gPiBNQUVF
IChNTVUgYWRkcmVzcyBhdHRyaWJ1dGUgZXh0ZW5zaW9uKS4KPiA+IExldCdzIHJlbmFtZSBpdCwg
c28gaXQgaXMgY2xlYXIgd2hhdCB0aGlzIHJlZmVyZXMgdG8uCj4gPgo+ID4gU2VlIGFsc286Cj4g
PiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9i
bG9iL21hc3Rlci94dGhlYWRtYWVlLmFkb2MKPgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBN
QUVFIGlzIHRoZSBuYW1lIG9mIHRoZSBDU1IgYml0IGFuZCBzdGFuZHMgZm9yICJNTVUgKG9yCj4g
TWVtb3J5KSBBdHRyaWJ1dGUgRXh0ZW5zaW9uIEVuYWJsZSIsIHNvIHRoZSBuYW1lIGZvciB0aGUg
ZXh0ZW5zaW9uIGl0c2VsZiB3b3VsZAo+IGJlICJNQUUiIChqdXN0IG9uZSBFKS4gVGhpcyBpcyBz
aW1pbGFyIHRvIFRIRUFESVNBRUUgPT4gVC1IRUFEIElTQSBFeHRlbnNpb24KPiBFbmFibGUuIERv
ZXMgdGhhdCBzb3VuZCByaWdodD8KClllcywgeW91IGFyZSByaWdodC4KSSBub3RpY2VkIHRoYXQg
YmVmb3JlIGFzIHdlbGwgYnV0IGRpZCBub3QgY2FyZSB0b28gbXVjaCBhYm91dCBpdC4KTm93IHRo
YXQgSSdtIG5vdCB0aGUgb25seSBvbmUgd2hvIHNlZXMgaXQsIEkndmUgY3JlYXRlZCBhIFBSIGZv
ciB0aGUgc3BlYwp0byByZW5hbWUgdGhlIGV4dGVuc2lvbiB0byBYVGhlYWRNYWU6CiAgaHR0cHM6
Ly9naXRodWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL3B1bGwvNDgKVGhl
IFBSIGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkLCBzbyBJJ2xsIHByb3ZpZGUgYSByZXZpc2VkIHBh
dGNoLgoKVGhhbmtzIQoKPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KPiA+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YSAgICAgICAgICAgIHwgIDggKysrKy0tLS0K
PiA+ICBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYyAgICAgfCAgOCArKysrLS0tLQo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDIwICsrKysrKysrKyst
LS0tLS0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YSBi
L2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+IGluZGV4IDkxMGJhODgzN2FkZC4uMmMyNGJl
ZjdlMTEyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+ID4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+ID4gQEAgLTgyLDE0ICs4MiwxNCBAQCBjb25m
aWcgRVJSQVRBX1RIRUFECj4gPgo+ID4gICAgICAgICBPdGhlcndpc2UsIHBsZWFzZSBzYXkgIk4i
IGhlcmUgdG8gYXZvaWQgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQuCj4gPgo+ID4gLWNvbmZpZyBFUlJB
VEFfVEhFQURfUEJNVAo+ID4gLSAgICAgYm9vbCAiQXBwbHkgVC1IZWFkIG1lbW9yeSB0eXBlIGVy
cmF0YSIKPiA+ICtjb25maWcgRVJSQVRBX1RIRUFEX01BRUUKPiA+ICsgICAgIGJvb2wgIkFwcGx5
IFQtSGVhZCdzIE1NVSBhZGRyZXNzIGF0dHJpYnV0ZSAoTUFFRSkiCj4gPiAgICAgICBkZXBlbmRz
IG9uIEVSUkFUQV9USEVBRCAmJiA2NEJJVCAmJiBNTVUKPiA+ICAgICAgIHNlbGVjdCBSSVNDVl9B
TFRFUk5BVElWRV9FQVJMWQo+ID4gICAgICAgZGVmYXVsdCB5Cj4gPiAgICAgICBoZWxwCj4gPiAt
ICAgICAgIFRoaXMgd2lsbCBhcHBseSB0aGUgbWVtb3J5IHR5cGUgZXJyYXRhIHRvIGhhbmRsZSB0
aGUgbm9uLXN0YW5kYXJkCj4gPiAtICAgICAgIG1lbW9yeSB0eXBlIGJpdHMgaW4gcGFnZS10YWJs
ZS1lbnRyaWVzIG9uIFQtSGVhZCBTb0NzLgo+ID4gKyAgICAgICBUaGlzIHdpbGwgYXBwbHkgdGhl
IG1lbW9yeSB0eXBlIGVycmF0YSB0byBoYW5kbGUgVC1IZWFkJ3MgTU1VIGFkZHJlc3MKPiA+ICsg
ICAgICAgYXR0cmlidXRlIGV4dGVuc2lvbiAoTUFFRSkuCj4gPgo+ID4gICAgICAgICBJZiB5b3Ug
ZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSAiWSIuCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhl
YWQvZXJyYXRhLmMKPiA+IGluZGV4IGIxYzQxMGJiYzFhZS4uOGM4YThhNGIwNDIxIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gPiBAQCAtMTksMTAgKzE5LDEwIEBACj4gPiAg
I2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+ID4gICNpbmNsdWRlIDxhc20vdmVuZG9yaWRfbGlzdC5o
Pgo+ID4KPiA+IC1zdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfcGJtdCh1bnNpZ25lZCBpbnQgc3Rh
Z2UsCj4gPiArc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX21hZWUodW5zaWduZWQgaW50IHN0YWdl
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJjaF9pZCwg
dW5zaWduZWQgbG9uZyBpbXBpZCkKPiA+ICB7Cj4gPiAtICAgICBpZiAoIUlTX0VOQUJMRUQoQ09O
RklHX0VSUkFUQV9USEVBRF9QQk1UKSkKPiA+ICsgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdf
RVJSQVRBX1RIRUFEX01BRUUpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPgo+
ID4gICAgICAgaWYgKGFyY2hfaWQgIT0gMCB8fCBpbXBpZCAhPSAwKQo+ID4gQEAgLTE0MCw4ICsx
NDAsOCBAQCBzdGF0aWMgdTMyIHRoZWFkX2VycmF0YV9wcm9iZSh1bnNpZ25lZCBpbnQgc3RhZ2Us
Cj4gPiAgewo+ID4gICAgICAgdTMyIGNwdV9yZXFfZXJyYXRhID0gMDsKPiA+Cj4gPiAtICAgICBp
ZiAoZXJyYXRhX3Byb2JlX3BibXQoc3RhZ2UsIGFyY2hpZCwgaW1waWQpKQo+ID4gLSAgICAgICAg
ICAgICBjcHVfcmVxX2VycmF0YSB8PSBCSVQoRVJSQVRBX1RIRUFEX1BCTVQpOwo+ID4gKyAgICAg
aWYgKGVycmF0YV9wcm9iZV9tYWVlKHN0YWdlLCBhcmNoaWQsIGltcGlkKSkKPiA+ICsgICAgICAg
ICAgICAgY3B1X3JlcV9lcnJhdGEgfD0gQklUKEVSUkFUQV9USEVBRF9NQUVFKTsKPiA+Cj4gPiAg
ICAgICBlcnJhdGFfcHJvYmVfY21vKHN0YWdlLCBhcmNoaWQsIGltcGlkKTsKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gPiBpbmRleCBlYTMzMjg4ZjhhMjUuLjdjMzc3
ZTEzN2I0MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xp
c3QuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gPiBA
QCAtMjMsNyArMjMsNyBAQAo+ID4gICNlbmRpZgo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX0VSUkFU
QV9USEVBRAo+ID4gLSNkZWZpbmUgICAgICBFUlJBVEFfVEhFQURfUEJNVCAwCj4gPiArI2RlZmlu
ZSAgICAgIEVSUkFUQV9USEVBRF9NQUVFIDAKPiA+ICAjZGVmaW5lICAgICAgRVJSQVRBX1RIRUFE
X1BNVSAxCj4gPiAgI2RlZmluZSAgICAgIEVSUkFUQV9USEVBRF9OVU1CRVIgMgo+ID4gICNlbmRp
Zgo+ID4gQEAgLTUzLDIwICs1MywyMCBAQCBhc20oQUxURVJOQVRJVkUoInNmZW5jZS52bWEgJTAi
LCAic2ZlbmNlLnZtYSIsIFNJRklWRV9WRU5ET1JfSUQsICBcCj4gPiAgICogaW4gdGhlIGRlZmF1
bHQgY2FzZS4KPiA+ICAgKi8KPiA+ICAjZGVmaW5lIEFMVF9TVlBCTVRfU0hJRlQgNjEKPiA+IC0j
ZGVmaW5lIEFMVF9USEVBRF9QQk1UX1NISUZUIDU5Cj4gPiArI2RlZmluZSBBTFRfVEhFQURfTUFF
RV9TSElGVCA1OQo+ID4gICNkZWZpbmUgQUxUX1NWUEJNVChfdmFsLCBwcm90KSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gIGFzbShBTFRFUk5BVElW
RV8yKCJsaSAlMCwgMFx0XG5ub3AiLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ICAgICAgICAgICAgICAgICAibGkgJTAsICUxXHRcbnNsbGkgJTAsJTAsJTMiLCAwLCAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgUklTQ1ZfSVNBX0VY
VF9TVlBCTVQsIENPTkZJR19SSVNDVl9JU0FfU1ZQQk1ULCAgXAo+ID4gICAgICAgICAgICAgICAg
ICJsaSAlMCwgJTJcdFxuc2xsaSAlMCwlMCwlNCIsIFRIRUFEX1ZFTkRPUl9JRCwgICAgICAgIFwK
PiA+IC0gICAgICAgICAgICAgICAgICAgICBFUlJBVEFfVEhFQURfUEJNVCwgQ09ORklHX0VSUkFU
QV9USEVBRF9QQk1UKSAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgRVJSQVRBX1RIRUFE
X01BRUUsIENPTkZJR19FUlJBVEFfVEhFQURfTUFFRSkgICAgXAo+ID4gICAgICAgICAgICAgICA6
ICI9ciIoX3ZhbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ICAgICAgICAgICAgICAgOiAiSSIocHJvdCMjX1NWUEJNVCA+PiBBTFRfU1ZQQk1UX1NISUZU
KSwgICAgICAgICAgICAgICBcCj4gPiAtICAgICAgICAgICAgICAgIkkiKHByb3QjI19USEVBRCA+
PiBBTFRfVEhFQURfUEJNVF9TSElGVCksICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAg
ICJJIihwcm90IyNfVEhFQUQgPj4gQUxUX1RIRUFEX01BRUVfU0hJRlQpLCAgICAgICAgICAgIFwK
PiA+ICAgICAgICAgICAgICAgICAiSSIoQUxUX1NWUEJNVF9TSElGVCksICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICAgICAgICAgICAgIkkiKEFMVF9USEVBRF9QQk1U
X1NISUZUKSkKPiA+ICsgICAgICAgICAgICAgICAiSSIoQUxUX1RIRUFEX01BRUVfU0hJRlQpKQo+
ID4KPiA+IC0jaWZkZWYgQ09ORklHX0VSUkFUQV9USEVBRF9QQk1UCj4gPiArI2lmZGVmIENPTkZJ
R19FUlJBVEFfVEhFQURfTUFFRQo+ID4gIC8qCj4gPiAgICogSU8vTk9DQUNIRSBtZW1vcnkgdHlw
ZXMgYXJlIGhhbmRsZWQgdG9nZXRoZXIgd2l0aCBzdnBibXQsCj4gPiAgICogc28gb24gVC1IZWFk
IGNoaXBzLCBjaGVjayBpZiBubyBvdGhlciBtZW1vcnkgdHlwZSBpcyBzZXQsCj4gPiBAQCAtODMs
MTEgKzgzLDExIEBAIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRSggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICJzbGxpICAgIHQzLCB0MywgJTNcblx0
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAib3Ig
ICAgICAlMCwgJTAsIHQzXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gICAgICAgIjI6IiwgIFRIRUFEX1ZFTkRPUl9JRCwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgICAgICAgICAgRVJSQVRBX1RIRUFEX1BC
TVQsIENPTkZJR19FUlJBVEFfVEhFQURfUEJNVCkgICAgICAgICAgICBcCj4gPiArICAgICAgICAg
ICAgIEVSUkFUQV9USEVBRF9NQUVFLCBDT05GSUdfRVJSQVRBX1RIRUFEX01BRUUpICAgICAgICAg
ICAgXAo+ID4gICAgICAgOiAiK3IiKF92YWwpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgIDogIkkiKF9QQUdFX01UTUFTS19USEVB
RCA+PiBBTFRfVEhFQURfUEJNVF9TSElGVCksICAgICAgICAgICAgICBcCj4gPiAtICAgICAgICJJ
IihfUEFHRV9QTUFfVEhFQUQgPj4gQUxUX1RIRUFEX1BCTVRfU0hJRlQpLCAgICAgICAgICAgICAg
ICAgXAo+ID4gLSAgICAgICAiSSIoQUxUX1RIRUFEX1BCTVRfU0hJRlQpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIDogIkkiKF9QQUdFX01UTUFTS19USEVB
RCA+PiBBTFRfVEhFQURfTUFFRV9TSElGVCksICAgICAgICAgICAgICBcCj4gPiArICAgICAgICJJ
IihfUEFHRV9QTUFfVEhFQUQgPj4gQUxUX1RIRUFEX01BRUVfU0hJRlQpLCAgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgICAiSSIoQUxUX1RIRUFEX01BRUVfU0hJRlQpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgIDogInQzIikKPiA+ICAjZWxzZQo+ID4g
ICNkZWZpbmUgQUxUX1RIRUFEX1BNQShfdmFsKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
