Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAA7C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:33:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F02120827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0nNvDph";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iRbBV0e1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F02120827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h++eqWwqosNuhLDye76SeuaI1OtXjdIwEbxjNFl50rs=; b=W0nNvDphJcqb3E
	3l9ron9NcIo849FticGyAmEGy70PtoMFYu502NdpxOTlHSH7UrgJhPFg2C7Y8xIJEDz4LtaSRiNsh
	6jXRRC8i10vTFtJEMpTnsosi0ZrylENBdpqzj6Tze/N9/nNhjZeXyjDHPqun9eZ1JCnGJMUr9G2d4
	cgKT1QOTzw5/bMW/FIkwdVaSU5vpS3rbxOWhNbx+4y1AACAxAOrMYhEZIDCfaj5pruumjo/712ww7
	BBK5w7qE6QtxUA9vaD2MJI3bVik38KqSJDhJLvfRJMi1f2fxEC3HlM4wl7ypXR0PX+/uvJc58vy/r
	fcBtMcfWq3lCgGFE7Xkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKAqP-0004D1-Jo; Tue, 06 Nov 2018 23:33:13 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKAqG-00046Y-KP; Tue, 06 Nov 2018 23:33:06 +0000
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED528514;
 Wed,  7 Nov 2018 00:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1541547168;
 bh=/SVGbAN39xsvd68HGGXsaiPugGBjl760Chyh4SeYqrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iRbBV0e1JFfj43w/Tknpk1iwW3n3/y1Sg8utEsfWnFecdgvqvTIve4KwQf1XjJfZ9
 xZJoVLMN/2o2bJiDT6qywcV5zxNp3LST6XXU/GnJtI/zIPbF2Uibrf8z6TvtlWSerU
 X3UXM74Z7Lo4QXv+yBts9IhMRwtj+JDw9iDtQx5Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ksummit-discuss@lists.linuxfoundation.org
