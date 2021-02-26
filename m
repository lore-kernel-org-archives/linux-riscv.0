Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862F0C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 05:32:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA91664E60
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 05:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA91664E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=EETIvfaV+He5fioBErkidgU9EJGDZh+QnqoRzaQA03w=; b=CSYRDT3nHMMHiMif5SGZZ0Wu1
	a1Bro1AhZEoJPcj/yGGyZ67VrQOIqfEj9kO172A/Tl8oJ+33TJ6bEGL2Y10c7+eMzhrBsiuoC7TVj
	LXj6VZcpnd0VhefCHb+RYTn4ykziYaEnueA077ycFbiQgmk2SCd+AO7W9QDU/LfjVBG3ZXXWYvdxi
	f6n5CQNwbmUzxpOaQA46OAmNmKZXUkl8ExJoOBe+5g52hFbOobB3UoRnYPZ73BivLtCEh87pFeOZm
	AA6IdU1cbWqn+Sjam2BLTndvga6pUQ+qG1tqSz4r4EtCHHwVBWnJTdraOX1q/l9sHvfg2WQWb4Ni9
	tB5uPZqXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFVje-0000MT-RH; Fri, 26 Feb 2021 05:32:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFVjb-0000M1-DX
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 05:32:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id l7so1297385pfd.3
 for <linux-riscv@lists.infradead.org>; Thu, 25 Feb 2021 21:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nFi/Tly9ElESGJN8oskhUGGfZDgsnBKdYL375bNbXVw=;
 b=JioBCib/pjgVwCE+1j1L7J+4tfJ9rsxj0xJ7mNV1d3h4lgyYYI+qXuyqmqRt0Xwh0d
 jvgqMIUemTP1Lxdkok+irPUbY9vjvRqFh+xYTMJ75GlhbbNR7oUGVVKPAP6Oby4RBv44
 e9iDymH6Ev2uwlY4gCPNa2O1KttsCUTEVQRd7C51U3UXZIw+THXC64dshlRia/zQiwAt
 16lxLPURQRa2lGSL7pgl7PG6TBPphwj0yQrJAaxEAyfpQA49h9OUNuOT0Y2dgs+UgJG0
 qu7gjTDhzUNgfSBeOZg8lZclZzq88UQCur3Dxm3QBLH3KzhgKAYv0i085XeC2lFzpUWX
 W4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nFi/Tly9ElESGJN8oskhUGGfZDgsnBKdYL375bNbXVw=;
 b=jiRmdJ+JRXXuVpJbqs03KMwryf/jGGF1WvyuxpVVJFoiHz5xUIqXUoRDIHsEaP4rNd
 tXEox/CijX62qsW7riD1W4q7xP4G3hAX8TlNXoDsRsvrTVRQqUqZ1wUIoAaKjfZO/Z8b
 Yzm4O8yrQ18EpRPO+lUyLi/gsJf84F6ZSOZI6UN66kgbO7WCQgIQHc9fqdTstTEdkuJP
 Sg51PUHaovGgQ0PgNLws1HfZ48ZVIe2LNdwVeOBpCx1idFnFFu70F9+C9fG/6pzy+QHe
 AZIGS0QHegh7jr8ArO4qmb0wATZF5UUNdfrQDwh6EeGZbg/bIdv10ZsjqYOoiQx4NOPF
 7dyA==
X-Gm-Message-State: AOAM532MKEtJyIF0phkG0gQA373WvSLc5h9/SldQ2KH5bbZxaeH4srnk
 1pJ+kPv7mALESbgwbN7IxWpbpw==
X-Google-Smtp-Source: ABdhPJzqqNWI8LPb+RbI+afEQbemNqMMfrtDVHxnRHynUOPZCKSmIemE8l7c3ZOEysW+aIpylADAKA==
X-Received: by 2002:aa7:85cf:0:b029:1ee:8ae:533a with SMTP id
 z15-20020aa785cf0000b02901ee08ae533amr1486354pfn.30.1614317531108; 
 Thu, 25 Feb 2021 21:32:11 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v185sm7960624pfb.125.2021.02.25.21.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 21:32:10 -0800 (PST)
