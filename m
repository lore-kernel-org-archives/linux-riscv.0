Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2C606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsiPUWT7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3Lj0XuRp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JDP65SJlchaQUPmxQhkbwusKu9OD0XPqqRGRUZ8q6Jk=; b=RsiPUWT7ijLs9MNwjhAxIrJdYu
	Bq4P++F0xpUXXB07fPY5ETpkxclZE06PZeW5cTVzye4I/3FnyEKnSfi1wALzueozyWenwN++IXIZO
	+TQrGCtCe4WhwXePfXrBRVaxHXtvGiPlMZWuaGgxlxnZhcHYYT592aLT5MMLiDO+zaoFMSiggr2ME
	ZThWMxSR2ndjqjmxKPXMLkZ1Rwrlb7+lXprAshNvIZ3p0P2QprTm9Cx/XTgpDxCw/yHhAxSPd4wFG
	oOy06lBWaVgnU3exV34eukC3Nb1qFVrtq9yvh1j6i/YuS1jsuZ8eP4XbInqzyRJaVZDToHXIm2+G+
	oCs/FaAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsT4-000000085p2-3b8C;
	Thu, 05 Nov 2026 08:05:06 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsT0-000000085np-3wjW;
	Thu, 05 Nov 2026 08:05:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CCGzWBfX1X9cSsHPu2mqWEF8NpNHLDATFqyNNjfsFkw=;
	b=3Lj0XuRpdOCEztpedA6GSSl5x4O4JddmtxEbTLNoJlR2C54wDBW8jorT/6aOBic8BqPVyewSl
	x8e38gtEwgurpOUkkDhNyzVD/e6X4ayKuii44trLaEH0J0I7w9kRCxr2qDXmrth0z2EzyiGCtdk
	TbamYBpLt/lj+b5ImptgI7A=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jKvx71hllz12LDh;
	Thu,  5 Nov 2026 16:04:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D2F8E4057F;
	Thu,  5 Nov 2026 16:04:57 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 16:04:56 +0800
Message-ID: <2db15115-a06a-48ba-86a2-9a343f1e2a2b@huawei.com>
Date: Thu, 5 Nov 2026 16:04:55 +0800
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
	<coiby.xu@gmail.com>, <Yeking@red54.com>, <tangyouling@kylinos.cn>,
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
 <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
 <auw1qgmjWko52oS_@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <auw1qgmjWko52oS_@kernel.org>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_000503_323594_E067639E 
X-CRM114-Status: GOOD (  13.48  )
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

CgrlnKggMjAyNi8xMS81IDE1OjUyLCBNaWtlIFJhcG9wb3J0IOWGmemBkzoKPiBPbiBUaHUsIE5v
diAwNSwgMjAyNiBhdCAxMTo0NTozOUFNICswODAwLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4g5Zyo
IDIwMjYvMTEvNCAyMjo1NiwgTWlrZSBSYXBvcG9ydCDlhpnpgZM6Cj4+Cj4+Pj4gUGF0Y2hlcyA4
LTEwIHBhc3MgdGhlIGtidWYgZmllbGRzIHRvIGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIHRvCj4+
Pj4gc2ltcGxmeSBjb2RlLgo+Pj4+Cj4+Pj4gUGF0Y2ggMTEgZnJlZXMgdGhlIGVsZiBjb3JlIGhl
YWRlciBmcm9tIHRoZSBnZW5lcmljIHBvc3QtbG9hZCBjbGVhbnVwLgo+Pj4+Cj4+Pj4gUGF0Y2hl
cyAxMi0xNSBhZGQga2V4ZWNfbG9hZF9vdGhlcl9zZWdtZW50cygpIGFuZCBjb252ZXJ0IHRoZSB0
aHJlZQo+Pj4+IGFyY2hpdGVjdHVyZXMsIGFuZCBhcmNoX2tleGVjX3NldHVwX290aGVyX3NlZ21l
bnRzKCkgYnVpbGRzCj4+Pj4gdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBib290IHBhcmFtZXRl
cnMgKGEgRFRCIG9yIGEgY29tbWFuZCBsaW5lKS4KPj4+Cj4+PiBJIHRoaW5rIHRoZSByZWZhY3Rv
cmluZyBzaG91bGQgZ28gYmVmb3JlIHRoZSBpZGVudGljYWwgZml4ZXMgaW4gYXJjaC8KPj4+IGNv
ZGUuCj4+Cj4+IEhvd2V2ZXIsIHRoaXMgd2lsbCBjYXVzZSB0cm91YmxlIGZvciB0aGUgZml4IHBh
dGNoIGluIHRoZSBzdGFibGUgcm91bmQuCj4gCj4gVGhhdCdzIHJpZ2h0LCBidXQgc2luY2UgYWN0
dWFsIGZpeGVzIGFueXdheSByZXF1aXJlIGNoYW5nZXMgdG8ga2V4ZWMgY29yZSwKPiBJIHRoaW5r
IGl0J3MgYmV0dGVyIHRvIHJlZmFjdG9yIGZpcnN0LiBUaGUgY29yZSB0aGFuIHdpbGwgdGFrZSBj
YXJlIG9mCj4gcHJvcGVyIGZyZWVpbmcgaW4gdGhlIG1vc3QgY2FzZXMuCgpUaGlzIHdheSwgZWFj
aCBhcmNoaXRlY3R1cmUgZG9lc24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IHRoZSBpc3N1ZSBvZgpp
bmNvbXBsZXRlIHJlc291cmNlIHJlbGVhc2UuCgo+IAo+IEFuZCBzaW5jZSBDTUEgc3VwcG9ydCBp
biBrZXhlYyBpcyBxdWl0ZSBuZXcgSSB0aGluayB0aGUgZW50aXJlIHNldCBjYW4gYmUKPiBiYWNr
cG9ydGVkIHRvIHN0YWJsZSB0aGVuLgoKTWFrZSBzZW5zZSBmb3IgbWUuCgo+IAo+IEknbSBwbGFu
bmluZyB0byBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhlIHJlZmFjdG9yaW5nIFJlYWxseSBTb29u
IDopIAoKVGhhbmsgeW91IHZlcnkgbXVjaCEgTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmV2aWV3
LgoKPiAKPj4gLS0gCj4+IEJlc3QgcmVnYXJkcywKPj4gSmluamllCj4+Cj4gCgotLSAKQmVzdCBy
ZWdhcmRzLApKaW5qaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
