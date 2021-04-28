Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31478C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 07:26:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F56A613E8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 07:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F56A613E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wvh6UvG7zZstpy28/oNm/M0vg94jSSjdpjC4sGNSyZY=; b=EFHcRNgXocbS1Lrq4IietsiO1
	J5uZ+uQIw69g+JBoyZx+SdxMdlI1KkPdMRQfpn7TrM5QWZrF4x+eaP4RX4w9bzBJ9j48nlqTMJr/d
	LtsKkN9jg1iVAVBuNNS8FzUBZgH/vCwOV115lUiAzsb/fsepWJ3wQ7LuUsHnvtj9/iG8pzmfWEBLY
	z2tKJ700RixYfuyiBiubk2fpJiZzXHSdBdZlvv+oFJ1dQcm7A9UCDSGvBtTAd2/wgtqlE4AgjdAuj
	6HznGtzvqabbpXWkpJQukHn3jytHNxOW3WRZlr1Wq+fL0tfnXzRMg9NFq4Qr4EVEljhN7w7lQrVQ3
	s00Ag0A0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbeaR-0033B8-8a; Wed, 28 Apr 2021 07:26:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeaO-0033Ay-Lc
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 07:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=TM3MLp65499hHGiMocNpxl8i6ouKKivsOfe7ydtxibI=; b=pVmdyc+4FyiHR+6rzntOWw133N
 Z+gvPqj3ZxwFYdiL6vIuRqpFVVZOKGs3CcacolIczytLfomvoYX9coxThJ060WuZXqdtOfRttUTFY
 /gfNBYHtk4ciJVIZRXiRvn3uydk7rWfPiRlugseEQX+anyDleHGUX8FPxVaPOD4B/gVsNYu454b9F
 8y8rg6yAlSAfKPWsgzjqj13If7AFeohJ83KZ0c19CisTDLne0osvy3tYFnXxrKea07VcNnC8pO4p4
 6Tx0k+cZz2RMiAmliS7srWpT5Dw8SSdbKUKTIBQIP6YpCSVb/gS+Cejqi43dth6FiAKUV2q2LpBbH
 rzHx51yw==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeaL-00HFYL-QI
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 07:26:15 +0000
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 90F6624000F;
 Wed, 28 Apr 2021 07:26:03 +0000 (UTC)
Subject: Re: [PATCH] riscv: Remove 32b kernel mapping from page table dump
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-arch <linux-arch@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20210418112856.15078-1-alex@ghiti.fr>
 <CAAhSdy3csxeTiXgf8eKnRYhD7BM1LDLPddrn527AkA_-fiEGkw@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <16cd2359-2453-8184-cf96-2c02800abe8a@ghiti.fr>
Date: Wed, 28 Apr 2021 03:26:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy3csxeTiXgf8eKnRYhD7BM1LDLPddrn527AkA_-fiEGkw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_002614_009105_CEE3E548 
X-CRM114-Status: GOOD (  18.12  )
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

