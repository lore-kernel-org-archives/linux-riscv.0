Return-Path: <SRS0=0g6C=K3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4AFC47080
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 10:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C5C613AD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 10:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C5C613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHdlwWjBo2EcjpV5AneBHC6TCd2K/p15/oHxWN2DPiU=; b=cbxqmRqIwNypi/
	YeSZzFjDq/vonT72ViM43nSPRgj9uykGeTGRrYerw4LUTriHxZCgZfgsE03qaWUrIiAf8EC9FwKaW
	FirjN+mE3U6SFpUzaMyBVB7UEV4GR/tO6yDdQDTlH09ylR6cuH42O857lkjKiKuhcNblC9W86sorP
	/mCvDufuZvxEoDjenfXSjxTrSOPpCxfmSZwIR4sXVpERqWzCglj+LXR1gtkM0ZHOUxKrafMwgcoW1
	bp/AR7lpcCC7N3Pki4EinLU+XHFAMZpGth2nsUQXAeCno99IMNMQz7zB6v+O+09G2xcQLU9XzaBFp
	teq4bgI6iiUWAT0ydlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo1wz-00G3ui-9M; Tue, 01 Jun 2021 10:48:45 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo1wv-00G3sI-HP
 for linux-riscv@lists.infradead.org; Tue, 01 Jun 2021 10:48:43 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id s107so16681421ybi.3
 for <linux-riscv@lists.infradead.org>; Tue, 01 Jun 2021 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vHWXwHdrf+SpAY1R+QQ9SLPMaJjOtheXZxEyrp2mlm4=;
 b=c3CkPxKUvLz7qLkj6z4StYTCRXk6JgZiglQ9JBDxksRoIbTXnanZpQHBRXczPVdNJI
 ED10qAJWnPVA9BvKVkcSUPP3KvETpPglxEixAA+EZ8M2MtVSyZ9jHWJevCcm4g02DYaI
 VtBR5s3/6nlOU6oxdch70N2bgTGt78mchF2V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vHWXwHdrf+SpAY1R+QQ9SLPMaJjOtheXZxEyrp2mlm4=;
 b=jdDd40o2xae4KLW39fM/ltiYoVm9GT/OrEWqLInX51VQhEkkWx49Tpy8wZmsnWO5ej
 ppvRV81sZolioy0I8X1Q/AMd6bqS1Y9O1ODmzKPK91n2tZIzCQjmfMazg/M4hit/pAqq
 yfJx9kIlzGUVNZAwa4qdl6QzValQPWewefoaP13HVZJwQ+sfmp20YMV5B1N4NtSFH5AD
 R5l4VKO3yeoKUQ2VdQndhq8fU5vodKY+aElMQ1Pp2OopRy9HCdwBV5odzazTiYZRUQqf
 d0gwUjm/UOH5dP6jR2Jsxfgr0Ys8SBikMF0tW0/Xy4ZgnyvYlYB41t5X8QgnxRE01fwS
 JtOw==
X-Gm-Message-State: AOAM530nO3QC0Ww9x8ckoBlPmbOAOHh41fE6epz3Zh+HEHoswLNoWNuA
 4O6EzhH0LNDntlfdTpZGXT3JjOhAUimjogppfmswMA==
X-Google-Smtp-Source: ABdhPJxZxCyk1Ss2osp7d7BP2Esx+7urpayxglIs6s80rFyyxyM14ZcbwDxkjnbrh3HDO++Xd7GzS0OATYSWG9BWdZU=
X-Received: by 2002:a5b:307:: with SMTP id j7mr34512850ybp.481.1622544518564; 
 Tue, 01 Jun 2021 03:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210531085342.17494-1-vitaly.wool@konsulko.com>
 <62961217-1733-eaa3-b072-cbb252620c9a@ghiti.fr>
In-Reply-To: <62961217-1733-eaa3-b072-cbb252620c9a@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Tue, 1 Jun 2021 12:48:27 +0200
Message-ID: <CAM4kBBJ_3KF52UtC7LB=zwB_ohgv6wKWhN7kQuAG+4rCV4tQTA@mail.gmail.com>
Subject: Re: [PATCH] riscv: xip: support runtime trap patching
To: Alex Ghiti <alex@ghiti.fr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_034841_626205_7D3C8D3E 
X-CRM114-Status: GOOD (  28.46  )
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

