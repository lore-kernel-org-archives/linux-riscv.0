Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9669C282D1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKgizAvkbi8lnuP8TInJ/PQ8ir0DzfBBYbpuMFTMoP8=; b=hieTnjyQU80N3n
	OHFm0aA49BVDVJrNAXCcdNONkluiae9BuN1IxS487818mTYNUQPGGeVmoiyDZ0aCTQllyn5fpIAEs
	bLf1MSzulsQ756grxTTFDO2iX58yMw5bMh3clDUPM3yxxHBLKrBsAoTknWkcHuDx0pgELb4SqAXEk
	5Mfos3gTNrq56NIaBqnparuisJ6Kiqg2v5PdrD1otDaF58ERkHVYze88ikNolV6kFyy3JR2ZZcJAa
	EvwiRg6timnvUmxEVZHGdFa81po9KuHypRGckhuLy8mVvNP6gjTUBxIV2cZf6fHKVeoKIYOM946yT
	1AsWYVW3L4CqyB/LBKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9po-00000001ohM-2gZO;
	Mon, 03 Mar 2025 17:44:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9pl-00000001og1-3fVT
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 17:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28548A44E15;
	Mon,  3 Mar 2025 17:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7731DC4CED6;
	Mon,  3 Mar 2025 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741023844;
	bh=FHg++nb6XcLn2zgnWJ6wuRvYeN22ZPHDJ3B02BRO+xE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lp+87tJ1pi10b59/2fo4zE/m+B8T1RtewpFqEzPZY6XT4dfGHus33dn7K2pt2UnRQ
	 owxQjnYrV8ML8dFPKDg3JXOWp7FEvHq/tq+jrhhek7t2YZTGl4VlCTQzscO0rH5FW9
	 0OPPt0RryywgAzJ+kfaXB2QcKwH+YW3zi49qbXKWqJXZZJhJnD6TnlJrpSX1okcyGs
	 2A5p557v4r56tHjf9UV5jjBhcf91Tsf2dvQM8nCC0pZeVyBH8a3GnqgrQ1Zzfy79Jt
	 IzvHl/Oso22RN7LmdGEXDrsye8ZNvWBRMfrVvc5bEMgqlON9Hcaf5H0dDWuHxYVxgJ
	 KYVoL93if/z6g==
Message-ID: <7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
Date: Mon, 3 Mar 2025 18:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
 <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_094406_038963_1F82B4DA 
X-CRM114-Status: GOOD (  10.97  )
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

T24gMDMvMDMvMjAyNSAwOTozOCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
Mi8yMS8yNSAxMDoxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gV2VkLCBGZWIg
MTksIDIwMjUgYXQgMDM6MDI6MThQTSArMDEwMCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+
PiBUaGUgTGljaGVlUGkgNEEgYm9hcmQsIGZlYXR1cmluZyB0aGUgVC1IRUFEIFRIMTUyMCBTb0Ms
IGluY2x1ZGVzIGFuIEltYWdpbmF0aW9uCj4+PiBUZWNobm9sb2dpZXMgQlhNLTQtNjQgR1BVLiBJ
bml0aWFsIHN1cHBvcnQgZm9yIHRoaXMgR1BVIHdhcyBwcm92aWRlZCB0aHJvdWdoIGEKPj4+IGRv
d25zdHJlYW0gZHJpdmVyIFsxXS4gUmVjZW50bHksIGVmZm9ydHMgaGF2ZSBiZWVuIG1hZGUgdG8g
dXBzdHJlYW0gc3VwcG9ydCBmb3IKPj4+IHRoZSBSb2d1ZSBmYW1pbHkgR1BVcywgd2hpY2ggdGhl
IEJYTS00LTY0IGlzIHBhcnQgb2YgWzJdLgo+Pj4KPj4+IFdoaWxlIHRoZSBpbml0aWFsIHVwc3Ry
ZWFtIGRyaXZlciBmb2N1c2VkIG9uIHRoZSBBWEUtMS0xNiBHUFUsIG5ld2VyIHBhdGNoZXMKPj4+
IGhhdmUgaW50cm9kdWNlZCBzdXBwb3J0IGZvciB0aGUgQlhTLTQtNjQgR1BVIFszXS4gVGhlIG1v
ZGVybiB1cHN0cmVhbQo+Pj4gZHJtL2ltYWdpbmF0aW9uIGRyaXZlciBpcyBleHBlY3RlZCB0byBz
dXBwb3J0IHRoZSBCWE0tNC02NCBhcyB3ZWxsIFs0XVs1XS4gQXMKPj4+IHRoaXMgc3VwcG9ydCBp
cyBiZWluZyBkZXZlbG9wZWQsIGl0J3MgY3J1Y2lhbCB0byB1cHN0cmVhbSB0aGUgbmVjZXNzYXJ5
IGdsdWUKPj4+IGNvZGUgaW5jbHVkaW5nIGNsb2NrIGFuZCBwb3dlci1kb21haW4gZHJpdmVycyBz
byB0aGV5J3JlIHJlYWR5IGZvciBpbnRlZ3JhdGlvbgo+Pj4gd2l0aCB0aGUgZHJtL2ltYWdpbmF0
aW9uIGRyaXZlci4KPj4+Cj4+Cj4+IFRoaXMgaXMgdjUgb2YgYmlnIHBhdGNoc2V0IHdoaWNoIGJl
Y2FtZSBodWdlLiBJIHVuZGVyc3RhbmQgeW91IGRpZCBsaWtlCj4+IHRoYXQgZm9yIHYxIHdoaWNo
IHdhcyBSRkMuIEJ1dCBpdCBzdG9wcGVkIGJlaW5nIFJGQy4KPj4KPj4gU3BsaXQgeW91ciBwYXRj
aHNldCwga2VlcGluZyB2ZXJzaW9uaW5nIGFuZCBjaGFuZ2Vsb2csIHBlciBzdWJzeXN0ZW0uCj4g
Cj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx54oCUSSBkaWRuJ3QgaGF2ZSBhY2Nlc3MgdG8gZW1h
aWwuIEkgYWdyZWUgd2l0aAo+IHlvdXIgc3VnZ2VzdGlvbiBhbmQgd2lsbCBzZW5kIHRoZSBjbG9j
ayBjaGFuZ2VzLCBmaXJtd2FyZS9wb3dlciBkb21haW4sCj4gcmVzZXQsIGFuZCBkcm0vaW1hZ2lu
YXRpb24gdXBkYXRlcyBhcyBzZXBhcmF0ZSBwYXRjaHNldHMgZm9yIG1lcmdpbmcuCgoKSG93IGRp
ZCB5b3UgaW1wbGVtZW50IGFib3ZlIGNvbW1lbnQ/IFlvdSBkaWQgdGhlIHNwbGl0LCByaWdodD8g
V2hlcmUgaXMKdmVyc2lvbmluZyBhbmQgd2hlcmUgYXJlIGNoYW5nZWxvZ3M/CgoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
