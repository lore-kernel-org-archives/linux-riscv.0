Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C7C982C1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 02:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:References:In-Reply-To:
	Date:Mime-Version:To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2U3NW/gJLgm133UFdHZRfoLvYFhjRx/zILVFQJ7h28=; b=qFbi+culmO/hkk
	8H3nz5PV1VEfhDROLNZJOg1cJBj9W+VcgaIbqsq1QM1fnqWam9ra1DIGb7TCcTJBGP8cJED8cctRZ
	jb8Lj6aC7k5FG/4ViO4aRxC0OAI9XkrKK0kC1hHe4oF+UG/2iVnjehbQiXzJw3sfKRLHEfrF53n5v
	42Yix5Iez+HTFi0tZBtBa6hRDecC8OOiu3HTsg7/OxypgtyhBjXWIB0TYH6OTKgkZrda1TeouXGu4
	sv/otoXlqylMDXRB2xVyBm5EvJn5jsrKXh77L5uY8jUTSFjRUU6I/3LxlS7a4ndZwxxIsoUw6FBqg
	bfxA/0ryhUtO0Gas/Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71Ui-0000000ARqs-0M3U;
	Thu, 17 Sep 2026 02:05:00 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71Uf-0000000ARqW-10NI
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 02:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1789610690;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MDsxntRODNgCNG5JeXxth+hLjZlO+v0hDLmbatGO5VY=;
 b=mTqXAqnWaPFcsNiK+cyRsvkef7ovWgv/a91kjHhwtxxi0rz3WkmSgPKAb9tPxHu4cvsg7l
 WPqFKWE/8rrtTXoJZ5FGUQ362TxDT/psZkJIsZAKOPWWFGkRbrWYHDAQdmQ+m3jhw7Tac5
 V/UNueXEyE6eo7zK849y6ndNjtaInWuCCW7TqHQj4/ttpXgOdl33IsGTJtehb2FhwIPSUK
 gETRKnwLg048G5crunUBk+XxN/Lnl7dBwwPNDK1oHRgQ+gnEW+et2Ww+ZjQIziI9UKsYCj
 eFIeEizEg48VTZFN0XvxwJ2KlPenZi2TBoPJF8d88unoRFxVZ8eySU+wuSuTtA==
Message-Id: <9d469f95-73b4-4a0a-9c35-80a655a53225@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
To: <sunilvl@oss.qualcomm.com>
Mime-Version: 1.0
Received: from [127.0.0.1] ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:04:37 +0800
Content-Language: en-US
Date: Thu, 17 Sep 2026 10:04:34 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+26aab4ab7+2805b8+lists.infradead.org+xiangwencheng@lanxincomputing.com>
In-Reply-To: <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
References: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com> <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: Re: [PATCH] riscv: iommu: ask for ACS to be enabled
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_190457_354199_B661E8CF 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: aou@eecs.berkeley.edu, tjeznach@rivosinc.com, alex@ghiti.fr, rafael@kernel.org, guoren@linux.alibaba.com, linux-kernel@vger.kernel.org, luxu.kernel@bytedance.com, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, jgg@nvidia.com, pjw@kernel.org, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gOS8xNi8yMDI2IDg6MTggUE0sIFN1bmlsIFYgTCB3cm90ZToKPiBPbiBXZWQsIFNlcCAxNiwg
MjAyNiBhdCA1OjE14oCvUE0gQmlsbFhpYW5nCj4gPHhpYW5nd2VuY2hlbmdAbGFueGluY29tcHV0
aW5nLmNvbT4gd3JvdGU6Cj4+Cj4+IE1ha2Ugc3VyZSBBQ1Mgd2lsbCBiZSBlbmFibGVkIGR1cmlu
ZyBQQ0kgcHJvYmUKPj4KPj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5nIDx4aWFuZ3dlbmNoZW5n
QGxhbnhpbmNvbXB1dGluZy5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvYWNwaS9yaXNjdi9yaW10
LmMgfCAxICsKPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9yaW10LmMgYi9kcml2ZXJzL2FjcGkvcmlzY3Yvcmlt
dC5jCj4+IGluZGV4IGU0NTM4ZmE2YzJjOC4uMzBkMmQwMjExZDVlIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2FjcGkvcmlzY3YvcmltdC5jCj4+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9yaW10
LmMKPj4gQEAgLTUyNSw0ICs1MjUsNSBAQCB2b2lkIF9faW5pdCByaXNjdl9hY3BpX3JpbXRfaW5p
dCh2b2lkKQo+Pgo+PiAgICAgICAgICAgICAgICAgIHJldHVybjsKPj4gICAgICAgICAgfQo+PiAr
ICAgICAgIHBjaV9yZXF1ZXN0X2FjcygpOwo+PiAgIH0KPj4KPiBUaGVyZSBpcyBhbHJlYWR5IGEg
cGF0Y2ggaW4gdGhlIG1haWxpbmcgbGlzdCBmb3IgdGhpcy4KPiAKPiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyNi85LzMvMTkzMAo+IAo+IFRoYW5rcywKPiBTdW5pbAoKVGhhbmsgeW91IGZvciBw
b2ludGluZyB0aGF0IG91dC4gUGxlYXNlIGp1c3QgaWdub3JlIG15IGNvbW1pdC4KCi0tCkJpbGxY
aWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
