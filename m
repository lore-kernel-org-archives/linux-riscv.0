Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2472C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtDYNHnjRwbIJnXGf7W2QvoTWpHQ4Zxpzz60NA7qCMw=; b=ctfH09HNspAT+2
	A1tywkkXTm+menobtFL0VwdkWjC3uMGUptSu+McbwQ6PdA8F/9KyCtQCYc0Ff1aQTIUQCbMTaM1R7
	2NgAE2NibP6VyCzcsCACBD2UvLPLUP+JPGB+wTM5+yGMcXavbNjKcaXKF8g2w2EWbGLXdAQlZBeeG
	DhWiwVS+ZQLLKuH6mbgM6JpGZQ3baTUjmJa8YJyQ++VcXIcPWFMzuwclJRHutYD41/00xufQR4xvg
	N41J8B8sloS32WQiFipPG6b9nh4RJGxBpSVyYvY5A1Ao+r9yKkGng/oFomKtpZ8P51bNF1L9L5guh
	Ot8qz5ZtSHK+zXTdIe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKSX-001zN8-1N;
	Thu, 23 Mar 2023 12:54:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKSS-001zL5-2g
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 12:54:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id l37so476508wms.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679576056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJkjkDDXcfaVEj/wzBuynagqiTlGyMneMBfA6NRDFpA=;
        b=HR6KCQS776uoD7UGnbRZdWuSA1KClPo4MTXzADx7rQ2WKrUdB81NFWVPwPPMCgCMWv
         XJ/u5N+tal5a/MZ33HO7NrBNUxCV1KKSM59x9+tRwHY5c30FzgE8vRD45dNTh0IWEmCx
         2geo29vy+AAc9Duo/xCij7+X8gJX+NLjuGuulf1OhXoWlC6J7z0ReGShAGQWrAj67P3t
         YHXlZVk+pHgCvkfDlu3gPh6oqsCzJ13wNrX5bBiEatSnaTriNuLp3PdBKmUdMUQcMUgQ
         tClyIx+mExQFvfArw5D3bFM8yIcqIPiqXG+Qs91CkHKBtOJ9zXu/7B1k6baKFrJjx9r6
         08LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679576056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJkjkDDXcfaVEj/wzBuynagqiTlGyMneMBfA6NRDFpA=;
        b=zGeMsH5Fmk7h/R1iMr4Eu+crAHzhorrQMWgZj1kabifJid2U1jOrRRXE4RhrKWN8+2
         U0tb+87PqkrdpQlfN+vRZm3/eQ3LPKJ506DF4lBB1wBRuQAP8Fci8Ii6xCspt26+sS4H
         LH6IQ8AGKhVFkXTSdWZ4DaDRSSctQRw0JJ3KWLKz5MY0HlJCSu6070P3gV2nG7qUNrhE
         YbrpbgjZnjAZVcTfM4bMlnCzFr750uQkO/GL9c9VOQ0sCGbqphGTu26t81vSQGZhVBpr
         QLUzsh17PyLGiQozwEJ8VKpbnrZaDLPJCuR8XVwIRk6HYjjKOr1fOIgv3qizWm0I742j
         bYLQ==
X-Gm-Message-State: AO0yUKWB+g1EuNy3grHM25qYZBIcmc1jiRX/4xK/vVyzoUyLv2FsBXY+
	t9BYgVKb+Bq0jeVyOdypwem2l1tiTCSZ4yYo1snauw==
X-Google-Smtp-Source: AK7set+cxes5jKFyq91uR4zzQ+z8CDae/libm0ngmGBzyHd+HlvVpBhotdASHGu/nauWRHYX/FvMVf1MWJijHfR/THk=
X-Received: by 2002:a05:600c:217:b0:3df:97cf:4590 with SMTP id
 23-20020a05600c021700b003df97cf4590mr704838wmi.3.1679576056462; Thu, 23 Mar
 2023 05:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230316131711.1284451-1-alexghiti@rivosinc.com> <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com>
In-Reply-To: <CAK9=C2XJtSG2d_nsyDv7kU1v7Jj0chdevqrMc0MpJswukcEABA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 23 Mar 2023 13:54:05 +0100
Message-ID: <CAHVXubhhxpzHDM-n91V_rceY5t_VqLvrwZj3RP_tNL2=F9mqjQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Anup Patel <apatel@ventanamicro.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_055421_063082_C80001F9 
X-CRM114-Status: GOOD (  33.13  )
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

