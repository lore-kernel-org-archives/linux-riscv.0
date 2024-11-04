Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E10D132C0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzlrNhlprTfqpjSVVVboFvUO7zGDrQP13RMedVcTIM8=; b=pATu50NY10NflD
	XLfigLPiBOAfxMCJWb5D10ollGRHC+7/rPAj3iTjHJvr0dXpvMPTq9paIx7PHZ7xQM0tfbgNUrmlV
	yiv5iK6Vb0IrpplWcPOTZ0ukVYUDp4C2MVR1fI/oDN96OVo4RAaFdCU24AgdRqw9nwrUwkxB+K4oD
	Gu1xGIdWrjVdOwvW5XA9jjXJ31r7oHLp3pdn48C8jzyvHpkEhTIk9Xs5oYVNvXinG9rg+u/wdjCix
	Ry5+IgT8SH1By7zswvvSZHyG5wa3r3oSJdXKnpyxl599nJuhEFRWiTg4yl6qG/fbAW2pNu5LyjbGp
	kF8LCQ/tkkEkrvZl+7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x0v-0000000DpOd-29aW;
	Mon, 04 Nov 2024 13:21:01 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wzQ-0000000DoxZ-1uIQ
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 13:19:30 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb5743074bso34620991fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 05:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730726366; x=1731331166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lARrYvZxE2uyY6URVf+ZDkFNyhIinmek/ei9ImL8GSc=;
        b=LwSr5DO2G4BVcxzhdXWtIzoFHmkTAWzt6e6WSnudS+1hMQ5RiSF/zgaK0bqTZYmVY4
         GmXFi0sNTZj/k67OOxMBWOtF8E15AeBZM0tW4og6HCjgP6ZDLMz93Wl48kUruzZR0XUg
         +CU9qrLwsNbkDVE4BKNjuHEIQmS9BYWzQvAwSdDly7Py0T4tbwOF1lLz3wWO3f2fx8BI
         iS+MYd2tZBv5GdAPyV+UTKCko25OLlpls7SFP1/LLDis1r50mDPEp+WzQNPq4u17/e7Q
         viyxR25CGvJK4xujxV6XPvd7c3QAg/agevlI7QIa+hYCGjpzmbUbgQd9wFwJpJL6PINL
         i0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726366; x=1731331166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lARrYvZxE2uyY6URVf+ZDkFNyhIinmek/ei9ImL8GSc=;
        b=BaGWrraD02U7K571T6GtYtooCNuwTVODCvSq9hapcdOP6hEW6uOkh/+DiGSCLlb19D
         CtoRouYxtnd1MuP5+CnBRmiCuIuNKWKHoK1UMc8zdUwSCX91uSZl7IrhpWs68Mxm4QHX
         LPWvU5k8AKU8jcghMf05QufS+Le2rwjWsy6gj9zMmkV4AVKSj8m3JCkulqBBpOITQTHs
         pcubKmrGdZEfjytdmY2+Xw/1auN+oZxElfjmJxsY+qe472+RBKeNwwpy2IYk/chuZHdn
         YXGTXrWaGBt7aweCE6aipUy+wzxXcAR4oc/LWzr9oPycMPclPEe7fNzb1ColsS0x/zIN
         hPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU66IbLB4peb9f/74pA7dbBWemZycsRLlkrhuIfOTTpoP+HP94koBWrE9gBnpgnr1lD0QslfTQvNt8vIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsM0w44V0XqXrL17HVebMuLHQPZPB9uzMKxeWEdwB/8rcOrpx/
	IWSUoJkJv5ayuxjtFO2VTiUujJohR+NAnnoknDKoyyLV984DAUuSkm0nN0EQkkIrqOKcX4cUR1/
	rGYNTM0QVCRwTCX+QbevGTJmlonAo/ibFpo1Qcg==
X-Google-Smtp-Source: AGHT+IGhPab8jh+uf869h58p1p0BRB4pFjO0xN4TR4JkldBqulhRLCRm6iMFCtQY3hH8h2hEmFSyTlBKp0y/jc43UKM=
X-Received: by 2002:a2e:a908:0:b0:2fa:d464:32d3 with SMTP id
 38308e7fff4ca-2fedb488ad0mr44010011fa.20.1730726365811; Mon, 04 Nov 2024
 05:19:25 -0800 (PST)
MIME-Version: 1.0
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
 <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
 <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com> <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com>
