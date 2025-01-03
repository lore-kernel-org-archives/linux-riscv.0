Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA446E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mc3WvxwHmKcKopZrcZglxT48rEhnzoXKRYxRwtcynlk=; b=ZrOD33+BDPI9ua
	a6YgygsvYitaRQIfarP/1T1/qyXupztqkQ5gmCuv4KdSQIZpZlUmOyYG3rxGZ1v1N4MHEuZWRu298
	LGPT0XqwX05FbylINXIHYz+dP7FEf9JKoWDX7MUpDf5P4XlFbU6ejN+YqB/SC5z2N8n2MWAtKOHMf
	U0vEgcjNxzyL+gbTINb5GbinqLx2Zn+7OY6AO+qGxPnJjp+SYHWqjKYEPtiUkOueKmwzkSweZyUNH
	C0qnofJGJwFi3FYjoeDaGDEuNMklKsWthF3uY0QQ5avuxwYeOCnDLluPeVIOvAUbnNiQvdv+M0MEi
	Qe3SvgR9JKcHRbmNyNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcQU-0000000COsL-2xIv;
	Fri, 03 Jan 2025 07:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcOD-0000000COXF-47UT;
	Fri, 03 Jan 2025 07:46:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21C9D1516;
	Thu,  2 Jan 2025 23:47:05 -0800 (PST)
Received: from [10.57.92.237] (unknown [10.57.92.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E1313F6A8;
	Thu,  2 Jan 2025 23:46:28 -0800 (PST)
Message-ID: <d7f079ea-6530-4f92-9cab-bee90b84e2c3@arm.com>
Date: Fri, 3 Jan 2025 08:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] mm: pgtable: add statistics for P4D level page
 table
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <2fa644e37ab917292f5c342e40fa805aa91afbbd.1735549103.git.zhengqi.arch@bytedance.com>
 <237a3bf6-c24f-4feb-8d3d-bb3beb2fd18e@arm.com>
 <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <77c202bf-e0a3-45e7-bf8d-eef7903e3c64@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_234638_056905_43BB219C 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMvMDEvMjAyNSAwNDo1MywgUWkgWmhlbmcgd3JvdGU6Cj4gT24gMjAyNS8xLzMgMDA6NTMs
IEtldmluIEJyb2Rza3kgd3JvdGU6Cj4+IE9uIDMwLzEyLzIwMjQgMTA6MDcsIFFpIFpoZW5nIHdy
b3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+
PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+PiBpbmRleCA1NTFkNjE0ZDMz
NjljLi4zNDY2ZmJlMmU1MDhkIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ2FsbG9jLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+
PiBAQCAtMTA4LDggKzEwOCwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19wdWRfZnJlZV90bGIo
c3RydWN0Cj4+PiBtbXVfZ2F0aGVyICp0bGIsIHB1ZF90ICpwdWQsCj4+PiDCoCBzdGF0aWMgaW5s
aW5lIHZvaWQgX19wNGRfZnJlZV90bGIoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgcDRkX3QgKnA0
ZCwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgYWRkcikKPj4+IMKgIHsKPj4+IC3CoMKgwqAgaWYgKHBndGFibGVfbDVfZW5hYmxlZCkKPj4+
ICvCoMKgwqAgaWYgKHBndGFibGVfbDVfZW5hYmxlZCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0
cnVjdCBwdGRlc2MgKnB0ZGVzYyA9IHZpcnRfdG9fcHRkZXNjKHA0ZCk7Cj4+PiArCj4+PiArwqDC
oMKgwqDCoMKgwqAgcGFnZXRhYmxlX3A0ZF9kdG9yKHB0ZGVzYyk7Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmlzY3ZfdGxiX3JlbW92ZV9wdGRlc2ModGxiLCB2aXJ0X3RvX3B0ZGVzYyhwNGQpKTsK
Pj4KPj4gTml0OiBjb3VsZCB1c2UgdGhlIG5ldyBwdGRlc2MgdmFyaWFibGUgaGVyZSBpbnN0ZWFk
IG9mIGNhbGxpbmcKPj4gdmlydF90b19wdGRlc2MoKS4KPgo+IFJpZ2h0LCBidXQgd2Ugd2lsbCBy
ZW1vdmUgcGFnZXRhYmxlX3A0ZF9kdG9yKCkgaW4gcGF0Y2ggIzEwLCBzbyB0aGlzCj4gbWF5IG5v
dCBtYXR0ZXIuCgpZb3UncmUgcmlnaHQsIEkgbWlzc2VkIHRoYXQuIE1ha2VzIHNlbnNlIG5vdCB0
byBjcmVhdGUgYSBkaWZmIHRoYXQncwpyZXZlcnRlZCBsYXRlciB0aGVuIDopCgotIEtldmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
