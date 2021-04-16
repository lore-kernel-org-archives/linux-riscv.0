Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4748C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:20:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C07F6113D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C07F6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QzVFrYBzF/a62HKbRO56nH1gsO7Qlh3o4kwf26a2Jrc=; b=T+PfFt9nBONvNPQmVeGBHazcI
	eZBVNB/ybSJFy5ZgC58FAbKShpJra3lrRsv61v6KjI5oiIQDFP51wjY5+CW8uXcZX+cdMWhWwKfo5
	qOrHsHQA/fn/tygAgALFpoyo5NPedb1OTKhBW5mfRHfC0/wW2SdnxV+Zyccgvb13yMrgq0npOhzeX
	ZOribhVlf+FFnRG2hQR1rkzmGvPjFaQAnlTgjWCPpXaFWpzQ3c9nSFw0+4Y9bNjRwLkTf5gjjIcU6
	L7j1Lgt9SRO58ZETwFVXolsUXQcRsdjqOMZnsPZZvZGVd/D+88UVg46LVEVvpeWLa0JRFGDHeoSwC
	rIhTA/8Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXGtu-000rUC-H8; Fri, 16 Apr 2021 05:20:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXGtY-000rQh-Mo; Fri, 16 Apr 2021 05:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=NjTACirhsoRWIu+2X6panxfv4Fh5h641YRSJ916g/Io=; b=2QALABkPjIUQbq5ee2J9rDghK/
 QuZgOZxsszs7mA+0Sh1I0b3ZppNMHXA8wF696mFzST7+oUfhGCSGZPKZheF6idzMOnQ0s/3XaiRQ/
 f/LXo3QCAzY/Mi0NqZbNF3fhG/g9h2aeZ9NzRid0/BiIBcjWbsaN5a9nc+5NDnw6ZT6Cg6ky6S3CC
 +kBGDnd4YSfheRzX4h52STrO0sbPfWlelSUIV1QQvLIDgJCMxRIK7zq0j96mElKggJbiOmqzLMf2C
 O4p8WVl1ZY1VsgPco7IpJYifEE2hozOhKliGBTHptAcGhbfNeusjsQqUKIx8xAStU6xTZjaVeG5Ne
 KdAvVXJw==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXGtV-0095OS-2d; Fri, 16 Apr 2021 05:19:55 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM4K01LdRzB09bJ;
 Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id n0Rd_tp0QaYj; Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM4Jz6gV6zB09b1;
 Fri, 16 Apr 2021 07:19:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B55238B81C;
 Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3r3x5D8gtbOn; Fri, 16 Apr 2021 07:19:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3F818B81A;
 Fri, 16 Apr 2021 07:19:47 +0200 (CEST)
Subject: Re: [PATCH v1 3/5] mm: ptdump: Provide page size to notepage()
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <1ef6b954fb7b0f4dfc78820f1e612d2166c13227.1618506910.git.christophe.leroy@csgroup.eu>
 <8735vr16sd.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ce7773ea-80d0-14c8-3547-d53424682469@csgroup.eu>
