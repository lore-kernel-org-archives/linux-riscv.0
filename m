Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB1AEE49A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TISv1rcgl9s5q9W7zjjA+FW65+EY2wQot7gqIb5u8Q=; b=K8GLwMQlO5+pYs
	eotDtqzH3st6X1ARCnWXVnNc0cDL8jjM+5Pp0QeW0llYFewKc2LvvpJf3Z6olSLv9WVzcGY4DrlBy
	mLAycVlY9nCFMvro4W4NWdmjr5zcICJleOTt6VC22iq7hwt/rxiY+PDqlel7vlvzo3aVa3563/e90
	Na5k3WHQbbA5dHZyvB/0NOAfYU/saZdhCDIMKdY2RDbWpzAIahsp18UQiv7gK4kPibMx+n4lIbyYS
	dNpf09MWfZLwdWkBogk8xAPn4a42a9G448Kyiakyi3cjBL/JQPhrRK3UUVju2Ihpj6eLOuHRvRd2w
	20IYe1quh7vt+Nwtv0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYps2-000zUH-0T;
	Wed, 23 Aug 2023 15:34:10 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYps0-000zTr-0B;
	Wed, 23 Aug 2023 15:34:08 +0000
Message-ID: <23368823-0377-00c0-28a1-e804e3a2acac@infradead.org>
Date: Wed, 23 Aug 2023 08:34:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] riscv: Require FRAME_POINTER for some configurations
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Drew Fustini <dfustini@baylibre.com>, linux-next@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230823082845.354839-1-bjorn@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230823082845.354839-1-bjorn@kernel.org>
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

CkhpLAoKT24gOC8yMy8yMyAwMToyOCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9tOiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gU29tZSBWIGNvbmZpZ3VyYXRpb25z
IGltcGxpY2l0bHkgdHVybiBvbiAnLWZuby1vbWl0LWZyYW1lLXBvaW50ZXInLAo+IGJ1dCBsZWF2
aW5nIEZSQU1FX1BPSU5URVIgZGlzYWJsZWQuIFRoaXMgbWFrZXMgaXQgaGFyZCB0byByZWFzb24g
YWJvdXQKPiB0aGUgRlJBTUVfUE9JTlRFUiBjb25maWcsIGFuZCBhbHNvIHRyaWdnZXJzIGJ1aWxk
IGZhaWx1cmVzIGludHJvZHVjZWQKPiBpbiBieSB0aGUgY29tbWl0IGluIHRoZSBGaXhlczogdGFn
Lgo+IAo+IFNlbGVjdCBGUkFNRV9QT0lOVEVSIGV4cGxpY2l0bHkgZm9yIHRoZXNlIGNvbmZpZ3Vy
YXRpb25zLgo+IAo+IEZpeGVzOiBlYmM5Y2IwM2IyMWUgKCJyaXNjdjogc3RhY2s6IEZpeHVwIGlu
ZGVwZW5kZW50IHNvZnRpcnEgc3RhY2sgZm9yIENPTkZJR19GUkFNRV9QT0lOVEVSPW4iKQo+IFNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCldvcmtzRm9y
TWUuIFRoYW5rcy4KClRlc3RlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+CkFja2VkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KCj4gLS0t
Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgfCAxICsKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDMg
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IGluZGV4IDEwZTdhN2FkMTc1YS4uY2Q4MDc1YzA5MmMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC02Miw2ICs2Miw3IEBA
IGNvbmZpZyBSSVNDVgo+ICAJc2VsZWN0IENPTU1PTl9DTEsKPiAgCXNlbGVjdCBDUFVfUE0gaWYg
Q1BVX0lETEUgfHwgSElCRVJOQVRJT04KPiAgCXNlbGVjdCBFREFDX1NVUFBPUlQKPiArCXNlbGVj
dCBGUkFNRV9QT0lOVEVSIGlmIFBFUkZfRVZFTlRTIHx8IChGVU5DVElPTl9UUkFDRVIgJiYgIURZ
TkFNSUNfRlRSQUNFKQo+ICAJc2VsZWN0IEdFTkVSSUNfQVJDSF9UT1BPTE9HWQo+ICAJc2VsZWN0
IEdFTkVSSUNfQVRPTUlDNjQgaWYgITY0QklUCj4gIAlzZWxlY3QgR0VORVJJQ19DTE9DS0VWRU5U
U19CUk9BRENBU1QgaWYgU01QCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9h
cmNoL3Jpc2N2L01ha2VmaWxlCj4gaW5kZXggNmVjNmQ1MmE0MTgwLi4xMzI5ZTA2MGM1NDggMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZp
bGUKPiBAQCAtODcsOSArODcsNiBAQCBlbmRpZgo+ICBpZmVxICgkKENPTkZJR19DTU9ERUxfTUVE
QU5ZKSx5KQo+ICAJS0JVSUxEX0NGTEFHUyArPSAtbWNtb2RlbD1tZWRhbnkKPiAgZW5kaWYKPiAt
aWZlcSAoJChDT05GSUdfUEVSRl9FVkVOVFMpLHkpCj4gLSAgICAgICAgS0JVSUxEX0NGTEFHUyAr
PSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlcgo+IC1lbmRpZgo+ICAKPiAgIyBBdm9pZCBnZW5lcmF0
aW5nIC5laF9mcmFtZSBzZWN0aW9ucy4KPiAgS0JVSUxEX0NGTEFHUyArPSAtZm5vLWFzeW5jaHJv
bm91cy11bndpbmQtdGFibGVzIC1mbm8tdW53aW5kLXRhYmxlcwo+IAo+IGJhc2UtY29tbWl0OiA4
OWJmNjIwOWNhZDY2MjE0ZDM3NzRkYWM4NmI2YmJmMmFlYzZhMzBkCgotLSAKflJhbmR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
