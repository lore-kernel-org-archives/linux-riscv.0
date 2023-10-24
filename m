Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B8C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1tY7wK4mi6ggPDu/JlhvK+Ouz5GYHMYgE74oLTAwTU=; b=IImsHSrQReDKWe
	NCdex1YmeH8XwRABPJuycXs23p70rr67uzaGjexxwZEjn6pAnfUVFWRwRqAJG/dz6qDXp/iIhIdr+
	MP+vx5GzzhO0/VVo4ZOoWIctiMIrl1zbVvB4bAAOLh02siX+BOTgMrRQQtrojg0aGL/meS138j1dd
	bjDiwEScLiQCz0tbudKEfwJrjIBaohX6+h5DNW4bhxJun7RUM1FERj5bdcPnQum1M8lk/Wdf8UmBl
	UnPwfRDj4fxutzsGq9vbrEicOlftaSBacT2STnSbtoLdEK3D2q9AviJu3oq6KHABPvxot99x/3w9n
	HIyPHoD4PWaP+GKDfqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKPs-00AWA5-0Y;
	Tue, 24 Oct 2023 16:38:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKPo-00AW5k-0T
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 16:38:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5079f6efd64so6544702e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698165474; x=1698770274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ00iT5MBLthBXpEW1UVbJpzOdfkXUyxCtvUUc+C6ro=;
        b=M2gMBVS2w3IAPqsHFDRHZkcvvHHu96bC4DdRngLS7HGi5Q6IrYCzQQmycr+D61euWs
         hvCLsotyMvq0XYLDPUQ2nTxPrYWBPFLZ5LAP0Y+RJf757lUrS0CKsy9JAdPrYFv8ojkk
         zhPVTh1DybpcBBGEvFlgHc2BSv92+BWSvo/BT7Sq1Oa8Xk4yog/Vhvk04bgo3S82VrD7
         QXYRiiH2/eYULe1eZCobEzdUAdUesm+cxG9vc+AxK9HqAUZ7c1VjME32faqrxBKIOa7g
         O7y6IB0z0YnJFfEPpGYnNlwyK3EIdpOVbQzo1bsOagYfnscL+dsceMio94muDl6cDTN5
         1ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165474; x=1698770274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ00iT5MBLthBXpEW1UVbJpzOdfkXUyxCtvUUc+C6ro=;
        b=kVjT02SNVE46PkCEyipW0oJnewdAjGnMjebjanfx3DNF5yZ6hV4KRoYPLlQKPaGOkc
         RDbqeXGzvVL0cAAgCL8eCk1R7Vr6F1WCIrdeFhAcVwYkFZ7v9KuY9YF0+9mqTvc0ZeM+
         /dxeTDV0qlQkXVbZ2jl1sjxBQJLvyQ+Q/YrR2LUkETd6dWktO8unM7xUB+t0XDY96nRj
         o2hdFtsNv0NAkIA08SNieMotbq6Bhx8XojYmgHWFtYK+SgYc/b39Ly7YIAgPVi4G5PIJ
         RGL22vkimWuRA3cJTivejl7oYZBZI2RoU7r0E0xxKHvBWqegC9HKx+5r45+bt1y5JYUM
         zqtQ==
X-Gm-Message-State: AOJu0YyxwIxRVPPti5uPpXYt7anSnFBjNkw42Ha9/kn2L1ViylM7E0bU
	xOGLLBSqLegY3u3sC1O7DcMMRxTuL9ydmfHEn34ueg==
X-Google-Smtp-Source: AGHT+IHU0SuW8qIrTkg9+1VPEqjIrc2hDcfHXiQbZ/0vtxjVpobAABBwhRBFea6xvpHVBg9QxcWjpITCntgT0kGXieE=
X-Received: by 2002:ac2:5104:0:b0:507:b17a:709e with SMTP id
 q4-20020ac25104000000b00507b17a709emr9561597lfb.1.1698165473946; Tue, 24 Oct
 2023 09:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-3-cleger@rivosinc.com>
 <CALs-HssmufWCKzaGy7BwWz4n4hfwV9NjjRD-O_JeupM-p=Ov+w@mail.gmail.com>
 <d0ea4996-5c48-47b4-99b0-f4211276e0b2@rivosinc.com> <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