T24gTW9uLCBNYXkgMzEsIDIwMjEgYXQgNToxNyBQTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPgo+IEhpIFZpdGFseSwKPgo+IExlIDMxLzA1LzIwMjEgw6AgMTA6NTMsIFZpdGFs
eSBXb29sIGEgw6ljcml0IDoKPiA+IFJJU0NWX0VSUkFUQV9BTFRFUk5BVElWRSBwYXRjaGVzIHRl
eHQgYXQgcnVudGltZSB3aGljaCBpcyBjdXJyZW50bHkKPiA+IG5vdCBwb3NzaWJsZSB3aGVuIHRo
ZSBrZXJuZWwgaXMgZXhlY3V0ZWQgZnJvbSB0aGUgZmxhc2ggaW4gWElQIG1vZGUuCj4gPiBTaW5j
ZSBydW50aW1lIHBhdGNoaW5nIGNvbmNlcm5zIG9ubHkgdHJhcHMgYXQgdGhlIG1vbWVudCwgbGV0
J3MganVzdAo+ID4gaGF2ZSBhbGwgdGhlIHRyYXBzIHJlc2lkZSBpbiBSQU0gYW55d2F5IGlmIFJJ
U0NWX0VSUkFUQV9BTFRFUk5BVElWRQo+ID4gaXMgc2V0LiBUaHVzLCB0aGVzZSBmdW5jdGlvbnMg
d2lsbCBiZSBwYXRjaC1hYmxlIGV2ZW4gd2hlbiB0aGUgLnRleHQKPiA+IHNlY3Rpb24gaXMgaW4g
Zmxhc2guCj4gPgo+Cj4gVGhpcyBzb3VuZHMgbGlrZSBhIGdvb2QgZml4IGZvciBzaWZpdmUgcGxh
dGZvcm1zIHRvIHdvcmsgd2l0aCBYSVAga2VybmVsCj4gaW4gNS4xMzogZGlkIHlvdSB0ZXN0IHRo
YXQgaXQgYWN0dWFsbHkgd29ya3Mgb24gSFc/CgpJIGRvbid0IGhhdmUgYW55IFNpRml2ZSBIVyBz
byBzdHJpY3RseSBzcGVha2luZywgbm90IHF1aXRlLiBIb3dldmVyLCBJCmNyZWF0ZWQgYSB0ZXN0
IGNvbmZpZ3VyYXRpb24gZm9yIFBvbGFyZmlyZSB3aXRoIGEgYmFzaWNhbGx5IG5vLW9wCnJ1bnRp
bWUgcGF0Y2hpbmcgYW5kIGl0IGFwcGFyZW50bHkgd29ya2VkLiBUcmFwcyBlbmQgdXAgaW4gUkFN
IGFuZCBhcmUKY2hhbmdlYWJsZS4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgV29vbCA8dml0
YWx5Lndvb2xAa29uc3Vsa28uY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgICAgICAgICAgIHwgMTMgKysrKysrKysrLS0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5l
bC92bWxpbnV4LXhpcC5sZHMuUyB8IDE1ICsrKysrKysrKysrKysrLQo+ID4gICAyIGZpbGVzIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4gPiBpbmRleCAwNzIxYjk3OTg1OTUuLjdiYzg4ZDhhYWI5NyAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKPiA+IEBAIC04Niw4ICs4NiwxMyBAQCBzdGF0aWMgdm9pZCBkb190cmFwX2Vycm9yKHN0cnVj
dCBwdF9yZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCBjb2RlLAo+ID4gICAgICAgfQo+ID4gICB9
Cj4gPgo+ID4gKyNpZiBkZWZpbmVkIChDT05GSUdfWElQX0tFUk5FTCkgJiYgZGVmaW5lZCAoQ09O
RklHX1JJU0NWX0VSUkFUQV9BTFRFUk5BVElWRSkKPiA+ICsjZGVmaW5lIF9fdHJhcF9zZWN0aW9u
ICAgICAgICAgICAgICAgX19zZWN0aW9uKCIueGlwLnRyYXBzIikKPiA+ICsjZWxzZQo+ID4gKyNk
ZWZpbmUgX190cmFwX3NlY3Rpb24KPiA+ICsjZW5kaWYKPgo+IE1heWJlIHdlIGNvdWxkIGRvIHNv
bWV0aGluZyBtb3JlIGdlbmVyaWMuIEF0IHRoZSBtb21lbnQsIG9ubHkgdHJhcHMgYXJlCj4gc3Vi
amVjdCB0byBhbHRlcm5hdGl2ZXMgYnV0IHRoYXQgd2lsbCBsaWtlbHkgZXhwYW5kOiB3aGF0IGFi
b3V0IHJhdGhlcgo+IGRlZmluaW5nIGEgc2VjdGlvbiBjYWxsZWQgX19hbHRlcm5hdGl2ZV9zZWN0
aW9uPwo+Cj4gPiAgICNkZWZpbmUgRE9fRVJST1JfSU5GTyhuYW1lLCBzaWdubywgY29kZSwgc3Ry
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtYXNtbGlua2FnZSBfX3Zpc2li
bGUgdm9pZCBuYW1lKHN0cnVjdCBwdF9yZWdzICpyZWdzKSAgICAgICAgICAgICAgICAgXAo+ID4g
K2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgbmFtZShzdHJ1Y3QgcHRf
cmVncyAqcmVncykgIFwKPiA+ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICBkb190cmFwX2Vycm9y
KHJlZ3MsIHNpZ25vLCBjb2RlLCByZWdzLT5lcGMsICJPb3BzIC0gIiBzdHIpOyAgICAgXAo+ID4g
ICB9Cj4gPiBAQCAtMTExLDcgKzExNiw3IEBAIERPX0VSUk9SX0lORk8oZG9fdHJhcF9zdG9yZV9t
aXNhbGlnbmVkLAo+ID4gICBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVn
cyAqcmVncyk7Cj4gPiAgIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVn
cyAqcmVncyk7Cj4gPgo+ID4gLWFzbWxpbmthZ2Ugdm9pZCBkb190cmFwX2xvYWRfbWlzYWxpZ25l
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICthc21saW5rYWdlIHZvaWQgX190cmFwX3NlY3Rp
b24gZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgIHsK
PiA+ICAgICAgIGlmICghaGFuZGxlX21pc2FsaWduZWRfbG9hZChyZWdzKSkKPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gQEAgLTExOSw3ICsxMjQsNyBAQCBhc21saW5rYWdlIHZvaWQgZG9f
dHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKPiA+ICAgfQo+ID4K
PiA+IC1hc21saW5rYWdlIHZvaWQgZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+ID4gK2FzbWxpbmthZ2Ugdm9pZCBfX3RyYXBfc2VjdGlvbiBkb190cmFwX3N0
b3JlX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgIHsKPiA+ICAgICAgIGlm
ICghaGFuZGxlX21pc2FsaWduZWRfc3RvcmUocmVncykpCj4gPiAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+IEBAIC0xNDYsNyArMTUxLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdl
dF9icmVha19pbnNuX2xlbmd0aCh1bnNpZ25lZCBsb25nIHBjKQo+ID4gICAgICAgcmV0dXJuIEdF
VF9JTlNOX0xFTkdUSChpbnNuKTsKPiA+ICAgfQo+ID4KPiA+IC1hc21saW5rYWdlIF9fdmlzaWJs
ZSB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiArYXNtbGlua2Fn
ZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2JyZWFrKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+ID4gICB7Cj4gPiAgICNpZmRlZiBDT05GSUdfS1BST0JFUwo+ID4gICAgICAg
aWYgKGtwcm9iZV9zaW5nbGVfc3RlcF9oYW5kbGVyKHJlZ3MpKQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3ZtbGludXgteGlwLmxkcy5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvdm1s
aW51eC14aXAubGRzLlMKPiA+IGluZGV4IDRiMjliOTkxN2Y5OS4uYTNmZjA5YzRjM2Y5IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC14aXAubGRzLlMKPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgteGlwLmxkcy5TCj4gPiBAQCAtOTksOSArOTksMjIg
QEAgU0VDVElPTlMKPiA+ICAgICAgIH0KPiA+ICAgICAgIFBFUkNQVV9TRUNUSU9OKEwxX0NBQ0hF
X0JZVEVTKQo+ID4KPiA+IC0gICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwo+ID4gKyAgICAgLiA9
IEFMSUdOKDgpOwo+ID4gKyAgICAgLmFsdGVybmF0aXZlIDogewo+ID4gKyAgICAgICAgICAgICBf
X2FsdF9zdGFydCA9IC47Cj4gPiArICAgICAgICAgICAgICooLmFsdGVybmF0aXZlKQo+ID4gKyAg
ICAgICAgICAgICBfX2FsdF9lbmQgPSAuOwo+ID4gKyAgICAgfQo+ID4gICAgICAgX19pbml0X2Vu
ZCA9IC47Cj4gPgo+ID4gKyAgICAgLiA9IEFMSUdOKDE2KTsKPgo+IFdoeSAxNiBoZXJlPwoKSG9u
ZXN0bHksIEkgZG9uJ3QgcmVtZW1iZXIuIEkgYmVsaWV2ZSBpdCBzaG91bGQgaGF2ZSBiZWVuIDgg
YnV0IGRpZG4ndApib3RoZXIgdG8gY2hlY2ssIHRob3VnaHQgaXQgd2FzIG5vdCBhIGJpZyBkZWFs
IGFueXdheSA6KQoKQmVzdCByZWdhcmRzLAogICBWaXRhbHkKCj4gPiArICAgICAueGlwLnRyYXBz
IDogewo+ID4gKyAgICAgICAgICAgICBfX3hpcF90cmFwc19zdGFydCA9IC47Cj4gPiArICAgICAg
ICAgICAgICooLnhpcC50cmFwcykKPiA+ICsgICAgICAgICAgICAgX194aXBfdHJhcHNfZW5kID0g
LjsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwo+ID4g
ICAgICAgLnNkYXRhIDogewo+ID4gICAgICAgICAgICAgICBfX2dsb2JhbF9wb2ludGVyJCA9IC4g
KyAweDgwMDsKPiA+ICAgICAgICAgICAgICAgKiguc2RhdGEqKQo+ID4KPgo+IFRoYW5rcywKPgo+
IEFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
