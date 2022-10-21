Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D811C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opeJTA47x0ccf3a78VXsLbUgpxZRHIEAPo0iLYPiVII=; b=zWsY/RRHdmTJ0J
	jTcsV0wsOw+uzs/JVvVA3JwnVPMTQGdZy0abGpaif/OBHoAglPyLelH9tcr9Xutx0NjEEwiWwbbq5
	uAAq5ZqXWRT5ohAJQzdEyw8Nsb3m/vsPeiNU3f2gk0obeEz8IzEC0/Y7zk96ljirBSnp5JeqrmzcQ
	2DWZ/fUmqYW0QeuVoW0OvBH9/on98YCSDHDDaZ3kh/OPax8qD6kY/3g/QChysLHfgcTnWue2Mk+fP
	x+TD5KZjcwgGgDp076buahcc0sPFpmH9VLSBpln3VzN1HsNEsfuuLQ5twVoDXb0tOMakzOwHulcWX
	irgviFjGwQ03AHECqgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltmi-008f9B-9E; Fri, 21 Oct 2022 15:18:08 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltme-008f7t-FC
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 15:18:06 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mv7Lr1JgvzJn3N;
	Fri, 21 Oct 2022 23:15:16 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 23:17:54 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 23:17:53 +0800
Message-ID: <41608bda-3c20-060e-a9b4-afa2fe615b41@huawei.com>
Date: Fri, 21 Oct 2022 23:17:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Guo Ren <guoren@kernel.org>
CC: Andrea Parri <parri.andrea@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
 <Y1JaE/ot91Z0KXuC@andrea> <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
 <Y1KdKATQx16Xl/iL@andrea> <f1eb4756-e1e1-1f12-e767-a69a891786d6@huawei.com>
 <CAJF2gTRdtcpccL5W48O8VEXCMvxNAyyrKJzhwNJkc8js+H2iJg@mail.gmail.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CAJF2gTRdtcpccL5W48O8VEXCMvxNAyyrKJzhwNJkc8js+H2iJg@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_081804_727476_A93F21E4 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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

CgrlnKggMjAyMi8xMC8yMSAyMjo0MSwgR3VvIFJlbiDlhpnpgZM6Cj4gT24gRnJpLCBPY3QgMjEs
IDIwMjIgYXQgOTo0NiBQTSBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+IHdy
b3RlOgo+Pgo+Pgo+Pgo+PiDlnKggMjAyMi8xMC8yMSAyMToyMiwgQW5kcmVhIFBhcnJpIOWGmemB
kzoKPj4+IEhpIFRvbmcsCj4+Pgo+Pj4+Pj4gSSB1c2UgYXRvbWljX3NldF9yZWxlYXNlIGhlcmUs
IGJlY2F1c2UgSSBuZWVkIGVhcmxpZXIgbWVtb3J5Cj4+Pj4+PiBvcGVyYXRpb25zIGZpbmlzaGVk
IHRvIG1ha2Ugc3VyZSB0aGUgc3AgaXMgcmVhZHkgdGhlbiBzZXQgdGhlIHNwaW4KPj4+Pj4+IGZs
YWcuCj4+Pgo+Pj4+ICAgICAgIENvbnNpZGVyIHRoaXMgaW1wbGVtZW50YXRpb246KQo+Pj4+Cj4+
Pj4gICAgICAgc21wX3N0b3JlX21iKCZzcGluX3NoYWRvd19zdGFjaywgMCk7Cj4+Pgo+Pj4gc21w
X3N0b3JlX21iKCkgaGFzICJXUklURV9PTkNFKCk7IHNtcF9tYigpIiBzZW1hbnRpY3M7IHNvIGl0
IGRvZXNuJ3QKPj4+IGd1YXJhbnRlZSB0aGF0IHRoZSBzdG9yZSB0byBzcGluX3NoYWRvd19zdGFj
ayBpcyBvcmRlcmVkIGFmdGVyIHByb2dyYW0KPj4+IC1vcmRlciBlYXJsaWVyIG1lbW9yeSBhY2Nl
c3Nlcy4KPj4+Cj4+PiAgICAgQW5kcmVhCj4+PiAuCj4+Cj4+IEhpIEFuZHJlYToKPj4KPj4gSUlV
QywgdGhlIGVhcmxpZXIgbWVtb3J5IGFjY2VzcyBhbW9zd2FwLmFxcmwsIGhlcmUgLmFxcmwgZ3Vh
cmFudGVlIGl0Lgo+PiBCdXQgYW55d2F5LCBjb25zaWRlciB3ZSBkb24ndCBjYXJlIGFib3V0IHBl
cmZvcm1hbmNlIGhlcmUsIHVzaW5nCj4+IHNtcF9zdG9yZV9yZWxlYXNlKCkoYWRkIGJhcnJpZXIo
KSkgc3VyZWx5IHJpZ2h0Lgo+IFdlIHVzZSBzbXBfc3RvcmVfcmVsZWFzZSgpIGlzIGZvcjoKPiAg
ICAgICAgICAvL2xvYWQgcGVyLWNwdSBvdmVyZmxvdyBzdGFjawo+ICAgICAgICAgIFJFR19MIHNw
LCAtOChzcCkKCk9oLCBtaXNzaW5nIHRoYXQsIHlvdSdyZSByaWdodC4gVGhpcyBndWFyYW50ZWUg
dGhlIHNwaW4gZmxhZyBpcyBzZXQgCmFmdGVyIHRoZSBzcCBpcyB1c2VkLgoKPiAKPiBOb3QgYW1v
c3dhcC4KPiAKPiBBY3R1YWxseSwgYW1vc3dhcC5hcXJsIGd1YXJhbnRlZXMgbm90aGluZyBiZWNh
dXNlIGFsbCBpbnN0cnVjdGlvbnMKPiBkZXBlbmQgb24gdGhlIHNwIHJlZ2lzdGVyLgpyaWdodC4K
ClRoYW5rcywKVG9uZy4KCj4gCj4+Cj4+IFRoYW5rcywKPj4gVG9uZy4KPiAKPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
