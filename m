Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A502FCD8C94
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI6EY/kBB05yGDE5L7eK3nvureKQH+7OE+ckuuO6SoU=; b=DAWFyV6KVdnCb7
	c0jQkalL8Shm6DhxsDrDlGM3UbUeO+9ETC6OMH/a8mOsbzvI1w65vu4UWYHGAJokiJ7DkUjwP9Bh2
	GZUrhk7BL2NQXhCWzWwteoQ8RlYMQWXFYcTfZEj9VpvA+gyKcddZwg+MVKKSVlHVUwg1pa58bvZXM
	0cvUKUIeYh3OOZTjxGbrKpD8XGxkH/JpZ+0L2P8ugQfInXyX3gGJm3vAendRO+JJ0AoYCb8td/lkp
	YJ9pTH876GRVbhkdTtXcNhjVvAQCwAbvxO+4KgcOmCKuu/f1IFxA9B8+NZTqpqtgMj/ChQqGo1h4n
	nZlJSZk0jttRIyESL58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZQh-0000000AjtP-2ZTd;
	Thu, 13 Nov 2025 15:40:11 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZQe-0000000Ajsx-2r1v
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 15:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763048398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UNPr05+3rQh/UX8A79WkVE3XBsOWQP3yPWzrXpjH8uXAO6VYGfco9truRuNCJiU89S6PI8j3C9/faqIDz7XeG9HwC+tQ1tnnJ/NaCZIttRDFg4LPXEgGHwqKkaNiFNLbaZlPabhD1fW6tigFh4GMiB4Zff7puNtdc0+Xb5Us3hA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763048398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4fCKpLICjk4fw3t90InQG4ReeV3U8XAuF/jebYZ0WAM=; 
	b=Zv74+CsFskvWeG5gxXcFtH16LGVr8oim8hmGWniEh5pXCcv4aZz0/voktwkcg1AU8KR4JaNa/K1oiG7WIzqsIE6CpVFJNBRhYnpRtZ4y0cAHaah/sYMHex/kRSt+xxd+GzrR+btbW0jDkYucLRrYz8BLI/hMT1alT5OAEqtL+QQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763048398;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=4fCKpLICjk4fw3t90InQG4ReeV3U8XAuF/jebYZ0WAM=;
	b=O+O8RiMbN3SSMtvLRz4S4WI6l2OK8qbQtKSMnptUwB+I2GEsR4m4ffWqr+XLIdIZ
	mNWrcRYE2cskC/7zxd1qo/YthVEOWKj+vuzW9HV1SMVfWLsoA1a9fGRKhVHF8aUXrQm
	DoDY8nS53KB4W+93qDMp8OFqNlR1vRvsf223HJ9GUSvW1SHk0rognsKb6yUol9gfSoY
	ZVGYDSakWdmTNHq2egBATXcMbEaooPHUOtfGR4wUoApR/jkEz+IX/PDkSepn8WR2Ckz
	hnEZg5mHgvsPsTr09JRbrDW4WUiVJvCbUH19NMpCRNYf06Tn9V1jtowzUKTd04yEDFB
	sfFdHN3BSA==
Received: by mx.zohomail.com with SMTPS id 1763048395696100.40154822714373;
	Thu, 13 Nov 2025 07:39:55 -0800 (PST)
Message-ID: <af984cf6b76fb4cd30f12fbb9ddd889a5e73d036.camel@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: starfive: add Orange Pi RV
 board compatible
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, E Shattow
 <e@freeshell.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Zhu
 <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Yao Zi
 <ziyao@disroot.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 13 Nov 2025 23:39:45 +0800
In-Reply-To: <CANBLGcxoD5w7ApN9mNHWym2oo5XscV7B0rrU5MF68wiS52Eecw@mail.gmail.com>
References: <20250930100318.2131968-1-uwu@icenowy.me>
	 <CANBLGcxoD5w7ApN9mNHWym2oo5XscV7B0rrU5MF68wiS52Eecw@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_074008_781255_899F0B02 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjUtMTEtMTPmmJ/mnJ/lm5vnmoQgMDI6NTUgLTA4MDDvvIxFbWlsIFJlbm5lciBCZXJ0
aGluZ+WGmemBk++8mgo+IFF1b3RpbmcgSWNlbm93eSBaaGVuZyAoMjAyNS0wOS0zMCAxMjowMzox
NykKPiA+IE9yYW5nZSBQaSBSViBpcyBhIG5ld2x5IHJlbGVhc2VkIEpINzExMCBib2FyZCBieSBY
dW5sb25nLgo+ID4gCj4gPiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyB0byB0aGUgc3RhcmZpdmUg
cGxhdGZvcm0gRFQgYmluZGluZy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8dXd1QGljZW5vd3kubWU+Cj4gCj4gSGkgSWNlbm93eSwKPiAKPiBUaGFua3MgZm9yIHRoZSBw
YXRjaGVzISBOb3cgdGhhdCBFJ3MgcGF0Y2ggaXMgaW4gQ29ub3Incwo+IHJpc2N2LWR0LWZvci1u
ZXh0IGJyYW5jaAo+IHdpbGwgeW91IGJlIHNlbmRpbmcgYSB2Mz8gQWxzbyBwbGVhc2UgYWRkIGEg
Y292ZXIgbGV0dGVyIHdoZW4geW91IGRvLgoKSSB3aWxsIGRvIHRoaXMgd2hlbiBJIGhhdmUgdGlt
ZS4KCkJUVywgeW91ciB0aGlzIG1haWwgZ2V0cyBETUFSQyBxdWFyYW50aW5lZCBieSBteSBtYWls
IHByb3ZpZGVyLgoKVGhhbmtzLApJY2Vub3d5Cgo+IAo+IC9FbWlsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
