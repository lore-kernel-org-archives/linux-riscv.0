Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D59C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkrBBOJRn8r/TEJ+3wzxn2hl9tFOHn2yMJTGwKXIf/0=; b=ICiCGoLA3Baisz
	RL5oRPAZ8yH+axyzrPeO7ONUXdVWuzsvdpMIxEVPwrEkwyFTjgfwbANGrLf5OKFN1Pc2rCggg7G3V
	YCUYmF9KUEe+EfqyVX1WRjldjB9+wkFulIO72uslmvY+JVPsZX0iXXYqJ1TYLr2ghQvAGyc8x+lsW
	pBrPkzoX37MrEsLG045P9oZ03sk+GUWqYvOiFmSgZHI6ZBhrAkUUGu07qLcE6lU2ZXVFJsD1gsgxx
	2oCwvniJCrYtT4nMiQRlvUfEvcCwF/yQyn4X7j3t+W4hXSDAGXhvSVn1xXvVb7EK1qtD1LFTCRwyG
	UrjHLwZVqXUQG4Le9LbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFds-00000007Kxy-0lYC;
	Fri, 07 Aug 2026 08:09:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFdq-00000007Kw6-2DoW
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YGgPUv2MxMIj6WLQTkYVHujmi5pwj25z9TgXlp0hWTg=; b=pkmo3UL2ddaH7twkyg0xXwso3F
	NEjMYtzGg9amqnJXeamkAqHMWW1OxaxAGjcvytcNvld5CbDms1v4F//g9RHFw10u/RacB/GR20x+K
	PJa9SsCLFD3XNOgO5T/ooxIrP5vjMPwH103yosOtH0aNrMOMg285gXEFNvf9Mjty6xHwz5BR+PqU0
	tCEOIAWsXCUSEr/xjKLtc6qs32WGg0tJ4fCd02txUFsf7Zq/V9FaibATxinYDpWdd+k5uKCU2Mf4e
	n+ghV/vOYmtW/iSArGxkHGGiTdJxFtS3OUdUZ/Dzdh9Dke5xZqHavSNnYDh6ebNReRVZhofb2JL9A
	Po27vfCw==;
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFdn-0000000CAXe-1vmg
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGgPUv2MxMIj6WLQTkYVHujmi5pwj25z9TgXlp0hWTg=;
	b=aU6g7DsThd171xLrihpdhS3h8RRoXgvn1lzLdtNDaAMCV4qIMxICWOkED6tmo9bxScDAXF
	ELYviq26pwS9uunboGyc+PDWTj+YmrLQ48a6nuVh5dBjGJD7aPtPx3GsOJUvgXJfUJMhBN
	AfP+c/aIf9l3RWiSAgseN6heDMFTCXg=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:08:57 -0700
