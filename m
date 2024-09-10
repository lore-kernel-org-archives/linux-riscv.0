Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4775FECE582
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjuawq0XMh8g9AB3ms+7utrFtU/If/jFjFL2HWJviXw=; b=vOjQfbZ8VwA1Lf
	B9u0/7WKexNe6gjOd9RcKQCNKBrN4tZVncm4Iu4D2wyBNQoHatbmHYC57E5wYRHvcHn6Aod56/uNx
	9G2BKh9LDmJfwTsCOxJ0TRFnJbajcpJu3Y2oZRe5ESpr4/oz6CjW0WAEEQMdjzdcZ09HbcEMLT7VL
	FWwksqW+gVIZpuXq22KyOWPt6vv1gBlEYDoB2RRzoal+FiMMm94pMrGKZchBRnaW8DaBQXgcLp5Su
	1IBGO0hx1hIFyMSU3Iqs729Ka9PYh7ER2lMSurQ66QS8lmjG641Fu/H8EDVIpxxvsPCfuVf7shYyc
	0mqMMwhClQMo2E5zitDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snv0V-00000004YG4-01zp;
	Tue, 10 Sep 2024 07:09:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snv0S-00000004YDw-1HEU
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 07:09:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D1AFE0005;
	Tue, 10 Sep 2024 07:09:40 +0000 (UTC)
Message-ID: <f6915c21-1dbd-44f6-a118-7e3a5c442e64@ghiti.fr>
Date: Tue, 10 Sep 2024 09:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: remove useless pc check in stacktrace handling
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240830084934.3690037-1-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240830084934.3690037-1-cleger@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_000944_493458_D54CB89F 
X-CRM114-Status: GOOD (  10.94  )
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

SGkgQ2zDqW1lbnQsCgpPbiAzMC8wOC8yMDI0IDEwOjQ5LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gQ2hlY2tpbmcgZm9yIHBjIHRvIGJlIGEga2VybmVsIHRleHQgYWRkcmVzcyBhdCB0aGlzIGxv
Y2F0aW9uIGlzIHVzZWxlc3MKPiBzaW5jZSBwYyA9PSBoYW5kbGVfZXhjZXB0aW9uLiBSZW1vdmUg
dGhpcyBjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gaW5kZXggYzZkNWRlMjI0NjNmLi5mOTM0YzU3M2MwODcg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gQEAgLTcyLDcgKzcyLDcgQEAgdm9pZCBub3Ry
YWNlIHdhbGtfc3RhY2tmcmFtZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHN0cnVjdCBwdF9y
ZWdzICpyZWdzLAo+ICAgCQkJcGMgPSBmdHJhY2VfZ3JhcGhfcmV0X2FkZHIoY3VycmVudCwgJmdy
YXBoX2lkeCwgZnJhbWUtPnJhLAo+ICAgCQkJCQkJICAgJmZyYW1lLT5yYSk7Cj4gICAJCQlpZiAo
cGMgPT0gKHVuc2lnbmVkIGxvbmcpaGFuZGxlX2V4Y2VwdGlvbikgewo+IC0JCQkJaWYgKHVubGlr
ZWx5KCFfX2tlcm5lbF90ZXh0X2FkZHJlc3MocGMpIHx8ICFmbihhcmcsIHBjKSkpCj4gKwkJCQlp
ZiAodW5saWtlbHkoIWZuKGFyZywgcGMpKSkKPiAgIAkJCQkJYnJlYWs7Cj4gICAKPiAgIAkJCQlw
YyA9ICgoc3RydWN0IHB0X3JlZ3MgKilzcCktPmVwYzsKCgpSZXZpZXdlZC1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
