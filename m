Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F05C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 01:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nb4VgsYiZUa/JjZrHHk5vMJGnepV+qOVeEngNVX+WbU=; b=yNgdZHbJb8Po0c
	EFJyCp/vW8frMLU97JPRcs3cKA1M+WDLJXvIv8wKlh4nl4k/pW7gJC5iRkXbFM+QT+NJrwBqMS6zF
	FW9Ph1YdzweOzQXbei9uZPgUu6clGETrvghdsPLPySFCsuK1gWzX0d6d4b17Ws34QcHiXxBOQPvur
	hxZ9Ern2achzr38RnzPoiJQeTos7TPuiy4a7o9AIsO25fOd9xeETo1fmFvknsXH8FoiPb2jYb5g+n
	LoTzLsWgbJUW/ceDBf/b1x1r8r0acFc9ER9Ip5SSLoEy7GWODpAGFCgGaoE/HCYiZGaDzse5bck1T
	FT4OfT8V2dqdJHBLz7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Yny-003qvm-Bj; Thu, 01 Dec 2022 01:56:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ynu-003qvC-UU
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 01:56:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so386239wmi.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 17:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVK3ULZTcb0au9s6tD0+rsGIi+YBqkDmsXXuv1DWTqI=;
        b=e5E78mOpsZAh8ucA2XfQ4zuMG3rg7wruI86IC7FoBgdb3Zob0RGDWdYgYy4pOx1Dj/
         Sj0e5D/Iltvg2WwBrxDQ8/G4VtaNhq7J2Il6qdB370Tx455QczGyATy+QsQ05EDkUv0c
         H0pewg1o/1vKK3+c4sB3MB7FMaqjqg7nHKsaJ7nq/pB74j5C5n5WmtgJ4pxbqgy+iqkI
         6BO4je1S0hXH/bXH5fXN1OQBAtMHRCjA5vrQJ2ho/eOPf62XTLBWcRfXjuOmNIXyEDTz
         inS79PSQLZFu9n1/efQsc5cONwxNFSfYn3btu9yol+7goSCzStQsBODbARzX7xUWtLXg
         w19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVK3ULZTcb0au9s6tD0+rsGIi+YBqkDmsXXuv1DWTqI=;
        b=P9eLCi/UJzyapQWddZE/rZ10LDPhKl9A86E9DEPGUAsUCRUspWlzPhnLkuL4QmKUoW
         DGiPCGJVdZAHTYIyVKZylS+NQj/Qk975Mj9EkTypj00k+XydfkJ2gKRdfRddzC3fW0K6
         JAlr5TRU9UQ5zgZ4S5lGobupVLVFjXkIjz5EacGNpOGLRWqEy1FInv2Kiwe/Fzqz2Vz1
         ZHhRZXTskOmTZLvojL3D4UJ23Q+2AFwwWWvimUmNWtAcSYOsaiX2MF+26lPe7uYtCh/M
         Chx5y4KqF0kmc92pzclbDAfLpOq/HefcTh1VRTdMxdB39naDm+YWqggf41aqo+ITU6of
         vFKw==
X-Gm-Message-State: ANoB5pm/igwopw6R9de0CTbSn7a5Z+Hd8Gf3c4nm+LRSjt68mA2h/jid
	8udhd3kxgXrq6iQbZE+iTbOoNA==
X-Google-Smtp-Source: AA0mqf7yQecK90jt93Vsi3pQwMkDiEr+ewSjgzUcNA55D7KBXUPMcvTZWJPUFwL6Zz1kjNGIhsp/qA==
X-Received: by 2002:a05:600c:4e09:b0:3cf:55bd:4944 with SMTP id b9-20020a05600c4e0900b003cf55bd4944mr49267861wmq.64.1669859755928;
        Wed, 30 Nov 2022 17:55:55 -0800 (PST)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id n29-20020a05600c3b9d00b003c21ba7d7d6sm4284802wms.44.2022.11.30.17.55.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Nov 2022 17:55:55 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4] riscv: fix race when vmap stack overflow
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mhng-72408cf8-cbde-489b-9042-379b5aa8624f@palmer-ri-x1c9>
Date: Thu, 1 Dec 2022 01:55:54 +0000
Cc: guoren@kernel.org,
 Andrea Parri <andrea@rivosinc.com>,
 jszhang@kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <F84A2656-5938-45F7-A097-58CE348B7119@jrtc27.com>
