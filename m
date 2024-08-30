Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00164CA0EE1
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5on3CKLQXEAhTf9mNv9D4eysrFdKhKfddfpVESf6Z9Y=; b=Iup+j3ceeKbnIM
	YAlBXQPmMlGejl3cNlHAr0i0+ndr+r64PhENrV6p66/AimfFarL0ZW5FawK8UkRjruoMXNVvjPYJg
	TcbgNMeCu+75oAPVKsnGbdy9GK3Knnf1ek0WnQR/yBaWGP1K9+3hAxQuB9Gyobqd40sUXHebTU7U0
	rN+OyVQvK/P1R2DrB8rH8l4NBITN2UzXQclJByXD7NuiEBlZqyZhUS0JyAXLTvC3rW/wOZvDsPi7W
	HUM2x2yUu0mXI2Ju8N87YYMYiMRDyZlW3onZ58PtzhwtZbc0KScEtf5D5IdvHoJm9mwkJg+h2jhj4
	jRNB+W9vUJWVvIdGECtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuZk-00000004rqk-0Ukr;
	Fri, 30 Aug 2024 05:53:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuZi-00000004rqR-0oi6
	for linux-riscv@bombadil.infradead.org;
	Fri, 30 Aug 2024 05:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T3Jt+xqdS9PmDCVfg7T2ZaIXSXLuqHnsCyhxBsg/hkk=; b=Yfcbus0S8OKw4I15XZdsqliiB+
	kZ/UDc2mK3PLLvu1EnlLIuu76qg+zNkL75QXFpx+MngMyEMcerSiewZCJ4UCFKOWrgRcACCW49GUE
	r6xPKHkyAS/sEqMRkLJPCZHcLbBEEI4rxjmPmABaK16vFtEEApjyGNUq/vqjdNsJT7Rn0e0LW3G15
	Z9LhB2fPaaUZ9MrzrVRIeqy6zi7lttAChnmtKbUMW+Q3L/5dbA+iIuzeG/f6XXWcMUdXneK1TIj4L
	cTUZG4/QQwQb6HiF5t3+CDQqYjvQOmzixts4c5N/txnWCxeKq+3iX2DCuS7OeBilYTIZpNDpZHqsm
	8f1T9/3w==;
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuZZ-0000000BZhX-2PQp
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 05:53:27 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3df0b748e08so752999b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 22:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724997202; x=1725602002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3Jt+xqdS9PmDCVfg7T2ZaIXSXLuqHnsCyhxBsg/hkk=;
        b=QYfKzzQIElmFbvCnHmEQsRp34JM1E/y+/XtTaij/jnM8Xnch9YhZIltHjNMbzQcUrP
         1gDxcm77UhePCV+kWR90Ex8pK8QAHX/Tb4g9uqYrq3ANLOBw2mV3qQpynxYtXRq99Vha
         0m9M1i9eRjtT88RZ27Jzm8aZ+3yvuijHttuS6fQFiLy76c/CwqIR1a02mRTQdsukB6nz
         903gbPgN9vOxg6d1hq58a7lfiAs7y58zwiotYOog2bmFIrc+i6FMBpT4YPl0bfxiu13V
         5DKuMJqZ1KYzMXdrXYZYemsmKun+oBrFzDlIlld481fYzgVH0GP11PJ3puLiDvfVRgfy
         E9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997202; x=1725602002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3Jt+xqdS9PmDCVfg7T2ZaIXSXLuqHnsCyhxBsg/hkk=;
        b=Mtv0/ggK0IXVxmnzeZCardyq/ASS3yu5SEyZkt49c6O1o3N95pUJccKBE3aylmWiz7
         wVyF1sJODOm6Ny3Ok7TSMx315NV6/wscie0fkGQdiQh9Ot9EwlZoKcyD7aRmvIR+NvJ8
         WRsAtBJS8jJh0v947dPxlNahh6Itbxw7a2wb85TmCWxuOGQatr5t0wNJvIieNxjSUi2v
         RI6IFQCuUqKIdq562bXFC3Vxj8mTNdEeaYXo0OzZbHldzA7qfi1DxgpM2Q0Gwf0/Dv3f
         1JJLcNoaVRAdRmLccrwVl6MXX/3UY0pshvBu6uuL4Wi2NFE0+7M3jnAJol0Khvh9omul
         z1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW2LG1Mnlv+Fn/f+ZzvXu4CVgMoLny+ZyUqsC3R5ABdWDFZTwAa/JF8f0Qc3sS4l/8rpYMV9XDCD8BAng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8bbVUtUA0UlRD/k+6M2thw2PbtokrMVMqrcHK1oJOZkl6EFv/
	bA0Izf1CrTrybZMx1A/0Zt1CkVS9GDKMDJNRCAsrfDhNr/D6sNVwpPxe23KYFXmiUd6rrNFewNE
	Df5rDOOWRWHa7j/eBwAyDo/ZAIfSXpjfvJMYhxw==
