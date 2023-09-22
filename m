Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C22DE7D0D2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfV5ccgLVE05undl6mv5UfWVZid9w0CDR/0i0z9n57Y=; b=NkEQJ6JECWwmbx
	B9h83UgHWziN4ZZ9j2M9lrZXLPmpxXgtRklRkB7WO2WevdEp6hx4PiaUCb+Lmd+T2JHI7KD9yLSnM
	elZFLxudw/usvEaIJGUiIXDvsY7KDDAAUUHMBRcw0w9Bq6xU0qkY9n/SY8BL0VmwdIDHYFHFYyOn6
	AjFZRZLFn+BvSIv2jjJMVPO4eI3o7/2tgd4cAjafLzLG42ByBqCG9NDP5WYep34FJ/t3YluOHMTNK
	uIUsUqUGv89EQYfBBmdu8yuzK9KRthlv/SG0MnpyudtqvAS/ExGOG2F40pnk0qYq/Pv38K1buBuag
	RrV8FKzd39nSuQjSdI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaS4-0089mM-08;
	Fri, 22 Sep 2023 07:19:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaRz-0089jC-1X;
	Fri, 22 Sep 2023 07:19:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E51DA7;
	Fri, 22 Sep 2023 00:20:07 -0700 (PDT)
Received: from [192.168.68.106] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BBC3F5A1;
	Fri, 22 Sep 2023 00:19:20 -0700 (PDT)
Message-ID: <f6ad20a0-2f3f-414a-845a-948f6d06aaf3@arm.com>
Date: Fri, 22 Sep 2023 08:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <9864a7eb-004d-14c6-c2bd-bb9333fe67be@csgroup.eu>
 <0958d813-15f8-5ed5-1e20-08b8feb465ad@csgroup.eu>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <0958d813-15f8-5ed5-1e20-08b8feb465ad@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_001943_799695_2DF1DF2F 
X-CRM114-Status: GOOD (  17.35  )
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

T24gMjIvMDkvMjAyMyAwNzo0NCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAy
MS8wOS8yMDIzIMOgIDIwOjQzLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4+Cj4+Cj4+
IExlIDIxLzA5LzIwMjMgw6AgMTg6MjAsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOgo+Pj4gSW4g
b3JkZXIgdG8gZml4IGEgYnVnLCBhcm02NCBuZWVkcyBhY2Nlc3MgdG8gdGhlIHZtYSBpbnNpZGUg
aXQncwo+Pj4gaW1wbGVtZW50YXRpb24gb2Ygc2V0X2h1Z2VfcHRlX2F0KCkuIFByb3ZpZGUgZm9y
IHRoaXMgYnkgY29udmVydGluZyB0aGUKPj4+IG1tIHBhcmFtZXRlciB0byBiZSBhIHZtYS4gQW55
IGltcGxlbWVudGF0aW9ucyB0aGF0IHJlcXVpcmUgdGhlIG1tIGNhbgo+Pj4gYWNjZXNzIGl0IHZp
YSB2bWEtPnZtX21tLgo+Pj4KPj4+IFRoaXMgY29tbWl0IG1ha2VzIHRoZSByZXF1aXJlZCBwb3dl
cnBjIG1vZGlmaWNhdGlvbnMuIFNlcGFyYXRlIGNvbW1pdHMKPj4+IHVwZGF0ZSB0aGUgb3RoZXIg
YXJjaGVzIGFuZCBjb3JlIGNvZGUsIGJlZm9yZSB0aGUgYWN0dWFsIGJ1ZyBpcyBmaXhlZCBpbgo+
Pj4gYXJtNjQuCj4+Pgo+Pj4gTm8gYmVoYXZpb3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+Pgo+PiBU
aGlzIHBhdGNoIGRvZXNuJ3QgYnVpbGQsIGFsbHRob3VnaCBJIGhhdmUgYWxzbyBhcHBsaWVkIHBh
dGNoIDEuIElzCj4+IHNvbWV0aGluZyBtaXNzaW5nID8KPj4KPj4gICAgIENBTEwgICAgc2NyaXB0
cy9jaGVja3N5c2NhbGxzLnNoCj4+ICAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0
dXAtY29tbW9uLm8KPj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvcG93ZXJwYy9rZXJuZWwv
c2V0dXAtY29tbW9uLmM6Mzc6Cj4+IC4vaW5jbHVkZS9saW51eC9odWdldGxiLmg6IEluIGZ1bmN0
aW9uICdodWdlX3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0JzoKPj4gLi9pbmNsdWRlL2xpbnV4L2h1
Z2V0bGIuaDo5ODc6Mjg6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2YKPj4gJ3NldF9odWdl
X3B0ZV9hdCcgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlCj4+IFstV2Vycm9yPWluY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+PiAgICAgOTg3IHwgICAgICAgICBzZXRfaHVnZV9wdGVf
YXQodm1hLT52bV9tbSwgYWRkciwgcHRlcCwgcHRlKTsKPj4gICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIH5+fl5+fn5+fn4KPj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBt
bV9zdHJ1Y3QgKgo+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vaHVnZXRsYi5oOjEzLAo+PiAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvaHVnZXRsYi5oOjgxNToKPj4gLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
LzMyL2h1Z2V0bGItOHh4Lmg6NDk6NDU6IG5vdGU6IGV4cGVjdGVkCj4+ICdzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ3N0cnVjdCBtbV9zdHJ1Y3QgKicK
Pj4gICAgICA0OSB8IHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nCj4+IGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpOwo+PiAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efn4K
Pj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPj4gbWFrZVs0XTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0MzoKPiAKPiBPaCwgSSByZWFsaXNlZCB0aGF0
IGl0IHJlcXVpcmVzIHBhdGNoIDYgdG8gYnVpbGQgcHJvcGVybHkuIFRoaXMgaXMgbm90IAo+IGdv
b2QuIFlvdXIgc2VyaWVzIHNob3VsZCBiZSBiaXNlY3RhYmxlLCB0aGF0IG1lYW5zIGl0IG11c3Qg
YnVpbGQgYW5kIHJ1biAKPiBzdWNjZXNzZnVsbHkgYWZ0ZXIgZWFjaCBwYXRjaC4gVGhlcmVmb3Jl
IHlvdSBoYXZlIHRvIHNxdWFzaCBwYXRjaGVzIDEgdG8gCj4gNyBhbGwgdG9nZXRoZXJzLgoKWWVh
aCBteSBiYWQgLSBzb3JyeSBhYm91dCB0aGF0LiBJIHRob3VnaHQgaXQgd291bGQgYmUgYmV0dGVy
IHRvIHNlcGFyYXRlIHRoZQpjaGFuZ2VzIGZvciBlYWNoIGFyY2guIEJ1dCBhcyBhbHJlYWR5IHN1
Z2dlc3RlZCBieSBBbmRyZXcgYW5kIENhdGFsaW4sIEknbGwKc3F1YXNoIHRoZSBmaXJzdCA3IHBh
dGNoZXMgaW50byAxIGZvciB2Mi4KCj4gCj4gSSdsbCBzZW5kIHlvdSBjb21tZW50cyBvbiB0aGUg
cG93ZXJwYyBwYXJ0IGluIGFub3RoZXIgbWFpbC4KPiAKPiBDaHJpc3RvcGhlCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
