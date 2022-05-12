Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853D9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 02:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZBkIMRWpJbccgDqyFP+WgnhHX3w5j0unSTwqUr5Ugo=; b=Il/W/qDu3YT4RUw6DJ7PvRvJw5
	Ckwlhh7i43Dt3X3x+zUMUTio4Vni9Gj8RRoYNdNrmhiMNMB0a+2ts77gae8GHYevm3pkO3rInO4Xx
	Rvd+3ibcCI4SzhTx/HPjwik3A8jmdUndtWdG9pFfP1tdOo15eovGH9PMYNHKtEhLy1h/Ttyh090EA
	MBTVVHHGG0cqlEfGOKpWy1b5apzj425/kfGqCpmIlh+xO/E8UKgYm3mK/jJ+jL/MZeMGpvuVBqw1k
	wagzylQnZGd/YIeXnEVHFGk+1agtws9mMXSKjs48fS+fHbpHkACzXL8E8QI05b/Kq3RYUZuDAwplx
	GvyEMIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyuE-009alQ-V3; Thu, 12 May 2022 02:50:22 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyuA-009ajo-Gk
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 02:50:21 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=19; SR=0;
 TI=SMTPD_---0VCypSA6_1652323800; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VCypSA6_1652323800) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 12 May 2022 10:50:02 +0800
Subject: Re: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, anup@brainfault.org, wangkefeng.wang@huawei.com,
 rppt@kernel.org, alex@ghiti.fr, twd2.me@gmail.com, david@redhat.com,
 seanjc@google.com, petr.pavlu@suse.com, atishp@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, jianghuaming.jhm@alibaba-inc.com,
 huanyi.xj@alibaba-inc.com
References: <20220511111851.559684-1-xianting.tian@linux.alibaba.com>
 <c794b22ed0e91356e2c1a39849a4b893@mailhost.ics.forth.gr>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <de0fb09f-b966-5c42-7ac6-a68fbff2abad@linux.alibaba.com>
Date: Thu, 12 May 2022 10:50:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c794b22ed0e91356e2c1a39849a4b893@mailhost.ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_195018_761424_12D74F07 
X-CRM114-Status: GOOD (  37.36  )
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