X-Google-Smtp-Source: AGHT+IH6bpYCNGGrkPgr+I0PGiNrrtq4i4l0rhoyVcVkBQzkAFDJbUNNEJuggk2fcve7C32y2tW3EhGtZ8PKnDywHKA=
X-Received: by 2002:a05:6808:222a:b0:3df:101c:cc38 with SMTP id
 5614622812f47-3df1285dc3fmr489365b6e.1.1724997201924; Thu, 29 Aug 2024
 22:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-2-nick.hu@sifive.com>
 <20240829-fb7bda6b46302b65b2f89d20@orel>
In-Reply-To: <20240829-fb7bda6b46302b65b2f89d20@orel>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 30 Aug 2024 13:53:11 +0800
Message-ID: <CAKddAkBks46LEdmFfkDuwoCc-kxcf1KpghiROuh-JeNorHrMRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Add stimecmp save and restore
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_065325_960018_82CAF399 
X-CRM114-Status: GOOD (  24.80  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW5kcmV3CgpPbiBUaHUsIEF1ZyAyOSwgMjAyNCBhdCAzOjU54oCvUE0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAyOSwgMjAy
NCBhdCAxMTozODo1OUFNIEdNVCwgTmljayBIdSB3cm90ZToKPiA+IElmIHRoZSBIVyBzdXBwb3J0
IHRoZSBTU1RDIGV4dGVuc2lvbiwgd2Ugc2hvdWxkIHNhdmUgYW5kIHJlc3RvcmUgdGhlCj4gPiBz
dGltZWNtcCByZWdpc3RlciB3aGlsZSBjcHUgbm9uIHJldGVudGlvbiBzdXNwZW5kLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5oIHwgIDQgKysrKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL3N1c3BlbmQuYyAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3N1c3BlbmQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5o
Cj4gPiBpbmRleCA0ZmZiMDIyYjA5N2YuLmZmYWFjMmVmYWJiNSAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3VzcGVuZC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N1c3BlbmQuaAo+ID4gQEAgLTE2LDYgKzE2LDEwIEBAIHN0cnVjdCBzdXNwZW5kX2Nv
bnRleHQgewo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBlbnZjZmc7Cj4gPiAgICAgICB1bnNpZ25l
ZCBsb25nIHR2ZWM7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGllOwo+ID4gKyNpZiBfX3Jpc2N2
X3hsZW4gPCA2NAo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBzdGltZWNtcGg7Cj4gPiArI2VuZGlm
Cj4KPiBJJ20gbm90IHN1cmUgdGhlIHJlZHVjdGlvbiBpbiBzdHJ1Y3Qgc2l6ZSBpcyB3b3J0aCB0
aGUgI2lmZGVmZmVyeS4gSWYgd2UKPiBqdXN0IGFsd2F5cyBhZGQgc3RpbWVjbXBoLCB0aGVuIHdl
IGNhbiBhbHNvIGNoYW5nZSB0aGUgI2lmZGVmJ3MgYmVsb3cgdG8KPiBpZidzLCBpLmUuIGlmIChf
X3Jpc2N2X3hsZW4gPCA2NCksIHdoaWNoIHNob3VsZCBzdGlsbCByZW1vdmUgdGhlIGNvZGUgZnJv
bQo+IDY0LWJpdCBidWlsZHMuCj4KPiBPciBtYXliZSB3ZSBuZWVkIHNvbWV0aGluZyBsaWtlCj4K
PiAjaWYgX19yaXNjdl94bGVuIDwgNjQKPiAjZGVmaW5lIGNzcmhfd3JpdGUociwgdikgY3NyX3dy
aXRlKHIsIHYpCj4gI2Vsc2UKPiAjZGVmaW5lIGNzcmhfd3JpdGUociwgdikKPiAjZW5kaWYKPgo+
IGluIGFzbS9jc3IuaCBhbmQgdGhlbiB1c2UgaXQgZm9yIGFsbCB0aGUgKmggY3NycywgYnV0IGtl
ZXAgdGhlICNpZiBpbgo+IHRoZSBzdHJ1Y3QuCj4KPiBUaGFua3MsCj4gZHJldwo+CklmIG5vIG90
aGVyIGNvbW1lbnQsIEknbGwgY2hvb3NlIHRoZSBjc3JoX3dyaXRlKCkgYmVjYXVzZSBpdCBjYW4g
c2F2ZQpzb21lIG1lbW9yeSBhbmQgdXBkYXRlIGluIHRoZSBuZXh0IHZlcnNpb24uClRoYW5rcyBm
b3IgdGhlIHN1Z2dlc3Rpb24hCgo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBzdGltZWNtcDsKPiA+
ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBzYXRwOwo+ID4gICNl
bmRpZgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gaW5kZXggYzhjZWMwY2M1ODMzLi4zYWZkODZlMWFi
ZjcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gQEAgLTE5LDYgKzE5LDEyIEBAIHZvaWQg
c3VzcGVuZF9zYXZlX2NzcnMoc3RydWN0IHN1c3BlbmRfY29udGV4dCAqY29udGV4dCkKPiA+ICAg
ICAgIGNvbnRleHQtPnR2ZWMgPSBjc3JfcmVhZChDU1JfVFZFQyk7Cj4gPiAgICAgICBjb250ZXh0
LT5pZSA9IGNzcl9yZWFkKENTUl9JRSk7Cj4gPgo+ID4gKyAgICAgaWYgKHJpc2N2X2hhc19leHRl
bnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TU1RDKSkgewo+ID4gKyAgICAgICAgICAgICBj
b250ZXh0LT5zdGltZWNtcCA9IGNzcl9yZWFkKENTUl9TVElNRUNNUCk7Cj4gPiArI2lmIF9fcmlz
Y3ZfeGxlbiA8IDY0Cj4gPiArICAgICAgICAgICAgIGNvbnRleHQtPnN0aW1lY21waCA9IGNzcl9y
ZWFkKENTUl9TVElNRUNNUEgpOwo+ID4gKyNlbmRpZgo+ID4gKyAgICAgfQo+ID4gICAgICAgLyoK
PiA+ICAgICAgICAqIE5vIG5lZWQgdG8gc2F2ZS9yZXN0b3JlIElQIENTUiAoaS5lLiBNSVAgb3Ig
U0lQKSBiZWNhdXNlOgo+ID4gICAgICAgICoKPiA+IEBAIC00Miw2ICs0OCwxMyBAQCB2b2lkIHN1
c3BlbmRfcmVzdG9yZV9jc3JzKHN0cnVjdCBzdXNwZW5kX2NvbnRleHQgKmNvbnRleHQpCj4gPiAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1RWRUMsIGNvbnRleHQtPnR2ZWMpOwo+ID4gICAgICAgY3NyX3dy
aXRlKENTUl9JRSwgY29udGV4dC0+aWUpOwo+ID4KPiA+ICsgICAgIGlmIChyaXNjdl9oYXNfZXh0
ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1NUQykpIHsKPiA+ICsgICAgICAgICAgICAg
Y3NyX3dyaXRlKENTUl9TVElNRUNNUCwgY29udGV4dC0+c3RpbWVjbXApOwo+ID4gKyNpZiBfX3Jp
c2N2X3hsZW4gPCA2NAo+ID4gKyAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QSCwg
Y29udGV4dC0+c3RpbWVjbXBoKTsKPiA+ICsjZW5kaWYKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAj
aWZkZWYgQ09ORklHX01NVQo+ID4gICAgICAgY3NyX3dyaXRlKENTUl9TQVRQLCBjb250ZXh0LT5z
YXRwKTsKPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpSZWdhcmRzLApOaWNrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
