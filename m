Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E1EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 01:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiqxUDcQFFhj7PhYqA9zk6t6DxTer1g5ymDSPdfVV2g=; b=PWRd4OXggS9yE/
	u73rjLu2QlS00ivbtfptTZJqzMTnnKNaszAldLEVkZrrjlrUkwHhyTlQrBWy0p5O/Sf5ay6NKHnl1
	hfRHIRebYV/V71fjKCiOcMb1aE5fdjk0/OkQCEQfrIB9PHE/pt98RFz6KhvmKuAFEgKASqWI2BrVu
	oXDWIwqRRO5bLBWBTJVal3Wr/FQS1mBsuE3CfgkiOnwh1FXM17zdl4IFuUutcGY9E5UTzsjfzTcq6
	hJeu2IJSkSKdtRU22D/1IdouhvMDoBfwDKwZpNTS9blVQj3wRcmAj8zKTI2ayJOEmhpqyjCXl0Mb3
	1JqDb2u3I6iFSb/B/8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKUUq-007fjV-2G;
	Sat, 15 Jul 2023 01:54:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKUUm-007fgR-2W;
	Sat, 15 Jul 2023 01:54:54 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R2rx46ZcYzhYcy;
	Sat, 15 Jul 2023 09:54:00 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 09:54:38 +0800
Message-ID: <153b94dc-d003-fe81-eef4-332ece878af0@huawei.com>
Date: Sat, 15 Jul 2023 09:54:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
	<willy@infradead.org>
CC: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com>
 <ZLAjFQGgcjt4ykS7@casper.infradead.org>
 <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
 <6f06f7d5-7d84-815e-699b-eef684e014b0@huawei.com>
In-Reply-To: <6f06f7d5-7d84-815e-699b-eef684e014b0@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_185453_219679_7F586980 
X-CRM114-Status: GOOD (  15.53  )
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