CuWcqCAyMDIyLzUvMTIg5LiK5Y2IMTA6MzIsIE5pY2sgS29zc2lmaWRpcyDlhpnpgZM6Cj4gSGVs
bG8gWGlhbnRpbmcsCj4KPj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDIg
Ky0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zZXR1cC5jCj4+IGluZGV4IDgzNGViNjUyYTdiOS4uNzFmMjk2NmIxNDc0IDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NldHVwLmMKPj4gQEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5p
dF9yZXNvdXJjZXModm9pZCkKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkobWVt
YmxvY2tfaXNfbm9tYXAocmVnaW9uKSkpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
cy0+bmFtZSA9ICJSZXNlcnZlZCI7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+Zmxh
Z3MgPSBJT1JFU09VUkNFX01FTSB8IElPUkVTT1VSQ0VfQlVTWTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOwo+PiDCoMKgwqDCoMKgwqDCoMKg
IH0gZWxzZSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPm5hbWUgPSAiU3lzdGVt
IFJBTSI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPmZsYWdzID0gSU9SRVNPVVJD
RV9TWVNURU1fUkFNIHwgSU9SRVNPVVJDRV9CVVNZOwo+Cj4gVGhlIHNob3J0IHN0b3J5Ogo+Cj4g
VGhpcyBtYWtlcyBzZW5zZSBidXQgd2Ugc2hvdWxkIGF0IGxlYXN0IG1hcmsgdGhlbSBhcyAKPiBJ
T1JFU09VUkNFX0VYQ0xVU0lWRSwgYW5kIGFsc28gcmVtb3ZlIElPUkVTT1VSQ0VfQlVTWSBmcm9t
IGxpbmUgMTkyIAo+IGFib3ZlIAo+IChodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4xOC1yYzYvc291cmNlL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMjTDE5MikuClRoYW5rcyBO
aWNrIGZvciB0aGUgZGV0YWlsZWQgcmVwbHksIEkgd2lsbCBzZW50IFYyIHBhdGNoIHNvb24gYWNj
b3JkaW5nIAp0byB5b3VyIHN1Z2dlc3Rpb24uCj4KPiBUaGUgbG9uZyBzdG9yeToKPgo+IFRoZSBz
cGVjIHNheXMgYWJvdXQgbm8tbWFwOgo+Cj4gIgo+IEluZGljYXRlcyB0aGUgb3BlcmF0aW5nIHN5
c3RlbSBtdXN0IG5vdCBjcmVhdGUgYSB2aXJ0dWFsIG1hcHBpbmcKPiBvZiB0aGUgcmVnaW9uIGFz
IHBhcnQgb2YgaXRzIHN0YW5kYXJkIG1hcHBpbmcgb2Ygc3lzdGVtIG1lbW9yeSwKPiBub3IgcGVy
bWl0IHNwZWN1bGF0aXZlIGFjY2VzcyB0byBpdCB1bmRlciBhbnkgY2lyY3Vtc3RhbmNlcyBvdGhl
cgo+IHRoYW4gdW5kZXIgdGhlIGNvbnRyb2wgb2YgdGhlIGRldmljZSBkcml2ZXIgdXNpbmcgdGhl
IHJlZ2lvbi4KPiAiCj4KPiBJdCBiYXNpY2FsbHkgc2F5cyB0aGF0IG9ubHkgdGhlIGRyaXZlciB0
aGF0IHVzZXMgdGhlIHJlZ2lvbiBzaG91bGQgYmUgCj4gYWJsZSB0byBjcmVhdGUgbWFwcGluZ3Mg
Zm9yIGl0IGFuZCBhY2Nlc3MgaXQsIGFuZCBldmVuIHRoYXQgaXMgbm90IAo+IGVub3VnaCB0byBw
cmV2ZW50IHNwZWN1bGF0aXZlIGFjY2VzcyB0byB0aGUgcmVnaW9uIGJ5IHNvbWVvbmUgb3RoZXIg
Cj4gdGhhbiB0aGUgZHJpdmVyLiBUaGUgdGhpbmcgaXMgd2UgY2FuJ3QgaW1wbGVtZW50IHRoaXMg
aW4gYSBzaW1wbGUgd2F5IAo+IGJlY2F1c2UgLXRvIGJlZ2luIHdpdGgtIHdlIGRvbid0IGhhdmUg
YSB3YXkgdG8gcGluIHRob3NlIHJlZ2lvbnMgdG8gCj4gc3BlY2lmaWMgZGV2aWNlcy9kcml2ZXJz
LCB0aGUgbWVtb3J5LXJlZ2lvbiBiaW5kaW5nIGRvZXNuJ3Qgc2F5IAo+IGFueXRoaW5nIGFib3V0
IHRoYXQuIFdoZW4gdXNpbmcgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdGhlIGZpcnN0IAo+IGRy
aXZlciB0byBjbGFpbSB0aGUgcmVzb3VyY2Ugd2lsbCBtYXJrIGl0IGFzIGJ1c3kgc28gb3RoZXIg
ZHJpdmVycyAKPiB1c2luZyB0aGUgc2FtZSBhcGkgd29uJ3QgYmUgYWJsZSB0byB1c2UgaXQsIGhv
d2V2ZXIgdGhlIHJlZ2lvbiBjYW4gCj4gc3RpbGwgYmUgbWFwcGVkIGluIG90aGVyIHdheXMgKGUu
Zy4gdGhyb3VnaCBpb3JlbWFwIGRpcmVjdGx5KSBzbyB1c2luZyAKPiB0aGUgcmVzb3VyY2UgdHJl
ZSB0byB0cmFjay9wcm90ZWN0IHRoZSByZWdpb25zIG1hcmtlZCB3aXRoIG5vLW1hcCAKPiBpc24n
dCBlbm91Z2guIFRoZXkgY2FuIGV2ZW4gYmUgYWNjZXNzZWQgZnJvbSB1c2Vyc3BhY2UgdGhyb3Vn
aCAKPiAvZGV2L21lbSB1bmxlc3Mgd2UgYWRkIHRoZW0gdG8gdGhlIHJlc291cmNlIHRyZWUgYXMg
SU9SRVNPVVJDRV9NRU0gYW5kIAo+IGVuYWJsZS9zZXQgQ09ORklHX0lPX1NUUklDVF9ERVZNRU0v
aW9tZW09c3RyaWN0LCBidXQgZXZlbiB0aGVuIGluIGNhc2UgCj4gdGhlIGNvcnJlc3BvbmRpbmcg
aW9yZXNvdXJjZSBpc24ndCBidXN5IChlLmcuIGhhc24ndCBiZWVuIGNsYWltZWQgYnkgYSAKPiBk
cml2ZXIgeWV0IHRocm91Z2ggZGV2bV9pb3JlbWFwX3Jlc291cmNlKSB3ZSBzdGlsbCBoYXZlIHRv
IG1hcmsgdGhlbSAKPiBhcyBJT1JFU09VUkNFX0VYQ0xVU0lWRSBmb3IgaW9tZW1faXNfZXhjbHVz
aXZlKCkgdG8gZG8gdGhlIHRyaWNrIAo+IChodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92NS4xOC1yYzYvc291cmNlL2tlcm5lbC9yZXNvdXJjZS5jI0wxNzM5KSAKPiBhbmQgcHJldmVu
dCBhY2Nlc3MgdGhyb3VnaCAvZGV2L21lbS4KPgo+IEZpbmFsbHkgdGhlIGRlZmluaXRpb24gb2Yg
bm8tbWFwIGFuZCB0aGUgZGVmaW5pdGlvbiBvZiBNRU1CTE9DS19OT01BUCAKPiBhcmUgbm90IHRo
ZSBzYW1lLCBhbGwgTUVNQkxPQ0tfTk9NQVAgc2F5cyBpcyAiZG9uJ3QgYWRkIHRvIGtlcm5lbCAK
PiBkaXJlY3QgbWFwcGluZyIgc28gaW9yZW1hcCB0aGF0IHVzZXMgdm1hbGxvYyBjYW4gc3RpbGwg
YmUgdXNlZCBieSAKPiBldmVyeW9uZSwgaW4gZ2VuZXJhbCBpdCdzIGEgbWVzcy4gSXQgYmVjb21l
cyB3b3JzZSwgaWYgeW91IG1hcmsgYSAKPiByZXNlcnZlZC1tZW1vcnkgcmVnaW9uIHdpdGggbm8t
bWFwIGFuZCB0aGF0IHJlZ2lvbiBvdmVybGFwcyB3aXRoIAo+IC9tZW1vcnksIGVhcmx5X2luaXRf
ZHRfcmVzZXJ2ZV9tZW1vcnlfYXJjaCgpIHdpbGwgaXNvbGF0ZSBpdCwgbWFyayBpdCAKPiBhcyBN
RU1CTE9DS19OT01BUCBhbmQgd29uJ3QgYWRkIGl0IHRvIG1lbWJsb2NrLnJlc2VydmVkLCBpZiBp
dCBkb2Vzbid0IAo+IG92ZXJsYXAgaXQgd2lsbCBqdXN0IGlnbm9yZSBpdCBhbmQgc3RpbGwgbm90
IGFkZCBpdCB0byAKPiBtZW1ibG9jay5yZXNlcnZlZC4gU28gaWYgd2Ugd2FudCB0byBhZGQgYSBy
ZXNlcnZlZC1tZW1vcnkgcmVnaW9uIHRoYXQgCj4gZG9lc24ndCBvdmVybGFwIHdpdGggL21lbW9y
eSAoYSB2YWxpZCBzY2VuYXJpbyBhbGxvd2VkIGJ5IHRoZSAKPiBiaW5kaW5nKSwgdGhlcmUgaXMg
bm8gd2F5IHRvIG1hcmsgaXQgd2l0aCBuby1tYXAuCj4KPiBXaGVuIEkgd3JvdGUgdGhhdCBjb2Rl
IEkgd2FzIGxvb2tpbmcgZm9yIGEgd2F5IHRvIHByZXZlbnQgYWNjZXNzIHRvIAo+IHJlc2VydmVk
IHJlZ2lvbnMgdGhyb3VnaCAvZGV2L21lbSBhbmQgYnkgb3RoZXIgZHJpdmVycywgcmVnYXJkbGVz
cyBvZiAKPiBiZWluZyBwYXJ0IG9mIC9tZW1vcnkgb3Igbm90LCBhbmQgc2luY2UgSSBjb3VsZG4n
dCBtYXJrIHRoZW0gd2l0aCAKPiBuby1tYXAgdG8gdHJhY2sgdGhlbSBiZWNhdXNlIG9mIGVhcmx5
X2luaXRfZHRfcmVzZXJ2ZV9tZW1vcnlfYXJjaCgpLCBJIAo+IG1hcmtlZCB0aGVtIGFzIGJ1c3kg
YW5kIHRoZW4gdXNlZCB0aGVtIGZyb20gdGhlIGRyaXZlciB3aXRoIGlvcmVtYXAgCj4gZGlyZWN0
bHkuIEl0IHdhcyBhIHRlbXBvcmFyeSBtZWFzdXJlIHVudGlsIEkgaGFkIGEgYmV0dGVyIGFwcHJv
YWNoIAo+IChlLmcuIG92ZXJyaWRlIGlvcmVtYXAgLyBkZXZtZW1faXNfYWxsb3dlZCBsaWtlIG90
aGVyIGFyY2hzIGRvKSBidXQgSSAKPiBuZXZlciBnb3QgdGhlIHRpbWUgdG8gZmluaXNoIGl0LCBz
b3JyeSBmb3IgdGhlIG1lc3MgIQo+Cj4gUmVnYXJkcywKPiBOaWNrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
