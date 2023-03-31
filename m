Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2975C761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVUy88SDNuNf82QrKUWVrP49nTZ9Nrb2pol1giWvF18=; b=ZSrH4TSozlmSxl
	bbvntJ1ApgiKFiGipPmjq1FJGBWrIM6OsbtihpYmkTvySkuQ0goBK9j/RtzOerL68BtfrAdIbae5z
	fT/z/QvWikVYizk7n1pbdHZMOU4xRfx0gJgvjHkDro2DXRBWHhB8T8q8OVf2E8J2Gp0EV1KbaxUIz
	ZOYtlDhLzuvS+hgXA7uqS5WFc2O630UDImrI1JkFtRTz1ur4/oLRNZ9kvhH5oEHs/3EQHC/VXD/X4
	CdsQUTXeCV6yYNxOIO+leIvj8SMJ3q+1cAzvsFIofJcaqqAIueV7arr1PBXtZu6Hv8LBCPEobmncJ
	36MohcOQLpHuEaThtIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCGr-006zMH-0c;
	Fri, 31 Mar 2023 10:46:13 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCGp-006zKr-0w
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:46:12 +0000
Received: by mail-il1-x130.google.com with SMTP id e6so11285477ilu.9
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259567; x=1682851567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxMlaJ1BeHGbxg9ofgk7r/BRvhmnDYafcE/OU7JSLC0=;
        b=Qc4g4T+XpHTgRWXtYwjBB3pEehUDlAB0PvzisZQX3EB7mUc3aylnHHWfve+EIYHERp
         SQKbLgQCUfH6uM/PkFTphZnJkjoLpzcitEMB1mrizlsNZpe6gfpkEq1Y5JUEK79qO+6r
         Ol1pNhJnxR8QiUK12f8BEfM2ty6e12eq/iXi7GSpPiiFB1uCHsIefuM/kqIH+ov+fjhP
         fLQVSe2034LIv168HD0BeyThA98ov1Eyb3BUgJ91tA6AtdGqPQPArCp2xw4sezdNBeZp
         /zf/E7WHpPNWviXjaSy6R5mMTORn8PYe0EYpeOpzs8SLRLeuR5Ts79oVeKeB2H8b4F0x
         5k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259567; x=1682851567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxMlaJ1BeHGbxg9ofgk7r/BRvhmnDYafcE/OU7JSLC0=;
        b=FhMIRvA/TDMg0vQ2MaJgJTbEMbjFckd+ahcMbwmPl7BlW/SCaMC7X8wQfBTbQZDetv
         HHwzg4fspOHCG+6YOc2RsG9+xRVcwmejMEMQ4S0VOmyQC/9XgL5XoKH0s12YHgPR3lGf
         JJSdEgUfpWKinThpfNcv6nl6IuWE/O3/LBZSZFt2Un+r9zi5PNJ+k6UJCRC8XHoTwadW
         Ka/wUrdosC0xpPyfiT04MA2dx0iJp8TV9ulF1F34gxulv7EDGMCoChiS+bEQc4+CRWFE
         8pkq3z6jr092SpVRsyVcA2IAIpBSzw4PTsSYE2H8fMZv+/z8MKQy11NgLdApi/0PFDr4
         ESZA==
X-Gm-Message-State: AAQBX9eFXtGIfjV7GkooWwaZtZAkOtGD5n6iE3QiJ6wTghg3GXAJsTiJ
	J4COa/11KKHDV5QYHHapaz9XXyC9oIet/V45CUA=
X-Google-Smtp-Source: AKy350aWf54kGpalGeRTLVEMORyDKMQIYATUQVwCoZMfvPGkoQeKkXMORDvUHOKDdT4eai4vmBUDXFdEEp04Tc/inCU=
X-Received: by 2002:a05:6e02:180f:b0:325:dae2:4238 with SMTP id
 a15-20020a056e02180f00b00325dae24238mr6085691ilv.2.1680259566978; Fri, 31 Mar
 2023 03:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVseMfkQw5OnTM4CxW9BUCZ0pVZP6px67h8VPah0x3QAA@mail.gmail.com>
