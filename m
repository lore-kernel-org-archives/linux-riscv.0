Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5419FC3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 02:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJKQ7jafWgKGQvwylYAfpabR31gzuOWRPtaiDA7MQtI=; b=spRQMKKqPQmmA8
	8Lkg5oYPACbnfwJeo2PKXy5MLBRfVPcyCkuF3oG20pKwqHwYKwbXaDi2HnWwYpma7Qj/ZL9DMsVmZ
	ZC5ssjXxu+WnXsna0dzA+DSRFcMwMqrg6fEYiWZqB19dhOTcJ7gox0iH6F9b9HqMQ0BiI0Z5TfvwF
	5wwFbbY79HTeLvjIDmj3juz+BJ0+SHLSV04/qXQF4uQH207/3ziNVk7iFiSpQ782cfph+LHYfdehv
	BNxO2gyCfY++/u2IIrM1wOkWw75lXXbGLPHfCqktYjHZxl9b3AndQtVyUd65xKOzUtf4m17ZDAFPU
	gjZY2nuWXHalMrgDCk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW531-0000000B7Ds-0scs;
	Tue, 23 Jul 2024 02:14:39 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW52y-0000000B7Ce-1hub
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 02:14:37 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-260f81f7fb5so2508961fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 19:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721700874; x=1722305674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+KyexOp1+64hGftnhl06UQTDhjl9bHisKnpbZEpIZA=;
        b=CqSnJgSaP/7ULJazZ4/WAW97ldKdZQzZGNKmdhesHUXDlvYA3glT4kmJ5oEAENmj1l
         lOTy8ZFYDxdQ/cnC7mwZofaww2wSHkERDriYudDYwmLGKd7FAElyAMH+OjlZQ9oNNYO7
         yeyHJQLYIh1KXojauSwXmreWh7q02djDj8J2U6YFOUCCOoZ9XSXDzNBfeyhG2Sx6m043
         8O+3oLXyao1I2cGratF2A+53vej1PUSHodyLrje+7+3bLTJj01/PPdXzPZavIhe0wnfg
         AGlHAGqpuck+DcliUbFC+S6t4g8C/mpryb6Uz1XnM28zT94fxpMVdBUj+IWIqt8u2BEB
         WSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721700874; x=1722305674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+KyexOp1+64hGftnhl06UQTDhjl9bHisKnpbZEpIZA=;
        b=rpVHbY5p7bcn6lTkOiIvtQCjT0t5HOqNEOgv5QlMh3A7mX+7Pk44Lou1eVD1Z4v0ti
         VYPpx7H2kinPKfO1O5p7ExQi4UCa6NNENSEHR1h1vJC2F2iCpwX9QTqphlinV+CJU3My
         qNNGMK/kcgxkVS0m8BSnhDz7iGV9cbXD4ujHVTCrBZfZj9/Uw6Q3OLbyjYfDOmXoGx+y
         ehy+hs5eks9ClcvWeEDjzxRuhBJqBYIHfBROljtMYrNgZopBvQ3MrWe/XBMkZHllJDib
         6+Yx/0PJ/mYThurKHkme6Zo6FofCfQCFRJECxTaMp61zRXaz0nuWulopqui/5GlPSroa
         smNw==
X-Forwarded-Encrypted: i=1; AJvYcCV076HEeR4QYOfQw3AShnGEjlAizV+gGA9GfC3lE+f+KJXaK8AMZdMndkfh1HfitIHMZPsf7Z/By39Cx0WncK0rSp5rJ+2S7kVDULG82OIS
X-Gm-Message-State: AOJu0YwMtCfCfozfKzBuXx620IU94rNUY+u4yn8G69hIwm/9DeGm9YZF
	782TSquR1YNSzeF+Kqj6c+VmB/h6Q3ZrizNppQkl7+qzeZuRaePTWR9jyWbg52S558kSCtSoxyA
	38yhTNZ+6FzI06B578H1ck3ETCiW+ZwVt4HGQaw==