Date: Fri, 16 Apr 2021 07:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8735vr16sd.fsf@dja-thinkpad.axtens.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_221953_449252_E347AFB2 
X-CRM114-Status: GOOD (  19.52  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDAxOjEyLCBEYW5pZWwgQXh0ZW5zIGEgw6ljcml0wqA6Cj4gSGkg
Q2hyaXN0b3BoZSwKPiAKPj4gICBzdGF0aWMgdm9pZCBub3RlX3BhZ2Uoc3RydWN0IHB0ZHVtcF9z
dGF0ZSAqcHRfc3QsIHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IGxldmVsLAo+PiAtCQkgICAgICB1
NjQgdmFsKQo+PiArCQkgICAgICB1NjQgdmFsLCB1bnNpZ25lZCBsb25nIHBhZ2Vfc2l6ZSkKPiAK
PiBDb21waWxlcnMgY2FuIHdhcm4gYWJvdXQgdW51c2VkIHBhcmFtZXRlcnMgYXQgLVdleHRyYSBs
ZXZlbC4gIEhvd2V2ZXIsCj4gcmVhZGluZyBzY3JpcHRzL01ha2VmaWxlLmV4dHJhd2FybiBpdCBs
b29rcyBsaWtlIHRoZSB3YXJuaW5nIGlzCj4gZXhwbGljaXRseSBfZGlzYWJsZWRfIGluIHRoZSBr
ZXJuZWwgYXQgVz0xIGFuZCBub3QgcmVlbmFibGVkIGF0IFc9MiBvcgo+IFc9My4gU28gSSBndWVz
cyB0aGlzIGlzIGZpbmUuLi4KClRoZXJlIGFyZSBhIGxvdCBsb3QgbG90IGZ1bmN0aW9ucyBoYXZp
bmcgdW51c2VkIHBhcmFtZXRlcnMgaW4gdGhlIGtlcm5lbCAsIGVzcGVjaWFsbHkgdGhlIG9uZXMg
dGhhdCAKYXJlIHJlLWltcGxlbWVudGVkIGJ5IGVhY2ggYXJjaGl0ZWN0dXJlLgoKPiAKPj4gQEAg
LTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgaW50IHB0ZHVtcF9ob2xlKHVuc2lnbmVkIGxvbmcgYWRk
ciwgdW5zaWduZWQgbG9uZyBuZXh0LAo+PiAgIHsKPj4gICAJc3RydWN0IHB0ZHVtcF9zdGF0ZSAq
c3QgPSB3YWxrLT5wcml2YXRlOwo+PiAgIAo+PiAtCXN0LT5ub3RlX3BhZ2Uoc3QsIGFkZHIsIGRl
cHRoLCAwKTsKPj4gKwlzdC0+bm90ZV9wYWdlKHN0LCBhZGRyLCBkZXB0aCwgMCwgMCk7Cj4gCj4g
SSBrbm93IGl0IGRvZXNuJ3QgbWF0dGVyIGF0IHRoaXMgcG9pbnQsIGJ1dCBJJ20gbm90IHJlYWxs
eSB0aHJpbGxlZCBieQo+IHRoZSBpZGVhIG9mIHBhc3NpbmcgMCBhcyB0aGUgc2l6ZSBoZXJlLiBE
b2Vzbid0IHRoZSBob2xlIGhhdmUgYSBrbm93bgo+IHBhZ2Ugc2l6ZT8KClRoZSBob2xlIGhhcyBh
IHNpemUgZm9yIHN1cmUsIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGNhbGwgaXQgYSBwYWdlIHNpemU6
CgpPbiBwb3dlcnBjIDh4eCwgd2UgaGF2ZSA0IHBhZ2Ugc2l6ZXM6IDhNLCA1MTJrLCAxNmsgYW5k
IDRrLgpBIHBhZ2UgdGFibGUgd2lsbCBjb3ZlciA0TSBhcmVhcyBhbmQgd2lsbCBjb250YWluIHBh
Z2VzIG9mIHNpemUgNTEyaywgMTZrIGFuZCA0ay4KQSBQR0QgdGFibGUgY29udGFpbnMgZWl0aGVy
IGVudHJpZXMgd2hpY2ggcG9pbnRzIHRvIGEgcGFnZSB0YWJsZSAoY292ZXJpbmcgNE0pLCBvciB0
d28gaWRlbnRpY2FsIApjb25zZWN1dGl2ZSBlbnRyaWVzIHBvaW50aW5nIHRvIHRoZSBzYW1lIGh1
Z2VwZCB3aGljaCBjb250YWlucyBhIHNpbmdsZSBQVEUgZm9yIGFuIDhNIHBhZ2UuCgpTbywgaWYg
YSBQR0QgZW50cnkgaXMgZW1wdHksIHRoZSBob2xlIGlzIDRNLCBpdCBjb3JyZXNwb25kcyB0byBu
b25lIG9mIHRoZSBwYWdlIHNpemVzIHRoZSAKYXJjaGl0ZWN0dXJlIHN1cHBvcnRzLgoKCkJ1dCBs
b29raW5nIGF0IHdoYXQgaXMgZG9uZSB3aXRoIHRoYXQgc2l6ZSwgaXQgY2FuIG1ha2Ugc2Vuc2Ug
dG8gcGFzcyBpdCB0byBub3RlcGFnZSgpIGFueXdheS4gTGV0J3MgCmRvIHRoYXQuCgo+IAo+PiAg
IAo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+IEBAIC0xNTMsNSArMTUzLDUgQEAgdm9pZCBwdGR1
bXBfd2Fsa19wZ2Qoc3RydWN0IHB0ZHVtcF9zdGF0ZSAqc3QsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCBwZ2RfdCAqcGdkKQo+PiAgIAltbWFwX3JlYWRfdW5sb2NrKG1tKTsKPj4gICAKPj4gICAJLyog
Rmx1c2ggb3V0IHRoZSBsYXN0IHBhZ2UgKi8KPj4gLQlzdC0+bm90ZV9wYWdlKHN0LCAwLCAtMSwg
MCk7Cj4+ICsJc3QtPm5vdGVfcGFnZShzdCwgMCwgLTEsIDAsIDApOwo+IAo+IEknbSBtb3JlIE9L
IHdpdGggdGhlIGlkZWEgb2YgcGFzc2luZyAwIGFzIHRoZSBzaXplIHdoZW4gdGhlIGRlcHRoIGlz
IC0xCj4gKGRvbid0IGtub3cpOiBpZiB3ZSBkb24ndCBrbm93IHRoZSBkZXB0aCB3ZSBjb25jZXB0
dWFsbHkgY2FuJ3Qga25vdyB0aGUKPiBwYWdlIHNpemUuCj4gCj4gUmVnYXJkcywKPiBEYW5pZWwK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
