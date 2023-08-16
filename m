Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB19EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 04:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAmpAuPS+q12634tXyhV58BBS6DJKn9zqvC4Ms2LL6k=; b=glevZKCsXFTMdu
	JKAVdqaR8jGo51YhiVVDBe+c/4tloi7mdAVrAGPI5z8i0k2h8zS294okcH/NsoUJZAeDzApND0oPb
	XYSa8dPGZZBPmaize9bkgeyYPMP+zye6xDJyXSrqldirVKDtOH6Ne+vC0bBglRQ3lu95TAo4+vOiT
	zieVwu5dlj/NhH5VPPlJy7gA9dfWLuKTAn2ll3oBck3ahx/+8rP3K82lACbOIU/wRdi62Y34ajJVZ
	BJpPl0Ysd+3Itwmr1NI9yU3cA+5s7OXLXiy7c7FZBCcdZ33H+87dCR4DyaQ0VtXlSFhck8J2HBgab
	KR6pDozjI58MwyYC7hww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW7sR-0038iP-2q;
	Wed, 16 Aug 2023 04:11:23 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW7sP-0038hm-2K
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 04:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692159081; x=1723695081;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4+AGSqBUOkC77nRQkn+4Zy4NeYFwDDx95fpuE62seCM=;
  b=Me3UT6+KDJBcxloLv1S1jyaCLD56u7NYOUBh3FkONOt0f62Qtagp72Y2
   uO2VJ3Ig8Qo4Z/EfbdV8b10qbyBaw+Z7f41aDnrMJCpubxw4amFXCNgJS
   i9uG1AKYbdwZzFm7FDvAnq77206Mi/IXi5OYnG7EcE/IlWZAZAz+GjDdp
   ZV8kU6oT63Jt1IjR6OzAmKn7/a8IfvxVkM8nGvKgSP7lAA390d5Yw8i4S
   zBQ7g8aMKwJbNUhtp1iNhGRYX8+PcqKt3bLWbhvmQgPG+hA05E3LbY9vR
   ojJImtdZisuNVf+/ha7HwKjq5BowBBCgpz4M4kQEfFLR8l49Pzpm9XX1r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352023649"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="352023649"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 21:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737140064"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="737140064"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.209.88]) ([10.254.209.88])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 21:10:28 -0700
Message-ID: <e9d339f0-89c6-10b4-3171-9c5b1725b76c@linux.intel.com>
Date: Wed, 16 Aug 2023 12:10:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Anup Patel <apatel@ventanamicro.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
 <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca>
 <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
 <ZNOpbac4i5zfmHj4@ziepe.ca>
 <CANXhq0rzz1Sn8dKvNt7acvKN_g5yXFN9u6XPiRHr9ay7q2VbzA@mail.gmail.com>
 <ZNvGH91EmlOAaxBK@ziepe.ca>
 <CANXhq0pQ5wisNtbVjm031btUiO=y_MmA9rfbWwnMFo_1y2d50w@mail.gmail.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <CANXhq0pQ5wisNtbVjm031btUiO=y_MmA9rfbWwnMFo_1y2d50w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_211121_855928_A8D48008 
X-CRM114-Status: GOOD (  29.73  )
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