X-Google-Smtp-Source: AGHT+IHGNfghFlazmtyi1nY8PPgmCCsF4cSeVA7XgfiEz9kdMSs+VkGfU2H1jEQHXggLI8KHs3OppCPujh4mvoyloDs=
X-Received: by 2002:a05:6871:824:b0:25e:14e9:10c9 with SMTP id
 586e51a60fabf-261213255e1mr9052557fac.6.1721700874476; Mon, 22 Jul 2024
 19:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240722042037.27934-1-cuiyunhui@bytedance.com> <20240722-a0d01590ba9ec0e0cc18ac74@orel>
In-Reply-To: <20240722-a0d01590ba9ec0e0cc18ac74@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 23 Jul 2024 10:14:23 +0800
Message-ID: <CAEEQ3wkuR_fjrv6a78gKBTRCPujj1vnSdHHst4_Z4fjd3Dt+OA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] riscv/mm/fault: add show_pte() before die()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, surenb@google.com, 
	peterx@redhat.com, alexghiti@rivosinc.com, willy@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_191436_476206_EDCCF09C 
X-CRM114-Status: GOOD (  19.17  )
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

SGkgZHJldywKCk9uIFR1ZSwgSnVsIDIzLCAyMDI0IGF0IDEyOjU24oCvQU0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAyMiwgMjAy
NCBhdCAxMjoyMDozN1BNIEdNVCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gdGhlIGtlcm5l
bCBkaXNwbGF5cyAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQKPiA+
IHZpcnR1YWwgYWRkcmVzcyIsIHdlIHdvdWxkIGxpa2UgdG8gY29uZmlybSB0aGUgc3RhdHVzIG9m
IHRoZSB2aXJ0dWFsCj4gPiBhZGRyZXNzIGluIHRoZSBwYWdlIHRhYmxlLiBTbyBhZGQgc2hvd19w
dGUoKSBiZWZvcmUgZGllKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5j
IHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gaW5kZXggNTIyNGYz
NzMzODAyLi42NjZkMjgyYThiZjQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ID4gQEAgLTIyLDYgKzIyLDU4IEBA
Cj4gPgo+ID4gICNpbmNsdWRlICIuLi9rZXJuZWwvaGVhZC5oIgo+ID4KPiA+ICtzdGF0aWMgdm9p
ZCBzaG93X3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiArewo+ID4gKyAgICAgcGdkX3QgKnBn
ZHAsIHBnZDsKPiA+ICsgICAgIHA0ZF90ICpwNGRwLCBwNGQ7Cj4gPiArICAgICBwdWRfdCAqcHVk
cCwgcHVkOwo+ID4gKyAgICAgcG1kX3QgKnBtZHAsIHBtZDsKPiA+ICsgICAgIHB0ZV90ICpwdGVw
LCBwdGU7Cj4gPiArICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+ID4g
Kwo+ID4gKyAgICAgaWYgKCFtbSkKPiA+ICsgICAgICAgICAgICAgbW0gPSAmaW5pdF9tbTsKPiA+
ICsKPiA+ICsgICAgIHByX2FsZXJ0KCJDdXJyZW50ICVzIHBndGFibGU6ICVsdUsgcGFnZXNpemUs
ICVkLWJpdCBWQXMsIHBnZHA9MHglMDE2bHhcbiIsCj4gPiArICAgICAgICAgICAgICBjdXJyZW50
LT5jb21tLCBQQUdFX1NJWkUvU1pfMUssIFZBX0JJVFMsCj4gPiArICAgICAgICAgICAgICAobW0g
PT0gJmluaXRfbW0gPyBfX3BhX3N5bWJvbChtbS0+cGdkKSA6Cj4gPiArICAgICAgICAgICAgICAo
dW5zaWduZWQgbG9uZyl2aXJ0X3RvX3BoeXMobW0tPnBnZCkpKTsKPgo+IG5pdDogdW5uZWNlc3Nh
cnkgKCkgYXJvdW5kIHRoZSB0ZXJuYXJ5LgpPa2F5LCBJJ2xsIHVwZGF0ZSBpdCBpbiB2My4KCj4K
PiA+ICsKPiA+ICsgICAgIHBnZHAgPSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKTsKPiA+ICsgICAgIHBn
ZCA9IHBnZHBfZ2V0KHBnZHApOwo+ID4gKyAgICAgcHJfYWxlcnQoIlslMDE2bHhdIHBnZD0lMDE2
bHgiLCBhZGRyLCBwZ2RfdmFsKHBnZCkpOwo+ID4gKyAgICAgaWYgKHBnZF9ub25lKHBnZCkgfHwg
cGdkX2JhZChwZ2QpIHx8IHBnZF9sZWFmKHBnZCkpCj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ID4gKwo+ID4gKyAgICAgcDRkcCA9IHA0ZF9vZmZzZXQocGdkcCwgYWRkcik7Cj4gPiArICAg
ICBwNGQgPSBwNGRwX2dldChwNGRwKTsKPiA+ICsgICAgIHByX2NvbnQoIiwgcDRkPSUwMTZseCIs
IHA0ZF92YWwocDRkKSk7Cj4gPiArICAgICBpZiAocDRkX25vbmUocDRkKSB8fCBwNGRfYmFkKHA0
ZCkgfHwgcDRkX2xlYWYocDRkKSkKPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArCj4g
PiArICAgICBwdWRwID0gcHVkX29mZnNldChwNGRwLCBhZGRyKTsKPiA+ICsgICAgIHB1ZCA9IHB1
ZHBfZ2V0KHB1ZHApOwo+ID4gKyAgICAgcHJfY29udCgiLCBwdWQ9JTAxNmx4IiwgcHVkX3ZhbChw
dWQpKTsKPiA+ICsgICAgIGlmIChwdWRfbm9uZShwdWQpIHx8IHB1ZF9iYWQocHVkKSB8fCBwdWRf
bGVhZihwdWQpKQo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgIHBt
ZHAgPSBwbWRfb2Zmc2V0KHB1ZHAsIGFkZHIpOwo+ID4gKyAgICAgcG1kID0gcG1kcF9nZXQocG1k
cCk7Cj4gPiArICAgICBwcl9jb250KCIsIHBtZD0lMDE2bHgiLCBwbWRfdmFsKHBtZCkpOwo+ID4g
KyAgICAgaWYgKHBtZF9ub25lKHBtZCkgfHwgcG1kX2JhZChwbWQpIHx8IHBtZF9sZWFmKHBtZCkp
Cj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+ID4gKyAgICAgcHRlcCA9IHB0ZV9v
ZmZzZXRfbWFwKHBtZHAsIGFkZHIpOwo+ID4gKyAgICAgaWYgKCFwdGVwKQo+ID4gKyAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgIHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+ID4g
KyAgICAgcHJfY29udCgiLCBwdGU9JTAxNmx4IiwgcHRlX3ZhbChwdGUpKTsKPiA+ICsgICAgIHB0
ZV91bm1hcChwdGVwKTsKPiA+ICtvdXQ6Cj4gPiArICAgICBwcl9jb250KCJcbiIpOwo+ID4gK30K
PiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBkaWVfa2VybmVsX2ZhdWx0KGNvbnN0IGNoYXIgKm1zZywg
dW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKPiA+ICB7Cj4gPiBAQCAtMzEsNiArODMsNyBAQCBzdGF0aWMgdm9pZCBkaWVfa2VybmVsX2Zh
dWx0KGNvbnN0IGNoYXIgKm1zZywgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gICAgICAgICAgICAg
ICBhZGRyKTsKPiA+Cj4gPiAgICAgICBidXN0X3NwaW5sb2NrcygwKTsKPiA+ICsgICAgIHNob3df
cHRlKGFkZHIpOwo+ID4gICAgICAgZGllKHJlZ3MsICJPb3BzIik7Cj4gPiAgICAgICBtYWtlX3Rh
c2tfZGVhZChTSUdLSUxMKTsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+ID4KPgo+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Cj4gVGhh
bmtzLAo+IGRyZXcKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
