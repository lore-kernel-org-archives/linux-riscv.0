Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E883C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByScuyNHwLIp2XUGtZ28OEUwfUCz8XKh577H5yiQs5Q=; b=dCQwzDRRgdOkPK
	4c0T8utDNye4WjaobpwXhZRlpgdp6GaSwUBIuCwjQHmq6aE9OjPk+RDLTKQm1Fe/p61Laq9UBM+sG
	0LIV9wIDmN/ks9lORWU6OyZnBuLtpOX4S9ssqzqtZ5iZFNrN7B3FQbgz2tDCcvFA3Pam+Xrit1EMA
	ki8IAbv1Jh7PrkYQVzwmR91FJWOCAPTjf93oJEh82odoLFrHEcFLinQmws0kS4w3oFh6YK2QhKhM4
	/PWc1RI9s+n37qEhtqQzzs6VaKN/h6LirQgVl3eQo8cuKEY3Kb03A8QAySFAFkM+oqpobEFsjIyNP
	GQ7iFrISCnMfe0h7mpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwniP-006flm-12;
	Wed, 10 May 2023 17:35:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwniN-006flc-2Z
	for linux-riscv@bombadil.infradead.org;
	Wed, 10 May 2023 17:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fFFM+0v1B9mKKAJBQsaxPYMeqdW5vGWNUbnAOldhxdM=; b=nExb2dldcvAK9HEUSjdpduN86G
	ecejmlMP7tFgVCPpDB/lnT2K5xNSjsR6uxPdl2WYieMkO2OeAIgVdtB5PeDsF5sCWmJM+r/xsbmaH
	/3M2qTnoU49sAtnUosJmzHPWsXUl0M92ju+PSTXUhZyr3hCTJzceZ6u3vZBS8KVJuwS4T4kZx60Ex
	ZTgJD5yIl0COOTFHqqogZ0FFBZeXflSvDm17xMZk0t1jd+OC1oJBkGBN2KttfPTgAHYqD7PuLah7G
	G0HrF5g4YTq0xAwuUVNm3m7rLbl7Wutk0vo0GAHGbExvzhbboTw9CTChDH5eQWCVmxJrc6cOxjnJS
	QXEVz0NA==;
Received: from [187.19.238.117] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwniL-00GT4s-UV; Wed, 10 May 2023 17:34:58 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BE0DD403B5; Wed, 10 May 2023 14:34:54 -0300 (-03)
Date: Wed, 10 May 2023 14:34:54 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Song Liu <songliubraving@meta.com>,
	Yang Jihong <yangjihong1@huawei.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] perf build: Add system include paths to BPF builds
Message-ID: <ZFvVvp0tYqxHWFsB@kernel.org>
References: <20230506021450.3499232-1-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506021450.3499232-1-irogers@google.com>
X-Url: http://acmel.wordpress.com
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

