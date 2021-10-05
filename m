Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28C3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 01:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4DD6154B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 01:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C4DD6154B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+aoGNLB8haHCrZqgptwKbKHZJeHOcmDveGqsPB/DVy4=; b=sKmwpl/Ubzkat82Mx6J8WG150d
	WPzipwXDCflx1bNQ+FfMaFbG0HNvc7b8NWUaam156vYtENm6BZAWQBa8rHmotoG19hvdX1EcL8dxK
	uaLdrjDIZWNn9sie57be2BNrPF9MVMK9zljMLSQHwOSwXEAnQmqoHD+TB0t747fPLqFR5hfHCx8gd
	90eDJzJFem3HDNmJu2tbH7mne4TCmgdQjfoawqXjlKBXBs/nHWzWUImN64sWjbyTH+0DvNti9wvxl
	PpOBdQK1CJNgSg78EaxUcgJoo9zKyP6iIhDMBv4vFVqJvOICBAM9+LxQ61vi9tybL7mtsgWlDHQsR
	kXo34cEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYsc-008Waw-Pt; Tue, 05 Oct 2021 01:04:26 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYsZ-008WaT-LA
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 01:04:25 +0000
Received: by mail-qk1-x72a.google.com with SMTP id q81so1558616qke.5
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 18:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oebmTSxmq+zU8Utjs0yaAqanKgzPEsj+GJBxRd8logo=;
 b=V2iUDB19iERQnJXZioGUMJdM/uynjFuRplbo7a5cEjDjxHwD2V8DwueeGPziYpbB71
 Bi9liJ6HB2HHZX6lxu+oHLksFzHeBVlU+X0Nd6OowCRe7v7npgTonODB4rqmB3qVEqw/
 jPGpQidXVV8GXapY/RU2rL3Fyjj1axEjXQnoedoWQNonB6JXkWMVrpKM+o5p3m0Ycs2Q
 nkodGtZjkgnRUL5jEe95IomrgwwUY8EkQtpglV6mKWZOmXwzD/nwEuLhYOuXNG7rGVeN
 nYQTN8FwNRwge3tobOp0kDWk3Aj3ml6KVwepwzNcWTatc7yS9ioeSUidAKzg2Ffmq+zg
 vILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oebmTSxmq+zU8Utjs0yaAqanKgzPEsj+GJBxRd8logo=;
 b=bG2CWjfGXvEI91nASftJNMUmRYqgO61BJcEW3XOeLVRqjO3jjudvGMtFwkdBDy2OWm
 /wEBkQGxmOnsS67eCT1HyUx5HopPhcPXbzGA2h7KcgniElHf8/UnTPAyg7ah4kjiPgTQ
 +u+4njXMQGmOQ7Dj6MZwYYBc/uyiUZS+fWCaPT4SawyOVG2Pwzqn4Gq42ca5yDTsziHa
 4BT7THBlkXFlrzoD4LpgpzY+uBzla0n2NrAfD3Wjnm/6BMgC9qnfjFggUViZcndTarso
 5mz6pg9w9+RMEviwdBzL77xq8UY7xei2IS5dtiTkaxW8ioTY9H8pbVbwB6/2RPcFV4MG
 fW4Q==
X-Gm-Message-State: AOAM530hlOVmitOIr8bBvDquTa2O8/xtclpIzZZdIxFgzGMtr4kpesHC
 stXBS1LiA5mBnKkhmZAr9KYhvg==
X-Google-Smtp-Source: ABdhPJxkgUQGetwYGwiMjOMe+4nfq0UAIiYMxQuw9rxEaWWsEjAU6KlSu+C3bWRK9Yx/c927Qw6f0Q==
X-Received: by 2002:a37:a40e:: with SMTP id n14mr12925505qke.81.1633395862031; 
 Mon, 04 Oct 2021 18:04:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c9sm10444214qte.16.2021.10.04.18.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 18:04:21 -0700 (PDT)
