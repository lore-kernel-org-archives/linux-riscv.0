Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AB1C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8mq37Xd8zfDrGhT+5hfew8tVwkhRYP8E+4wWpvw9vc=; b=P7rf+QKVDBNysI
	anqny0AHs9dZTABhya9XhPKzAdCgrsBK7Y2Xz2PF60o1PXdRyF1qm7RZ9nI1eDR/1cOecHuY08zQ7
	0vh1SKNnVM+05oniHodinmHZG6nDldOakLmPZQTjGyzVsgqBDsVrBT4T0KpL/y2uqFvqM9mFYpfpi
	+XvMAwwVL4Hza31kQD+chB9+FqEnIryZbEb/OMEtLZXcfqVzh8dg8qojrnXpptBjTUsVezeLIDA+l
	hwbaDPn9e5VlLG3yoM5jGIEExn7SsaH72ikgJiv1CdMT/BqNAWoGBCYBBcfbEonawGSytNQwWdqSm
	w87TH8P6+Ed+Z7NvXKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqo7-0088z3-Uq; Tue, 31 Jan 2023 13:36:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqo4-0088yL-OP
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 13:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F202B81C94
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCB5C433A4
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675172173;
	bh=3IHph7JXJE4U1T0QYoP+aCYRh1+skz/PldK61wiSFVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=akLJxoEW2cMETHB9J+GhwTuvx4RDeBgwk48piOnR528rNCO3YPzeeLvkEM9FqWgN+
	 7jIbMm8sQMECSXVjLiEBBaxzqRDwwfTInqrgfXgNRiR8tsrBac7p884aWQk/gkAVux
	 YmbA7X36Fh/CljwA+1YMKCcjRExREFvO+/VqvgggKxbVizv+AJnTginHc4lgiXgpcc
	 q/JkkEMkB9KpYq/jX6hztKq/b3rKLtqlYf7n7I/f3VjkW6tgq3uaVhgR4ki/rDQ9re
	 TuYogNodGLxqm15ROahKgJ28OVd7DAUfGtoGZS5CPD9zVeN5r9mS5qHIwm22sfI+Ui
	 QBYjrNd9N2pTw==
Received: by mail-ej1-f49.google.com with SMTP id hx15so22115315ejc.11
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 05:36:13 -0800 (PST)
X-Gm-Message-State: AO0yUKVjPJYxNBw1470k/4m0b36c7Xb4zxUBFhaAxsBesEKTX3a/aOTl
	kdfidsimMqeU0psdE2yALAu86zwRSdkVpEgWQJU=
X-Google-Smtp-Source: AMrXdXularVT6h3tPHLAheU0aHvep+fEiLo4QFlkkLB+2daB8tr4RIXB1T48JoOBlAV3tLtA7jTDEduJJz6SdKO9Y0Q=
X-Received: by 2002:a17:906:770d:b0:877:e1ef:e49a with SMTP id
 q13-20020a170906770d00b00877e1efe49amr6547828ejm.147.1675172171455; Tue, 31
 Jan 2023 05:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20230126170607.1489141-1-guoren@kernel.org> <20230126170607.1489141-2-guoren@kernel.org>
 <87357sjkv8.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87357sjkv8.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 21:35:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS3s6EANWGSeykAGes=+MFbCAFxy5d0NFS+ynwRoQcCRA@mail.gmail.com>
