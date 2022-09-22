Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3E5C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUMztsb71be9PitYvgVRA3URf43CQObHwYLgPF9LGLI=; b=K4RhPc2FbFNE/g
	JBKj+ywzIvaPVwJlt3iUO+sYzdUZGBQ8V3JXBXXZiMlpznxbhfCAha/NuWLmuOyiw4lGRuaOv0CsB
	r7dfFJzBJeVRB4y62KjAORTohXJOu0QKSjoS6JDSSu7ceEgKzgJ0D2+K9Vr+ECEf3pdO9C2YdCilx
	u1+uifZJWVFZrK4ronZFlPswlXLBN6Ebke1NcVoFF1q/VTsDs7jxH1fVEDjg012ty6A/AOljIAA9Y
	XjLMyTdOfTHqcj+Q4BSyb/WaSLDt0YMZMgmJq/uu1+0RDXx6Kw3iP9Gr9PD3Wjj6oJsnyJ61XN8He
	bS8nYB6G0WNy/0rdDvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCgl-00DEmc-GS; Thu, 22 Sep 2022 03:15:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCga-00DEjM-1Q; Thu, 22 Sep 2022 03:15:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAACE143D;
	Wed, 21 Sep 2022 20:15:40 -0700 (PDT)
Received: from [10.162.43.8] (unknown [10.162.43.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAB43F5A1;
	Wed, 21 Sep 2022 20:15:24 -0700 (PDT)
Message-ID: <0236922f-841e-c6d8-c9ee-599d72c458d3@arm.com>
Date: Thu, 22 Sep 2022 08:45:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux MM <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "peterz@infradead.org" <peterz@infradead.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
 "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>,
 "lipeifeng@oppo.com" <lipeifeng@oppo.com>,
 "zhangshiming@oppo.com" <zhangshiming@oppo.com>,
 "guojian@oppo.com" <guojian@oppo.com>, "realmz6@gmail.com"
 <realmz6@gmail.com>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Barry Song <21cnbao@gmail.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>,
 Barry Song <v-songbaohua@oppo.com>, Mel Gorman <mgorman@suse.de>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
 <36B9DE22-E3BC-4CB2-8E3F-B21B61434CD3@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <36B9DE22-E3BC-4CB2-8E3F-B21B61434CD3@vmware.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_201536_200577_1573B593 
X-CRM114-Status: GOOD (  20.62  )
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

CgpPbiA5LzIxLzIyIDEyOjQ3LCBOYWRhdiBBbWl0IHdyb3RlOgo+IE9uIFNlcCAyMCwgMjAyMiwg
YXQgMTE6NTMgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29t
PiB3cm90ZToKPiAKPj4g4pqgIEV4dGVybmFsIEVtYWlsCj4+Cj4+IE9uIDgvMjIvMjIgMTM6NTEs
IFlpY29uZyBZYW5nIHdyb3RlOgo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3RsYmJhdGNo
X2FkZF9tbShzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCAqYmF0Y2gsCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVh
ZGRyKQo+Pj4gK3sKPj4+ICsgICAgIF9fZmx1c2hfdGxiX3BhZ2Vfbm9zeW5jKG1tLCB1YWRkcik7
Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX3RsYmJhdGNoX2ZsdXNo
KHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCkKPj4+ICt7Cj4+PiArICAg
ICBkc2IoaXNoKTsKPj4+ICt9Cj4+Cj4+IEp1c3Qgd29uZGVyaW5nIGlmIGFyY2hfdGxiYmF0Y2hf
YWRkX21tKCkgY291bGQgYWxzbyBkZXRlY3QgY29udGludW91cyBtYXBwaW5nCj4+IFRMQiBpbnZh
bGlkYXRpb24gcmVxdWVzdHMgb24gYSBnaXZlbiBtbSBhbmQgdHJ5IHRvIGdlbmVyYXRlIGEgcmFu
Z2UgYmFzZWQgVExCCj4+IGludmFsaWRhdGlvbiBzdWNoIGFzIGZsdXNoX3RsYl9yYW5nZSgpLgo+
Pgo+PiBzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCB2aWEgdGFzay0+dGxiX3ViYy0+
YXJjaCBjYW4gdHJhY2sgY29udGludW91cwo+PiByYW5nZXMgd2hpbGUgYmVpbmcgcXVldWVkIHVw
IHZpYSBhcmNoX3RsYmJhdGNoX2FkZF9tbSgpLCBhbnkgcmFuZ2UgZm9ybWVkIGNhbgo+PiBsYXRl
ciBiZSBmbHVzaGVkIGluIHN1YnNlcXVlbnQgYXJjaF90bGJiYXRjaF9mbHVzaCgpID8KPj4KPj4g
T1IKPj4KPj4gSXQgbWlnaHQgbm90IGJlIHdvcnRoIHRoZSBlZmZvcnQgYW5kIGNvbXBsZXhpdHks
IGluIGNvbXBhcmlzb24gdG8gcGVyZm9ybWFuY2UKPj4gaW1wcm92ZW1lbnQsIFRMQiByYW5nZSBm
bHVzaCBicmluZ3MgaW4gPwo+IAo+IFNvIGhlcmUgYXJlIG15IDIgY2VudHMsIGJhc2VkIG9uIG15
IGV4cGVyaWVuY2Ugd2l0aCBJbnRlbC14ODYuIEl0IGlzIGxpa2VseQo+IGRpZmZlcmVudCBvbiBh
cm02NCwgYnV0IHBlcmhhcHMgaXQgY2FuIHByb3ZpZGUgeW91IHNvbWUgaW5zaWdodCBpbnRvIHdo
YXQKPiBwYXJhbWV0ZXJzIHlvdSBzaG91bGQgbWVhc3VyZSBhbmQgY29uc2lkZXIuCj4gCj4gSW4g
Z2VuZXJhbCB0aGVyZSBpcyBhIHRyYWRlb2ZmIGJldHdlZW4gZnVsbCBUTEIgZmx1c2hlcyBhbmQg
ZW50cnktc3BlY2lmaWMKPiBvbmVzLiBGbHVzaGluZyBzcGVjaWZpYyBlbnRyaWVzIHRha2VzIG1v
cmUgdGltZSB0aGFuIGZsdXNoaW5nIHRoZSBlbnRpcmUKPiBUTEIsIGJ1dCBzYWRlIFRMQiByZWZp
bGxzLgoKUmlnaHQuCgo+IAo+IERhdmUgSGFuc2VuIG1hZGUgc29tZSBjYWxjdWxhdGlvbnMgaW4g
dGhlIHBhc3QgYW5kIGNhbWUgdXAgd2l0aCAzMyBhcyBhCj4gbWFnaWMgY3V0b2ZmIG51bWJlciwg
aS5lLiwgaWYgeW91IG5lZWQgdG8gZmx1c2ggbW9yZSB0aGFuIDMzIGVudHJpZXMsIGp1c3QKPiBm
bHVzaCB0aGUgZW50aXJlIFRMQi4gSSBhbSBub3Qgc3VyZSB0aGF0IHRoaXMgZXhhY3QgbnVtYmVy
IGlzIHZlcnkKPiBtZWFuaW5nZnVsLCBzaW5jZSBvbmUgbWlnaHQgYXJndWUgdGhhdCBpdCBzaG91
bGTigJl2ZSB0YWtlbiBQVEkgaW50byBhY2NvdW50Cj4gKHdoaWNoIG1pZ2h0IHJlcXVpcmUgdHdp
Y2UgYXMgbWFueSBUTEIgaW52YWxpZGF0aW9ucykuCgpPa2F5LgoKPiAKPiBBbnlob3csIGJhY2sg
dG8gYXJjaF90bGJiYXRjaF9hZGRfbW0oKS4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIHRyYWNrIHJh
bmdlcywKPiBidXQgdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgeW91IHdvdWxkIGFjdHVhbGx5IHN1
Y2NlZWQgaW4gZm9ybWluZyBjb250aW51b3VzCj4gcmFuZ2VzIHRoYXQgYXJlIGV2ZW50dWFsbHkg
KG9uIHg4Nikgc21hbGxlciB0aGFuIHRoZSBmdWxsIFRMQiBmbHVzaCBjdXRvZmYKPiAoPTMzKS4g
UXVlc3Rpb25hYmxlIChwZXJoYXBzIGJldHRlciB3aXRoIE1HTFJVPykuCgpUaGlzIHByb3Bvc2Fs
IGhlcmUgZm9yIGFybTY0IGRvZXMgbm90IGNhdXNlIGEgZnVsbCBUTEIgZmx1c2ggZXZlci4gSXQg
Y3JlYXRlcwppbmRpdmlkdWFsIFRMQiBmbHVzaGVzIGFsbCB0aGUgdGltZS4gSGVuY2UgdGhlIGNo
b2ljZSBoZXJlIGlzIG5vdCBiZXR3ZWVuIGZ1bGwKVExCIGZsdXNoIGFuZCBwb3NzaWJsZSByYW5n
ZSBmbHVzaGVzLiBDaG9pY2UgaXMgYWN0dWFsbHkgYmV0d2VlbiBpbmRpdmlkdWFsClRMQiBmbHVz
aGVzIGFuZCByYW5nZS9mdWxsIFRMQiBmbHVzaGVzLgoKPiAKPiBUaGVuLCB5b3Ugc2hvdWxkIHJl
bWVtYmVyIHRoYXQgdHJhY2tpbmcgc2hvdWxkIGJlIHZlcnkgZWZmaWNpZW50LCBzaW5jZSBldmVu
Cj4gZmV3IGNhY2hlIG1pc3NlcyBtaWdodCBoYXZlIGdyZWF0ZXIgY29zdCB0aGFuIHdoYXQgeW91
IHNhdmUgYnkKPiBzZWxlY3RpdmUtZmx1c2hpbmcuIEZpbmFsbHksIG9uIHg4NiB5b3Ugd291bGQg
bmVlZCB0byBpbnZva2UgdGhlIHNtcC9JUEkKPiBsYXllciBtdWx0aXBsZSB0aW1lcyB0byBzZW5k
IGRpZmZlcmVudCBjb3JlcyB0aGUgcmVsZXZhbnQgcmFuZ2UgdGhleSBuZWVkIHRvCj4gZmx1c2gu
CgpBZ3JlZWQsIHRoZXNlIHJlYXNvbnMgbWFrZSBpdCBtdWNoIGRpZmZpY3VsdCB0byBnYWluIGFu
eSBtb3JlIHBlcmZvcm1hbmNlLgoKPiAKPiBJT1c6IEl0IGlzIHNvbWV3aGF0IGNvbXBsaWNhdGVk
IHRvIGltcGxlbWVudCBlZmZpY2VpbnRseS4gT24geDg2LCBhbmQKPiBwcm9iYWJseSBvdGhlciBJ
UEktYmFzZWQgVExCIHNob290ZG93biBzeXN0ZW1zLCBkb2VzIG5vdCBoYXZlIGNsZWFyCj4gcGVy
Zm9ybWFuY2UgYmVuZWZpdCAoSU1ITykuCgpBZ3JlZWQsIHRoYW5rcyBmb3Igc3VjaCBhIGRldGFp
bGVkIGV4cGxhbmF0aW9uLCBhcHByZWNpYXRlIGl0LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
