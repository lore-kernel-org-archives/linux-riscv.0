Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026FFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 02:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPRK6lnZsDZu9z3EzX7FHjnqbdCv4G66k0a1K+myXxY=; b=LxzJ7Gu7outcXw
	vGDNVXIJ8EdrLQVtLhrM4tofNWtf4ozlZU4jg597piM3JeQSPufLwFAPNapuhjwlAS6JgeRqE6H38
	GiWdlFjVfUkUCMPwC9F7Saj4dOMX8U+HcYQuXKLFE7avExzh8yUic8UbUqvVrwqSlyBIuc2CRXtoE
	dLeWxldFR6j+B0+qaRDdFajvQ8PLfRJcZvbbqM36V2mjfpML6+NfXL0FTZTGIoZlXJtR1y7Xb91sJ
	uhRxyrWWocpnPKLWa4vaLTFFPs+JvF+CHwOdBAssM8NcKX5zDL62k2wHLURqJzrLtwjHUQyggZ10K
	+c1tWN2Paq9ZMlrXVSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8Wc-00Gdgy-Ow; Wed, 16 Nov 2022 02:51:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8WR-00Gddu-CM; Wed, 16 Nov 2022 02:51:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2060D13D5;
	Tue, 15 Nov 2022 18:51:32 -0800 (PST)
Received: from [10.162.40.17] (unknown [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8A1C3F663;
	Tue, 15 Nov 2022 18:51:15 -0800 (PST)
Message-ID: <01ffa482-8d59-4cf9-f103-fb39a987873d@arm.com>
Date: Wed, 16 Nov 2022 08:21:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Yicong Yang <yangyicong@huawei.com>
Cc: "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, X86 ML <x86@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>,
 "lipeifeng@oppo.com" <lipeifeng@oppo.com>,
 "zhangshiming@oppo.com" <zhangshiming@oppo.com>,
 "guojian@oppo.com" <guojian@oppo.com>, "realmz6@gmail.com"
 <realmz6@gmail.com>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 haoxin <xhao@linux.alibaba.com>,
 "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>,
 Barry Song <v-songbaohua@oppo.com>, Mel Gorman <mgorman@suse.de>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-3-yangyicong@huawei.com>
 <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
 <91e4804d-cb99-fd22-dafd-2f418f5c7ba9@huawei.com>
 <E3756C83-767A-4C68-AE3F-8C979F47A029@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <E3756C83-767A-4C68-AE3F-8C979F47A029@vmware.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_185131_547235_93B8A673 
X-CRM114-Status: GOOD (  15.41  )
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

CgpPbiAxMS8xNi8yMiAwNzoyNiwgTmFkYXYgQW1pdCB3cm90ZToKPiBPbiBOb3YgMTUsIDIwMjIs
IGF0IDU6NTAgUE0sIFlpY29uZyBZYW5nIDx5YW5neWljb25nQGh1YXdlaS5jb20+IHdyb3RlOgo+
IAo+PiAhISBFeHRlcm5hbCBFbWFpbAo+Pgo+PiBPbiAyMDIyLzExLzE2IDc6MzgsIE5hZGF2IEFt
aXQgd3JvdGU6Cj4+PiBPbiBOb3YgMTQsIDIwMjIsIGF0IDc6MTQgUE0sIFlpY29uZyBZYW5nIDx5
YW5neWljb25nQGh1YXdlaS5jb20+IHdyb3RlOgo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKPj4+PiBpbmRleCA4YTQ5N2Q5MDJjMTYuLjViZDc4YWU1NWNkNCAxMDA2NDQKPj4+PiAtLS0g
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4+Pj4gKysrIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vdGxiZmx1c2guaAo+Pj4+IEBAIC0yNjQsNyArMjY0LDggQEAgc3RhdGljIGlubGlu
ZSB1NjQgaW5jX21tX3RsYl9nZW4oc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4+Pj4gfQo+Pj4+Cj4+
Pj4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRkX21tKHN0cnVjdCBhcmNoX3Rs
YmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVhZGRyKQo+Pj4KPj4+IExv
Z2ljLXdpc2UgaXQgbG9va3MgZmluZS4gSSBub3RpY2UgdGhlIOKAnHY2IiwgYW5kIGl0IHNob3Vs
ZCBub3QgYmUgYmxvY2tpbmcsCj4+PiBidXQgSSB3b3VsZCBub3RlIHRoYXQgdGhlIG5hbWUgImFy
Y2hfdGxiYmF0Y2hfYWRkX21tKCnigJ0gZG9lcyBub3QgbWFrZSBtdWNoCj4+PiBzZW5zZSBvbmNl
IHRoZSBmdW5jdGlvbiBhbHNvIHRha2VzIGFuIGFkZHJlc3MuCj4+Cj4+IG9rIHRoZSBhZGRfbW0g
c2hvdWxkIHN0aWxsIGFwcGx5IHRvIHg4NiBzaW5jZSB0aGUgYWRkcmVzcyBpcyBub3QgdXNlZCwg
YnV0IG5vdCBmb3IgYXJtNjQuCj4+Cj4+PiBJdCBjb3VsZOKAmXZlIGJlZW4gc29tZXRoaW5nIGxp
a2UgYXJjaF9zZXRfdGxiX3ViY19mbHVzaF9wZW5kaW5nKCkgYnV0IHRoYXTigJlzCj4+PiB0b28g
bG9uZy4gSeKAmW0gbm90IHZlcnkgZ29vZCB3aXRoIG5hbWluZywgYnV0IHRoZSBjdXJyZW50IG5h
bWUgaXMgbm90IGdyZWF0Lgo+Pgo+PiBXaGF0IGFib3V0IGFyY2hfdGxiYmF0Y2hfYWRkX3BlbmRp
bmcoKT8gQ29uc2lkZXJpbmcgdGhlIHg4NiBpcyBwZW5kaW5nIHRoZSBmbHVzaCBvcGVyYXRpb24K
Pj4gd2hpbGUgYXJtNjQgaXMgcGVuZGluZyB0aGUgc3ljaHJvbml6YXRpb24gb3BlcmF0aW9uLCBh
cmNoX3RsYmJhdGNoX2FkZF9wZW5kaW5nKCkgc2hvdWxkCj4+IG1ha2Ugc2Vuc2UgdG8gYm90aC4K
PiAKPiBTb3VuZHMgcmVhc29uYWJsZS4gVGhhbmtzLgoKKzEsIGFncmVlZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