T24gMjAyMy84LzE2IDEwOjE2LCBab25nIExpIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDE2LCAyMDIz
IGF0IDI6MzjigK9BTSBKYXNvbiBHdW50aG9ycGU8amdnQHppZXBlLmNhPiAgd3JvdGU6Cj4+IE9u
IFR1ZSwgQXVnIDE1LCAyMDIzIGF0IDA5OjI4OjU0QU0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4+
PiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDEwOjU34oCvUE0gSmFzb24gR3VudGhvcnBlPGpnZ0B6
aWVwZS5jYT4gIHdyb3RlOgo+Pj4+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDEwOjQyOjQ3QU0g
KzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4+Pj4KPj4+Pj4gUGVyaGFwcyB0aGlzIHF1ZXN0aW9uIGNv
dWxkIGJlIHJlbGF0ZWQgdG8gdGhlIHNjZW5hcmlvcyBpbiB3aGljaAo+Pj4+PiBkZXZpY2VzIHdp
c2ggdG8gYmUgaW4gYnlwYXNzIG1vZGUgd2hlbiB0aGUgSU9NTVUgaXMgaW4gdHJhbnNsYXRpb24K
Pj4+Pj4gbW9kZSwgYW5kIHdoeSBJT01NVSBkZWZpbmVzL3N1cHBvcnRzIHRoaXMgY2FzZS4gQ3Vy
cmVudGx5LCBJIGNvdWxkCj4+Pj4+IGVudmlzaW9uIGEgc2NlbmFyaW8gd2hlcmUgYSBkZXZpY2Ug
aXMgYWxyZWFkeSBjb25uZWN0ZWQgdG8gdGhlIElPTU1VCj4+Pj4+IGluIGhhcmR3YXJlLCBidXQg
aXQgaXMgbm90IGZ1bmN0aW9uaW5nIGNvcnJlY3RseSwgb3IgdGhlcmUgYXJlCj4+Pj4+IHBlcmZv
cm1hbmNlIGltcGFjdHMuIElmIG1vZGlmeWluZyB0aGUgaGFyZHdhcmUgaXMgbm90IGZlYXNpYmxl
LCBhCj4+Pj4+IGRlZmF1bHQgY29uZmlndXJhdGlvbiB0aGF0IGFsbG93cyBieXBhc3MgbW9kZSBj
b3VsZCBiZSBwcm92aWRlZCBhcyBhCj4+Pj4+IHNvbHV0aW9uLiBUaGVyZSBtaWdodCBiZSBvdGhl
ciBzY2VuYXJpb3MgdGhhdCBJIG1pZ2h0IGhhdmUgb3Zlcmxvb2tlZC4KPj4+Pj4gSXQgc2VlbXMg
dG8gbWUgc2luY2UgSU9NTVUgc3VwcG9ydHMgdGhpcyBjb25maWd1cmF0aW9uLCBpdCB3b3VsZCBi
ZQo+Pj4+PiBhZHZhbnRhZ2VvdXMgdG8gaGF2ZSBhbiBhcHByb2FjaCB0byBhY2hpZXZlIGl0LCBh
bmQgRFQgbWlnaHQgYmUgYQo+Pj4+PiBmbGV4aWJsZSB3YXkuCj4+Pj4gU28gZmFyIHdlJ3ZlIHRh
a2VuIHRoZSBhcHByb2FjaCB0aGF0IGJyb2tlbiBoYXJkd2FyZSBpcyBxdWlya2VkIGluIHRoZQo+
Pj4+IGtlcm5lbCBieSBtYXRjaGluZyBPRiBjb21wYXRpYmxlIHN0cmluZyBwYXR0bmVycy4gVGhp
cyBpcyBIVyB0aGF0IGlzCj4+Pj4gY29tcGxldGVseSBicm9rZW4gYW5kIHRoZSBJT01NVSBkb2Vz
bid0IHdvcmsgYXQgYWxsIGZvciBpdC4KPj4+Pgo+Pj4+IEhXIHRoYXQgaXMgc2xvdyBvciB3aGF0
ZXZlciBpcyBub3QgcXVpcmtlZCBhbmQgdGhpcyBpcyBhbiBhZG1pbiBwb2xpY3kKPj4+PiBjaG9p
Y2Ugd2hlcmUgdGhlIHN5c3RlbSBzaG91bGQgbGFuZCBvbiB0aGUgc2VjdXJpdHkvcGVyZm9ybWFu
Y2UKPj4+PiBzcGVjdHJ1bS4KPj4+Pgo+Pj4+IFNvIEknbSBub3Qgc3VyZSBhZGRpbmcgRFQgbWFr
ZXMgc2Vuc2UgaGVyZS4KPj4+Pgo+Pj4gSGkgSmFzb24sCj4+PiBTb3JyeSBmb3IgYmVpbmcgbGF0
ZSBoZXJlLCBJIGhhZG4ndCBub3RpY2VkIHRoaXMgcmVwbHkgZWFybGllci4gVGhlCj4+PiBhcHBy
b2FjaCBzZWVtcyB0byBhZGRyZXNzIHRoZSBzaXR1YXRpb24uIENvdWxkIHlvdSBraW5kbHkgcHJv
dmlkZQo+Pj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIGxvY2F0aW9uIG9mIHRoZSBwYXRjaGVzPyBJ
IHdhcyB3b25kZXJpbmcgYWJvdXQKPj4+IGZ1cnRoZXIgZGV0YWlscyByZWdhcmRpbmcgdGhpcyBw
YXJ0aWN1bGFyIGltcGxlbWVudGF0aW9uLiBUaGFua3MKPj4gVGhlcmUgYXJlIGEgY291cGxlIHZl
cnNpb25zLCBlZwo+PiAgIGFybV9zbW11X2RlZl9kb21haW5fdHlwZSgpCj4+ICAgcWNvbV9zbW11
X2RlZl9kb21haW5fdHlwZSgpCj4+Cj4gSSB0aG91Z2h0IHdoYXQgeW91IG1lbnRpb25lZCBlYXJs
aWVyIGlzIHRoYXQgdGhlcmUgaXMgYSBuZXcgYXBwcm9hY2gKPiBiZWluZyBjb25zaWRlcmVkIGZv
ciB0aGlzLiBJIHRoaW5rIHdoYXQgeW91IHBvaW50IG91dCBpcyB0aGUgc2FtZSBhcwo+IEFudXAg
bWVudGlvbmVkLiBIb3dldmVyLCBhcyBJIG1lbnRpb25lZCBlYXJsaWVyLCBJIGFtIGV4cGxvcmlu
ZyBhIG1vcmUKPiBmbGV4aWJsZSBhcHByb2FjaCB0byBhY2hpZXZlIHRoaXMgb2JqZWN0aXZlLiBU
aGlzIHdheSwgd2UgY2FuIGF2b2lkCj4gaGFyZCBjb2RpbmcgYW55dGhpbmcgKGkuZS5saXN0IGNv
bXBhdGlibGUgc3RyaW5nKSBpbiB0aGUgZHJpdmVyIG9yCj4gcmVxdWlyaW5nIGEga2VybmVsIHJl
YnVpbGQgZXZlcnkgdGltZSB3ZSBuZWVkIHRvIGNoYW5nZSB0aGUgbW9kZSBmb3IKPiBzcGVjaWZp
YyBkZXZpY2VzLiBGb3IgZXhhbXBsZSwgdGhlIGRyaXZlciBjb3VsZCBwYXJzZSB0aGUgZGV2aWNl
IG5vZGUKPiB0byBkZXRlcm1pbmUgYW5kIHJlY29yZCBpZiBhIGRldmljZSB3aWxsIGJlIHNldCB0
byBieXBhc3MsIGFuZCB0aGVuCj4gdGhlIC5kZWZfZG9tYWluX3R5cGUgY291bGQgYmUgdXNlZCB0
byBzZXQgdG8gSU9NTVVfRE9NQUlOX0lERU5USVRZIGJ5Cj4gdGhlIHJlY29yZC4gSSdtIG5vdCBz
dXJlIGlmIGl0IG1ha2VzIHNlbnNlIGZvciBldmVyeW9uZSwgaXQgc2VlbXMgdG8KPiBtZSB0aGF0
IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoZXJlIGlzIGEgd2F5IHRvIGRvIHRoaXMuIPCfmIQKCldo
YXQgeW91IGRlc2NyaWJlZCBhcHBsaWVzIHRvIHRoZSBjYXNlIHdoZXJlIHRoZSBkZXZpY2UgaXMg
KnF1aXJreSosIGl0CiJpcyBub3QgZnVuY3Rpb25pbmcgY29ycmVjdGx5IiB3aGVuIHRoZSBJT01N
VSBpcyBjb25maWd1cmVkIGluIERNQQp0cmFuc2xhdGlvbiBtb2RlLgoKQnV0IGl0IGNvdWxkIG5v
dCBiZSB1c2VkIGluIGFub3RoZXIgY2FzZSwgYXMgZGVzY3JpYmVkIGFib3ZlLCB3aGVyZQpJT01N
VSB0cmFuc2xhdGlvbiBoYXMgcGVyZm9ybWFuY2UgaW1wYWN0cyBvbiB0aGUgZGV2aWNlJ3MgRE1B
CmVmZmljaWVuY3kuIFRoaXMgaXMgYSBraW5kIG9mIGEgdXNlciBwb2xpY3kgYW5kIHNob3VsZCBu
b3QgYmUgYWNoaWV2ZWQKdGhyb3VnaCB0aGUgIkRUL0FQQ0kgKyBkZWZfZG9tYWluX3R5cGUiIG1l
Y2hhbmlzbS4KClRoZSBpb21tdSBzdWJzeXN0ZW0gaGFzIHByb3ZpZGVkIGEgc3lzZnMgaW50ZXJm
YWNlIHRoYXQgdXNlcnMgY2FuIHVzZSB0bwpjaGFuZ2UgdGhlIGRvbWFpbiB0eXBlIGZvciBkZXZp
Y2VzLiBUaGlzIG1lYW5zIHRoYXQgdXNlcnMgY2FuIGNoYW5nZSB0aGUKZG9tYWluIHR5cGUgYXQg
dGhlaXIgd2lzaGVzLCB3aXRob3V0IGhhdmluZyB0byBtb2RpZnkgdGhlIGtlcm5lbApjb25maWd1
cmF0aW9uLgoKQmVzdCByZWdhcmRzLApiYW9sdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
