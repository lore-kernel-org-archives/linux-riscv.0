Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6810DC44514
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4nvjvJgcd8vznVsAwNd89jo5RidWGyVqe5kjz5cOVs=; b=DfsuWRQ7UErJl2
	hjUpR0WwIkb0RdpXYwQOHor51PBKPF8t6YAvmtGjG1mx66ZlISE8n+4Ta1TY1ot7HzNAHJ013UpCq
	88OaorEZ3BWkoUka0Kd9QH+woR7OLmJZSRwvBtz5cc8Dlz6vJ4qzvthZpANuD5FZgOTdGQTpvWHwA
	kXeSF0oZD2GFc3iSyBH1i5vAJWOByK2DY8OfJjhdArVdDLQWPtGZxz8m8UA8E4ipFDbzwYY6GCCsS
	QMjVGjB8RhhUSYmxY/nMj7pKwFCTadihuFGga9xbuJk2NxP/X+EK7iQZArfwj8zCouucuj0CAtm1m
	Z8/4tgOieSqngV5vUTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdWL-00000001XwL-1qyZ;
	Fri, 17 Jul 2026 08:02:09 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdWI-00000001XtF-3V5i
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:02:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aeae771c49so8685095e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275325; x=1784880125; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH+yLFk3Aw4lH4jqAiEumDEHPBcsF7q6519WReefN7M=;
        b=JMKiVMg9WZsbX53r+Q2dMc8Fv4teKhRTdwR+kHWT+l28IkxLAY89UzieL6UfQflPeP
         QAqjVkqe+d4Ex8JLOGO9CapKFC2YTQfLQPqBVvD98PxGt4fva3HEv1hChuvarmautjyE
         HJihHidY0UhxQBSBFKkkcdur46jjWZ0ZLsVwezIvRdW/7TXUqbJPr40TGcDfmft6l2fF
         WSydTgo7CMA647Lv2vJTHUB55lnJB6JPmASY5W97yLeFaT9jqIbyR9taWmsD7H2bJlq8
         sDYyFB8oG6oDMNVQBtdK4AQ/YOYrYQXzna3sij4mW07LAdhIPd+g+X7Zl0VwIbwuPLem
         oGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275325; x=1784880125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oH+yLFk3Aw4lH4jqAiEumDEHPBcsF7q6519WReefN7M=;
        b=MXMwTrfBjRtXIIOS5ODj4bHgsR95wpeLe6WFGMFuhwlHcHWiQBoJZJBlFCYRoZFKih
         PxV/MRmyvuUiS4ITWih/DfMlseVkCnFFmE1Bwimi2oNQU+xoPzlM0JjmuWnBLdeZQhUP
         quOpwUlcWZef45VhIAISswwSTAhIMHVHKrYMKU3U7ksolc7QUUNzhqAejvxV4pDJZ2in
         705L3aZnnFoQZOVRRl809MnJG5uU2NCjs8cPDvaOKl6i+YAZGghK/zq5sHiUqGZoDHVa
         I4K111XqK/5SmksqhJNov/ziA3W5FcJDYXvNVGneH2ls1960rE8LORB7YTaylIT0CtDl
         dfHw==
X-Forwarded-Encrypted: i=1; AHgh+RoJLJc3N8zhtNIiY8qvXG2zb6loDvKiA6ASxrNZdYy63IuqvRdZLigzFhsFw/RNQIblhLMi5UAVDSWbaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJzMfdWVY011RVMnBHfO/eoRmgdNc3N7qYu5Ex25ECOnK92jFc
	L4+HoK1R3us0jxNDTCXCHmmQ2fOVUVC879GP2FOm0CexvpkAro30mrRj
X-Gm-Gg: AfdE7cmqgUJMy5L2mXd/fedvSuyHNvpIckoSZKMWManp8qLgUZ02gwcaWeE6Gz7Tppq
	OhxIxpw9Jzi1GLbfmpy6VVC3O1EtdoNvSVD+r2+u8widTXSC0YAInFSc64k7YMFowlCmmaAGYiI
	lHOZWksmEi1/U3xfEf/XmsfSZye1+K2R2M5lnaJ5IbOrF3pvmSxJRwH/g4I0LU0SSzGTfCtCLkS
	PNyFXW1jcAQCHduw7z1zQT0btM8qdH0JQMYym4EsTvq4E8Px1VfhCXGVJrBoeC5JJAQPdl7JHnR
	jzJay4/h8Tz+aUIBvyoxQqcCdXbWUFgAbc+1oBGZfeSOs0Hd0dN9RVKZ0E6GOl8TwCNopnu2QN6
	3H807EGXm4l7H0j3K9ZN3lMz8SVOs4nZDwIfWM7NPSYr/T5rigqOK+6W7fas2DzagOYgP3he0xz
	8m1YU=