Message-ID: <CAJF2gTS3s6EANWGSeykAGes=+MFbCAFxy5d0NFS+ynwRoQcCRA@mail.gmail.com>
Subject: Re: [PATCH -next V3 1/2] riscv: jump_label: Fixup unaligned
 arch_static_branch function
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	jrtc27@jrtc27.com, andy.chiu@sifive.com, zong.li@sifive.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_053617_122496_FF5138F8 
X-CRM114-Status: GOOD (  26.70  )
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

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgNzo1NyBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGd1b3JlbkBrZXJuZWwub3JnIHdyaXRlczoKPgo+ID4gRnJvbTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+Cj4gPiBSdW50aW1lIGNvZGUgcGF0
Y2hpbmcgbXVzdCBiZSBkb25lIGF0IGEgbmF0dXJhbGx5IGFsaWduZWQgYWRkcmVzcywgb3Igd2UK
PiA+IG1heSBleGVjdXRlIG9uIGEgcGFydGlhbCBpbnN0cnVjdGlvbi4KPiA+Cj4gPiBXZSBoYXZl
IGVuY291bnRlcmVkIHByb2JsZW1zIHRyYWNlZCBiYWNrIHRvIHN0YXRpYyBqdW1wIGZ1bmN0aW9u
cyBkdXJpbmcKPiA+IHRoZSB0ZXN0LiBXZSBzd2l0Y2hlZCB0aGUgdHJhY2VyIHJhbmRvbWx5IGZv
ciBldmVyeSAxfjUgc2Vjb25kcyBvbiBhCj4gPiBkdWFsLWNvcmUgUUVNVSBzZXR1cCBhbmQgZm91
bmQgdGhlIGtlcm5lbCBzdWNraW5nIGF0IGEgc3RhdGljIGJyYW5jaAo+ID4gd2hlcmUgaXQganVt
cHMgdG8gaXRzZWxmLgo+ID4KPiA+IFRoZSByZWFzb24gaXMgdGhhdCB0aGUgc3RhdGljIGJyYW5j
aCB3YXMgMi1ieXRlIGJ1dCBub3QgNC1ieXRlIGFsaWduZWQuCj4gPiBUaGVuLCB0aGUga2VybmVs
IHdvdWxkIHBhdGNoIHRoZSBpbnN0cnVjdGlvbiwgZWl0aGVyIEogb3IgTk9QLCB3aXRoIHR3bwo+
ID4gaGFsZi13b3JkIHN0b3JlcyBpZiB0aGUgbWFjaGluZSBkb2VzIG5vdCBoYXZlIGVmZmljaWVu
dCB1bmFsaWduZWQKPiA+IGFjY2Vzc2VzLiBUaHVzLCBtb21lbnRzIGV4aXN0IHdoZXJlIGhhbGYg
b2YgdGhlIE5PUCBtaXhlcyB3aXRoIHRoZSBvdGhlcgo+ID4gaGFsZiBvZiB0aGUgSiB3aGVuIHRy
YW5zaXRpb25pbmcgdGhlIGJyYW5jaC4gSW4gb3VyIHBhcnRpY3VsYXIgY2FzZSwgb24KPiA+IGEg
bGl0dGxlLWVuZGlhbiBtYWNoaW5lLCB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgTk9QIHdhcyBtaXhl
ZCB3aXRoIHRoZQo+ID4gbG93ZXIgcGFydCBvZiB0aGUgSiB3aGVuIGVuYWJsaW5nIHRoZSBicmFu
Y2gsIHJlc3VsdGluZyBpbiBhIGp1bXAgdGhhdAo+ID4ganVtcGVkIHRvIGl0c2VsZi4gQ29udmVy
c2VseSwgaXQgd291bGQgcmVzdWx0IGluIGEgSElOVCBpbnN0cnVjdGlvbiB3aGVuCj4gPiBkaXNh
YmxpbmcgdGhlIGJyYW5jaCwgYnV0IGl0IG1pZ2h0IG5vdCBiZSBvYnNlcnZhYmxlLgo+ID4KPiA+
IEFSTTY0IGRvZXMgbm90IGhhdmUgdGhpcyBwcm9ibGVtIHNpbmNlIGFsbCBpbnN0cnVjdGlvbnMg
bXVzdCBiZSA0LWJ5dGUKPiA+IGFsaWduZWQuCj4KPiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KPgo+IE5pY2UgY2F0Y2ghIEFuZCBJIGd1ZXNzIHRoaXMgaXMg
YW4gaXNzdWUgZm9yIGtwcm9iZXMgYXMgd2VsbCwgbm8/Cj4gSS5lLiBpbiBnZW5lcmFsIHJlcGxh
Y2luZyAzMmIgaW5zbnMgd2l0aCBhbiBlYnJlYWsuIFRoaXMgaXMgb25seSB2YWxpZAo+IGZvciBu
YXR1cmFsIGFsaWduZWQgMzJiIGluc25zPwo+Cj4gQEd1byBJIGRvbid0IHNlZSB0aGUgcG9pbnQg
b2YgZG9pbmcgYSBzZXJpZXMgZm9yIHRoaXMsIGFuZCBhc2tpbmcgdGhlCj4gbWFpbnRhaW5lcnMg
dG8gInBpY2sgdGhpcyBwYXRjaCB0byBzdGFibGUsIGFuZCB0aGUgb3RoZXIgZm9yCj4gbmV4dCIu
IElzbid0IHRoYXQganVzdCBtb3JlIHdvcmsgZm9yIHRoZSBtYWludGFpbmVycy9yZXZpZXdlcnM/
CklmIHRoZXNlIHR3byBwYXRjaGVzIGFyZSBzZXBhcmF0ZWQsIHRoZXkgYXJlIGFsbCBmaXh1cCB0
aGF0IGlzc3VlIGFuZApjb21wZXRlZCB3aXRoIGVhY2ggb3RoZXIuIE1ha2luZyBteSBwYXRjaCBh
biBvcHRpbWl6YXRpb24gcGF0Y2ggbXVzdApkZXBlbmQgb24gaXQuIFRoYXQncyB3aHkgSSBwdXQg
dGhlbSBpbiBvbmUgc2VyaWVzLgoKPgo+Cj4gQmrDtnJuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1
byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
