Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C067606A329
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 03:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=152mDNIs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ut0sE6eg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HYhK2l4kbsRQf9S1D2667S3FlxoVHhR+6JsVUW0lGdA=; b=152mDNIsIhC/HkD1X8LibiXykS
	Y6NDcRoz5n8KmSZxsBCE+io8zXc1qTz/k47O2pKxxz3tpyFgA8vwYZQW3CQdhnLxQLAU38FMVORdo
	SPgtDcd9o8F/WcJKHJjBy4O1ypkIXeoTmqwBFejr0V9fnzPU0i73RlgCZO6r3g9/NrO7LpLJlmbuq
	ResHBkbAPOnTjFO78q/OIss61EneN97f7NNLu2Os8BEvdZYzRHZvYR7hWkKwnGMMMv8YbGYlF8euN
	rrm/KcSpHzn6gXRJhHcrA4TxhQF63KKMGlaBLMmRZhU9MAMbiSCTNXU9J8uZ3QcwUbV+nvUXYTW2B
	BYKGg2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoQO-00000007hOH-0neQ;
	Thu, 05 Nov 2026 03:46:04 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoQ9-00000007hLE-0QhP;
	Thu, 05 Nov 2026 03:45:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GHOzVgulqKSfBQS9r6LRjSpjMDUMY+tUmJ+96qhsSy0=;
	b=ut0sE6egSZYUWUEq0ClSmzZTO7nviP+RJ1qKMQYtk/w+rqWB0B+QNfbvGcaSu1w+C95A9M4jR
	jBbT1bl9PPkcxLRad2RsaYHl//ou1/Yel8XR6hmSDqoHQh56hAGw3vfWl4cxnST7B4lX5jEBpT2
	H+1ERGzJ4QEMZQBJPJYiUFU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jKp9s00tGz1prRL;
	Thu,  5 Nov 2026 11:45:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 084FD2011D;
	Thu,  5 Nov 2026 11:45:42 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 11:45:39 +0800
