Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D14C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvQdFchhgdIAqqD277Gpw2jtQ1UAnJLDgcialIC4uko=; b=IRRFxGx+cqxQya
	eo4eyndk0Dd6Ux2Cgz0hTQfAdFmO6SnVMOUliyj/gcjWpGLWykwLmwS3+lbgh3JowimfNxvqhjEee
	DJIwDvcZzs5HaQ2JM25nXaXJjd3Y4dlPbrykJe+0wi0EeJr0H/Yw5z3gErW4dtcMIUz4yMbjdniHn
	n0gYZ0hP4cIE1WvMZAvlmIoKANfEZYftiH9RmLKMVs+R1G5ayANpSUHaKxLiFaYs06Mvdu5fYe88a
	/lOqZstLz2vUQvqoEuksrNY7Hmm3fvkD7Chl6PdXAk9rPu7bwYP1PqP+1YuEF4DcV4NGTdoWrVnsP
	LLBHnI8/onr7+g+9Uq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MR2-0000000Bfiy-0GSW;
	Tue, 07 May 2024 15:08:52 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MQz-0000000BfhQ-36Mx;
	Tue, 07 May 2024 15:08:50 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f054c567e2so1538591a34.2;
        Tue, 07 May 2024 08:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715094526; x=1715699326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjPNY+YN3AvsteCp9o4WA9jTEFYIMLWbrrEz2tsoKMc=;
        b=HM54NGv0W70oAl5winNtaq7G87gg6lqtZLeGrXIn3771USGfjwCfM9RFxetffbpn36
         6Qh90vaYusDN1bhShwvcmniBxPVnATZQBnWSqmlmzO0BgqFLQAP6qtN1/kH58dufQgvf
         6LC3q3uipdTLu6ARjqBt228IeOORsB7SsIIUBvRw+SJ8uHMDv4zQFSrQZ3XIotPi5VoT
         xlwyZeQ/q6PcPwbiRO5mzXFv1ysikspPV6fjghKgMN2ZCZcpnJhKLIGNXjIiznss34Jb
         ggBibfRoER+6vLeJNSzU7TcoPmf5r8ULUUsCOnU6OcuhSVFFEs86Zaukt24aKyzAYQCB
         AfOw==
X-Forwarded-Encrypted: i=1; AJvYcCVu/CixJj1W9w9FLGvo4s4YaxbtX3Vy9hElB67oMc58r85Y1ZQuGzQOSHbz8PAUuVK1MtknMM0dDSQjm/KUS1rmOE6G7whnMhityEjK884U0xB/cAOQgntzEiSvvwNtPcJa3rBFYPWSKXjMnYt71e5xPU4RCpY=
X-Gm-Message-State: AOJu0YwkEgmUuPJqqbTL3osQqskc1zhcS52tKjDd7ao7s7CQOkEwe+mH
	QJ6+GeBggV7J2Rk6JvV8CULgNpVECO7vlczWbdDjkBqI0jPElactALJoy4Df
X-Google-Smtp-Source: AGHT+IHsymz36JsErrmp1Vm4YJ6MvuyvYzXXPyM0wkXaLmb+viPPz8vyw0fIWLkKYImpW5ZeX2Q2YA==
X-Received: by 2002:a9d:4d86:0:b0:6f0:350c:9ee6 with SMTP id u6-20020a9d4d86000000b006f0350c9ee6mr8983383otk.20.1715094526439;
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id o10-20020a0568300aca00b006ee4db9f637sm1313733otu.52.2024.05.07.08.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c6f785208dso281674b6e.1;
        Tue, 07 May 2024 08:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwkYHOwJIT5vZXWyhVg77OI0hRfcWNr0hYTINKR8tyOLOnGG0+LwEKZw31Cj0OccFSdMcPdFTcQsUr8ivYPAkkkoFhipSMBa/bN8MtKueO08dxxnChhZ63Lo8dVfZvuL/9Lv598UQHahq0xZLZK35kbAijYfg=
X-Received: by 2002:a05:6808:118c:b0:3c9:63c5:502b with SMTP id
 j12-20020a056808118c00b003c963c5502bmr9830227oil.30.1715094525810; Tue, 07
 May 2024 08:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240325110036.1564-1-jszhang@kernel.org>
In-Reply-To: <20240325110036.1564-1-jszhang@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2024 17:08:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUckNuraENvsiQ_QHmzNQeT_-9_jZvKZr5LuiFEJVFnmQ@mail.gmail.com>
Message-ID: <CAMuHMdUckNuraENvsiQ_QHmzNQeT_-9_jZvKZr5LuiFEJVFnmQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] riscv: mm: still create swiotlb buffer for
 kmalloc() bouncing if required
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_080849_801426_9B6925FB 
X-CRM114-Status: GOOD (  26.34  )
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

