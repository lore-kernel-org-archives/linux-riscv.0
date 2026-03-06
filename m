Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356AAFCC9A2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGwCYGn0Ty/6ZxmC3DMDFENe3yELzr+jI/0BHIJH8lc=; b=3Dfr/1OBgjWnQX
	X3XlIzq6+kSc4E+sECLlu/8el/1hmRDcL/6fTIGft8JoqwHe0sF4StnZ15LunxEGxuni9hfqcDitb
	swh51Ik1Bvyxi3elG3tBmFGy48G1fcwlRkdvOxHA2CFdxRsch9edqNzToeCxpah8Dpe/s/u7uF4QV
	7Etyu2QYROwwCGVJQHsCd3t75DmBJT+8j1kNO0VIYIe7jT6Rrqn5LLnceErqfGacrsYQ7MS/Y4dtC
	dP+PAINvYxLUIpP5f6pnTJUSi+la6Ke+GmU25afhbxWU95gs1r0zPfD2xNLQjWWn789UZdc6KkqCG
	BipCOpfiBVJOc6mdrCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkWY-00000008KYH-1cmD;
	Tue, 10 Mar 2026 00:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVzn-00000003tEp-2kun;
	Fri, 06 Mar 2026 14:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17BBE4327E;
	Fri,  6 Mar 2026 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC83C4CEF7;
	Fri,  6 Mar 2026 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806657;
	bh=kDJQMMVjroxoqrKJpgts6ufp43e8NaCEQtf/5Qs5cB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QyTmHOD4CzeDxFBjYfTfC6aL3PiHmprBUm5aDWYj20TxoXCHTJX8pGTIdNei8th5h
	 tvRNSvoY2RpvRn1wE761+UsErbXxvMe0nwGgq4nu2Kwo3msE2iwC9NYuM+gMRydmfa
	 Dy+ac+sBOxKQLGyi72NUoxWG2kAcat6b+aUTOB2pEBeuOstaacg4nHN8PPdxbAft+G
	 eTaUxKsXNioJoJdnZRtzOookjps1JooJOaepfmNUXz08uHBqWqzXFLdzJXzhWRatcv
	 VSEPqivLxU9hODu3+CF/kdtVEHRcgG2my++WMm71t7osmCoBM2JKJjTCv+UoMspcG0
	 zy9nbkCf2BrCg==
Message-ID: <40bd6f9b-d5c0-4844-81bc-d221cd9b058f@kernel.org>
Date: Fri, 6 Mar 2026 15:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/15] set_memory: add folio_{zap, restore}_direct_map
 helpers
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "kernel@xen0n.name" <kernel@xen0n.name>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>,
 "oupton@kernel.org" <oupton@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "seanjc@google.com"
 <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>,
 "surenb@google.com" <surenb@google.com>, "mhocko@suse.com"
 <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org"
 <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me"
 <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>,
 "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com"
 <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
 "shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com"
 <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>,
 "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "prsampat@amd.com" <prsampat@amd.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>,
 "jthoughton@google.com" <jthoughton@google.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "alex@ghiti.fr" <alex@ghiti.fr>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com"
 <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org"
 <pjw@kernel.org>,
 "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com"
 <wyihan@google.com>,
 "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
 "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
 "urezki@gmail.com" <urezki@gmail.com>,
 "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>,
 "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de"
 <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "vannapurve@google.com" <vannapurve@google.com>,
 "jackmanb@google.com" <jackmanb@google.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "patrick.roy@linux.dev" <patrick.roy@linux.dev>,
 "Thomson, Jack" <jackabt@amazon.co.uk>,
 "Itazuri, Takahiro" <itazur@amazon.co.uk>,
 "Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco"
 <xmarcalx@amazon.co.uk>
References: <20260126164445.11867-1-kalyazin@amazon.com>
 <20260126164445.11867-3-kalyazin@amazon.com>
 <af2d4dcd-60a8-4a5a-b508-d9600b1f2275@kernel.org>
 <e2834fd9-e4ec-473c-90cd-6c3a5049747f@amazon.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <e2834fd9-e4ec-473c-90cd-6c3a5049747f@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_061739_761014_8513844D 