Subject: Re: [Ksummit-discuss] [TECH TOPIC] SoC maintainer group
Date: Wed, 07 Nov 2018 01:32:59 +0200
Message-ID: <3189677.9XQFCzzJyO@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_153304_969322_986040A7 
X-CRM114-Status: GOOD (  25.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: rmk@armlinux.org.uk, Kevin Hilman <khilman@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106233259.OPO3iRcDJi0N5wR6jOav3E4GHCACNIRGp6ArZg4-3-Y@z>

SGkgT2xvZiwKCk9uIFdlZG5lc2RheSwgNyBOb3ZlbWJlciAyMDE4IDAwOjE2OjI3IEVFVCBPbG9m
IEpvaGFuc3NvbiB3cm90ZToKPiBIaSBLUyBvcmdhbml6ZXJzIChhbmQgb3RoZXJzKSwKPiAKPiBU
aGlzIGlzIGEgbGF0ZSB0b3BpYyBwcm9wb3NhbCwgaG9wZWZ1bGx5IHRoZXJlIGlzIHN0aWxsIHRp
bWUgb24gdGhlIGFnZW5kYS4KPiAKPiBXZeKAmXZlIHJlY2VudGx5IGJlZW4gZGlzY3Vzc2luZyBz
b21lIG1haW50YWluZXIgbW9kZWwgY2hhbmdlcyBhcwo+IGRlc2NyaWJlZCBiZWxvdywgYW5kIHdv
dWxkIGxpa2UgYSBzbG90IHRvIGRpc2N1c3MgdGhlIGlkZWEgYW5kIHNvbGljaXQKPiBmZWVkYmFj
ay9jb21tZW50cyBmcm9tIHRoZSBvdGhlcnMgdGhlcmUuCj4gCj4gCj4gVGhpcyBzdGFydGVkIHdp
dGggQXJuZCBhbmQgSSBmaW5hbGx5IGJlaW5nIGluIG9uZSBwbGFjZSBhdCB0aGUgc2FtZQo+IHRp
bWUsIGFuZCB0YWxraW5nIGFib3V0IGhvdyB3ZSB3YW50IHRvIGV2b2x2ZSBhcm0tc29jIG1haW50
YWluZXJzaGlwCj4gbW92aW5nIGZvcndhcmQuIFdlJ3ZlIGJlZW4gaW5kZXBlbmRlbnRseSB0aGlu
a2luZyBvZiB3YXlzIHRvIGV4cGFuZAo+IHRoZSBncm91cCBhbmQgbWFraW5nIGl0IG1vcmUgc2Vs
Zi1zZXJ2aWNlIGZvciBldmVyeWJvZHksIGJ1dCB0aGVyZSdzIGEKPiBidW5jaCBvZiB0b29saW5n
IG5lZWRlZCB0byBtYWtlIGl0IHJ1biBzbW9vdGhseSBiZXlvbmQgdGhlIHNtYWxsZXIKPiBncm91
cCB3ZSBoYXZlIG5vdy4KPiAKPiBJbiB0aGUgZW5kLCB3ZSBlbmRlZCB1cCBsb29raW5nIGF0IGl0
IGZyb20gYSBzbGlnaHRseSBkaWZmZXJlbnQgYW5nbGU6Cj4gUmlnaHQgbm93LCB3aGVuIGNvbnRy
aWJ1dG9ycyBzaG93IHVwIHdpdGggbmV3IHBsYXRmb3JtIHN1cHBvcnQsIHRoZQo+IGZpcnN0IGhp
bGwgdGhleSBuZWVkIHRvIGNsaW1iIGlzIGZpZ3VyaW5nIG91dCBob3cgdGhleSBuZWVkIHRvIGNh
cnZlCj4gdXAgdGhlaXIgcGxhdGZvcm0gYW1vbmcgYWxsIHRoZSB2YXJpb3VzIG1haW50YWluZXJz
LCBob3cgdG8gbWFrZSBzdXJlCj4gdGhleSdyZSBhbGwgaGFuZHNoYWtpbmcgb24ga2VlcGluZyB0
aGluZ3Mgc3RhYmxlLCBhbmQgZ2V0IGNvZGUKPiBzdWJtaXR0ZWQuIEl0J3MgYXdrd2FyZCwgbm90
IHdlbGwgZG9jdW1lbnRlZCBhbmQgb25lIG9mIHRoZSBiaWdnZXN0Cj4gb3ZlcmhlYWRzIHdlIGhh
dmUgb24gb3VyIHNpZGUgYXMgd2VsbC4KPiAKPiBXaGVuIHdlIHN0YXJ0ZWQgdGFsa2luZyB0byBv
dGhlciBtYWludGFpbmVycywgd2UncmUgYWxzbyByZWFsaXppbmcKPiB0aGF0IHdlIGFyZSBjdXJy
ZW50bHkgZHVwbGljYXRpbmcgYSBsb3Qgb2Ygd29yay4gSW4gcGFydGljdWxhciwgd2UKPiBvZnRl
biBhbGwgZ2V0IGNjOmQgb24gcGF0Y2ggc2VyaWVzLCBzbyB3ZSBhbGwgbmVlZCB0byByZWFkIGFu
ZCBmaWx0ZXIsCj4gYW5kIGFzc3VtZSB0aGF0IG90aGVyIG1haW50YWluZXJzIHNwb3QgdGhlIHJp
Z2h0IHBhdGNoZXMsIGV0Yy4KPiAKPiBXZSBoYXZlIGRpc2N1c3NlZCBhIGZldyBkaWZmZXJlbnQg
b3B0aW9ucywgYW5kIGl0IHNlZW1zIGxpa2UgcG9vbGluZwo+IG1vcmUgb2YgdGhlIGNvbnRyaWJ1
dGlvbiBmbG93IHRvIGEgZ3JvdXAgb2YgY28tbWFpbnRhaW5lcnMgaXMgYSB1c2VmdWwKPiBhcHBy
b2FjaC4gSW5pdGlhbGx5LCB3ZSdyZSBjb25zaWRlcmluZyB0aGUgYXJtLXNvYyBwbGF0Zm9ybXMs
IGNsb2NrCj4gZHJpdmVycyBhbmQgcGluY3RybCBkcml2ZXJzLCB3aGljaCBhbGwgdGVuZCB0byBi
ZSBhZmZlY3RlZCBieSBuZXcKPiBwbGF0Zm9ybSBjb250cmlidXRpb25zIGluIHRoaXMgd2F5LCBh
bmQgb2Z0ZW4gZW5kIHVwIGNyb3NzLWNjOmQgb24KPiBldmVyeXRoaW5nLiBBZGRpdGlvbmFsbHks
IHRoZSBmbG93IGZvciBzdWNjZXNzZnVsbHkgbWVyZ2luZyBhIG5ldwo+IHBsYXRmb3JtIG9yIFNv
QyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGFuZCBhZHZlcnRpc2VkLiBUaGlzIGlzIHRydWUKPiB3
aGV0aGVyIG9yIG5vdCB3ZSBjaGFuZ2UgdGhlIHdheSB0aGF0IG1haW50YWluZXJzIGNvb3JkaW5h
dGUgYW1vbmdzdAo+IHRoZW1zZWx2ZXMsIG9yIHdoZXRoZXIgb3Igbm90IHdlIGNoYW5nZSB0aGUg
Y3VycmVudCB3b3JrZmxvdyB1c2VkIGJ5Cj4gcGxhdGZvcm0gY29udHJpYnV0b3JzIHRvZGF5Lgo+
IAo+IFNvLCB3ZSdyZSBwbGFubmluZyB0byBjaGFuZ2UgdGhpbmdzIHVwIGEgYml0LiBXZSdyZSBz
dGFydGluZyBhIG5ldwo+IGdyb3VwIHRoYXQgcG9vbHMgY3VycmVudCBhcm0tc29jLCBjbGsgYW5k
IHBpbmN0cmwgZHJpdmVycyBhbmQKPiBtYWludGFpbmVycyBpbnRvIG9uZSBmdW5uZWwuIFdlJ2xs
IHNldCB1cCBhIG5ldyBtYWlsIGFsaWFzIGZvciB0aGUKPiBtYWludGFpbmVyIGdyb3VwLCBhbmQg
b25lIHNoYXJlZCBwYXRjaHdvcmsgdG8gY29sbGVjdCBjb250cmlidXRpb25zLgo+IFdlIHN0aWxs
IGV4cGVjdCBkZXZlbG9wZXJzIHRvIHVzZSBleGlzdGluZyBtYWlsaW5nIGxpc3RzLCBhbmQgd2Ug
c3RpbGwKPiBleHBlY3QgZm9yIGV4YW1wbGUgQVJNIHBsYXRmb3JtIG1haW50YWluZXJzIHRvIGtl
ZXAgdGhlaXIgd29ya2Zsb3cgb2YKPiBjb2xsZWN0aW5nIHBhdGNoZXMgZm9yIHRoZWlyIHBsYXRm
b3JtIGxpa2UgdGhleSBkbyB0b2RheS4gRG93biB0aGUKPiByb2FkIGl0IG1pZ2h0IG1ha2Ugc2Vu
c2UgdG8gaW5jb3Jwb3JhdGUgb3RoZXIgZHJpdmVyIHN1YnN5c3RlbXMgYXMKPiB3ZWxsLgo+IAo+
IEJleW9uZCB0aGlzLCB3ZSdyZSBnb2luZyB0byBrZWVwIGEgY2xvc2UgZXllIG9uIHRoZSBkcm0t
bWlzYyB0cmVlLAo+IHdoaWNoIGlzIGV4cGxvcmluZyBhIG1vdmUgdG8gZ2l0bGFiIChhbmQgd29y
a2luZyB3aXRoIGdpdGxhYiBvbiBhZGRpbmcKPiB0aGUgZmVhdHVyZXMgdGhleSBuZWVkIHRvIG1v
dmUgb3ZlcikuIElmIHRoZXkgZ2V0IGEgYnJvYWQgbWFpbnRhaW5lcgo+IG1vZGVsIHdvcmtpbmcg
d2VsbCBpbiB0aGF0IGVudmlyb25tZW50IGl0IGNvdWxkIGJlIHNvbWV0aGluZyB3ZSByZXVzZQo+
IGZvciBvdXJzZWx2ZXMgdG9vLgoKZ2l0bGFiIGlzIGFuIHVtYnJlbGxhIHRlcm0gdGhhdCBjb3Zl
cnMgbWFueSBmZWF0dXJlcyBwcm9wb3NlZCBieSB0aGUgcHJvZHVjdC4gCkFyZSB0aGVyZSBwYXJ0
aWN1bGFyIGZlYXR1cmVzIHRoYXQgeW91IGFscmVhZHkgdGhpbmsgeW91IHdvdWxkIGJlIGludGVy
ZXN0ZWQgCmluLCBvciBmZWF0dXJlcyB0aGF0IHlvdSBhbHJlYWR5IGtub3cgeW91IHdvdWxkbid0
IHdhbnQgdG8gdXNlID8KCj4gVGhpcyBncm91cCB3aWxsIGFsc28gdGFrZSBvbiB0aGUgcmVzcG9u
c2liaWxpdHkgb2YgcHV0dGluZyB0b2dldGhlcgo+IHRoZSBkb2N1bWVudGF0aW9uIGFuZCBleHBl
Y3RlZCBwYXRjaCBmbG93IGZvciBuZXcgcGxhdGZvcm0vU29DCj4gY29udHJpYnV0b3JzLiBUaGF0
IGRvY3VtZW50YXRpb24gd2lsbCBuZWVkIHRvIGV2b2x2ZSBhIGJpdCBvdmVyIHRpbWUKPiBhcyB3
ZSB0cnkgb3V0IHRoaXMgbmV3IGNvbGxhYm9yYXRpb24gYmV0d2VlbiBtYWludGFpbmVycy4KPiAK
PiBUbyBhdm9pZCBhbiBhcHBlYXJhbmNlIG9mICJBUk0gaXMgdGFraW5nIG92ZXIgYWxsIGFyY2hp
dGVjdHVyZXMiLAo+IHdlJ2xsIHJlbmFtZSB0aGlzIHRvIGp1c3QgdGhlIHBsYWluICJTb0MgdHJl
ZS9ncm91cCIsIGFuZCBkcm9wIEFSTQo+IGZyb20gdGhlIG5hbWUuIEFzIG1lbnRpb25lZCBhbHJl
YWR5IGluaXRpYWxseSB3ZSdyZSBhbnRpY2lwYXRpbmcKPiBjb3ZlcmluZyBBUk0gKDMyLzY0LWJp
dCBsaWtlIGJlZm9yZSkgYW5kIFJJU0MtViBwbGF0Zm9ybSBhcmVhcyBpbiBhCj4gc2ltaWxhciB3
YXkuIEZvciBvdGhlciBvbGRlci9taW5vciBhcmNoaXRlY3R1cmVzIHRoYXQgYXJlCj4gc2VtaS1v
cnBoYW5lZCwgd2UgbWlnaHQgcGljayB1cCBjb2RlIGFzIG5lZWRlZCB3aGVuIGl0IGFmZmVjdHMg
dXMsCj4gZGVwZW5kaW5nIG9uIG1haW50YWluZXIgc3RhdHVzIGF0IHRoZSBvdGhlciBlbmQuCj4g
Cj4gV2UncmUgZG9pbmcgdGhlIGdyb3VuZHdvcmsgbm93LCBhbmQgd2lsbCBnZXQgdHJlZXMvbGlz
dHMvcGF0Y2h3b3Jrcwo+IHNldHVwIGZvciB0aGUgbmV4dCByZWxlYXNlIGN5Y2xlLgo+IAo+IAo+
IFBlb3BsZSBpbnZvbHZlZCBzbyBmYXIgYXJlOgo+IAo+IE9sb2YgSm9oYW5zc29uIChhcm0tc29j
KQo+IEFybmQgQmVyZ21hbm4gKGFybS1zb2MpCj4gS2V2aW4gSGlsbWFuIChhcm0tc29jKQo+IE1p
a2UgVHVycXVldHRlIChjbGspCj4gU3RlcGhlbiBCb3lkIChjbGspCj4gTGludXMgV2FsbGVpaiAo
cGluY3RybCArIG1vcmUpCj4gTWlrZSBCcm93biAoZ3Bpby9yZWdtYXAgKyBtb3JlKQo+IAo+IAo+
IFRoYW5rcyEKPiAKPiAtT2xvZiAob24gYmVoYWxmIG9mIHRoZSBncm91cCkKCi0tIApSZWdhcmRz
LAoKTGF1cmVudCBQaW5jaGFydAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