Subject: [PATCH v9 02/20] RISC-V: Add Smcsrind and Sscsrind ISA extension
 CSR definitions
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-2-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090919_597401_1A79177D 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgZGVmaW5p
dGlvbnMgb2YgbmV3IENTUnMgYW5kIGJpdHMgZGVmaW5lZCBpbiB0aGUgU21jc3JpbmQgYW5kClNz
Y3NyaW5kIElTQSBleHRlbnNpb25zLiBUaGVzZSBDU1JzIGVuYWJsZSB0aGUgaW5kaXJlY3QgQ1NS
IGFjY2Vzc2VzCm1lY2hhbmlzbSB0byBhY2Nlc3MgYW55IGluZGlyZWN0IENTUnMgaW4gTS0sIFMt
LCBhbmQgVlMtbW9kZS4gVGhlCnJhbmdlIG9mIHRoZSBzZWxlY3QgdmFsdWVzIGFuZCBpcmVnIHdp
bGwgYmUgZGVmaW5lZCBieSB0aGUgSVNBCmV4dGVuc2lvbiB0aGF0IGFyZSBiYXNlZCBvbiB0aGUg
U21jc3JpbmQgYW5kIFNzY3NyaW5kIGV4dGVuc2lvbnMuCgpTaWduZWQtb2ZmLWJ5OiBLYWl3ZW4g
WHVlIDxrYWl3ZW54QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5r
aW5zQGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5r
aW5zQGdtYWlsLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNzAxLWNv
dW50ZXJfZGVsZWdhdGlvbi12OC0yLTc5MDlmODYzYTY0NUBtZXRhLmNvbQpbcGp3QGtlcm5lbC5v
cmc6IGNsZWFuIHVwIHRoZSBwYXRjaCBkZXNjcmlwdGlvbjsgdXNlIG9mZmljaWFsIFJJU0MtViBl
eHRlbnNpb24gbmFtZXNdClNpZ25lZC1vZmYtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwu
b3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAzMCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3NyLmgKaW5kZXggMzFiODk4OGY0NDg4Li43ZjA5ZTU0YTBmOWEgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaApAQCAtMzQ3LDYgKzM0NywxMiBAQAogLyogU3VwZXJ2aXNvci1MZXZlbCBXaW5kb3cg
dG8gSW5kaXJlY3RseSBBY2Nlc3NlZCBSZWdpc3RlcnMgKEFJQSkgKi8KICNkZWZpbmUgQ1NSX1NJ
U0VMRUNUCQkweDE1MAogI2RlZmluZSBDU1JfU0lSRUcJCTB4MTUxCisvKiBTdXBlcnZpc29yLUxl
dmVsIFdpbmRvdyB0byBJbmRpcmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoU3Njc3JpbmQpICov
CisjZGVmaW5lIENTUl9TSVJFRzIJCTB4MTUyCisjZGVmaW5lIENTUl9TSVJFRzMJCTB4MTUzCisj
ZGVmaW5lIENTUl9TSVJFRzQJCTB4MTU1CisjZGVmaW5lIENTUl9TSVJFRzUJCTB4MTU2CisjZGVm
aW5lIENTUl9TSVJFRzYJCTB4MTU3CiAKIC8qIFN1cGVydmlzb3ItTGV2ZWwgSW50ZXJydXB0cyAo
QUlBKSAqLwogI2RlZmluZSBDU1JfU1RPUEVJCQkweDE1YwpAQCAtMzk0LDYgKzQwMCwxNCBAQAog
LyogVlMtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChILWV4
dGVuc2lvbiB3aXRoIEFJQSkgKi8KICNkZWZpbmUgQ1NSX1ZTSVNFTEVDVAkJMHgyNTAKICNkZWZp
bmUgQ1NSX1ZTSVJFRwkJMHgyNTEKKy8qCisgKiBWUy1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3Rs
eSBBY2Nlc3NlZCBSZWdpc3RlcnMgKEgtZXh0ZW5zaW9uIHdpdGggU3Njc3JpbmQpCisgKi8KKyNk
ZWZpbmUgQ1NSX1ZTSVJFRzIJCTB4MjUyCisjZGVmaW5lIENTUl9WU0lSRUczCQkweDI1MworI2Rl
ZmluZSBDU1JfVlNJUkVHNAkJMHgyNTUKKyNkZWZpbmUgQ1NSX1ZTSVJFRzUJCTB4MjU2CisjZGVm
aW5lIENTUl9WU0lSRUc2CQkweDI1NwogCiAvKiBWUy1MZXZlbCBJbnRlcnJ1cHRzIChILWV4dGVu
c2lvbiB3aXRoIEFJQSkgKi8KICNkZWZpbmUgQ1NSX1ZTVE9QRUkJCTB4MjVjCkBAIC00MzYsNiAr
NDUwLDEyIEBACiAvKiBNYWNoaW5lLUxldmVsIFdpbmRvdyB0byBJbmRpcmVjdGx5IEFjY2Vzc2Vk
IFJlZ2lzdGVycyAoQUlBKSAqLwogI2RlZmluZSBDU1JfTUlTRUxFQ1QJCTB4MzUwCiAjZGVmaW5l
IENTUl9NSVJFRwkJMHgzNTEKKy8qIE1hY2hpbmUtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkg
QWNjZXNzZWQgUmVnaXN0ZXJzIChTbWNzcmluZCkgKi8KKyNkZWZpbmUgQ1NSX01JUkVHMgkJMHgz
NTIKKyNkZWZpbmUgQ1NSX01JUkVHMwkJMHgzNTMKKyNkZWZpbmUgQ1NSX01JUkVHNAkJMHgzNTUK
KyNkZWZpbmUgQ1NSX01JUkVHNQkJMHgzNTYKKyNkZWZpbmUgQ1NSX01JUkVHNgkJMHgzNTcKIAog
LyogTWFjaGluZS1MZXZlbCBJbnRlcnJ1cHRzIChBSUEpICovCiAjZGVmaW5lIENTUl9NVE9QRUkJ
CTB4MzVjCkBAIC00OTgsNiArNTE4LDExIEBACiAjIGRlZmluZSBDU1JfSUVICQlDU1JfTUlFSAog
IyBkZWZpbmUgQ1NSX0lTRUxFQ1QJQ1NSX01JU0VMRUNUCiAjIGRlZmluZSBDU1JfSVJFRwlDU1Jf
TUlSRUcKKyMgZGVmaW5lIENTUl9JUkVHMglDU1JfTUlSRUcyCisjIGRlZmluZSBDU1JfSVJFRzMJ
Q1NSX01JUkVHMworIyBkZWZpbmUgQ1NSX0lSRUc0CUNTUl9NSVJFRzQKKyMgZGVmaW5lIENTUl9J
UkVHNQlDU1JfTUlSRUc1CisjIGRlZmluZSBDU1JfSVJFRzYJQ1NSX01JUkVHNgogIyBkZWZpbmUg
Q1NSX0lQSAkJQ1NSX01JUEgKICMgZGVmaW5lIENTUl9UT1BFSQlDU1JfTVRPUEVJCiAjIGRlZmlu
ZSBDU1JfVE9QSQlDU1JfTVRPUEkKQEAgLTUyMyw2ICs1NDgsMTEgQEAKICMgZGVmaW5lIENTUl9J
RUgJCUNTUl9TSUVICiAjIGRlZmluZSBDU1JfSVNFTEVDVAlDU1JfU0lTRUxFQ1QKICMgZGVmaW5l
IENTUl9JUkVHCUNTUl9TSVJFRworIyBkZWZpbmUgQ1NSX0lSRUcyCUNTUl9TSVJFRzIKKyMgZGVm
aW5lIENTUl9JUkVHMwlDU1JfU0lSRUczCisjIGRlZmluZSBDU1JfSVJFRzQJQ1NSX1NJUkVHNAor
IyBkZWZpbmUgQ1NSX0lSRUc1CUNTUl9TSVJFRzUKKyMgZGVmaW5lIENTUl9JUkVHNglDU1JfU0lS
RUc2CiAjIGRlZmluZSBDU1JfSVBICQlDU1JfU0lQSAogIyBkZWZpbmUgQ1NSX1RPUEVJCUNTUl9T
VE9QRUkKICMgZGVmaW5lIENTUl9UT1BJCUNTUl9TVE9QSQoKLS0gCjIuNTMuMC1NZXRhCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
