Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC0C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 02:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLoIT7xlys3wQ5Nt2f7po9Ta7aL/Bu9TWXpJvAtX2qo=; b=vnuNosIaJ01jCp
	kjeF2Dlb4MaXJQxmp7vTfpRianRsZDudwcKvUL4xFDUE3JwcxIvvp7MEoFao/7dUNGjsEP6kzhqVM
	+mR6eWILeS+dnLehkpqtfILO/bC9XrDssYzOhjrpspeGElD+TOVz5+gyat/4LNjBNYskHVdXHrnOR
	epMb0E1MD4MMlCTH3mJRxa0xrevJPuEY3ijB8+XthqvDJVJORtAHXif9/Xjr1iFmB2yiY4wX24cJ6
	qR1IhJonnD2Ss9SrMNG/BBuYXkEfC93YuXswODavPvwe0wpMU64EsvAHky9qU2jgcI1vgGq2L7K1i
	cxdJuZYe25LqFBAhB5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sViZG-000000084nc-41g3;
	Mon, 22 Jul 2024 02:14:26 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sViZD-000000084md-2Upe
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 02:14:25 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2611da054fbso1241238fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721614462; x=1722219262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kl/5HdiGOfFOfo04ZJqI2kOtj4nNd83dcFbNpwK/70I=;
        b=X4mbPniJiy+FlqK53XpHdfOuL1FqSteOBM/DkSvB/UmA7m8myDD6q9kHX7FbiKd/UU
         Gsm19VNohQNYe9TBrrsk2Mxw+Ii7Qng0u3xdp+kSDKOCaKc45zUVmq/ZHhQEHEPe/BTr
         dy2j3yl+ekA7VluZDtTbvn69a76Ld1/nRRlQVnStz9koiUu6UmPi0+A5HFbo5sSnULo8
         Jsze7lBGQQjZg2o6GJf7fXwMjBPUdM5AizOgbz0qPg6A7v4lnMyr5DyQjsEYcrqbrWk6
         Y+SPCQG/ZNpl5xdHFngDJgH5EFv4hUSoMNzarioQGl/T6q4nn7qFQ69oOR7inNX/DDck
         jELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721614462; x=1722219262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kl/5HdiGOfFOfo04ZJqI2kOtj4nNd83dcFbNpwK/70I=;
        b=MIQY0b7y2hWcJ/I9oJh4Hlz0LspSL2guKNnPUe9MO3W2XSvjS6RN/QYWuXaHKuGI5X
         pnCvsLAbpt0lzu5SA5DMkjEOyfgfVA8363Oyx6biKxckn7Hw92Z45eeUPw0CCYbJkq3z
         ViB29IroCkyrBvMU25yFMRDxZLQkS6mlHq7bcYOKpSS99umN4hG5OeVJqdBT0HKb7V7F
         Y4yzq59yOf05EtaB57i2JkatOA44JN48BqyFBavAIz3gSB3Bsy4bkE+sawF3dzZzP64N
         ko2OdKdAEWTTwP3EwUhMqZa6dQo9Jvg90oYuUTsqaU6hg9DcGix2SEhPblXc/04RFAlH
         0FQA==
X-Forwarded-Encrypted: i=1; AJvYcCWQdnmLUgEAoZZFlByDZaixlE6CraRCArlVpT+J/XJQ0FPMzCLo9Rg20ZC25QqZ5t0F/ZcxzAOkLkd9Aj05SZJA11vLOWb0mwE+RwETJbR1
X-Gm-Message-State: AOJu0Yw7fqfJ7QmaqzRYXGo/WJ0arx5tYx28n7Hnwosxqj+OnDk30R56
	Hh7ymSAsXo+FPm2W6c3HbzO5BShXXOn5vBtBnWmQ1kDJQxfj8YZTS4NrStCjmQztcjLawUqC4ZL
	NjQqe9NtQ9ktNVdgTuKUuJGc3IIf/0hsbhTav3A==
