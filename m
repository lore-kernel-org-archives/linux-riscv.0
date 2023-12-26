Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC6C46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCUhHQ12QDgewEUriD4jgDxGW7oM+0qAVz7NkxyhZRo=; b=GZ2IWzB64RjjiV
	V5YTGKmEBH1hr0jhJeS4djSp4IzIu3vuXNLpyb5nTuc4Azt9okPi/GD6m175fOBPxCuLE6WQxJRmN
	XvO6xje7BgL8rIBuFzgJ70RFoZXFgoGgi2/VzL3ePH7DCY1RgpaWcwGAYaKiIPhYGGDtzk4ph4Xsu
	kX+WU+5zXSFbar+eDGCfSOzu66VM7rBevvlmwb2ptN+fMc6bxGSsu6Zm5NNXJ2SX/e15eiynBboYF
	WtUh+5YNKR87hZvljqNpBWh4aCkDITH6R6JRwQnAjGhX8LZtcex+h9dH0z9Kvtgcrk0deZN1fhqI+
	0wGRUGkt/lvtisNpJI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rICvs-00DPRo-06;
	Tue, 26 Dec 2023 19:17:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rICvo-00DPRE-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 19:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703618252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdK0f/0c2zILkHBv6UT22HiRXjmxzbBvzXxtAPGfC4Y=;
	b=LLQdKftOEMzOTrhnzdIxi/DP37vNXi+A+ffql3hZcvO0/PdWE1wTyjmZcsleBwmXcC20qt
	9nYzctwcmZebrDjtAs+Lnk/jFebRYPptnW7Z0cWqg64DtmHFYXb8z8Atgat80mE0wpLPCW
	bHcd//rS0Fv0tdqHl9cOM08PYH9H0Ew=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-OH2wIz-NNa-hsaGUFejcjQ-1; Tue, 26 Dec 2023 14:17:31 -0500
X-MC-Unique: OH2wIz-NNa-hsaGUFejcjQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-427a1de4fe5so85521601cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 11:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618251; x=1704223051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdK0f/0c2zILkHBv6UT22HiRXjmxzbBvzXxtAPGfC4Y=;
        b=wkViRXq85PylTGzPQPSu+XZB69p82ktCw2B4euTg4TDpoF4DiV981xgqH61oMammd/
         YQcZpQpcGxUnvc8RGY4UuACodxERCRg/xGnVkai3tGRWkDpfpTD5k/y5CUu8JJ40+EmV
         p9sUrlspB9yZcddow3/yscmM6YErtwzIip+QYMt5WQNXjCAwXPBRehWQgbm4Lkj5g2Ju
         vsHMKgM+Wj+5gkB/AgDxu33fH1RRPUTD0wojQH7POYhMFs18S+DjOsF/sVM8/NkS0ze+
         asKtVqbrtcpcS6r9CvkMTWGDdeikP4qwUFAiWv1IXP6kjPw3dDSPz/MaZArK+WCJ/dWN
         xfGg==
X-Gm-Message-State: AOJu0Yx0zCBgJXU0GXy6VROfB7pQaDxZ38dNkrlskLYkb99e9levpCRI
	CPqYTz3nbWaXY+oNSlR65bCEpTOwc6lQ+rEUFnfXG+2XNI2DFj9KJgl3OwDgxPWOaftlYxj4tw9
	be4eICRe7rkINLNjQoZ44KkfZ+y7R/lTvp91aLtuQOL4d9KKlcuAd
X-Received: by 2002:a05:622a:1208:b0:427:96be:c4e with SMTP id y8-20020a05622a120800b0042796be0c4emr11564714qtx.66.1703618250928;
        Tue, 26 Dec 2023 11:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1eLOcp+E0yHa8VriPMM/d17V5DFXgjeZMlmedQhw8c1Be94njKTay/7N0fFvPLqfEvqTfpb42Dh35qfEwkPQ=
X-Received: by 2002:a05:622a:1208:b0:427:96be:c4e with SMTP id
 y8-20020a05622a120800b0042796be0c4emr11564704qtx.66.1703618250614; Tue, 26
 Dec 2023 11:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-3-leobras@redhat.com>
 <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com>
 <ZYXDdlF1CFNpDdiV@LeoBras> <CABgGipWmidzhf3PqyK9FWQCmKAuS9H31XECTL5XYjSL5m1Es4g@mail.gmail.com>
