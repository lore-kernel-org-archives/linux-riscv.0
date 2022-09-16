Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED28FECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcB/QqNDNe79QHNOGXqVyJ1GucOv/FO70NmqD/BDzt0=; b=jW/NN5rt6YbXpE
	03eCSvcbwG8u0N/VaDkSaQvvs4WLZWVkh0btsu281TBMfNGYqZHpfOAmBwlntGEs+V/CTReIoEUso
	LQu1WV/PoRfoKJ568mPWETv6m72fXen/ZwsivOo73EEFvvPK2ezv0OvePq9Ikbco8s6C6tb9Gb3Cq
	5RacaMD8U5VK1eiOUGx4Yrf1UDeXgK86iC/YBujwtY4lSxJuzvlSV7m10OgC/s7t3TcMZH23BVio6
	QOSVYgPMYvmqLBsU5NOJ9DU/+gvmB6aasvIvH3hBVD5ohy6Rrb+DNmWN9nQdo/qHDh74QMLVa88BM
	4VZkMmrEzw5h1Hbg9vTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYzsO-004NoH-Gf; Fri, 16 Sep 2022 01:10:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYzsL-004NmD-E9; Fri, 16 Sep 2022 01:10:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b75so14489366pfb.7;
        Thu, 15 Sep 2022 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=hr/gJPcU5hvQZ/MKgVwi2KwSsJ/0TzKkNDXlKjCB2Yw=;
        b=hq/LIZNAoz+v9v5PWfa/0aKD/JB/tXkKxHIojwHn30BdKNQ5Be3G0BaUU/zSYBJeE9
         ZLRcqcxf0IDv61ZhN3/kOqcYUToLQAGW/EjhSW4TrFFz9Bqw+yJyw6+Y21pYn3ywkugA
         JniDjX5JcG8m+H85hzbd3loI476IGJYE6L2/G3cL1NfdXgiVnH9OkTHI/WNBlcsCgoy5
         g9uCl3lHdNcq9lab3lKR95Gy8j5E77OSw8jBZYVJGKBEcNBuiYVGD3iTUzbt+3PGUA5n
         JN6BFkpeFxXKeqmd35cSdKJ5epc1LwvYjnXD/rPy7wE+YH+9cFaQxJc+tbgJ5HWLDqSc
         5Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=hr/gJPcU5hvQZ/MKgVwi2KwSsJ/0TzKkNDXlKjCB2Yw=;
        b=nVwjYu9VW4sAduz77JSHSS10LfjHSo53n2gvsKv7q1ZQSYS2Z2a+fbY4shO/4KOYDT
         crGQRIGaryDrQ8WKaB+3pYs8bAYNqz01M4qMOtugYZfFOd3TVxKxyupP3M0WxxBwp5gu
         8R6AI3yD7nhgLX292RKGTI/Lr4MFbYsFcCAYbrem+pljSLu+yH9DObOPGqjkU+Gireov
         X8ZMGFKq8CVh+smwk4KyiYBCyQXXXlSwkkeKAmR7johzYRj2GJjxvypj/Hg7q1f4MRw+
         +u0ZihRsiol4ZSprlDJ55mu9m1O8PmU5eFYXtdurSiB0jaznj3BQDUYE2IPc/eG6juuo
         d8aA==
X-Gm-Message-State: ACrzQf1sBsASUf+bxeNYUOeMSn2idBH07kzoZxHyvrqmGBYRkw4am0Pt
	+Q0B4mkvoVNsdXMkwKtMbpQ=
X-Google-Smtp-Source: AMsMyM5HLVuDEFZ7yFGWlTXtrR5ixkZIR3wBKnru30CnmTKTvOjZydafHw2K7xojMyDBGaMDjl15+A==
X-Received: by 2002:a05:6a00:1342:b0:545:4d30:eecb with SMTP id k2-20020a056a00134200b005454d30eecbmr2511913pfu.69.1663290634936;
        Thu, 15 Sep 2022 18:10:34 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b00176b3d7db49sm13769119plg.0.2022.09.15.18.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 18:10:33 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 16 Sep 2022 11:10:25 +1000
Message-Id: <CMXFBGZGQCQR.2FRWNY2JHBVL9@bobo>
Cc: <linux-s390@vger.kernel.org>, <kvm@vger.kernel.org>, "Fabiano Rosas"
 <farosas@linux.ibm.com>, <x86@kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alex Williamson"
 <alex.williamson@redhat.com>, <kvm-riscv@lists.infradead.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, <linux-riscv@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>, <kvmarm@lists.cs.columbia.edu>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexey Kardashevskiy" <aik@ozlabs.ru>, <kvm-ppc@vger.kernel.org>
