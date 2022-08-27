Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC9AECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t4KZ65dn8zgXlY+End6De0JVHzatwZqxnoBF5IE5hA=; b=bszdZDx6/uir6r
	ueqD9EfdEnwKmJFbnIPkq8Hn4ggTP1XyMuJ5K3C01amxNghmEkdDaPR7DK6uLyKYUSjk46dNNZSkQ
	0juZs13TnsJi85+gu3sjtFrLk6OvEqZzZKw5ssjvGG+cWPhzRjb5ntg5CuRMMvgMMKa1MHw7Mdwib
	azvcNCdbQqv3597BqKDCUxCnXdSn5ce2heZRpjb6FqfQvMp+liPWkJFNbXFEyrSl/56bErnqXVHP/
	+/hezNFnGBWMW6zDUe63cFa0nFx8LJTNMir2pZbXOyEm+TgtrF1Trx1ZFg1EpEpZynlPSA88k6+a7
	zHnMYerK1gDN8SCVajOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtHX-007vtL-H1; Sat, 27 Aug 2022 10:43:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtHV-007vrg-E6
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 10:43:15 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MFCrP2pptzlVhw;
	Sat, 27 Aug 2022 18:39:49 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:43:08 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:43:06 +0800
Message-ID: <c0e286b4-3005-71fb-3bb2-476944099d4e@huawei.com>
Date: Sat, 27 Aug 2022 18:43:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
To: Arnd Bergmann <arnd@arndb.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
 <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_034313_678334_B33CBBD7 
X-CRM114-Status: GOOD (  17.28  )
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

CgrlnKggMjAyMi84LzI2IDE3OjMwLCBBcm5kIEJlcmdtYW5uIOWGmemBkzoKPiBPbiBNb24sIEF1
ZyAxNSwgMjAyMiBhdCA1OjIwIEFNIFRvbmcgVGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNv
bT4gd3JvdGU6Cj4+Cj4+IEN1cnJlbnQsIFRoZSBoZWxwZXJzIF9fZ2V0L3B1dF91c2VyX25vY2hl
Y2soKSBpcyB1c2VkIGJ5IGdldC9wdXRfdXNlcigpIGFuZAo+PiBfX2dldC9wdXRfa2VybmVsX25v
ZmF1bHQoKSwgd2hpY2ggaXMgbm90IGFsd2F5cyB1YWNjZXNzLCBzbyB0aGUgbmFtZSB3aXRoCj4+
ICp1c2VyKiBpcyBub3QgYXBwcm9wcmlhdGUuCj4+Cj4+IEFsc28gcmVuYW1lIHh4eF91c2VyX3h4
eCB0byB4eHhfbWVtX3h4ICBvbiB0aGUgY2FsbCBwYXRoIG9mCj4+IF9fZ2V0L3B1dF91c2VyX25v
Y2hlY2soKQo+Pgo+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rpb25hbCBj
aGFuZ2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1
YXdlaS5jb20+Cj4gCj4gSSB3b3VsZCBwcmVmZXIgdGhpcyBub3QgYmVpbmcgZG9uZSwgaXQganVz
dCBtYWtlcyByaXNjdiBkaXZlcmdlIGZyb20gdGhlCj4gY29kZSBvbiBvdGhlciBhcmNoaXRlY3R1
cmVzLiBXaGlsZSB0aGUgbmV3IG5hbWUgZG9lcyBtYWtlIG1vcmUgc2Vuc2UsCj4gaXQgZW5kcyB1
cCBtYWtpbmcgaXQgaGFyZGVyIHRvIHJlZmFjdG9yIHRoaXMgYWNyb3NzIGFyY2hpdGVjdHVyZXMg
aW4gdGhlIGVuZC4KPiAKPiBUaGVyZSBhcmUgdHdvIGltcG9ydGFudCBjbGVhbnVwcyB0aGF0IEkg
d291bGQgbGlrZSB0byBzZWUgZG9uZSBpbgo+IGFzbS91YWNjZXNzLmggYWNyb3NzIGFyY2hpdGVj
dHVyZXM6Cj4gCj4gICAtIGdlbmVyYWxpemUgdGhlIF9fZ2V0X3VzZXIoKS9fX3B1dF91c2VyKCkv
X19nZXRfa2VybmVsX25vZmF1bHQoKS8KPiAgICBfX3B1dF9rZXJuZWxfbm9mYXVsdCgpIHdyYXBw
ZXJzIHRvIHRoZSBwb2ludCB0aGF0IGFyY2hpdGVjdHVyZXMgZG8gbm90Cj4gICAgbmVlZCB0byB3
b3JyeSBhYm91dCB0aGUgdmFyaWFibGUgdHlwZSBzdHVmZiBidXQgaW5zdGVhZCBqdXN0IHByb3Zp
ZGUKPiAgICB0cml2aWFsIGZpeGVkLWxlbmd0aCBoZWxwZXJzIG9mIHNvbWUgc29ydAo+IAo+IC0g
Y2hhbmdlIHRoZSBjYWxsaW5nIGNvbnZlbnRpb25zIGluIGEgd2F5IHRoYXQgYWxsb3dzIHRoZSB1
c2Ugb2YgdGhlCj4gICAgYXNtLWdvdG8td2l0aC1vdXRwdXQgbWV0aG9kIGZvciBiZXR0ZXIgb2Jq
ZWN0IGNvZGUgb24gbW9kZXJuCj4gICAgY29tcGlsZXJzLgo+IAo+IFRoZSB4ODYgdmVyc2lvbiBh
bHJlYWR5IGhhcyBtb3N0IG9mIHRoaXMsIHdpdGggdGhlaXIKPiBfX2dldF91c2VyX3NpemUoKSBt
YWNybyBzdXBwb3J0aW5nIGJvdGggdGhlIGFzbS1nb3RvIGxhYmVsCj4gYW5kIHRoZSBlcnJvciBj
b2RlIGFzc2lnbm1lbnQsIHNvIHRoZSBnZW5lcmFsaXplZCBjb2RlIHNob3VsZAo+IHByb2JhYmx5
IGJlIGJhc2VkIG9uIHRoYXQgYXBwcm9hY2guCgpJIGFtIHZlcnkgaW50ZXJlc3RlZCBpbiB0aGUg
aW1wbGVtZW50YXRpb24gb2YgWDg2LiBJIG5lZWQgdG8gaW52ZXN0aWdhdGUgCmFuZCBjb25zaWRl
ciBhIGNyb3NzIGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRhdGlvbi4KSG93ZXZlciwgSSB1bmRlcnN0
YW5kIHRoYXQgdGhlIG1vZGlmaWNhdGlvbiBvZiB0aGUgY3VycmVudCBwYXRjaCBoYXMgCmxpdHRs
ZSB0byBkbyB3aXRoIHRoZSB0d28gcG9pbnRzIG1lbnRpb25lZCBhYm92ZS4gV2UgY2FuIG9wdGlt
aXplIHRoZSAKY29kZSBzdGVwIGJ5IHN0ZXAuCgpUaGFua3MsClRvbmcuCgo+IAo+ICAgICAgICAg
QXJuZAo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
