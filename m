Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987AAC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 03:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PH5dd/kpIYGUWl5aIRjTNKwDr4qUdZzTkk5rKsqtjA=; b=LZ7TcLuWKwdesd
	+hmqWBA+ZGDzvbic3+P529QTLaRN60vHqAZf2tDCNePoCTtFPrPlS3KHezopR3veM8EyvaxJtRXye
	Tn3ffpapp7CLuwaYICzkhSO5kpIqUmKrh6EjFx+M9DQrJCxNaeF9Mjchw+a1SKw63K8lBWkZmgadr
	PydPBe63d747qaGsjX6vTWvimD82RyTOmRJ5HwZo5Tq9XpBnsJ6R3u0RbgJniYBO2zVuSjRlGAZ64
	V5Q1Ev+TmtsNyCPUo1YkJ2mzHAZMuUEMk7Mjr3MHHAMGVssqj3eIWevBFX89BJHxSagM1M/2Zlfpt
	/yaLI5EUCrk26uwjXHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dye-000000074mP-1NVz;
	Wed, 23 Sep 2026 03:49:01 +0000
Received: from out-57.mta0.migadu.com ([2001:41d0:1004:224b::39] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dyb-000000074lo-2Bz9
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 03:48:58 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kwj1dykHmtOFPAs+8qWDVTWLL54NsScLQymUSN+v64I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790135333; v=1; x=1790740133;
 b=eGGSwrT1bfdsDebz6TCRNlnQKa0MDYDXCwWENpPCG1kHQM6ruG3wBZuS1aIYtY4cYC9gCtV7
 1u1XLvwiK1rR4YX+IuWb7mIIHrKa/WKLQbF2+P6IG7KhskfRyjuc8CuCbQ34mVZLxrocAcfefBv
 8u5L4QjGO8BHdCmWUWh1VxPk=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 09235456071ae306;
	Wed, 23 Sep 2026 03:48:53 +0000
X-Mizu-Trace-ID: 09235456071ae306
X-Migadu-Flow: FLOW_OUT
Message-ID: <97c0aabf-872d-46d7-bc98-ab50ea7035a0@linux.dev>
Date: Wed, 23 Sep 2026 11:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
 <arJw-VKQNxWA0RSc@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <arJw-VKQNxWA0RSc@milan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_204857_726631_99B3E47E 
X-CRM114-Status: GOOD (  22.12  )
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

CgrlnKggMjAyNi85LzIyIDIwOjEzLCBVbGFkemlzbGF1IFJlemtpIOWGmemBkzoKPiBPbiBNb24s
IFNlcCAyMSwgMjAyNiBhdCAwOToxNzoyM1BNICswODAwLCBZZSBMaXUgd3JvdGU6Cj4+IEZyb206
IFllIExpdSA8bGl1eWVAa3lsaW5vcy5jbj4KPj4KPj4gdm1hbGxvY19kdW1wX29iaigpIHVuY29u
ZGl0aW9uYWxseSBzZWFyY2hlcyBhbGwgdm1hcCBub2RlcyBldmVuIHdoZW4KPj4gY2FsbGVkIHdp
dGggYSBub24tdm1hbGxvYyBhZGRyZXNzIChlLmcuIGEgc2xhYiBvciBzdGFjayBwb2ludGVyIGZy
b20KPj4gbWVtX2R1bXBfb2JqKCkpLiAgQWRkIGFuIGlzX3ZtYWxsb2Nfb3JfbW9kdWxlX2FkZHIo
KSBjaGVjayBhdCB0aGUKPj4gZW50cnkgdG8gYXZvaWQgdGhlIHVubmVjZXNzYXJ5IHBlci1ub2Rl
IHRyeWxvY2sgYW5kIHJiLXRyZWUgdHJhdmVyc2FsLgo+Pgo+PiBVc2UgaXNfdm1hbGxvY19vcl9t
b2R1bGVfYWRkcigpIHJhdGhlciB0aGFuIGlzX3ZtYWxsb2NfYWRkcigpIGJlY2F1c2UKPj4gbW9k
dWxlLCBCUEYsIGFuZCBleGVjbWVtIGFsbG9jYXRpb25zIHJlc2lkZSBpbiBNT0RVTEVTX1ZBRERS
Li5NT0RVTEVTX0VORAo+PiBvbiB4ODZfNjQsIGFybTY0LCBhbmQgcmlzY3YgLS0gb3V0c2lkZSBW
TUFMTE9DX1NUQVJULi5WTUFMTE9DX0VORCAtLSBidXQKPj4gYXJlIHN0aWxsIHRyYWNrZWQgaW4g
dGhlIHNhbWUgdm1hcF9ub2RlcyByYi10cmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZZSBMaXUg
PGxpdXllQGt5bGlub3MuY24+Cj4+IC0tLQo+PiAgbW0vdm1hbGxvYy5jIHwgMyArKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL21tL3ZtYWxs
b2MuYyBiL21tL3ZtYWxsb2MuYwo+PiBpbmRleCAzMGM2MTBmNjc4ZGMuLmQ4MDk1YjU1ODM2NSAx
MDA2NDQKPj4gLS0tIGEvbW0vdm1hbGxvYy5jCj4+ICsrKyBiL21tL3ZtYWxsb2MuYwo+PiBAQCAt
NTI3Nyw2ICs1Mjc3LDkgQEAgYm9vbCB2bWFsbG9jX2R1bXBfb2JqKHZvaWQgKm9iamVjdCkKPj4g
IAl1bnNpZ25lZCBsb25nIGFkZHI7Cj4+ICAJdW5zaWduZWQgbG9uZyBucl9wYWdlczsKPj4gIAo+
PiArCWlmICghaXNfdm1hbGxvY19vcl9tb2R1bGVfYWRkcihvYmplY3QpKQo+PiArCQlyZXR1cm4g
ZmFsc2U7Cj4+ICsKPj4gIAlhZGRyID0gUEFHRV9BTElHTl9ET1dOKCh1bnNpZ25lZCBsb25nKSBv
YmplY3QpOwo+PiAgCj4+ICAJLyoKPj4KPj4gLS0gCj4+IDIuMjUuMQo+Pgo+IERvIHdlIG5lZWQg
dGhpcyBjaGVjaz8gSWYgaXQgaXMgbm90IHRoZSB2bWFsbG9jIGFkZHJlc3MsIHdlIGp1c3QgcmV0
dXJuCj4gbm90aW5nLiBBbm90aGVyIHF1ZXN0aW9uIGlzIHdoeSBkbyB5b3Ugd2FudCBpc192bWFs
bG9jX29yX21vZHVsZV9hZGRyKCk/Cj4gCj4gdm1hbGxvY19kdW1wX29iaigpIGlzIGFib3V0IFZN
QUxMT0NfU1RBUlQuLlZNQUxMT0NfRU5ELCBJTU8uCj4gCj4gVGhlcmUgYXJlIG9ubHkgdHdvIHVz
ZXJzIG9mIGl0IGFuZCBib3RoIHJlbHkgb24gdGhlIFZNQUxMT0NfU1RBUlQuLlZNQUxMT0NfRU5E
Cj4gcmFuZ2U6Cj4gCj4gPHNuaXA+Cj4gKioqIG1tL2thc2FuL3JlcG9ydC5jOgo+IHByaW50X2Fk
ZHJlc3NfZGVzY3JpcHRpb25bNDAzXSBpZiAoIXZtYWxsb2NfZHVtcF9vYmooYWRkcikpCj4gCj4g
KioqIG1tL3V0aWwuYzoKPiBtZW1fZHVtcF9vYmpbMTA5Nl0gICAgICAgICAgICAgaWYgKHZtYWxs
b2NfZHVtcF9vYmoob2JqZWN0KSkKPiA8c25pcD4KPiAKPiAJaWYgKGlzX3ZtYWxsb2NfYWRkcihh
ZGRyKSkgewo+IAkJcHJfZXJyKCJUaGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRvIGEiKTsKPiAJ
CWlmICghdm1hbGxvY19kdW1wX29iaihhZGRyKSkKPiAJCQlwcl9jb250KCIgdm1hbGxvYyB2aXJ0
dWFsIG1hcHBpbmdcbiIpOwo+IAkJcGFnZSA9IHZtYWxsb2NfdG9fcGFnZShhZGRyKTsKPiAJfQo+
IAo+IGFuZAo+IAo+IDxzbmlwPgo+IAlpZiAodm1hbGxvY19kdW1wX29iaihvYmplY3QpKQo+IAkJ
cmV0dXJuOwo+IAo+IAlpZiAoaXNfdm1hbGxvY19hZGRyKG9iamVjdCkpCj4gCQl0eXBlID0gInZt
YWxsb2MgbWVtb3J5IjsKPiA8c25pcD4KPiAKPiAtLQo+IFVsYWR6aXNsYXUgUmV6a2kKSGkgVWxh
ZHppc2xhdSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCllvdSdyZSByaWdodCB0aGF0IHRoZSBjaGVjayBpcyBub3Qg
bmVjZXNzYXJ5IOKAlCB3aXRob3V0IGl0LCAgICAgICAgICAgIAp2bWFsbG9jX2R1bXBfb2JqKCkg
anVzdCByZXR1cm5zIGZhbHNlIGZvciBub24tdm1hbGxvYyBhZGRyZXNzZXMgYWZ0ZXIgCnNlYXJj
aGluZyB0aGUgcmItdHJlZSwgd2hpY2ggaXMgZmluZSBmb3IgYSBkZWJ1ZyBwYXRoLiAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIApSZWdhcmRpbmcgaXNfdm1hbGxvY19vcl9tb2R1bGVfYWRk
cigpOiB0aGUgY29uY2VybiB3YXMgdGhhdCBtb2R1bGUvQlBGCmFsbG9jYXRpb25zIGFyZSBhbHNv
IHRyYWNrZWQgaW4gdm1hcF9ub2RlcyByYi10cmVlICh0aGV5IGdvIHRocm91Z2ggICAKX192bWFs
bG9jX25vZGVfcmFuZ2Ugd2l0aCBNT0RVTEVTX1ZBRERSLi5NT0RVTEVTX0VORCksIHNvICAgICAg
ICAgICAgIAppc192bWFsbG9jX2FkZHIoKSB3b3VsZCBmaWx0ZXIgdGhlbSBvdXQuICBCdXQgSSBh
Z3JlZSB0aGF0ICAgICAgICAgICAgCnZtYWxsb2NfZHVtcF9vYmooKSBpcyBhYm91dCBWTUFMTE9D
X1NUQVJULi5WTUFMTE9DX0VORCwgYW5kIGJvdGggICAgICAKY2FsbGVycyBhbHJlYWR5IHVzZSBp
c192bWFsbG9jX2FkZHIoKSBpbiB0aGVpciBsb2dpYy4gICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCkkgd2lsbCBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB2My4gIFRoZSBzZXJpZXMgd2lsbCBi
ZSB0d28gcGF0Y2hlczogdGhlICAKYWxpZ25tZW50IGZpeCBhbmQgdGhlIGNyb3NzLXpvbmUgbG9v
a3VwIGZpeCB3aXRoIHRoZSBzaGFyZWQgICAgICAgICAgIApmaW5kX3ZtYXBfYXJlYV9sb2NrKCkg
aGVscGVyLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCgotLSAKVGhh
bmtzLApZZSBMaXUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
