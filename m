Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3619DC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HLcHG2GjC07HUKnUsqbfiEC9dzlRziE8vXT3Rdf87M=; b=LQWL5CUTjRtciL
	7trKYYPF4bisYJ5a4HIwNQQbDTh9pIFzx2+aDO1v/s1x9zYCqJJSAC16NlCy0eHQxymUy7D7DDFYN
	ayXmuqZyXx4JxQRFhFI3BFHnGhfp81vrVuyUCx3IcVeECEfXCjY50Nxwa2FZUF5dNTXN0DgC3ALgG
	F9lpBkZB5D0z/n/Ew+iLUk8EpF4tojBk4DkyZkBcvPpzto55tVgnzOVhl1rXOqweUaqPG4G+Dh8aY
	PSd5930hvGoYw99yyTJJuvOG6597laGcRp+pfwpDP41PCvII8C+3KItht4bI9mtqsR9YjStYVY42u
	ycXQf1AqIqepKI2YFBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptovk-001LQv-2z;
	Tue, 02 May 2023 12:16:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptovh-001LPD-24
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 12:16:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-2fddb442d47so3454003f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 May 2023 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683029781; x=1685621781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1A9x6G4yCMJnJYtqiLhRaKEdOc3L3bl8k6z5LnB/0A=;
        b=iyesHo8Ln/M/BFahufADKt07MqPhk79OM17I50P3V7jzTE4t1W03sZao1mUPjb2uFx
         EcpxTc0Xa9IGTT+L2R3IprZCjENyk67D/uIVEK04y1mT4cKOtpq7VIYwrsLl4DC0nJVT
         wuRgCQ0W4dA3KRpu0DLm/VYm+VCRp1iSe+q+4MaPT63hFi/2lf31zkTGehPMjQOeBIrF
         Ub1buzFCHsf+CneFAuZkXCDicWH+CqLWzrOr8flCJw3x+eXz7k7owJVMCm5TlVItM2qI
         50a08KMz5BdG5yWghK0BfCrX0FGxmS5dvnwGlFSuYdkz31DTjnG/od5W5/tlKh9jE3Ub
         lqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683029781; x=1685621781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1A9x6G4yCMJnJYtqiLhRaKEdOc3L3bl8k6z5LnB/0A=;
        b=JSU+p4dN0vZRrOctTxj0y4E90FcSbchzyM3clzOLPQRo6e/BcPhBfEmb6CCTKubfH1
         rSNBMRsFqSy52qopKNkeyW6U6T938+EuY4aBeC5W3hDx2AvbmabY78Am6j/y4/cNRyHJ
         4KiL+dI3TdAgdkjhV8+DBsNd7Pw71ylMKqo22T2qy7ZYcoi2ErVFw7UxBuTi7ujBn5Uw
         z6ohnFNKe31oFUbnk8/ri23qU1NBqcYYi3r8frOb++mG3JCFA8c2c/oZ8EgV3O2h9NW6
         hcLLV4Mdk1sw7kFK7X/FoRBXECPR/vkudK10p5wygo08+Gl0rmh2OvF0rj9fvr7AlVA2
         L1JQ==
X-Gm-Message-State: AC+VfDwK1PSLM7RwugF/wXkXG3kUxsvnPi+E77bmrkJBdPI3n+awJYRX
	i1S/q3tQH1PKeu8rgiwIBLRdor49e4axGp5IOMi+fw==
X-Google-Smtp-Source: ACHHUZ4yBgorOMUwv0kwqlWkB93H5Z+AViWFG+ven8ML0/Vm3A222vDaNyeutEDaX87vH+H/zqnn8ZuL3s30AE8wU08=
X-Received: by 2002:adf:f7d2:0:b0:2f8:b556:1fb with SMTP id
 a18-20020adff7d2000000b002f8b55601fbmr12248195wrq.28.1683029781511; Tue, 02
 May 2023 05:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230417060618.639395-1-vincent.chen@sifive.com> <mhng-8488a1b0-fc27-4a74-b1d6-3b9975f8795f@palmer-ri-x1c9a>
