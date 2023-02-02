Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29023C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1k9+v4Lxxw3Kv+aRa55yQs1GHI+8vSbzet03joIBDE=; b=wBIaomjzEwswD6
	bEEto7zb9l72Hxqfm1ElGEO6m+4m9qGxFCtizjieQHodL0lJyDHirzkIwZpZPbgXAJV2V/onPq3t+
	xT9iXfiy5URqq02LLPbPWf0TrvEFYYIW9WpIv7GRHsIA8DqiW6JDpHq4XwrBWexSJbID7Xe7MjSLo
	OyXYOAb59KejPFhqqcJUKum5YdIcbdAE2GOFr7rZuESYvMQjHO/AkX47RCZ5XmWydx6YRYtEvUpE4
	RfZaMsUsszhQ+98qpR2hLwj37Kt2wnDeNXuvVnvRL5eGB6ba+8Fa8xTdWQxiP1AwXuabPieH4SHPj
	eKarin/fUDev/0Mt9YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQM1-00EFpp-AQ; Thu, 02 Feb 2023 03:33:41 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQLx-00EFoq-Eg
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 03:33:40 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 6E6081C62B4;
	Thu,  2 Feb 2023 03:33:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 02DBB20010;
	Thu,  2 Feb 2023 03:33:28 +0000 (UTC)
Message-ID: <38d7d022d6e88d643c8037e26707a719cb55ff1d.camel@perches.com>
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
From: Joe Perches <joe@perches.com>
To: "liaochang (A)" <liaochang1@huawei.com>, Conor Dooley
	 <conor.dooley@microchip.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	heiko.stuebner@vrull.eu, ajones@ventanamicro.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, jszhang@kernel.org, 
	vincent.chen@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Feb 2023 19:33:28 -0800
In-Reply-To: <f161df27-f2d7-0367-33a0-9ff5e4b880d9@huawei.com>
References: <20230129094242.282620-1-liaochang1@huawei.com>
	 <Y9fZ2ZxdMmXgO5aB@wendy> <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
	 <Y9o0Bv7VBM74ePHH@wendy> <f161df27-f2d7-0367-33a0-9ff5e4b880d9@huawei.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 02DBB20010
X-Stat-Signature: kqdcufit37jr4gn94rgi8udg8huhz5hp
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18bIU1jSvMh6AJHRm0Q4g5yth5TD5/ciRA=
X-HE-Tag: 1675308808-781017
X-HE-Meta: U2FsdGVkX1/e8lmauG6/WxAvOun5hiCOeoRKWJY/KDyYozD3YFRTRwrKnm25/U+dvIiLd9eUOyvjmQBdjz01ag==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_193337_585733_BA299F0C 
X-CRM114-Status: GOOD (  26.90  )
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