Message-ID: <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
Date: Thu, 5 Nov 2026 11:45:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
To: Mike Rapoport <rppt@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<thuth@redhat.com>, <leitao@debian.org>, <yeoreum.yun@arm.com>,
	<robh@kernel.org>, <sourabhjain@linux.ibm.com>, <kees@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <tangyouling@kylinos.cn>,
	<maqianga@uniontech.com>, <zhangtianyang@loongson.cn>,
	<guodongtai@kylinos.cn>, <blum@kernel.org>, <adityag@linux.ibm.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <kai.huang@intel.com>, <kas@kernel.org>,
	<vishal.l.verma@intel.com>, <piliu@redhat.com>, <jbouron@amazon.com>,
	<mclapinski@google.com>, <me@linux.beauty>, <graf@amazon.com>,
	<bgwin@google.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <179380419709.28814.2122135856184991710.b4-review@b4>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <179380419709.28814.2122135856184991710.b4-review@b4>
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_194549_441896_0F93B7CA 
X-CRM114-Status: GOOD (  19.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMS80IDIyOjU2LCBNaWtlIFJhcG9wb3J0IOWGmemBkzoKPiBIaSBKaW5qaWUs
Cj4gCgpIaSBNaWtlLAoKPj4gQVJNNjQsIExvb25nQXJjaCBhbmQgUklTQy1WIGxvYWQgdGhlIGVs
ZiBjb3JlIGhlYWRlciwgaW5pdHJkLCBEVEIKPj4gYW5kIGNtZGxpbmUgcGFyYW1ldGVycyB3aXRo
IGFsbW9zdCBpZGVudGljYWwgY29kZS4gVGhpcyBzZXJpZXMgZml4ZXMKPj4gdGhlIGJ1Z3MgaW4g
dGhhdCBwYXRoLiBBbmQgYXMgTWlrZSBzdWdnZXN0ZWQsIHJld29yayB0aGUgY29tbW9uIHBhcnQK
Pj4gaW50byBhIGhlbHBlci4KPj4KPj4gUGF0Y2ggMSBzdG9wcyB1c2luZyB0aGUgSW1hZ2UgdGV4
dF9vZmZzZXQgZm9yIGFybTY0LCB3aGljaCBicmVha3MgQ01BCj4+IHNlZ21lbnRzIGluIGJvdGgg
dGhlIGxvYWQgYW5kIHJlbGVhc2UgcGF0aHMsIGFuZCByZWplY3RzIGltYWdlcyB3aXRoCj4+IGEg
bm9uLXplcm8gdmFsdWUuCj4+Cj4+IFBhdGNoZXMgMi03IGZpeCB0aGUgQ01BIHBhZ2UgYW5kIGVs
ZiBjb3JlIGhlYWRlciBsZWFrcyBpbiB0aGUgcmV0cnkKPj4gbG9vcHMgaW4gYXJtNjQgYW5kIExv
b25nQXJjaCwgYWxzbyBmaXggYSBtb2RpZmllZF9jbWRsaW5lIGxlYWsKPj4gaW4gTG9vbmdBcmNo
Lgo+IAo+IFRoZXNlIG1peCBmaXhlcyB0aGF0IGNhbiBiZSBlYXNpbHkgbWVyZ2VkIHZpYSBhcmNo
IHRyZWVzIGFuZCBzb21ldGhpbmcKPiB0aGF0IGRlcGVuZHMgb24gYSBjaGFuZ2UgdG8gdGhlIGdl
bmVyaWMga2V4ZWMgY29kZS4KClRoYW5rIHlvdSEgSSB3aWxsIHNwbGl0IHRoZW0gdG8gc2VuZCBp
biB2OC4KCj4gCj4gQmVzaWRlcywgZWxmX2hlYWRlcnMgbGVhayBhbmQgYXJtNjQncyB0ZXh0X29m
ZnNldCBmaXhlcyBzaG91bGQgYmUKPiBhcHBsaWVkIHRvIG1vc3QgaWYgbm90IGFsbCBzdGFibGUg
a2VybmVscywgd2hpbGUgQ01BIGZpeGVzIGFyZSBvbmx5IGZvcgo+IHRoZSByZWxhdGl2ZWx5IG5l
dyBrZXJuZWxzLgoKWW91IGFyZSByaWdodC4gYXJtNjQgdGV4dF9vZmZzZXQgZml4IGludm9sdmVz
IG1hbnkgdmVyc2lvbnMuCgpJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgdGhlIENNQSBwYXRjaCB0
aGF0IHdhcyBmaXhlZCB3YXMgb25seSBtZXJnZWQKdGhpcyB5ZWFyLgoKPiAKPiBJJ2Qgc3VnZ2Vz
dCBzcGxpdHRpbmcKPiAKPiAJYXJtNjQ6IGtleGVjX2ZpbGU6IFN0b3AgdXNpbmcgdGhlIEltYWdl
IHRleHRfb2Zmc2V0Cj4gCWFybTY0OiBrZXhlY19maWxlOiBGaXggZWxmX2hlYWRlcnMgbWVtb3J5
IGxlYWsgaW4gcmV0cnkgbG9vcAo+IAo+IGFuZCBzZW5kaW5nIGFzIHB1cmUgYXJtNjQgbWF0ZXJp
YWwsIGFuZAo+IAo+IAo+IAlMb29uZ0FyY2g6IGtleGVjX2ZpbGU6IEZpeCBlbGZfaGVhZGVycyBt
ZW1vcnkgbGVhayBpbiByZXRyeSBsb29wCj4gCUxvb25nQXJjaDoga2V4ZWNfZmlsZTogRml4IGEg
bW9kaWZpZWRfY21kbGluZSBsZWFrCj4gCj4gYXMgcHVyZSBMb29uZ0FyY2ggbWF0ZXJpYWwuCj4g
Cj4gQW5kIHRoZW4gd29ya2luZyBvbiBDTUEgZml4ZXMgYWZ0ZXIgdGhlc2UgbGFuZC4KCgpJIGFn
cmVlIHdpdGggZG9pbmcgdGhpczsgdGhlIHBhdGNoIHdpbGwgYmUgY2xlYW5lciBhbmQgd29uJ3Qg
bWl4CmRpZmZlcmVudCBhcmNoaXRlY3R1cmVzIHdpdGggY29tbW9uIGNvZGUuCgo+IAo+IElmIHRo
ZXJlIGFyZSByZWFsIGRlcGVuZGVuY2llcyBvciBwb3RlbnRpYWwgY29uZmxpY3RzLCBiNCBwcmVw
IGNhbiBoZWxwCj4geW91IHdpdGggbWFuYWdpbmcgdGhlbS4KCkluZGVlZC4KCj4gCj4+IFBhdGNo
ZXMgOC0xMCBwYXNzIHRoZSBrYnVmIGZpZWxkcyB0byBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSB0
bwo+PiBzaW1wbGZ5IGNvZGUuCj4+Cj4+IFBhdGNoIDExIGZyZWVzIHRoZSBlbGYgY29yZSBoZWFk
ZXIgZnJvbSB0aGUgZ2VuZXJpYyBwb3N0LWxvYWQgY2xlYW51cC4KPj4KPj4gUGF0Y2hlcyAxMi0x
NSBhZGQga2V4ZWNfbG9hZF9vdGhlcl9zZWdtZW50cygpIGFuZCBjb252ZXJ0IHRoZSB0aHJlZQo+
PiBhcmNoaXRlY3R1cmVzLCBhbmQgYXJjaF9rZXhlY19zZXR1cF9vdGhlcl9zZWdtZW50cygpIGJ1
aWxkcwo+PiB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGJvb3QgcGFyYW1ldGVycyAoYSBEVEIg
b3IgYSBjb21tYW5kIGxpbmUpLgo+IAo+IEkgdGhpbmsgdGhlIHJlZmFjdG9yaW5nIHNob3VsZCBn
byBiZWZvcmUgdGhlIGlkZW50aWNhbCBmaXhlcyBpbiBhcmNoLwo+IGNvZGUuCgpIb3dldmVyLCB0
aGlzIHdpbGwgY2F1c2UgdHJvdWJsZSBmb3IgdGhlIGZpeCBwYXRjaCBpbiB0aGUgc3RhYmxlIHJv
dW5kLgoKPiAKCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
