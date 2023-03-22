Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D4AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XklMhI4YG0gFg2zQS2+aI7Utrr4YWPahr5IlhfetmMI=; b=3mVrNEorKT50SrF3h99/2/woKv
	p3OYhtu1ZPSXPCBU/DBKhbHb09Q2D1Calc94qzA2kJxOkDthE0kuhZJhJXdjo8losq2vRoSPR/rFb
	vAtGdBcfXI/gv6DHxPFh6NI5wIRu/Awc1JPpgyUbPRIIICv60Kj5is4O86EsxHJDA5htwvWvDYehv
	D9RAbzO0VxUa/pIEWMOc3R9Vet1SBUhRtQU5weVRC1TNjXKC3ke/4Wz3itqBXS5HARXT/GKCmoBbG
	06KrXO8tsocB6R50XFg2Sjdj/Yt2bcP5Py2wK4nbe79YDhTFkAKmEmthJ7av6F6MexfRsdS0pKGn4
	Gc5CzG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1perHp-00El9q-1R;
	Wed, 22 Mar 2023 05:45:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1perHl-00El91-2L
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 05:45:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso567212pjf.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1679463918;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUKAUL85Wxi4b4hEHbzNnUHiPyWHwr8K1HugEBDKlCY=;
        b=7Bt9C3b0x5bzvZmhwOdMEbFaokkffe4BeXZf9spQfTQTV/uGRfGWzxbI/GZf40finz
         nbuRFRh3BMXJFA4ovpUHWwzAAupSiH1FhEJg/nwoGXRajRt2G0yPnU8hITvBtYJLKBKY
         izK/ScSuoSAa7JYCAiitB4zEtwwEjrtHf5yi+81KR/BQKw+Ft0qUmn1qB3Eja7xNsv4J
         JV4g9eJuzou/iGVT6xRrU4NYAQqzvfFh8ILs5YoUzJJE++AM6yhGBryt1Y3JBgYqDBrF
         CteDpmyE1uoN+P58dQRPiFc+q4A2mvehrJK/G0eHSOkkHqmkhnQVCzAKcROvwN9PgT7a
         1N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679463918;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUKAUL85Wxi4b4hEHbzNnUHiPyWHwr8K1HugEBDKlCY=;
        b=ac4w2D8m1fsefe/xQZjPgdv/M/kIAjp6bDkF2X3WDLR05eAQfO0aSxvLJRi45HYWuS
         Y5AzaytJC0L90XSlpLYoMAaALbSvy1W802mDbaQ7/t/9mLwxww7eg5LkzP77gMxs++QB
         7CmwCyb1kOSXsU6uZahgO6MTqF/+j8MC1kdXyxllpbWEbj/2Q+65uWLKn5+hK1spSRh6
         Z8SvrkyI3eDFW3frzbaidbodeXQ/74MDIbgthdPKSnsEWDCNuIR70L49qaEcEK4Zy9eX
         963qyHKPzKpAjNJqa333MpWF7N0LDIrXqzFnNSwq5Et+5t5v0503hSWz+QZtBxcszO6r
         hWxw==
X-Gm-Message-State: AO0yUKV/ndpwHgmxQpgiuQh6Naoz9k535mC6X89J56BZ68S1Krnc79hp
	7k7836W6Ux+Qzerb9qq1MQGq+w==
X-Google-Smtp-Source: AK7set9hFoIwQ5Kio4YFlSmi5wONLtFpJp7xTQyWo86igN/jztcMv43XvZLZYd2HwBUUV7XaimRunw==
X-Received: by 2002:a17:902:da8e:b0:19f:3b31:4d3 with SMTP id j14-20020a170902da8e00b0019f3b3104d3mr1666171plx.41.1679463918547;
        Tue, 21 Mar 2023 22:45:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id s21-20020a170902b19500b00183c6784704sm7756487plr.291.2023.03.21.22.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 22:45:17 -0700 (PDT)
Date: Tue, 21 Mar 2023 22:45:17 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Mar 2023 22:45:08 PDT (-0700)
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing TLB
In-Reply-To: <ZBkZnRG4FYqjGiLz@APC323>
CC: zongbox@gmail.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  guoren@kernel.org, sergey.matyukevich@syntacore.com, aou@eecs.berkeley.edu,
  Paul Walmsley <paul.walmsley@sifive.com>, x5710999x@gmail.com, tim609@andestech.com, peterlin@andestech.com,
  ycliang@andestech.com, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dylan@andestech.com
