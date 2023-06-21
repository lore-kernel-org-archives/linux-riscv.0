Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F5DEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 06:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qei7qTrhH8j2mYgk+ufLXgtLfLNWlilcyeXm+Z1k2Rg=; b=cVR1W+PQTjaRj6
	bBIrZ6N/JcS2jCO6j+8Ryr0RHip6URec6EnBbM47NLBNdb6or8JkX3uI4Si39Bk6hjO1PUhC9zgpA
	rACuEUrCfN8CY7ZEdfotaV5n6XFI4AQoWMkJMjdL3hLd5FCZAP58LNcW+CxD+PP6Quup70VgpyQNv
	QPz968k+zc+FQY0t7iHV0RBa7Y4jH32mgRhYTrvLkgzr3EQiIrzy/UmJICQ+Bx5Log3LA/FtL2rda
	UYFHVrQTPh4As7eCGM3xuALgrGomEfH8RU0vy7qrGTwpoe/UVTkFJrW5lFOWPCK0mTuzPQxhg8Ea8
	TXGD45brrOC4RmpiPOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrAb-00DORW-2Q;
	Wed, 21 Jun 2023 06:18:21 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrAY-00DOQY-2W
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 06:18:20 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3ff242aae7aso97601cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 23:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687328296; x=1689920296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY6Ne/SM4st5svkq+5PmFR9ym99PQO1FPMB+O80q/9k=;
        b=jJgJ8TEwkTcJjg1WjlUR9s8k6xuroY0T6d/deXtuR6rtpQms6eSvNiZYzdonANiUvl
         rtVLnv81nzNCVa4awgoAIxNR6WGcCzRae03XOEGQWufDl+YimvOSKnD6KTyqvZpqEgrR
         9k7bestW22knqvyeQe2LdOiQVRnDba3Lff5fGdys9NnvWhGrxUZ2FzgJ4Fg52lxWP+Zj
         87+9lorjspaapO563tVLV2xa13yHzMOq36qt1CEiYqqQI7dqNZkx/1R063gewZf9gZ/e
         mQwlcDu8WkksEmnyZ4CPgtCrYWbzWG5xpHpY8Beza9mx2MQ+L67Gic8xKZvVIUUzs/jc
         UcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687328296; x=1689920296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY6Ne/SM4st5svkq+5PmFR9ym99PQO1FPMB+O80q/9k=;
        b=SG+nufyPj8oMdf268pU35igNBed8F+MmOjuxTMvQa2jVNYrt3L9pDcwu+SMlI3BBGl
         ecEJmBasc9Q0APxgb+RHoSzm9DQsl/rpzsfWrp3lLp2NcSd2KjIlI6s12xZDgTKPMQCz
         XOMtkCTkPa+afc9PWS1RZxYY4FkxsH9WJFbGG1WrpwuYUpczw84X8jOE8qnRrRnxkEHl
         REyNE/SZJrGpOVSSyQPEbOJZLfr5u12v94P/e0ENDp2t8oZs3va9eCFMCGz6plaLCMR2
         J6u6rV/HidgAfPQfbWcRO9Gm6SHJ5T0VPGliTuezxxqtWjXhKWP8aXSJbKASIyGbgLQt
         1z1Q==
X-Gm-Message-State: AC+VfDzFDwVtVMvYb382FzlscGzrEOimTj4QN5/jABo5C8hEyJUgCDs7
	BO4tlno83AthzSkvfGh0pmzVkcYohTVxbyUUZpFdFw==
X-Google-Smtp-Source: ACHHUZ5Si2f5rcozpuv/IX3egthC3n6xTOPCLu1mauqLlDSD8RTu21u5MDhWkbFZ/yCBTJdUKEE7iLebzq6xzpeI364=
X-Received: by 2002:a05:622a:14c7:b0:3f8:8c06:c53b with SMTP id
 u7-20020a05622a14c700b003f88c06c53bmr1388016qtx.0.1687328296083; Tue, 20 Jun
 2023 23:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230602094841.1225-1-eric.lin@sifive.com> <CAPqJEFpamQSbCcD0QJ16u7ctRf1=NYihod6gdZJfxFpE0YUVHQ@mail.gmail.com>
