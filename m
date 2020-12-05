Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929E0C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 08:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EB622D6F
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 08:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35EB622D6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DWIKIVQ2NWVwGWgaKvyOpwlQS9CewNZ9BwwEV1L44lM=; b=sHgHVSZZvak1fIPdUTokdApYJ
	WqBT5TdjNNtRupPv9aCNH10H9xNMNQDw8idez6p1ZUOCkqzQrNqqFEmJDfX4gSfiUoY5Am5DtAo5E
	UveCH766onkFkCvWinC1Hw8S3mf++4U2GJZNV/hTyqb7RJJzfk/nDSzxQV/CdVnv6EatWGblbRDED
	SdIHHOKU7WEsOyeX2CEdbVN/BKPWf0PIOzEHX1drY8VcwEw1LS2zCB8lWgX3dsDDKSyUzibXgi4Zq
	+NWXYbn8GQkYHBM8FMQRa9UBzvCSAorbMeyEl99HDaA6gN1aOyn/HcYPkbHdZACyTBbg9nJCcJVsD
	bG7LK6Kmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klSUE-00054V-QN; Sat, 05 Dec 2020 08:00:10 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klSUC-00053d-AY
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 08:00:09 +0000
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MplHR-1kO9jt45Nt-00qBo5; Sat, 05 Dec 2020 08:59:57 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: Jason Wang <jasowang@redhat.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
Date: Sat, 5 Dec 2020 08:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
Content-Language: tl
X-Provags-ID: V03:K1:fmf8zmU7UovplPda5nl+RpiFSt1qDxdLkQdEMe1Op9Sb2CoIBur
 LcsUsmJr84nPI4UGjlYMmGl0YroG1FRq6PZdswvQrQOSOIv8wPOvnyhMMqajWosPYS+bA4B
 h+k6UFHJqdyg2fvtt2m+HSsZHV6msqa+8gzWkJ1pjGypWmiFAqSoZTVa4yHg5Fupd0KnZOn
 W4HS2cW1UncG4c/YnFTJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xnKf40qLm5c=:ql0OiQ6eBB/iTqDKHMTrMY
 NWqR5M+A8owYBTjmYsl4qqMniudtWHA9Zx9NH86N+h5RERCXItrOE32hLUs6NDOSn1H6AuvQv
 g0028vq6yGuOCTDYG4y/LGr2wHjUhgB29HGjuTsAt93WCaj7fhroZzPqjWhRsL6gpzKwaDkKE
 L+twFPGuHHOo6XD+FuNvhcT3fvKUjpMfcRsOPOFreXlW7HMECoayGA+02/xEvPNi7h2UuNVI/
 DIra58ZTGv+knDmojnLsEsBMznTERhW9yfsLWPZuv6/qERyZG6XeDZwhuRq0y3Hi57bDm7RLJ
 uzVEJnDKRhfoKuKuUEXQDmtDDXVljNBbrDueniX7ldFVy+ym31eppFJDsu9T53MH0230JWcU8
 3SYOZ83+s2H2Em6LUrHFmb1av5VpYEipmf2eB28AfjUrbzwfn8oMiXbYB9cMI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_030008_603606_7CD7BCE2 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: corbet@lwn.net, mst@redhat.com, linus.walleij@linaro.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQuMTIuMjAgMDQ6MzUsIEphc29uIFdhbmcgd3JvdGU6Cgo+PiAtLS0gYS9kcml2ZXJzL2dw