In-Reply-To: <CAHibDywpKUE7r4UfcudDSBZCM=JAC5s40uf+PwQE+oMvZy4aVA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 4 Nov 2024 18:49:15 +0530
Message-ID: <CAK9=C2WEU53TD+tnWRLC1iLRf+j607s=bZXevkogTnr-cmhPGw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
To: Max Hsu <max.hsu@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_051928_596349_A8FFEE1A 
X-CRM114-Status: GOOD (  27.15  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxOjE04oCvUE0gTWF4IEhzdSA8bWF4LmhzdUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9u
Lgo+Cj4gSeKAmW0gbm90IGVudGlyZWx5IHN1cmUgaWYgSSBmdWxseSB1bmRlcnN0YW5kIGl0LCBi
dXQgSSBiZWxpZXZlIHRoZQo+IGh5cGVydmlzb3Igc2hvdWxkIGJlIGFibGUgdG8gZGlzYWJsZSB0
aGUgU3Z1a3RlIGV4dGVuc2lvbi4KPgo+IEluc2lkZSB0aGUgc3dpdGNoLWNhc2Ugb2Yga3ZtX3Jp
c2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCgpLAo+IHRoZSBkZWZhdWx0IGNhc2UgYnJlYWtz
IGFuZCByZXR1cm5zIHRydWUuCj4KPiBTbyB0aGF0IG1lYW5zIHdoZW4gdGhlIEtWTV9SSVNDVl9J
U0FfRVhUX1NWVUtURSBwYXNzZWQgaW50bwo+IGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2Fs
bG93ZWQoKSBpdCB3aWxsIHJldHVybiB0cnVlLgo+Cj4gSWYgSSd2ZSBtaXN1bmRlcnN0b29kLCBw
bGVhc2UgbGV0IG1lIGtub3cuCgpJIGRvbid0IHNlZSBhbnkgY29kZSBpbiB0aGlzIHBhdGNoIHdo
aWNoIGRpc2FibGVzL2VuYWJsZXMgU3Z1a3RlIGZvcgpHdWVzdCBiYXNlZCBvbiBLVk0gT05FX1JF
RyBpbnRlcmZhY2UuCgpSZWdhcmRzLApBbnVwCgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1heCBIc3UK
Pgo+IE9uIEZyaSwgT2N0IDI1LCAyMDI0IGF0IDM6MTfigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIFNlcCAyNywgMjAyNCBhdCA3OjEy
4oCvUE0gTWF4IEhzdSA8bWF4LmhzdUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQWRk
IEtWTSBJU0EgZXh0ZW5zaW9uIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IFZNTSB0b29scyB0
bwo+ID4gPiBkZXRlY3QgYW5kIGVuYWJsZSBTdnVrdGUgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTS4K
PiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXguaHN1QHNpZml2ZS5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwg
MSArCj4gPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAxICsKPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiA+ID4gaW5kZXggZTk3ZGIzMjk2NDU2ZTE5Zjc5Y2EwMmU0YzRmNzBh
ZTFiNGFiYjQ4Yi4uNDFiNDY2YjdmZmFlYzQyMWU4Mzg5ZDNmNWIxNzg1ODAwOTFhMmM5OCAxMDA2
NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiBAQCAtMTc1LDYgKzE3
NSw3IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+ID4gPiAgICAgICAgIEtWTV9SSVND
Vl9JU0FfRVhUX1pDRiwKPiA+ID4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUCwKPiA+
ID4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdSUywKPiA+ID4gKyAgICAgICBLVk1fUklT
Q1ZfSVNBX0VYVF9TVlVLVEUsCj4gPiA+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+
ID4gPiAgfTsKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gPiA+IGluZGV4IGIzMTljNGMx
M2M1NGNlMjJkMmE3NTUyZjRjOWYyNTZhMGM1MDc4MGUuLjY3MjM3ZDZlNTM4ODJhOWZjZDJjZjI2
NWFhMTcwNGYyNWNjNGE3MDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
b25lcmVnLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ID4gPiBA
QCAtNDEsNiArNDEsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9h
cnJbXSA9IHsKPiA+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4gPiA+ICAg
ICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNWTkFQT1QpLAo+ID4gPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihTVlBCTVQpLAo+ID4gPiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlVLVEUpLAo+ID4g
PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUNBUyksCj4gPiA+ICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFpBV1JTKSwKPiA+ID4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkJBKSwKPiA+Cj4g
PiBUaGUgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZVS1RFIHNob3VsZCBiZSBhZGRlZCB0byB0aGUKPiA+
IHN3aXRjaC1jYXNlIGluIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSBiZWNh
dXNlCj4gPiBoeXBlcnZpc29yIHNlZW1zIHRvIGhhdmUgbm8gd2F5IHRvIGRpc2FibGUgU3Z1a3Rl
IGZvciB0aGUgR3Vlc3QKPiA+IHdoZW4gaXQncyBhdmFpbGFibGUgb24gdGhlIEhvc3QuCj4gPgo+
ID4gUmVnYXJkcywKPiA+IEFudXAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