RW0gRnJpLCBNYXkgMDUsIDIwMjMgYXQgMDc6MTQ6NTBQTSAtMDcwMCwgSWFuIFJvZ2VycyBlc2Ny
ZXZldToKPiBUaGVyZSBhcmUgaW5zdWZmaWNpZW50IGhlYWRlcnMgaW4gdG9vbHMvaW5jbHVkZSB0
byBzYXRpc2Z5IGJ1aWxkaW5nCj4gQlBGIHByb2dyYW1zIGFuZCB0aGVpciBoZWFkZXIgZGVwZW5k
ZW5jaWVzLiBBZGQgdGhlIHN5c3RlbSBpbmNsdWRlCj4gcGF0aHMgZnJvbSB0aGUgbm9uLUJQRiBj
bGFuZyBjb21waWxlIHNvIHRoYXQgdGhlc2UgaGVhZGVycyBjYW4gYmUKPiBmb3VuZC4KPiAKPiBU
aGlzIGNvZGUgd2FzIHRha2VuIGZyb206Cj4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01h
a2VmaWxlCj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29t
Pgo+IC0tLQo+ICB0b29scy9wZXJmL01ha2VmaWxlLnBlcmYgfCAyMCArKysrKysrKysrKysrKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYgYi90b29scy9wZXJmL01h
a2VmaWxlLnBlcmYKPiBpbmRleCA2MWMzM2QxMDBiMmIuLjM3YmVmZGZhOGFjOCAxMDA2NDQKPiAt
LS0gYS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKPiArKysgYi90b29scy9wZXJmL01ha2VmaWxl
LnBlcmYKPiBAQCAtMTA1Nyw3ICsxMDU3LDI1IEBAICQoU0tFTF9UTVBfT1VUKSAkKExJQkFQSV9P
VVRQVVQpICQoTElCQlBGX09VVFBVVCkgJChMSUJQRVJGX09VVFBVVCkgJChMSUJTVUJDTURfCj4g
IAo+ICBpZm5kZWYgTk9fQlBGX1NLRUwKClNvIHRoaXMgcGF0Y2ggd2FzIGRvbmUgYmVmb3JlIHRo
ZSByZXZlcnRzLCBJIGFkanVzdGVkIGl0IHRvIHdoYXQgaXMKdXBzdHJlYW0gYW5kIHRvIGFub3Ro
ZXIgcGF0Y2ggdGhhdCBtYWtlcyB0aGUgYnVpbGQgdXNlIHRoZSBoZWFkZXJzIGZyb20KdGhlIHBl
cmYgc291cmNlcyBpbnN0ZWFkIG9mIHRoZSBzeXN0ZW0ncyAobGludXgvYnBmLmggYW5kCmxpbnV4
L3BlcmZfZXZlbnQuaCwgZnJvbSB2bWxpbnV4LmgpLCBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhl
IHBhdGNoCmJlbG93LCBJJ20gYWxzbyB0cnlpbmcgdG8gZmlndXJlIG91dCB0aGF0IG90aGVyIHBy
b2JsZW0geW91IHBvaW50ZWQgd2l0aApsaW51eC90eXBlcy5zIDotXAoKV2hhdCBJIGhhdmUgbm93
IGluIHRtcC5wZXJmLXRvb2xzOgoK4qyiW2FjbWVAdG9vbGJveCBwZXJmLXRvb2xzXSQgZ2l0IGxv
ZyAtLW9uZWxpbmUgdG9ydmFsZHMvbWFzdGVyLi4KYTJhZjBmNmI4ZWY3ZWE0MCAoSEVBRCAtPiBw
ZXJmLXRvb2xzKSBwZXJmIGJ1aWxkOiBBZGQgc3lzdGVtIGluY2x1ZGUgcGF0aHMgdG8gQlBGIGJ1
aWxkcwo1YmU2Y2VjZGEwODAyZjIzIHBlcmYgYnBmIHNrZWxzOiBNYWtlIHZtbGludXguaCB1c2Ug
YnBmLmggYW5kIHBlcmZfZXZlbnQuaCBpbiBzb3VyY2UgZGlyZWN0b3J5CjdkMTYxMTY1ZDkwNzJk
Y2IgcGVyZiBwYXJzZS1ldmVudHM6IERvIG5vdCBicmVhayB1cCBBVVggZXZlbnQgZ3JvdXAKYTQ2
ODA4NTAxMWVhOGJiYSBwZXJmIHRlc3QgdGVzdF9pbnRlbF9wdC5zaDogVGVzdCBzYW1wbGUgbW9k
ZSB3aXRoIGV2ZW50IHdpdGggUE1VIG5hbWUKMTIzMzYxNjU5ZmE0MDVkZSBwZXJmIGV2c2VsOiBN
b2RpZnkgZ3JvdXAgcG11IG5hbWUgZm9yIHNvZnR3YXJlIGV2ZW50cwozNGU4Mjg5MWQ5OTVhYjg5
IHRvb2xzIGFyY2ggeDg2OiBTeW5jIHRoZSBtc3ItaW5kZXguaCBjb3B5IHdpdGggdGhlIGtlcm5l
bCBzb3VyY2VzCjcwNTA0OWNhNGY1YjdiMDAgdG9vbHMgaGVhZGVycyBrdm06IFN5bmMgdWFwaS97
YXNtL2xpbnV4fSBrdm0uaCBoZWFkZXJzIHdpdGggdGhlIGtlcm5lbCBzb3VyY2VzCjhkNmE0MWM4
MDY1ZTExMjAgdG9vbHMgaW5jbHVkZSBVQVBJOiBTeW5jIHRoZSBzb3VuZC9hc291bmQuaCBjb3B5
IHdpdGggdGhlIGtlcm5lbCBzb3VyY2VzCjkyYjhlNjFlODgzNTEwOTEgdG9vbHMgaGVhZGVycyBV
QVBJOiBTeW5jIHRoZSBsaW51eC9jb25zdC5oIHdpdGggdGhlIGtlcm5lbCBoZWFkZXJzCmU3ZWMz
YTI0OWMzOGE5YzkgdG9vbHMgaGVhZGVycyBVQVBJOiBTeW5jIHRoZSBpOTE1X2RybS5oIHdpdGgg
dGhlIGtlcm5lbCBzb3VyY2VzCmU2MjMyMTgwZTUyNGUxMTIgdG9vbHMgaGVhZGVycyBVQVBJOiBT
eW5jIHRoZSBkcm0vZHJtLmggd2l0aCB0aGUga2VybmVsIHNvdXJjZXMKNWQxYWM1OWZmNzQ0NWU1
MSB0b29scyBoZWFkZXJzIFVBUEk6IFN5bmMgdGhlIGxpbnV4L2luLmggd2l0aCB0aGUga2VybmVs
IHNvdXJjZXMKYjA2MThmMzhlMmFiOGNlMyBwZXJmIGJ1aWxkOiBHcmFjZWZ1bGx5IGZhaWwgdGhl
IGJ1aWxkIGlmIEJVSUxEX0JQRl9TS0VMPTEgaXMgc3BlY2lmaWVkIGFuZCBjbGFuZyBpc24ndCBh
dmFpbGFibGUKNWYwYjg5ZTYzMmVkODFiNiBwZXJmIHRlc3QgamF2YSBzeW1ib2w6IFJlbW92ZSBu
ZWVkbGVzcyBkZWJ1Z2luZm9kIHF1ZXJpZXMKMzI3ZGFmMzQ1NTRkMjBhNiBwZXJmIHBhcnNlLWV2
ZW50czogRG9uJ3QgcmVvcmRlciB1bmdyb3VwZWQgZXZlbnRzIGJ5IFBNVQpjY2M2NmM2MDkyODAy
ZDY4IHBlcmYgbWV0cmljOiBKU09OIGZsYWcgdG8gbm90IGdyb3VwIGV2ZW50cyBpZiBnYXRoZXJp
bmcgYSBtZXRyaWMgZ3JvdXAKMWIxMTQ4MjQxMDZjYTQ2OCBwZXJmIHN0YXQ6IEludHJvZHVjZSBz
a2lwcGFibGUgZXZzZWxzCjJhOTM5Yzg2OTUwMzViMTEgcGVyZiBtZXRyaWM6IENoYW5nZSBkaXZp
ZGUgYnkgemVybyBhbmQgIXN1cHBvcnQgZXZlbnRzIGJlaGF2aW9yCuKsolthY21lQHRvb2xib3gg
cGVyZi10b29sc10kCgpQbGVhc2UgaGVscCBtZSB0ZXN0IHRoaXMsCgpSZWdhcmRzLAoKLSBBcm5h
bGRvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
