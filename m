Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D5ECD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixMlJ6CBy1EhZhvjJk34gagljDNrjg6a7BzD0mnfNIY=; b=UPIteZjb+Tf40P
	v39o7MaAz7+5GSCh2HeiSDtpm5rttTQ8j3JaUOYdbsjEbpxmPUCubKKi4qcQ/KI4wC0DRsoE0ucky
	t3jAjiNY5f2EGIVG19NkE8kzum2yGHf7jSoWmMmfDCG6Z6RfyAesDYSK1urQKdLSmdz1Qtg+Spz/k
	eLP6gd/POZz6+Sajf4Cx3jTDmOtqJ9aUaYd9uPD6iJC0aTCPu8jqF54ZB5M69wpqslCDm3jyTXM5e
	kyZeRR+5cvw7pE3WZO6yYIq4GT2N7OjJid6pD9IhIQi/IlJdWpwNMS33GkDo3d+OJ9hByeUt9Sb5c
	OGHBeCxnv5l5vpw9M3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfw4-0000000Et1X-19hG;
	Sun, 16 Nov 2025 16:49:08 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfw1-0000000Et0E-1ymG;
	Sun, 16 Nov 2025 16:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
	:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3AI6JmJhcwuhEb8w2rCn481ZaFZecrvEQW0hTE6A4PI=; b=dChcKejMcVLikLUeYy13kwBPB5
	PTrr66YW7PrOXmQ3wOMUVTv+sSTDqHxJBud6u9p8pVaZcFAjvCn3bEykUrCHl8RcQurn3r/zrCJli
	i1i7Kmlu+amQrGvFva303/WBsmtDacT9Ze/Df4VTtHeYeHRzoPm2PaRcNyJECYbDTpZxmOWcY6uml
	hoFZ+y17qOrCzuyGGfW8LaJF/j4k/I6j2yvDxWyCObtIM0mXdqnDGpg+GWOfVD4bKjuZr26EBrMgc
	vW8b3iv/mDwpg9Yf7Hyh4FoLpAbS4iiOlmJdSA7+wg0rrUSWeKResozvUNnbmJnehsHhCIMhIKrXu
	KXdM61mQ==;
Received: from d100-116.icpnet.pl ([77.65.100.116] helo=[192.168.0.120])
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKfvv-0000000FgWV-3qyn;
	Sun, 16 Nov 2025 17:48:59 +0100
