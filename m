Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174ECD5B870
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 04:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufYTwug4U4+0WNvIH53NoIL5TMtWn7VKFPC4rSTgtfY=; b=I9ZYu57iBGtocK
	HdAc68f3ejxXrG4A5Jyl8dm2M3d0Wk6hhRE1NDUvT+WPBIfB08OOrzywGAPfajDKAAFP3YgcAs2Eg
	fKOstYG6tx+iqt6ia8fvHaZx7ByoQV7q7LPD2gEn9uPMLe4p26qHCxF+al8DfmAI6kvP6sZKttapp
	Oy21OhflJ5d6+xFEa5QZYHZjZvpJrmNZ4cr4KuNmT0sWJOo69rOmrUVYluzLVbNAEVs7g7IwOgJgb
	YqHZi1PphhI3Xk45nVjpBncQkzpJiBOTVbU+eB8eSxLHpJKKcAHNLXazGSf0FrpFadirfUjHVTRf9
	p0wV+JYaeMeOtQgKh9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dXB-0000000D9aB-3ufB;
	Tue, 29 Oct 2024 04:08:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dX9-0000000D9Z9-1Udr
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 04:08:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9a850270e2so813821066b.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 21:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730174921; x=1730779721; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gIIEo7y7oCt4veQqo+0XfxoZ69cq65MS/cK+YlFnMn0=;
        b=Bh+NlUs0OWM2t3brhvNShQ8UT9mLF+AR4eyrQcO9Rv9uSInaFdMresLS2dHJNQFQkn
         mHCOM9ajQyQhH5sEPvuD+23edJQGrz6V2Rz0W7k0nNGsGBThHAZ6i0gafptDRAcemaT5
         7HHB3ks+20oImwNwQMAnP7R6SFzudHTFcCxQJqk1dhl3Bm4cnJhvUxP98Fy1+8oZ1uI7
         8d1cF0MfLo3Qhb3hkkctTzBCeAkh6dM6lAum1a/zZTKQz0d3Ny5vlLyBnwa8xD3caAp9
         f3fJHWp4Q6ZuzFeoFw/JuNNHbj/VpgzSACtalH3Td4EAx0O1QODYEQ3XluSbC3uBjM7e
         3oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730174921; x=1730779721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIIEo7y7oCt4veQqo+0XfxoZ69cq65MS/cK+YlFnMn0=;
        b=ZrIG4+oPsk9Q0LZtmv6V1ziiQYhHy9hVXuHuECcAPAiyNMKFO87ZC3Wt/GBeaHY+cl
         OYrcvKCxKhMM4gbD8gBiA26i6J0LZFU0/raR0WBQsOy0AkXDJ92ATyR+O6T5bZC4adSl
         CWyf3X2lVAhNWieL6glXDBLjyfdULCxCVWLXbAlZmLn+9bv+BdK2v1DX5tBlT2/2CFMN
         07pEYLkyStwBUxutc7RhM7ptZviNzMUHwcjAe23XtlMcg5AZqCqh0kfgzcLPFinOIzDH
         XDiPRD5fnLRe445K1+YW462sveYmLjTkXGNCHjN3pWZ/Ku0ip8BAlg5d7pB84qAuoUE6
         bfSA==
X-Forwarded-Encrypted: i=1; AJvYcCXikEj6PCdp8aR4RyGjtNW/wFAMnHYXw02dG1o5RYjr+lRc0XQKBPakhGTJEgOSNrkcHYHr7pRzG3mOOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXpXBKYNtj+6QJ5PdtXJB11nwbMWrqX/fDe8IHy5Ocb4AeGv1y
	M7vh69jA+6LN8wsmWQrOGxuu5WnRG5KLD7fnM1ClIJFR1VN0KPDC7YhttxwjGGg=
X-Google-Smtp-Source: AGHT+IFl3f8KVc1QRaQ2b6/c/hH/WJWqrVw7vV+N8eWlNKsh/eF1g5HhOvtGRdGadtFj+TtWOqb8Gg==
X-Received: by 2002:a17:907:9712:b0:a9a:55de:11f4 with SMTP id a640c23a62f3a-a9de6191f51mr1030052066b.54.1730174920767;
        Mon, 28 Oct 2024 21:08:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.196.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62580b1sm3573211a12.15.2024.10.28.21.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:08:39 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:38:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ajones@ventanamicro.com, jeeheng.sia@starfivetech.com,
	haibo1.xu@intel.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to
 early_memremap