X-CRM114-Status: GOOD (  21.04  )
X-Mailman-Approved-At: Mon, 09 Mar 2026 17:00:27 -0700
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

T24gMy82LzI2IDEzOjQ4LCBOaWtpdGEgS2FseWF6aW4gd3JvdGU6Cj4gCj4gCj4gT24gMDUvMDMv
MjAyNiAxNzozNCwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4+IE9uIDEvMjYvMjYg
MTc6NDcsIEthbHlhemluLCBOaWtpdGEgd3JvdGU6Cj4+PiBGcm9tOiBOaWtpdGEgS2FseWF6aW4g
PGthbHlhemluQGFtYXpvbi5jb20+Cj4+Pgo+Pj4gVGhlc2UgYWxsb3cgZ3Vlc3RfbWVtZmQgdG8g
cmVtb3ZlIGl0cyBtZW1vcnkgZnJvbSB0aGUgZGlyZWN0IG1hcC4KPj4+IE9ubHkgaW1wbGVtZW50
IHRoZW0gZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIGRpcmVjdCBtYXAuCj4+PiBJbiBmb2xp
b196YXBfZGlyZWN0X21hcCgpLCBmbHVzaCBUTEIgb24gYXJjaGl0ZWN0dXJlcyB3aGVyZQo+Pj4g
c2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaCgpIGRvZXMgbm90IGZsdXNoIGl0IGludGVybmFs
bHkuCj4+Cj4+ICJMZXQncyBwcm92aWRlIGZvbGlvX3t6YXAscmVzdG9yZX1fZGlyZWN0X21hcCBo
ZWxwZXJzIGFzIHByZXBhcmF0aW9uIGZvcgo+PiBzdXBwb3J0aW5nIHJlbW92YWwgb2YgdGhlIGRp
cmVjdCBtYXAgZm9yIGd1ZXN0X21lbWZkIGZvbGlvcy4gLi4uCj4gCj4gV2lsbCB1cGRhdGUsIHRo
YW5rcy4KPiAKPj4KPj4+Cj4+PiBUaGUgbmV3IGhlbHBlcnMgbmVlZCB0byBiZSBhY2Nlc3NpYmxl
IHRvIEtWTSBvbiBhcmNoaXRlY3R1cmVzIHRoYXQKPj4+IHN1cHBvcnQgZ3Vlc3RfbWVtZmQgKHg4
NiBhbmQgYXJtNjQpLsKgIFNpbmNlIGFybTY0IGRvZXMgbm90IHN1cHBvcnQKPj4+IGJ1aWxkaW5n
IEtWTSBhcyBhIG1vZHVsZSwgb25seSBleHBvcnQgdGhlbSBvbiB4ODYuCj4+Pgo+Pj4gRGlyZWN0
IG1hcCByZW1vdmFsIGdpdmVzIGd1ZXN0X21lbWZkIHRoZSBzYW1lIHByb3RlY3Rpb24gdGhhdAo+
Pj4gbWVtZmRfc2VjcmV0IGRvZXMsIHN1Y2ggYXMgaGFyZGVuaW5nIGFnYWluc3QgU3BlY3RyZS1s
aWtlIGF0dGFja3MKPj4+IHRocm91Z2ggaW4ta2VybmVsIGdhZGdldHMuCj4+Cj4+IFdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIGNvbnZlcnQgbW0vc2VjcmV0bWVtLmMgYXMgd2VsbD8KPj4KPj4gVGhl
cmUsIHdlIHVzZQo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIHNldF9kaXJlY3RfbWFwX2ludmFsaWRf
bm9mbHVzaChmb2xpb19wYWdlKGZvbGlvLCAwKSk7Cj4+Cj4+IGFuZAo+Pgo+PiDCoMKgwqDCoMKg
wqDCoMKgIHNldF9kaXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChmb2xpb19wYWdlKGZvbGlvLCAw
KSk7Cj4+Cj4+IFdoaWNoIGlzIGEgYml0IGRpZmZlcmVudCB0byBiZWxvdyBjb2RlLiBBdCBsZWFz
dCBsb29raW5nIGF0IHRoZSB4ODYKPj4gdmFyaWFudHMsIEkgd29uZGVyIHdoeSB3ZSBkb24ndCBz
aW1wbHkgdXNlCj4+IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goKS4KPj4KPj4KPj4gSWYg
c28sIGNhbiB5b3UgYWRkIGEgcGF0Y2ggdG8gZG8gdGhlIGNvbnZlcnNpb24sIHBsZWVlZWFzc3Nl
ID8gOikKPiAKPiBBYnNvbHV0ZWx5IQo+IAo+Pgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBBY2tlcmxl
eSBUbmcgPGFja2VybGV5dG5nQGdvb2dsZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEg
S2FseWF6aW4gPGthbHlhemluQGFtYXpvbi5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtNjQv
aW5jbHVkZS9hc20vc2V0X21lbW9yeS5owqDCoMKgwqAgfMKgIDIgKysKPj4+IMKgIGFyY2gvYXJt
NjQvbW0vcGFnZWF0dHIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysr
KysrKysrKwo+Pj4gwqAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIHzC
oCAyICsrCj4+PiDCoCBhcmNoL2xvb25nYXJjaC9tbS9wYWdlYXR0ci5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDEyICsrKysrKysrKysrKwo+Pj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
ZXRfbWVtb3J5LmjCoMKgwqDCoCB8wqAgMiArKwo+Pj4gwqAgYXJjaC9yaXNjdi9tbS9wYWdlYXR0
ci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIgKysrKysrKysrKysrCj4+PiDC
oCBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5owqDCoMKgwqDCoCB8wqAgMiArKwo+
Pj4gwqAgYXJjaC9zMzkwL21tL3BhZ2VhdHRyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDEyICsrKysrKysrKysrKwo+Pj4gwqAgYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0X21l
bW9yeS5owqDCoMKgwqDCoMKgIHzCoCAyICsrCj4+PiDCoCBhcmNoL3g4Ni9tbS9wYXQvc2V0X21l
bW9yeS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4+
PiDCoCBpbmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTAgKysrKysrKysrKwo+Pj4gwqAgMTEgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3NldF9tZW1vcnku
aCBiL2FyY2gvYXJtNjQvCj4+PiBpbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4+IGluZGV4IGM3
MWEyYTY4MTJjNC4uNDlmZDU0ZjNjMjY1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9pbmNs
dWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0
X21lbW9yeS5oCj4+PiBAQCAtMTUsNiArMTUsOCBAQCBpbnQgc2V0X2RpcmVjdF9tYXBfaW52YWxp
ZF9ub2ZsdXNoKGNvbnN0IHZvaWQgKmFkZHIpOwo+Pj4gwqAgaW50IHNldF9kaXJlY3RfbWFwX2Rl
ZmF1bHRfbm9mbHVzaChjb25zdCB2b2lkICphZGRyKTsKPj4+IMKgIGludCBzZXRfZGlyZWN0X21h
cF92YWxpZF9ub2ZsdXNoKGNvbnN0IHZvaWQgKmFkZHIsIHVuc2lnbmVkIGxvbmcKPj4+IG51bXBh
Z2VzLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYm9vbCB2YWxpZCk7Cj4+PiAraW50IGZvbGlvX3phcF9kaXJlY3RfbWFw
KHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+Pj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAo
c3RydWN0IGZvbGlvICpmb2xpbyk7Cj4+PiDCoCBib29sIGtlcm5lbF9wYWdlX3ByZXNlbnQoc3Ry
dWN0IHBhZ2UgKnBhZ2UpOwo+Pj4KPj4+IMKgIGludCBzZXRfbWVtb3J5X2VuY3J5cHRlZCh1bnNp
Z25lZCBsb25nIGFkZHIsIGludCBudW1wYWdlcyk7Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9tbS9wYWdlYXR0ci5jIGIvYXJjaC9hcm02NC9tbS9wYWdlYXR0ci5jCj4+PiBpbmRleCBlMmJk
YzNjMWY5OTIuLjBiODhiMDM0NDQ5OSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vcGFn
ZWF0dHIuYwo+Pj4gKysrIGIvYXJjaC9hcm02NC9tbS9wYWdlYXR0ci5jCj4+PiBAQCAtMzU2LDYg
KzM1NiwxOCBAQCBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChjb25zdCB2b2lkCj4+
PiAqYWRkciwgdW5zaWduZWQgbG9uZyBudW1wYWdlcywKPj4+IMKgwqDCoMKgwqDCoCByZXR1cm4g
c2V0X21lbW9yeV92YWxpZCgodW5zaWduZWQgbG9uZylhZGRyLCBudW1wYWdlcywgdmFsaWQpOwo+
Pj4gwqAgfQo+Pj4KPj4+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlvICpm
b2xpbykKPj4+ICt7Cj4+PiArwqDCoMKgwqAgcmV0dXJuIHNldF9kaXJlY3RfbWFwX3ZhbGlkX25v
Zmx1c2goZm9saW9fYWRkcmVzcyhmb2xpbyksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Zm9saW9fbnJfcGFnZXMoZm9saW8pLCBmYWxzZSk7Cj4+PiArfQo+Pj4gKwo+Pj4gK2ludCBmb2xp
b19yZXN0b3JlX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbykKPj4+ICt7Cj4+PiArwqDC
oMKgwqAgcmV0dXJuIHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goZm9saW9fYWRkcmVzcyhm
b2xpbyksCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9saW9fbnJfcGFnZXMoZm9saW8p
LCB0cnVlKTsKPj4+ICt9Cj4+Cj4+IElzIHRoZXJlIGEgZ29vZCByZWFzb24gd2h5IHdlIGNhbm5v
dCBoYXZlIHR3byBnZW5lcmljIGlubGluZSBmdW5jdGlvbnMKPj4gdGhhdCBzaW1wbHkgY2FsbCBz
ZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKCkgPwo+Pgo+PiBJcyBpdCBiZWNhdXNlIG9mIHNv
bWUgZmx1c2hpbmcgYmVoYXZpb3I/ICh3aGljaCB3ZSBjb3VsZCBmaWd1cmUgb3V0KQo+IAo+IFll
cywgb24geDg2IHdlIG5lZWQgYW4gZXhwbGljaXQgZmx1c2guwqAgT3RoZXIgYXJjaGl0ZWN0dXJl
cyBkZWFsIHdpdGggaXQKPiBpbnRlcm5hbGx5LsKgIAoKU28sIHdlIGNhbGwgYSBfbm9mbHVzaCBm
dW5jdGlvbiBhbmQgaXQgcGVyZm9ybXMgYSAuLi4gZmx1c2guIFdoYXQuCgpUYWtlIGEgbG9vayBh
dCBzZWNyZXRtZW1fZmF1bHQoKSwgd2hlcmUgd2UgZG8gYW4gdW5jb25kaXRpb25hbApmbHVzaF90
bGJfa2VybmVsX3JhbmdlKCkuCgpEbyB3ZSBlbmQgdXAgZG91YmxlLWZsdXNoaW5nIGluIHRoYXQg
Y2FzZT8KCj4gRG8geW91IHByb3Bvc2UgYSBiZXNwb2tlIGltcGxlbWVudGF0aW9uIGZvciB4ODYg
YW5kIGEKPiAiZ2VuZXJpYyIgb25lIGZvciBvdGhlcnM/CgpXZSBoYXZlIHRvIGZpbmQgYSB3YXkg
dG8gaGF2ZSBhIHNpbmdsZSBzZXQgb2YgZnVuY3Rpb25zIGZvciBhbGwgYXJjaHMKdGhhdCBzdXBw
b3J0IGRpcmVjdG1hcCByZW1vdmFsLgoKT25lIG9wdGlvbiBtaWdodCBiZSB0byBoYXZlIHNvbWUg
aW5kaWNhdGlvbiBmcm9tIHRoZSBhcmNoaXRlY3R1cmUgdGhhdApubyBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKCkgaXMgcmVxdWlyZWQuCgpDb3VsZCBiZSBhIGNvbmZpZyBvcHRpb24gb3Igc29tZSBz
aW1wbGUgaGVscGVyIGZ1bmN0aW9uLgoKLS0gCkNoZWVycywKCkRhdmlkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