T24gVGh1LCAyMDIzLTAyLTAyIGF0IDA4OjUyICswODAwLCBsaWFvY2hhbmcgKEEpIHdyb3RlOgo+
IAo+IOWcqCAyMDIzLzIvMSAxNzo0MiwgQ29ub3IgRG9vbGV5IOWGmemBkzoKPiA+IEhpLAo+ID4g
Cj4gPiBPbiBXZWQsIEZlYiAwMSwgMjAyMyBhdCAwNTozNzoyNFBNICswODAwLCBsaWFvY2hhbmcg
KEEpIHdyb3RlOgo+ID4gPiDlnKggMjAyMy8xLzMwIDIyOjUzLCBDb25vciBEb29sZXkg5YaZ6YGT
Ogo+ID4gPiA+IE9uIFN1biwgSmFuIDI5LCAyMDIzIGF0IDA1OjQyOjQyUE0gKzA4MDAsIExpYW8g
Q2hhbmcgd3JvdGU6Cj4gPiA+ID4gPiBBZGQgaGVhZGVyIGluY2x1ZGUgZ3VhcmRzIHRvIGluc24u
aCB0byBwcmV2ZW50IHJlcGVhdGluZyBkZWNsYXJhdGlvbiBvZgo+ID4gPiA+ID4gYW55IGlkZW50
aWZpZXJzIGluIGluc24uaC4KPiA+ID4gPiAKPiA+ID4gPiBJJ20gY3VyaW91cywgZGlkIHlvdSBz
cG90IHRoaXMgImJ5IGhhbmQiIHdoaWxlIGRvaW5nIG90aGVyIHdvcmssIG9yIGRvCj4gPiA+ID4g
eW91IGhhdmUgYSB0b29sIHRoYXQgZm91bmQgaXQgZm9yIHlvdT8KPiA+ID4gCj4gPiA+IEkgZm91
bmQgdGhpcyAiYnkgaGFuZCIsIGluc3BpcmVkIGJ5IHNjcmlwdHMvY2hlY2tkZWNsYXJlcy5wbCwg
aSB3cml0ZSBhIHRpbnkgdG9vbAo+ID4gPiB0byBhbmFseXNlIHRoZSBtaXNzaW5nIGhlYWRlciBn
dWFyZHMgaW4gaGVhZGVyIGZpbGUuCj4gPiAKPiA+IE9oaCwgY29vbCEgSSdkIGxvdmUgdG8gYWRk
IHRoaXMgb25lIHRvIHRoZSBjaGVja3Mgb24gcGF0Y2h3b3JrIHNvIHRoYXQKPiA+IHdlIGRvIG5v
dCBlbmQgdXAgYWRkaW5nIGFueSBtb3JlIG9mIHRoZXNlLiBJZiB0aGlzIGlzIGJhc2VkIG9uCj4g
PiBjaGVja2RlY2xhcmVzLCBpcyBpdCBHUEx2Mj8KPiAKPiBEZWZpbml0ZWx5LCBpdCBpcyBHUEx2
MixpIHdpbGwgYXBwZW5kaW5nIGxpY2VuY2UgaWRlbnRpZmllciBhbmQgY29weXJpZ2h0IGluZm8g
bGF0ZXIuCj4gCj4gSGnvvIxASm9lIFBlcmNoZXMsIGlzIGl0IG9rIHRvIGludGVncmF0ZSB0aGlz
IHRvb2wgdG8gc2NyaXB0cz8KCkRvbid0IHNlZSB3aHkgbm90LgpQZXJoYXBzIHN1Ym1pdCBpdCBh
cyBhIHJlYWwgcGF0Y2ggdG8gQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KClRyaXZpYWwgbm90ZXMgYmVsb3c6Cgo+ID4gPiAjIS91c3IvYmluL2VudiBwZXJsCj4gPiA+
IHVzZSBzdHJpY3Q7Cj4gPiA+IAo+ID4gPiBzdWIgdXNhZ2Ugewo+ID4gPiAgICAgICAgIHByaW50
ICJVc2FnZTogY2hlY2tndWFyZHMucGwgZmlsZTEuaCAuLi5cbiI7Cj4gPiA+ICAgICAgICAgcHJp
bnQgIldhcm4gb2YgbWlzc2luZyBoZWFkZXIgZ3VhcmRzXG4iOwo+ID4gPiAgICAgICAgIGV4aXQg
MTsKPiA+ID4gfQo+ID4gPiAKPiA+ID4gaWYgKCQjQVJHViA8IDApIHsKPiA+ID4gICAgICAgICB1
c2FnZSgpOwo+ID4gPiB9Cj4gPiA+IAo+ID4gPiBmb3JlYWNoIG15ICRmaWxlIChAQVJHVikgewo+
ID4gPiAgICAgICAgIG9wZW4obXkgJGYsICc8JywgJGZpbGUpCj4gPiA+ICAgICAgICAgICAgIG9y
IGRpZSAiQ2Fubm90IG9wZW4gJGZpbGU6ICQhLlxuIjsKPiA+ID4gCj4gPiA+ICAgICAgICAgbXkg
JHNjYW5fYXJlYSA9IDE7Cj4gPiA+ICAgICAgICAgbXkgJGd1YXJkc193YXJuID0gMDsKPiA+ID4g
Cj4gPiA+ICAgICAgICAgIyBUaGUgbGluZXMgb2YgaGVhZGVyIGZpbGUgYXJlIGRpdmlkZWQgaW50
byBzZXZlcmFsIGFyZWFzIGFzIGZvbGxvd3M6Cj4gPiA+ICAgICAgICAgIwo+ID4gPiAgICAgICAg
ICMgLi4uIGFyZWExIC4uLgo+ID4gPiAgICAgICAgICMgI2lmbmRlZiBfSEVBREVSX0dVQVJECj4g
PiA+ICAgICAgICAgIyAuLi4gYXJlYTIgLi4uCj4gPiA+ICAgICAgICAgIyAjZGVmaW5lIF9IRUFE
RVJfR1VBUkQKPiA+ID4gICAgICAgICAjIC4uLiBhcmVhMyAuLi4KPiA+ID4gICAgICAgICAjICNl
bmRpZiAvKiBfSEVBREVSX0dVQVJEICovCj4gPiA+ICAgICAgICAgIyAuLi4gYXJlYTQgLi4uCj4g
PiA+ICAgICAgICAgIyBFT0YKPiA+ID4gICAgICAgICAjCj4gPiA+ICAgICAgICAgIyBJZiBhbnkg
c3RhdGVtZW50IGlzIGZvdW5kIGluIGFyZWExLCBhcmVhMiwgYW5kIGFyZWE0LCBpdAo+ID4gPiAg
ICAgICAgICMgdGhyb3dzIGEgd2FybmluZyBvZiBpbGxlZ2FsIHVzYWdlIG9mIGhlYWRlciBndWFy
ZCB1c2FnZS4KCk5vdCBpbGxlZ2FsLCBpbnZhbGlkCgo+ID4gPiAgICAgICAgIHdoaWxlICg8JGY+
KSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAobS9eKC4qKTtccyokL28pIHsKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCRzY2FuX2FyZWEgPT0gMSB8fCAkc2Nhbl9hcmVhID09
IDIgfHwgJHNjYW5fYXJlYSA9PSA0KSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKyskZ3VhcmRzX3dhcm47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+
ID4gICAgICAgICAgICAgICAgIH0gZWxzaWYgKG0vXlxzKigjaWZuZGVmXHMrKVthLXpBLVowLTlf
XSpfSFtfXSpccyokL28pIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKyskc2Nhbl9h
cmVhOwo+ID4gPiAgICAgICAgICAgICAgICAgfSBlbHNpZiAobS9eXHMqKCNkZWZpbmVccyspW2Et
ekEtWjAtOV9dKl9IW19dKlxzKiQvbykgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAr
KyRzY2FuX2FyZWE7Cj4gPiA+ICAgICAgICAgICAgICAgICB9IGVsc2lmIChtL15ccyooI2VuZGlm
KVxzKlwvXCpccypbYS16QS1aMC05X10qX0hbX10qXHMqXCpcL1xzKiQvbykgewo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICArKyRzY2FuX2FyZWE7Cj4gPiA+ICAgICAgICAgICAgICAgICB9
Cj4gPiA+ICAgICAgICAgfQo+ID4gPiAKPiA+ID4gICAgICAgICBjbG9zZSgkZik7Cj4gPiA+IAo+
ID4gPiAgICAgICAgIGlmICgkZ3VhcmRzX3dhcm4pIHsKPiA+ID4gICAgICAgICAgICAgICAgIHBy
aW50ICJJbGxlZ2FsIHVzYWdlIG9mIGhlYWRlciBndWFyZCBmb3VuZCBpbiAkZmlsZS5cbiI7Cgpo
ZXJlIHRvbwoKVGhlcmUgYXJlIGFsc28gdXNlcyBsaWtlICNpZiAhZGVmaW5lZChGT08pClRoZXJl
IGNhbiBiZSBzcGFjZXMgYmVmb3JlIGFuZCBhZnRlciB0aGUgIwoKSXQgbWlnaHQgYWxzbyBiZSB1
c2VmdWwgdG8gaGF2ZSBhIGNoZWNrIGZvciBtaXNzaW5nIGhlYWRlciBndWFyZHMuCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
