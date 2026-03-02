Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA4E9B340
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYNH5DHoDRDp3WTWpHj8GxALjduYU7unhMjEDFEK7c8=; b=YA2/8Jxb5SbMPz
	e7vGgmGZMOQhbqX2vObf/3U3MpFbXgD3Td0tLM4JV+KF3lHZLTLbICxOVqSuX3tJ1Peq/RIhpF/ux
	Wwplx1jgPdl0JNJsfwVRAoYgQRJDZpgAKpx4w+u9GBgKeC7Kaq3Q6EIltG+Tv+y+bYQwh2j1sU/Is
	EXj1Csmc3RbXbKOsMrGZShs42HyNSDW8CFlol9u720mhpU3mjrXn7qQOAvfcYJCKuBc1M74LuMWvr
	arAOPF6vOQ87Y7bF2IQS3xFuA+Wj9wmNVGCl5ku8Je/oDhEUYBt8cV83OEyX0m8XdIqVEqeJGOa+8
	qQPWC20CFiLBkEvnid5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzpk-0000000CcDd-48Fb;
	Mon, 02 Mar 2026 09:45:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzpi-0000000CcCx-2U5E
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 09:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F4BE44084
	for <linux-riscv@lists.infradead.org>; Mon,  2 Mar 2026 09:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC16C2BCB5
	for <linux-riscv@lists.infradead.org>; Mon,  2 Mar 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772444697;
	bh=KtgZoRvJ0nh+HBWT+KzjiQv/JSn/meKDvckzfxiJPZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gF6det0yvwTW7FoOa9cMo5EFngwACw9WvncrYKSrC8DSQWESzMAFoI3rni6fXpcYk
	 l8lQzh8H5tSCSpXHQRB/W2O8yXoXYpjwSFzMJsTOXB8SD6hm6oMEp0NaEGK6GtA6h1
	 Ew1X3iCj3uUNO2UTzb7NxSh+/hqkj3uGs2pj2rVBCGHGqpLKG9byAG5aChKr/UkGIP
	 BlZpt2SZMadp+jM6GGqG6VgYEdb8G03MancppsawjyT5G513JjFEtmO/qG/xmwnvSx
	 ZkbOG5cRQZCilEM3cOarex0KNOEyIpUfBOII44SmG+yDB35KoRk/YR4nuLTEhIPaKG
	 nyjjbhXIXX1Bw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78fc4425b6bso39518527b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 01:44:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgXEGiWr4fGVXr6oAZggv5fcRqIsm8DzyGsAxOSV1Hk/GW2W8xneXNwKevMXrc5RtFfaZgzlEkPekdag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAnEBZ3UbfP6nU7mh7KfV1Jcaam/m0eYME9R2MhlE314PWVMhJ
	LNhEp9NELd65699+eY7iSLIFWSyGEea+kmijV4QWhSLUq/pxAMNdQKv+YligQ1WUHfFnjoNj7ap
	9LCnHP3PTSEuQLJ3bZ9gBO+Ejm/jHbwM=
X-Received: by 2002:a05:690c:4884:b0:797:a162:f7fc with SMTP id
 00721157ae682-798854a4831mr78300347b3.16.1772444696576; Mon, 02 Mar 2026
 01:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20260227-ajar-wolverine-7ce1ebd79821@spud> <20260227-divinely-drift-93307c6763d8@spud>
In-Reply-To: <20260227-divinely-drift-93307c6763d8@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 10:44:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4MP41oLhJfc5gjKh=n_RBDA=EMQ4vN8avM4KNCMATzg@mail.gmail.com>
X-Gm-Features: AaiRm51-O4cXM6imi0U2BVf4r9igtWiiuA-2J8jrQ61OgiEpKoBDiD9pA6ep1Yk
Message-ID: <CAD++jLn4MP41oLhJfc5gjKh=n_RBDA=EMQ4vN8avM4KNCMATzg@mail.gmail.com>
Subject: Re: [RFC v11 1/4] gpio: mpfs: Add interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_014458_682379_E807ED93 
X-CRM114-Status: GOOD (  22.75  )
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

