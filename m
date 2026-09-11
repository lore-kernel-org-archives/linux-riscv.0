Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3DCC88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbeaOXN3AGyfFt/QYVLGRDVk1q9PDw8qrifBYMG5Shc=; b=OmOALNFoGTgn2w
	Wx/yolitzF0hchagn/ryKaWj2bAr+wTsiG3dS05cnyD8o5OdmN1UHNTCqiIUKdZpAUoCAzMSRUSiH
	CN444fY8LwH3y72pH16citwuLNB5fvNNQswnpb5/SjvUEK34SXIaepl5zuoDXcltOnQlrFBfLHwSs
	ACIGGoeErW8C6efJzUhUYvB2RITEEDLV02A5NehZs8NPGMbAF0ydQX0SnH2g3cCzhzxdZLgH5ABnr
	UOTU9Jz7a8s54LFhHpVtpC4sjqORT5A/LJ9f59T64OgJUx/uN0TAyFZz8fe1WfedXWjuEVYkOn30j
	hQCzzRzlYAy5Hf+rOIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xUs-0000000GGIW-3h4H;
	Fri, 11 Sep 2026 09:24:38 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xUo-0000000GGGV-0qKu
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 09:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789118585;
	bh=kiiuHqrEyG2sfi0XTgnw+3zZbndj5N5xoXbOCeyPgsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CsHPZaTs7bABcbOJEALcUsujJ9BKK6PdVORD1XY1qC1gRxYwLqECvNDM6I0En1Qta
	 edXRSOKFNI9DA/WvnLl2JcuAer6NvvpoZBTpRlzAK2BYWtn6UVQYlymsJ4crfinaQg
	 l8b4qxsj6s6a2v4sNHyX1o5sPWxelJgMBAx2jft8=
X-QQ-mid: zesmtpsz9t1789118583t1b547094
X-QQ-Originating-IP: QI8oySi+uhWX7uURhpzVCTXQv0Gqv6OZazMvN1UFgos=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 17:22:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10011258438961722049
Message-ID: <E53A82A427F8520F+9bd01d71-8b02-4fc7-be63-567c44b259de@linux.spacemit.com>
Date: Fri, 11 Sep 2026 17:22:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-4-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N3l5ASPewLWq1du5nW3lSTR3ig56qNRBcz5jQwMW+cns5klWm9ORGkp/
	BHQi7vLV8vo/+GH/vd2J6DOeIDxOUI5xSpHT3QQDRTbsb/YCB0+LOdeXaepo/1znI7wrcrl
	S6uLSgTSTyPrc0s5cU7X7AQzTb2NJ9e5vpjPe6JY2+ARSqyj12BKmqsTIvwXAabAh1e8JSJ
	OQdG5fvw+0T2X3RV5qDeA+jujcbNBDk0iuvCpHfl+HQThg+dWPyCykgdUKeCyUGN93W7mUw
	WAdqWS6xR4jwj/mjShcEk5IXVlhp6K4LfAeaPS8gVWVQIBMoGA7HBHwuxiY/zeB580ssvvg
	gtzFmecwVnzGneJGor0tfsh5dBo4dKhK9jxZFUVXEAUojtMU2DjJic+DiasCzhdxlESFy/J
	bSexp36RDAtEHXlfqbLnQ9A9VfJH6LkCqRR75I6yG+2ZuH3NCGhbd9oL2dooWxgxlKDDdiT
	oK9CJ8NPi7WoUfJj7rV5GRiLAbduxVFMjuYc5vwg+Xf3JJFbLOFy5dXyzWL04vu3OKcTVxI
	uJ1XV2Crl55aXQ6LiJUtKS4EwxwQ1qIig1ahFZoI6ikrNl4v32w1yG6c7EOwTXsU+NdMR6+
	EN952ZSsOVweJYj+WL4sftIQDIMSOTpbxzs+7eiMSvRc+K5YGpRZVxKNHg9vVxwT+/0wyL9
	+L8VAZsU+NTu5BYUcHOCUfsNSsh7M9qKxZtfK+37cjv1nSLmy/DU/tZovIeadZTixQGchEI
	jSwR9tt8BNY6u76OL0/JISOlz8OUWv4/AEgE0Xr0VZVld9ucPjvs06I5sZgIsR3/7/r0FDc
	DDlOuZ6cRBhm5hwxZZcKXcB7HOjG65q0E9DO9LXaGTm7eGLChVtl+qYkoM/rdZtmfa/jyAS
	wf7QuZatsqF0h+IEM+lydk8cgmVsW+FGEcUlol/u3rRd0N5KCcYwA6TRqwR6GNHI6Pateod
	zy3YlBTcUL52ZJvoo8X9nE3idBRrjb9gxbaHyyK4lGU7RRLpKgLh/Nz5WtlmR5lGjGAMaiJ
	Shf9b8jJ3j+wnmknE3me0Fd8Nanp+eUKIxYdgCmvhrK+Y2ks4B
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022435_383263_189701E0 
X-CRM114-Status: GOOD (  13.05  )
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