SGkgQW51cCwKCk9uIFRodSwgTWFyIDIzLCAyMDIzIGF0IDE6MTjigK9QTSBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGV4LAo+Cj4gT24gVGh1LCBN
YXIgMTYsIDIwMjMgYXQgNjo0OOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBwYXRjaHNldCBpbnRlbmRzIHRvIGltcHJvdmUg
dGxiIHV0aWxpemF0aW9uIGJ5IHVzaW5nIGh1Z2VwYWdlcyBmb3IKPiA+IHRoZSBsaW5lYXIgbWFw
cGluZy4KPiA+Cj4gPiBBcyByZXBvcnRlZCBieSBBbnVwIGluIHY2LCB3aGVuIFNUUklDVF9LRVJO
RUxfUldYIGlzIGVuYWJsZWQsIHdlIG11c3QKPiA+IHRha2UgY2FyZSBvZiBpc29sYXRpbmcgdGhl
IGtlcm5lbCB0ZXh0IGFuZCByb2RhdGEgc28gdGhhdCB0aGV5IGFyZSBub3QKPiA+IG1hcHBlZCB3
aXRoIGEgUFVEIG1hcHBpbmcgd2hpY2ggd291bGQgdGhlbiBhc3NpZ24gd3JvbmcgcGVybWlzc2lv
bnMgdG8KPiA+IHRoZSB3aG9sZSByZWdpb246IGl0IGlzIGFjaGlldmVkIGJ5IGludHJvZHVjaW5n
IGEgbmV3IG1lbWJsb2NrIEFQSS4KPiA+Cj4gPiBBbm90aGVyIHBhdGNoIG1ha2VzIHVzZSBvZiB0
aGlzIG5ldyBBUEkgaW4gYXJtNjQgd2hpY2ggdXNlZCBzb21lIHNvcnQgb2YKPiA+IGhhY2sgdG8g
c29sdmUgdGhpcyBpc3N1ZTogaXQgd2FzIGJ1aWx0L2Jvb3QgdGVzdGVkIHN1Y2Nlc3NmdWxseS4K
PiA+Cj4gPiBiYXNlLWNvbW1pdC10YWc6IHY2LjMtcmMxCj4gPgo+ID4gdjg6Cj4gPiAtIEZpeCBy
djMyLCBhcyByZXBvcnRlZCBieSBBbnVwCj4gPiAtIERvIG5vdCBtb2RpZnkgbWVtYmxvY2tfaXNv
bGF0ZV9yYW5nZSBhbmQgZml4ZXMgY29tbWVudCwgYXMgc3VnZ2VzdGVkIGJ5IE1pa2UKPiA+IC0g
VXNlIHRoZSBuZXcgbWVtYmxvY2sgQVBJIGZvciBjcmFzaCBrZXJuZWwgdG9vIGluIGFybTY0LCBh
cyBzdWdnZXN0ZWQgYnkgQW5kcmV3Cj4gPiAtIEZpeCBhcm02NCBkb3VibGUgbWFwcGluZyAod2hp
Y2ggdG8gbWUgZGlkIG5vdCB3b3JrIGluIHY3KSwgYnV0IGVuZHMgdXAgbm90Cj4gPiAgIGJlaW5n
IHByZXR0eSBhdCBhbGwsIHdpbGwgd2FpdCBmb3IgY29tbWVudHMgZnJvbSBhcm02NCByZXZpZXdl
cnMsIGJ1dAo+ID4gICB0aGlzIHBhdGNoIGNhbiBlYXNpbHkgYmUgZHJvcHBlZCBpZiB0aGV5IGRv
IG5vdCB3YW50IGl0Lgo+ID4KPiA+IHY3Ogo+ID4gLSBGaXggQW51cCBidWcgcmVwb3J0IGJ5IGlu
dHJvZHVjaW5nIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5IHdoaWNoCj4gPiAgIGFsbG93cyB1cyB0
byBzcGxpdCB0aGUgbWVtYmxvY2sgbWFwcGluZ3MgYW5kIHRoZW4gYXZvaWQgdG8gbWFwIHRoZQo+
ID4gICB0aGUgUFVEIHdoaWNoIGNvbnRhaW5zIHRoZSBrZXJuZWwgYXMgcmVhZCBvbmx5Cj4gPiAt
IEFkZCBhIHBhdGNoIHRvIGFybTY0IHRvIHVzZSB0aGlzIG5ld2x5IGludHJvZHVjZWQgQVBJCj4g
Pgo+ID4gdjY6Cj4gPiAtIHF1aWV0IExMVk0gd2FybmluZyBieSBjYXN0aW5nIHBoeXNfcmFtX2Jh
c2UgaW50byBhbiB1bnNpZ25lZCBsb25nCj4gPgo+ID4gdjU6Cj4gPiAtIEZpeCBub21tdSBidWls
ZHMgYnkgZ2V0dGluZyByaWQgb2YgcmlzY3ZfcGZuX2Jhc2UgaW4gcGF0Y2ggMSwgdGhhbmtzCj4g
PiAgIENvbm9yCj4gPiAtIEFkZCBSQiBmcm9tIEFuZHJldwo+ID4KPiA+IHY0Ogo+ID4gLSBSZWJh
c2Ugb24gdG9wIG9mIHY2LjItcmMzLCBhcyBub3RlZCBieSBDb25vcgo+ID4gLSBBZGQgQWNrZWQt
YnkgUm9iCj4gPgo+ID4gdjM6Cj4gPiAtIENoYW5nZSB0aGUgY29tbWVudCBhYm91dCBpbml0cmRf
c3RhcnQgVkEgY29udmVyc2lvbiBzbyB0aGF0IGl0IGZpdHMKPiA+ICAgQVJNNjQgYW5kIFJJU0NW
NjQgKGFuZCBvdGhlcnMgaW4gdGhlIGZ1dHVyZSBpZiBuZWVkZWQpLCBhcyBzdWdnZXN0ZWQKPiA+
ICAgYnkgUm9iCj4gPgo+ID4gdjI6Cj4gPiAtIEFkZCBhIGNvbW1lbnQgb24gd2h5IFJJU0NWNjQg
ZG9lcyBub3QgbmVlZCB0byBzZXQgaW5pdHJkX3N0YXJ0L2VuZCB0aGF0Cj4gPiAgIGVhcmx5IGlu
IHRoZSBib290IHByb2Nlc3MsIGFzIGFza2VkIGJ5IFJvYgo+ID4KPiA+IEFsZXhhbmRyZSBHaGl0
aSAoNCk6Cj4gPiAgIHJpc2N2OiBHZXQgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIHZhcmlhYmxlCj4g
PiAgIG1tOiBJbnRyb2R1Y2UgbWVtYmxvY2tfaXNvbGF0ZV9tZW1vcnkKPiA+ICAgYXJtNjQ6IE1h
a2UgdXNlIG9mIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5IGZvciB0aGUgbGluZWFyIG1hcHBpbmcK
PiA+ICAgcmlzY3Y6IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5n
Cj4KPiBLZXJuZWwgYm9vdCBmaW5lIG9uIFJWNjQgYnV0IHRoZXJlIGlzIGEgZmFpbHVyZSB3aGlj
aCBpcyBzdGlsbCBub3QKPiBhZGRyZXNzZWQuIFlvdSBjYW4gc2VlIHRoaXMgZmFpbHVyZSBhcyBm
b2xsb3dpbmcgbWVzc2FnZSBpbgo+IGtlcm5lbCBib290IGxvZzoKPiAgICAgMC4wMDAwMDBdIEZh
aWxlZCB0byBhZGQgYSBTeXN0ZW0gUkFNIHJlc291cmNlIGF0IDgwMjAwMDAwCgpIbW1tIEkgZG9u
J3QgZ2V0IHRoYXQgaW4gYW55IG9mIG15IHRlc3QgY29uZmlncywgd291bGQgeW91IG1pbmQKc2hh
cmluZyB5b3VycyBhbmQgeW91ciBxZW11IGNvbW1hbmQgbGluZT8KClRoYW5rcwoKPgo+IFJlZ2Fy
ZHMsCj4gQW51cAo+Cj4gPgo+ID4gIGFyY2gvYXJtNjQvbW0vbW11LmMgICAgICAgICAgIHwgMjUg
KysrKysrKysrKystLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCB8IDE5
ICsrKysrKysrKysrLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICB8IDUzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9tbS9waHlz
YWRkci5jICAgICAgfCAxNiArKysrKysrKysrKwo+ID4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAg
ICAgICAgIHwgMTEgKysrKy0tLS0KPiA+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICB8
ICAxICsKPiA+ICBtbS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysr
KysKPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDExOSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMo
LSkKPiA+Cj4gPiAtLQo+ID4gMi4zNy4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
