Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6729C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/47XCKZQTn6UoMEpiZNyFPOuWLj3895/lb1uJTCccs=; b=NnpeTi9FE7TeZ8
	qwYH/C7oF/Nirf/r0m2f8FY9+PSn2wWvHMoruRA3+kKnsOy7Qy0m9T9dyD36Swh5YUpZqvp7P3d93
	u2BqweObd+LooXTDBHxj5QZe8vYI8fAywqxVz35sRm2XBWviVFxfv+QTPnphJSUOMb2mVO8odXEk6
	0RnYaODMteu8bIzSu6NXducsvtiQcu7wsHOlv5irhc6eEXm84+sL/PhKqtfEPVIahNeqrOOaLh7tT
	SyNAlynqoGddU2187TnaLsrr8X0LUGudG9/fWJGFLVZJUPBmtNXKa0pY3UmQDQYNaXba29uvnUDMM
	qrxouHostOIWAS9lPBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvSd-004X0C-30;
	Thu, 30 Mar 2023 16:49:15 +0000
Received: from [71.59.149.187] (helo=[10.0.0.152])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1phvSb-004Wz9-1I;
	Thu, 30 Mar 2023 16:49:13 +0000
Message-ID: <833203b0-aee5-eb23-afb4-ff71a3024258@infradead.org>
Date: Thu, 30 Mar 2023 09:49:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux.dev, Conor Dooley <conor@kernel.org>,
 linux-riscv@lists.infradead.org
References: <20230330060105.29460-1-rdunlap@infradead.org>
 <2529dd93-2cb2-6ed8-20c0-c424e6613717@arm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2529dd93-2cb2-6ed8-20c0-c424e6613717@arm.com>
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

CgpPbiAzLzMwLzIzIDA5OjM0LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24gMjAyMy0wMy0zMCAw
NzowMSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBPbiByaXNjdjY0LCBsaW51eC1uZXh0LTIwMjMz
MDMwIChhbmQgZm9yIHNldmVyYWwgZGF5cyBlYXJsaWVyKSwKPj4gdGhlcmUgaXMgYSBrY29uZmln
IHdhcm5pbmc6Cj4+Cj4+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0
ZWQgZm9yIElPTU1VX0lPX1BHVEFCTEVfTFBBRQo+PiDCoMKgIERlcGVuZHMgb24gW25dOiBJT01N
VV9TVVBQT1JUIFs9eV0gJiYgKEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYg
IUdFTkVSSUNfQVRPTUlDNjQgWz1uXQo+PiDCoMKgIFNlbGVjdGVkIGJ5IFt5XToKPj4gwqDCoCAt
IElQTU1VX1ZNU0EgWz15XSAmJiBJT01NVV9TVVBQT1JUIFs9eV0gJiYgKEFSQ0hfUkVORVNBUyBb
PXldIHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiAhR0VORVJJQ19BVE9NSUM2NCBbPW5dCj4+Cj4+
IGFuZCBidWlsZCBlcnJvcnM6Cj4+Cj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUv
aW8tcGd0YWJsZS1hcm0ubzogaW4gZnVuY3Rpb24gYC5MMTQwJzoKPj4gaW8tcGd0YWJsZS1hcm0u
YzooLmluaXQudGV4dCsweDFlOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFsbG9jX2lvX3Bn
dGFibGVfb3BzJwo+PiByaXNjdjY0LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUt
YXJtLm86IGluIGZ1bmN0aW9uIGAuTDE2OCc6Cj4+IGlvLXBndGFibGUtYXJtLmM6KC5pbml0LnRl
eHQrMHhhYjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmcmVlX2lvX3BndGFibGVfb3BzJwo+
PiByaXNjdjY0LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EubzogaW4gZnVuY3Rp
b24gYC5MMTQwJzoKPj4gaXBtbXUtdm1zYS5jOigudGV4dCsweGJjNCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGZyZWVfaW9fcGd0YWJsZV9vcHMnCj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZl
cnMvaW9tbXUvaXBtbXUtdm1zYS5vOiBpbiBmdW5jdGlvbiBgLkwwICc6Cj4+IGlwbW11LXZtc2Eu
YzooLnRleHQrMHgxNDVlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYWxsb2NfaW9fcGd0YWJs
ZV9vcHMnCj4+Cj4+IEFkZCBSSVNDViBhcyBhbiBhbGxvd2VkIEFSQ0ggZGVwZW5kZW5jeSB0byBm
aXggdGhlc2UgcHJvYmxlbXMuCj4+Cj4+IEZpeGVzOiBkMjg2YTU4YmM4ZjQgKCJpb21tdTogVGlk
eSB1cCBpby1wZ3RhYmxlIGRlcGVuZGVuY2llcyIpCj4gCj4gQlRXIHRoYXQgZG9lc24ndCBsb29r
IGxpa2UgdGhlIHJpZ2h0IGZpeCB0YXJnZXQgLSB0aGlzIHByZXN1bWFibHkgZGF0ZXMgYmFjayBh
cyBmYXIgYXMgd2hlbiBBUkNIX1JFTkVTQVMgd2FzIGFkZGVkIHRvIFJJU0NWLCBzdWNoIHRoYXQg
aXQgd2FzIHBvc3NpYmxlIHRvIHN0YXJ0IHNlbGVjdGluZyBJUE1NVV9WTVNBIHdpdGhvdXQgQ09N
UElMRV9URVNUPwoKT0ssIEkgY2FuIGdvIHdpdGggdGhhdC4gVGhhbmtzIGZvciB5b3VyIGhlbHAu
CgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