In-Reply-To: <56f6af04-bdf4-4b85-99dc-9eb4f391d7ad@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 24 Oct 2023 09:37:17 -0700
Message-ID: <CALs-Hsvy411MnHQXHLK8u4JmM+LO5R2tuCxY6zQco7BKJONqPA@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] riscv: add ISA extension parsing for scalar crypto
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_093800_420060_719751AE 
X-CRM114-Status: GOOD (  31.30  )
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

T24gVHVlLCBPY3QgMjQsIDIwMjMgYXQgMjozMOKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjQvMTAvMjAyMyAwOToxOCwgQ2zDqW1l
bnQgTMOpZ2VyIHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAyMy8xMC8yMDIzIDE4OjIxLCBFdmFuIEdy
ZWVuIHdyb3RlOgo+ID4+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDY6MTXigK9BTSBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBGcm9tOiBF
dmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+Pj4KPiA+Pj4gVGhlIFNjYWxhciBDcnlw
dG8gc3BlY2lmaWNhdGlvbiBkZWZpbmVzIFprIGFzIGEgc2hvcnRoYW5kIGZvciB0aGUKPiA+Pj4g
WmtuLCBaa3IgYW5kIFprdCBleHRlbnNpb25zLiBUaGUgc2FtZSBmb2xsb3dzIGZvciBib3RoIFpr
biwgWmtzIGFuZCBaYmssCj4gPj4+IHdoaWNoIGFyZSBhbGwgc2hvcnRoYW5kcyBmb3IgdmFyaW91
cyBvdGhlciBleHRlbnNpb25zLiBUaGUgZGV0YWlsZWQKPiA+Pj4gYnJlYWtkb3duIGNhbiBiZSBm
b3VuZCBpbiB0aGVpciBkdC1iaW5kaW5nIGVudHJpZXMuCj4gPj4+Cj4gPj4+IFNpbmNlIFprbiBh
bHNvIGltcGxpZXMgdGhlIFpia2IsIFpia2MgYW5kIFpia3ggZXh0ZW5zaW9ucywgc2ltcGx5IHBh
c3NpbmcKPiA+Pj4gInprIiB0aHJvdWdoIGEgRFQgc2hvdWxkIGVuYWJsZSBhbGwgb2YgWmJrYiwg
WmJrYywgWmJreCwgWmtuLCBaa3IgYW5kIFprdC4KPiA+Pj4gRm9yIGV4YW1wbGUsIHNldHRpbmcg
dGhlICJyaXNjdixpc2EiIERUIHByb3BlcnR5IHRvICJydjY0aW1hZmRjX3prIgo+ID4+PiBzaG91
bGQgZ2VuZXJhdGUgdGhlIGZvbGxvd2luZyBjcHVpbmZvIG91dHB1dDoKPiA+Pj4gInJ2NjRpbWFm
ZGNfemljbnRyX3ppY3NyX3ppZmVuY2VpX3ppaHBtX3pia2JfemJrY196Ymt4X3prbmRfemtuZV96
a25oX3prcl96a3QiCj4gPj4+Cj4gPj4+IHJpc2N2X2lzYV9leHRfZGF0YSBncm93cyBhIHBhaXIg
b2YgbmV3IG1lbWJlcnMsIHRvIHBlcm1pdCBzZXR0aW5nIHRoZQo+ID4+PiByZWxldmFudCBiaXRz
IGZvciAiYnVuZGxlZCIgZXh0ZW5zaW9ucywgYm90aCB3aGlsZSBwYXJzaW5nIHRoZSBJU0Egc3Ry
aW5nCj4gPj4+IGFuZCB0aGUgbmV3IGRlZGljYXRlZCBleHRlbnNpb24gcHJvcGVydGllcwo+ID4+
Pgo+ID4+PiBDby1kZXZlbG9wZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2
b3NpbmMuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Cj4gPj4KPiA+PiBNeSB0cmVlIG1pZ2h0IGJlIG91dCBvZiBzeW5jLCBidXQg
aW4gbXkgc2VhcmNoIGZvciByaXNjdl9pc2FfZXh0LCBJCj4gPj4gYWxzbyBmb3VuZCBhIHVzZSBp
biBwcmludF9pc2EoKSAoY3B1LmMpIHdoZXJlIHdlJ3JlIHJlYWNoaW5nIGludG8KPiA+PiByaXNj
dl9pc2FfZXh0W10uaWQgYW5kIGFzc3VtaW5nIGl0J3MgYWx3YXlzIHZhbGlkLiBJZiB0aGF0J3Mg
c3RpbGwgaW4KPiA+PiB0aGVyZSB3ZSdsbCB3YW50IHRvIGZpeCB1cCB0aGF0IHNwb3QgdG9vLCBz
aW5jZSBub3cgd2l0aCBidW5kbGVzIC5pZAo+ID4+IG1heSBvciBtYXkgbm90IGJlIHZhbGlkLgo+
ID4KPiA+IE9oIGluZGVlZCwgdGhlIGFycmF5IGlzIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGNv
bXBpbGF0aW9uIHVuaXQgOi8uCj4gPiBJJ2xsIGNoZWNrIHRoYXQgYmVmb3JlIHNlbmRpbmcgVjMu
Cj4KPiBBZnRlciBsb29raW5nIGEgYml0IG1vcmUgYXQgdGhhdCwgaXQgYWN0dWFsbHkgc2VlbXMg
dGhhdCBpZCBpcyB1c2VkIGluCj4gY3B1aW5mbyB0byBkZXRlcm1pbmUgd2hpY2ggZXh0ZW5zaW9u
cyBhcmUgcHJlc2VudCB3aGljaCBtZWFucyB5b3UgYXJlCj4gcmlnaHQsIGJ1bmRsZV9zaXplIG5l
ZWRzIHRvIGJlIGFjY291bnRlZCBmb3IuCj4KPiBMb29raW5nIGF0IGl0IGFsc28gcmFpc2VzIHRo
ZSBxdWVzdGlvbiAoYWdhaW4pIG9mIGV4cG9zaW5nIHRoZSAiYnVuZGxlcyIKPiBleHRlbnNpb25z
IHRoZW1zZWx2ZXMgb3Igbm90IGluIGNwdWluZm8gb3V0cHV0LiBXaXRoIHRoZSBjdXJyZW50IHNl
dHVwLAo+IHRoZSBidW5kbGVzIGV4dGVuc2lvbnMgd29uJ3QgYmUgdmlzaWJsZSBpbiBjcHVpbmZv
IG91dHB1dC4gRm9yIGluc3RhbmNlCj4gaWYgWmsgd2FzIGluIHRoZSBpc2Egc3RyaW5nLCB0aGVu
IGl0IHdpbGwgbm90IGJlIHZpc2libGUgaW4gdGhlIGNwdWluZm8KPiBvdXRwdXQsIG9ubHkgdGhl
IGNoaWxkIGV4dGVuc2lvbnMuIE9uZSBzb2x1dGlvbiB3b3VsZCBiZSB0byBhbHdheXMgaGF2ZQo+
IGEgdmFsaWQgaWQgZm9yIGVhY2ggZXh0ZW5zaW9uLiBTbyB3ZSB3b3VsZCBoYXZlIG9uZSBmb3Ig
WmsgZm9yIGluc3RhbmNlLgo+Cj4gV2Ugd291bGQgdGhlbiBoYXZlIGEgc2ltaWxhciBzZXR1cCBm
b3IgYWxsICJidW5kbGVzIiBvciAic3Vic2V0Igo+IGV4dGVuc2lvbnMsIHRoZXkgd291bGQgaGF2
ZSBhIGlkIGZvciBhbGwgb2YgdGhlbS4gRm9yIGluc3RhbmNlLCBaayB3b3VsZAo+IGJlY29tZToK
Pgo+IF9fUklTQ1ZfSVNBX0VYVF9EQVRBX0JVTkRMRSh6aywgUklTQ1ZfSVNBX0VYVF9aSywgcmlz
Y3ZfemtfYnVuZGxlZF9leHRzKQo+Cj4gU2FtZSB3b3VsZCBnbyBmb3IgenZiYiAocmlzY3ZfenZi
Yl9zdWJzZXRfZXh0cyB3b3VsZCBvbmx5IGNvbnRhaW4gWnZrYik6Cj4KPiBfX1JJU0NWX0lTQV9F
WFRfREFUQV9CVU5ETEUoemssIFJJU0NWX0lTQV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9zdWJzZXRf
ZXh0cykKPgo+IEZvciB0aGUgc2FrZSBvZiBjb21wbGV0ZW5lc3MsIEkgZmVlbCBsaWtlIGl0IHdv
dWxkIGJlIGdvb2QgdG8gaGF2ZSBhbGwKPiB0aGUgZXh0ZW5zaW9ucyAoYnVuZGxlcyBvciBub3Qp
IHZpc2libGUgaW4gdGhlIHJpc2N2X2lzYV9leHQuCj4KPiBBbnkgb2JqZWN0aW9uID8KCkkgY291
bGQgYmUgcGVyc3VhZGVkIHRoYXQgaXQncyBhIGdvb2QgaWRlYSwgYnV0IHRoZXJlIGFyZSBhcmd1
bWVudHMgdG8KYmUgbWFkZSBmb3Igbm90IGRlZmluaW5nIHRoZW0gYXMgc2VwYXJhdGUgYml0czoK
CjEuIEhhdmluZyB0d28gKHNldHMgb2YpIGJpdHMgdGhhdCBtZWFuIHRoZSBzYW1lIHRoaW5nIG1l
YW5zIHVzZXJtb2RlCm5vdyBoYXMgdG8gZGVjaWRlIHdoaWNoIG9uZSB0byBxdWVyeSwgb3IgcXVl
cnkgYm90aC4gTXVsdGlwbGUgdmFsdWVzCnRoYXQgbWVhbiB0aGUgc2FtZSB0aGluZyBpcyBhbHdh
eXMgc29tZXRoaW5nIHRoYXQgbWFrZXMgbWUgbmVydm91cy4KMi4gVG8gYXZvaWQgdGhlc2UgdHdv
IHNldHMgaGF2aW5nIGRpZmZlcmVudCBhbnN3ZXJzLCB3ZSdkIGhhdmUgdG8Kc29sdmUgdGhlIHJl
dmVyc2UgcHJvYmxlbSB0b286IElmIGFsbCBvZiB0aGUgYnVuZGxlZCBleHRlbnNpb25zIHRoYXQK
bWFrZSB1cCBaayBhcmUgb24sIHdlJ2QgbmVlZCB0byBkZXRlY3QgdGhhdCBhbmQgdHVybiBaayBv
biBhcyB3ZWxsLgpUaGF0IGNvZGUgd291bGQgYWxzbyBuZWVkIHRvIGtub3cgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiBhIHB1cmUgbGFzc28KbGlrZSBaaywgd2hlcmUgeW91IHNob3VsZCBmbGlwIGl0
IG9uIGlmIGl0cyBjb21wb25lbnRzIGFyZSBvbiwgYW5kIHRoZQpsb29zZSBjaGFuZ2UgdmFyaWFu
dCB3ZSB3ZXJlIGRpc2N1c3Npbmcgb24gdGhlIG90aGVyIHRocmVhZCAoWnZrYj8pLAp3aGVyZSB5
b3UgY2Fubm90LgoKUHJldGVuZGluZyBwdXJlIGxhc3NvIGV4dGVuc2lvbnMgZGlkbid0IGV4aXN0
IG9uIHRoZWlyIG93biB3YXMgYSB3YXkKdG8gc2lkZXN0ZXAgdGhlIHByb2JsZW0uCi1FdmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
