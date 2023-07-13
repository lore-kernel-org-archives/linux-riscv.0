Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AAFEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6UF6IXa2BkXHnhWp5y3+3IPl6/EnmhGb330wB3ep28=; b=ZMQoqesYFOr5D7
	vcvBCRa/KnO4PLv1GUWmRicmouFGI+gXhXI+uPQ0E8eb4/XbBJSJecECzqUpOZ07FlX7cKjWu3nL2
	3/kSzmhXNU9ocVw4e5KBaS46kzDeM2eMHC2Etpn5iLfcQLnEl7RIpmKhK8I+wqrSruhyBgg16gP43
	5DfoZ73nZCRR5ZR8nLjOCN2ceKQ/ILrgNVQu76+DFWrQRSXGgkXBSrCOS9YChxkTpDhvEalNJF3SJ
	WBVGPrOQljbSlX0DLm3ULv2fH1qUfyqGT4irR/UFFinFiljHhapNz1y6aj5KWu6jdDc6CR33vpZ6H
	iFCyjbPPahx1+Jz3LgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJl50-001d99-0r;
	Thu, 13 Jul 2023 01:25:14 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJl4x-001d7x-1g
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 01:25:13 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-57026f4bccaso524117b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689211504; x=1691803504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqHFSQOzO/XxaRJXgZdmByKAXPqRNRjyMIQrSCq8enU=;
        b=TR1zcSgLsGdmzMtZo6rrfSeyFREsDN1hEgUGIQnsUj6D/y4MixnzaKm0TUUXUraFwe
         2F0LDbtwW4iuL6ZL9pCKL4rUTrOqCSCZZRR9ZFV0WoW1dkCim58yW/WWVsrghjNXlKHI
         5KYpB2Da5i3luvXCWoava16QYYilQTAcmlSJnvpc2sIm3Zmk+G7Gv5Hr7YveQ4qOK4to
         SO/jex5T3nRzAkV4ClyWpLIIFaLioFJ+90gVR7MVjnXN8KDSJ8xzKMchFpyrSqxTLhyk
         ZfvVMbaN1aMIp7RpifwWEHhDY2vrz2gUCcIuHkwiugM9TNL+d82KgwTlzLyGMlc0psdx
         VCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689211504; x=1691803504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DqHFSQOzO/XxaRJXgZdmByKAXPqRNRjyMIQrSCq8enU=;
        b=lXr6imZOnN9EHVem8HuT8nFAO9pJqQKjg06jyNdcPSB7ooMDDJ4Ld/v6LxmqFsuApW
         4nKjQUaccbNV/7VVpZD7nnOixUig/czfalUrB5yZE0rOsyFj8loCfkIiPCNotg6007s3
         LrxKx6m92ljc/Wi4BTLkouZf4fGqvDO94x2S24KTdVj//Q2t/3LBHE0ht0YfsMtyMckV
         yVNhAmzOXhoBfps2aqvc5M+MvHVbu707G3S9Q8WoOn5YW5UUc8/r09rcxN3VVW5prty9
         M0s2VZDFsBkY2dpA5blSD2seynGcWnXI6YLB5G6OeNkTIUTTBre3FwBs61RvVuV3lbmr
         P4lw==
X-Gm-Message-State: ABy/qLbuLXH1kAaRSP8s5eGvmLhw1Dx984HCWFvk5zjDsmtuUgHmBAyE
	NOqNu/20y+ita4QlLyBEN1E=
X-Google-Smtp-Source: APBJJlHMBHkj00RvSRUYQ/QogWDePOSIDqsqlln4XBVpRRSHweZVWOWEEd9nwa8rVbMVL9IY//hSLg==
X-Received: by 2002:a0d:e615:0:b0:565:e48d:32cf with SMTP id p21-20020a0de615000000b00565e48d32cfmr366971ywe.7.1689211504176;
        Wed, 12 Jul 2023 18:25:04 -0700 (PDT)
Received: from [0.0.0.0] ([5.180.77.117])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902b60e00b001ac591b0500sm4599862pls.134.2023.07.12.18.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 18:25:03 -0700 (PDT)
Message-ID: <ced7dc06-bbc9-afa1-6973-b992871eac11@gmail.com>
Date: Thu, 13 Jul 2023 09:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: correct pt_level name via pgtable_l5/4_enabled
To: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-05add620-8132-496a-a514-4b78c78b3694@palmer-ri-x1c9a>
From: Song Shuai <suagrfillet@gmail.com>
In-Reply-To: <mhng-05add620-8132-496a-a514-4b78c78b3694@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_182511_558913_882A53FA 
X-CRM114-Status: GOOD (  18.56  )
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