Message-ID: <cc1562aa-97de-409f-b50f-0d6a22c6946c@szczodrzynski.pl>
Date: Sun, 16 Nov 2025 17:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 parthiban@linumiz.com, paulk@sys-base.io
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
 <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
 <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <CAGb2v67iovqfErt20Oz0SrHC558zBDDFq1ZqRau83NOQ2w8AoQ@mail.gmail.com>
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_084905_680903_44358F29 
X-CRM114-Status: GOOD (  20.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VyBkbml1IDIwMjUtMTEtMTYgb8KgMTU6Mzc6MTUsIENoZW4tWXUgVHNhaSBwaXN6ZToKCj4gT24g
U3VuLCBOb3YgMTYsIDIwMjUgYXQgMTA6MzHigK9QTSBLdWJhIFN6Y3pvZHJ6ecWEc2tpCj4gPGt1
YmFAc3pjem9kcnp5bnNraS5wbD4gd3JvdGU6Cj4+IFcgZG5pdSAyMDI1LTExLTE2IG8gMTU6MDM6
MTgsIENoZW4tWXUgVHNhaSBwaXN6ZToKPj4KPj4+IE9uIFN1biwgTm92IDE2LCAyMDI1IGF0IDk6
NDbigK9QTSBLdWJhIFN6Y3pvZHJ6ecWEc2tpCj4+PiA8a3ViYUBzemN6b2Ryenluc2tpLnBsPiB3
cm90ZToKPj4+PiBbcmVwbHlpbmcgdG8gdjEgdG8ga2VlcCB0aGUgc2FtZSBzZXJpZXMgb24gUGF0
Y2h3b3JrXQo+Pj4gVGhhdCBpcyBub3QgdGhlIHJpZ2h0IHdheSB0byBkbyBpdC4KPj4+Cj4+PiBJ
ZiB5b3UgcmVwbHkgdG8gYW4gb2xkIHNlcmllcywgdGhlIHRvb2xpbmcgZG9lcyBub3QgcGlja3Vw
IHRoZSBuZXcgdmVyc2lvbgo+Pj4gYXMgYSBzZXBhcmF0ZSBzZXJpZXMuCj4+Pgo+Pj4gQ2hlbll1
Cj4+IEhpLAo+Pgo+PiBJIG5vdGljZWQgdGhhdCBpdCBpbmRlZWQgZGlkbid0IHdvcmsuIEhvd2V2
ZXIsIFBhdGNod29yayBkaWRuJ3QgcGljayB1cCB0aGUgdjIgY292ZXIgbGV0dGVyIGF0IGFsbCwg
c28gSSB0aG91Z2h0IHJlcGx5aW5nIHRvIHYyIHdvdWxkIG1lc3MgdXAgdGhlIHRocmVhZCBldmVu
IG1vcmUuCj4+Cj4+IFRoYXQgYmVpbmcgc2FpZCwgdGhlIHYzIGNvdmVyIGxldHRlciBpcyBub3Qg
dmlzaWJsZSB0aGVyZSBlaXRoZXIuCj4+Cj4+IFNob3VsZCBJIHJlc2VuZCB0aGlzIGFzIHY0IFt3
aGljaCBtZXNzYWdlIHRvIHJlcGx5IHRvP10gb3Igc2VuZCBhIGNvbXBsZXRlbHkgbmV3IHNlcmll
cyBwZXJoYXBzPwo+IEVhY2ggbmV3IHZlcnNpb24gc2hvdWxkIGJlIGEgY29tcGxldGVseSBuZXcg
c2VyaWVzLgo+Cj4gSWYgcGF0Y2h3b3JrIHN0aWxsIGRpZG4ndCBwaWNrIGl0IHVwLCB0aGVuIGl0
J3MgcG9zc2libGUgZWl0aGVyIHlvdXIKPiBwYXRjaGVzIGRpZG4ndCByZWFjaCB0aGUgbWFpbGlu
ZyBsaXN0cyBvciB0aGUgcGF0Y2h3b3JrIGluc3RhbmNlcy4KPiBQbGVhc2UgY2hlY2sgbG9yZSB0
byBzZWUgaWYgeW91ciBwYXRjaGVzIGFyZSB0aGVyZS4KClRoZSBwYXRjaGVzIGFyZSBvbiBsb3Jl
LCBidXQgcGF0Y2h3b3JrIGRpZG4ndCBwaWNrIHRoZW0gdXAgYmVjYXVzZSBzb21lIHdlcmUgc2Vu
dCB3aXRoIHRoZSB3cm9uZyBJbi1SZXBseS1UbyBoZWFkZXIsIGFuZCB0aGF0IGNyZWF0ZWQgdGhy
ZWFkaW5nIGlzc3Vlcy4KCkFzc3VtaW5nIEkgdW5kZXJzdG9vZCB5b3VyIHJlcGx5IGNvcnJlY3Rs
eSwgSSdsbCBzZW5kIHRoZSBlbnRpcmUgc2VyaWVzIGFzIHY0ICp3aXRob3V0KiB0aGUgSW4tUmVw
bHktVG8gaGVhZGVyLCB3aGljaCB3aWxsIGNyZWF0ZSBhIG5ldyBzZXJpZXMgb24gcGF0Y2h3b3Jr
LgoKUmVnYXJkcwpLdWJhCgo+Cj4gQ2hlbll1Cj4KPj4gSSBhcG9sb2dpemUgZm9yIHRoZSBjb25m
dXNpb24sIHRoaXMgaXMgbXkgZmlyc3QgdGltZSBkb2luZyB0aGF0Lgo+Pgo+PiBSZWdhcmRzCj4+
IEt1YmEKPj4KPj4+PiBTb21lIEFsbHdpbm5lciBjaGlwcyAobm90YWJseSB0aGUgRDFzL1QxMTMg
YW5kIHRoZSBBMTAwKSBoYXZlIGEgImNvbWJvCj4+Pj4gTUlQSSBEU0kgRC1QSFkiIHdoaWNoIGlz
IHJlcXVpcmVkIHdoZW4gdXNpbmcgc2luZ2xlLWxpbmsgTFZEUzAuIFRoZSBzYW1lCj4+Pj4gUEQw
Li5QRDkgcGlucyBhcmUgdXNlZCBmb3IgZWl0aGVyIERTSSBvciBMVkRTLgo+Pj4+Cj4+Pj4gT3Ro
ZXIgdGhhbiBoYXZpbmcgdG8gdXNlIHRoZSBjb21ibyBELVBIWSwgTFZEUyBvdXRwdXQgaXMgY29u
ZmlndXJlZCBpbgo+Pj4+IHRoZSBzYW1lIHdheSBhcyBvbiBvbGRlciBjaGlwcy4KPj4+Pgo+Pj4+
IFRoaXMgc2VyaWVzIGVuYWJsZXMgdGhlIHN1bjZpIE1JUEkgRC1QSFkgdG8gYWxzbyB3b3JrIGlu
IExWRFMgbW9kZS4gSXQKPj4+PiBpcyB0aGVuIGNvbmZpZ3VyZWQgYnkgdGhlIExDRCBUQ09OLCB3
aGljaCBhbGxvd3MgY29ubmVjdGluZyBhCj4+Pj4gc2luZ2xlLWxpbmsgTFZEUyBkaXNwbGF5IHBh
bmVsLgo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2Mi92MzoKPj4+PiAtIEFwcGxpZWQgY29kZSBmb3Jt
YXR0aW5nIGNoYW5nZXMgZnJvbSByZXZpZXcgY29tbWVudHMKPj4+PiAtIENoYW5nZWQgImRwaHki
IHRvICJjb21iby1waHkiCj4+Pj4gLSBNYWRlIHRoZSBMVkRTIHNldHVwL3RlYXJkb3duIGZ1bmN0
aW9ucyBhYm9ydCBlYXJseSBpbiBjYXNlIG9mIGVycm9yCj4+Pj4gICAgIChhZGRpbmcgYSBwcm9w
ZXIgcmV0dXJuIHZhbHVlIHdvdWxkIHJlcXVpcmUgY2hhbmdlcyBpbiBzZXZlcmFsIGxldmVscwo+
Pj4+ICAgICAgb2YgY2FsbGVyIGZ1bmN0aW9uczsgcGVyaGFwcyBjb3VsZCBiZSBkb25lIGluIGEg
c2VwYXJhdGUgcGF0Y2gpCj4+Pj4gLSBBZGRlZCB0aGUgUEhZIHByb3BlcnRpZXMgdG8gRFQgYmlu
ZGluZ3MKPj4+PiAtIFJlbmFtZWQgbHZkczBfcGlucyB0byBsY2RfbHZkczBfcGlucwo+Pj4+IC0g
UmViYXNlZCBvbiB0b3Agb2YgZHJtL21pc2Mva2VybmVsL2Zvci1saW51eC1uZXh0Cj4+Pj4gLSBI
b3BlZnVsbHkgY29ycmVjdGVkIHRoZSBpbmNvbXBsZXRlIHBhdGNoIGxpc3Qgb2YgdjIsIHdoaWNo
IGhhcHBlbmVkCj4+Pj4gICAgIGR1ZSB0byBhbiBTTVRQIGVycm9yCj4+Pj4KPj4+PiBLdWJhIFN6
Y3pvZHJ6ecWEc2tpICg2KToKPj4+PiAgICAgcGh5OiBhbGx3aW5uZXI6IHBoeS1zdW42aS1taXBp
LWRwaHk6IFN1cHBvcnQgTFZEUyBpbiBjb21ibyBELVBIWQo+Pj4+ICAgICBkcm0vc3VuNGk6IFN1
cHBvcnQgTFZEUyB1c2luZyBNSVBJIERTSSBjb21ibyBELVBIWQo+Pj4+ICAgICBkcm0vc3VuNGk6
IEVuYWJsZSBMVkRTIG91dHB1dCBvbiBzdW4yMGkgRDFzL1QxMTMKPj4+PiAgICAgZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IHN1bjRpOiBBZGQgRDFzL1QxMTMgY29tYm8gRC1QSFkgYmluZGluZ3MKPj4+
PiAgICAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBkMXMtdDExMzogQWRkIEQtUEhZIHRvIFRDT04g
TENEMAo+Pj4+ICAgICByaXNjdjogZHRzOiBhbGx3aW5uZXI6IGQxcy10MTEzOiBBZGQgTFZEUzAg
cGlucwo+Pj4+Cj4+Pj4gICAgLi4uL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjRpLWExMC10Y29uLnlh
bWwgICAgIHwgIDYgKysKPj4+PiAgICAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10
MTEzLmR0c2kgICAgfCAxMSArKysKPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlf
dGNvbi5jICAgICAgICAgICAgfCA1MCArKysrKysrKysrKysrCj4+Pj4gICAgZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCAgICAgICAgICAgIHwgIDYgKysKPj4+PiAgICBkcml2ZXJz
L3BoeS9hbGx3aW5uZXIvcGh5LXN1bjZpLW1pcGktZHBoeS5jICAgfCA3MCArKysrKysrKysrKysr
KysrKystCj4+Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAxNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4+Pgo+Pj4+IC0tCj4+Pj4gMi4yNS4xCj4+Pj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