SGkgUGFsbWVyLAoKTGUgNC8yMC8yMSDDoCAxMjoxOSBBTSwgQW51cCBQYXRlbCBhIMOpY3JpdMKg
Ogo+IE9uIFN1biwgQXByIDE4LCAyMDIxIGF0IDQ6NTkgUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPiB3cm90ZToKPj4KPj4gVGhlIDMyYiBrZXJuZWwgbWFwcGluZyBsaWVzIGluIHRo
ZSBsaW5lYXIgbWFwcGluZywgdGhlcmUgaXMgbm8gcG9pbnQgaW4KPj4gcHJpbnRpbmcgaXRzIGFk
ZHJlc3MgaW4gcGFnZSB0YWJsZSBkdW1wLCBzbyByZW1vdmUgdGhpcyBsZWZ0b3ZlciB0aGF0Cj4+
IGNvbWVzIGZyb20gbW92aW5nIHRoZSBrZXJuZWwgbWFwcGluZyBvdXRzaWRlIHRoZSBsaW5lYXIg
bWFwcGluZyBmb3IgNjRiCj4+IGtlcm5lbC4KPj4KPj4gRml4ZXM6IGU5ZWZiMjFmZTM1MiAoInJp
c2N2OiBQcmVwYXJlIHB0ZHVtcCBmb3Igdm0gbGF5b3V0IGR5bmFtaWMgYWRkcmVzc2VzIikKPj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+IAo+IExvb2tz
IGdvb2QgdG8gbWUuCj4gCj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+Cj4gCj4gUmVnYXJkcywKPiBBbnVwCj4gCj4+IC0tLQo+PiAgIGFyY2gvcmlzY3YvbW0v
cHRkdW1wLmMgfCA2ICsrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3B0ZHVtcC5j
IGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwo+PiBpbmRleCAwYWJhNDQyMTExNWMuLmE0ZWQ0YmRi
YmZkZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwo+PiArKysgYi9hcmNo
L3Jpc2N2L21tL3B0ZHVtcC5jCj4+IEBAIC03Niw4ICs3Niw4IEBAIGVudW0gYWRkcmVzc19tYXJr
ZXJzX2lkeCB7Cj4+ICAgICAgICAgIFBBR0VfT0ZGU0VUX05SLAo+PiAgICNpZmRlZiBDT05GSUdf
NjRCSVQKPj4gICAgICAgICAgTU9EVUxFU19NQVBQSU5HX05SLAo+PiAtI2VuZGlmCj4+ICAgICAg
ICAgIEtFUk5FTF9NQVBQSU5HX05SLAo+PiArI2VuZGlmCj4+ICAgICAgICAgIEVORF9PRl9TUEFD
RV9OUgo+PiAgIH07Cj4+Cj4+IEBAIC05OSw4ICs5OSw4IEBAIHN0YXRpYyBzdHJ1Y3QgYWRkcl9t
YXJrZXIgYWRkcmVzc19tYXJrZXJzW10gPSB7Cj4+ICAgICAgICAgIHswLCAiTGluZWFyIG1hcHBp
bmcifSwKPj4gICAjaWZkZWYgQ09ORklHXzY0QklUCj4+ICAgICAgICAgIHswLCAiTW9kdWxlcyBt
YXBwaW5nIn0sCj4+IC0jZW5kaWYKPj4gICAgICAgICAgezAsICJLZXJuZWwgbWFwcGluZyAoa2Vy
bmVsLCBCUEYpIn0sCj4+ICsjZW5kaWYKPj4gICAgICAgICAgey0xLCBOVUxMfSwKPj4gICB9Owo+
Pgo+PiBAQCAtMzc5LDggKzM3OSw4IEBAIHN0YXRpYyBpbnQgcHRkdW1wX2luaXQodm9pZCkKPj4g
ICAgICAgICAgYWRkcmVzc19tYXJrZXJzW1BBR0VfT0ZGU0VUX05SXS5zdGFydF9hZGRyZXNzID0g
UEFHRV9PRkZTRVQ7Cj4+ICAgI2lmZGVmIENPTkZJR182NEJJVAo+PiAgICAgICAgICBhZGRyZXNz
X21hcmtlcnNbTU9EVUxFU19NQVBQSU5HX05SXS5zdGFydF9hZGRyZXNzID0gTU9EVUxFU19WQURE
UjsKPj4gLSNlbmRpZgo+PiAgICAgICAgICBhZGRyZXNzX21hcmtlcnNbS0VSTkVMX01BUFBJTkdf
TlJdLnN0YXJ0X2FkZHJlc3MgPSBrZXJuZWxfdmlydF9hZGRyOwo+PiArI2VuZGlmCj4+Cj4+ICAg
ICAgICAgIGtlcm5lbF9wdGRfaW5mby5iYXNlX2FkZHIgPSBLRVJOX1ZJUlRfU1RBUlQ7Cj4+Cj4+
IC0tCj4+IDIuMjAuMQo+PgoKRG8geW91IHRoaW5rIHlvdSBjYW4gdGFrZSB0aGlzIHBhdGNoIHRv
byBvbiBmb3ItbmV4dD8KClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
