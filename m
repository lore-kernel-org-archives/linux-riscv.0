Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFCC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BrHMYYnZf14w94swizYJJFfCrIUqKrMgEBPTx4pveI=; b=XwuSuLeu+WsXkv
	JwyFAvbNSQoXS1p4cxwqCyOOueekurVTYgveqLzhDirRUwgZoE/XweF8rrV3diwUP/5HLdcwYNZlW
	SbqL3EPqPZrGhwX7S+MqlkMkNqBy73ltdSZG3Uj1CX4Qj6lHatAqhb9HGMwk4muSd8pY4kqKo0iFq
	ImwSdxotfSxMKL3WEiLQzeN6vBDsUdpVP0sHoqKvGhA0+2yWXxGyAkm2c2uIe3sF8OBNVJ3Da9/Q7
	lfqHlSdzTBwys/Lecd1wYcM+YPNbN4XlXxUcLCrdtcjND2evf5QxM4piR1WjCPpkNQbJ6zw23E2vY
	M9C94FJKVsOv4xtcsfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pysf0-005YM6-2n;
	Tue, 16 May 2023 11:16:06 +0000
Received: from forward501c.mail.yandex.net ([178.154.239.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pysev-005YJb-1g
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 11:16:05 +0000
Received: from mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:5508:0:640:704d:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id DE5B85EC2F;
	Tue, 16 May 2023 14:15:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id rFZKUqBLcmI0-RIroBFBW;
	Tue, 16 May 2023 14:15:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684235755;
	bh=lMrZOJIB5Kq7XBazm3gjVU6sMhxH4y9CP6MxFx5bCrg=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=qo5pn4E6x10c59nkLDhfTnwDxBnodn3LJx3xTeuKTeXxVfhtiGjQjNuiDQQI1FNX6
	 DrW7a73W2NDiruYW6gJZd84PXw1ppl/Bke6eQNLxMcHli632y1MlByYNGAEhbweUYX
	 HvBYCPhvtwsbiY56ppdgQfKdw8R3ViKdukAX8DUY=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <28d0792b81db018aeb644096898693694b2841bc.camel@maquefel.me>
Subject: Re: [PATCH 1/2] perf tools riscv: Allow get_cpuid return empty
 MARCH and MIMP
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Adrian
 Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nikita Shubin <n.shubin@yadro.com>,  linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Tue, 16 May 2023 17:15:54 +0300
In-Reply-To: <IA1PR20MB49532515E0DD00227B7CE5F3BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <680f2d5d146a38083a28198f1a8a3694654bf8f8.camel@maquefel.me>
	 <IA1PR20MB49532515E0DD00227B7CE5F3BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_041601_731923_33249205 
X-CRM114-Status: GOOD (  16.04  )
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

T24gVHVlLCAyMDIzLTA1LTE2IGF0IDE3OjQzICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
ID4gPiBUaGUgVC1IRUFEIEM5eHggc2VyaWVzIENQVSBvbmx5IGhhcyBNVkVORE9SIGRlZmluZWQs
IGFuZCBsZWZ0Cj4gPiA+IE1BUkNICj4gPiA+IGFuZCBNSU1QIHVuaW1wbGVtZW50ZWQuCj4gPiAK
PiA+IEFjY29yZGluZyB0byB0aGUgZG9jcyB5b3UgY2FuIHN0aWxsIHJlYWQgdGhlbSwgYnV0IGl0
J3MgaGFyZHdpcmVkCj4gPiB0bwo+ID4gNjRoMC4KPiA+IAo+ID4gSG93IGl0J3Mgc3VwcG9zZWQg
dG8gZGlzdGluZ3Vpc2ggYzkwNiBhbmQgYzkxMCBmb3IgZXhhbXBsZSA/Cj4gCj4gSXQgaXMgdW5u
ZWNlc3NhcnkgdG8gZGlzdGluZ3Vpc2ggYzl4eCwgdGhlaXIgZXZlbnQgaW5kZXggaXMKPiBjb21w
YXRpYmxlLgo+IFRoZSBkdGIgYW5kIG9wZW5zYmkgd2lsbCBmaW5hbCBkZWNpZGUgd2hpY2ggZXZl
bnQgY2FuIGJlIHVzZWQuCj4gCj4gPiBXaGF0IGRvZXMgL3Byb2MvY3B1aW5mbyBzaG93cyBvbiBj
OXh4ID8gV2h5IGNhbid0IHdlIHVzZSB6ZXJvZXMgPwo+IAo+IFRoZSBjb250ZW50IGlzIGFzIGZv
bGxvd3MuCj4gCj4gcHJvY2Vzc29ywqDCoMKgwqAgOiAwCj4gaGFydMKgwqDCoMKgwqDCoMKgwqDC
oCA6IDAKPiBpc2HCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IHJ2NjRpbWFmZGMKPiBtbXXCoMKgwqDC
oMKgwqDCoMKgwqDCoCA6IHN2MzkKPiB1YXJjaMKgwqDCoMKgwqDCoMKgwqAgOiB0aGVhZCxjOTEw
Cj4gbXZlbmRvcmlkwqDCoMKgwqAgOiAweDViNwo+IG1hcmNoaWTCoMKgwqDCoMKgwqAgOiAweDAK
PiBtaW1waWTCoMKgwqDCoMKgwqDCoCA6IDB4MAoKVGhlbiB3aHkgZG8geW91IG5lZWQgZmlyc3Qg
cGF0Y2ggdGhlbiA/CgptYXJjaGlkLCBtaW1waWQgd2lsbCBuZXZlciBiZSBOVUxMIHRoZXkgIjB4
MCIgYW5kICIweDAiIHN0cmluZ3MKcmVzcGVjdGl2ZWx5LgoKSG93IGhhdmUgeW91IHRlc3RlZCBp
dCA/wqAKClRoZXJlIG5vIHdheSAiMHg1YjctMHgwMDAwMDAwMDAwMDAwMDAwLTB4W1s6eGRpZ2l0
Ol1dKyIgd2lsbCBtYXRjaAoiMHg1YjctMHgwLTB4MCIgd2hpY2ggY3B1aWQgaW4geW91ciBjYXNl
LgoKSnVzdCBkcm9wIHRoaXMgcGF0Y2guCgpBbnl3YXkgIlBBR0VSPWNhdCBwZXJmIGxpc3QgcG11
IiBnaXZlcyBtZSBhbiBlbXB0eSBsaXN0IG9uIGxpY2hlZXJ2LgoKPiAKPiBUaGUgYG12ZW5kb3Jp
ZGAsIGBtYXJjaGlkYCwgYG1pbXBpZGAgYXJlIHRoZSBzYW1lIGFjcm9zcyBhbGx3aW5uZXIgRDEK
PiAoQzkwNiksCj4gVC1IRUFEIHRoMTUyMCAoQzkxMCkgYW5kIHRoZSBzb3BoZ28gbWFuZ28gKEM5
MjApLiBJdCBzZWVtcyBULUhFQUQgdXNlCj4gTUNQVUlECj4gQ1NSIHRvIHN0b3JlIENQVSBpbmZv
LiBCdXQgdGhpcyBpcyBub3Qgc3RhbmRhcmQgYW5kIG5vdCBzaG93biBpbgo+IGNwdWluZm8uCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
