Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80193D4116C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCOL+6ZF76HfemY9ZB10b9IcmSTD6HHAqWeA/3HME0A=; b=wBHUHCTtpF/ndS
	B/OLGaytrl13oSsy6zFXrnKwiVMmaCConDpXRxB1ptgmSDVGu3oGQJKFYRAf/yMWyryLzuiu6+dHn
	8LbiWUT81+y/p62YKoG8kPe3O8UD8B/a+w4wHDT3EEH3nNFsfdLUzwcFENMUVWMqZkUVMhqbv8gFX
	i0wmtYsl4Ma4bAtjy4Q1PHNtDsB3fLlweewIT4w8UodQTbE4oO9yE5gi1mu1ywETfyF3/xRy+kIhO
	YEZNpw18y4RFKgt9PQplnP268p+sWgRCidGWj+yhPIQx6F+k6QH5zHuN7Zn2qUlFfnDio9ioyQ3l7
	IMYK+qhFFmYG6NJev4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKzy-0000000CBJR-3caY;
	Thu, 15 Jan 2026 10:54:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKzw-0000000CBIh-0gOi
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 10:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F92A44582
	for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 10:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22AEC2BCB9
	for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768474478;
	bh=/1KAtvLvvLMpDi9CfvfFJ6x5SY4Jp+t4QyV0IUSlh0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QKNzmbfk137GH9cQf861KFuI/s73C1BD2S3Hmbu7L4olXN8PPEoplOGPC3Dn+Fghq
	 d7NNig4oWCpOSIeBtNStaJwz3bg7aVQZat7qFuMIPU0kjjV1Zxa7gbFsWnix0oDnv7
	 ZRKHmxfl/AQ8POyX8V98RhNoPE/yFC0oqIg1E0MtXDoMOAKelQtsVvb3FGZixoZivK
	 Rp7oq4fmbL4nC88WdaO1cINXanI8SNdp86XjdW3uyKEa9nEnZpVBxgV/GT7DBxWNJz
	 MGAMiMltUcK9PHqa/Jgmr9mFgqF0Q1rQRYaIL9ClhIG7TJqwK/Gl5opvhFbV6wah/U
	 wsGtLw2eFS8rQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso1046680a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 02:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9EcC/9QGMo45FLMV7u7Qj6XAIlYCQ1GrRi6tEPWXYwnFWWSMAtD2eQBYKuskLlxfHX/7wQZCOAx7i0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwL4n6HIm4FcaIFtozXh8xE3XjXo/5CYhTDe7Rc9uSxbYQSHoVV
	XbNfa2FfLDYTq7neQoM9ABa5o3Fy3ahHyU0Y+VBHBAk4IuTrv97sy13NwkU6rvvoInxoQ1/D0nU
	Yaqbl3r8c0eikbkGHFgAYbgy9as/l7T8=
X-Received: by 2002:a17:907:742:b0:b80:4103:537e with SMTP id
 a640c23a62f3a-b87614066e3mr530726366b.53.1768474476869; Thu, 15 Jan 2026
 02:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-2-kalyazin@amazon.com>
In-Reply-To: <20260114134510.1835-2-kalyazin@amazon.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 15 Jan 2026 18:54:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6S4bVdpwbER84-iwSE+bQrFu_gF=Ww-bCFxThJ7WiUwQ@mail.gmail.com>
X-Gm-Features: AZwV_QhNEeWPSp4pau3pJiv_muGT_zHnXI7A5fP4Fz_wHAvUMBfJQxrRqBdZrqI
Message-ID: <CAAhV-H6S4bVdpwbER84-iwSE+bQrFu_gF=Ww-bCFxThJ7WiUwQ@mail.gmail.com>
Subject: Re: [PATCH v9 01/13] set_memory: add folio_{zap,restore}_direct_map helpers
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_025440_261668_E4B51FFA 
X-CRM114-Status: GOOD (  22.03  )
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

