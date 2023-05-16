Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AE9C7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSBHD85fQXjOw6E1Lx9dpbTyruYpPbu4guNhLtswSh8=; b=iGiW4bDEt84IIZ
	PJYBSLqJjsf1AP6rlO276aeafLk4T7ccWFsP/+tW5vcxNiB36/MsZQu/WwnHdtPiXM0dcJSRn1a+9
	GQOQBe3wZm3dpQarjCb144i4/AKUulNk5uMKw9Jk2+1KNTFCTbGD0LHltD9tNic12XVc4lO9eFghq
	YQWecf2Pw9bTYGx/iId/+A60zWV3xhV8mq3EHBYp7R48CU6CbkjnYLhN7vLOPv3bXV0XmODJJbw9D
	vySwGjmH5gZIuw+kN9h2moq/8u7tdWmmbVw8pCJKVFHAB1x+XszjZ5OJe783D/HuCXKxa+BAU9f5f
	GdmKNxOt2pzXIPwTIomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypAa-004f7k-19;
	Tue, 16 May 2023 07:32:28 +0000
Received: from forward501c.mail.yandex.net ([178.154.239.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypAX-004f5r-1b
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:32:27 +0000
Received: from mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:a716:0:640:8b36:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id 579785EA23;
	Tue, 16 May 2023 10:32:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id IWV7H95W0Gk0-2hQZJWns;
	Tue, 16 May 2023 10:32:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684222340;
	bh=MFjNdJMYyp7CuQaOvoVqnCB28BDnLblM6oVyHYcfyno=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=TnZzKCBtKXwa5wyHOdpB5g/glPTYIxg4OJtlOKqpf4lyTmj+eyPJuPQ3ZIDNyVidW
	 MJvKxuPFmhvV2zgFsaVyHLr11/DCItE+6NhakoZhBl5IqJCv0e5cQ9s6ZNk5ASVZoI
	 lBr2xnRw1xeOl7LLoOP0/cOmLJ9fkmQrG/OoKr6Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <df1ffa574ca014cf5e23b3482efc5a7f432948af.camel@maquefel.me>
Subject: Re: [PATCH 0/2] perf: add T-HEAD C9xx series cpu support
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Inochi Amaoto <inochiama@outlook.com>, Peter Zijlstra
 <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho
 de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,  Jiri Olsa
 <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers
 <irogers@google.com>,  Adrian Hunter <adrian.hunter@intel.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 16 May 2023 13:32:20 +0300
In-Reply-To: <IA1PR20MB49539201E93DE46A9A2A8E74BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
References: 	<IA1PR20MB49539201E93DE46A9A2A8E74BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_003225_703494_EAB165C5 
X-CRM114-Status: GOOD (  16.09  )
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

SGVsbG8gSW5vY2hpIEFtYW90byEKClRoYW5rIHlvdSBmb3IgeW91ciBzZXJpZXMhCgpDb3VsZCB5
b3UgYWxzbyBwcm92aWRlIEhQTSBkZXZpY2UgdHJlZSBiaW5kaW5ncyB3aGljaCB3ZXJlIHVzZWQg
aW4KT3BlblNCSSBmb3IgdGVzdGluZyBpbiBjb3ZlciBsZXR0ZXIgPwoKT24gVHVlLCAyMDIzLTA1
LTE2IGF0IDEwOjM3ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IFRoZSBULUhFQUQgQzl4
eCBzZXJpZXMgY3B1IGlzIGEgc2VyaWVzIG9mIHJpc2N2IENQVSBJUC4gQXMgdGhpcyBJUAo+IHdh
cwo+IHByb3Bvc2VkIGJlZm9yZSB0aGUgY3VycmVudCByaXNjdiBldmVudCBzdGFuZGFyZC4gSXQg
aGFzIGEgbm9uLQo+IHN0YW5kYXJkCj4gZXZlbnRzIGVuY29kaW5nIGZvciBwZXJmIGV2ZW50cyBh
bmQgdW5pbXBsZW1lbnRlZCBNQVJDSCBhbmQgTUlNUCBDU1IuCj4gVGhpcyBwYXRjaCBhZGQgdGhl
c2UgZXZlbnRzIHRvIHN1cHBvcnQgQzl4eCBjcHVzLgo+IAo+IEFGQUlLLCBhdCBsZWFzdCB0aGUg
Zm9sbG93aW5nIGNoaXBzIHVzZWQgQzl4eCBjcHUuCj4gCj4gKiBBbGx3aW5uZXIgRDEgKEM5MDYp
Cj4gKiBULUhFQUQgdGgxNTIwIChDOTEwKQo+ICogU29waGdvIG1hbmdvIChDOTIwKQo+IAo+IElu
b2NoaSBBbWFvdG8gKDIpOgo+IMKgIHBlcmYgdG9vbHMgcmlzY3Y6IEFsbG93IGdldF9jcHVpZCBy
ZXR1cm4gZW1wdHkgTUFSQ0ggYW5kIE1JTVAKPiDCoCBwZXJmIHZlbmRvciBldmVudHMgcmlzY3Y6
IGFkZCBULUhFQUQgQzl4eCBKU09OIGZpbGUKPiAKPiDCoHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL2hlYWRlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKy0KPiDCoHRvb2xzL3BlcmYv
cG11LWV2ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2wqAgfMKgIDEgKwo+IMKgLi4uL2FyY2gv
cmlzY3YvdC1oZWFkL2M5eHgvY2FjaGUuanNvbsKgwqDCoMKgwqDCoMKgwqAgfCA2Nwo+ICsrKysr
KysrKysrKysrKysrKwo+IMKgLi4uL2FyY2gvcmlzY3YvdC1oZWFkL2M5eHgvZmlybXdhcmUuanNv
bsKgwqDCoMKgwqAgfCA2OAo+ICsrKysrKysrKysrKysrKysrKysKPiDCoC4uLi9hcmNoL3Jpc2N2
L3QtaGVhZC9jOXh4L2luc3RydWN0aW9uLmpzb27CoMKgIHwgMjIgKysrKysrCj4gwqAuLi4vYXJj
aC9yaXNjdi90LWhlYWQvYzl4eC9taWNyb2FyY2guanNvbsKgwqDCoMKgIHwgNDIgKysrKysrKysr
KysrCj4gwqA2IGZpbGVzIGNoYW5nZWQsIDIwMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2
L3QtCj4gaGVhZC9jOXh4L2NhY2hlLmpzb24KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9w
ZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi90LQo+IGhlYWQvYzl4eC9maXJtd2FyZS5qc29uCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvdC0K
PiBoZWFkL2M5eHgvaW5zdHJ1Y3Rpb24uanNvbgo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3QtCj4gaGVhZC9jOXh4L21pY3JvYXJjaC5qc29u
Cj4gCj4gLS0KPiAyLjQwLjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