References: <mhng-72408cf8-cbde-489b-9042-379b5aa8624f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_175559_051951_4BD56953 
X-CRM114-Status: GOOD (  24.21  )
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

T24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gCj4gT24gVHVlLCAyOSBOb3YgMjAyMiAyMzoxNTo0MCBQU1QgKC0wODAw
KSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4+IFRoZSBjb21tZW50IGJlY29tZXMgYmV0dGVy
LiBUaHguCj4+IAo+PiBPbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCAxMDoyOSBBTSBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+PiAKPj4+IEZyb206IEppc2hlbmcg
WmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4+IAo+Pj4gQ3VycmVudGx5LCB3aGVuIGRldGVj
dGluZyB2bWFwIHN0YWNrIG92ZXJmbG93LCByaXNjdiBmaXJzdGx5IHN3aXRjaGVzCj4+PiB0byB0
aGUgc28gY2FsbGVkIHNoYWRvdyBzdGFjaywgdGhlbiB1c2UgdGhpcyBzaGFkb3cgc3RhY2sgdG8g
Y2FsbCB0aGUKPj4+IGdldF9vdmVyZmxvd19zdGFjaygpIHRvIGdldCB0aGUgb3ZlcmZsb3cgc3Rh
Y2suIEhvd2V2ZXIsIHRoZXJlJ3MKPj4+IGEgcmFjZSBoZXJlIGlmIHR3byBvciBtb3JlIGhhcnRz
IHVzZSB0aGUgc2FtZSBzaGFkb3cgc3RhY2sgYXQgdGhlIHNhbWUKPj4+IHRpbWUuCj4+PiAKPj4+
IFRvIHNvbHZlIHRoaXMgcmFjZSwgd2UgaW50cm9kdWNlIHNwaW5fc2hhZG93X3N0YWNrIGF0b21p
YyB2YXIsIHdoaWNoCj4+PiB3aWxsIGJlIHN3YXAgYmV0d2VlbiBpdHMgb3duIGFkZHJlc3MgYW5k
IDAgaW4gYXRvbWljIHdheSwgd2hlbiB0aGUKPj4+IHZhciBpcyBzZXQsIGl0IG1lYW5zIHRoZSBz
aGFkb3dfc3RhY2sgaXMgYmVpbmcgdXNlZDsgd2hlbiB0aGUgdmFyCj4+PiBpcyBjbGVhcmVkLCBp
dCBtZWFucyB0aGUgc2hhZG93X3N0YWNrIGlzbid0IGJlaW5nIHVzZWQuCj4+PiAKPj4+IEZpeGVz
OiAzMWRhOTRjMjVhZWEgKCJyaXNjdjogYWRkIFZNQVBfU1RBQ0sgb3ZlcmZsb3cgZGV0ZWN0aW9u
IikKPj4+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
Pj4+IFN1Z2dlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiBSZXZpZXdl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjIxMDMwMTI0NTE3LjIzNzAtMS1qc3poYW5nQGtlcm5lbC5vcmcKPj4+
IFtQYWxtZXI6IEFkZCBBUSB0byB0aGUgc3dhcCwgYW5kIGFsc28gc29tZSBjb21tZW50cy5dCj4+
PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4+
IC0tLQo+Pj4gU29ycnkgdG8ganVzdCByZS1zcGluIHRoaXMgb25lIHdpdGhvdXQgYW55IHdhcm5p
bmcsIGJ1dCBJJ2QgcmVhZCBwYXRjaCBhCj4+PiBmZXcgdGltZXMgYW5kIGV2ZXJ5IHRpbWUgSSdk
IG1hbmFnZWQgdG8gY29udmljZSBteXNlbGYgdGhlcmUgd2FzIGEgbXVjaAo+Pj4gc2ltcGxlciB3
YXkgb2YgZG9pbmcgdGhpcy4gIEJ5IHRoZSB0aW1lIEknZCBmaWd1cmVkIG91dCB3aHkgdGhhdCdz
IG5vdAo+Pj4gdGhlIGNhc2UgaXQgc2VlbWVkIGZhc3RlciB0byBqdXN0IHdyaXRlIHRoZSBjb21t
ZW50cy4KPj4+IAo+Pj4gSSd2ZSBzdGFzaGVkIHRoaXMsIHJpZ2h0IG9uIHRvcCBvZiB0aGUgb2Zm
ZW5kaW5nIGNvbW1pdCwgYXQKPj4+IHBhbG1lci9yaXNjdi1maXhfdm1hcF9zdGFjay4KPj4+IAo+
Pj4gU2luY2UgdjM6Cj4+PiAtIEFkZCBBUSB0byB0aGUgc3dhcC4KPj4+IC0gQWRkIGEgYnVuY2gg
b2YgY29tbWVudHMuCj4+PiAKPj4+IFNpbmNlIHYyOgo+Pj4gLSB1c2UgUkVHX0FNT1NXQVAKPj4+
IC0gYWRkIGNvbW1lbnQgdG8gdGhlIHB1cnBvc2Ugb2Ygc21wX3N0b3JlX3JlbGVhc2UoKQo+Pj4g
Cj4+PiBTaW5jZSB2MToKPj4+IC0gdXNlIHNtcF9zdG9yZV9yZWxlYXNlIGRpcmVjdGx5Cj4+PiAt
IHVzZSB1bnNpZ25lZCBpbnQgaW5zdGVhZCBvZiBhdG9taWNfdAo+Pj4gLS0tCj4+PiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS5oIHwgIDEgKwo+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UyAgICB8IDEzICsrKysrKysrKysrKysKPj4+IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAg
fCAxOCArKysrKysrKysrKysrKysrKysKPj4+IDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9u
cygrKQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKPj4+IGluZGV4IDYxOGQ3YzVhZjFhMi4uZTE1
YTFjOWYxY2Y4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+
Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaAo+Pj4gQEAgLTIzLDYgKzIzLDcg
QEAKPj4+ICNkZWZpbmUgUkVHX0wgICAgICAgICAgX19SRUdfU0VMKGxkLCBsdykKPj4+ICNkZWZp
bmUgUkVHX1MgICAgICAgICAgX19SRUdfU0VMKHNkLCBzdykKPj4+ICNkZWZpbmUgUkVHX1NDICAg
ICAgICAgX19SRUdfU0VMKHNjLmQsIHNjLncpCj4+PiArI2RlZmluZSBSRUdfQU1PU1dBUF9BUSBf
X1JFR19TRUwoYW1vc3dhcC5kLmFxLCBhbW9zd2FwLncuYXEpCj4+IEJlbG93IGlzIHRoZSByZWFz
b24gd2h5IEkgdXNlIHRoZSByZWxheCB2ZXJzaW9uIGhlcmU6Cj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC9DQUpGMmdUUkFFWF9qUV93NUgwNWR5YWZaekhxK1A1ajA1VEo9Qyt2K09MX19H
UWFtNEFAbWFpbC5nbWFpbC5jb20vVC8jdQo+IAo+IFNvcnJ5LCBJIGhhZG4ndCBzZWVuIHRoYXQg
b25lLiAgQWRkaW5nIEFuZHJlYS4gIElNTyB0aGUgYWNxdWlyZS9yZWxlYXNlIHBhaXIgaXMgbmVj
ZXNzYXJ5IGhlcmUsIHdpdGgganVzdCByZWxheGVkIHRoZSBzdGFjayBzdG9yZXMgaW5zaWRlIHRo
ZSBsb2NrIGNvdWxkIHNob3cgdXAgb24gdGhlIG5leHQgaGFydCB0cnlpbmcgdG8gdXNlIHRoZSBz
dGFjay4KCkkgdGhpbmsgd2hhdCB5b3UgcmVhbGx5IHdhbnQgaXMgYSAqY29uc3VtZSogYmFycmll
ciwgYW5kIHNpbmNlIHlvdSBoYXZlCnRoZSBkYXRhIGRlcGVuZGVuY3kgYmV0d2VlbiB0aGUgYW1v
c3dhcCBhbmQgdGhlIG1lbW9yeSBhY2Nlc3NlcyAoYW5kCnRoaXMgaXNu4oCZdCBBbHBoYSkgeW91
4oCZcmUgdGVjaG5pY2FsbHkgZmluZSB3aXRob3V0IHRoZSBhY3F1aXJlLCBzaW5jZQp5b3XigJly
ZSB3cml0aW5nIGFzc2VtYmx5IGFuZCBoYXZlIHRoZSBkYXRhIGRlcGVuZGVuY3kgYXMgc3ludGFj
dGljLgpUaG91Z2ggeW91IG1heSBzdGlsbCB3YW50IChuZWVkPykgdGhlIGFjcXVpcmUgc28gbG9h
ZHMvc3RvcmVzIHVucmVsYXRlZAp0byB0aGUgc3RhY2sgcG9pbnRlciB0aGF0IGhhcHBlbiBsYXRl
ciBpbiBwcm9ncmFtIG9yZGVyIGdldCBvcmRlcmVkCmFmdGVyIHRoZSBsb2FkIG9mIHRoZSBuZXcg
c3RhY2sgcG9pbnRlciBpbiBjYXNlIHRoZXJlIGNvdWxkIGJlIHdlaXJkCmlzc3VlcyAqdGhlcmUq
LgoKSmVzcwoKPj4+ICNkZWZpbmUgUkVHX0FTTSAgICAgICAgICAgICAgICBfX1JFR19TRUwoLmR3
b3JkLCAud29yZCkKPj4+ICNkZWZpbmUgU1pSRUcgICAgICAgICAgX19SRUdfU0VMKDgsIDQpCj4+
PiAjZGVmaW5lIExHUkVHICAgICAgICAgIF9fUkVHX1NFTCgzLCAyKQo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+
PiBpbmRleCA5OGY1MDI2NTRlZGQuLjVmZGI2YmEwOTYwMCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMK
Pj4+IEBAIC0zODcsNiArMzg3LDE5IEBAIGhhbmRsZV9zeXNjYWxsX3RyYWNlX2V4aXQ6Cj4+PiAK
Pj4+ICNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSwo+Pj4gaGFuZGxlX2tlcm5lbF9zdGFja19vdmVy
ZmxvdzoKPj4+ICsgICAgICAgLyoKPj4+ICsgICAgICAgICogVGFrZXMgdGhlIHBzdWVkby1zcGlu
bG9jayBmb3IgdGhlIHNoYWRvdyBzdGFjaywgaW4gY2FzZSBtdWx0aXBsZQo+Pj4gKyAgICAgICAg
KiBoYXJ0cyBhcmUgY29uY3VycmVudGx5IG92ZXJmbG93aW5nIHRoZWlyIGtlcm5lbCBzdGFja3Mu
ICBXZSBjb3VsZAo+Pj4gKyAgICAgICAgKiBzdG9yZSBhbnkgdmFsdWUgaGVyZSwgYnV0IHNpbmNl
IHdlJ3JlIG92ZXJmbG93aW5nIHRoZSBrZXJuZWwgc3RhY2sKPj4+ICsgICAgICAgICogYWxyZWFk
eSB3ZSBvbmx5IGhhdmUgU1AgdG8gdXNlIGFzIGEgc2NyYXRjaCByZWdpc3Rlci4gIFNvIHdlIGp1
c3QKPj4+ICsgICAgICAgICogc3dhcCBpbiB0aGUgYWRkcmVzcyBvZiB0aGUgc3BpbmxvY2ssIGFz
IHRoYXQncyBkZWZpbmF0ZWx5IG5vbi16ZXJvLgo+Pj4gKyAgICAgICAgKgo+Pj4gKyAgICAgICAg
KiBQYWlycyB3aXRoIGEgc3RvcmVfcmVsZWFzZSBpbiBoYW5kbGVfYmFkX3N0YWNrKCkuCj4+PiAr
ICAgICAgICAqLwo+Pj4gKzE6ICAgICBsYSBzcCwgc3Bpbl9zaGFkb3dfc3RhY2sKPj4+ICsgICAg
ICAgUkVHX0FNT1NXQVBfQVEgc3AsIHNwLCAoc3ApCj4+PiArICAgICAgIGJuZXogc3AsIDFiCj4+
PiArCj4+PiAgICAgICAgbGEgc3AsIHNoYWRvd19zdGFjawo+Pj4gICAgICAgIGFkZGkgc3AsIHNw
LCBTSEFET1dfT1ZFUkZMT1dfU1RBQ0tfU0laRQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4+IGluZGV4
IGJiNmE0NTBmMGVjYy4uYmU1NGNjZWE4YzQ3IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+Pj4gQEAg
LTIxMywxMSArMjEzLDI5IEBAIGFzbWxpbmthZ2UgdW5zaWduZWQgbG9uZyBnZXRfb3ZlcmZsb3df
c3RhY2sodm9pZCkKPj4+ICAgICAgICAgICAgICAgIE9WRVJGTE9XX1NUQUNLX1NJWkU7Cj4+PiB9
Cj4+PiAKPj4+ICsvKgo+Pj4gKyAqIEEgcHNldWRvIHNwaW5sb2NrIHRvIHByb3RlY3QgdGhlIHNo
YWRvdyBzdGFjayBmcm9tIGJlaW5nIHVzZWQgYnkgbXVsdGlwbGUKPj4+ICsgKiBoYXJ0cyBjb25j
dXJyZW50bHkuICBUaGlzIGlzbid0IGEgcmVhbCBzcGlubG9jayBiZWNhdXNlIHRoZSBsb2NrIHNp
ZGUgbXVzdAo+Pj4gKyAqIGJlIHRha2VuIHdpdGhvdXQgYSB2YWxpZCBzdGFjayBhbmQgb25seSBh
IHNpbmdsZSByZWdpc3RlciwgaXQncyBvbmx5IHRha2VuCj4+PiArICogd2hpbGUgaW4gdGhlIHBy
b2Nlc3Mgb2YgcGFuaWNpbmcgYW55d2F5IHNvIHRoZSBwZXJmb3JtYW5jZSBhbmQgZXJyb3IKPj4+
ICsgKiBjaGVja2luZyBhIHByb3BlciBzcGlubG9jayBnaXZlcyB1cyBkb2Vzbid0IG1hdHRlci4K
Pj4+ICsgKi8KPj4+ICt1bnNpZ25lZCBsb25nIHNwaW5fc2hhZG93X3N0YWNrOwo+Pj4gKwo+Pj4g
YXNtbGlua2FnZSB2b2lkIGhhbmRsZV9iYWRfc3RhY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+
PiB7Cj4+PiAgICAgICAgdW5zaWduZWQgbG9uZyB0c2tfc3RrID0gKHVuc2lnbmVkIGxvbmcpY3Vy
cmVudC0+c3RhY2s7Cj4+PiAgICAgICAgdW5zaWduZWQgbG9uZyBvdmZfc3RrID0gKHVuc2lnbmVk
IGxvbmcpdGhpc19jcHVfcHRyKG92ZXJmbG93X3N0YWNrKTsKPj4+IAo+Pj4gKyAgICAgICAvKgo+
Pj4gKyAgICAgICAgKiBXZSdyZSBkb25lIHdpdGggdGhlIHNoYWRvdyBzdGFjayBieSB0aGlzIHBv
aW50LCBhcyB3ZSdyZSBvbiB0aGUKPj4+ICsgICAgICAgICogb3ZlcmZsb3cgc3RhY2suICBUZWxs
IGFueSBvdGhlciBjb25jdXJyZW50IG92ZXJmbG93aW5nIGhhcnRzIHRoYXQKPj4+ICsgICAgICAg
ICogdGhleSBjYW4gcHJvY2VlZCB3aXRoIHBhbmljaW5nIGJ5IHJlbGVhc2luZyB0aGUgcHNldWRv
LXNwaW5sb2NrLgo+Pj4gKyAgICAgICAgKgo+Pj4gKyAgICAgICAgKiBUaGlzIHBhaXJzIHdpdGgg
YW4gYW1vc3dhcC5hcSBpbiBoYW5kbGVfa2VybmVsX3N0YWNrX292ZXJmbG93Lgo+Pj4gKyAgICAg
ICAgKi8KPj4+ICsgICAgICAgc21wX3N0b3JlX3JlbGVhc2UoJnNwaW5fc2hhZG93X3N0YWNrLCAw
KTsKPj4+ICsKPj4+ICAgICAgICBjb25zb2xlX3ZlcmJvc2UoKTsKPj4+IAo+Pj4gICAgICAgIHBy
X2VtZXJnKCJJbnN1ZmZpY2llbnQgc3RhY2sgc3BhY2UgdG8gaGFuZGxlIGV4Y2VwdGlvbiFcbiIp
Owo+Pj4gLS0KPj4+IDIuMzguMQo+Pj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
