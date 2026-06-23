Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96235CDB46F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3t21t37M4CpKXXhFyXjCAhnw5mhPKvP4jWg+ckOf2K4=; b=lg3PkyyJJjMjtF
	bEr38P1wTVdWLeMJgVWeosrn6YLaqY0Y0yWMIzg09Yd+yLMg82H3mVuci5G/UAcWu97uRoqcZRQfT
	WykP55JYMDe3zl+cHue8fZfTC9YcybYjDatdzatVFWXNE4vs23+lA3SvL0GMt7ka6j4c10uRYB1PJ
	kQLbi8xwMou5NfuXpB/4dy9sHSd31Svj8YK+dbx41Fa8s7VU+leGWxIZcSmDOQVBwgLqD8VWg/ivE
	sGj8S/GpIbHZGdX5RtSHWV2+RGFOH4F0R6qN6EvcjlaCxCjVHkH9SZHzlNKTZKgQ6VcdF6uoABI+8
	W9r3IqWYwdWrfLcX3H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxJb-000000060CU-2zsM;
	Tue, 23 Jun 2026 09:21:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxJZ-000000060C7-23WQ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 09:21:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69796a9f04bso3925950a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 02:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782206463; cv=none;
        d=google.com; s=arc-20240605;
        b=HkM91enbt52lMsMdYKdfH94rwVlvYhj3ubndyAnz/bTIf9sUL33ow8Gq0SZwjww5CP
         y5t++EAqfDeFq3nrpc5obZ0M9TWwZYPhHmx3tvDsfv2FnJySdC68XTre0zrS6PZJf3bp
         oJLCgJSFGLHaZ1m39oXfGpcPcObe7POcrhulObqXtfWUBF1xewk6Ucxj2yc5TX+dd7Kp
         oAkmbiUuXs6pNqgziq1+46GQMQCfYgSGo1ObwSlGbBO54i+2S07TqfQZUQrS1ZfHqfO4
         IZ64y5fE4j1AKxgPSFbYj3qF7zrTLEvvb1RQkqAaVi31GKMaatfzqu3LmD2PqBUHGtw2
         Xjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRSPyw2uD/0nbJQbNYT3xx1O6Luzi05v5vrtutI5yXU=;
        fh=3rVco0LvWzrucop4La4waUpQGSaaSsugCkhmULb1Y5U=;
        b=VGoo+Ot1iTujNNgktzyuPOzfNbFSwCRv8IErFIQyYjS9D7w5v90eVavEA8s/rr1ijn
         B/2JS4PvNn92Y591uSLGvmVSzoIA1pqnuyktYzLnZWGu09OjMZlVg25VeGLqjotlDZ85
         V5e3JF7TxOvm0xCKLjRdDgWrTQ9jgRhhhZXCJVjhKROmwFRdVFiGQdDdiwDXLURawqYR
         r4WZ2pi7vjFcOl4eyj5vN1QbXJi50vs+bXhKB7kPieDVdPUQWGXZA32DJQN6o73TVg/q
         aBczPEKatwvswpvcOUtet91B7HfuwnwdG77hqxZSZAbNdE1EkKR7ni0pTfu++cixVOU+
         cn0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782206463; x=1782811263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRSPyw2uD/0nbJQbNYT3xx1O6Luzi05v5vrtutI5yXU=;
        b=M/twOHp9dlZCvMF9nt0vN0VnFWk5vkt5CAWpMazUCvSAfvA6PQag7skL3l/him/v0G
         JowZYaysQN2rXHmM8bgQYR409CGr8IWAqb1OLVUIHvnrpUCYHGYWd/zXoPM+RBmWEjDN
         cRqgKo84y8EiyrQI/ZrA6jQvbumhCFOu9RiNzQJbXcAx1PHRvKM6Vm2Yl4Z9LxGkxo2r
         v5+B9WyLZULuynEOvQ3J6eImEDdRJTjfG0mi26ePAUZAEZUSLMgnCMZmKSMKI4wj97jc
         dX23bEvWE6DdBCqBGG4d1ECLk6L8lcKHWehw1iIo4MuXOdX9zfDHcTdejuQ0ZMvOFQsO
         6J/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206463; x=1782811263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRSPyw2uD/0nbJQbNYT3xx1O6Luzi05v5vrtutI5yXU=;
        b=rR+2uRo/1p8QNUhnS3ON7nMdF7s7DD05/acsJLydHo8mRNI7Fi9FYZKe1fFrmQvHLE
         grFLeVcxt1NNnQ/25IdLhDbO64AYiz8IIxkOAO6qCEeAc15v0xZm8Qr1npgFtBszPBUS
         KLPlUwtzpVHkSyaocfO2dwGMnvHl9jED2vtM4FWiZU9PNI0pz2BR5oziiyovNSdWgnFg
         Yke04shNjKjsVkHA46fZhp4tyddZk/3wEhlnyHZrI26/EJIcIYLtzv28wCFGg2BZvIjs
         NRRAl1D7KSRypmAOG8jqMelzQrR5LRAWrrc4cUVoRFBqToUbebnYXy7f6Tm22XdiQVIe
         xdFA==