In-Reply-To: <CABgGipWmidzhf3PqyK9FWQCmKAuS9H31XECTL5XYjSL5m1Es4g@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Dec 2023 16:17:19 -0300
Message-ID: <CAJ6HWG5ooodxwi0HE7GVu4ffVETYPdTQJBzvsMcC6MJ6x1Ja_w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] riscv: add compile-time test into is_compat_task()
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Oleg Nesterov <oleg@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Greg Ungerer <gerg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_111736_918404_3C2EDF11 
X-CRM114-Status: GOOD (  29.26  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMToxNeKAr0FNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMToxMuKAr0FNIExl
b25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBE
ZWMgMjIsIDIwMjMgYXQgMDU6MzU6MjBQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+ID4gT24g
RnJpLCBEZWMgMjIsIDIwMjMgYXQgNTowMuKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBDdXJyZW50bHkgc2V2ZXJhbCBwbGFjZXMg
d2lsbCB0ZXN0IGZvciBDT05GSUdfQ09NUEFUIGJlZm9yZSB0ZXN0aW5nCj4gPiA+ID4gaXNfY29t
cGF0X3Rhc2soKSwgcHJvYmFibHkgaW4gb3JkZXIgdG8gYXZvaWQgYSBydW4tdGltZSB0ZXN0IGlu
dG8gdGhlIHRhc2sKPiA+ID4gPiBzdHJ1Y3R1cmUuCj4gPiA+ID4KPiA+ID4gPiBTaW5jZSBpc19j
b21wYXRfdGFzaygpIGlzIGFuIGlubGluZWQgZnVuY3Rpb24sIGl0IHdvdWxkIGJlIGhlbHBmdWwg
dG8gYWRkIGEKPiA+ID4gPiBjb21waWxlLXRpbWUgdGVzdCBvZiBDT05GSUdfQ09NUEFULCBtYWtp
bmcgc3VyZSBpdCBhbHdheXMgcmV0dXJucyB6ZXJvIHdoZW4KPiA+ID4gPiB0aGUgb3B0aW9uIGlz
IG5vdCBlbmFibGVkIGR1cmluZyB0aGUga2VybmVsIGJ1aWxkLgo+ID4gPiA+Cj4gPiA+ID4gV2l0
aCB0aGlzLCB0aGUgY29tcGlsZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kIGluIGJ1aWxkLXRpbWUg
dGhhdAo+ID4gPiA+IGlzX2NvbXBhdF90YXNrKCkgd2lsbCBhbHdheXMgcmV0dXJuIDAsIGFuZCBv
cHRpbWl6ZS1vdXQgc29tZSBvZiB0aGUgZXh0cmEKPiA+ID4gPiBjb2RlIGludHJvZHVjZWQgYnkg
dGhlIG9wdGlvbi4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgd2lsbCBhbHNvIGFsbG93IHJlbW92aW5n
IGEgbG90ICNpZmRlZnMgdGhhdCB3ZXJlIGludHJvZHVjZWQsIGFuZCBtYWtlCj4gPiA+ID4gdGhl
IGNvZGUgbW9yZSBjbGVhbi4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRv
IEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jb21wYXQuaCAgICB8IDMgKysrCj4gPiA+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZWxmLmggICAgICAgfCA0IC0tLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggICB8IDYgLS0tLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmggfCA0ICsrLS0KPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nv
bXBhdC5oCj4gPiA+ID4gaW5kZXggMmFjOTU1YjUxMTQ4Zi4uOTE1MTdiNTFiOGUyNyAxMDA2NDQK
PiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gPiA+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+ID4gPiA+IEBAIC0xNCw2ICsxNCw5
IEBACj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3Rhc2sodm9p
ZCkKPiA+ID4gPiAgewo+ID4gPiA+ICsgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19DT01Q
QVQpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiArCj4gPiA+ID4g
ICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpOwo+ID4gPiA+ICB9Cj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiA+ID4gPiBpbmRleCA1OWEwODM2N2ZkZGQ3
Li4yZTg4MjU3Y2FmYWVhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZWxmLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gPiA+
ID4gQEAgLTUzLDEzICs1Myw5IEBAIGV4dGVybiBib29sIGNvbXBhdF9lbGZfY2hlY2tfYXJjaChF
bGYzMl9FaGRyICpoZHIpOwo+ID4gPiA+ICAjZGVmaW5lIEVMRl9FVF9EWU5fQkFTRSAgICAgICAg
ICAgICAgICAoKERFRkFVTFRfTUFQX1dJTkRPVyAvIDMpICogMikKPiA+ID4gPgo+ID4gPiA+ICAj
aWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ID4gLSNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+ID4g
ICNkZWZpbmUgU1RBQ0tfUk5EX01BU0sgICAgICAgICAoaXNfY29tcGF0X3Rhc2soKSA/IFwKPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDdmZiA+PiAoUEFHRV9TSElG
VCAtIDEyKSA6IFwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDNm
ZmZmID4+IChQQUdFX1NISUZUIC0gMTIpKQo+ID4gPiA+IC0jZWxzZQo+ID4gPiA+IC0jZGVmaW5l
IFNUQUNLX1JORF9NQVNLICAgICAgICAgKDB4M2ZmZmYgPj4gKFBBR0VfU0hJRlQgLSAxMikpCj4g
PiA+ID4gLSNlbmRpZgo+ID4gPiA+ICAjZW5kaWYKPiA+ID4gPgo+ID4gPiA+ICAvKgo+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ID4gaW5kZXggMWQ0NzJiMzFlMGNmZS4uZWE1
YjI2OWJlMjIzYSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
PiA+ID4gQEAgLTEyNywxNiArMTI3LDEwIEBACj4gPiA+ID4gICNkZWZpbmUgVkFfVVNFUl9TVjQ4
IChVTCgxKSA8PCAoVkFfQklUU19TVjQ4IC0gMSkpCj4gPiA+ID4gICNkZWZpbmUgVkFfVVNFUl9T
VjU3IChVTCgxKSA8PCAoVkFfQklUU19TVjU3IC0gMSkpCj4gPiA+ID4KPiA+ID4gPiAtI2lmZGVm
IENPTkZJR19DT01QQVQKPiA+ID4gPiAgI2RlZmluZSBNTUFQX1ZBX0JJVFNfNjQgKChWQV9CSVRT
ID49IFZBX0JJVFNfU1Y0OCkgPyBWQV9CSVRTX1NWNDggOiBWQV9CSVRTKQo+ID4gPiA+ICAjZGVm
aW5lIE1NQVBfTUlOX1ZBX0JJVFNfNjQgKFZBX0JJVFNfU1YzOSkKPiA+ID4gPiAgI2RlZmluZSBN
TUFQX1ZBX0JJVFMgKGlzX2NvbXBhdF90YXNrKCkgPyBWQV9CSVRTX1NWMzIgOiBNTUFQX1ZBX0JJ
VFNfNjQpCj4gPiA+ID4gICNkZWZpbmUgTU1BUF9NSU5fVkFfQklUUyAoaXNfY29tcGF0X3Rhc2so
KSA/IFZBX0JJVFNfU1YzMiA6IE1NQVBfTUlOX1ZBX0JJVFNfNjQpCj4gPiA+ID4gLSNlbHNlCj4g
PiA+ID4gLSNkZWZpbmUgTU1BUF9WQV9CSVRTICgoVkFfQklUUyA+PSBWQV9CSVRTX1NWNDgpID8g
VkFfQklUU19TVjQ4IDogVkFfQklUUykKPiA+ID4gPiAtI2RlZmluZSBNTUFQX01JTl9WQV9CSVRT
IChWQV9CSVRTX1NWMzkpCj4gPiA+ID4gLSNlbmRpZiAvKiBDT05GSUdfQ09NUEFUICovCj4gPiA+
ID4gLQo+ID4gPiA+ICAjZWxzZQo+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUtMzIuaD4K
PiA+ID4gPiAgI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+ID4gPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+ID4gPiA+IGluZGV4IGYxOWY4NjFjZGE1NDkuLmVkMzJlNTNlNTU5OTkg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+
ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ID4gPiBA
QCAtMjIsNyArMjIsNyBAQAo+ID4gPiA+ICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gICAgICAgICB1bnNpZ25l
ZCBsb25nIG1tYXBfZW5kOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4g
PiAgICAgICAgIHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gPiA+IC0gICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxF
RChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ID4gPiA+ICsgICAgICAg
aWYgKChfYWRkcikgPT0gMCB8fCBpc19jb21wYXRfdGFzaygpKSAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gICAgICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gPiAgICAgICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFf
VVNFUl9TVjU3KSAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+
ID4gQEAgLTM5LDcgKzM5LDcgQEAKPiA+ID4gPiAgICAgICAgIHR5cGVvZihhZGRyKSBfYWRkciA9
IChhZGRyKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAgICAgICAgdHlw
ZW9mKGJhc2UpIF9iYXNlID0gKGJhc2UpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIHJuZF9nYXAgPSBERUZBVUxUX01BUF9XSU5ET1cg
LSAoX2Jhc2UpOyAgIFwKPiA+ID4gPiAtICAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VO
QUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiA+ID4gPiArICAg
ICAgIGlmICgoX2FkZHIpID09IDAgfHwgaXNfY29tcGF0X3Rhc2soKSkgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiA+ICAgICAgICAgICAgICAgICBtbWFwX2Jhc2UgPSAoX2Jhc2UpOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gICAgICAgICBlbHNlIGlmICgoKF9hZGRyKSA+
PSBWQV9VU0VSX1NWNTcpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y1NykpIFwKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgbW1hcF9iYXNlID0gVkFfVVNFUl9TVjU3IC0gcm5kX2dhcDsgICAgICAg
ICAgICAgXAo+ID4gPiA+IC0tCj4gPiA+ID4gMi40My4wCj4gPiA+ID4KPiA+ID4gUmV2aWV3ZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4KPiA+IFRoYW5rcyEKPiA+IExlbwo+
ID4KPiA+ID4KPiA+ID4gLS0KPiA+ID4gQmVzdCBSZWdhcmRzCj4gPiA+ICBHdW8gUmVuCj4gPiA+
Cj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4K
ClRoYW5rcyBBbmR5IQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