aW8vS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZwo+PiBAQCAtMTYxNSw2ICsx
NjE1LDE1IEBAIGNvbmZpZyBHUElPX01PQ0tVUAo+PiDCoMKgwqDCoMKgwqDCoCB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9ncGlvL2dwaW8tbW9ja3VwLnNoLiBSZWZlcmVuY2UgdGhlCj4+IHVzYWdl
IGluCj4+IMKgwqDCoMKgwqDCoMKgIGl0Lgo+PiDCoCArY29uZmlnIEdQSU9fVklSVElPCj4+ICvC
oMKgwqAgdHJpc3RhdGUgIlZpcnRJTyBHUElPIHN1cHBvcnQiCj4+ICvCoMKgwqAgZGVwZW5kcyBv
biBWSVJUSU8KPiAKPiAKPiBMZXQncyB1c2Ugc2VsZWN0LCBzaW5jZSB0aGVyZSdzIG5vIHByb21w
dCBmb3IgVklSVElPIGFuZCBpdCBkb2Vzbid0IGhhdmUKPiBhbnkgZGVwZW5kZW5jaWVzLgoKd2hv
b3BzLCBpdCdzIG5vdCB0aGF0IHNpbXBsZToKCm1ha2U6IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hv
bWUvbmVrcmFkL3NyYy9hcHUyLWRldi9wa2cva2VybmVsLmFwdTIuZ2l0JwptYWtlWzFdOiBFbnRl
cmluZyBkaXJlY3RvcnkKJy9ob21lL25la3JhZC9zcmMvZGsvRGlzdHJvS2l0L3BsYXRmb3JtLXg4
Nl82NC9idWlsZC10YXJnZXQvbGludXgtNS44LjktYnVpbGQnCiAgR0VOICAgICBNYWtlZmlsZQpk
cml2ZXJzL2dwdS9kcm0vS2NvbmZpZzo3NDplcnJvcjogcmVjdXJzaXZlIGRlcGVuZGVuY3kgZGV0
ZWN0ZWQhCmRyaXZlcnMvZ3B1L2RybS9LY29uZmlnOjc0OglzeW1ib2wgRFJNX0tNU19IRUxQRVIg
aXMgc2VsZWN0ZWQgYnkKRFJNX1ZJUlRJT19HUFUKZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29u
ZmlnOjI6CXN5bWJvbCBEUk1fVklSVElPX0dQVSBkZXBlbmRzIG9uIFZJUlRJTwpkcml2ZXJzL3Zp
cnRpby9LY29uZmlnOjI6CXN5bWJvbCBWSVJUSU8gaXMgc2VsZWN0ZWQgYnkgR1BJT19WSVJUSU8K
ZHJpdmVycy9ncGlvL0tjb25maWc6MTYxODoJc3ltYm9sIEdQSU9fVklSVElPIGRlcGVuZHMgb24g
R1BJT0xJQgpkcml2ZXJzL2dwaW8vS2NvbmZpZzoxNDoJc3ltYm9sIEdQSU9MSUIgaXMgc2VsZWN0
ZWQgYnkgSTJDX01VWF9MVEM0MzA2CmRyaXZlcnMvaTJjL211eGVzL0tjb25maWc6NDc6CXN5bWJv
bCBJMkNfTVVYX0xUQzQzMDYgZGVwZW5kcyBvbiBJMkMKZHJpdmVycy9pMmMvS2NvbmZpZzo4Oglz
eW1ib2wgSTJDIGlzIHNlbGVjdGVkIGJ5IEZCX0REQwpkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25m
aWc6NjM6CXN5bWJvbCBGQl9EREMgZGVwZW5kcyBvbiBGQgpkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tj
b25maWc6MTI6CXN5bWJvbCBGQiBpcyBzZWxlY3RlZCBieSBEUk1fS01TX0ZCX0hFTFBFUgpkcml2
ZXJzL2dwdS9kcm0vS2NvbmZpZzo4MDoJc3ltYm9sIERSTV9LTVNfRkJfSEVMUEVSIGRlcGVuZHMg
b24KRFJNX0tNU19IRUxQRVIKClNlZW1zIHRoYXQgd2UgY2FuIG9ubHkgZGVwZW5kIG9uIG9yIHNl
bGVjdCBzb21lIHN5bWJvbCAtIHdlIHJ1biBpbnRvCmh1Z2UgdHJvdWJsZSBpZiB0aGF0cyBtaXhl
ZC4gSnVzdCBjaGFuZ2VkIERSTV9WSVJUSU9fR1BVIHRvIGp1c3Qgc2VsZWN0ClZJUklPIGluc3Rl
YWQgb2YgZGVwZW5kaW5nIG9uIGl0LCBhbmQgbm93IGl0IHdvcmtzLgoKSSd2ZSBwb3N0ZWQgYW5v
dGhlciBwYXRjaCBmb3IgZml4aW5nIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vS2NvbmZpZwp0byB1
c2UgJ3NlbGVjdCcgaW5zdGVhZCBvZiAnZGVwZW5kcyBvbicuCgotLSAKLS0tCkhpbndlaXM6IHVu
dmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVuZCBtYW5p
cHVsaWVydAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11bmlrYXRpb24gc2Vu
ZGVuIFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0tLQpFbnJpY28gV2Vp
Z2VsdCwgbWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBl
bmdpbmVlcmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