X-Forwarded-Encrypted: i=1; AFNElJ9wDNx/E4MHy77jZ6UIZ1NZHrcNwkayGND17UHprRFusX3/eHuVQVpB/gcet4qH5th+iTLbiiFfs4RVRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2aseD84AtE/dY99/b67m7rCroQ6QCCUmsY3EBaU8BGXX5+kO
	irSObzFnb4mkj/XTNtXfJG/phBTppQB+yqsvh/WG0eX3lrRBdNNM3aHG7BI0/2h/gBOynr/zFid
	qyBq/s5xLtM7GxFEGAm78dAxoo92EcfziEr6cYHN1wA==
X-Gm-Gg: AfdE7clRkzgcczeTc4O8WU+uRdFgvjf8qJzyVvYIrL9yT47UrjyZboMzTMmJByrc8dn
	VfKIXWlVDPZir3bgXxwf3TdRgEnRgKJe81Wm09TxN8SfhGj4UR1upwNXnH6WHnTvgEANTgBXfGg
	jhOgKzaf6DF8o1kHZehN96snGoapyY33g29VrCmQTvhquR5I8W69gfC6MbITy3jAWG5/Ss6nKbw
	/wAzpISx+73ikgXWvakE0mgk52N1VmDIStTVdydkfDqmaprfz0lct4LwyRXQRTXI3mcFIdjpbne
	9ElSL5UyPg==
X-Received: by 2002:a05:6402:3547:b0:695:816f:43f1 with SMTP id
 4fb4d7f45d1cf-69775eaae66mr6396710a12.22.1782206463425; Tue, 23 Jun 2026
 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin> <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 23 Jun 2026 17:20:51 +0800