Date: Thu, 25 Feb 2021 21:32:10 -0800 (PST)
X-Google-Original-Date: Thu, 25 Feb 2021 21:31:51 PST (-0800)
Subject: Re: [PATCH] riscv: Add KASAN_VMALLOC support
In-Reply-To: <bdef5309-03dd-6c0b-7d0c-9dd036ceae95@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-ea9a6037-0f18-41d5-8c01-6c16b14b6a63@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_003215_631711_8D428F6E 
X-CRM114-Status: GOOD (  24.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, nylon7@andestech.com, glider@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNCBGZWIgMjAyMSAyMzo0ODoxMyBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSAyLzI1LzIxIMOgIDI6NDIgQU0sIEFsZXhhbmRyZSBHaGl0aSBhIMOpY3JpdMKg
Ogo+PiBQb3B1bGF0ZSB0aGUgdG9wLWxldmVsIG9mIHRoZSBrZXJuZWwgcGFnZSB0YWJsZSB0byBp
bXBsZW1lbnQgS0FTQU5fVk1BTExPQywKPj4gbG93ZXIgbGV2ZWxzIGFyZSBmaWxsZWQgZHluYW1p
Y2FsbHkgdXBvbiBtZW1vcnkgYWxsb2NhdGlvbiBhdCBydW50aW1lLgo+Pgo+PiBDby1kZXZlbG9w
ZWQtYnk6IE55bG9uIENoZW4gPG55bG9uN0BhbmRlc3RlY2guY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBOeWxvbiBDaGVuIDxueWxvbjdAYW5kZXN0ZWNoLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBO
aWNrIEh1IDxuaWNraHVAYW5kZXN0ZWNoLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8
bmlja2h1QGFuZGVzdGVjaC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleEBnaGl0aS5mcj4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgfCAg
MSArCj4+ICAgYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmMgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IDhlYWRkMWNiZDUyNC4uMzgzMmE1MzdjNWQ2IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCj4+IEBAIC01Nyw2ICs1Nyw3IEBAIGNvbmZpZyBSSVNDVgo+PiAgIAlzZWxlY3QgSEFWRV9B
UkNIX0pVTVBfTEFCRUwKPj4gICAJc2VsZWN0IEhBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZF
Cj4+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4gaWYgTU1VICYmIDY0QklUCj4+ICsJc2VsZWN0
IEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DIGlmIE1NVSAmJiA2NEJJVAo+PiAgIAlzZWxlY3QgSEFW
RV9BUkNIX0tHREIKPj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LR0RCX1FYRkVSX1BLVAo+PiAgIAlz
ZWxlY3QgSEFWRV9BUkNIX01NQVBfUk5EX0JJVFMgaWYgTU1VCj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL2thc2FuX2luaXQuYyBiL2FyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jCj4+IGlu
ZGV4IDcxOWI2ZTRkNjA3NS4uMTcxNTY5ZGY0MzM0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2thc2FuX2luaXQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYwo+PiBA
QCAtMTQyLDYgKzE0MiwzMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5fcG9wdWxhdGUodm9p
ZCAqc3RhcnQsIHZvaWQgKmVuZCkKPj4gICAJbWVtc2V0KHN0YXJ0LCBLQVNBTl9TSEFET1dfSU5J
VCwgZW5kIC0gc3RhcnQpOwo+PiAgIH0KPj4KPj4gK3ZvaWQgX19pbml0IGthc2FuX3NoYWxsb3df
cG9wdWxhdGVfcGdkKHVuc2lnbmVkIGxvbmcgdmFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kKQo+PiAr
ewo+PiArCXVuc2lnbmVkIGxvbmcgbmV4dDsKPj4gKwl2b2lkICpwOwo+PiArCXBnZF90ICpwZ2Rf
ayA9IHBnZF9vZmZzZXRfayh2YWRkcik7Cj4+ICsKPj4gKwlkbyB7Cj4+ICsJCW5leHQgPSBwZ2Rf
YWRkcl9lbmQodmFkZHIsIGVuZCk7Cj4+ICsJCWlmIChwZ2RfcGFnZV92YWRkcigqcGdkX2spID09
ICh1bnNpZ25lZCBsb25nKWxtX2FsaWFzKGthc2FuX2Vhcmx5X3NoYWRvd19wbWQpKSB7Cj4+ICsJ
CQlwID0gbWVtYmxvY2tfYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwo+PiArCQkJc2V0X3Bn
ZChwZ2RfaywgcGZuX3BnZChQRk5fRE9XTihfX3BhKHApKSwgUEFHRV9UQUJMRSkpOwo+PiArCQl9
Cj4+ICsJfSB3aGlsZSAocGdkX2srKywgdmFkZHIgPSBuZXh0LCB2YWRkciAhPSBlbmQpOwo+PiAr
fQo+PiArCj4+ICt2b2lkIF9faW5pdCBrYXNhbl9zaGFsbG93X3BvcHVsYXRlKHZvaWQgKnN0YXJ0
LCB2b2lkICplbmQpCj4+ICt7Cj4+ICsJdW5zaWduZWQgbG9uZyB2YWRkciA9ICh1bnNpZ25lZCBs
b25nKXN0YXJ0ICYgUEFHRV9NQVNLOwo+PiArCXVuc2lnbmVkIGxvbmcgdmVuZCA9IFBBR0VfQUxJ
R04oKHVuc2lnbmVkIGxvbmcpZW5kKTsKPj4gKwo+PiArCWthc2FuX3NoYWxsb3dfcG9wdWxhdGVf
cGdkKHZhZGRyLCB2ZW5kKTsKPj4gKwo+PiArCWxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPj4gK30K
Pj4gKwo+PiAgIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPj4gICB7Cj4+ICAgCXBoeXNf
YWRkcl90IF9zdGFydCwgX2VuZDsKPj4gQEAgLTE0OSw3ICsxNzQsMTUgQEAgdm9pZCBfX2luaXQg
a2FzYW5faW5pdCh2b2lkKQo+Pgo+PiAgIAlrYXNhbl9wb3B1bGF0ZV9lYXJseV9zaGFkb3coKHZv
aWQgKilLQVNBTl9TSEFET1dfU1RBUlQsCj4+ICAgCQkJCSAgICAodm9pZCAqKWthc2FuX21lbV90
b19zaGFkb3coKHZvaWQgKikKPj4gLQkJCQkJCQkJVk1BTExPQ19FTkQpKTsKPj4gKwkJCQkJCQkJ
Vk1FTU1BUF9FTkQpKTsKPj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fVk1BTExPQykp
Cj4+ICsJCWthc2FuX3NoYWxsb3dfcG9wdWxhdGUoCj4+ICsJCQkodm9pZCAqKWthc2FuX21lbV90
b19zaGFkb3coKHZvaWQgKilWTUFMTE9DX1NUQVJUKSwKPj4gKwkJCSh2b2lkICopa2FzYW5fbWVt
X3RvX3NoYWRvdygodm9pZCAqKVZNQUxMT0NfRU5EKSk7Cj4+ICsJZWxzZQo+PiArCQlrYXNhbl9w
b3B1bGF0ZV9lYXJseV9zaGFkb3coCj4+ICsJCQkodm9pZCAqKWthc2FuX21lbV90b19zaGFkb3co
KHZvaWQgKilWTUFMTE9DX1NUQVJUKSwKPj4gKwkJCSh2b2lkICopa2FzYW5fbWVtX3RvX3NoYWRv
dygodm9pZCAqKVZNQUxMT0NfRU5EKSk7Cj4+Cj4+ICAgCWZvcl9lYWNoX21lbV9yYW5nZShpLCAm
X3N0YXJ0LCAmX2VuZCkgewo+PiAgIAkJdm9pZCAqc3RhcnQgPSAodm9pZCAqKV9zdGFydDsKPj4K
Pgo+IFBhbG1lciwgdGhpcyBjb21taXQgc2hvdWxkIHJlcGxhY2UgKGlmIGV2ZXJ5b25lIGFncmVl
cykgTnlsb24gYW5kIE5pY2sncwo+IENvbW1pdCBlMTc4ZDY3MGYyNTEgKCJyaXNjdi9rYXNhbjog
YWRkIEtBU0FOX1ZNQUxMT0Mgc3VwcG9ydCIpIHRoYXQgaXMKPiBhbHJlYWR5IGluIGZvci1uZXh0
LgoKU29ycnksIGJ1dCBpdCdzIHdheSB0b28gbGF0ZSB0byBiZSByZWJhc2luZyB0aGluZ3MuICBJ
IGNhbiBnZXQgdHJ5aW5nIHRvIGhhdmUKdGhlIGhpc3RvcnkgY2xlYW4sIGJ1dCBpbiB0aGlzIGNh
c2Ugd2UncmUgYmV0dGVyIG9mZiBoYXZpbmcgdGhpcyBhcyBhbiBleHBsaWNpdApmaXggcGF0Y2gg
LS0gY2hhbmdpbmcgaGFzaGVzIHRoaXMgbGF0ZSBpbiB0aGUgcHJvY2VzcyBtZXNzZXMgd2l0aCBh
bGwgdGhlCnRlc3RpbmcuCgpJJ20gbm90IHN1cmUgd2hhdCB0aGUgaXNzdWUgYWN0dWFsbHkgaXMs
IHNvIGl0J2QgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIHNlbmQgdGhlCmZpeCBwYXRjaC4gIElmIG5v
dCB0aGVuIExNSyBhbmQgSSdsbCB0cnkgdG8gZmlndXJlIG91dCB3aGF0J3MgZ29pbmcgb24uICBF
aXRoZXIKd2F5LCBoYXZpbmcgdGhlIGZpeCB3aWxsIG1ha2Ugc3VyZSB0aGlzIGdldHMgdGVzdGVk
IHByb3Blcmx5IGFzIHdoYXRldmVyJ3MKZ29pbmcgb24gaXNuJ3QgZmFpbGluZyBmb3IgbWUuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