SGkgQ29ub3IsCgpvdmVyYWxsIHRoaXMgbG9va3Mgb2theSwgYnV0IG9uZSBkZXRhaWwgaGVyZToK
Ck9uIEZyaSwgRmViIDI3LCAyMDI2IGF0IDM6NTPigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gQWRkIHN1cHBvcnQgZm9yIGludGVycnVwdHMgdG8gdGhlIFBvbGFyRmly
ZSBTb0MgR1BJTyBkcml2ZXIuIEVhY2ggR1BJTwo+IGhhcyBhbiBpbmRlcGVuZGVudCBpbnRlcnJ1
cHQgdGhhdCBpcyB3aXJlZCB0byBhbiBpbnRlcnJ1cHQgbXV4IHRoYXQgc2l0cwo+IGJldHdlZW4g
dGhlIGNvbnRyb2xsZXJzIGFuZCB0aGUgUExJQy4gVGhlIFNvQyBoYXMgbW9yZSBHUElPIGxpbmVz
IHRoYW4KPiBjb25uZWN0aW9ucyBmcm9tIHRoZSBtdXggdG8gdGhlIFBMSUMsIHNvIHNvbWUgR1BJ
T3MgbXVzdCBzaGFyZSBQTElDCj4gaW50ZXJydXB0cy4gVGhlIGNvbmZpZ3VyYXRpb24gaXMgbm90
IHN0YXRpYyBhbmQgaXMgc2V0IGF0IHJ1bnRpbWUsCj4gY29udmVudGlvbmFsbHkgYnkgdGhlIHBs
YXRmb3JtJ3MgZmlybXdhcmUuIENvcmVHUElPLCB0aGUgdmVyc2lvbgo+IGludGVuZGVkIGZvciB1
c2UgaW4gdGhlIEZQR0EgZmFicmljIGhhcyB0d28gaW50ZXJydXB0IG91dHB1dCBwb3J0cywgb25l
Cj4gaXMgSU9fTlVNIGJpdHMgd2lkZSwgYXMgaXMgdXNlZCBpbiB0aGUgaGFyZGVuZWQgY29yZXMs
IGFuZCB0aGUgb3RoZXIgaXMKPiBhIHNpbmdsZSBiaXQgd2l0aCBhbGwgbGluZXMgT1JlZCB0b2dl
dGhlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gLS0tCj4gRG9pbmcgdGhlIGNoYWluZWQgdGhpbmcga2luZGEgY292ZXJzIGFs
bCB0aGUgYmFzZXMgYXQgdGhlIGV4cGVuc2Ugb2YgdGhlCj4gImRpcmVjdCIgbW9kZSBpbnRlcnJ1
cHRzIHRoYXQgaGF2ZSBhIGRlZGljYXRlZCBjb25uZWN0aW9uIHRvIHRoZSBQTElDLgoKQ2hhaW5l
ZCBraW5kYSB0aGluZywgT0suLi4KCgo+ICtzdGF0aWMgaXJxcmV0dXJuX3QgbXBmc19ncGlvX2ly
cV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCgpzdGF0aWMgdm9pZCBtcGZzX2dwaW9faXJx
X2hhbmRsZXIoc3RydWN0IGlycV9kZXNjICpkZXNjKQoKPiArewo+ICsgICAgICAgc3RydWN0IG1w
ZnNfZ3Bpb19jaGlwICptcGZzX2dwaW8gPSBkYXRhOwo+ICsgICAgICAgdW5zaWduZWQgaW50IGhh
bmRsZWQgPSAwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdGF0dXM7Cj4gKyAgICAgICB1MzIg
dmFsOwo+ICsgICAgICAgaW50IGk7Cj4gKwpzdHJ1Y3QgaXJxX2NoaXAgKmlycWNoaXAgPSBpcnFf
ZGVzY19nZXRfY2hpcChkZXNjKTsKCmNoYWluZWRfaXJxX2VudGVyKGlycWNoaXAsIGRlc2MpCgo+
ICsgICAgICAgcmVnbWFwX3JlYWQobXBmc19ncGlvLT5yZWdzLCBNUEZTX0lSUV9SRUcsICZ2YWwp
Owo+ICsgICAgICAgc3RhdHVzID0gdmFsOwo+ICsgICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAm
c3RhdHVzLCBNUEZTX01BWF9OVU1fR1BJTykgewo+ICsgICAgICAgICAgICAgICByZWdtYXBfd3Jp
dGUobXBmc19ncGlvLT5yZWdzLCBNUEZTX0lSUV9SRUcsIEJJVChpKSk7Cj4gKyAgICAgICAgICAg
ICAgIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEobXBmc19ncGlvLT5nYy5pcnEuZG9tYWluLCBp
KTsKPiArICAgICAgICAgICAgICAgaGFuZGxlZCsrOwo+ICsgICAgICAgfQoKY2hhaW5lZF9pcnFf
ZXhpdChpcnFjaGlwLCBkZXNjKQoKKG5vIHJldHVybiB2YWx1ZSkKCj4gIHN0YXRpYyBpbnQgbXBm
c19ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKPiAgICAgICAgIHN0cnVjdCBtcGZzX2dw
aW9fY2hpcCAqbXBmc19ncGlvOwo+ICsgICAgICAgc3RydWN0IGdwaW9faXJxX2NoaXAgKmdpcnE7
Cj4gICAgICAgICBzdHJ1Y3QgY2xrICpjbGs7Cj4gICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7
Cj4gLSAgICAgICBpbnQgbmdwaW9zOwo+ICsgICAgICAgaW50IG5ncGlvcywgbmlycXMsIHJldDsK
Pgo+ICAgICAgICAgbXBmc19ncGlvID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptcGZzX2dw
aW8pLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlmICghbXBmc19ncGlvKQo+IEBAIC0xNTcsNiAr
MjQzLDM5IEBAIHN0YXRpYyBpbnQgbXBmc19ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gICAgICAgICBtcGZzX2dwaW8tPmdjLnBhcmVudCA9IGRldjsKPiAgICAgICAg
IG1wZnNfZ3Bpby0+Z2Mub3duZXIgPSBUSElTX01PRFVMRTsKPgo+ICsgICAgICAgbmlycXMgPSBv
Zl9pcnFfY291bnQobm9kZSk7Cj4gKyAgICAgICBpZiAobmlycXMgPiBNUEZTX01BWF9OVU1fR1BJ
TykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPiArCj4gKyAgICAgICBnaXJxID0g
Jm1wZnNfZ3Bpby0+Z2MuaXJxOwo+ICsgICAgICAgZ2lycS0+bnVtX3BhcmVudHMgPSBuaXJxczsK
PiArCj4gKyAgICAgICBpZiAoZ2lycS0+bnVtX3BhcmVudHMpIHsKPiArICAgICAgICAgICAgICAg
Z3Bpb19pcnFfY2hpcF9zZXRfY2hpcChnaXJxLCAmbXBmc19ncGlvX2lycWNoaXApOwo+ICsKPiAr
ICAgICAgICAgICAgICAgZ2lycS0+cGFyZW50cyA9IGRldm1fa2NhbGxvYygmcGRldi0+ZGV2LCBn
aXJxLT5udW1fcGFyZW50cywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplb2YoKmdpcnEtPnBhcmVudHMpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAg
ICAgICAgaWYgKCFnaXJxLT5wYXJlbnRzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ICsKPiArICAgICAgICAgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBnaXJx
LT5udW1fcGFyZW50czsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gcGxh
dGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGdpcnEtPnBhcmVudHNbaV0gPSByZXQ7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGdpcnEtPnBhcmVu
dHNbaV0sIG1wZnNfZ3Bpb19pcnFfaGFuZGxlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIElSUUZfU0hBUkVELCBOVUxMLCBtcGZzX2dwaW8pOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gcmVxdWVzdCBp
cnEgZm9yIGxpbmUgJXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpKTsKPiArICAgICAgICAgICAgICAgfQoKV2h5IGRvIHRoaXMgaW5z
dGVhZCBvZiBsZXR0aW5nIHRoZSBjb3JlIGRvIHRoZSBtdWx0aS1wYXJlbnQgY2hhaW5pbmcgd2l0
aG91dApleHBsaWNpdGx5IHJlcXVlc3RpbmcgdGhlIElSUXMgbGlrZSBlLmcuIGdwaW8tZHdhcGIu
YyBkb2VzIGZvciB0aGUKbXVsdGktcGFyZW50IGNhc2U/CgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
