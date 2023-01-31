Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065F1C636D3
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jZQl/Q1M+fm4wOl8IplH7e09ZS1HUK46ev8r2KLwig=; b=Bq5xFux1J/7VfW
	eYX+tnF1ANGrWkpZhUsLSnfyWii0TOzUyO4fbAV4kNL3tA/IdGxY1525FDpdRO6TupMdHgLYdHp1Q
	AwJ38KAxhW+q1b8f/0mIFIG8J3upQdXh82xPb0jA3r+VBKbSzinXqZ9uQ12GeD61BU40767OdAFC2
	pLphsGSSFj6Walssja2S8uqUtjWZOMUkmJ3V27gRDsoAzSyG+BdLseDqTu/lCMQ2YkWZ4H/dmnsLv
	O1f7RseysQrg+cKShFr44jULd17FobcRqNjSMWojISXCNIaazpdCHNJqVDjluEKX3kqemhxWCB5PT
	QnzJ7gHr0o96IYkTiVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqGw-007wg6-FP; Tue, 31 Jan 2023 13:02:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqGt-007wee-7R
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 13:02:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 862D2B81C77
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E74C433D2
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675170116;
	bh=/VAKhl7zagtIgdjGwqlGupC5IRrBl2jrcRFqxAjRHxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=icpG5ITbtsUgk6GynG1F4oNBYCig/WOimDgmxqS85xlBvdXstlGnNKYDjqCDsTWfl
	 kZSk+YIobQjBInIPaTFJBe6N877NIWtUujbzUr4SxrKCd5AVw5/U9xy8b+B+ppyWui
	 O/CtkoLl0gnIPGeUuaIXZfXRJ4L9ZVzEPCQCjbZfN3WHajNz0ZSnT6z1z30D13ODDl
	 U3q40QuYc2J/K3DJRNKeCf8/7Jca2+XLZd5pCE9DEa6uok2F6pdy5dzlFCD9BLsBkY
	 5AqHO4akzhKcmnAlVtzZlJ1WJ4h/4/YFYt333jVzYa5Y5NUnsRaPMTbOFAP691M7aJ
	 cBZv6CAw82tow==
Received: by mail-ej1-f52.google.com with SMTP id mf7so22637023ejc.6
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 05:01:56 -0800 (PST)
X-Gm-Message-State: AO0yUKUru8BTztubpfZvg9VoM9trJAdHteRdwyGYgSHwNI8y/f+vxuMt
	iWGHDCjPcRg4iAqLuletLE4+90G8Fa/1ZgskP9Y=
X-Google-Smtp-Source: AK7set8ZY0Pqh013WZoEM81qvg3+qc7Ap0ePYEZL/lKJHhaYQoLaEJC43/Cqck8HNJYNwQwTD+CbB9Bkdbqu8QiYtXY=
X-Received: by 2002:a17:906:14cf:b0:878:69e5:b797 with SMTP id
 y15-20020a17090614cf00b0087869e5b797mr4325487ejc.228.1675170114368; Tue, 31
 Jan 2023 05:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <878rhig9zj.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rhig9zj.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 21:01:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSnb4cvcXFvgkesgjuPOiZbcp4GZ2qJas4VWn68Pfsb9A@mail.gmail.com>
