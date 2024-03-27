Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB563C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEBIzeNBjyB6w6Mwmdjm0Ga/0Fip/TS4SAJwiSAyAPs=; b=lP96yMxwilBAVR
	DNIn/siETJ0uPLyxIzw1TDUJtWYMi02yzY8pPmGI7nzkm1pn6Dd6aTmpgjdtujrkI0VSWCKYtY0E3
	mLoCCZ70jZQmn0sLJjOyYYl04ypmsqhPqjKS7wK1xSoZ8dDmv64o8mh+LGpc7j9AN18akTax1Wp6P
	sMqPwa6nZhybqLe+1gnBxHa1fZV530YsdH5/JZEeUXfkpwidE5sEPQuEGdvN1CodxQmcr3ptwRkL0
	SKTD4nWyJc208PBzOLxQaGxYMHM6nAoVUjISAfBPohxJm5CoWIOeAwE7FD7mxGXPW/M9MDrR7z3Cd
	fKoGm3GRBlihZsT38+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOAt-00000007vd0-1ZoQ;
	Wed, 27 Mar 2024 07:58:19 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOAq-00000007vbV-27HR
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 07:58:17 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e6d089f603so2109049a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711526293; x=1712131093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buArJPLlnPB5EIrSoptLXad98trwHBEhYaxknXdrCRM=;
        b=M+mTaJSGyss8QyfrXR3lj5WTLh2nkc37q/kt/6CjA62nDBgpVeji/lVBN/UmXWJspH
         fKFBDwGhhiXPPtXB3rfzVP5RCYg7eIVDEplKv2J2LlfzrDaYjDrEQTIz4tSycFBHSRof
         CzHYfXPOme4eoPjLms0JGu8kAKPE34sGZi9va7+OujPbm0JJuMx/FK7yRckq66GqcdF0
         Kla3O44nRh7gZGZJ98rxrbVefprYC7dWog/RihAE47p4SMOfuTOjjVtodfx8kc8oVPa6
         SgvmSO0TcaEJYA2MHIQBxHouweYLK44dPH9F6zo/D+ew86OiBShuSaG+a7LSc+LDNvjg
         NOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526293; x=1712131093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buArJPLlnPB5EIrSoptLXad98trwHBEhYaxknXdrCRM=;
        b=nYhbj2Ns7fnAzOaEu0iJnmGBzfcCZLO38fqOgKOiD5NP05YfC1wxy7l5CMMa8TvCDS
         26j1xERuK/TNtZnb0Q1Nj60wD/CJzis9O0hiczmXXjhMDv2LvGqm7d9xJrVsg9tBSzU6
         4wRpkUwI3i9fZaoatRnYn2o9kg7BC2lojttkB0hlxLDgaxoZn/Pm7KcLmM6ydTn7IIvV
         fblks+jUJJ8WqwKu6mYQaGQoMjhQETceyCKLrS9lPyt+in6rg/sCYBdDwoZcXR+iZC0k
         00/Wnl3z6Wlx0Z6lcS5BgKr1HGDw39BGL4MK329oS8QiaDyn32RvcLf6EpFFbVCG70Ng
         4V6A==
X-Forwarded-Encrypted: i=1; AJvYcCWsQTrIKXtyoasApl3uisbWKy/asgmb19AgZxad17QAkN4xXQAAT8oFyZ8Vf15zB50Ko/9HY/qowdbUusVK8C0J1C/att+rcgYFJ+32wyxV
X-Gm-Message-State: AOJu0YyAcZ8tjsuNCzuWbevfZpAWpd5z8DKFa8IKh1VOBJN7iIV56frO
	/LuTmZJ1QlizaZ4NbpAndyJPfjr+H6Fkkg+ELEf1K7G4wlil6A8uLUxMc1e55xjZMmpW9s37f//
	K//An4F9EiKZXBwe3M8CebKe8OMvPF9FBtDUvcA==