Date: Mon, 04 Oct 2021 18:04:21 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 18:04:17 PDT (-0700)
Subject: Re: [PATCH v2 0/2] riscv: improve unaligned memory accesses
In-Reply-To: <20210918221713.289f63bb@xhacker>
CC: wangkefeng.wang@huawei.com, chenhuang5@huawei.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Darius Rad <darius@bluespec.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-3469a0a8-a337-4b56-8e4f-b5a8bc47c4e9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_180423_743954_62A266D7 
X-CRM114-Status: GOOD (  33.52  )
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

T24gU2F0LCAxOCBTZXAgMjAyMSAwNzoxNzoxMyBQRFQgKC0wNzAwKSwganN6aGFuZzNAbWFpbC51
c3RjLmVkdS5jbiB3cm90ZToKPiBPbiBTYXQsIDE4IFNlcCAyMDIxIDA5OjE0OjA1ICswODAwCj4g
S2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPgo+PiBPbiAy
MDIxLzkvMTcgMjI6MTQsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+ID4gT24gVGh1LCAxNiBTZXAg
MjAyMSAxMzowODo1MyArMDAwMAo+PiA+IENoZW4gSHVhbmcgPGNoZW5odWFuZzVAaHVhd2VpLmNv
bT4gd3JvdGU6Cj4+ID4gIAo+PiA+PiBUaGUgcGF0Y2hzZXQgaW1wcm92ZXMgUklTQ1YgdW5hbGln
bmVkIG1lbW9yeSBhY2Nlc3Nlcywgc2VsZWN0cwo+PiA+PiBIQVZFX0VGRklDSUVOVF9VTkFMSUdO
RURfQUNDRVNTIGlmIENQVV9IQVNfTk9fVU5BTElHTkVEIG5vdAo+PiA+PiBlbmFibGVkIGFuZCBz
dXBwb3J0cyBEQ0FDSEVfV09SRF9BQ0NFU1MgdG8gaW1wcm92ZSB0aGUgZWZmaWNpZW5jeQo+PiA+
PiBvZiB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzLgo+PiA+Pgo+PiA+PiBJZiBDUFUgZG9uJ3Qg
c3VwcG9ydCB1bmFsaWduZWQgbWVtb3J5IGFjY2Vzc2VzIGZvciBub3csIHBsZWFzZQo+PiA+PiBz
ZWxlY3QgQ09ORklHX0NQVV9IQVNfTk9fVU5BTElHTkVELiBGb3IgSSBkb24ndCBrbm93IHdoaWNo
IENQVQo+PiA+PiBkb24ndCBzdXBwb3J0IHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMsIEkgZG9u
J3QgY2hvb3NlIHRoZQo+PiA+PiBDT05GSUcgZm9yIHRoZW0uICAKPj4gPiBUaGlzIHdpbGwgYnJl
YWsgdW5pZmllZCBrZXJuZWwgSW1hZ2UgZm9yIHJpc2N2LiBPYnZpb3VzbHksIHdlIHdpbGwgaGF2
ZQo+PiA+IHR3byBpbWFnZXMgZm9yIGVmZmljaWVudCB1bmFsaWduZWQgYWNjZXNzIHBsYXRmb3Jt
cyBhbmQgbm9uLWVmZmljaWVudAo+PiA+IHVuYWxpZ25lZCBhY2Nlc3MgcGxhdGZvcm1zLiBJTUhP
LCB3ZSBtYXkgbmVlZCBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gb3IKPj4gPiBzb21ldGhpbmcgZWxz
ZSB0byBkeW5hbWljYWxseSBlbmFibGUgcmVsYXRlZCBjb2RlIHBhdGguICAKPj4gCj4+IGl0IHdv
bid0IGJyZWFrIHVuaWZpZWQga2VybmVsIEltYWdlIGZvciByaXNjdiwgaWYgb25lIFNvQyBjaG9v
c2UKPj4gCj4+IENQVV9IQVNfTk9fVU5BTElHTkVELCB0aGUgc2luZ2xlIEltYWdlIHdvbid0IHN1
cHBvcnQgdW5hbGlnbmVkIG1lbW9yeQo+Cj4gdGhlICJ1bmlmaWVkIiBtZWFucyB0aGUga2VybmVs
IEltYWdlIGhhcyB0byBzdXBwb3J0IGFsbCBSVjY0R0Mgb3IgUlYzMkdDIFNvQ3MuCj4gVG8gbWFr
ZSB0aGUgSW1hZ2Ugd29ya3MgZm9yIGJvdGggZWZmaWNpZW50IHVuYWxpZ25lZCBhY2Nlc3MgYW5k
IGluZWZmaWNpZW50Cj4gdW5hbGlnbmVkIGFjY2VzcywgSSB0aGluayB3ZSdkIGJldHRlciBtYWtl
ICJpbmVmZmljaWVudCB1bmFsaWduZWQgYWNjZXNzIgo+IGRlZmF1bHQgYmVoYXZpb3IsIHRoZSB1
c2UgYWx0ZXJuYXRpdmUgZXRjLiB0ZWNoIHRvIHBhdGNoIHJlbGF0ZWQgY29kZSBwYXRoCj4gZm9y
IGVmZmljaWVudCB1bmFsaWduZWQgYWNjZXNzLgoKSSBhZ3JlZSwgYXQgbGVhc3QgdW50aWwgd2Ug
aGF2ZSBhIHN1ZmZpY2llbnQgYnJlYWR0aCBvZiBpbXBsZW1lbnRhdGlvbnMgCnRvIGtub3cgd2hl
dGhlciBlZmZpY2llbnQgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBnb2luZyB0byBiZSBwb3NzaWJs
ZS4KClRoZXJlIHdhcyBhbHNvIGEgcXVlc3Rpb24gYWJvdXQgd2hhdCBleGFjdGx5IHRoZSBDOTA2
IHVuYWxpZ25lZCBhY2Nlc3MgCmhhbmRsaW5nIGxvb2tzIGxpa2Ugb24gR0NDLCBhcyB3ZWxsLiAg
RG8geW91IGd1eXMgaGF2ZSBhbnkgc29ydCBvZiAKcGlwZWxpbmUgZGVzY3JpcHRpb24/Cgo+Cj4K
Pj4gCj4+IGFjY2Vzc2VzLCBpbmRlZWQsIGl0IGRlcGVuZHMgb24gdGhlIENPTkZJRywgYW5kIG5v
dywgYXJtL3Bvd2VycGMvbTY4ayBoYXMKPgo+IGxpbnV4IERpc3RyaWJ1dGlvbnMgZG9lc24ndCBo
YXZlIGVub3VnaCBiYWNrZ3JvdW5kIG9mIHdoaWNoIGNvbmZpZyBvcHRpb25zCj4gbXVzdCBiZSBl
bmFibGVkLgoKSSB3b3VsZG4ndCBiZSBvcHBvc2VkIHRvIGFkZGluZyB0aGlzIGFzIGEgS2NvbmZp
ZyBvcHRpb24sIHNvbWV0aGluZyAKYWxvbmcgdGhlIGxpbmVzIG9mICJ0dW5lIGZvciBmYXN0IHVu
YWxpZ25lZCBhY2Nlc3NlcyIgb3Igd2hhdGV2ZXIuICBJIApnZXQgdGhhdCB3ZSdyZSBzb3J0IG9m
IGp1c3QgcHVudGluZyB0aGUgcHJvYmxlbSB0byBkaXN0cm9zLCBidXQgd2UgY291bGQgCmFkZCBh
IEtjb25maWcuc29jcy1saWtlICh0aG91Z2ggdGhhdCBpcyBhIG1lc3MsIHNvIHdlJ2QgbmVlZCBz
b21ldGhpbmcgCnNhbmVyKSB0dW5lIHRhcmdldCAod2hpY2ggaXMgbWF5YmUgY291cGxlZCB0byAt
bXR1bmUsIGFzIHdlbGw/KS4gIFRoYXQgCndvdWxkIGEgbGVhc3QgbGV0IHVzIGdpdmUgdXNlcnMg
dGhlIG9wdGlvbiBvZiBtYWtpbmcgdGhpcyBjaG9pY2UsIGFuZCAKd2hpbGUgaXQnZCBzdGlsbCBs
aWtlbHkgYmUgYmVzdCB0byBzZXQgdGhpcyB0byBzbG93IHVuYWxpZ25lZCBhY2Nlc3NlIHRvIApz
dGFydCB3ZSBtYXkgYmUgYWJsZSB0byBtb3JlIGVhc2lseSBzZWUgd2hhdCBkaXN0cm9zIGNob29z
ZSBhdCB0aGlzIApwb2ludC4KCj4KPj4gCj4+IHNpbWlsYXIgY29uZmlndXJhdGlvbi4KPgo+IEkg
aGF2ZSBsaXR0bGUga25vd2xlZGdlIG9mIHBvd2VycGMgb3IgbTY4aywgYnV0IHRoZXJlIGFyZSBz
ZXJ2ZXJhbCBkaWZmZXJlbnQKPiBkZWZjb25maWcgZmlsZXMgZm9yIGFybSwgZm9yIGV4YW1wbGUg
bXVsdGlfdjdfZGVmY29uZmlnIGFuZCBtdWx0aV92NV9kZWZjb25maWcuCj4gVGhlIHByZXZpb3Vz
IHY3IHZlcnNpb24gZW5hYmxlcyBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIHdoaWxl
Cj4gdGhlIGxhdGVyIHY1IGRvZXNuJ3QuIFdpbGwgeW91IHBlcnN1YWRlIHJpc2N2IG1haW50YWlu
ZXJzIHRvIGFjY2VwdCBvbmUgbW9yZQo+IGRlZmNvbmZpZyBmaWxlPwoKSSdtIG5vdCBzdXBlciB3
b3JyaWVkIGFib3V0IGhhdmluZyBtb3JlIGRlZmNvbmZpZ3MsIGJ1dCBJJ20gbm90IHJlYWxseSAK
c3VyZSBpdCdzIHdvcnRoIGl0IGZvciB0aGlzIG9wdGlvbiBhbG9uZS4KCj4KPiBUaGFua3MKPgo+
PiAKPj4gWWVzLMKgIGl0IGNvdWxkIGJlIGFuIG9wdGltaXphdGlvbiB2aWEgYWx0ZXJuYXRpdmUg
bWVjaGFuaXNtIG9yIHNvbWV0aGluZyAKPj4gZWxzZSB0bwo+PiAKPj4gZHluYW1pY2FsbHkgZW5h
YmxlIHJlbGF0ZWQgY29kZSBwYXRoIGxhdGVyLgo+PiAKPj4gPgo+PiA+IFJlZ2FyZHMKPj4gPiAg
Cj4+ID4+IENoYW5nZXMgc2luY2UgdjE6Cj4+ID4+ICAgLSBBcyBEYXJpdXMgUmFkIGFuZCBKaXNo
ZW5nIFpoYW5nIG1lbnRpb25lZCwgc29tZSBDUFVzIGRvbid0IHN1cHBvcnQKPj4gPj4gICAgIHVu
YWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMsIGFkZCBhbiBvcHRpb24gZm9yIENQVXMgdG8gY2hvb3Nl
IGl0IG9yIG5vdC4KPj4gPj4KPj4gPj4gQ2hlbiBIdWFuZyAoMik6Cj4+ID4+ICAgIHJpc2N2OiBz
dXBwb3J0IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPj4gPj4gICAgcmlzY3Y6IFN1
cHBvcnQgRENBQ0hFX1dPUkRfQUNDRVNTCj4+ID4+Cj4+ID4+ICAgYXJjaC9yaXNjdi9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKwo+PiA+PiAgIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vd29yZC1hdC1hLXRpbWUuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPj4gPj4gIAo+PiA+Cj4+ID4g
Lgo+PiA+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