CgrlnKggMjAyMy83LzEyIDIxOjU4LCBQYWxtZXIgRGFiYmVsdCDlhpnpgZM6Cj4gT24gVHVlLCAx
MSBKdWwgMjAyMyAwNDoxNDoxMCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3cm90ZToKPj4g
SGkgU29uZywKPj4KPj4KPj4gT24gMTEvMDcvMjAyMyAxMjo1MiwgU29uZyBTaHVhaSB3cm90ZToK
Pj4+IFRoZSBwdF9sZXZlbCB1c2VzIENPTkZJR19QR1RBQkxFX0xFVkVMUyB0byBkaXNwbGF5IHBh
Z2UgdGFibGUgbmFtZXMuCj4+PiBCdXQgaWYgZG93bmdyYWRpbmcgcGFnZSBtb2RlIGZyb20ga2Vy
bmVsIGNtZGxpbmUgaW4gNjRCSVQsIGl0IHdpbGwKPj4+IGdpdmUgYSB3cm9uZyBuYW1lLgo+Pj4K
Pj4+IExpa2UsIHVzaW5nIG5vNGx2bCBmb3Igc3YzOSwgcHRkdW1wIG5hbWVkIHRoZSAxRy1tYXBw
aW5nIGFzICJQVUQiCj4+PiB0aGF0IHNob3VsZCBiZSAiUEdEIjoKPj4+Cj4+PiAweGZmZmZmZmQ4
NDAwMDAwMDAtMHhmZmZmZmZkOTAwMDAwMDAwwqDCoMKgIDB4MDAwMDAwMDBjMDAwMDAwMCAgICAg
ICAgIAo+Pj4gM0cgUFVEwqDCoMKgwqAgRCBBIEcgLiAuIFcgUiBWCj4+Pgo+Pj4gU28gc2VsZWN0
ICJQNEQvUFVEIiBvciAiUEdEIiB2aWEgcGd0YWJsZV9sNS80X2VuYWJsZWQgdG8gY29ycmVjdCBp
dC4KPj4+Cj4+PiBGaXhlczogMjZlN2FhY2I4M2RmICgicmlzY3Y6IEFsbG93IHRvIGRvd25ncmFk
ZSBwYWdpbmcgbW9kZSBmcm9tIHRoZSAKPj4+IGNvbW1hbmQgbGluZSIpCj4+PiBTaWduZWQtb2Zm
LWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+IMKgIGFy
Y2gvcmlzY3YvbW0vcHRkdW1wLmMgfCA1ICsrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMg
Yi9hcmNoL3Jpc2N2L21tL3B0ZHVtcC5jCj4+PiBpbmRleCAyMGE5Zjk5MWE2ZDcuLmNmZGQzMjc5
ODFlZSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMKPj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvbW0vcHRkdW1wLmMKPj4+IEBAIC0zODQsNiArMzg0LDExIEBAIHN0YXRpYyBpbnQg
X19pbml0IHB0ZHVtcF9pbml0KHZvaWQpCj4+Pgo+Pj4gwqDCoMKgwqDCoCBrZXJuZWxfcHRkX2lu
Zm8uYmFzZV9hZGRyID0gS0VSTl9WSVJUX1NUQVJUOwo+Pj4KPj4+ICsjaWZkZWYgQ09ORklHXzY0
QklUCj4+PiArwqDCoMKgIHBnX2xldmVsWzFdLm5hbWUgPSBwZ3RhYmxlX2w1X2VuYWJsZWQgPyAi
UDREIiA6ICJQR0QiOwo+Pj4gK8KgwqDCoCBwZ19sZXZlbFsyXS5uYW1lID0gcGd0YWJsZV9sNF9l
bmFibGVkID8gIlBVRCIgOiAiUEdEIjsKPj4+ICsjZW5kaWYKPj4KPj4KPj4gWW91IGRvbid0IG5l
ZWQgdGhlICNpZmRlZiBoZXJlIGFzIHBndGFibGVfbFhfZW5hYmxlZCBhcmUgYWx3YXlzIGRlY2xh
cmVkLgo+Pgo+Pgo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShwZ19sZXZlbCk7IGkrKykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwg
QVJSQVlfU0laRShwdGVfYml0cyk7IGorKykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBnX2xldmVsW2ldLm1hc2sgfD0gcHRlX2JpdHNbal0ubWFzazsKPj4KPj4KPj4gVGhlIEZpeGVz
IHRhZyBpcyB3cm9uZyB0byBtZSwgaWYgc2F0cCBtb2RlIGlzIHJlc3RyaWN0ZWQgYnkgdGhlIGhh
cmR3YXJlCj4+IGl0c2VsZiAobm90IGZyb20gdGhlIGNvbW1hbmQgbGluZSksIHRoZSBzYW1lIHBy
b2JsZW0gaGFwcGVucy4gTWF5YmUgdGhhdAo+PiBzaG91bGQgYmUgdGhlIHN2NDggaW50cm9kdWN0
aW9uIHBhdGNoPyBPciB0aGUgc3Y1Nz8gSXQgd2lsbCBiZSBtb3JlCj4+IGN1bWJlcnNvbWUgdG8g
YmFja3BvcnQgd2l0aCB0aGUgc3Y0OCBpbnRyb2R1Y3Rpb24gdGhvdWdoIGFzIHRoaXMgcGF0Y2gK
Pj4gd29uJ3QgYXBwbHkgYXMtaXMuCj4gCj4gU29tZXRpbWVzIGl0J3MgZWFzaWVyIHRvIGJhc2Ug
dGhlIGZpeCBvbiB0aGUgb3JpZ2luYWwgb2ZmZW5kaW5nIGNvbW1pdCAKPiBhbmQgdGhlbiBmb3J3
YXJkLXBvcnQgaXQgdmlhIGEgbWVyZ2UsIEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhpcyBvbmUgdG8g
Cj4ga25vdyBmb3Igc3VyZSB0aG91Z2guCj4gCj4+IE90aGVyd2lzZSwgeW91IGNhbiBhZGQ6Cj4+
Cj4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
Cj4gCj4gVGhhbmtzLgo+IAo+IFNvbmc6IGRvIHlvdSBoYXZlIGEgdjIgdGhhdCBhZGRyZXNzZXMg
dGhlIGNvbW1lbnRzPwo+IApIZXJlIGlzIFYyIDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMwNzEyMTE1NzQwLjk0MzMyNC0xLXN1YWdyZmlsbGV0QGdtYWlsLmNvbS8K
Pj4KPj4gVGhhbmtzLAo+Pgo+PiBBbGV4CgotLSAKVGhhbmtzClNvbmcgU2h1YWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