X-Google-Smtp-Source: AGHT+IFvJOK0KuWjR42wxMSa9dp2bPq3Ot/Nwj6HB+3ZV4WEBddR87Irr/dviDFOz0/CEBtTnttdt9WCRLoGI9IEIvc=
X-Received: by 2002:a05:6870:2194:b0:229:ef48:8c67 with SMTP id
 l20-20020a056870219400b00229ef488c67mr5276811oae.41.1711526292858; Wed, 27
 Mar 2024 00:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240325164021.3229-1-jszhang@kernel.org> <20240325164021.3229-3-jszhang@kernel.org>
 <b063df9b-90b6-4f06-8be5-5a8c267e6c8d@sifive.com> <ZgL31BFWvaLwYQrN@xhacker>
In-Reply-To: <ZgL31BFWvaLwYQrN@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 27 Mar 2024 15:58:01 +0800
Message-ID: <CAEEQ3w=NZ5YR8bsOKdhLfeGk7u-7rUHGYA2mvcoO1o-ZaZT-jQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 2/5] riscv: nommu: use CSR_TIME* for
 get_cycles* implementation
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_005816_569469_A65E2CBD 
X-CRM114-Status: GOOD (  32.07  )
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

SGkgSmlzaGVuZywKCk9uIFdlZCwgTWFyIDI3LCAyMDI0IGF0IDEyOjQz4oCvQU0gSmlzaGVuZyBa
aGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDI1LCAyMDI0
IGF0IDA5OjM5OjI2UE0gLTA1MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gSGkgSmlzaGVu
ZywKPiA+Cj4gPiBPbiAyMDI0LTAzLTI1IDExOjQwIEFNLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+
ID4gPiBQZXIgcmlzY3YgcHJpdmlsZWdlZCBzcGVjLCAiVGhlIHRpbWUgQ1NSIGlzIGEgcmVhZC1v
bmx5IHNoYWRvdyBvZiB0aGUKPiA+ID4gbWVtb3J5LW1hcHBlZCBtdGltZSByZWdpc3RlciIsICJP
biBSVjMySSB0aGUgdGltZWggQ1NSIGlzIGEgcmVhZC1vbmx5Cj4gPiA+IHNoYWRvdyBvZiB0aGUg
dXBwZXIgMzIgYml0cyBvZiB0aGUgbWVtb3J5LW1hcHBlZCBtdGltZSByZWdpc3Rlciwgd2hpbGUK
PiA+ID4gdGltZSBzaGFkb3dzIG9ubHkgdGhlIGxvd2VyIDMyIGJpdHMgb2YgbXRpbWUuIiBTaW5j
ZSBnZXRfY3ljbGVzKCkgb25seQo+ID4gPiByZWFkcyB0aGUgdGltZXIsIGl0J3MgZmluZSB0byB1
c2UgQ1NSX1RJTUUgdG8gaW1wbGVtZW50IGdldF9jeWNsZXMoKS4KPiA+Cj4gPiBVbmZvcnR1bmF0
ZWx5IHRoZXJlIGFyZSB2YXJpb3VzIGltcGxlbWVudGF0aW9ucyAoZS5nLiBGVTc0MC9Vbm1hdGNo
ZWQsIHByb2JhYmx5Cj4gPiBLMjEwIHdoaWNoIHRoaXMgY29kZSB3YXMgb3JpZ2luYWxseSB1c2Vk
IGZvcikgd2hpY2ggZG8gbm90IGltcGxlbWVudCB0aGUgdGltZQo+ID4gQ1NSLCByZWx5aW5nIG9u
IE0tbW9kZSBzb2Z0d2FyZSB0byBlbXVsYXRlIHRoZSBDU1Igc28gUy1tb2RlIHNvZnR3YXJlIGRv
ZXNuJ3QKPiA+IG5vdGljZS4gU28gdGhpcyBjb2RlIGlzIG5lZWRlZCB0byBzdXBwb3J0IHRob3Nl
IHBsYXRmb3JtcyB3aGVuIHJ1bm5pbmcgTGludXggaW4KPiA+IE0tbW9kZS4KPgo+IE9PUFMsIEkg
a25ldyB0aGlzIGZvciB0aGUgZmlyc3QgdGltZSB0aGVyZSBhcmUgc3VjaCBpbXBsZW1lbnRhdGlv
bnMKPiB3aGljaCBkb2Vzbid0IGltcGxlbWVudCB0aGUgVElNRSBDU1IgOigKPgo+ID4KPiA+IE1h
eWJlIHRoZXJlIHNob3VsZCBiZSBhbiBvcHRpb24gdG8gYXNzdW1lIHRoZSB0aW1lIENTUiBpcy9p
cyBub3QgaW1wbGVtZW50ZWQsCj4gPiBsaWtlIHRoZXJlIGlzIGZvciBtaXNhbGlnbmVkIGFjY2Vz
cz8KPgo+IFllcCwgdGhpcyBzZWVtcyB0aGUgb25seSBzb2x1dGlvbi4gVGhlbiB3aGljaCBzaG91
bGQgYmUgdGhlIGRlZmF1bHQKPiBjaG9pY2U/IEkuRQo+Cj4gQXNzdW1lIGFsbCBOT01NVSBnb2Vz
IHRocm91Z2ggVElNRSBDU1IsIGFuZCBwcm92aWRlIGFuIG9wdGlvbiBmb3IKPiBwbGF0Zm9ybSBs
YWNraW5nIG9mIFRJTUUgQ1NSLiBUaGlzIHByZWZlcnMgVElNRSBDU1IuCj4KPiBWUy4KPgo+IEJ5
IGRlZmF1bHQsIE1USU1FIGlzIHVzZWQsIGFuZCBwcm92aWRlIG9uZSBLY29uZmlnIG9wdGlvbiBm
b3IgVElNRSBDU1IKPiB1c2FnZS4gVGhpcyBwcmVmZXJzIE1USU1FCj4KPiB3aGljaCBjaG9pY2Ug
aXMgYmV0dGVyPyBBbnkgc3VnZ2VzdGlvbj8KPgo+IFRoYW5rcyBpbiBhZHZhbmNlCj4KPiA+Cj4g
PiBSZWdhcmRzLAo+ID4gU2FtdWVsCj4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS90aW1leC5oIHwgNDAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQwIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aW1leC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aW1leC5oCj4gPiA+IGluZGV4IGEwNjY5Nzg0NmU2OS4uYTNmYjg1ZDUwNWQ0IDEwMDY0
NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RpbWV4LmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aW1leC5oCj4gPiA+IEBAIC0xMCw0NCArMTAsNiBAQAo+
ID4gPgo+ID4gPiAgdHlwZWRlZiB1bnNpZ25lZCBsb25nIGN5Y2xlc190Owo+ID4gPgo+ID4gPiAt
I2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKPiA+ID4gLQo+ID4gPiAtI2luY2x1ZGUgPGFzbS9j
bGludC5oPgo+ID4gPiAtCj4gPiA+IC0jaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+IC1zdGF0aWMg
aW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkKPiA+ID4gLXsKPiA+ID4gLSAgIHJldHVy
biByZWFkcV9yZWxheGVkKGNsaW50X3RpbWVfdmFsKTsKPiA+ID4gLX0KPiA+ID4gLSNlbHNlIC8q
ICFDT05GSUdfNjRCSVQgKi8KPiA+ID4gLXN0YXRpYyBpbmxpbmUgdTMyIGdldF9jeWNsZXModm9p
ZCkKPiA+ID4gLXsKPiA+ID4gLSAgIHJldHVybiByZWFkbF9yZWxheGVkKCgodTMyICopY2xpbnRf
dGltZV92YWwpKTsKPiA+ID4gLX0KPiA+ID4gLSNkZWZpbmUgZ2V0X2N5Y2xlcyBnZXRfY3ljbGVz
Cj4gPiA+IC0KPiA+ID4gLXN0YXRpYyBpbmxpbmUgdTMyIGdldF9jeWNsZXNfaGkodm9pZCkKPiA+
ID4gLXsKPiA+ID4gLSAgIHJldHVybiByZWFkbF9yZWxheGVkKCgodTMyICopY2xpbnRfdGltZV92
YWwpICsgMSk7Cj4gPiA+IC19Cj4gPiA+IC0jZGVmaW5lIGdldF9jeWNsZXNfaGkgZ2V0X2N5Y2xl
c19oaQo+ID4gPiAtI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+ID4gPiAtCj4gPiA+IC0vKgo+
ID4gPiAtICogTXVjaCBsaWtlIE1JUFMsIHdlIG1heSBub3QgaGF2ZSBhIHZpYWJsZSBjb3VudGVy
IHRvIHVzZSBhdCBhbiBlYXJseSBwb2ludAo+ID4gPiAtICogaW4gdGhlIGJvb3QgcHJvY2Vzcy4g
VW5mb3J0dW5hdGVseSB3ZSBkb24ndCBoYXZlIGEgZmFsbGJhY2ssIHNvIGluc3RlYWQKPiA+ID4g
LSAqIHdlIGp1c3QgcmV0dXJuIDAuCj4gPiA+IC0gKi8KPiA+ID4gLXN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyByYW5kb21fZ2V0X2VudHJvcHkodm9pZCkKPiA+ID4gLXsKPiA+ID4gLSAgIGlm
ICh1bmxpa2VseShjbGludF90aW1lX3ZhbCA9PSBOVUxMKSkKPiA+ID4gLSAgICAgICAgICAgcmV0
dXJuIHJhbmRvbV9nZXRfZW50cm9weV9mYWxsYmFjaygpOwo+ID4gPiAtICAgcmV0dXJuIGdldF9j
eWNsZXMoKTsKPiA+ID4gLX0KPiA+ID4gLSNkZWZpbmUgcmFuZG9tX2dldF9lbnRyb3B5KCkgICAg
ICAgcmFuZG9tX2dldF9lbnRyb3B5KCkKPiA+ID4gLQo+ID4gPiAtI2Vsc2UgLyogQ09ORklHX1JJ
U0NWX01fTU9ERSAqLwo+ID4gPiAtCj4gPiA+ICBzdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9j
eWNsZXModm9pZCkKPiA+ID4gIHsKPiA+ID4gICAgIHJldHVybiBjc3JfcmVhZChDU1JfVElNRSk7
Cj4gPiA+IEBAIC02MCw4ICsyMiw2IEBAIHN0YXRpYyBpbmxpbmUgdTMyIGdldF9jeWNsZXNfaGko
dm9pZCkKPiA+ID4gIH0KPiA+ID4gICNkZWZpbmUgZ2V0X2N5Y2xlc19oaSBnZXRfY3ljbGVzX2hp
Cj4gPiA+Cj4gPiA+IC0jZW5kaWYgLyogIUNPTkZJR19SSVNDVl9NX01PREUgKi8KPiA+ID4gLQo+
ID4gPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ID4gPiAgc3RhdGljIGlubGluZSB1NjQgZ2V0X2N5
Y2xlczY0KHZvaWQpCj4gPiA+ICB7Cj4gPgo+CgpJJ2QgbGlrZSB0byB0YWtlIHRoaXMgdGhyZWFk
IHRvIGFzazoKY3NyX3JlYWQoQ1NSX1RJTUUpIHJldHVybnMgYSB0aW1lc3RhbXAsIHJpZ2h0PyBT
byB3aHkgaXMgdGhlIGZ1bmN0aW9uCm5hbWUgZ2V0X2N5Y2xlcygpPyBJbnN0ZWFkIG9mIGdldF90
aW1lc3RhbXAoKT8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