SGksIE5pa2l0YSwKCk9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDk6NDXigK9QTSBLYWx5YXppbiwg
TmlraXRhIDxrYWx5YXppbkBhbWF6b24uY28udWs+IHdyb3RlOgo+Cj4gRnJvbTogTmlraXRhIEth
bHlhemluIDxrYWx5YXppbkBhbWF6b24uY29tPgo+Cj4gVGhlc2UgYWxsb3cgZ3Vlc3RfbWVtZmQg
dG8gcmVtb3ZlIGl0cyBtZW1vcnkgZnJvbSB0aGUgZGlyZWN0IG1hcC4KPiBPbmx5IGltcGxlbWVu
dCB0aGVtIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgaGF2ZSBkaXJlY3QgbWFwLgo+IEluIGZvbGlv
X3phcF9kaXJlY3RfbWFwKCksIGZsdXNoIFRMQiBvbiBhcmNoaXRlY3R1cmVzIHdoZXJlCj4gc2V0
X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaCgpIGRvZXMgbm90IGZsdXNoIGl0IGludGVybmFsbHku
Cj4KPiBUaGUgbmV3IGhlbHBlcnMgbmVlZCB0byBiZSBhY2Nlc3NpYmxlIHRvIEtWTSBvbiBhcmNo
aXRlY3R1cmVzIHRoYXQKPiBzdXBwb3J0IGd1ZXN0X21lbWZkICh4ODYgYW5kIGFybTY0KS4gIFNp
bmNlIGFybTY0IGRvZXMgbm90IHN1cHBvcnQKPiBidWlsZGluZyBLVk0gYXMgYSBtb2R1bGUsIG9u
bHkgZXhwb3J0IHRoZW0gb24geDg2Lgo+Cj4gRGlyZWN0IG1hcCByZW1vdmFsIGdpdmVzIGd1ZXN0
X21lbWZkIHRoZSBzYW1lIHByb3RlY3Rpb24gdGhhdAo+IG1lbWZkX3NlY3JldCBkb2VzLCBzdWNo
IGFzIGhhcmRlbmluZyBhZ2FpbnN0IFNwZWN0cmUtbGlrZSBhdHRhY2tzCj4gdGhyb3VnaCBpbi1r
ZXJuZWwgZ2FkZ2V0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBLYWx5YXppbiA8a2FseWF6
aW5AYW1hem9uLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5
LmggICAgIHwgIDIgKysKPiAgYXJjaC9hcm02NC9tbS9wYWdlYXR0ci5jICAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKysrKysrCj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3NldF9tZW1v
cnkuaCB8ICAyICsrCj4gIGFyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMgICAgICAgICAgICB8
IDE2ICsrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5
LmggICAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9tbS9wYWdlYXR0ci5jICAgICAgICAgICAgICAg
IHwgMTYgKysrKysrKysrKysrKysrKwo+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0X21lbW9y
eS5oICAgICAgfCAgMiArKwo+ICBhcmNoL3MzOTAvbW0vcGFnZWF0dHIuYyAgICAgICAgICAgICAg
ICAgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0X21l
bW9yeS5oICAgICAgIHwgIDIgKysKPiAgYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYyAgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9zZXRfbWVt
b3J5LmggICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAx
MDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
c2V0X21lbW9yeS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPiBpbmRl
eCA5MGY2MWIxNzI3NWUuLmQ5NDlmMWRlYjcwMSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0
X21lbW9yeS5oCj4gQEAgLTE0LDYgKzE0LDggQEAgaW50IHNldF9tZW1vcnlfdmFsaWQodW5zaWdu
ZWQgbG9uZyBhZGRyLCBpbnQgbnVtcGFnZXMsIGludCBlbmFibGUpOwo+ICBpbnQgc2V0X2RpcmVj
dF9tYXBfaW52YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlKTsKPiAgaW50IHNldF9kaXJl
Y3RfbWFwX2RlZmF1bHRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gIGludCBzZXRfZGly
ZWN0X21hcF92YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBuciwgYm9v
bCB2YWxpZCk7Cj4gK2ludCBmb2xpb196YXBfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlv
KTsKPiAraW50IGZvbGlvX3Jlc3RvcmVfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKTsK
PiAgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVjdCBwYWdlICpwYWdlKTsKPgo+ICBpbnQg
c2V0X21lbW9yeV9lbmNyeXB0ZWQodW5zaWduZWQgbG9uZyBhZGRyLCBpbnQgbnVtcGFnZXMpOwo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMgYi9hcmNoL2FybTY0L21tL3Bh
Z2VhdHRyLmMKPiBpbmRleCBmMGU3ODRiOTYzZTYuLmE5NGVmZjMyNGRkYSAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMKPiArKysgYi9hcmNoL2FybTY0L21tL3BhZ2VhdHRy
LmMKPiBAQCAtMzU3LDYgKzM1NywxOCBAQCBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVz
aChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbnIsIGJvb2wgdmFsaWQpCj4gICAgICAgICBy
ZXR1cm4gc2V0X21lbW9yeV92YWxpZChhZGRyLCBuciwgdmFsaWQpOwo+ICB9Cj4KPiAraW50IGZv
bGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4gK3sKPiArICAgICAgIHJl
dHVybiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDApLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fbnJfcGFn
ZXMoZm9saW8pLCBmYWxzZSk7Cj4gK30KPiArCj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9t
YXAoc3RydWN0IGZvbGlvICpmb2xpbykKPiArewo+ICsgICAgICAgcmV0dXJuIHNldF9kaXJlY3Rf
bWFwX3ZhbGlkX25vZmx1c2goZm9saW9fcGFnZShmb2xpbywgMCksCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIHRydWUp
Owo+ICt9Cj4gKwo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX1BBR0VBTExPQwo+ICAvKgo+ICAgKiBU
aGlzIGlzIC0gYXBhcnQgZnJvbSB0aGUgcmV0dXJuIHZhbHVlIC0gZG9pbmcgdGhlIHNhbWUKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIGIvYXJj
aC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4gaW5kZXggNTVkZmFlZmQwMmM4
Li45YmM4MGFjNDIwYTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20v
c2V0X21lbW9yeS5oCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9y
eS5oCj4gQEAgLTE4LDUgKzE4LDcgQEAgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVjdCBw
YWdlICpwYWdlKTsKPiAgaW50IHNldF9kaXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChzdHJ1Y3Qg
cGFnZSAqcGFnZSk7Cj4gIGludCBzZXRfZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2goc3RydWN0
IHBhZ2UgKnBhZ2UpOwo+ICBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChzdHJ1Y3Qg
cGFnZSAqcGFnZSwgdW5zaWduZWQgbnIsIGJvb2wgdmFsaWQpOwo+ICtpbnQgZm9saW9femFwX2Rp
cmVjdF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbyk7Cj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVj
dF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbyk7Cj4KPiAgI2VuZGlmIC8qIF9BU01fTE9PTkdBUkNI
X1NFVF9NRU1PUllfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9tbS9wYWdlYXR0
ci5jIGIvYXJjaC9sb29uZ2FyY2gvbW0vcGFnZWF0dHIuYwo+IGluZGV4IGY1ZTkxMGI2ODIyOS4u
MTRiZDMyMmRkMTEyIDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMK
PiArKysgYi9hcmNoL2xvb25nYXJjaC9tbS9wYWdlYXR0ci5jCj4gQEAgLTIzNiwzICsyMzYsMTkg
QEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVu
c2lnbmVkIG5yLCBib29sIHZhbGlkKQo+Cj4gICAgICAgICByZXR1cm4gX19zZXRfbWVtb3J5KGFk
ZHIsIDEsIHNldCwgY2xlYXIpOwo+ICB9Cj4gKwo+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAo
c3RydWN0IGZvbGlvICpmb2xpbykKPiArewo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAg
ICByZXQgPSBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDAp
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9w
YWdlcyhmb2xpbyksIGZhbHNlKTsKPiArCj4gKyAgICAgICByZXR1cm4gcmV0OwpXaHkgbm90IHVz
ZSBhIHNpbmdsZSBzdGF0ZW1lbnQgd2hpY2ggaXMgdGhlIHNhbWUgYXMgdGhlIEFSTTY0IHZlcnNp
b24/ClRoZSBSSVNDViB2ZXJzaW9uIGhhcyB0aGUgc2FtZSBwcm9ibGVtLgoKSHVhY2FpCgo+ICt9
Cj4gKwo+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8p
Cj4gK3sKPiArICAgICAgIHJldHVybiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlv
X3BhZ2UoZm9saW8sIDApLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCB0cnVlKTsKPiArfQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2V0X21lbW9yeS5oCj4gaW5kZXggODczODllOTMzMjVhLi4xNjU1N2I3MGM4MzAgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+IEBAIC00Myw2ICs0Myw4IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHNldF9rZXJuZWxfbWVtb3J5KGNoYXIgKnN0YXJ0cCwgY2hhciAqZW5kcCwK
PiAgaW50IHNldF9kaXJlY3RfbWFwX2ludmFsaWRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7
Cj4gIGludCBzZXRfZGlyZWN0X21hcF9kZWZhdWx0X25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2Up
Owo+ICBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSwg
dW5zaWduZWQgbnIsIGJvb2wgdmFsaWQpOwo+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAoc3Ry
dWN0IGZvbGlvICpmb2xpbyk7Cj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAoc3RydWN0
IGZvbGlvICpmb2xpbyk7Cj4gIGJvb2wga2VybmVsX3BhZ2VfcHJlc2VudChzdHJ1Y3QgcGFnZSAq
cGFnZSk7Cj4KPiAgI2VuZGlmIC8qIF9fQVNTRU1CTEVSX18gKi8KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9wYWdlYXR0ci5jIGIvYXJjaC9yaXNjdi9tbS9wYWdlYXR0ci5jCj4gaW5kZXgg
M2Y3NmRiM2QyNzY5Li4yYzIxODg2ODExNGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9w
YWdlYXR0ci5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9wYWdlYXR0ci5jCj4gQEAgLTQwMSw2ICs0
MDEsMjIgQEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBh
Z2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKQo+ICAgICAgICAgcmV0dXJuIF9fc2V0X21lbW9y
eSgodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSksIG5yLCBzZXQsIGNsZWFyKTsKPiAg
fQo+Cj4gK2ludCBmb2xpb196YXBfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ICt7
Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIHJldCA9IHNldF9kaXJlY3RfbWFwX3Zh
bGlkX25vZmx1c2goZm9saW9fcGFnZShmb2xpbywgMCksCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX25yX3BhZ2VzKGZvbGlvKSwgZmFsc2UpOwo+ICsK
PiArICAgICAgIHJldHVybiByZXQ7Cj4gK30KPiArCj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVj
dF9tYXAoc3RydWN0IGZvbGlvICpmb2xpbykKPiArewo+ICsgICAgICAgcmV0dXJuIHNldF9kaXJl
Y3RfbWFwX3ZhbGlkX25vZmx1c2goZm9saW9fcGFnZShmb2xpbywgMCksCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIHRy
dWUpOwo+ICt9Cj4gKwo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX1BBR0VBTExPQwo+ICBzdGF0aWMg
aW50IGRlYnVnX3BhZ2VhbGxvY19zZXRfcGFnZShwdGVfdCAqcHRlLCB1bnNpZ25lZCBsb25nIGFk
ZHIsIHZvaWQgKmRhdGEpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNt
L3NldF9tZW1vcnkuaCBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPiBpbmRl
eCA5NDA5MmY0YWU3NjQuLmZjNzM2NTJlNTcxNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAvaW5j
bHVkZS9hc20vc2V0X21lbW9yeS5oCj4gKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3NldF9t
ZW1vcnkuaAo+IEBAIC02Myw2ICs2Myw4IEBAIF9fU0VUX01FTU9SWV9GVU5DKHNldF9tZW1vcnlf
NGssIFNFVF9NRU1PUllfNEspCj4gIGludCBzZXRfZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2go
c3RydWN0IHBhZ2UgKnBhZ2UpOwo+ICBpbnQgc2V0X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2ZsdXNo
KHN0cnVjdCBwYWdlICpwYWdlKTsKPiAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2go
c3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKTsKPiAraW50IGZvbGlv
X3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+ICtpbnQgZm9saW9fcmVzdG9y
ZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+ICBib29sIGtlcm5lbF9wYWdlX3By
ZXNlbnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNo
L3MzOTAvbW0vcGFnZWF0dHIuYyBiL2FyY2gvczM5MC9tbS9wYWdlYXR0ci5jCj4gaW5kZXggZDNj
ZTA0YTRiMjQ4Li5kZjRhNDg3YjQ4NGQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL21tL3BhZ2Vh
dHRyLmMKPiArKysgYi9hcmNoL3MzOTAvbW0vcGFnZWF0dHIuYwo+IEBAIC00MTIsNiArNDEyLDI0
IEBAIGludCBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlLCB1
bnNpZ25lZCBuciwgYm9vbCB2YWxpZCkKPiAgICAgICAgIHJldHVybiBfX3NldF9tZW1vcnkoKHVu
c2lnbmVkIGxvbmcpcGFnZV90b192aXJ0KHBhZ2UpLCBuciwgZmxhZ3MpOwo+ICB9Cj4KPiAraW50
IGZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4gK3sKPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKWZvbGlvX2FkZHJlc3MoZm9saW8p
Owo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICByZXQgPSBzZXRfZGlyZWN0X21hcF92
YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDApLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIGZhbHNlKTsKPiAr
ICAgICAgIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UoYWRkciwgYWRkciArIGZvbGlvX3NpemUoZm9s
aW8pKTsKPiArCj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtpbnQgZm9saW9fcmVz
dG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4gK3sKPiArICAgICAgIHJldHVy
biBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDApLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fbnJfcGFnZXMo
Zm9saW8pLCB0cnVlKTsKPiArfQo+ICsKPiAgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVj
dCBwYWdlICpwYWdlKQo+ICB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7Cj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaCBiL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3NldF9tZW1vcnkuaAo+IGluZGV4IDYxZjU2Y2RhY2NiNS4uNzIwOGFmNjA5MTIxIDEw
MDY0NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+ICsrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+IEBAIC05MCw2ICs5MCw4IEBAIGludCBz
ZXRfcGFnZXNfcncoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBudW1wYWdlcyk7Cj4gIGludCBzZXRf
ZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UpOwo+ICBpbnQgc2V0
X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlKTsKPiAgaW50IHNl
dF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5y
LCBib29sIHZhbGlkKTsKPiAraW50IGZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAq
Zm9saW8pOwo+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9s
aW8pOwo+ICBib29sIGtlcm5lbF9wYWdlX3ByZXNlbnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Cj4g
IGV4dGVybiBpbnQga2VybmVsX3NldF90b19yZWFkb25seTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvbW0vcGF0L3NldF9tZW1vcnkuYyBiL2FyY2gveDg2L21tL3BhdC9zZXRfbWVtb3J5LmMKPiBp
bmRleCA2YzZlYjQ4NmY3YTYuLjNmMGZjMzBlYjMyMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9t
bS9wYXQvc2V0X21lbW9yeS5jCj4gKysrIGIvYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYwo+
IEBAIC0yNjU2LDYgKzI2NTYsMjYgQEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2go
c3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKQo+ICAgICAgICAgcmV0
dXJuIF9fc2V0X3BhZ2VzX25wKHBhZ2UsIG5yKTsKPiAgfQo+Cj4gK2ludCBmb2xpb196YXBfZGly
ZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IGFkZHIgPSAodW5zaWduZWQgbG9uZylmb2xpb19hZGRyZXNzKGZvbGlvKTsKPiArICAgICAgIGlu
dCByZXQ7Cj4gKwo+ICsgICAgICAgcmV0ID0gc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChm
b2xpb19wYWdlKGZvbGlvLCAwKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCBmYWxzZSk7Cj4gKyAgICAgICBmbHVzaF90
bGJfa2VybmVsX3JhbmdlKGFkZHIsIGFkZHIgKyBmb2xpb19zaXplKGZvbGlvKSk7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIHJldDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0ZPUl9NT0RVTEVTKGZvbGlv
X3phcF9kaXJlY3RfbWFwLCAia3ZtIik7Cj4gKwo+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3Rf
bWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4gK3sKPiArICAgICAgIHJldHVybiBzZXRfZGlyZWN0
X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDApLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCB0cnVl
KTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0ZPUl9NT0RVTEVTKGZvbGlvX3Jlc3RvcmVfZGlyZWN0
X21hcCwgImt2bSIpOwo+ICsKPiAgI2lmZGVmIENPTkZJR19ERUJVR19QQUdFQUxMT0MKPiAgdm9p
ZCBfX2tlcm5lbF9tYXBfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBudW1wYWdlcywgaW50
IGVuYWJsZSkKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaCBi
L2luY2x1ZGUvbGludXgvc2V0X21lbW9yeS5oCj4gaW5kZXggMzAzMGQ5MjQ1ZjVhLi44ZDFjOGE3
ZjdkNzkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zZXRfbWVtb3J5LmgKPiArKysgYi9p
bmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaAo+IEBAIC00MCw2ICs0MCwxNiBAQCBzdGF0aWMgaW5s
aW5lIGludCBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlLAo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIGludCBmb2xpb196YXBf
ZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsK
PiArfQo+ICsKPiArc3RhdGljIGlubGluZSBpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0
cnVjdCBmb2xpbyAqZm9saW8pCj4gK3sKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgaW5saW5lIGJvb2wga2VybmVsX3BhZ2VfcHJlc2VudChzdHJ1Y3QgcGFnZSAqcGFnZSkK
PiAgewo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gLS0KPiAyLjUwLjEKPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