X-Mailer: aerc 0.11.0
References: <20220504074807.3616813-1-aik@ozlabs.ru>
 <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
 <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
In-Reply-To: <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_181037_502227_C4C67B9A 
X-CRM114-Status: GOOD (  18.29  )
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

U2VlbXMgb2theSB0byBtZSwgaXQgcHJvYmFibHkgYmV0dGVyIGdvIHRocm91Z2ggdGhlIEtWTSB0
cmVlIHRob3VnaC4KCkFja2VkLWJ5OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29t
PgoKVGhhbmtzLApOaWNrCgpPbiBUdWUgU2VwIDEzLCAyMDIyIGF0IDEwOjUwIFBNIEFFU1QsIEFs
ZXhleSBLYXJkYXNoZXZza2l5IHdyb3RlOgo+IFBpbmc/IEl0J3MgYmVlbiBhIHdoaWxlIGFuZCBw
cm9iYWJseSBnb3QgbG9zdCA6LS8KPgo+IE9uIDE4LzA1LzIwMjIgMTY6MjcsIEFsZXhleSBLYXJk
YXNoZXZza2l5IHdyb3RlOgo+ID4gCj4gPiAKPiA+IE9uIDUvNC8yMiAxNzo0OCwgQWxleGV5IEth
cmRhc2hldnNraXkgd3JvdGU6Cj4gPj4gV2hlbiBpbnRyb2R1Y2VkLCBJUlFGRCByZXNhbXBsaW5n
IHdvcmtlZCBvbiBQT1dFUjggd2l0aCBYSUNTLiBIb3dldmVyCj4gPj4gS1ZNIG9uIFBPV0VSOSBo
YXMgbmV2ZXIgaW1wbGVtZW50ZWQgaXQgLSB0aGUgY29tcGF0aWJpbGl0eSBtb2RlIGNvZGUKPiA+
PiAoIlhJQ1Mtb24tWElWRSIpIG1pc3NlcyB0aGUga3ZtX25vdGlmeV9hY2tlZF9pcnEoKSBjYWxs
IGFuZCB0aGUgbmF0aXZlCj4gPj4gWElWRSBtb2RlIGRvZXMgbm90IGhhbmRsZSBJTlR4IGluIEtW
TSBhdCBhbGwuCj4gPj4KPiA+PiBUaGlzIG1vdmVkIHRoZSBjYXBhYmlsaXR5IHN1cHBvcnQgYWR2
ZXJ0aXNpbmcgdG8gcGxhdGZvcm1zIGFuZCBzdG9wcwo+ID4+IGFkdmVydGlzaW5nIGl0IG9uIFhJ
VkUsIGkuZS4gUE9XRVI5IGFuZCBsYXRlci4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFsZXhl
eSBLYXJkYXNoZXZza2l5IDxhaWtAb3psYWJzLnJ1Pgo+ID4+IC0tLQo+ID4+Cj4gPj4KPiA+PiBP
ciBJIGNvdWxkIG1vdmUgdGhpcyBvbmUgdG9nZXRoZXIgd2l0aCBLVk1fQ0FQX0lSUUZELiBUaG91
Z2h0cz8KPiA+IAo+ID4gCj4gPiBQaW5nPwo+ID4gCj4gPj4KPiA+PiAtLS0KPiA+PiDCoCBhcmNo
L2FybTY0L2t2bS9hcm0uY8KgwqDCoMKgwqDCoCB8IDMgKysrCj4gPj4gwqAgYXJjaC9taXBzL2t2
bS9taXBzLmPCoMKgwqDCoMKgwqAgfCAzICsrKwo+ID4+IMKgIGFyY2gvcG93ZXJwYy9rdm0vcG93
ZXJwYy5jIHwgNiArKysrKysKPiA+PiDCoCBhcmNoL3Jpc2N2L2t2bS92bS5jwqDCoMKgwqDCoMKg
wqAgfCAzICsrKwo+ID4+IMKgIGFyY2gvczM5MC9rdm0va3ZtLXMzOTAuY8KgwqAgfCAzICsrKwo+
ID4+IMKgIGFyY2gveDg2L2t2bS94ODYuY8KgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+ID4+IMKg
IHZpcnQva3ZtL2t2bV9tYWluLmPCoMKgwqDCoMKgwqDCoCB8IDEgLQo+ID4+IMKgIDcgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQva3ZtL2FybS5jIGIvYXJjaC9hcm02NC9rdm0vYXJtLmMKPiA+PiBp
bmRleCA1MjNiYzkzNGZlMmYuLjA5MmYwNjE0YmFlMyAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL2Fy
bTY0L2t2bS9hcm0uYwo+ID4+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2FybS5jCj4gPj4gQEAgLTIx
MCw2ICsyMTAsOSBAQCBpbnQga3ZtX3ZtX2lvY3RsX2NoZWNrX2V4dGVuc2lvbihzdHJ1Y3Qga3Zt
ICprdm0sIAo+ID4+IGxvbmcgZXh0KQo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1fQ0FQX1NFVF9H
VUVTVF9ERUJVRzoKPiA+PiDCoMKgwqDCoMKgIGNhc2UgS1ZNX0NBUF9WQ1BVX0FUVFJJQlVURVM6
Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfUFRQX0tWTToKPiA+PiArI2lmZGVmIENPTkZJ
R19IQVZFX0tWTV9JUlFGRAo+ID4+ICvCoMKgwqAgY2FzZSBLVk1fQ0FQX0lSUUZEX1JFU0FNUExF
Ogo+ID4+ICsjZW5kaWYKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IDE7Cj4gPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1fQ0FQX1NFVF9HVUVT
VF9ERUJVRzI6Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rdm0vbWlwcy5jIGIvYXJjaC9t
aXBzL2t2bS9taXBzLmMKPiA+PiBpbmRleCBhMjVlMGI3M2VlNzAuLjBmM2RlNDcwYTczZSAxMDA2
NDQKPiA+PiAtLS0gYS9hcmNoL21pcHMva3ZtL21pcHMuYwo+ID4+ICsrKyBiL2FyY2gvbWlwcy9r
dm0vbWlwcy5jCj4gPj4gQEAgLTEwNzEsNiArMTA3MSw5IEBAIGludCBrdm1fdm1faW9jdGxfY2hl
Y2tfZXh0ZW5zaW9uKHN0cnVjdCBrdm0gCj4gPj4gKmt2bSwgbG9uZyBleHQpCj4gPj4gwqDCoMKg
wqDCoCBjYXNlIEtWTV9DQVBfUkVBRE9OTFlfTUVNOgo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1f
Q0FQX1NZTkNfTU1VOgo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1fQ0FQX0lNTUVESUFURV9FWElU
Ogo+ID4+ICsjaWZkZWYgQ09ORklHX0hBVkVfS1ZNX0lSUUZECj4gPj4gK8KgwqDCoCBjYXNlIEtW
TV9DQVBfSVJRRkRfUkVTQU1QTEU6Cj4gPj4gKyNlbmRpZgo+ID4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByID0gMTsKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPj4gwqDCoMKgwqDCoCBj
YXNlIEtWTV9DQVBfTlJfVkNQVVM6Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0v
cG93ZXJwYy5jIGIvYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMKPiA+PiBpbmRleCA4NzVjMzBj
MTJkYjAuLjg3Njk4ZmZlZjNiZSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Bvd2VycGMva3ZtL3Bv
d2VycGMuYwo+ID4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vcG93ZXJwYy5jCj4gPj4gQEAgLTU5
MSw2ICs1OTEsMTIgQEAgaW50IGt2bV92bV9pb2N0bF9jaGVja19leHRlbnNpb24oc3RydWN0IGt2
bSAqa3ZtLCAKPiA+PiBsb25nIGV4dCkKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4g
Pj4gwqAgI2VuZGlmCj4gPj4gKyNpZmRlZiBDT05GSUdfSEFWRV9LVk1fSVJRRkQKPiA+PiArwqDC
oMKgIGNhc2UgS1ZNX0NBUF9JUlFGRF9SRVNBTVBMRToKPiA+PiArwqDCoMKgwqDCoMKgwqAgciA9
ICF4aXZlX2VuYWJsZWQoKTsKPiA+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPj4gKyNlbmRp
Zgo+ID4+ICsKPiA+PiDCoMKgwqDCoMKgIGNhc2UgS1ZNX0NBUF9QUENfQUxMT0NfSFRBQjoKPiA+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGh2X2VuYWJsZWQ7Cj4gPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9y
aXNjdi9rdm0vdm0uYwo+ID4+IGluZGV4IGM3NjhmNzUyNzllZi4uYjU4NTc5YjM4NmJiIDEwMDY0
NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92bS5jCj4gPj4gQEAgLTYzLDYgKzYzLDkgQEAgaW50IGt2bV92bV9pb2N0bF9jaGVja19leHRl
bnNpb24oc3RydWN0IGt2bSAqa3ZtLCAKPiA+PiBsb25nIGV4dCkKPiA+PiDCoMKgwqDCoMKgIGNh
c2UgS1ZNX0NBUF9SRUFET05MWV9NRU06Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfTVBf
U1RBVEU6Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfSU1NRURJQVRFX0VYSVQ6Cj4gPj4g
KyNpZmRlZiBDT05GSUdfSEFWRV9LVk1fSVJRRkQKPiA+PiArwqDCoMKgIGNhc2UgS1ZNX0NBUF9J
UlFGRF9SRVNBTVBMRToKPiA+PiArI2VuZGlmCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSAx
Owo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+PiDCoMKgwqDCoMKgIGNhc2UgS1ZN
X0NBUF9OUl9WQ1BVUzoKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5j
IGIvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jCj4gPj4gaW5kZXggMTU2ZDFjMjVhM2MxLi44NWUw
OTNmYzhkMTMgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jCj4gPj4g
KysrIGIvYXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jCj4gPj4gQEAgLTU2NCw2ICs1NjQsOSBAQCBp
bnQga3ZtX3ZtX2lvY3RsX2NoZWNrX2V4dGVuc2lvbihzdHJ1Y3Qga3ZtICprdm0sIAo+ID4+IGxv
bmcgZXh0KQo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1fQ0FQX1NFVF9HVUVTVF9ERUJVRzoKPiA+
PiDCoMKgwqDCoMKgIGNhc2UgS1ZNX0NBUF9TMzkwX0RJQUczMTg6Cj4gPj4gwqDCoMKgwqDCoCBj
YXNlIEtWTV9DQVBfUzM5MF9NRU1fT1BfRVhURU5TSU9OOgo+ID4+ICsjaWZkZWYgQ09ORklHX0hB
VkVfS1ZNX0lSUUZECj4gPj4gK8KgwqDCoCBjYXNlIEtWTV9DQVBfSVJRRkRfUkVTQU1QTEU6Cj4g
Pj4gKyNlbmRpZgo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCByID0gMTsKPiA+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfU0VUX0dVRVNUX0RF
QlVHMjoKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3Zt
L3g4Ni5jCj4gPj4gaW5kZXggMGMwY2E1OTlhMzUzLi5hMGE3Yjc2OTQ4M2QgMTAwNjQ0Cj4gPj4g
LS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCj4gPj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4g
Pj4gQEAgLTQyNzMsNiArNDI3Myw5IEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tfZXh0ZW5zaW9u
KHN0cnVjdCBrdm0gCj4gPj4gKmt2bSwgbG9uZyBleHQpCj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtW
TV9DQVBfU1lTX0FUVFJJQlVURVM6Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfVkFQSUM6
Cj4gPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9DQVBfRU5BQkxFX0NBUDoKPiA+PiArI2lmZGVmIENP
TkZJR19IQVZFX0tWTV9JUlFGRAo+ID4+ICvCoMKgwqAgY2FzZSBLVk1fQ0FQX0lSUUZEX1JFU0FN
UExFOgo+ID4+ICsjZW5kaWYKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IDE7Cj4gPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4+IMKgwqDCoMKgwqAgY2FzZSBLVk1fQ0FQX0VYSVRf
SFlQRVJDQUxMOgo+ID4+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9r
dm0va3ZtX21haW4uYwo+ID4+IGluZGV4IDcwZTA1YWY1ZWJlYS4uODg1ZTcyZTY2OGE1IDEwMDY0
NAo+ID4+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiA+PiArKysgYi92aXJ0L2t2bS9rdm1f
bWFpbi5jCj4gPj4gQEAgLTQyOTMsNyArNDI5Myw2IEBAIHN0YXRpYyBsb25nIAo+ID4+IGt2bV92
bV9pb2N0bF9jaGVja19leHRlbnNpb25fZ2VuZXJpYyhzdHJ1Y3Qga3ZtICprdm0sIGxvbmcgYXJn
KQo+ID4+IMKgICNlbmRpZgo+ID4+IMKgICNpZmRlZiBDT05GSUdfSEFWRV9LVk1fSVJRRkQKPiA+
PiDCoMKgwqDCoMKgIGNhc2UgS1ZNX0NBUF9JUlFGRDoKPiA+PiAtwqDCoMKgIGNhc2UgS1ZNX0NB
UF9JUlFGRF9SRVNBTVBMRToKPiA+PiDCoCAjZW5kaWYKPiA+PiDCoMKgwqDCoMKgIGNhc2UgS1ZN
X0NBUF9JT0VWRU5URkRfQU5ZX0xFTkdUSDoKPiA+PiDCoMKgwqDCoMKgIGNhc2UgS1ZNX0NBUF9D
SEVDS19FWFRFTlNJT05fVk06Cj4gPiAKPgo+IC0tIAo+IEFsZXhleQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