Message-ID: <mhng-41e9d23d-0d17-4b38-ba7c-1f8369f157d7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_224521_988132_A1C80312 
X-CRM114-Status: GOOD (  31.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBNYXIgMjAyMyAxOTo0MjozNyBQRFQgKC0wNzAwKSwgZHlsYW5AYW5kZXN0ZWNo
LmNvbSB3cm90ZToKPiBPbiBUdWUsIE1hciAxNCwgMjAyMyBhdCAwMzoyNzozMFBNICswODAwLCBE
eWxhbiBKaG9uZyB3cm90ZToKPj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6MjI6NDNBTSAr
MDgwMCwgWm9uZyBMaSB3cm90ZToKPj4gPiBEeWxhbiBKaG9uZyA8ZHlsYW5AYW5kZXN0ZWNoLmNv
bT4g5pa8IDIwMjPlubQz5pyIMTPml6Ug6YCx5LiAIOS4i+WNiDEyOjI55a+r6YGT77yaCj4+ID4g
Pgo+PiA+ID4gQ3VycmVudGx5LCB3ZSBwYXNzIHRoZSBDT05URVhUSUQgaW5zdGVhZCBvZiB0aGUg
QVNJRCB0byB0aGUgVExCIGZsdXNoCj4+ID4gPiBmdW5jdGlvbi4gV2Ugc2hvdWxkIG9ubHkgdGFr
ZSB0aGUgQVNJRCBmaWVsZCB0byBwcmV2ZW50IGZyb20gdG91Y2hpbmcKPj4gPiA+IHRoZSByZXNl
cnZlZCBiaXQgZmllbGQuCj4+ID4gPgo+PiA+ID4gRml4ZXM6IDNmMWU3ODI5OThjZCAoInJpc2N2
OiBhZGQgQVNJRC1iYXNlZCB0bGJmbHVzaGluZyBtZXRob2RzIikKPj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IER5bGFuIEpob25nIDxkeWxhbkBhbmRlc3RlY2guY29tPgo+PiA+ID4gLS0tCj4+ID4KPj4g
PiBIaSBEeWxhbiwKPj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIGlmIEkgcmVtZW1iZXIgY29y
cmVjdGx5LCB0aGVyZSB3YXMgYSBwYXRjaCBmcm9tCj4+ID4gQWxpc3RhaXIgRnJhbmNpcyBkaWQg
dGhlIHNpbWlsYXIgZml4LiBQZXJoYXBzIHdlIHNob3VsZCB0cmFjayB0aGF0Cj4+ID4gcGF0Y2gg
dG8gc2VlIHdoeSBpdCBkb2Vzbid0IGJlIG1lcmdlZC4gVGhhbmtzLgo+PiA+Cj4+ID4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjItTWFyY2gvMDEz
NTU4Lmh0bWwKPj4gPgo+PiBIaSBab25nLAo+PiBUaGFua3MgZm9yIHRoZSByZW1pbmRlciwgSSBk
aWRuJ3Qgbm90aWNlIHRoYXQgQWxpc3RhaXIgaGFkIHNlbnQgdGhlIHNhbWUgcGF0Y2ggYmVmb3Jl
Lgo+Pgo+PiBIaSBQYWxtZXIsIEFsaXN0YWlyCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIyLU1hcmNoLzAxMzU5Ny5odG1sCj4+IFRoaXMgcGF0
Y2ggZG9lcyBub3Qgc2VlbSB0byBiZSBjaGVycnktcGlja2VkIGJhY2sgdG8gdGhlIHJlbGVhc2Vk
IGxpbnV4IGtlcm5lbCwKPj4gYW5kIEkgaGF2ZSBub3Qgc2VlbiB0aGUgdjQgcGF0Y2guIE1heSBJ
IGFzayBob3cgaXMgdGhlIGZvbGxvdy11cCBwcm9ncmVzcyBvZiB0aGlzIHBhdGNoPwoKU29ycnkg
YWJvdXQgdGhhdCwgSSBndWVzcyBJIGxlZnQgaXQga2luZCBvZiB2YWd1ZSBhcyB0byB3aG8gd2Fz
IGRvaW5nIAp3aGF0LiAgSXQgbG9va3MgbGlrZSB3ZSd2ZSBlbmRlZCB1cCB3aXRoIGVub3VnaCBp
bmNsdWRlcyB0aGF0IHYzIAphY3R1YWxseSBidWlsZHMgbm93LCBpdCdzIHF1ZXVlZCB1cCBhbmQg
c2hvdWxkIGVuZCB1cCBpbiBmaXhlcyB0b21vcnJvdyAKbW9ybmluZy4KClRoYW5rcyEKCj4+Cj4+
IEJlc3QsCj4+IER5bGFuCj4+Cj4KPiBIaSBQYWxtZXIsCj4KPiBQaW5nLiBBbnkgdXBkYXRlIG9u
IHRoaXM/Cj4KPiBCZXN0LAo+IER5bGFuCj4KPj4gPiA+IENoYW5nZXMgZnJvbSB2MjoKPj4gPiA+
IC0gUmVtb3ZlIHVuc3VlZCBFWFBPUlRfU1lNQk9MKCkKPj4gPiA+IC0tLQo+PiA+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPj4gPiA+ICBhcmNoL3Jpc2N2L21t
L2NvbnRleHQuYyAgICAgICAgICAgfCAyICstCj4+ID4gPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jICAgICAgICAgIHwgMiArLQo+PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+PiA+ID4KPj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKPj4gPiA+IGluZGV4IDkwN2I5ZWZkMzlhOC4uNTk3ZDZkOGFlYzI4IDEwMDY0NAo+PiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4+ID4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPj4gPiA+IEBAIC0xMiw2ICsxMiw4IEBACj4+
ID4gPiAgI2luY2x1ZGUgPGFzbS9lcnJhdGFfbGlzdC5oPgo+PiA+ID4KPj4gPiA+ICAjaWZkZWYg
Q09ORklHX01NVQo+PiA+ID4gK2V4dGVybiB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPj4gPiA+
ICsKPj4gPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX2FsbCh2b2lkKQo+
PiA+ID4gIHsKPj4gPiA+ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1h
IiA6IDogOiAibWVtb3J5Iik7Cj4+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jb250
ZXh0LmMgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+PiA+ID4gaW5kZXggODBjZTljYWJhOGQy
Li42ZDFhZWIwNjNlODEgMTAwNjQ0Cj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NvbnRleHQu
Ywo+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPj4gPiA+IEBAIC0yMiw3ICsy
Miw3IEBAIERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHVzZV9hc2lkX2FsbG9jYXRvcik7Cj4+ID4g
Pgo+PiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGFzaWRfYml0czsKPj4gPiA+ICBzdGF0aWMg
dW5zaWduZWQgbG9uZyBudW1fYXNpZHM7Cj4+ID4gPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgYXNp
ZF9tYXNrOwo+PiA+ID4gK3Vuc2lnbmVkIGxvbmcgYXNpZF9tYXNrOwo+PiA+ID4KPj4gPiA+ICBz
dGF0aWMgYXRvbWljX2xvbmdfdCBjdXJyZW50X3ZlcnNpb247Cj4+ID4gPgo+PiA+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
Ywo+PiA+ID4gaW5kZXggY2U3ZGZjODFiYjNmLi5iYTRjMjcxODdjOTUgMTAwNjQ0Cj4+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+PiA+ID4gQEAgLTI3LDcgKzI3LDcgQEAgc3RhdGljIHZvaWQgX19zYmlfdGxi
X2ZsdXNoX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+
PiA+ID4gICAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUgc2VudCB0
byBvdGhlciBDUFVzICovCj4+ID4gPiAgICAgICAgIGJyb2FkY2FzdCA9IGNwdW1hc2tfYW55X2J1
dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPj4gPiA+ICAgICAgICAgaWYgKHN0YXRpY19i
cmFuY2hfdW5saWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpIHsKPj4gPiA+IC0gICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5p
ZCk7Cj4+ID4gPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkID0gYXRvbWljX2xv
bmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpICYgYXNpZF9tYXNrOwo+PiA+ID4KPj4gPiA+ICAgICAg
ICAgICAgICAgICAvKgo+PiA+ID4gICAgICAgICAgICAgICAgICAqIFRMQiB3aWxsIGJlIGltbWVk
aWF0ZWx5IGZsdXNoZWQgb24gaGFydHMgY29uY3VycmVudGx5Cj4+ID4gPiAtLQo+PiA+ID4gMi4z
NC4xCj4+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