T24gOC8xMC8yMDI2IDExOjIyIFBNLCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgoKPiArc3RhdGlj
IGludCBydnRyYWNlX29mX3BhcnNlX291dGNvbm5zKHN0cnVjdCBndHJhY2VfcGxhdGZvcm1fZGF0
YSAqcGRhdGEpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50LCAqZXBfbm9kZSwg
KnJlcF9ub2RlLCAqcmRldl9ub2RlOwo+ICsJc3RydWN0IGd0cmFjZV9jb25uZWN0aW9uICpjb25u
Owo+ICsJc3RydWN0IG9mX2VuZHBvaW50IGVwLCByZXA7Cj4gKwlpbnQgcmV0ID0gMCwgaSA9IDA7
Cj4gKwo+ICsJcGFyZW50ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUoZGV2X29mX25vZGUocGRhdGEt
PmRldiksICJvdXQtcG9ydHMiKTsKPiArCWlmICghcGFyZW50KQo+ICsJCXJldHVybiAwOwo+ICsK
PiArCXBkYXRhLT5ucl9vdXRjb25ucyA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9jb3VudChwYXJl
bnQpOwo+ICsJcGRhdGEtPm91dGNvbm5zID0gZGV2bV9rY2FsbG9jKHBkYXRhLT5kZXYsIHBkYXRh
LT5ucl9vdXRjb25ucywKPiArCQkJCSAgICAgICBzaXplb2YoKnBkYXRhLT5vdXRjb25ucyksIEdG
UF9LRVJORUwpOwo+ICsJaWYgKCFwZGF0YS0+b3V0Y29ubnMpIHsKPiArCQlyZXQgPSAtRU5PTUVN
Owo+ICsJCWdvdG8gZG9uZTsKPiArCX0KPiArCj4gKwlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2Rl
KHBhcmVudCwgZXBfbm9kZSkgewo+ICsJCWNvbm4gPSBkZXZtX2t6YWxsb2MocGRhdGEtPmRldiwg
c2l6ZW9mKCpjb25uKSwgR0ZQX0tFUk5FTCk7Cj4gKwkJaWYgKCFjb25uKSB7Cj4gKwkJCW9mX25v
ZGVfcHV0KGVwX25vZGUpOwo+ICsJCQlyZXQgPSAtRU5PTUVNOwo+ICsJCQlicmVhazsKPiArCQl9
Cj4gKwo+ICsJCXJldCA9IG9mX2dyYXBoX3BhcnNlX2VuZHBvaW50KGVwX25vZGUsICZlcCk7Cj4g
KwkJaWYgKHJldCkgewo+ICsJCQlvZl9ub2RlX3B1dChlcF9ub2RlKTsKPiArCQkJYnJlYWs7Cj4g
KwkJfQo+ICsKPiArCQlyZXBfbm9kZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfZW5kcG9pbnQoZXBf
bm9kZSk7Cj4gKwkJaWYgKCFyZXBfbm9kZSkgewo+ICsJCQlyZXQgPSAtRU5PREVWOwo+ICsJCQlv
Zl9ub2RlX3B1dChlcF9ub2RlKTsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsJCXJkZXZfbm9kZSA9
IG9mX2dyYXBoX2dldF9wb3J0X3BhcmVudChyZXBfbm9kZSk7Cj4gKwo+ICsJCXJldCA9IG9mX2dy
YXBoX3BhcnNlX2VuZHBvaW50KHJlcF9ub2RlLCAmcmVwKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJ
CW9mX25vZGVfcHV0KGVwX25vZGUpOwo+ICsJCQlvZl9ub2RlX3B1dChyZXBfbm9kZSk7Cj4gKwkJ
CW9mX25vZGVfcHV0KHJkZXZfbm9kZSk7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCj4gKwkJY29u
bi0+c3JjX3BvcnQgPSBlcC5wb3J0Owo+ICsJCWNvbm4tPnNyY19md25vZGUgPSBkZXZfZndub2Rl
KHBkYXRhLT5kZXYpOwo+ICsJCS8qIFRoZSAnc3JjX2NvbXAnIGlzIHNldCBieSBndHJhY2VfcmVn
aXN0ZXJfY29tcG9uZW50KCkgKi8KPiArCQljb25uLT5zcmNfY29tcCA9IE5VTEw7Cj4gKwkJY29u
bi0+ZGVzdF9wb3J0ID0gcmVwLnBvcnQ7Cj4gKwkJY29ubi0+ZGVzdF9md25vZGUgPSBvZl9md25v
ZGVfaGFuZGxlKHJkZXZfbm9kZSk7Cj4gKwkJZndub2RlX2hhbmRsZV9nZXQoY29ubi0+ZGVzdF9m
d25vZGUpOwo+ICsJCWNvbm4tPmRlc3RfY29tcCA9IGd0cmFjZV9maW5kX2J5X2Z3bm9kZShjb25u
LT5kZXN0X2Z3bm9kZSk7Cj4gKwkJaWYgKCFjb25uLT5kZXN0X2NvbXApIHsKPiArCQkJcmV0ID0g
LUVQUk9CRV9ERUZFUjsKPiArCQkJb2Zfbm9kZV9wdXQoZXBfbm9kZSk7Cj4gKwkJCW9mX25vZGVf
cHV0KHJlcF9ub2RlKTsKPiArCQkJb2Zfbm9kZV9wdXQocmRldl9ub2RlKTsKPiArCQkJYnJlYWs7
Cj4gKwkJfQo+ICsKPiArCQlwZGF0YS0+b3V0Y29ubnNbaV0gPSBjb25uOwo+ICsJCWkrKzsKPiAr
CX0KPiArCj4gK2RvbmU6Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZm9yIChpID0gMDsgaSA8IHBkYXRh
LT5ucl9vdXRjb25ucyAmJiBwZGF0YS0+b3V0Y29ubnM7IGkrKykgewo+ICsJCQljb25uID0gcGRh
dGEtPm91dGNvbm5zW2ldOwo+ICsJCQlpZiAoY29ubiAmJiBjb25uLT5kZXN0X2Z3bm9kZSkKPiAr
CQkJCWZ3bm9kZV9oYW5kbGVfcHV0KGNvbm4tPmRlc3RfZndub2RlKTsKPiArCQl9Cj4gKwl9Cj4g
KwlvZl9ub2RlX3B1dChwYXJlbnQpOwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBydnRyYWNlX29mX3BhcnNlX2luY29ubnMoc3RydWN0IGd0cmFjZV9wbGF0Zm9ybV9kYXRh
ICpwZGF0YSkKPiArewo+ICsJc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQ7Cj4gKwlpbnQgcmV0
ID0gMDsKPiArCj4gKwlwYXJlbnQgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShkZXZfb2Zfbm9kZShw
ZGF0YS0+ZGV2KSwgImluLXBvcnRzIik7Cj4gKwlpZiAoIXBhcmVudCkKPiArCQlyZXR1cm4gMDsK
PiArCj4gKwlwZGF0YS0+bnJfaW5jb25ucyA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9jb3VudChw
YXJlbnQpOwo+ICsJcGRhdGEtPmluY29ubnMgPSBkZXZtX2tjYWxsb2MocGRhdGEtPmRldiwgcGRh
dGEtPm5yX2luY29ubnMsCj4gKwkJCQkgICAgICBzaXplb2YoKnBkYXRhLT5pbmNvbm5zKSwgR0ZQ
X0tFUk5FTCk7Cj4gKwlpZiAoIXBkYXRhLT5pbmNvbm5zKQo+ICsJCXJldCA9IC1FTk9NRU07Cj4g
Kwo+ICsJb2Zfbm9kZV9wdXQocGFyZW50KTsKPiArCXJldHVybiByZXQ7Cj4gK30KCkhpLMKgwqAK
ClRoZXNlIGZ1bmN0aW9ucyBvcGVyYXRlIHNvbGVseSBvbiBnZW5lcmljIGd0cmFjZSBzdHJ1Y3R1
cmVzLlRoZXnCoHNob3VsCmJlIG1vdmVkIHRvIHRoZSBndHJhY2UgY29yZSBhcyBjb21tb24gaGVs
cGVycyB0byBhdm9pZCBkdXBsaWNhdGlvbi4KVGhpcyBpcyBwYXJ0aWN1bGFybHkgaW1wb3J0YW50
IGZvciBtaXhlZCB0b3BvbG9naWVzIHdoZXJlIFJJU0MtVgp0cmFjZSBjb21wb25lbnRzIChlLmcu
LCBBVEIgYnJpZGdlKSBjb25uZWN0IGRpcmVjdGx5IHRvIENvcmVTaWdodApjb21wb25lbnRzIChl
LmcuLCBmdW5uZWwsIFRNQykuCgpSZWdhcmRzLApaYW5lCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