Message-ID: <CAJF2gTSnb4cvcXFvgkesgjuPOiZbcp4GZ2qJas4VWn68Pfsb9A@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	liaochang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_050159_597730_80B7A28C 
X-CRM114-Status: GOOD (  26.27  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgODozMiBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGd1b3JlbkBrZXJuZWwub3JnIHdyaXRlczoKPgo+ID4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoZSBrZXJuZWwgd291
bGQgcGFuaWMgd2hlbiBwcm9iZWQgZm9yIGFuIGlsbGVnYWwgcG9zaXRpb24uIGVnOgo+ID4KPiA+
IChDT05GSUdfUklTQ1ZfSVNBX0M9bikKPiA+Cj4gPiBlY2hvICdwOmhlbGxvIGtlcm5lbF9jbG9u
ZSsweDE2IGEwPSVhMCcgPj4ga3Byb2JlX2V2ZW50cwo+ID4gZWNobyAxID4gZXZlbnRzL2twcm9i
ZXMvaGVsbG8vZW5hYmxlCj4gPiBjYXQgdHJhY2UKPiA+Cj4gPiBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogc3RhY2stcHJvdGVjdG9yOiBLZXJuZWwgc3RhY2sKPiA+IGlzIGNvcnJ1cHRlZCBp
bjogX19kb19zeXNfbmV3ZnN0YXRhdCsweGI4LzB4YjgKPiA+IENQVTogMCBQSUQ6IDExMSBDb21t
OiBzaCBOb3QgdGFpbnRlZAo+ID4gNi4yLjAtcmMxLTAwMDI3LWcyZDM5OGZlNDlhNGQgIzQ5MAo+
ID4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+ID4gQ2FsbCBUcmFjZToK
PiA+IFs8ZmZmZmZmZmY4MDAwNzI2OD5dIGR1bXBfYmFja3RyYWNlKzB4MzgvMHg0OAo+ID4gWzxm
ZmZmZmZmZjgwYzVlODNjPl0gc2hvd19zdGFjaysweDUwLzB4NjgKPiA+IFs8ZmZmZmZmZmY4MGM2
ZGEyOD5dIGR1bXBfc3RhY2tfbHZsKzB4NjAvMHg4NAo+ID4gWzxmZmZmZmZmZjgwYzZkYTZjPl0g
ZHVtcF9zdGFjaysweDIwLzB4MzAKPiA+IFs8ZmZmZmZmZmY4MGM1ZWNmND5dIHBhbmljKzB4MTYw
LzB4Mzc0Cj4gPiBbPGZmZmZmZmZmODBjNmRiOTQ+XSBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSsw
eDAvMHhhOAo+ID4gWzxmZmZmZmZmZjgwMmRlZWIwPl0gc3lzX25ld3N0YXQrMHgwLzB4MzAKPiA+
IFs8ZmZmZmZmZmY4MDAxNThjMD5dIHN5c19jbG9uZSsweDIwLzB4MzAKPiA+IFs8ZmZmZmZmZmY4
MDAwMzllOD5dIHJldF9mcm9tX3N5c2NhbGwrMHgwLzB4NAo+ID4gLS0tWyBlbmQgS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IHN0YWNrLXByb3RlY3RvcjoKPiA+IEtlcm5lbCBzdGFjayBpcyBj
b3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4IF0tLS0KPiA+Cj4gPiBU
aGF0IGlzIGJlY2F1c2UgdGhlIGtwcm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9rZSB0aGUg
a2VybmVsJ3MKPiA+IG9yaWdpbmFsIGNvZGUuIFRoZSB1c2VyIHNob3VsZCBndWFyYW50ZWUgdGhl
IGNvcnJlY3Rpb24gb2YgdGhlIHByb2JlCj4gPiBwb3NpdGlvbiwgYnV0IGl0IGNvdWxkbid0IG1h
a2UgdGhlIGtlcm5lbCBwYW5pYy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgYXJjaF9jaGVja19r
cHJvYmUgaW4gYXJjaF9wcmVwYXJlX2twcm9iZSB0byBwcmV2ZW50IGFuCj4gPiBpbGxlZ2FsIHBv
c2l0aW9uIChTdWNoIGFzIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rpb24pLgo+Cj4gTmljZSEK
Pgo+IEBsaWFvY2hhbmcgV2lsbCB5b3UgcmVtb3ZlIHlvdXIgcGF0Y2ggZnJvbSB0aGUgT1BUUFJP
QkUgc2VyaWVzPwo+Cj4gPiBGaXhlczogYzIyYjBiY2IxZGQwICgicmlzY3Y6IEFkZCBrcHJvYmVz
IHN1cHBvcnRlZCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxp
YmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAxOCArKysr
KysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4gaW5kZXggZjIxNTkyZDIwMzA2Li40
NzU5ODlmMDZkNmQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gPiBA
QCAtNDgsNiArNDgsMjEgQEAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hfc2ltdWxhdGVfaW5z
bihzdHJ1Y3Qga3Byb2JlICpwLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgICAgIHBvc3Rf
a3Byb2JlX2hhbmRsZXIocCwga2NiLCByZWdzKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBib29s
IF9fa3Byb2JlcyBhcmNoX2NoZWNrX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gK3sKPiA+
ICsgICAgIHVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5v
ZmZzZXQ7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZylwLT5h
ZGRyOwo+ID4gKwo+ID4gKyAgICAgd2hpbGUgKHRtcCA8PSBhZGRyKSB7Cj4gPiArICAgICAgICAg
ICAgIGlmICh0bXAgPT0gYWRkcikKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9i
ZV9vcGNvZGVfdCAqKXRtcCk7Cj4KPiBrcHJvYmVfb3Bjb2RlX3QgaXMgdTMyOyBUaGlzIGNhbiB0
cmlnZ2VyIGEgbWlzYWxpZ25lZCBsb2FkLCByaWdodD8KPgo+ID4gKyAgICAgfQo+ID4gKwo+ID4g
KyAgICAgcmV0dXJuIGZhbHNlOwo+ID4gK30KPiA+ICsKPiA+ICBpbnQgX19rcHJvYmVzIGFyY2hf
cHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25l
ZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+ID4gQEAgLTU1LDYg
KzcwLDkgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUg
KnApCj4gPiAgICAgICBpZiAocHJvYmVfYWRkciAmIDB4MSkKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIC1FSUxTRVE7Cj4gPgo+ID4gKyAgICAgaWYgKCFhcmNoX2NoZWNrX2twcm9iZShwKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSUxTRVE7Cj4gPiArCj4gPiAgICAgICAvKiBjb3B5IGlu
c3RydWN0aW9uICovCj4gPiAgICAgICBwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPgo+IE5vdCByZWxh
dGVkIHRvIHlvdXIgcGF0Y2gsIGJ1dCB0aGlzIGNhbiBhbHNvIHRyaWdnZXIgYSBtaXNhbGlnbmVk
IGxvYWQuClllcywgaXQgd291bGQgdHJpZ2dlciBhIG1pc2FsaWduZWQgbG9hZC4KCldoYXQncyB0
aGUgcHJvYmxlbSBvZiB0aGF0PwoKPgo+Cj4gQmrDtnJuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
