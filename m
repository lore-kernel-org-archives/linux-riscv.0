Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC41E9B260
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKPoL/L7ujxvIB6az6u5FGnQrtSwIvt+qvwuTDStblo=; b=hIvD00Tz3Ulpr7
	g5nYnlM7leiMEyeKJEhzBIbW7WTA4kHIIXZmNDy458A5UTqWUYlKXIQ1J6BA5mboTc/eVxIYx5Zv/
	r3bCCGUjILxJN1LIpHPxPQHOyLskt76CTlySnvm1HhyuwjlxY6peqyD0aXI0oRLOdRKe2PYZ+TQlx
	Ixv8VZILowf9wr0etLlImTSDBlD0lJ5cG/v8UCY021xJL3X1rHnMoNz/B8kEor6LF/MTG80Qh6OXs
	K/pUspq2/mZgqDnNhSj7SFHXmAmwAuASHw8s0Wq1u/Ty+xRqAS6W77K2DXSSVWPZkI6uw79veueWO
	zhE/Se9DqABa6nfOnvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vus1x-0000000269j-1Ciw;
	Tue, 24 Feb 2026 13:00:49 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vus1s-0000000266I-05tN
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 13:00:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Fue2tVU858LZ38elo14sVk6gqI1+tCuiftRGjcHag5M=;
	b=0Dri22NSRpnz5eN6q+1zdlhweMT9s4WRiPZ+j7U3LnNHQbyH8uZMWvPcuFL8IJQPUtAn1joPc
	Abh8ITRNQNBs+9wdYrIk/vvx94LLo7DY90heyih62XOOVHGvJ1+CrETObVn50aAnXaKFuiGNYbB
	Kvp8fs8gXTVCEl2lU+Fross=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fKyMh4WzfznTWL;
	Tue, 24 Feb 2026 20:53:52 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id D068140565;
	Tue, 24 Feb 2026 20:58:33 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Feb 2026 20:58:32 +0800
Message-ID: <64357180-b91a-4319-bd0f-5f09e38cebdb@huawei.com>
Date: Tue, 24 Feb 2026 20:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
To: Ron Economos <re@w6rz.net>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <ziy@nvidia.com>, <jackmanb@google.com>, <david@redhat.com>,
	<jane.chu@oracle.com>, <hannes@cmpxchg.org>, <willy@infradead.org>,
	<muchun.song@linux.dev>, <osalvador@suse.de>, <sidhartha.kumar@oracle.com>,
	<vbabka@suse.cz>, <claudiu.beznea.uj@bp.renesas.com>, Mark Brown
	<broonie@kernel.org>, <akpm@linux-foundation.org>, <pjw@kernel.org>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_050044_230176_9B4A7D8E 
X-CRM114-Status: UNSURE (   6.31  )
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

CgpPbiAyMDI2LzIvMjQgMTY6MzcsIFJvbiBFY29ub21vcyB3cm90ZToKPiBJJ20gZ2V0dGluZyBh
IEJVRyBkdW1wIGR1cmluZyBzaHV0ZG93biB3aXRoIExpbnV4IHY3LjAtcmMxIG9uIFJJU0MtVi4K
PiAKPiBbwqAgT0vCoCBdIFJlYWNoZWQgdGFyZ2V0IHNodXRkb3duLnRhcmdldCAtIFN5c3RlbSBT
aHV0ZG93bi4KPiBbwqAgT0vCoCBdIFJlYWNoZWQgdGFyZ2V0IGZpbmFsLnRhcmdldCAtIExhdGUg
U2h1dGRvd24gU2VydmljZXMuCj4gW8KgIE9LwqAgXSBGaW5pc2hlZCBzeXN0ZW1kLXJlYm9vdC5z
ZXJ2aWNlIC0gU3lzdGVtIFJlYm9vdC4KPiBbwqAgT0vCoCBdIFJlYWNoZWQgdGFyZ2V0IHJlYm9v
dC50YXJnZXQgLSBTeXN0ZW0gUmVib290Lgo+IFvCoCAxNzMuOTg1MjQ5XSBCVUc6IEJhZCBwYWdl
IHN0YXRlIGluIHByb2Nlc3Mgc2h1dGRvd27CoCBwZm46Zjg4NTAKPiBbwqAgMTczLjk4NTMxMV0g
cGFnZTogcmVmY291bnQ6MSBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMCAKPiBp
bmRleDoweDAgcGZuOjB4Zjg4NTAKPiBbwqAgMTczLjk4NTMzNl0gZmxhZ3M6IDB4ZmZmZjgwMDAw
MDAwMDAwKG5vZGU9MHx6b25lPTB8IAo+IGxhc3RjcHVwaWQ9MHgxZmZmZikgQ01BCj4gW8KgIDE3
My45ODUzNjVdIHJhdzogMGZmZmY4MDAwMDAwMDAwMCBmZmZmZmZjNTAxZTIxNDQ4IGZmZmZmZmM2
MDBmMmFlODggCj4gMDAwMDAwMDAwMDAwMDAwMAo+IFvCoCAxNzMuOTg1Mzg2XSByYXc6IDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMWZmZmZmZmZmIAo+IDAwMDAwMDAw
MDAwMDAwMDAKPiBbwqAgMTczLjk4NTQwM10gcGFnZSBkdW1wZWQgYmVjYXVzZTogbm9uemVybyBf
cmVmY291bnQKCgpUaGUgcmVmY291bnQgc2V0IHRvIDEgd2hlbiBjbWFfYWxsb2MoKSBieSBzZXRf
cGFnZV9yZWZjb3VudGVkKCksIGFuZCBpdAp3aWxsIGJlIGRlYyB0byAwIGluIGNtYV9yZWxlYXNl
KCkgYnkgcHV0X3BhZ2VfdGVzdHplcm8oKSwgdGhlcmUgbWF5IGJlIGEgCnByb2JsZW0gc29tZXdo
ZXJlIGVsc2U/CgpDb3VsZCB5b3UgZW5hYmxlIENPTkZJR19ERUJVR19WTSBhbmQgQ09ORklHX0RF
QlVHX1BBR0VfUkVGLCBhbmQgdHJ5IHRvIAp0cmFjayBkb3duIHBhZ2UgcmVmZXJlbmNlIG1hbmlw
dWxhdGlvbiBieSB0cmFjZXBvaW50PyBvciBmb3IgQ01BLXJlbGF0ZWQKcGFnZXMsIGludHJvZHVj
ZSBleHBsaWNpdCBwcmludGsgYm90aCBpbmNyZW1lbnRzIGFuZCBkZWNyZW1lbnRzIG9mIHRoZSAK
cGFnZSByZWZlcmVuY2UgY291bnQgdG8gaWRlbnRpZnkgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGlz
c3VlLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