Message-ID: <ZyBfvfvyry6Wb89H@sunil-laptop>
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr>
 <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
 <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr>
 <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
 <CAHVXubjDhM6NEF6uf981Y2fNA1Dw=Bu_SNtpso6P1=3Np6BUDw@mail.gmail.com>
 <CAEEQ3wndPwdaNrJZaqqrbyMBeWTVnV3m8KEehdijtTfXWjuYsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wndPwdaNrJZaqqrbyMBeWTVnV3m8KEehdijtTfXWjuYsw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_210843_422315_CCCB9A6E 
X-CRM114-Status: GOOD (  44.11  )
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

T24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMTE6MDQ6NDlBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBBbGV4LAo+IAo+IAo+IE9uIE1vbiwgT2N0IDI4LCAyMDI0IGF0IDk6MzfigK9QTSBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IEhp
IFl1bmh1aSwKPiA+Cj4gPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkgd2FzIG9uIHZhY2F0
aW9uIGxhc3Qgd2Vlay4KPiA+Cj4gPiBPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCA4OjQ14oCvQU0g
eXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBI
aSBBbGV4LAo+ID4gPgo+ID4gPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCA5OjAx4oCvUE0gQWxl
eGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDE0
LzEwLzIwMjQgMTQ6MzAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+ID4gPiBIaSBBbGV4LAo+ID4g
PiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDg6MTLigK9QTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4gPiA+ID4+IEhpIFl1bmh1aSwKPiA+
ID4gPiA+Pgo+ID4gPiA+ID4+IE9uIDE0LzEwLzIwMjQgMTE6NDcsIFl1bmh1aSBDdWkgd3JvdGU6
Cj4gPiA+ID4gPj4+IFdoZW4gU1ZQQk1UIGlzIGVuYWJsZWQsIF9fYWNwaV9tYXBfdGFibGUoKSB3
aWxsIGRpcmVjdGx5IGFjY2VzcyB0aGUKPiA+ID4gPiA+Pj4gZGF0YSBpbiBERFIgdGhyb3VnaCB0
aGUgSU8gYXR0cmlidXRlLCByYXRoZXIgdGhhbiB0aHJvdWdoIGhhcmR3YXJlCj4gPiA+ID4gPj4+
IGNhY2hlIGNvbnNpc3RlbmN5LCByZXN1bHRpbmcgaW4gaW5jb3JyZWN0IGRhdGEgaW4gdGhlIG9i
dGFpbmVkIEFDUEkKPiA+ID4gPiA+Pj4gdGFibGUuCj4gPiA+ID4gPj4+Cj4gPiA+ID4gPj4+IFRo
ZSBsb2c6IEFDUEk6IFtBQ1BJOjB4MThdIEludmFsaWQgemVybyBsZW5ndGguCj4gPiA+ID4gPj4+
Cj4gPiA+ID4gPj4+IFdlIGRvIG5vdCBhc3N1bWUgd2hldGhlciB0aGUgYm9vdGxvYWRlciBmbHVz
aGVzIG9yIG5vdC4gV2Ugc2hvdWxkCj4gPiA+ID4gPj4+IGFjY2VzcyBpbiBhIGNhY2hlYWJsZSB3
YXkgaW5zdGVhZCBvZiBtYWludGFpbmluZyBjYWNoZSBjb25zaXN0ZW5jeQo+ID4gPiA+ID4+PiBi
eSBzb2Z0d2FyZS4KPiA+ID4gPiA+Pj4KPiA+ID4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogWXVuaHVp
IEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4gPj4+IC0tLQo+ID4gPiA+ID4+
PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMgfCAyICstCj4gPiA+ID4gPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4+Pgo+ID4g
PiA+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvYWNwaS5jCj4gPiA+ID4gPj4+IGluZGV4IDZlMGQzMzNmNTdlNS4uMzE3N2M5YWY4
NzY0IDEwMDY0NAo+ID4gPiA+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMKPiA+
ID4gPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gPiA+ID4gPj4+IEBAIC0y
MTAsNyArMjEwLDcgQEAgdm9pZCBfX2luaXQgX19pb21lbSAqX19hY3BpX21hcF90YWJsZSh1bnNp
Z25lZCBsb25nIHBoeXMsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ID4gPiA+Pj4gICAgICAgIGlm
ICghc2l6ZSkKPiA+ID4gPiA+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiA+ID4g
Pj4+Cj4gPiA+ID4gPj4+IC0gICAgIHJldHVybiBlYXJseV9pb3JlbWFwKHBoeXMsIHNpemUpOwo+
ID4gPiA+ID4+PiArICAgICByZXR1cm4gZWFybHlfbWVtcmVtYXAocGh5cywgc2l6ZSk7Cj4gPiA+
ID4gPj4+ICAgIH0KPiA+ID4gPiA+Pj4KPiA+ID4gPiA+Pj4gICAgdm9pZCBfX2luaXQgX19hY3Bp
X3VubWFwX3RhYmxlKHZvaWQgX19pb21lbSAqbWFwLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gPiA+
ID4gPj4KPiA+ID4gPiA+PiBJdCBtYWtlcyBzZW5zZSB0byBtZSBzaW5jZSB3aXRoIHRoaXMsIHdl
IGRvbid0IGhhdmUgdG8gY2FyZSBhYm91dCBob3cKPiA+ID4gPiA+PiB0aGUgZmlybXdhcmUgbWFw
cGVkIHRoZSB0YWJsZS4gQW5kIGl0IG1pbWljcyBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcwo+ID4g
PiA+ID4+IChhcm02NCwgbG9vbmdhcmNoIGFuZCB4ODYpLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4g
SGVyZSBpcyB0aGUgY29ycmVzcG9uZGluZyBmaXhlcyB0YWc6Cj4gPiA+ID4gPj4KPiA+ID4gPiA+
PiBGaXhlczogM2I0MjZkNGI1YjE0ICgiUklTQy1WOiBBQ1BJIDogRml4IGZvciB1c2FnZSBvZiBw
b2ludGVycyBpbgo+ID4gPiA+ID4+IGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlIikKPiA+ID4gPiA+
Pgo+ID4gPiA+ID4+IFdpdGggdGhlIGNvcnJlc3BvbmRpbmcgZml4IGluIF9fYWNwaV91bm1hcF90
YWJsZSgpIGFzIHBvaW50ZWQgYnkgU3VuaWwsCj4gPiA+ID4gPj4geW91IGNhbiBhZGQ6Cj4gPiA+
ID4gPj4KPiA+ID4gPiA+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gQW5kIHJlZ2FyZGluZyB0aGUgc3Bh
cnNlIGVycm9yLCBJIGRvbid0IHNlZSBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlCj4gPiA+ID4gPj4g
Y2FzdGluZyB0byBfX2lvbWVtLCBzbyBtYXliZSB0aGF0J3Mgbm90IG5lY2Vzc2FyeSBhbnltb3Jl
Pwo+ID4gPiA+ID4gT0suIEkgd2lsbCBtYWtlIHRoZSBjaGFuZ2VzIGluIHYyLiBSZWdhcmRpbmcg
dGhlIHNwYXJzZSBlcnJvciwgSSB3aWxsCj4gPiA+ID4gPiB1c2UgYW5vdGhlciBwYXRjaCBzcGVj
aWZpY2FsbHkgdG8gc29sdmUgaXQuIElzIHRoYXQgb2theT8KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gSWYgdGhlIHNlY29uZCBwYXRjaCBvbmx5IGNvbnNpc3RzIGluIGNhc3RpbmcsIEkgd291bGQg
bm90IHVzZSBhbm90aGVyCj4gPiA+ID4gcGF0Y2ggc2luY2UgdGhlIHBhdGNoIDIgd291bGQgZml4
IHNvbWV0aGluZyBpbnRyb2R1Y2VkIGluIHBhdGNoIDEuCj4gPiA+ID4KPiA+ID4gPiBCdXQgaWYg
cGF0Y2ggMiBpcyBtb3JlIGNvbXBsaWNhdGVkLCAgaXQgbWF5IG1ha2Ugc2Vuc2UgdG8gZG8gYXMg
eW91Cj4gPiA+ID4gc3VnZ2VzdCwgdGhlIGdvYWwgaXMgdG8gbWVyZ2UgcGF0Y2ggMSBhc2FwLgo+
ID4gPgo+ID4gPiBSZWdhcmRpbmcgcGF0Y2ggMiwgSSBleGVjdXRlZCAibWFrZSAmIG1ha2UgaW5z
dGFsbCIgZm9yIHNwYXJzZSBvZiB0aGUKPiA+ID4gcmlzY3YgYXJjaC4gSSAiZ2l0IGNsb25lZCIg
ZnJvbQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vQ29uY2h1T0Qvc3BhcnNlLmdpdC4KPiA+ID4g
VGhlbiB3aGVuIGNvbXBpbGluZyB0aGUga2VybmVsLCB0aGUgZm9sbG93aW5nIGVycm9yIHdhcyBy
ZXBvcnRlZDoKPiA+ID4KPiA+ID4gY2QgL2RhdGEwMC9jeWgvbGludXgtbmV4dC8KPiA+ID4gbWFr
ZSBkZWZjb25maWcKPiA+ID4gY3AgLmNvbmZpZyBidWlsZC1yaXNjdjY0Lwo+ID4gPgo+ID4gPiBt
YWtlIE89YnVpbGQtcmlzY3Y2NC8gQz0xIFc9MSBhcmNoL3Jpc2N2L2tlcm5lbC8gZHJpdmVycy9h
Y3BpLwo+ID4gPiBkcml2ZXJzL21haWxib3gvIC1qCj4gPiA+IG1ha2VbMV06IEVudGVyaW5nIGRp
cmVjdG9yeSAnL2RhdGEwMC9jeWgvbGludXgtbmV4dC9idWlsZC1yaXNjdjY0Jwo+ID4gPiAgIEdF
TiAgICAgTWFrZWZpbGUKPiA+ID4gICBDQyAgICAgIHNjcmlwdHMvbW9kL2VtcHR5Lm8KPiA+ID4g
ICBDQyAgICAgIHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMucwo+ID4gPiAgIENIRUNL
ICAgLi4vc2NyaXB0cy9tb2QvZW1wdHkuYwo+ID4gPiBpbnZhbGlkIGFyZ3VtZW50IHRvICctbWFy
Y2gnOiAnX3ppY3NyX3ppZmVuY2VpJwo+ID4gPgo+ID4gPiBtYWtlWzNdOiAqKiogWy4uL3Njcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6MjI5OiBzY3JpcHRzL21vZC9lbXB0eS5vXSBFcnJvciAxCj4gPiA+
IG1ha2VbM106ICoqKiBEZWxldGluZyBmaWxlICdzY3JpcHRzL21vZC9lbXB0eS5vJwo+ID4gPiBt
YWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+ID4gPiBtYWtlWzJd
OiAqKiogWy9kYXRhMDAvY3loL2xpbnV4LW5leHQvTWFrZWZpbGU6MTIxNTogcHJlcGFyZTBdIEVy
cm9yIDIKPiA+ID4gbWFrZVsxXTogKioqIFsvZGF0YTAwL2N5aC9saW51eC1uZXh0L01ha2VmaWxl
OjIyNDogX19zdWItbWFrZV0gRXJyb3IgMgo+ID4gPgo+ID4gPiBEbyB5b3Uga25vdyB0aGUgc29s
dXRpb24/Cj4gPgo+ID4gSW4gY2FzZSB5b3UgZGlkIG5vdCBmaW5kIHRoZSBzb2x1dGlvbiB5ZXQs
IEkgd291bGQgc2F5IHRoYXQgeW91cgo+ID4gdG9vbGNoYWluIGlzIHRvbyBvbGQuCj4gPgo+ID4g
TGV0IG1lIGtub3cgaWYgSSBjYW4gaGVscCwKPiBJdCBtYXkgbm90IGJlIGEgcHJvYmxlbSBvZiBh
biBvbGQgY29tcGlsZXIuIFRoZSB2ZXJzaW9uIG9mIHRoZQo+IGNvbXBpbGVyIEkgYW0gdXNpbmcg
aXMgMTMuMi4KPiBJdCBpcyBhIHByb2JsZW0gd2l0aCBzcGFyc2UuIFdoZW4gcnVubmluZyAic3Bh
cnNlIC0tYXJjaD1yaXNjdgo+IC1tYXJjaD1ydjY0aW1hY196aWNzcl96aWZlbmNlaSBzY3JpcHRz
L21vZC9lbXB0eS5jIiwgdGhlcmUgaXMgYW4KPiBpbnZhbGlkIGFyZ3VtZW50IGZvciAnLW1hcmNo
JzogJ196aWNzcl96aWZlbmNlaScuCj4gCkhpIFl1bmh1aSwKCkkgdGhpbmsgeW91IG5lZWQgbGF0
ZXN0IHNwYXJzZS4gSSByZW1lbWJlciBidWlsZGluZyBzcGFyc2UgZnJvbSBsYXRlc3QKc291cmNl
cyB0byBhdm9pZCB0aGlzIGVycm9yLgoKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92
NC4xMS9kZXYtdG9vbHMvc3BhcnNlLmh0bWwKClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
