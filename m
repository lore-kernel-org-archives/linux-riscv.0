Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3CC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbx9KTlte/F4Qkr7fmEfndqhbzPgV9mwtH3Eu26vwwQ=; b=0wL6r/7BmUbvnH
	mX7BdCZK6ofnnknLJQ+pJTsVHp8qfLf0vHm+g77/3ASIriyemOpa2nN3FJEYI/rvErTI1kGqSToJs
	fapx6qpHXizX2SB7zwza2qVMxgKTFM+5EAiJG3yrfRHzaF3t1jHXe/TjnjF0l1xJCxAGWDL93wh8B
	dzNloPZ4d7D2V7Oe3VhJNiRr4cpC0zlYPNFbgFK7W4sEB+qBPJKGNXQhU3iMJGk6lCKRtbldQyC2V
	J0PwaLnaI8Vrhxyz1Abbl6e12+tq17qkP8r2e+rb2sHE704NYXZUiJrkasHWnX6D1MWq4o75hxmMl
	K0z6luWUGBPdmPNgMTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0v1-00GSoI-Kj; Tue, 01 Mar 2022 11:43:51 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0up-00GSjp-Gc; Tue, 01 Mar 2022 11:43:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C51F68AFE; Tue,  1 Mar 2022 12:43:35 +0100 (CET)
Date: Tue, 1 Mar 2022 12:43:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest
 memory encryption is enabled
Message-ID: <20220301114335.GA2881@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-9-hch@lst.de>
 <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_034339_733525_715D783B 
X-CRM114-Status: GOOD (  13.79  )
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

T24gVHVlLCBNYXIgMDEsIDIwMjIgYXQgMTE6Mzk6MjlBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIGlzbid0IHJlYWxseSAibXVzdCIuwqAgVGhlIGd1ZXN0IGlzIHBlcmZlY3Rs
eSBjYXBhYmxlIG9mIHNoYXJpbmcKPiBtZW1vcnkgd2l0aCB0aGUgaHlwZXJ2aXNvci4KPiAKPiBJ
dCdzIGp1c3QgdGhhdCBmb3Igbm93LCBib3VuY2UgYnVmZmVyaW5nIGlzIGFsbGVnZWRseSBmYXN0
ZXIsIGFuZCB0aGUKPiBzaW1wbGUgd2F5IG9mIGdldHRpbmcgaXQgd29ya2luZy4KClllYWgsIEkg
Z3Vlc3MgeW91INGJb3VsZCBqdXN0IHNoYXJlL3Vuc2hhcmUgb24gZGVtYW5kLiAgQnV0IGdpdmVu
IHRoYXQKdGhpcyBpc24ndCBpbXBsZW1lbnRlZCBpdCBpcyBhIG11c3QgaW4gdGhlIGN1cnJlbnQg
a2VybmVsLiAgQnV0IGlmCnlvdSB3YW50IGEgZGlmZmVyZW50IHdvcmRpbmcgc3VnZ2VzdCBvbmUg
YW5kIEknbGwgcHV0IGl0IGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
