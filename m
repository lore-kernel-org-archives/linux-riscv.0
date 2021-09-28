Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E379C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:02:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5020604D2
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 07:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5020604D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyjWlMRFXQuonifYk+8tqZ8/OFGBpDIS4loOcxYtgG8=; b=E47gfTpnNX8GkL
	urY/k+srY4gaZvCqLbzYKY2nSrJlleZZeVx0Ebtojm0XLKydOR3uOaTz3b7xUs5vKxj1boT7s2uTg
	0fH99G6umGmNc8pajhsVCOFyUDXeJdH0x2/sesEA8QXfnDu/mN7gFiqvHTW2aRZnBAMrCzbvyVwKp
	dz01POFl2u8QyBaX+NIuUe0E2NelnH9VWJilHuJ0gR4TxmatR/BC2un1l2mstc1Pcgpd/jXRd4bnN
	8h7T/5+g85d407Cy3ccrLaYYiYyAEjlhr6cR7M9V6OaLIHKK18iN9yom2NePD2BnrUDsAqhm8x83n
	BgpZ3mBFay9kmR3pn9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV77S-005w6F-3w; Tue, 28 Sep 2021 07:01:38 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV77Q-005w5q-10
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 07:01:37 +0000
Received: by mail-qv1-xf35.google.com with SMTP id x8so125836qvp.1
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gKnIAqOx2fpSsjafReu8T2u4xETk4bKWTRz3yCNHzjI=;
 b=E07Nv6MOqKa+ILOhSg9aHDeaee684C+QGVF6V+5A/LJuZ+B/WigEII/4VQ3b8IUseA
 VAh2lFa6ABC6TrwArGEMXZ95rxiBq10EgdfK7HMZSXDBuaaXYxXP6LYfcsYEXBYBhDmd
 uHvxnwlSuRN/G+ZBnFeRD6pg4lz5L4XefYV0RMNEbLXTwl507zzlItF/MN+6Nr+t7ZHZ
 LH6hggV2uhQqhVH6pbHf7SoZuHjUASEwEbTSzkpoSx77Rc1ZvbjY4FliiqWA0wPpINZM
 FX9s6HmNIPKsGZYFoIblAPQpiAufS95bjSZvb7wJdV+ur0s24XXfeTWlDiFbI4pZ94Vt
 /QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gKnIAqOx2fpSsjafReu8T2u4xETk4bKWTRz3yCNHzjI=;
 b=iF/JawKZ94FixCvfmNe7aSjWjiWgWFwAlzPbuTUXB3kuSwYhRDhTGcFze5ZBe4szG7
 dk/XbtbkZEea5SX15WWmB8tALhBVFDE8HhthrU6S5tyU49CsQjJ5H9gS3S0pA7xJN7Dr
 5aqK7agYrJt5KbGvhs4js0/c/jFUHULvr4TRfNJ9h/8AsEiAGlcLaUbqN0dSzwabrqTT
 DfVz04GTKqHgxLQY3O91Mf9Eid1dXBF7dxozCm0uou/T5YR6DtBZYIt6zaLtWdzSUlVE
 y6f8HLcbLeiu4gBU4rENknUTUxyvQbQG3IvEVf1v5uEkQZBIwp2a/JXxxyQDSy/jobth
 Yztg==
X-Gm-Message-State: AOAM532F8PB9I6KBr8ZHJt8p0mzgwpsd7OCrryLowyz9a7UzpEIswpqY
 4XLD0fBAzfo22IGAzNje8imwy0LTquvxJLZ2Xo8zzA==
X-Google-Smtp-Source: ABdhPJy6qut5d4t8T2qj5WlvpYzsia5/XSW53qHwz/D3gNQY00xsOT1JNb8WeSaOdJVkToKtDUU79AitE1h8udMj8NU=
X-Received: by 2002:ad4:55af:: with SMTP id f15mr4054897qvx.32.1632812494336; 
 Tue, 28 Sep 2021 00:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <33c485ee595aff1e19a0e43074da59779f58d105.1631121222.git.greentime.hu@sifive.com>
 <CAFiDJ59nbV_opZRxfsv2kj8ObSguT75GJUKhA6Zd3+BpQOynjw@mail.gmail.com>
In-Reply-To: <CAFiDJ59nbV_opZRxfsv2kj8ObSguT75GJUKhA6Zd3+BpQOynjw@mail.gmail.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 28 Sep 2021 15:01:22 +0800
Message-ID: <CAHCEeh+XDVEPjKhJ9OYv3xMGLRDnygA6CK_y8tDzr9RYFKC-Aw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 15/21] riscv: Add vector extension XOR
 implementation
To: Ley Foon Tan <lftan.linux@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_000136_093165_31D1FF95 
X-CRM114-Status: GOOD (  20.34  )
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