X-Received: by 2002:a05:6512:4016:b0:5b0:1e16:f3a2 with SMTP id 2adb3069b0e04-5b28fab789fmr419231e87.57.1784275324370;
        Fri, 17 Jul 2026 01:02:04 -0700 (PDT)
Received: from localhost ([2001:678:a5c:1204:cb38:5197:bb61:a137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e189d2sm156673e87.61.2026.07.17.01.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:02:03 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:02:03 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 2/3] riscv: mm: Apply Svinval in update_mmu_cache()
Message-ID: <alngORUZHewFLKtD@parmesan.int.kasm.eu>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-3-luxu.kernel@bytedance.com>
 <alfO7SMOMstFvt25@soda.int.kasm.eu>
 <CGME20260717070900eucas1p11e7d4abd6e0c32fa18fca2940cdcca70@eucas1p1.samsung.com>
 <e8fd6114-192e-408c-8f6b-7dfaffe91b62@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8fd6114-192e-408c-8f6b-7dfaffe91b62@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010206_921679_A3B95A7F 
X-CRM114-Status: GOOD (  30.73  )
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

T24gMjAyNi0wNy0xNyAwOTowODo1OSArMDIwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBP
biAxNS4wNy4yMDI2IDIwOjIyLCBLbGFyYSBNb2RpbiB3cm90ZToKPiA+IE9uIDIwMjYtMDctMTUg
MjE6MjA6MDggKzA4MDAsIFh1IEx1IHdyb3RlOgo+ID4+IFVzZSBTdmludmFsIGluIHVwZGF0ZV9t
bXVfY2FjaGVfcmFuZ2UoKSB3aGVuIHRoZSBleHRlbnNpb24gaXMgYXZhaWxhYmxlLgo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gPiBU
aGlzIHZlcnNpb24gd29ya3MgZmluZSBmb3IgbWUuCj4gCj4gTHVja3kgWW91ISBIZXJlwqBCUGlG
MyBnZXRzIGZyb3plbiBvbmNlIHVzZXJzcGFjZSBoYXPCoHN0YXJ0ZWQuCgpUaGUgb2xkIHZlcnNp
b24gb2YgcGF0Y2ggMSBvZiB0aGUgc2VyaWVzIHdhcyB1c2VkIHdoZW4gdGhlIHNlcmllcyB3YXMK
YXBwbGllZCBmb3IgbmV4dCwgd2hlcmVhcyBJIHJldmVydGVkIHRoZSBvbGQgc2VyaWVzIGFuZCBh
cHBsaWVkIHRoZQplbnRpcmV0eSBvZiB0aGUgc2Vjb25kIHZlcnNpb24gd2hlbiBJIHRlc3RlZC4g
SSBjb21tZW50ZWQgdGhpcyBvbiBwYXRjaAoxLgoKUmVnYXJkcywKS2xhcmEgTW9kaW4KCj4gCj4g
Cj4gPiBUaGFua3MsCj4gPiBUZXN0ZWQtYnk6IEtsYXJhIE1vZGluIDxrbGFyYXNtb2RpbkBnbWFp
bC5jb20+Cj4gPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aCAgfCAgOCArKysrKysrKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgg
fCAxOCArKysrKysrKysrKysrKysrKysKPiA+PiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAg
ICAgICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAo+ID4+IGluZGV4IDk5MjY1NTYwOTlhZS4uODIzODA1Y2M0NjVhIDEwMDY0NAo+ID4+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+PiBAQCAtNTc4LDYgKzU3OCwxNCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKPiA+PiAgCWlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRf
U1ZWUFRDKSkKPiA+PiAgCQlyZXR1cm47Cj4gPj4gIAo+ID4+ICsJaWYgKHJpc2N2X2hhc19leHRl
bnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVklOVkFMKSkgewo+ID4+ICsJCWxvY2FsX3Nm
ZW5jZV93X2ludmFsKCk7Cj4gPj4gKwkJd2hpbGUgKG5yLS0pCj4gPj4gKwkJCWxvY2FsX3NpbnZh
bF92bWEoYWRkcmVzcyArIG5yICogUEFHRV9TSVpFLCBhc2lkKTsKPiAKPiAnYXNpZCcgaXMgbm90
IGluaXRpYWxpemVkIGhlcmUuIFRoZSBmb2xsb3dpbmcgZml4dXAgaXMgbmVlZGVkOgo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggM2MxN2FkMDc4NmFiLi5lMjgzNjQ5ZTFkZWUg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC01NzAsMzIgKzU3MCwzMiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQg
KnZtZiwKPiDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBTdnZwdGMgZ3Vh
cmFudGVlcyB0aGF0IHRoZSBuZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRoaW4KPiDC
oMKgwqDCoMKgwqDCoMKgICogYSBib3VuZGVkIHRpbWVmcmFtZSwgc28gd2hlbiB0aGUgdWFyY2gg
ZG9lcyBub3QgY2FjaGUgaW52YWxpZAo+IMKgwqDCoMKgwqDCoMKgwqAgKiBlbnRyaWVzLCB3ZSBk
b24ndCBoYXZlIHRvIGRvIGFueXRoaW5nLgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDC
oMKgwqDCoCBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NW
VlBUQykpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiAKPiArwqDC
oMKgwqDCoMKgIGFzaWQgPSBnZXRfbW1fYXNpZCh2bWEtPnZtX21tKTsKPiDCoMKgwqDCoMKgwqDC
oCBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NWSU5WQUwp
KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvY2FsX3NmZW5jZV93X2ludmFs
KCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlIChuci0tKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9jYWxfc2ludmFsX3Zt
YShhZGRyZXNzICsgbnIgKiBQQUdFX1NJWkUsIGFzaWQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBsb2NhbF9zZmVuY2VfaW52YWxfaXIoKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiAKPiDCoMKgwqDCoMKgwqDC
oCAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBUaGUga2VybmVsIGFzc3VtZXMgdGhhdCBUTEJzIGRv
bid0IGNhY2hlIGludmFsaWQgZW50cmllcywgYnV0Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIGluIFJJ
U0MtViwgU0ZFTkNFLlZNQSBzcGVjaWZpZXMgYW4gb3JkZXJpbmcgY29uc3RyYWludCwgbm90IGEK
PiDCoMKgwqDCoMKgwqDCoMKgICogY2FjaGUgZmx1c2g7IGl0IGlzIG5lY2Vzc2FyeSBldmVuIGFm
dGVyIHdyaXRpbmcgaW52YWxpZCBlbnRyaWVzLgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBSZWx5aW5n
IG9uIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgd291bGQgc3VmZmljZSwgYnV0Cj4gwqDC
oMKgwqDCoMKgwqDCoCAqIHRoZSBleHRyYSB0cmFwcyByZWR1Y2UgcGVyZm9ybWFuY2UuwqAgU28s
IGVhZ2VybHkgU0ZFTkNFLlZNQS4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDC
oCBhc2lkID0gZ2V0X21tX2FzaWQodm1hLT52bV9tbSk7Cj4gwqDCoMKgwqDCoMKgwqAgd2hpbGUg
KG5yLS0pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvY2FsX2ZsdXNoX3RsYl9w
YWdlX2FzaWQoYWRkcmVzcyArIG5yICogUEFHRV9TSVpFLCBhc2lkKTsKPiDCoH0KPiAKPiDCoCNk
ZWZpbmUgdXBkYXRlX21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXApIFwKPiDCoMKgwqDCoMKgwqDC
oCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKE5VTEwsIHZtYSwgYWRkciwgcHRlcCwgMSkKPiAKPiDC
oCNkZWZpbmUgdXBkYXRlX21tdV90bGJfcmFuZ2Uodm1hLCBhZGRyLCBwdGVwLCBucikgXAo+IAo+
IAo+IAo+ID4+ICsJCWxvY2FsX3NmZW5jZV9pbnZhbF9pcigpOwo+ID4+ICsJCXJldHVybjsKPiA+
PiArCX0KPiA+PiArCj4gPj4gIAkvKgo+ID4+ICAJICogVGhlIGtlcm5lbCBhc3N1bWVzIHRoYXQg
VExCcyBkb24ndCBjYWNoZSBpbnZhbGlkIGVudHJpZXMsIGJ1dAo+ID4+ICAJICogaW4gUklTQy1W
LCBTRkVOQ0UuVk1BIHNwZWNpZmllcyBhbiBvcmRlcmluZyBjb25zdHJhaW50LCBub3QgYQo+ID4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+PiBpbmRleCA3YzJjZDVjYzkyZDMuLjk2MzZk
MDdmZTllZSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+PiBAQCAt
MjAsNiArMjAsMjQgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9tbV9hc2lkKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ID4+ICAJcmV0dXJuIG1tID8gY250eDJhc2lkKGF0b21pY19s
b25nX3JlYWQoJm1tLT5jb250ZXh0LmlkKSkgOiBGTFVTSF9UTEJfTk9fQVNJRDsKPiA+PiAgfQo+
ID4+ICAKPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX3NmZW5jZV9pbnZhbF9pcih2b2lk
KQo+ID4+ICt7Cj4gPj4gKwlhc20gdm9sYXRpbGUoU0ZFTkNFX0lOVkFMX0lSKCkgOjo6ICJtZW1v
cnkiKTsKPiA+PiArfQo+ID4+ICsKPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX3NmZW5j
ZV93X2ludmFsKHZvaWQpCj4gPj4gK3sKPiA+PiArCWFzbSB2b2xhdGlsZShTRkVOQ0VfV19JTlZB
TCgpIDo6OiAibWVtb3J5Iik7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBsb2NhbF9zaW52YWxfdm1hKHVuc2lnbmVkIGxvbmcgdm1hLCB1bnNpZ25lZCBsb25nIGFzaWQp
Cj4gPj4gK3sKPiA+PiArCWlmIChhc2lkICE9IEZMVVNIX1RMQl9OT19BU0lEKQo+ID4+ICsJCWFz
bSB2b2xhdGlsZShTSU5WQUxfVk1BKCUwLCAlMSkgOiA6ICJyIiAodm1hKSwgInIiIChhc2lkKSA6
ICJtZW1vcnkiKTsKPiA+PiArCWVsc2UKPiA+PiArCQlhc20gdm9sYXRpbGUoU0lOVkFMX1ZNQSgl
MCwgemVybykgOiA6ICJyIiAodm1hKSA6ICJtZW1vcnkiKTsKPiA+PiArfQo+ID4+ICsKPiA+PiAg
c3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9hbGwodm9pZCkKPiA+PiAgewo+ID4+
ICAJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1hIiA6IDogOiAibWVtb3J5Iik7Cj4g
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+ID4+IGluZGV4IDczYzIyNmY3MTljNy4uOTYyZGIzMDBhMTY2IDEwMDY0NAo+
ID4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYwo+ID4+IEBAIC0xMSwyNCArMTEsNiBAQAo+ID4+ICAKPiA+PiAgI2RlZmlu
ZSBoYXNfc3ZpbnZhbCgpCXJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VY
VF9TVklOVkFMKQo+ID4+ICAKPiA+PiAtc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX3NmZW5jZV9p
bnZhbF9pcih2b2lkKQo+ID4+IC17Cj4gPj4gLQlhc20gdm9sYXRpbGUoU0ZFTkNFX0lOVkFMX0lS
KCkgOjo6ICJtZW1vcnkiKTsKPiA+PiAtfQo+ID4+IC0KPiA+PiAtc3RhdGljIGlubGluZSB2b2lk
IGxvY2FsX3NmZW5jZV93X2ludmFsKHZvaWQpCj4gPj4gLXsKPiA+PiAtCWFzbSB2b2xhdGlsZShT
RkVOQ0VfV19JTlZBTCgpIDo6OiAibWVtb3J5Iik7Cj4gPj4gLX0KPiA+PiAtCj4gPj4gLXN0YXRp
YyBpbmxpbmUgdm9pZCBsb2NhbF9zaW52YWxfdm1hKHVuc2lnbmVkIGxvbmcgdm1hLCB1bnNpZ25l
ZCBsb25nIGFzaWQpCj4gPj4gLXsKPiA+PiAtCWlmIChhc2lkICE9IEZMVVNIX1RMQl9OT19BU0lE
KQo+ID4+IC0JCWFzbSB2b2xhdGlsZShTSU5WQUxfVk1BKCUwLCAlMSkgOiA6ICJyIiAodm1hKSwg
InIiIChhc2lkKSA6ICJtZW1vcnkiKTsKPiA+PiAtCWVsc2UKPiA+PiAtCQlhc20gdm9sYXRpbGUo
U0lOVkFMX1ZNQSglMCwgemVybykgOiA6ICJyIiAodm1hKSA6ICJtZW1vcnkiKTsKPiA+PiAtfQo+
ID4+IC0KPiA+PiAgLyoKPiA+PiAgICogRmx1c2ggZW50aXJlIFRMQiBpZiBudW1iZXIgb2YgZW50
cmllcyB0byBiZSBmbHVzaGVkIGlzIGdyZWF0ZXIKPiA+PiAgICogdGhhbiB0aGUgdGhyZXNob2xk
IGJlbG93Lgo+ID4+IC0tIAo+ID4+IDIuMzkuNQo+ID4+Cj4gQmVzdCByZWdhcmRzCj4gLS0gCj4g
TWFyZWsgU3p5cHJvd3NraSwgUGhECj4gU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