SGkgSmlzaGVuZywKCk9uIE1vbiwgTWFyIDI1LCAyMDI0IGF0IDEyOjE14oCvUE0gSmlzaGVuZyBa
aGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiBBZnRlciBjb21taXQgZjUxZjdhMGZj
MmY0ICgicmlzY3Y6IGVuYWJsZSBETUFfQk9VTkNFX1VOQUxJR05FRF9LTUFMTE9DCj4gZm9yICFk
bWFfY29oZXJlbnQiKSwgZm9yIG5vbi1jb2hlcmVudCBwbGF0Zm9ybXMgd2l0aCBsZXNzIHRoYW4g
NEdCCj4gbWVtb3J5LCB3ZSByZWx5IG9uIHVzZXJzIHRvIHBhc3MgInN3aW90bGI9bW1ubixmb3Jj
ZSIga2VybmVsIHBhcmFtZXRlcnMKPiB0byBlbmFibGUgRE1BIGJvdW5jaW5nIGZvciB1bmFsaWdu
ZWQga21hbGxvYygpIGJ1ZmZlcnMuIE5vdyBsZXQncyBnbwo+IGZ1cnRoZXI6IElmIG5vIGJvdW5j
aW5nIG5lZWRlZCBmb3IgWk9ORV9ETUEsIGxldCBrZXJuZWwgYXV0b21hdGljYWxseQo+IGFsbG9j
YXRlIDFNQiBzd2lvdGxiIGJ1ZmZlciBwZXIgMUdCIG9mIFJBTSBmb3Iga21hbGxvYygpIGJvdW5j
aW5nIG9uCj4gbm9uLWNvaGVyZW50IHBsYXRmb3Jtcywgc28gdGhhdCBubyBuZWVkIHRvIHBhc3Mg
InN3aW90bGI9bW1ubixmb3JjZSIKPiBhbnkgbW9yZS4KPgo+IFRoZSBtYXRoIG9mICIxTUIgc3dp
b3RsYiBidWZmZXIgcGVyIDFHQiBvZiBSQU0gZm9yIGttYWxsb2MoKSBib3VuY2luZyIKPiBpcyB0
YWtlbiBmcm9tIGFybTY0LiBVc2VycyBjYW4gc3RpbGwgZm9yY2Ugc21hbGxlciBzd2lvdGxiIGJ1
ZmZlciBieQo+IHBhc3NpbmcgInN3aW90bGI9bW1ubiIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hp
Y2ggaXMgbm93IGNvbW1pdCBmYzdhNTBlZWQ5ODYwZDRiICgicmlzY3Y6Cm1tOiBzdGlsbCBjcmVh
dGUgc3dpb3RsYiBidWZmZXIgZm9yIGttYWxsb2MoKSBib3VuY2luZyBpZiByZXF1aXJlZCIpCmlu
IHJpc2N2L2Zvci1uZXh0IChuZXh0LTIwMjQwNDI5IGFuZCBsYXRlcikuCgpPbiBSWi9GaXZlLCB3
aGljaCBoYXMgMSBHaUIgb2YgUkFNLCBpLmUuIGEgYml0IGxlc3MgZm9yIGZyZWUgdXNlOgoKICAg
ICBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2IChvcmRlcjogNywgNTI0Mjg4
IGJ5dGVzLCBsaW5lYXIpCiAgICAgQnVpbHQgMSB6b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5n
IG9uLiAgVG90YWwgcGFnZXM6IDIyNTc5MgogICAgIG1lbSBhdXRvLWluaXQ6IHN0YWNrOm9mZiwg
aGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpvZmYKICAgICtzb2Z0d2FyZSBJTyBUTEI6IFNXSU9U
TEIgYm91bmNlIGJ1ZmZlciBzaXplIGFkanVzdGVkIHRvIDBNQgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eCiAgICArc29mdHdh
cmUgSU8gVExCOiBhcmVhIG51bSAxLgogICAgK3NvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0g
MHgwMDAwMDAwMDdlZjU2MDAwLTB4MDAwMDAwMDA3ZjA1NjAwMF0gKDFNQikKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5eXgogICAgIFZpcnR1YWwga2VybmVsIG1lbW9yeSBsYXlvdXQ6CgpJIHdhcyBhIGJpdCBp
bnRyaWd1ZWQgYnkgdGhlICIwTUIiLiAgSG93ZXZlciwgdGhhdCBzZWVtcyB0byBiZSBjb3JyZWN0
OgoKICAgICBtZW1faW5pdDogbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpID0gOTM5NTI0MDk2CiAg
ICAgbWVtX2luaXQ6IHNpemUgPSA5MTc1MDQKICAgICBtZW1faW5pdDogc3dpb3RsYl9zaXplX29y
X2RlZmF1bHQoKSA9IDY3MTA4ODY0CgphbmQgaXQgbXVzdCBiZSByb3VuZGVkIHVwIHRvIDEgTUIg
bGF0ZXIuCgpBcHBhcmVudGx5IGFybTY0IGhhcyB0aGUgc2FtZSBkaXNjcmVwYW5jeSwgd2hpY2gg
SSBuZXZlciByZWFsbHkgbm90aWNlZApiZWZvcmUgKGFuZCBJIGhhdmUgbm8gYXJtNjQgcGxhdGZv
cm1zIHdpdGggMSBHaUIgUkFNIG9yIGxlc3MpOgoKICAgICBtZW1faW5pdDogbWVtYmxvY2tfcGh5
c19tZW1fc2l6ZSgpID0gMjAxMzI2NTkyMAogICAgIG1lbV9pbml0OiBzaXplID0gMTk2NjA4MAog
ICAgIG1lbV9pbml0OiBzd2lvdGxiX3NpemVfb3JfZGVmYXVsdCgpID0gNjcxMDg4NjQKICAgICBz
b2Z0d2FyZSBJTyBUTEI6IFNXSU9UTEIgYm91bmNlIGJ1ZmZlciBzaXplIGFkanVzdGVkIHRvIDFN
QgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXl5eCiAgICAgc29mdHdhcmUgSU8gVExCOiBhcmVhIG51bSAyLgogICAgIHNvZnR3YXJl
IElPIFRMQjogbWFwcGVkIFttZW0gMHgwMDAwMDAwMGI5NDAwMDAwLTB4MDAwMDAwMDBiOTYwMDAw
MF0gKDJNQikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXgoKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQu
Ywo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTE2MSwxMSArMTYxLDI1IEBAIHN0
YXRpYyB2b2lkIHByaW50X3ZtX2xheW91dCh2b2lkKSB7IH0KPgo+ICB2b2lkIF9faW5pdCBtZW1f
aW5pdCh2b2lkKQo+ICB7Cj4gKyAgICAgICBib29sIHN3aW90bGIgPSBtYXhfcGZuID4gUEZOX0RP
V04oZG1hMzJfcGh5c19saW1pdCk7Cj4gICNpZmRlZiBDT05GSUdfRkxBVE1FTQo+ICAgICAgICAg
QlVHX09OKCFtZW1fbWFwKTsKPiAgI2VuZGlmIC8qIENPTkZJR19GTEFUTUVNICovCj4KPiAtICAg
ICAgIHN3aW90bGJfaW5pdChtYXhfcGZuID4gUEZOX0RPV04oZG1hMzJfcGh5c19saW1pdCksIFNX
SU9UTEJfVkVSQk9TRSk7Cj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfRE1BX0JPVU5D
RV9VTkFMSUdORURfS01BTExPQykgJiYgIXN3aW90bGIgJiYKPiArICAgICAgICAgICBkbWFfY2Fj
aGVfYWxpZ25tZW50ICE9IDEpIHsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAg
ICAgICogSWYgbm8gYm91bmNpbmcgbmVlZGVkIGZvciBaT05FX0RNQSwgYWxsb2NhdGUgMU1CIHN3
aW90bGIKPiArICAgICAgICAgICAgICAgICogYnVmZmVyIHBlciAxR0Igb2YgUkFNIGZvciBrbWFs
bG9jKCkgYm91bmNpbmcgb24KPiArICAgICAgICAgICAgICAgICogbm9uLWNvaGVyZW50IHBsYXRm
b3Jtcy4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgc2l6ZSA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgRElWX1JPVU5EX1VQKG1lbWJsb2Nr
X3BoeXNfbWVtX3NpemUoKSwgMTAyNCk7Cj4gKyAgICAgICAgICAgICAgIHN3aW90bGJfYWRqdXN0
X3NpemUobWluKHN3aW90bGJfc2l6ZV9vcl9kZWZhdWx0KCksIHNpemUpKTsKPiArICAgICAgICAg
ICAgICAgc3dpb3RsYiA9IHRydWU7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgc3dpb3RsYl9p
bml0KHN3aW90bGIsIFNXSU9UTEJfVkVSQk9TRSk7Cj4gICAgICAgICBtZW1ibG9ja19mcmVlX2Fs
bCgpOwo+Cj4gICAgICAgICBwcmludF92bV9sYXlvdXQoKTsKCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
