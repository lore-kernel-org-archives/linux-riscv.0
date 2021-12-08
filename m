Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69337C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=36c4Z9kR19BwwlpDVr1eJi5lM6dbfxk2uD/zhYTHWbg=; b=0tkZB69l96iEtv3jqtXA6YH07u
	GP+w5gOXvLlb769BeMxZnZPcY0urXbMUDvUMTR2h3pDL6HCojUz2K9prkmQ5EV52LZ8qhylY6rpy9
	xEi/HdlZz1bJIk8F2B6l34au53hI+qNpLgnF4pwlFy/yHgEeUbShsv6Sau9CUiLHDbSflO/bVkq+6
	XTvQrBaXwaVS8/KrNxyUuC/qGE2NNIl12bxjhL6Fzs8RloUyT1aLOycw+ZNlQvIkIbt7atcEWUMlx
	TTRS/Z4ZHbwYBq4n9F9O4shDuKUfcnlKh+eXVggUSgpEs14Cm3E6IqnuKdxWer5hrPmNcgXp702uj
	d3RytngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muxQM-00CtGy-SR; Wed, 08 Dec 2021 13:55:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muxQ9-00CtF1-L7; Wed, 08 Dec 2021 13:55:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CBEED6E;
 Wed,  8 Dec 2021 05:55:43 -0800 (PST)
Received: from [10.1.26.149] (e127744.cambridge.arm.com [10.1.26.149])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104B43F73B;
 Wed,  8 Dec 2021 05:55:39 -0800 (PST)
Subject: Re: [PATCH v2 3/3] perf tools: Support register names from all archs
To: John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, acme@kernel.org
Cc: Alexandre Truong <alexandre.truong@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20211207180653.1147374-1-german.gomez@arm.com>
 <20211207180653.1147374-4-german.gomez@arm.com>
 <90bcce69-9585-3fb4-de89-bbf2bd6def05@huawei.com>
From: German Gomez <german.gomez@arm.com>
Message-ID: <aee0c3b8-4d8c-6f1e-24ed-5539a7c1a7b5@arm.com>
Date: Wed, 8 Dec 2021 13:55:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <90bcce69-9585-3fb4-de89-bbf2bd6def05@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_055545_766145_C0981E71 
X-CRM114-Status: GOOD (  12.17  )
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

SGkgSm9obiwKCk9uIDA4LzEyLzIwMjEgMTE6NTEsIEpvaG4gR2Fycnkgd3JvdGU6Cj4gT24gMDcv
MTIvMjAyMSAxODowNiwgR2VybWFuIEdvbWV6IHdyb3RlOgo+PiDCoCB0b29scy9wZXJmL2FyY2gv
YXJtL2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDCoMKgwqAgfMKgIDQyIC0tCj4+IMKgIHRvb2xz
L3BlcmYvYXJjaC9hcm02NC9pbmNsdWRlL3BlcmZfcmVncy5owqDCoMKgwqAgfMKgIDc2IC0tCj4+
IMKgIHRvb2xzL3BlcmYvYXJjaC9jc2t5L2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDCoMKgIHzC
oCA4MiAtLS0KPj4gwqAgdG9vbHMvcGVyZi9hcmNoL21pcHMvaW5jbHVkZS9wZXJmX3JlZ3MuaMKg
wqDCoMKgwqAgfMKgIDY5IC0tCj4+IMKgIHRvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
cGVyZl9yZWdzLmjCoMKgIHzCoCA2NiAtLQo+PiDCoCB0b29scy9wZXJmL2FyY2gvcmlzY3YvaW5j
bHVkZS9wZXJmX3JlZ3MuaMKgwqDCoMKgIHzCoCA3NCAtLQo+PiDCoCB0b29scy9wZXJmL2FyY2gv
czM5MC9pbmNsdWRlL3BlcmZfcmVncy5owqDCoMKgwqDCoCB8wqAgNzggLS0KPj4gwqAgdG9vbHMv
cGVyZi9hcmNoL3g4Ni9pbmNsdWRlL3BlcmZfcmVncy5owqDCoMKgwqDCoMKgIHzCoCA4MiAtLS0K
Pj4gwqAgdG9vbHMvcGVyZi9idWlsdGluLXNjcmlwdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxOCArLQo+PiDCoCB0b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2NjYgKysrKysrKysrKysrKysr
KysrCj4+IMKgIHRvb2xzL3BlcmYvdXRpbC9wZXJmX3JlZ3MuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKy0KPj4gwqAgLi4uL3NjcmlwdGluZy1lbmdpbmVzL3Ry
YWNlLWV2ZW50LXB5dGhvbi5jwqDCoMKgIHzCoCAxMCArLQo+PiDCoCB0b29scy9wZXJmL3V0aWwv
c2Vzc2lvbi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjUg
Ky0KPj4gwqAgMTMgZmlsZXMgY2hhbmdlZCwgNjk3IGluc2VydGlvbnMoKyksIDYwMSBkZWxldGlv
bnMoLSkKPgo+IERpZCB5b3UgY29uc2lkZXIgbGVhdmluZyB0aGUgcmVnaXN0ZXIgc3RydWN0dXJl
cyB3aGVyZSB0aGV5IGFyZSB3aGlsZQo+IHJlbmFtaW5nIHRvIGluY2x1ZGUgdGhlIGFyY2ggbmFt
ZSBhbmQgdGhlbiBoYXZpbmcgYXMgZXh0ZXJucyBvciBzaW1pbGFyPyBJIHNlZSBhbiBleGFtcGxl
IG9mIHRoYXQgaWRlYSBmb3IgYXJtNjRfdW53aW5kX2xpYnVud2luZF9vcHMuCj4KCklmIGJ5IHJl
Z2lzdGVyIHN0cnVjdHVyZXMgeW91IGFyZSByZWZlcnJpbmcgdG8gIl9fcGVyZl9yZWdfbmFtZShp
bnQpIiwgSQpjYW4ndCBsZWF2ZSB0aGVtIHdoZXJlIHRoZXkgYXJlLiBPbmx5IG9uZSBvZiB0aGVt
IHdvdWxkIGJlIGluY2x1ZGVkIGluCnRoZSBidWlsZC4KCkkgdGhpbmsgdGhlIGlkZWEgZnJvbSBh
cm02NF91bndpbmRfbGlidW53aW5kX29wcyBtYWtlcyBtb3JlIHNlbnNlIGluCnRoYXQgY2FzZSBi
ZWNhdXNlIHBlcmYgbWlnaHQgbm90IGxpbmsgYWdhaW5zdCBsaWJ1bndpbmQtYXJtNjQuIEluIHRo
ZQpjYXNlIG9mIHJlZ2lzdGVycywgd2UgYWx3YXlzIGhhdmUgdGhpcyBpbmZvIGF2YWlsYWJsZSBp
biAvdG9vbHMvLgoKVGhhbmtzLApHZXJtYW4KCj4gQ2hlZXJzLAo+IEpvaG4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