In-Reply-To: <mhng-8488a1b0-fc27-4a74-b1d6-3b9975f8795f@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 2 May 2023 14:16:10 +0200
Message-ID: <CAHVXubgNYEtTcjzdXaA2UhH3N7VfqyGWSRtoBfm1jJXK8vPk+Q@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: mm: execute local TLB flush after populating vmemmap
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_051625_894957_4ECB1364 
X-CRM114-Status: GOOD (  25.57  )
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCAyOjE44oCvQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIDE2IEFwciAyMDIzIDIzOjA2OjE4IFBEVCAo
LTA3MDApLCB2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbSB3cm90ZToKPiA+IFRoZSBzcGFyZV9pbml0
KCkgY2FsbHMgbWVtbWFwX3BvcHVsYXRlKCkgbWFueSB0aW1lcyB0byBjcmVhdGUgVkEgdG8gUEEK
PiA+IG1hcHBpbmcgZm9yIHRoZSBWTUVNTUFQIGFyZWEsIHdoZXJlIGFsbCAic3RydWN0IHBhZ2Ui
IGFyZSBsb2NhdGVkIG9uY2UKPiA+IENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCBpcyBkZWZpbmVk
LiBUaGVzZSAic3RydWN0IHBhZ2UiIGFyZSBsYXRlcgo+ID4gaW5pdGlhbGl6ZWQgaW4gdGhlIHpv
bmVfc2l6ZXNfaW5pdCgpIGZ1bmN0aW9uLiBIb3dldmVyLCBkdXJpbmcgdGhpcwo+ID4gcHJvY2Vz
cywgbm8gc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBmb3IgdGhpcyBWTUVNTUFQ
IGFyZWEuCj4gPiBUaGlzIG9taXNzaW9uIG1heSBjYXVzZSB0aGUgaGFydCB0byBmYWlsIHRvIHBl
cmZvcm0gcGFnZSB0YWJsZSB3YWxrCj4gPiBiZWNhdXNlIHNvbWUgZGF0YSByZWxhdGVkIHRvIHRo
ZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGlzIGludmlzaWJsZSB0byB0aGUKPiA+IGhhcnQuIFRvIHNv
bHZlIHRoaXMgaXNzdWUsIHRoZSBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgaXMgY2Fs
bGVkCj4gPiByaWdodCBhZnRlciB0aGUgc3BhcmVfaW5pdCgpIHRvIGV4ZWN1dGUgYSBzZmVuY2Uu
dm1hIGluc3RydWN0aW9uIGZvciB0aGUKPiA+IFZNRU1NQVAgYXJlYSwgZW5zdXJpbmcgdGhhdCBh
bGwgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uCj4gPiBpcyB2aXNpYmxl
IHRvIHRoZSBoYXJ0Lgo+ID4KPiA+IEZpeGVzOiBkOTVmMWE1NDJjM2QgKCJSSVNDLVY6IEltcGxl
bWVudCBzcGFyc2VtZW0iKQo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCB8IDcgKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAg
ICB8IDUgKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBpbmRleCBhMDkxOTZmOGRlNjguLmY5ZDM3
MTJiZDkzYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2gu
aAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBAQCAtNjEs
NCArNjEsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5z
aWduZWQgbG9uZyBzdGFydCwKPiA+ICAgICAgIGZsdXNoX3RsYl9hbGwoKTsKPiA+ICB9Cj4gPgo+
ID4gKy8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2VybmVsIHBhZ2VzIHdpdGhvdXQgYnJvYWRjYXN0aW5n
ICovCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPiA+ICt7Cj4gPiArICAgICBsb2NhbF9m
bHVzaF90bGJfYWxsKCk7Cj4KPiBXaHkgaXMgdGhpcyBhIGdsb2JhbCBmbHVzaCwgaXN0ZWFkIG9m
IGEgcmFuZ2UtYmFzZWQgb25lPyAgV2Ugc2hvdWxkCj4gcHJvYmFibHkgbWFrZSB0aGUgc2FtZSBj
aGFuZ2UgZm9yIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoKSwgdGhvdWdoCj4gdGhhdCdzIG5vdCBh
IGZpeC4KCllvdSdyZSByaWdodCwgYnV0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGZs
dXNoX3RsYl9yYW5nZSB3aWxsCnVsdGltYXRlbHkgY2FsbCBmbHVzaF90bGJfYWxsIGlmIHRoZSBz
aXplID4gUEFHRV9TSVpFLCB3aGljaCBpcyB2ZXJ5Cmxpa2VseSBpbiB0aGlzIGNhc2UuIEFueXdh
eSwgSSBoYXZlIGEgcGF0Y2hzZXQgYWxtb3N0IHJlYWR5IHRoYXQKaW1wcm92ZXMgdGhlIHRsYiBm
bHVzaCByb3V0aW5lcywgYW5kIEkgbm90ZWQgdGhhdCBJIGhhZCB0byBmaXggdGhpcwpmdW5jdGlv
biBvbmNlIG1lcmdlZC4KCj4KPiA+ICt9Cj4gPiArCj4gPiAgI2VuZGlmIC8qIF9BU01fUklTQ1Zf
VExCRkxVU0hfSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiA+IGluZGV4IDBmMTRmNGE4ZDE3OS4uYmNmMzY1Y2JiY2MxIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4gPiBAQCAtMTIyMSw2ICsxMjIxLDEwIEBAIHZvaWQgX19pbml0IG1pc2NfbWVt
X2luaXQodm9pZCkKPiA+ICAgICAgIGVhcmx5X21lbXRlc3QobWluX2xvd19wZm4gPDwgUEFHRV9T
SElGVCwgbWF4X2xvd19wZm4gPDwgUEFHRV9TSElGVCk7Cj4gPiAgICAgICBhcmNoX251bWFfaW5p
dCgpOwo+ID4gICAgICAgc3BhcnNlX2luaXQoKTsKPiA+ICsjaWZkZWYgQ09ORklHX1NQQVJTRU1F
TV9WTUVNTUFQCj4gPiArICAgICAvKiBUaGUgZW50aXJlIFZNRU1NQVAgcmVnaW9uIGhhcyBiZWVu
IHBvcHVsYXRlZC4gRmx1c2ggVExCIGZvciB0aGlzIHJlZ2lvbiAqLwo+ID4gKyAgICAgbG9jYWxf
Zmx1c2hfdGxiX2tlcm5lbF9yYW5nZShWTUVNTUFQX1NUQVJULCBWTUVNTUFQX0VORCk7Cj4gPiAr
I2VuZGlmCj4gPiAgICAgICB6b25lX3NpemVzX2luaXQoKTsKPiA+ICAgICAgIHJlc2VydmVfY3Jh
c2hrZXJuZWwoKTsKPiA+ICAgICAgIG1lbWJsb2NrX2R1bXBfYWxsKCk7Cj4gPiBAQCAtMTIzMCw2
ICsxMjM0LDcgQEAgdm9pZCBfX2luaXQgbWlzY19tZW1faW5pdCh2b2lkKQo+ID4gIGludCBfX21l
bWluaXQgdm1lbW1hcF9wb3B1bGF0ZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IGVuZCwgaW50IG5vZGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2
bWVtX2FsdG1hcCAqYWx0bWFwKQo+ID4gIHsKPiA+ICsgICAgIC8qIERlZmVyIHRoZSByZXF1aXJl
ZCBUTEIgZmx1c2ggdW50aWwgdGhlIGVudGlyZSBWTUVNTUFQIHJlZ2lvbiBoYXMgYmVlbiBwb3B1
bGF0ZWQgKi8KPiA+ICAgICAgIHJldHVybiB2bWVtbWFwX3BvcHVsYXRlX2Jhc2VwYWdlcyhzdGFy
dCwgZW5kLCBub2RlLCBOVUxMKTsKPiA+ICB9Cj4gPiAgI2VuZGlmCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