TGV5IEZvb24gVGFuIDxsZnRhbi5saW51eEBnbWFpbC5jb20+IOaWvCAyMDIx5bm0OeaciDE05pel
IOmAseS6jCDkuIvljYg0OjMw5a+r6YGT77yaCj4KPiBPbiBUaHUsIFNlcCA5LCAyMDIxIGF0IDE6
NDkgQU0gR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHZlY3RvciBvcHRpbWl6ZWQgWE9SIGl0IGlz
IHRlc3RlZCBpbiBzcGlrZSBhbmQKPiA+IHFlbXUuCj4gPgo+ID4gTG9ncyBpbiBzcGlrZToKPiA+
IFsgICAgMC4wMDgzNjVdIHhvcjogbWVhc3VyaW5nIHNvZnR3YXJlIGNoZWNrc3VtIHNwZWVkCj4g
PiBbICAgIDAuMDQ4ODg1XSAgICA4cmVncyAgICAgOiAgMTcxOS4wMDAgTUIvc2VjCj4gPiBbICAg
IDAuMDg5MDgwXSAgICAzMnJlZ3MgICAgOiAgMTcxNy4wMDAgTUIvc2VjCj4gPiBbICAgIDAuMTI5
Mjc1XSAgICBydnYgICAgICAgOiAgNzA0My4wMDAgTUIvc2VjCj4gPiBbICAgIDAuMTI5NTI1XSB4
b3I6IHVzaW5nIGZ1bmN0aW9uOiBydnYgKDcwNDMuMDAwIE1CL3NlYykKPiA+Cj4gPiBMb2dzIGlu
IHFlbXU6Cj4gPiBbICAgIDAuMDk4OTQzXSB4b3I6IG1lYXN1cmluZyBzb2Z0d2FyZSBjaGVja3N1
bSBzcGVlZAo+ID4gWyAgICAwLjEzOTM5MV0gICAgOHJlZ3MgICAgIDogIDI5MTEuMDAwIE1CL3Nl
Ywo+ID4gWyAgICAwLjE4MTA3OV0gICAgMzJyZWdzICAgIDogIDI4MTMuMDAwIE1CL3NlYwo+ID4g
WyAgICAwLjIyNDI2MF0gICAgcnZ2ICAgICAgIDogICAgNDUuMDAwIE1CL3NlYwo+ID4gWyAgICAw
LjIyNTU4Nl0geG9yOiB1c2luZyBmdW5jdGlvbjogOHJlZ3MgKDI5MTEuMDAwIE1CL3NlYykKPiA+
Cj4gPiBDby1kZXZlbG9wZWQtYnk6IEhhbi1LdWFuIENoZW4gPGhhbmt1YW4uY2hlbkBzaWZpdmUu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFuLUt1YW4gQ2hlbiA8aGFua3Vhbi5jaGVuQHNpZml2
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZp
dmUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS94b3IuaCB8IDc0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9saWIvTWFrZWZp
bGUgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2xpYi94b3IuUyAgICAgICAgIHwgODEgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAx
NTYgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3hvci5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL3hvci5T
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3hvci5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi42MGVlMDIyNDkxM2QKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKPiA+IEBAIC0wLDAgKzEsNzQgQEAKPgo+Cj4g
Wy4uLl0KPgo+ID4KPiA+ICtleHRlcm4gYm9vbCBoYXNfdmVjdG9yOwo+ID4gKyN1bmRlZiBYT1Jf
VFJZX1RFTVBMQVRFUwo+ID4gKyNkZWZpbmUgWE9SX1RSWV9URU1QTEFURVMgICAgICAgICAgIFwK
PiA+ICsgICAgICAgZG8geyAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIHhvcl9zcGVlZCgm
eG9yX2Jsb2NrXzhyZWdzKTsgICAgXAo+ID4gKyAgICAgICAgICAgICAgIHhvcl9zcGVlZCgmeG9y
X2Jsb2NrXzMycmVncyk7ICAgIFwKPiA+ICsgICAgICAgICAgICAgICBpZiAoaGFzX3ZlY3Rvcikg
eyBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB4b3Jfc3BlZWQoJnhvcl9ibG9ja19ydnYp
O1wKPiA+ICsgICAgICAgICAgICAgICB9IFwKPiA+ICsgICAgICAgfSB3aGlsZSAoMCkKPiA+ICsj
ZW5kaWYKPiA+Cj4gYm9vbCBoYXNfdmVjdG9yIGlzIGNoYW5nZWQgdG8gaGFzX3ZlY3RvcigpIGZ1
bmN0aW9uIG5vdywgc2hvdWxkIHRoaXMKPiBjaGFuZ2UgYXMgd2VsbD8KClRoYXQncyByaWdodC4g
VGhhbmsgeW91LCBMZXlGb29uLgpJJ2xsIG1lcmdlIHRoZSBwYXRjaCB0byBmaXggdGhlIGhhc192
ZWN0b3IoKSBpc3N1ZSBpbiBuZXh0IHZlcnNpb24gcGF0Y2hzZXQuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
