Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5471BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wrciZLF5zHuB8AGso9auzb4fqAQRGMb0nYrs/sqzBw=; b=BSRm6vSNfc1f4l
	KmWAOMqWYpNMFkgm+yXS9xOMbGkKt6oqlMf/t963XxBCLFe6N0oyWQGmLfgvvQytv8xbStQDAuuLS
	MJrEZBXq1Ba81ugx71q1jA4e/01o+Se+9UYadEGgVHukXT24Yv0IhL4Xhp1j7+Mx56HCvGIxaUvMt
	+bu6QG66TSHRQ2xl8TsfOPAcwswMsbcPG6L4BZ4IPbs80LxGQ0qvNmQ0Nl11sjwZsSuB7cuMthilK
	/XaeApxKcXA3GNnYaq8h4/uRD47z51Q0L+1rGpzoM47NfmUaREC0Blb2GSN4G+dgUsIQ1mPOzZZpE
	to0kOOQkzA9PMB18yuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1bA-00D62C-Na; Thu, 26 May 2022 00:43:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1b7-00D60Z-Vb
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:43:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D9F9616E6
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 00:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ECFC36AE3
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 00:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653525808;
	bh=+Bb4hT7Het05CiKC/BEkPkBJX5GivopS0haooAcnKR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xyxir2JaPRyHbgSBBdBiztju/uCb7vmvSXf2VRDAMWHhd/iE21/Vk45EpFEE5coLk
	 trTpp10u9uES0wErXMSaUCYlxCCqLYf6VBr3G3tTq3Gi1YzBVZc07LmrrDgNY/fHKu
	 JRY+M8EKWDptGJOugDcyul6VQizyJNizmMXZJa7+U9Chb9SQOiBG7lreTeO0pzeNyL
	 6zfopY/0K9izFQjns2SwLRkAz9iqDrh0AHqfZbsUggFoY4NFBO8H+qJ7A36fs2XjH+
	 OAiqW9oMSKth7jE+bpsPp7QdzQH7Y8vjMgZzQ3AZy2B7Q4aE5Ksa8Hx/2JaE5tdejT
	 csNc+dnOLjjPg==
Received: by mail-ua1-f43.google.com with SMTP id 63so108809uaw.10
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 17:43:28 -0700 (PDT)
X-Gm-Message-State: AOAM5315crXThWtaqma56i+d4Q1r4O1bAhr4hH6h3WuZo057qkX3+FKP
	aVQiHoe9OWGfGoD1nOob5T+QwSNgPiLdbASSyFM=
X-Google-Smtp-Source: ABdhPJy39E/JWntiImpdMBrH4kjPbGHQEa8lmvWaIYaXTOWc3XHHp7yHAhpd2+nxGkc7zgcTB5fuv6aKn99kBLPgtQU=
X-Received: by 2002:ab0:375b:0:b0:355:c2b3:f6c with SMTP id
 i27-20020ab0375b000000b00355c2b30f6cmr11732960uat.84.1653525807866; Wed, 25
 May 2022 17:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <48ef770c-75bf-6c37-66fe-9719164bc6e0@roeck-us.net> <mhng-7a88227d-dc64-4d87-9e1a-0ea802ddf0a1@palmer-ri-x1c9>
In-Reply-To: <mhng-7a88227d-dc64-4d87-9e1a-0ea802ddf0a1@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 08:43:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSNJqXhJs2kOJ6v9fN9JX8EVBzQqWDxWZsJFZC9h+EeNw@mail.gmail.com>
Message-ID: <CAJF2gTSNJqXhJs2kOJ6v9fN9JX8EVBzQqWDxWZsJFZC9h+EeNw@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_174330_116742_24C02740 
X-CRM114-Status: GOOD (  26.60  )
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