X-Gm-Features: AVVi8CdMDiQE4VKsrZzPD7kXxxJvxZiWn-JHtQfesJzlfOBBSpcVyycHu26a19A
Message-ID: <CANXhq0r=hNEF9jVM39fYC-bk7S4bNpWt9H4M3Qh3zo+d3UNRpA@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Guo Ren <guoren@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_022105_579761_16E02EB1 
X-CRM114-Status: GOOD (  30.75  )
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

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgMToxNOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDE4LCAyMDI2IGF0IDk6MzbigK9QTSBEYXZpZCBM
YWlnaHQKPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
VGh1LCAxOCBKdW4gMjAyNiAxNzo1MTozNCArMDgwMAo+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gSGkgVml2aWFuLAo+ID4gPgo+ID4gPiBBcyBub3RlZCBp
biB0aGUgUklTQy1WIElPTU1VIFNwZWNpZmljYXRpb24sIENoYXB0ZXIgNjoKPiA+ID4gPiBXaGV0
aGVyIGFuIDgtYnl0ZSBhY2Nlc3MgdG8gYW4gSU9NTVUgcmVnaXN0ZXIgaXMgc2luZ2xlLWNvcHkg
YXRvbWljIGlzIFVOU1BFQ0lGSUVELCBhbmQgc3VjaCBhbiBhY2Nlc3MgbWF5IGFwcGVhciwgaW50
ZXJuYWxseSB0byB0aGUgSU9NTVUsIGFzIGlmIHR3byBzZXBhcmF0ZSA0LWJ5dGUgYWNjZXNzZXMg
4oCUIGZpcnN0IHRvIHRoZSBoaWdoIGhhbGYgYW5kIHNlY29uZCB0byB0aGUgbG93IGhhbGYg4oCU
IHdlcmUgcGVyZm9ybWVkLgo+ID4gPgo+ID4gPiBUaGVyZWZvcmUsIHRoZSBhdG9taWNpdHkgb2Yg
NjQtYml0IE1NSU8gYWNjZXNzZXMgaXMgVU5TUEVDSUZJRUQgYW5kCj4gPiA+IG5vdCBjbGVhcmx5
IGRlZmluZWQgaW4gdGhlIGN1cnJlbnQgcmF0aWZpZWQgUklTQy1WIElPTU1VCj4gPiA+IHNwZWNp
ZmljYXRpb24uIFRvIGhhbmRsZSB0aGlzIGNvcnJlY3RseSwgdGhlIExpbnV4IFJJU0MtViBJT01N
VSBkcml2ZXIKPiA+ID4gc2hvdWxkIGZhbGwgYmFjayB0byAzMi1iaXQgTU1JTyBhY2Nlc3NlcyB3
aGVuIHJlYWRpbmcgNjQtYml0IHJlZ2lzdGVycwo+ID4gPiAoZS5nLiwgcGVyZm9ybWFuY2UgY291
bnRlcnMpLiBUaGUgYmVoYXZpb3Igb2YgMzItYml0IE1NSU8gYWNjZXNzZXMgaXMKPiA+ID4gbW9y
ZSBwcmVjaXNlbHkgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElPTU1VIHNwZWNpZmljYXRpb24uCj4g
PiA+Cj4gPiA+IFRodXMsIG1hbnkgaGFyZHdhcmUgdmVuZG9ycyBpbXBsZW1lbnQgMzItYml0IE1N
SU8gKHJhdGhlciB0aGFuIDY0LWJpdAo+ID4gPiBNTUlPKSBiYXNlZCBvbiB0aGUgY3VycmVudCBy
YXRpZmllZCBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiwgYW5kCj4gPiA+IHRoaXMgZHJpdmVy
IGRvZXMgbm90IGFwcGVhciB0byBiZW5lZml0IGZyb20gNjQtYml0IE1NSU8gYWNjZXNzIGVpdGhl
ci4KPiA+ID4gUGVyZm9ybWFuY2UgaXMgZnVuZGFtZW50YWxseSBjb25zdHJhaW5lZCBieSBidXMg
bGF0ZW5jeTsgYXNzdW1pbmcgdGhhdAo+ID4gPiBzaW1wbHkgcmVkdWNpbmcgdGhlIG51bWJlciBv
ZiBhY2Nlc3NlcyB3aWxsIGltcHJvdmUgcGVyZm9ybWFuY2UgaXMgYW4KPiA+ID4gb3ZlcnNpbXBs
aWZpY2F0aW9uIHRoYXQgaWdub3JlcyB0aGUgdW5kZXJseWluZyBoYXJkd2FyZQo+ID4gPiBjaGFy
YWN0ZXJpc3RpY3MuCj4gPgo+ID4gSWYgdGhlIGJ1cyBsYXRlbmN5IGlzIHNpZ25pZmljYW50IGl0
IGlzIGFsbW9zdCBjZXJ0YWlubHkgd29ydGggdXNpbmcKPiA+IG1lbW9yeSBhY2Nlc3NlcyB0byBh
dm9pZCByZS1yZWFkaW5nIHRoZSBoaSByZWdpc3Rlci4KPiA+Cj4gPiBTb21ldGhpbmcgbGlrZSB0
aGlzIG1pZ2h0IHdvcms6Cj4gPgo+ID4gc3RhdGljIHZvbGF0aWxlIHUzMiBoaV9wcmV2LCBsb19w
cmV2Owo+ID4KPiA+ICAgICAgICAgdTMyIGhpID0gcmVhZF9yZWdfaGkoKTsKPiA+ICAgICAgICAg
dTMyIGxvID0gcmVhZF9yZWdfbG8oKTsKPiA+Cj4gPiAgICAgICAgIGlmIChsbyA8PSBsb19wcmV2
IHx8IGhpICE9IGhpX3ByZXYpIHsKPiA+ICAgICAgICAgICAgICAgICB1MzIgaGlfdG1wID0gcmVh
ZF9yZWdfaGk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKGhpX3RtcCAhPSBoaSkgewo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgaGkgPSBoaV90bXA7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBsbyA9IDA7Cj4gPiAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgIGxv
X3ByZXYgPSB+MHU7Cj4gPiAgICAgICAgICAgICAgICAgaGlfcHJldiA9IGhpOwo+ID4gICAgICAg
ICB9Cj4gPiAgICAgICAgIGxvX3ByZXYgPSBsbzsKPiA+ICAgICAgICAgcmV0dXJuICh1NjQpaGkg
PDwgMzIgfCBsbzsKPiA+Cj4gPiBJdCBzaG91bGRuJ3QgbmVlZCBhbnkgbG9ja2luZyBidXQgdGhl
IGFjY2Vzc2VzIGRvIG5lZWQgdG8gYmUgb3JkZXJlZC4KPiBUaGFuayB5b3UgZm9yIHRoZSBzdWdn
ZXN0aW9uLiBIb3dldmVyLCBJIGJlbGlldmUgdGhpcyBmZWVkYmFjayBpcyBtb3JlCj4gcmVsZXZh
bnQgdG8gdGhlIFJJU0MtViBJT01NVSBIUE0gcGF0Y2hzZXQgWzFdLCBhcyBubyBjb3VudGVyIHJl
Z2lzdGVycwo+IGFyZSBpbnZvbHZlZCBpbiB0aGUgY3VycmVudCBwYXRjaHNldC4gVGhhdCBzYWlk
LCB0aGUgaWRlYSBvZiBpbXByb3ZpbmcKPiB0aGUgaGktbG8taGkgc2xvdy1wYXRoIG1lY2hhbmlz
bSB0byBiZXR0ZXIgaGFuZGxlIGhpZ2gtbGF0ZW5jeQo+IGhhcmR3YXJlIHNjZW5hcmlvcyBpcyB3
ZWxsIHRha2VuIGFuZCB3b3J0aCBkaXNjdXNzaW5nIGluIHRoZQo+IGFwcHJvcHJpYXRlIHRocmVh
ZC4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwMjA4MDYz
ODQ4LjM1NDc4MTctMi16b25nLmxpQHNpZml2ZS5jb20vCj4KPiBQLlMuIFRoZSBoYXJkd2FyZSBJ
IGhhdmUgYXQgaGFuZCBleGhpYml0cyB2ZXJ5IGxvdyBpbnRlcmNvbm5lY3QKPiBsYXRlbmN5LiBB
bmQgSSBoYXZlIG5ldmVyIG9ic2VydmVkIHRoZSBzbG93IHBhdGggd2hlcmUgaGlfdG1wICE9IGhp
Cj4gYmVpbmcgdHJpZ2dlcmVkIOKAlCBteSBhcHByb2FjaCB3YXMgdG8gcmVtb3ZlIHRoZSByZXRy
eSBtZWNoYW5pc20KPiBkaXJlY3RseSBpbiAzMi1iaXQgbW1pbyBtb2RlIGFuZCBydW4gc3RyZXNz
IHRlc3RzIHRvIGNoZWNrIHdoZXRoZXIKPiBwZXJmIHN0YXQgcHJvZHVjZWQgaW5jb3JyZWN0IHJl
c3VsdHMuIFRoYXQgc2FpZCwgSSBtYXkgaGF2ZSBzaW1wbHkKPiBiZWVuIGx1Y2t5IGluc3RlYWQg
b2YgaHcgZ3VhcmFudGVlLgo+CgoKSGkgZXZlcnlvbmUsCgpUaGFuayB5b3UgZm9yIGFkZGluZyBt
ZSB0byB0aGlzIGRpc2N1c3Npb24uIEkgdG9vayBzb21lIHRpbWUgdG8gcmVhZAp0aGUgcHJldmlv
dXMgbWVzc2FnZXMuClJlZ2FyZGluZyB0aGUgR2l0SHViIGlzc3VlIG1lbnRpb25lZCBieSBWaXZp
YW4sIEkgbm90aWNlZCBzb21lb25lCnBvaW50ZWQgb3V0IHRoYXQgdGhlIGhhcmR3YXJlIG11c3Qg
c3VwcG9ydCA2NC1iaXQgYWNjZXNzLgoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24t
aXNhL3Jpc2N2LWlvbW11L2lzc3Vlcy83NjUjaXNzdWVjb21tZW50LTQ3NDI5NDE4OTQKCkkgd291
bGQgbGlrZSB0byBjb25maXJtIGlmIHRoYXQgaXMgY29ycmVjdC4gSWYgc28sIHNob3VsZCB3ZSB1
cGRhdGUKdGhlIHNwZWM/IEFuZCBkb2VzIHRoaXMgbWVhbiB3ZSBkbyBub3QgbmVlZCB0byBtb2Rp
ZnkgdGhlIGRyaXZlcj8KClRoYW5rcwoKPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
