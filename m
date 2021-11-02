Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A75C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 03:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27F060EBC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 03:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F27F060EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xvp6rqspB8rmLo5gwjwKDtalm14G3x4hVK3yn1gdXMM=; b=EZ9Xl/JybCN6MggT/8ePV9FGbU
	CPI63vayj3tRfI8gqp9A+CLVph/LK66u30NmJgYMjelP80BrercoVaZFP/SPNHWz49ra6b0aN8P4Q
	3Y34aDBzlsFqYhVVScCi1Yrro6pBk+kPedIZCH32FMj1M1rtY5m/k7POv0pqcItM06tw1lnNZvcUA
	pmGX1g1laBwlrJB8ZPaNC8qgGC/xnY1qeOEayrnr59GszfINAiT+jOTbtVZEz6BAXBbGxFNDumK0x
	a7ravjl91N+jUZuH/1yiZSF+oBzAiVLw66NaP8PUYUOWNkuZeKPAQIvP+2H9EqEGJE1RQN/t8sHFC
	B9ARjrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhkqY-000U9e-WA; Tue, 02 Nov 2021 03:52:27 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhkqS-000U7r-QU; Tue, 02 Nov 2021 03:52:23 +0000
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HjwsD3t9Hz1DJ4d;
 Tue,  2 Nov 2021 11:50:08 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 dggeme706-chm.china.huawei.com (10.1.199.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 2 Nov 2021 11:52:11 +0800
Subject: Re: [PATCH 2/3] RISC-V: use memcpy for kexec_file mode
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nick Kossifidis
 <mick@ics.forth.gr>, <jszhang@kernel.org>, <guoren@linux.alibaba.com>, Pekka
 Enberg <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>, <changbin.du@intel.com>, Alex Ghiti
 <alex@ghiti.fr>, linux-riscv <linux-riscv@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20211030031832.165457-1-liaochang1@huawei.com>
 <20211030031832.165457-3-liaochang1@huawei.com> <87ee83goju.fsf@disp2133>
 <CAJ+HfNjaBQrBtOuMvTccbb2K-Ua=T1eZk0+70hp0_aOAc83A-Q@mail.gmail.com>
 <87a6inbmrl.fsf@disp2133>
From: "liaochang (A)" <liaochang1@huawei.com>
Message-ID: <fb0d251a-8c94-0710-757a-7cd9bbdb008c@huawei.com>
Date: Tue, 2 Nov 2021 11:52:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87a6inbmrl.fsf@disp2133>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme706-chm.china.huawei.com (10.1.199.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_205221_981325_496F6102 
X-CRM114-Status: GOOD (  19.90  )
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

CgrlnKggMjAyMS8xMS8yIDU6MTUsIEVyaWMgVy4gQmllZGVybWFuIOWGmemBkzoKPiBCasO2cm4g
VMO2cGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gT24gU2F0LCAzMCBP
Y3QgMjAyMSBhdCAwNTo1MSwgRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVkZXJtQHhtaXNzaW9uLmNv
bT4gd3JvdGU6Cj4+Pgo+Pj4gTGlhbyBDaGFuZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPiB3cml0
ZXM6Cj4+Pgo+Pj4+IFRoZSBwb2ludGVyIHRvIGJ1ZmZlciBsb2FkaW5nIGtlcm5lbCBiaW5hcmll
cyBpcyBpbiBrZXJuZWwgc3BhY2UgZm9yCj4+Pj4ga2V4ZWNfZmlsIG1vZGUsIFdoZW4gY29weV9m
cm9tX3VzZXIgY29waWVzIGRhdGEgZnJvbSBwb2ludGVyIHRvIGEgYmxvY2sKPj4+PiBvZiBtZW1v
cnksIGl0IGNoZWNrZXMgdGhhdCB0aGUgcG9pbnRlciBpcyBpbiB0aGUgdXNlciBzcGFjZSByYW5n
ZSwgb24KPj4+PiBSSVNDVi1WIHRoYXQgaXM6Cj4+Pj4KPj4+PiBzdGF0aWMgaW5saW5lIGJvb2wg
X19hY2Nlc3Nfb2sodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4+Pj4g
ewo+Pj4+ICAgICAgIHJldHVybiBzaXplIDw9IFRBU0tfU0laRSAmJiBhZGRyIDw9IFRBU0tfU0la
RSAtIHNpemU7Cj4+Pj4gfQo+Pj4+Cj4+Pj4gYW5kIFRBU0tfU0laRSBpcyAweDQwMDAwMDAwMDAg
Zm9yIDY0LWJpdHMsIHdoaWNoIG5vdyBjYXVzZXMKPj4+PiBjb3B5X2Zyb21fdXNlciB0byByZWpl
Y3QgdGhlIGFjY2VzcyBvZiB0aGUgZmllbGQgJ2J1Zicgb2Ygc3RydWN0Cj4+Pj4ga2V4ZWNfc2Vn
bWVudCB0aGF0IGlzIGluIHJhbmdlIFtDT05GSUdfUEFHRV9PRkZTRVQgLSBWTUFMTE9DX1NJWkUs
Cj4+Pj4gQ09ORklHX1BBR0VfT0ZGU0VUKSwgaXMgaW52YWxpZCB1c2VyIHNwYWNlIHBvaW50ZXIu
Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMgaXNzdWUgYnkgc2tpcHBpbmcgYWNjZXNz
X29rKCksIHVzZSBtZW1wY3koKSBpbnN0ZWFkLgo+Pj4KPj4+IEkgYW0gYSBiaXQgY29uZnVzZWQu
Cj4+Pgo+Pj4gV2h5IGlzIG1hY2hpbmVfa2V4ZWMgZXZlciBjYWxsaW5nIGNvcHlfZnJvbV91c2Vy
PyAgVGhhdCBzZWVtcyB3cm9uZyBpbgo+Pj4gYWxsIGNhc2VzLgo+Pj4KPj4KPj4gSXQncyBub3Qg
bWFjaGluZV9rZXhlYyAtLSBpdCdzIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZSwgd2hpY2ggcHVsbHMg
b3V0Cj4+IHRoZSBGRFQgZnJvbSB0aGUgaW1hZ2UuIEl0IGxvb2tzIGxpa2UgTUlQUyBkb2VzIGl0
IHNpbWlsYXJseS4KPj4KPj4gKENhdmVhdDogSSBtaWdodCBiZSBjb25mdXNlZCBhcyB3ZWxsISA7
LSkpCj4gCj4gVHJ1ZSBpdCBpcyBtYWNoaW5lX2tleGVjX3ByZXBhcmUuICBCdXQgc3RpbGwuICBj
b3B5X2Zyb21fdXNlciBkb2VzIG5vdAo+IGJlbG9uZyBpbiB0aGVyZS4gIEl0IGlzIG5vdCBwYXNz
ZWQgYSB1c2Vyc3BhY2UgcG9pbnRlci4KPiAKPiBUaGlzIGxvb2tzIG1vcmUgbGlrZSBhIGNhc2Ug
Zm9yIGttYXAgdG8gcmVhZCBhIHRhYmxlIGZyb20gdGhlIGZpcm13YXJlLgoKVGhhbmtzIGZvciBh
bGwgeW91ciBjb21tZW50cy4KCkFzIEkga25vdywgdGhlc2UgYnVmZmVyIHBvaW50ZWQgYnkga2V4
ZWNfc2VnbWVudCBvYmplY3QgaGVyZSBhcmUgYWxsb2NhdGVkIGluCnVzZXJzcGFjZSBhbmQgcGFz
c2VkIGludG8ga2VybmVsIHZpYSBzeXNfa2V4ZWNfbG9hZCBzeXNjYWxsLCB0aGF0IGlzIHdoeSBp
dAp1c2VzIGNvcHlfZnJvbV91c2VyIHRvIHJlYWQgZGF0YSBmcm9tIHRoZXNlIG1lbW9yeSwgcGVy
aGFwcyBOaWNrIEtvc3NpZmlkcwpjb3VsZCBleHBsYWluIGl0IGZ1cnRoZXIuCgpEbyB5b3UgbWVh
biBpdCBtYWtlcyBzZW5zZSB0byByZW1hcCB0aGUgcG9pbnRlciB0byBrZXJuZWwgc3BhY2UgdXNp
bmcgQVBJIGxpa2UKdmlydF90b19wYWdlIGFuZCBrYW1wLHRoZW4gcmVhZCBkYXRhIHZpYSBtZW1j
cHksIHNvIHRoYXQgbm8gbWF0dGVyIHdoaWNoIGFkZHJlc3MKc3BhY2UgdGhlIG9yaWdpbmFsIHBv
aW50ZXIgYmVsb25ncyB0byx0aGUgYWJzdHJhY3Rpb24gd2lsbCBzbWVsbCBiZXR0ZXIuCgo+IAo+
IEV2ZW4gaWYgaXQgc29tZW9uZSBtYWRlIHNlbnNlIGl0IGRlZmluaXRlbHkgZG9lcyBub3QgbWFr
ZSBzZW5zZSB0bwo+IG1ha2UgaXQgYSBjb25kaXRpb25hbCBjb3B5X2Zyb21fdXNlci4gIFRoYXQg
d2F5IGxpZXMgbWFkbmVzcy4KPiAKPiBUaGUgZW50aXJlIGNoYW5nZSBpcyBhIHNtZWxsIHRoYXQg
dGhlcmUgaXMgc29tZSBhYnN0cmFjdGlvbiB0aGF0IGlzCj4gZ29pbmcgd3JvbmcsIGFuZCB0aGF0
IGFic3RyYWN0aW9uIG5lZWRzIHRvIGdldCBmaXhlZC4KPiAKPiBFcmljCj4gCj4gLgo+IAoKLS0g
CkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
