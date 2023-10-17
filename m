Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0903CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObWbcepeDdxrNRTx3wv3Ohh9F2a7SqxM51cb1rS6yuI=; b=FtWVXp5ovjXpbt
	mN/gUWERqeHsqhKaUhln5B1FxnkT0jB43LZV392OhHfSaoZqdpz81SepC16NtfgiBhwOfxhOG4sJR
	HMdBi3BrbQ5R8ZeUD98XxJSLTDx2S7GtTozF9rDf2+D5UoTXQUq5FiDHsUHKOFUPr9aSlgYO6Hbir
	75YsBUAm+es8EKQ5baLD98gdyGu4KUs6a1eHfOGVzBqEEhisfqZgESLLs+bXP85xJ3EYXjv70PZF+
	jVyLke7+7WO7hbWUKiwhZkmnk1aPOeZ1kB0CG/AE+q0A7eVcv8e3UIfxM60yl0Bprj/6X5mFMDc1f
	bqStkoPjmU7IwQJRbKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjsH-00CMS3-0s;
	Tue, 17 Oct 2023 13:12:41 +0000
Received: from mail-yw1-f193.google.com ([209.85.128.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjsD-00CMR4-2g
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:12:39 +0000
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-5a7c08b7744so68409947b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548355; x=1698153155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrjVOTU4vVWhg8rZEFBUd1El+uZlCjcijcwvkBEbBus=;
        b=vikVFIgpdVFL0geSq0zSaeLXq2HBFmhUBNFUmc8C4cO9dF8qhkDxKfCN6vAi1za8UV
         I2U2Xh8NNA0PRbMgbpJQa30GXdiGLcq0wAIPyfvueNnFHubU4279xjJ+8jFygCXWamRE
         qAK+xx2P7zSd17+D3mlNYyKykZQ+Nbbmha/OnBuduX4oPul12V/OhVQ3typ9Wb1MvbVU
         2im7n1H9z+j6N4aMSZAmjvlwWloVjzVqgGuHRdU9XpTPsAPLk5gDJuyBjaDPFQ2ljMh4
         YCoO6qxvEQY2gzloiOIvDmzfRGSEfn7fUU+xIA2FMloTQJgo+Uh3FkbkWNtPqy6Aw+vk
         peHg==
X-Gm-Message-State: AOJu0YwR4OX7yPhYZhxYKXkUYNiguNBNTtuGf1CkXxaDA7CwWc+nmmK5
	yXwpGUf/lKQsJzc5DSbky+067Ro35zttvzfP
X-Google-Smtp-Source: AGHT+IFLqXtpPV/YQHxhruZfr2tKB+PBeIp3icneimqHqINTvarfCmzZ37cIHzbR7HRWq6HK8yn3HA==
X-Received: by 2002:a05:690c:fc1:b0:5a7:fc84:4314 with SMTP id dg1-20020a05690c0fc100b005a7fc844314mr2299881ywb.40.1697548355447;
        Tue, 17 Oct 2023 06:12:35 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id t128-20020a815f86000000b00559f1cb8444sm599424ywb.70.2023.10.17.06.12.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:12:35 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7b91faf40so68571177b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:12:35 -0700 (PDT)
X-Received: by 2002:a0d:cb10:0:b0:5a7:afcc:80fe with SMTP id
 n16-20020a0dcb10000000b005a7afcc80femr2307771ywd.3.1697548354803; Tue, 17 Oct
 2023 06:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
 <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de>
 <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com> <20231017124608.GA4386@lst.de>
In-Reply-To: <20231017124608.GA4386@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
Message-ID: <CAMuHMdVavDc4g3ALqxFRn45ySCJ16F-Ay72=P3fxXipk0uXFiQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To: Christoph Hellwig <hch@lst.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, arm-soc <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061237_869035_17C922E2 
X-CRM114-Status: GOOD (  24.40  )
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

SGkgQ2hyaXN0b3BoLAoKT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMjo0NuKAr1BNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiBPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCAx
Mjo0NDo0MVBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiBPbiBNb24sIE9j
dCAxNiwgMjAyMyBhdCAzOjE34oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdy
b3RlOgo+ID4gPiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAwMTo1Mjo1N1BNICswMTAwLCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4gPiArICAgc2VsZWN0IFJJU0NWX0RNQV9OT05DT0hFUkVO
VAo+ID4gPiA+ID4gICAgIHNlbGVjdCBFUlJBVEFfQU5ERVMgaWYgUklTQ1ZfU0JJCj4gPiA+ID4g
PiAgICAgc2VsZWN0IEVSUkFUQV9BTkRFU19DTU8gaWYgRVJSQVRBX0FOREVTCj4gPiA+ID4KPiA+
ID4gPiBTaW5jZSB0aGlzIEtjb25maWcgbWVudSBoYXMgY2hhbmdlZCBhIGJpdCBpbiBsaW51eC1u
ZXh0LCB0aGUgc2VsZWN0cwo+ID4gPiA+IGFyZSB1bmNvbmRpdGlvbmFsIGhlcmUsIGFuZCBFUlJB
VEFfQU5ERVNfQ01PIHdpbGwgaW4gdHVybiBzZWxlY3QKPiA+ID4gPiBSSVNDVl9ETUFfTk9OQ09I
RVJFTlQuCj4gPiA+Cj4gPiA+IE9oLCBsb29rcyBsaWtlIGFub3RoZXIgcGF0Y2ggbGFuZGVkIHRo
ZXJlIGluIGxpbnV4LW5leHQuICBJIGhhZAo+ID4gPiB3YWl0ZWQgZm9yIHRoZSBwcmV2aW91cyBv
bmUgZ28gZ28gdXBzdHJlYW0gaW4gLXJjNi4gIE5vdCBzdXJlCj4gPiA+IGhvdyB0byBiZXN0IGhh
bmRsZSB0aGlzIGNvbmZsaWN0Lgo+ID4KPiA+IEkgdGhpbmsgdGhlIGVhc2llc3QgaXMgdG8gYXNr
IHNvYyB0byBhcHBseSB0aGlzIHNlcmllcz8KPgo+IEkgZG9uJ3QgdGhpbmsgcHVsbGluZyBhbGwg
dGhlIERNQSBiaXRzIGludG8gYSByYW5kb20gb3RoZXIgdHJlZQo+IHdvdWxkIGJlIGEgZ29vZCBp
ZGVhLiAgIEkgY2FuIGhhbmQgb2ZmIHRoZSBmaXJzdCBmZXcgYml0cywgYnV0IEknZAo+IG5lZWQg
YSBzdGFibGUgYnJhbmNoIHRvIHB1bGwgaW4gYWZ0ZXIgdGhhdC4gIFdoaWNoIG9mIHRoZSBoYWxm
IGEgZG96ZW4KPiBzb2MgdHJlZXMgd2UgaGF2ZSBpbiBsaW51eC1uZXh0IGlzIHRoaXMgYW55d2F5
PwoKVGhlIG9uZSBhbmQgb25seSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zb2Mvc29jLmdpdC8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