CgpPbiAyMDIzLzcvMTQgOTo1MiwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyMy83
LzE0IDQ6MTIsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPj4gT24gVGh1LCBKdWwgMTMsIDIw
MjMgYXQgOToxNeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiAKPj4g
d3JvdGU6Cj4+Pgo+Pj4+ICtpbnQgdHJ5X3ZtYV9sb2NrZWRfcGFnZV9mYXVsdChzdHJ1Y3Qgdm1f
bG9ja2VkX2ZhdWx0ICp2bWxmLCAKPj4+PiB2bV9mYXVsdF90ICpyZXQpCj4+Pj4gK3sKPj4+PiAr
wqDCoMKgwqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4+Pj4gK8KgwqDCoMKgIHZtX2Zh
dWx0X3QgZmF1bHQ7Cj4+Pgo+Pj4KPj4+IE9uIFRodSwgSnVsIDEzLCAyMDIzIGF0IDA1OjUzOjI5
UE0gKzA4MDAsIEtlZmVuZyBXYW5nIHdyb3RlOgo+Pj4+ICsjZGVmaW5lIFZNX0xPQ0tFRF9GQVVM
VF9JTklUKF9uYW1lLCBfbW0sIF9hZGRyZXNzLCBfZmF1bHRfZmxhZ3MsIAo+Pj4+IF92bV9mbGFn
cywgX3JlZ3MsIF9mYXVsdF9jb2RlKSBcCj4+Pj4gK8KgwqDCoMKgIF9uYW1lLm1twqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gX21tO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+Pj4+ICvCoMKgwqDCoCBfbmFtZS5hZGRyZXNzwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSBfYWRkcmVzczvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+ICvCoMKgwqDCoCBfbmFt
ZS5mYXVsdF9mbGFnc8KgwqDCoMKgwqDCoCA9IF9mYXVsdF9mbGFnczvCoMKgwqDCoMKgwqDCoMKg
IFwKPj4+PiArwqDCoMKgwqAgX25hbWUudm1fZmxhZ3PCoMKgwqDCoMKgwqDCoMKgwqAgPSBfdm1f
ZmxhZ3M7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+Pj4gK8KgwqDCoMKgIF9uYW1lLnJlZ3PC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IF9yZWdzO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4+Pj4gK8KgwqDCoMKgIF9uYW1lLmZhdWx0X2NvZGXCoMKgwqDCoMKgwqDCoCA9
IF9mYXVsdF9jb2RlCj4+Pgo+Pj4gTW9yZSBjb25zb2xpZGF0ZWQgY29kZSBpcyBhIGdvb2QgaWRl
YTsgbm8gcXVlc3Rpb24uwqAgQnV0IEkgZG9uJ3QgdGhpbmsKPj4+IHRoaXMgaXMgdGhlIHJpZ2h0
IHdheSB0byBkbyBpdC4KPiAKPiBJIGFncmVlIGl0IGlzIG5vdCBnb29kIGVub3VnaCwgYnV0IHRo
ZSBhcmNoJ3Mgdm1hIGNoZWNrIGFjZXNzIGhhcwo+IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiwg
c29tZSB1c2Ugdm0gZmxhZ3MsIHNvbWUgbmVlZCBmYXVsdCBjb2RlIGFuZAo+IHJlZ3MsIGFuZCBz
b21lIHVzZSBib3RoIDooCj4gCj4+Pgo+Pj4+ICtpbnQgX193ZWFrIGFyY2hfdm1hX2NoZWNrX2Fj
Y2VzcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgdm1fbG9ja2Vk
X2ZhdWx0ICp2bWxmKTsKPj4+Cj4+PiBUaGlzIHNob3VsZCBiZToKPj4+Cj4+PiAjaWZuZGVmIHZt
YV9jaGVja19hY2Nlc3MKPj4+IGJvb2wgdm1hX2NoZWNrX2FjY2VzcyhzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwgKQo+Pj4gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKHZtYS0+dm1f
ZmxhZ3MgJiB2bV9mbGFncykgPT0gMDsKPj4+IH0KPj4+ICNlbmRpZgo+Pj4KPj4+IGFuZCB0aGVu
IGFyY2hlcyB3aGljaCB3YW50IHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgY2FuIGp1c3QgZGVm
aW5lCj4+PiB2bWFfY2hlY2tfYWNjZXNzLgo+IAo+IE9rLCBJIGNvdWxkIGNvbnZlcnQgdG8gdXNl
IHRoaXMgd2F5Lgo+IAo+Pj4KPj4+PiAraW50IHRyeV92bWFfbG9ja2VkX3BhZ2VfZmF1bHQoc3Ry
dWN0IHZtX2xvY2tlZF9mYXVsdCAqdm1sZiwgCj4+Pj4gdm1fZmF1bHRfdCAqcmV0KQo+Pj4+ICt7
Cj4+Pj4gK8KgwqDCoMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+Pj4+ICvCoMKgwqDC
oCB2bV9mYXVsdF90IGZhdWx0Owo+Pj4KPj4+IERlY2xhcmluZyB0aGUgdm1mIGluIHRoaXMgZnVu
Y3Rpb24gYW5kIHRoZW4gY29weWluZyBpdCBiYWNrIGlzIGp1c3QgCj4+PiB3cm9uZy4KPj4+IFdl
IG5lZWQgdG8gZGVjbGFyZSB2bV9mYXVsdF90IGVhcmxpZXIgKGluIHRoZSBhcmNoIGZhdWx0IGhh
bmRsZXIpIGFuZAo+Pj4gcGFzcyBpdCBpbi4KPiAKPiBBY3R1YWxseSBJIHBhc3NlZCB0aGUgdm1f
ZmF1bHRfdCAqcmV0KGluIHRoZSBhcmNoIGZhdWx0IGhhbmRsZXIpLCB3ZQo+IGNvdWxkIGRpcmVj
dGx5IHVzZSAqcmV0IGluc3RlYWQgb2YgYSBuZXcgbG9jYWwgdmFyaWFibGUsIGFuZCBubyBjb3B5
Lgo+Pgo+PiBEaWQgeW91IG1lYW4gdG8gc2F5ICJ3ZSBuZWVkIHRvIGRlY2xhcmUgdm1mIChzdHJ1
Y3Qgdm1fZmF1bHQpIGVhcmxpZXIKPj4gKGluIHRoZSBhcmNoIGZhdWx0IGhhbmRsZXIpIGFuZCBw
YXNzIGl0IGluLiIgPwoKQWZ0ZXIgcmVjaGVjayB0aGUgY29kZSwgSSB0aGluayBNYXR0aGV3JyBp
ZGVhIGlzICdkZWNsYXJlIHZtZiAoc3RydWN0IAp2bV9mYXVsdCkgZWFybGllcicgbGlrZSBTdXJl
biBzYWlkLCBub3Qgdm1fZmF1bHRfdCwgcmlnaHQ/IHdpbGwgdHJ5IAp0aGlzLCB0aGFua3MuCgo+
Pgo+Pj4gwqAgSSBkb24ndCB0aGluayB0aGF0IGNyZWF0aW5nIHN0cnVjdCB2bV9sb2NrZWRfZmF1
bHQgaXMgdGhlCj4+PiByaWdodCBpZGVhIGVpdGhlci4KPiAKPiBBcyBtZW50aW9uZWQgYWJvdmUg
Zm9yIHZtYSBjaGVjayBhY2Nlc3MsIHdlIG5lZWQgbWFueSBhcmd1bWVudHMgZm9yIGEgCj4gZnVu
Y3Rpb24sIGEgbmV3IHN0cnVjdCBsb29rcyBwb3NzaWJsZSBiZXR0ZXIsIGlzIHRoZXJlIGJldHRl
ciBzb2x1dGlvbgo+IG9yIGFueSBzdWdnZXN0aW9uPwo+IAo+IFRoYW5rcy4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
