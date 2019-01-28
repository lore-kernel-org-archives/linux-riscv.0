Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC49C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:47:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C42420855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 19:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOasDrwx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="a8qJrnQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C42420855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hlTdm0GmPBCthnaP41X1dYNihdul8ZpU7sNEhZOqlpM=; b=pOasDrwxJ/HXhAzdbyfnf97qH
	2YhZux16LpjpjIu8VreYQlohqMd6m2i1kr4tnbjVPXxBqIJC2SbzdtPVaLHWNRftEnhEvUUg/p0Le
	EbP0ziLaf3XFo2PRMS2jqfhShk/8yTMz72L1hvx7V+KC9WZMOmnB3/8kEqsVVDFKmZW26bXgFHK2+
	PEsO6+/lWtmPJfRmDDmX3UBZD9tt9wXpYyUvMtCJkoRu/RlNTQcuyrOYtsvf3gCYw+GiPqinUHOvP
	beOcsLXFqzvwbu74eSbJjPGwJTXcHIqcedP8+OcpzntL2vuhKAdIs4rCCss6weOtsgj7zhkFr1njj
	lfVOeebkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goCs9-0006xz-Pz; Mon, 28 Jan 2019 19:47:09 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goCs5-0006xN-M9
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 19:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1548704825; x=1580240825;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MbtPNd+YWLCi1s5Rb0YsWCq35Etj/SxX1/ZojN/EuJ0=;
 b=a8qJrnQ+by8azPnAtCzL01oT1DN4WwUwraKqOuMX3eVcC2WPXfQC687X
 zjdRQsZhISl7OHKIT6xtTM5YFP7iyQ/Ua31LlKtn0EFfED11TXNQblJ60
 X6J8ylQB6TTjmiV9rh+2/4RYv8sx4EMrdE4BCI9EtPdegVbY5peNPZxnv
 bjWVe4iXkqJTZ6EVzVajJvPIdcKG329mP9kg8mlI/oG/nMdP6psZFgdEY
 jALFFGWhF/2U1FcuNJAWolbl/L74R62N0EXAgowy60/PXeyGT/WY4wcTJ
 2bF/ipXeCos+1kpXvSBCbsCOfKJM3+NS+Ft8y9SfneAFqo5pn7VphirEp Q==;