T24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgODozOSBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjUgTWF5IDIwMjIgMTU6NTY6MDcgUERUICgt
MDcwMCksIGxpbnV4QHJvZWNrLXVzLm5ldCB3cm90ZToKPiA+IE9uIDUvMjUvMjIgMTQ6MzQsIFBh
bG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+IE9uIFdlZCwgMjUgTWF5IDIwMjIgMTQ6MTU6MDMgUERU
ICgtMDcwMCksIGxpbnV4QHJvZWNrLXVzLm5ldCB3cm90ZToKPiA+Pj4gT24gNS8yNS8yMiAwOTow
NCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBpcyBhIGZpeHVwIGZvciB2ZHNv
IGltcGxlbWVudGF0aW9uIHdoaWNoIGNhdXNlZCBtdXNsIHRvCj4gPj4+PiBmYWlsLgo+ID4+Pj4K
PiA+Pj4+IFsgICAxMS42MDAwODJdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4+
Pj4gWyAgIDExLjYyODU2MV0gaW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBh
dAo+ID4+Pj4gMHgwMDAwMDAwMDAwMDAwMDAwIGluIGxpYmMuc29bZmZmZmZmOGFkMzkwMDArYTQw
MDBdCj4gPj4+PiBbICAgMTEuNjI5Mzk4XSBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRh
aW50ZWQKPiA+Pj4+IDUuMTguMC1yYzctbmV4dC0yMDIyMDUyMCAjMQo+ID4+Pj4gWyAgIDExLjYy
OTQ2Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+ID4+Pj4gWyAgIDEx
LjYyOTU0Nl0gZXBjIDogMDBmZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZmZmZmOGFkYTEzYzggc3Ag
Ogo+ID4+Pj4gMDBmZmZmZmZjNTgxOTlmMAo+ID4+Pj4gWyAgIDExLjYyOTU4Nl0gIGdwIDogMDBm
ZmZmZmY4YWQzOTAwMCB0cCA6IDAwZmZmZmZmOGFkZTA5OTggdDAgOgo+ID4+Pj4gZmZmZmZmZmZm
ZmZmZmZmZgo+ID4+Pj4gWyAgIDExLjYyOTU5OF0gIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6
IDAwMDAwMDAwMDAwMDAwMDAgczAgOgo+ID4+Pj4gMDBmZmZmZmY4YWRlMGNjMAo+ID4+Pj4gWyAg
IDExLjYyOTYxMF0gIHMxIDogMDBmZmZmZmY4YWRlMGNjMCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAg
YTEgOgo+ID4+Pj4gMDBmZmZmZmZjNTgxOWEwMAo+ID4+Pj4gWyAgIDExLjYyOTYyMl0gIGEyIDog
MDAwMDAwMDAwMDAwMDAwMSBhMyA6IDAwMDAwMDAwMDAwMDAwMWUgYTQgOgo+ID4+Pj4gMDBmZmZm
ZmZjNTgxOWIwMAo+ID4+Pj4gWyAgIDExLjYyOTYzNF0gIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBh
NiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOgo+ID4+Pj4gMDAwMDAwMDAwMDAwMDAwMAo+ID4+Pj4g
WyAgIDExLjYyOTY0NV0gIHMyIDogMDBmZmZmZmY4YWRlMGFjOCBzMyA6IDAwZmZmZmZmOGFkZTBl
YzggczQgOgo+ID4+Pj4gMDBmZmZmZmY4YWRlMDcyOAo+ID4+Pj4gWyAgIDExLjYyOTY1Nl0gIHM1
IDogMDBmZmZmZmY4YWRlMGE5MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOgo+ID4+Pj4gMDBm
ZmZmZmZjNTgxOWU0MAo+ID4+Pj4gWyAgIDExLjYyOTY2N10gIHM4IDogMDBmZmZmZmY4YWRlMGNh
MCBzOSA6IDAwZmZmZmZmOGFkZGJhNTAgczEwOgo+ID4+Pj4gMDAwMDAwMDAwMDAwMDAwMAo+ID4+
Pj4gWyAgIDExLjYyOTY3OF0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAwMDAw
MDAwMDIgdDQgOgo+ID4+Pj4gMDAwMDAwMDAwMDAwMDAwMQo+ID4+Pj4gWyAgIDExLjYyOTY4OF0g
IHQ1IDogMDAwMDAwMDAwMDAyMDAwMCB0NiA6IGZmZmZmZmZmZmZmZmZmZmYKPiA+Pj4+IFsgICAx
MS42Mjk2OTldIHN0YXR1czogMDAwMDAwMDAwMDAwNDAyMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPj4+PiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+ID4+Pj4KPiA+Pj4+IFRoZSBsYXN0
IF9fdmRzb19pbml0KCZjb21wYXRfdmRzb19pbmZvKSByZXBsYWNlcyB0aGUgZGF0YSBpbiBub3Jt
YWwKPiA+Pj4+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1Zy4KPiA+Pj4+Cj4gPj4+
PiBSZXBvcnRlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+PiBDYzogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiA+Pj4+IENjOiBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPgo+ID4+Pgo+ID4+PiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sg
PGxpbnV4QHJvZWNrLXVzLm5ldD4KPiA+Pgo+ID4+IFNvcnJ5IEknbSBhIGJpdCBidXJpZWQgcmln
aHQgbm93LCB0aGlzIGlzIGZpeGluZyB0aGUgaXNzdWUgeW91IHBvaW50ZWQgb3V0IGVhcmxpZXI/
Cj4gPj4KPiA+IFllcy4KPgo+IEF3b3NvbWUsIEkgdGhpbmsgdGhhdCB3YXMgdGhlIG9ubHkgYmln
IGJsb2NrZXIgc28gZmFyLgo+Cj4gSSBhZGRlZCBhIG11c2wtYmFzZWQgdXNlcnNwYWNlIHRvIG15
IHRlc3Qgc2V0dXAsIHdoaWNoIGlzIHJ2NjQtb25seQo+IChidWlsZHJvb3QgZG9lc24ndCBoYXZl
IHJ2MzIgbXVzbCwgSSB0aG91Z2h0IHVwc3RyZWFtIGhhZCBpdCBidXQgbWF5YmUKSGVyZSBpcyBy
djMyIG11c2wgaW5mb3JtYXRpb24sIEkgdGhpbmsgaXQgY291bGQgYmUgcmVhZHkuCmh0dHBzOi8v
d3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDMvMTIvMQoKPiBpJ20gbWlzcmVtZW1i
ZXJpbmcpLiAgVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVnLCBzbyBJJ3ZlIGFkZGVkIGl0IHRvCj4g
Zm9yLW5leHQgd2l0aAo+Cj4gRml4ZXM6IDMwOTJlYjQ1NjM3NSAoInJpc2N2OiBjb21wYXQ6IHZk
c286IEFkZCBzZXR1cCBhZGRpdGlvbmFsIHBhZ2VzIGltcGxlbWVudGF0aW9uIikKSWYgZm9yLW5l
eHQgaGFzIG1lcmdlZCBpbnRvIHRoZSBMaW51cyB0cmVlLCBwbGVhc2UgaGVscCBhZGQgdGhlIGFi
b3ZlLgoKPgo+IHdoaWNoIEkgdGhpbmsgaXMgY29ycmVjdCwgYnV0IExNSyBpZiB0aGVyZSdzIGFu
IGlzc3VlLgo+Cj4gVGhhbmtzIQo+Cj4gKGFuZCBhbHNvIHNvcnJ5IEkgcG9rZWQgR2VlcnQgaW5z
dGVhZCBvZiB5b3UgYWJvdXQgdGhpcyBvbmUsIG9vcHMgOykpCj4KPiA+Cj4gPiBUaGFua3MsCj4g
PiBHdWVudGVyCj4gPgo+ID4+Pgo+ID4+Pj4gLS0tCj4gPj4+PiAgIGFyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYyB8IDE1ICsrKysrKysrKysrKystLQo+ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jCj4gPj4+
PiBpbmRleCA1MGZlNGM4Nzc2MDMuLjY5YjA1YjZjMTgxYiAxMDA2NDQKPiA+Pj4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+ID4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by5jCj4gPj4+PiBAQCAtMjA2LDEyICsyMDYsMjMgQEAgc3RhdGljIHN0cnVjdCBfX3Zkc29faW5m
byB2ZHNvX2luZm8gX19yb19hZnRlcl9pbml0ID0gewo+ID4+Pj4gICB9Owo+ID4+Pj4KPiA+Pj4+
ICAgI2lmZGVmIENPTkZJR19DT01QQVQKPiA+Pj4+ICtzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxf
bWFwcGluZyBydl9jb21wYXRfdmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0gewo+ID4+Pj4g
KyAgICBbUlZfVkRTT19NQVBfVlZBUl0gPSB7Cj4gPj4+PiArICAgICAgICAubmFtZSAgID0gIlt2
dmFyXSIsCj4gPj4+PiArICAgICAgICAuZmF1bHQgPSB2dmFyX2ZhdWx0LAo+ID4+Pj4gKyAgICB9
LAo+ID4+Pj4gKyAgICBbUlZfVkRTT19NQVBfVkRTT10gPSB7Cj4gPj4+PiArICAgICAgICAubmFt
ZSAgID0gIlt2ZHNvXSIsCj4gPj4+PiArICAgICAgICAubXJlbWFwID0gdmRzb19tcmVtYXAsCj4g
Pj4+PiArICAgIH0sCj4gPj4+PiArfTsKPiA+Pj4+ICsKPiA+Pj4+ICAgc3RhdGljIHN0cnVjdCBf
X3Zkc29faW5mbyBjb21wYXRfdmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiA+Pj4+ICAg
ICAgIC5uYW1lID0gImNvbXBhdF92ZHNvIiwKPiA+Pj4+ICAgICAgIC52ZHNvX2NvZGVfc3RhcnQg
PSBjb21wYXRfdmRzb19zdGFydCwKPiA+Pj4+ICAgICAgIC52ZHNvX2NvZGVfZW5kID0gY29tcGF0
X3Zkc29fZW5kLAo+ID4+Pj4gLSAgICAuZG0gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZW
QVJdLAo+ID4+Pj4gLSAgICAuY20gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZEU09dLAo+
ID4+Pj4gKyAgICAuZG0gPSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WVkFSXSwK
PiA+Pj4+ICsgICAgLmNtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10s
Cj4gPj4+PiAgIH07Cj4gPj4+PiAgICNlbmRpZgo+ID4+Pj4KCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