In-Reply-To: <CAPqJEFpamQSbCcD0QJ16u7ctRf1=NYihod6gdZJfxFpE0YUVHQ@mail.gmail.com>
From: Stephane Eranian <eranian@google.com>
Date: Tue, 20 Jun 2023 23:18:05 -0700
Message-ID: <CABPqkBRyqsMnNbokBKepkWq1DtzfB0npXySGbKS1T3nQTwmaAw@mail.gmail.com>
Subject: Re: [PATCH] perf/core: Add pmu stop before unthrottling to prevent WARNING
To: Eric Lin <eric.lin@sifive.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	palmer@dabbelt.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_231818_841483_761ED929 
X-CRM114-Status: GOOD (  20.49  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgOToyNeKAr1BNIEVyaWMgTGluIDxlcmljLmxpbkBzaWZp
dmUuY29tPiB3cm90ZToKPgo+IENDOiBTdGVwaGFuZSBFcmFuaWFuCj4KPiBPbiBGcmksIEp1biAy
LCAyMDIzIGF0IDU6NDnigK9QTSBFcmljIExpbiA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gQ3VycmVudGx5LCBkdXJpbmcgdGhlIHBlcmYgc2FtcGxpbmcsIGlmIHRoZSBwZXJm
IGludGVycnVwdCB0YWtlcyB0b28gbG9uZywKPiA+IHBlcmYgZnJhbWV3b3JrIHdpbGwgbG93ZXIg
dGhlIHBlcmZfZXZlbnRfbWF4X3NhbXBsZV9yYXRlLiBUaGlzIHdpbGwgbGltaXQKPiA+IHRoZSBu
dW1iZXIgb2Ygc2FtcGxlcyBwZXIgdGltZXIgdGljayAobWF4X3NhbXBsZXNfcGVyX3RpY2spIGFu
ZCBzZXQgaHdjLT5pbnRlcnJ1cHRzCj4gPiB0byBNQVhfSU5URVJSVVBUUyB3aXRoaW4gdGhlIF9f
cGVyZl9ldmVudF9hY2NvdW50X2ludGVycnVwdCgpIGZ1bmN0aW9uLgo+ID4KPiA+IEFmdGVyd2Fy
ZCwgdGhlIHBlcmYgZnJhbWV3b3JrIHdpbGwgdW50aHJvdHRsZSB0aGUgZXZlbnQgaW4gdGhlIHRp
bWVyIGludGVycnVwdAo+ID4gaGFuZGxlciwgd2hpY2ggdHJpZ2dlcnMgdGhlIGRyaXZlcidzICpf
cG11X3N0YXJ0KCkgZnVuY3Rpb24uIE1vc3Qgb2YgdGhlIGRyaXZlcidzCj4gPiAqX3BtdV9zdGFy
dCgpIGZ1bmN0aW9ucyB3aWxsIGNoZWNrIHRoZSBldmVudC0+aHcuc3RhdGUgdG8gZGV0ZXJtaW5l
IHdoZXRoZXIgdGhpcwo+ID4gZXZlbnQgaGFzIHN0b3BwZWQuIElmIHRoZSBldmVudCBoYXMgbm90
IHN0b3BwZWQsIGEgV0FSTl9PTl9PTkNFKCkgd2FybmluZwo+ID4gd2lsbCBiZSB0cmlnZ2VyZWQg
YXMgc2hvd24gYmVsb3c6Cj4gPgo+ID4gWyAyMTEwLjIyNDcyM10gLS0tLS0tLS0tLS0tWyBjdXQg
aGVyZSBdLS0tLS0tLS0tLS0tCj4gPiBbIDIxMTAuMjI0ODUxXSBXQVJOSU5HOiBDUFU6IDAgUElE
OiAyNDAgYXQgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jOjE4NCByaXNjdl9wbXVfc3RhcnQrMHg3
Yy8weDhlCj4gPiBbIDIxMTAuMjI1MjQyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+IFsgMjExMC4y
MjUzODBdIENQVTogMCBQSUQ6IDI0MCBDb21tOiBscyBOb3QgdGFpbnRlZCA2LjQtcmM0LWcxOWQw
Nzg4ZTllZjIgIzEKPiA+IFsgMjExMC4yMjU1NzRdIEhhcmR3YXJlIG5hbWU6IFNpRml2ZSAoRFQp
Cj4gPiBbIDIxMTAuMjI1NjU3XSBlcGMgOiByaXNjdl9wbXVfc3RhcnQrMHg3Yy8weDhlCj4gPiBb
IDIxMTAuMjI1ODM0XSAgcmEgOiByaXNjdl9wbXVfc3RhcnQrMHgyOC8weDhlCj4gPiBbIDIxMTAu
MjI1OTk4XSBlcGMgOiBmZmZmZmZmZjgwYWVmODY0IHJhIDogZmZmZmZmZmY4MGFlZjgxMCBzcCA6
IGZmZmY4ZjgwMDA0ZGI2ZjAKPiA+IFsgMjExMC4yMjYxMzVdICBncCA6IGZmZmZmZmZmODFjODM3
NTAgdHAgOiBmZmZmYWY4MDA2OWY5YmMwIHQwIDogZmZmZjhmODAwMDRkYjZjMAo+ID4gWyAyMTEw
LjIyNjI0NV0gIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDAwMDAwMDAwMDAwMDAwMWYgczAg
OiBmZmZmOGY4MDAwNGRiNzIwCj4gPiBbIDIxMTAuMjI2MzY3XSAgczEgOiBmZmZmYWY4MDA4Y2Ex
MDY4IGEwIDogMDAwMGZmZmZmZmZmZmZmZiBhMSA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgMjEx
MC4yMjY0ODhdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDEgYTMgOiAwMDAwMDAwMDAwMDAwODcwIGE0
IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAyMTEwLjIyNjYwNV0gIGE1IDogMDAwMDAwMDAwMDAw
MDAwMCBhNiA6IDAwMDAwMDAwMDAwMDA4NDAgYTcgOiAwMDAwMDAwMDAwMDAwMDMwCj4gPiBbIDIx
MTAuMjI2NzIxXSAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogZmZmZmFmODAwNTE2NTgwMCBz
NCA6IGZmZmZhZjgwMDQyNGRhMDAKPiA+IFsgMjExMC4yMjY4MzhdICBzNSA6IGZmZmZmZmZmZmZm
ZmZmZmYgczYgOiBmZmZmZmZmZjgxY2M3NTkwIHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAy
MTEwLjIyNjk1NV0gIHM4IDogMDAwMDAwMDAwMDAwMDAwNiBzOSA6IDAwMDAwMDAwMDAwMDAwMDEg
czEwOiBmZmZmYWY4MDdlZmJjMzQwCj4gPiBbIDIxMTAuMjI3MDY0XSAgczExOiBmZmZmYWY4MDdl
ZmJiZjAwIHQzIDogZmZmZmFmODAwNmExNjAyOCB0NCA6IDAwMDAwMDAwZGJmYmI3OTYKPiA+IFsg
MjExMC4yMjcxODBdICB0NSA6IDAwMDAwMDA3MDAwMDAwMDAgdDYgOiBmZmZmYWY4MDA1MjY5ODcw
Cj4gPiBbIDIxMTAuMjI3Mjc3XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAw
MDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+ID4gWyAyMTEwLjIyNzQwN10g
WzxmZmZmZmZmZjgwYWVmODY0Pl0gcmlzY3ZfcG11X3N0YXJ0KzB4N2MvMHg4ZQo+ID4gWyAyMTEw
LjIyNzYyMl0gWzxmZmZmZmZmZjgwMTg1YjU2Pl0gcGVyZl9hZGp1c3RfZnJlcV91bnRocl9jb250
ZXh0KzB4MTVlLzB4MTc0Cj4gPiBbIDIxMTAuMjI3OTYxXSBbPGZmZmZmZmZmODAxODg2NDI+XSBw
ZXJmX2V2ZW50X3Rhc2tfdGljaysweDg4LzB4OWMKPiA+IFsgMjExMC4yMjgyMzVdIFs8ZmZmZmZm
ZmY4MDA2MjZhOD5dIHNjaGVkdWxlcl90aWNrKzB4ZmUvMHgyN2MKPiA+IFsgMjExMC4yMjg0NjNd
IFs8ZmZmZmZmZmY4MDBiNTY0MD5dIHVwZGF0ZV9wcm9jZXNzX3RpbWVzKzB4OWEvMHhiYQo+ID4g
WyAyMTEwLjIyODY5MF0gWzxmZmZmZmZmZjgwMGM1YmQ0Pl0gdGlja19zY2hlZF9oYW5kbGUrMHgz
Mi8weDY2Cj4gPiBbIDIxMTAuMjI5MDA3XSBbPGZmZmZmZmZmODAwYzVlMGM+XSB0aWNrX3NjaGVk
X3RpbWVyKzB4NjQvMHhiMAo+ID4gWyAyMTEwLjIyOTI1M10gWzxmZmZmZmZmZjgwMGI1ZTUwPl0g
X19ocnRpbWVyX3J1bl9xdWV1ZXMrMHgxNTYvMHgyZjQKPiA+IFsgMjExMC4yMjk0NDZdIFs8ZmZm
ZmZmZmY4MDBiNmJkYz5dIGhydGltZXJfaW50ZXJydXB0KzB4ZTIvMHgxZmUKPiA+IFsgMjExMC4y
Mjk2MzddIFs8ZmZmZmZmZmY4MGFjYzllOD5dIHJpc2N2X3RpbWVyX2ludGVycnVwdCsweDM4LzB4
NDIKPiA+IFsgMjExMC4yMjk5ODRdIFs8ZmZmZmZmZmY4MDA5MGExNj5dIGhhbmRsZV9wZXJjcHVf
ZGV2aWRfaXJxKzB4OTAvMHgxZDIKPiA+IFsgMjExMC4yMzAxNjJdIFs8ZmZmZmZmZmY4MDA4YTlm
ND5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4gPgo+ID4gVG8gcHJldmVu
dCB0aGlzIHdhcm5pbmcsIHdlIHNob3VsZCBjYWxsIHRoZSBkcml2ZXIncyAqX3BtdV9zdG9wKCkg
ZnVuY3Rpb24gYmVmb3JlIHVudGhyb3R0bGluZwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMg
TGluIDxlcmljLmxpbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAga2VybmVsL2V2ZW50cy9jb3Jl
LmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEva2VybmVsL2V2ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYwo+ID4g
aW5kZXggZGIwMTZlNDE4OTMxLi4wOThjODc1YWJlODggMTAwNjQ0Cj4gPiAtLS0gYS9rZXJuZWwv
ZXZlbnRzL2NvcmUuYwo+ID4gKysrIGIva2VybmVsL2V2ZW50cy9jb3JlLmMKPiA+IEBAIC00MTI4
LDYgKzQxMjgsNyBAQCBwZXJmX2FkanVzdF9mcmVxX3VudGhyX2NvbnRleHQoc3RydWN0IHBlcmZf
ZXZlbnRfY29udGV4dCAqY3R4LCBib29sIHVudGhyb3R0bGUpCj4gPgo+ID4gICAgICAgICAgICAg
ICAgIGlmIChod2MtPmludGVycnVwdHMgPT0gTUFYX0lOVEVSUlVQVFMpIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGh3Yy0+aW50ZXJydXB0cyA9IDA7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBldmVudC0+cG11LT5zdG9wKGV2ZW50LCAwKTsKCkJ1dCBob3cgY291bGQgdGhlIGV2
ZW50IGhhdmUgYmVlbiBzdG9wcGVkIHdpdGggYSBjYWxsIHRvIHBtdS0+c3RvcCgpCmR1cmluZyB0
aHJvdHRsaW5nPwoKPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcGVyZl9sb2dfdGhyb3R0
bGUoZXZlbnQsIDEpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnQtPnBtdS0+c3Rh
cnQoZXZlbnQsIDApOwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+IC0tCj4gPiAyLjE3LjEKPiA+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