X-IronPort-AV: E=Sophos;i="5.56,534,1539619200"; d="scan'208";a="205007816"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2019 03:47:02 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 28 Jan 2019 11:26:05 -0800
Received: from 5cg54007gx.ad.shared (HELO [10.86.58.22]) ([10.86.58.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Jan 2019 11:47:03 -0800
Subject: Re: [sw-dev] SBI extension proposal v2
To: Alexander Graf <agraf@suse.de>, Nick Kossifidis <mick@ics.forth.gr>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <cbccd2dd56e1e5b498fd12abda22b863@mailhost.ics.forth.gr>
 <0aa02993-4f71-2171-7bec-54fe40b13279@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <1242b0af-fb94-a199-39b9-c3f654834da9@wdc.com>
Date: Mon, 28 Jan 2019 11:47:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0aa02993-4f71-2171-7bec-54fe40b13279@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_114705_863275_606C0BF8 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, "zong@andestech.com" <zong@andestech.com>,
 ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yOC8xOSAxMTo0MyBBTSwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4gCj4gCj4gT24gMjgu
MDEuMTkgMTc6NDcsIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPj4gzqPPhM65z4IgMjAxOS0wMS0y
OCAxODozOCwgQWxleGFuZGVyIEdyYWYgzq3Os8+BzrHPiM61Ogo+Pj4gT24gMjguMDEuMTkgMTc6
MzMsIEx1a2UgS2VubmV0aCBDYXNzb24gTGVpZ2h0b24gd3JvdGU6Cj4+Pj4gLS0tCj4+Pj4gY3Jv
d2QtZnVuZGVkIGVjby1jb25zY2lvdXMgaGFyZHdhcmU6IGh0dHBzOi8vd3d3LmNyb3dkc3VwcGx5
LmNvbS9lb21hNjgKPj4+Pgo+Pj4+IE9uIE1vbiwgSmFuIDI4LCAyMDE5IGF0IDEyOjQ0IFBNIEFs
ZXhhbmRlciBHcmFmIDxhZ3JhZkBzdXNlLmRlPiB3cm90ZToKPj4+Pgo+Pj4+Pj4gSWYgUmlzYy1W
IHdhbnRzIHRvIGF2b2lkIGZyYWdtZW50YXRpb24sIGl0IHNob3VsZCBzaW1wbHkga2VlcCBhIGZp
cm1lcgo+Pj4+Pj4gcmVpZ24gaW4gd2hhdCBpcyBhbGxvd2VkIGluIGFuIGltcGxlbWVudGF0aW9u
IGFuZCBrZWVwIGEgbGlkIG9uIHN1Y2gKPj4+Pj4+IGhvcnJpZCBpZGVhcyBhcyB2ZW5kb3Igc3Bl
Y2lmaWMgdXNlcnNwYWNlIElTQSBleHRlbnNpb25zLgo+Pj4+Pgo+Pj4+PiBJIHRlbmQgdG8gYWdy
ZWUgaGVyZS4gSSB0aGluayBhIGdsb2JhbCBpZGVudGlmaWNhdGlvbiBzY2hlbWUgaXMKPj4+Pj4g
cmVhc29uYWJsZS4gQnV0IGNhbid0IHdlIGp1c3QgbGl2ZSB3aXRoIGEgc2luZ2xlIGdsb2JhbCBz
cGVjIHRoYXQKPj4+Pj4gcGVvcGxlCj4+Pj4+IGNvbnRyaWJ1dGUgdG8/Cj4+Pj4KPj4+PiAgwqB1
bmZvcnR1bmF0ZWx5LCBhbGV4YW5kZXIsIHRoZSBSSVNDLVYgRm91bmRhdGlvbiBoYXMgY2hvc2Vu
IHRvIGV4Y2x1ZGUKPj4+PiBwZW9wbGUgZnJvbSB0aGUgZGlzY3Vzc2lvbiwgYnkgY2hvb3Npbmcg
YW4gSVRVLXN0eWxlICgiQ2FydGVsbGVkIikKPj4+PiBzZWNyZXRpdmUgc3RhbmRhcmRzIGRldmVs
b3BtZW50IHByb2Nlc3MuCj4+Pj4KPj4+PiAgwqBzbyBhcyBhbiAib3V0c2lkZXIiIHdobyBmb3Ig
d2hhdGV2ZXIgcmVhc29uIGNhbm5vdCBqb2luIHRoYXQgY2xvc2VkLAo+Pj4+IHNlY3JldGl2ZSBw
cm9jZXNzIChmb3IgZXhhbXBsZSBhIHN0cmF0ZWdpY2FsbHktY3JpdGljYWwgdS1ib290IG9yCj4+
Pj4gbGludXgga2VybmVsIGRldmVsb3BlciB3aXRoIGRlY2FkZXMgb2YgcmVsZXZhbnQgZXhwZXJp
ZW5jZSBidXQgd2hvIGlzCj4+Pj4gdW5kZXIgY29udHJhY3QpIGV2ZW4gaWYgeW91IHdhbnRlZCB0
byBjb250cmlidXRlIHRvIGEgc2luZ2xlIGdsb2JhbAo+Pj4+IHNwZWMsIHlvdSBjYW4ndC4KPj4+
Pgo+Pj4+ICDCoHRoZSByZWFzb25zIHdoeSB0aGUgSVRVLXN0eWxlIENhcnRlbCB3YXMgc2V0IHVw
IGhhdmUgYmVlbiBkaXNjdXNzZWQKPj4+PiBhbmQgbWFkZSBjbGVhciAocGF0ZW50cyk7IHRoZSBq
dXN0aWZpY2F0aW9ucyB3ZXJlIGtub2NrZWQgZG93bjsgdGhlcmUKPj4+PiB3YXMgbm8gcmVzcG9u
c2UuCj4+Pgo+Pj4gSSBjYW4gc2VlIHdoeSB5b3Ugd2FudCB0byBoYXZlIGEgcHJvY2VzcyBsaWtl
IHRoYXQgaW4gcGxhY2UgZm9yIHRoZSBJU0EKPj4+IGl0c2VsZiwgYnV0IHRoZSBTQkkgc3BlYyBy
ZWFsbHkgc2hvdWxkIG5vdCBoYXZlIGFueXRoaW5nICJpbm5vdmF0aXZlIiBvcgo+Pj4gcGF0ZW50
YWJsZS4gQXQgdGhlIGVuZCBvZiB0aGUgZGF5LCBpdCdzIGEgY29tbXVuaWNhdGlvbiBtZWNoYW5p
c20uCj4+Pgo+Pj4KPj4+IEFsZXgKPj4KPj4gRllJCj4+IGh0dHBzOi8vZm9zZGVtLm9yZy8yMDE5
L3NjaGVkdWxlL2V2ZW50L3Jpc2N2c2JpLwo+IAo+IFRoYXQgb25lIGlzIG92ZXJsYXBwaW5nIHdp
dGggb24gSSB3aWxsIGJlIGNvLXByZXNlbnRpbmcgb246Cj4gCj4gICAgaHR0cHM6Ly9mb3NkZW0u
b3JnLzIwMTkvc2NoZWR1bGUvZXZlbnQvdWVmaV9ib290X2Zvcl9tZXJlX21vcnRhbHMvCj4gCkdy
ZWF0LiBZb3VyIHRhbGsgaXMgb24gU3VuZGF5LiBTQkkgdGFsayBpcyBvbiBTYXR1cmRheS4KCkxv
b2tpbmcgZm9yd2FyZCB0byBhdHRlbmQgdGhpcyBvbmUgYXMgd2VsbC4KCj4gQnV0IEknbSBzdXJl
IHdlIGNhbiBkaXNjdXNzIHRoaW5ncyByZWdhcmRsZXNzIG9uZSB3YXkgb3IgYW5vdGhlciA6KS4K
PiAKCkRlZmluaXRlbHkuCgpSZWdhcmRzLApBdGlzaAo+IAo+IEFsZXgKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