X-Google-Smtp-Source: AGHT+IHnB9IHVe+JUhN7+3oCZIPRki3xbro2mIHQOGvKQ+6goU1pu1Q9XgV6wLqCAmGxdb7cSYKKnOMLQd5vLv7Sn5A=
X-Received: by 2002:a05:6871:b28:b0:261:10b7:8c48 with SMTP id
 586e51a60fabf-2638df8951dmr5202348fac.27.1721614461869; Sun, 21 Jul 2024
 19:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-3-yongxuan.wang@sifive.com> <727b966a-a8c4-4021-acf6-3c031ccd843a@sifive.com>
 <CAMWQL2g-peSYJQaxeJtyOzGdEmDQ6cnkRBdFQvLr2NQA1+mv2g@mail.gmail.com> <20240719-flatten-elixir-d4476977ab95@spud>
In-Reply-To: <20240719-flatten-elixir-d4476977ab95@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 22 Jul 2024 10:14:11 +0800
Message-ID: <CAMWQL2iWsxLJZZ3H59csJ376Hdtq+ZKjD92BtM9zhdXm+fh2=A@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_191423_677718_48286E40 
X-CRM114-Status: GOOD (  26.46  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEp1bCAxOSwgMjAyNCBhdCA5OjE34oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDE5LCAyMDI0IGF0IDAy
OjU4OjU5UE0gKzA4MDAsIFlvbmctWHVhbiBXYW5nIHdyb3RlOgo+ID4gSGkgU2FtdWVsLAo+ID4K
PiA+IE9uIEZyaSwgSnVsIDE5LCAyMDI0IGF0IDc6MzjigK9BTSBTYW11ZWwgSG9sbGFuZAo+ID4g
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyMDI0LTA3
LTEyIDM6MzggQU0sIFlvbmctWHVhbiBXYW5nIHdyb3RlOgo+ID4gPiA+IEFkZCBlbnRyaWVzIGZv
ciB0aGUgU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgdG8gdGhlIHJpc2N2LGlzYS1leHRlbnNp
b25zCj4gPiA+ID4gcHJvcGVydHkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25n
LVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAyOCArKysr
KysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ID4gPiBpbmRleCA0NjhjNjQ2MjQ3YWEu
LmU5MWE2ZjRlZGUzOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gPiA+IEBA
IC0xNTMsNiArMTUzLDM0IEBAIHByb3BlcnRpZXM6Cj4gPiA+ID4gICAgICAgICAgICAgIHJhdGlm
aWVkIGF0IGNvbW1pdCAzZjllZDM0ICgiQWRkIGFiaWxpdHkgdG8gbWFudWFsbHkgdHJpZ2dlcgo+
ID4gPiA+ICAgICAgICAgICAgICB3b3JrZmxvdy4gKCMyKSIpIG9mIHJpc2N2LXRpbWUtY29tcGFy
ZS4KPiA+ID4gPgo+ID4gPiA+ICsgICAgICAgIC0gY29uc3Q6IHN2YWRlCj4gPiA+ID4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3Zh
ZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIFNXLW1hbmFnZWQgUFRFIEEvRAo+ID4g
PiA+ICsgICAgICAgICAgICBiaXQgdXBkYXRlcyBhcyByYXRpZmllZCBpbiB0aGUgMjAyNDAyMTMg
dmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZAo+ID4gPiA+ICsgICAgICAgICAgICBJU0Egc3BlY2lm
aWNhdGlvbi4KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgIEJvdGggU3ZhZGUgYW5kIFN2
YWR1IGV4dGVuc2lvbnMgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hlbgo+ID4gPiA+
ICsgICAgICAgICAgICB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUgZGVmYXVs
dCBiZWhhdmlvciBmb3IgdGhlIGZvdXIKPiA+ID4gPiArICAgICAgICAgICAgcG9zc2libGUgY29t
YmluYXRpb25zIG9mIHRoZXNlIGV4dGVuc2lvbnMgaW4gdGhlIGRldmljZSB0cmVlIGFyZToKPiA+
ID4gPiArICAgICAgICAgICAgMSkgTmVpdGhlciBTdmFkZSBub3IgU3ZhZHUgcHJlc2VudCBpbiBE
VCA9PiBJdCBpcyB0ZWNobmljYWxseQo+ID4gPiA+ICsgICAgICAgICAgICAgICB1bmtub3duIHdo
ZXRoZXIgdGhlIHBsYXRmb3JtIHVzZXMgU3ZhZGUgb3IgU3ZhZHUuIFN1cGVydmlzb3IKPiA+ID4g
PiArICAgICAgICAgICAgICAgc29mdHdhcmUgc2hvdWxkIGJlIHByZXBhcmVkIHRvIGhhbmRsZSBl
aXRoZXIgaGFyZHdhcmUgdXBkYXRpbmcKPiA+ID4gPiArICAgICAgICAgICAgICAgb2YgdGhlIFBU
RSBBL0QgYml0cyBvciBwYWdlIGZhdWx0cyB3aGVuIHRoZXkgbmVlZCB1cGRhdGVkLgo+ID4gPiA+
ICsgICAgICAgICAgICAyKSBPbmx5IFN2YWRlIHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBt
dXN0IGFzc3VtZSBTdmFkZSB0byBiZQo+ID4gPiA+ICsgICAgICAgICAgICAgICBhbHdheXMgZW5h
YmxlZC4KPiA+ID4gPiArICAgICAgICAgICAgMykgT25seSBTdmFkdSBwcmVzZW50IGluIERUID0+
IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZHUgdG8gYmUKPiA+ID4gPiArICAgICAgICAgICAg
ICAgYWx3YXlzIGVuYWJsZWQuCj4gPiA+ID4gKyAgICAgICAgICAgIDQpIEJvdGggU3ZhZGUgYW5k
IFN2YWR1IHByZXNlbnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBtdXN0IGFzc3VtZQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICBTdmFkdSB0dXJuZWQtb2ZmIGF0IGJvb3QgdGltZS4gVG8gdXNlIFN2YWR1
LCBzdXBlcnZpc29yIG11c3QKPiA+ID4gPiArICAgICAgICAgICAgICAgZXhwbGljaXRseSBlbmFi
bGUgaXQgdXNpbmcgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbi4KPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgICAgLSBjb25zdDogc3ZhZHUKPiA+ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4g
PiA+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTdmFkdSBzdXBlcnZpc29yLWxldmVsIGV4
dGVuc2lvbiBmb3IgaGFyZHdhcmUgdXBkYXRpbmcKPiA+ID4gPiArICAgICAgICAgICAgb2YgUFRF
IEEvRCBiaXRzIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCBjMWFiY2NmICgiTWVyZ2UgcHVsbCByZXF1
ZXN0Cj4gPiA+ID4gKyAgICAgICAgICAgICMyNSBmcm9tIHZlZC1yaXZvcy9yYXRpZmllZCIpIG9m
IHJpc2N2LXN2YWR1LiBQbGVhc2UgcmVmZXIgdG8gU3ZhZGUKPiA+ID4KPiA+ID4gU2hvdWxkIHdl
IGJlIHJlZmVyZW5jaW5nIHRoZSBhcmNoaXZlZCByaXNjdi1zdmFkdSByZXBvc2l0b3J5IG5vdyB0
aGF0IFN2YWR1IGhhcwo+ID4gPiBiZWVuIG1lcmdlZCB0byB0aGUgbWFpbiBwcml2aWxlZ2VkIElT
QSBtYW51YWw/IEVpdGhlciB3YXk6Cj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9s
bGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+ID4KPiA+Cj4gPiBZZXMsIHRoaXMg
Y29tbWl0IGlzIGZyb20gdGhlIGFyY2hpdmVkIHJpc2N2LXN2YWR1IHJlcG8uIE9yIHNob3VsZCBJ
IHVwZGF0ZSBpdCB0bwo+ID4gImNvbW1pdCBjMWFiY2NmICgiTWVyZ2UgcHVsbCByZXF1ZXN0ICAj
MjUgZnJvbSB2ZWQtcml2b3MvcmF0aWZpZWQiKSBvZgo+ID4gcmlzY3ZhcmNoaXZlL3Jpc2N2LXN2
YWR1LiI/Cj4KPiBJIHRoaW5rIFNhbXVlbCB3YXMgc2F5aW5nIHRoYXQgd2Ugc2hvdWxkIHVzZSB0
aGUgY29tbWl0IHdoZXJlIGl0IHdhcwo+IG1lcmdlZCBpbnRvIHJpc2N2LWlzYS1tYW51YWwgaW5z
dGVhZC4KCkdvdCBpdC4gSSB3aWxsIHVwZGF0ZSB0aGUgZGVzY3JpcHRpb24gaW4gdGhlIG5leHQg
dmVyc2lvbi4gVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