In-Reply-To: <CAMuHMdVseMfkQw5OnTM4CxW9BUCZ0pVZP6px67h8VPah0x3QAA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 11:45:40 +0100
Message-ID: <CA+V-a8v8UDQUtNkhYeLHE_t8dNzYEddAwB0a5AdX04pD2VS9pA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_034611_327521_1BD65A8A 
X-CRM114-Status: GOOD (  24.21  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIE1hciAzMSwgMjAy
MyBhdCA4OjMx4oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiBP
biBUaHUsIE1hciAzMCwgMjAyMyBhdCAxMDo0MuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IEN1cnJlbnRseSwgc2VsZWN0
aW5nIHdoaWNoIENNT3MgdG8gdXNlIG9uIGEgZ2l2ZW4gcGxhdGZvcm0gaXMgZG9uZSB1c2luZwo+
ID4gYW5kIEFMVEVSTkFUSVZFX1goKSBtYWNyby4gVGhpcyB3YXMgbWFuYWdlYWJsZSB3aGVuIHRo
ZXJlIHdlcmUganVzdCB0d28KPgo+IHRoZSBBTFRFUk5BVElWRV9YKCkKPgpPSy4KCj4gPiBDTU8g
aW1wbGVtZW50YXRpb25zLCBidXQgbm93IHRoYXQgdGhlcmUgYXJlIG1vcmUgYW5kIG1vcmUgcGxh
dGZvcm1zIGNvbWluZwo+ID4gbmVlZGluZyBjdXN0b20gQ01PcywgdGhlIHVzZSBvZiB0aGUgQUxU
RVJOQVRJVkVfWCgpIG1hY3JvIGlzIHVubWFuYWdlYWJsZS4KPiA+Cj4gPiBUbyBhdm9pZCBzdWNo
IGlzc3VlcyB0aGlzIHBhdGNoIHN3aXRjaGVzIHRvIHVzZSBvZiBmdW5jdGlvbiBwb2ludGVycwo+
Cj4gInRoZSB1c2UiIG9yICJ1c2luZyIKPgpPSy4KCj4gPiBpbnN0ZWFkIG9mIEFMVEVSTkFUSVZF
X1goKSBtYWNybyBmb3IgY2FjaGUgbWFuYWdlbWVudCAodGhlIG9ubHkgZHJhd2JhY2sKPgo+IHRo
ZSBBTFRFUk5BVElWRV9YKCkKPgpPSy4KCj4gPiBiZWluZyBwZXJmb3JtYW5jZSBvdmVyIHRoZSBw
cmV2aW91cyBhcHByb2FjaCkuCj4gPgo+ID4gdm9pZCAoKmNsZWFuX3JhbmdlKSh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqaW52X3JhbmdlKSh1bnNp
Z25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqZmx1c2hfcmFu
Z2UpKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiA+Cj4gPiBUaGUg
YWJvdmUgZnVuY3Rpb24gcG9pbnRlcnMgYXJlIHByb3ZpZGVkIHRvIGJlIG92ZXJyaWRkZW4gZm9y
IHBsYXRmb3Jtcwo+ID4gbmVlZGluZyBDTU8uCj4gPgo+ID4gQ29udmVydCBaSUNCT00gYW5kIFQt
SEVBRCBDTU8gdG8gdXNlIGZ1bmN0aW9uIHBvaW50ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
Pgo+ID4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4KPiA+ICsjaWZkZWYgQ09ORklHX0VSUkFU
QV9USEVBRF9DTU8KPgo+ID4gK3N0YXRpYyB2b2lkIHRoZWFkX3JlZ2lzdGVyX2Ntb19vcHModm9p
ZCkKPiA+ICt7Cj4gPiArICAgICAgIHJpc2N2X25vbmNvaGVyZW50X3JlZ2lzdGVyX2NhY2hlX29w
cygmdGhlYWRfY21vX29wcyk7Cj4gPiArfQo+ID4gKyNlbHNlCj4gPiArc3RhdGljIHZvaWQgdGhl
YWRfcmVnaXN0ZXJfY21vX29wcyh2b2lkKSB7fQo+ID4gKyNlbmRpZgo+Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2RtYS1u
b25jb2hlcmVudC5jCj4KPiA+IEBAIC03NSwzICs4MywxMiBAQCB2b2lkIHJpc2N2X25vbmNvaGVy
ZW50X3N1cHBvcnRlZCh2b2lkKQo+ID4gICAgICAgICAgICAgICJOb24tY29oZXJlbnQgRE1BIHN1
cHBvcnQgZW5hYmxlZCB3aXRob3V0IGEgYmxvY2sgc2l6ZVxuIik7Cj4gPiAgICAgICAgIG5vbmNv
aGVyZW50X3N1cHBvcnRlZCA9IHRydWU7Cj4gPiAgfQo+ID4gKwo+ID4gK3ZvaWQgcmlzY3Zfbm9u
Y29oZXJlbnRfcmVnaXN0ZXJfY2FjaGVfb3BzKGNvbnN0IHN0cnVjdCByaXNjdl9jYWNoZV9vcHMg
Km9wcykKPiA+ICt7Cj4gPiArICAgICAgIGlmICghb3BzKQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybjsKPgo+IFRoaXMgaXMgbmV2ZXIgdHJ1ZS4KSSBqdXN0IHdhbnRlZCB0byBhZGQgYSBzYW5p
dHkgY2hlY2suCgo+IEkgZ3Vlc3Mgb3JpZ2luYWxseSB5b3Ugd2FudGVkIHRvIGNhbGwgcmlzY3Zf
bm9uY29oZXJlbnRfcmVnaXN0ZXJfY2FjaGVfb3BzKCkKPiB1bmNvbmRpdGlvbmFsbHkgZnJvbSBj
b21tb24gY29kZSwgaW5zdGVhZCBvZiB0aGUgdmFyaW91cyAqcmVnaXN0ZXJfY21vX29wcygpPwo+
IEJ1dCB0aGF0IHdvdWxkIGhhdmUgcmVxdWlyZWQgc29tZXRoaW5nIGxpa2UKPgo+ICNpZmRlZiBD
T05GSUdfRVJSQVRBX1RIRUFEX0NNTwo+ICNkZWZpbmUgVEhFQURfQ01PX09QU19QVFIgICAoJnRo
ZWFkX2Ntb19vcHMpCj4gI2Vsc2UKPiAjZGVmaW5lIFRIRUFEX0NNT19PUFNfUFRSICAgTlVMTAo+
ICNlbmRpZgo+CnJpc2N2X25vbmNvaGVyZW50X3JlZ2lzdGVyX2NhY2hlX29wcygpIHdpbGwgb25s
eSBiZSBjYWxsZWQgaWYgdGhlCklTQS9FcnJhdGEgbmVlZHMgdG8gYmUgYXBwbGllZCBzbyBJJ2xs
IGRyb3AgdGhpcyBjaGVjay4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
