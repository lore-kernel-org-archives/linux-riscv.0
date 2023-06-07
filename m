Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519D8C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lh5gsL8mw6KmYmKeViJEFZL5uphmLhqxEz5pLfIDlSY=; b=fpbcr5OEk7VAMS
	9q6LtEHBjE2m4SN1kVvahi8w2mwVz7rmPmYMqhqebZvlalEPA+AQzKoWngvu1deXUNjzaNWadhsuU
	Aj5U3oZc3diMIRTztIo9GIqvG3LrSSkGYwTCL1jWuGnjrU8YpkwmQvkPeNmOWq0PwrZC3a63mpsgS
	/M94LQlaxyywTi5C2gHi3fq6fxwnh+/sWw2sZKjxzOVbmbmYTlE8SDl40Jb6zjswS7tq4mt8M3bzK
	zphNbJGt4Sl3t4QqsLq4a1zKW0ODYb/6tcES6lQ3c7tFQNiNMz85AnNiH7z8HgtOuAi7dcjP9S/S3
	l3ZnWFt53anD1OLmhqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q72Ri-007VCg-0W;
	Wed, 07 Jun 2023 23:20:06 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q72Rf-007VAf-2E
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 23:20:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b1aecef94fso71835171fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686179999; x=1688771999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AiCeR7ptlfI6j+KiqyWrQWFndEERMb3CPvsTwhpnG8=;
        b=JplymHULuO0ZSDgko0y3lbWxLIw9kmIHQ3kx2jxN3PQbrq7L94f8QlkLKcvgWKhirW
         iZaNu14CbrGgKMmqUt/0WYPjJaxnf/kxFYGMyWiZmowrw0IeY2cDZ/4YpGpNgoQ16HD8
         Q1V2E5GdNfE8eH4NmjEMt+ddunjaRs23B95fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686179999; x=1688771999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AiCeR7ptlfI6j+KiqyWrQWFndEERMb3CPvsTwhpnG8=;
        b=lSlYU85UQe9dSwXkGAWee04IjtiTvsj5fUm4iR2oWcb22T5DrhJxskzCDOwhDP9KaQ
         f1IgWKAvoEU8UN1ERXrqhZ2KGUm3wU7f6rwZwkHDhSz9/TXajH4jE2n8jcOJy2DiLVra
         NXQZJJVZ8HMWr3ukO2cizpQUrUG7DeU6LWqKjdl7LkzcbDSNvslcizFutT3uI5s+PMM9
         Jvh+loAYYMZgxgtW67RGcrwZ71I39Rhz/Y24ocDrSKUqS1siy6yGiHTED+DarCgsbiuB
         nnV5DxABkU5AAcpt3lV1W/VfOaFuwM4i9pBA8QaAKzZdX5sWlX9HXISenyzJqLCWzMgZ
         kJgA==
X-Gm-Message-State: AC+VfDzPGxdDMqw9i9CDO9AG5NAiZVwKReeALHDTvpAtvons5t9uPP9N
	NUXzXTxvkGNprVdJvAmgf0q7MgytJEiw0YU6Pwwf
X-Google-Smtp-Source: ACHHUZ4D7xRTYmYYSFjgjkg4pgyGVYsusRQtFORfKo7XPXxHQQAEgfHiH9CWABCGTO7onMXXi/sA+gYmBrWTXaNru0c=
X-Received: by 2002:a2e:9f44:0:b0:2b1:d6bf:d8b2 with SMTP id
 v4-20020a2e9f44000000b002b1d6bfd8b2mr3368419ljk.22.1686179998917; Wed, 07 Jun
 2023 16:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230607112417.782085-1-sunilvl@ventanamicro.com> <20230607112417.782085-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230607112417.782085-3-sunilvl@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Jun 2023 16:19:47 -0700
Message-ID: <CAOnJCU+F8LL_s=nRgWvONAJRK33PyHG=6DV+J9L+uNkT3-A2Jg@mail.gmail.com>
Subject: Re: [PATCH v2 -next 2/2] RISC-V/perf: Use standard interface to get
 INTC domain
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_162003_733163_FCFB9059 
X-CRM114-Status: GOOD (  18.72  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCA0OjI04oCvQU0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5IHRoZSBQTVUgZHJpdmVyIGlzIHVzaW5n
IERUIGJhc2VkIGxvb2t1cCB0bwo+IGZpbmQgdGhlIElOVEMgbm9kZSBmb3Igc3Njb2ZwbWYgZXh0
ZW5zaW9uLiBUaGlzIHdpbGwgbm90IHdvcmsKPiBmb3IgQUNQSSBiYXNlZCBzeXN0ZW1zIGNhdXNp
bmcgdGhlIGRyaXZlciB0byBmYWlsIHRvIHJlZ2lzdGVyCj4gdGhlIFBNVSBvdmVyZmxvdyBpbnRl
cnJ1cHQgaGFuZGxlci4KPgo+IEhlbmNlLCBjaGFuZ2UgdGhlIGNvZGUgdG8gdXNlIHRoZSBzdGFu
ZGFyZCBpbnRlcmZhY2UgdG8gZmluZAo+IHRoZSBJTlRDIG5vZGUgd2hpY2ggd29ya3MgaXJyZXNw
ZWN0aXZlIG9mIERUIG9yIEFDUEkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1bmls
dmxAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyB8IDE3ICsrLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gaW5kZXggNGYzYWMyOTZi
M2UyLi4wYmM0OTEyNTJhNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBAQCAtNzM5LDcgKzcz
OSw2IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVjdCByaXNjdl9wbXUgKnBt
dSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlCj4gIHsKPiAgICAgICAgIGludCByZXQ7Cj4g
ICAgICAgICBzdHJ1Y3QgY3B1X2h3X2V2ZW50cyBfX3BlcmNwdSAqaHdfZXZlbnRzID0gcG11LT5o
d19ldmVudHM7Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNwdSwgKmNoaWxkOwo+ICAg
ICAgICAgc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiA9IE5VTEw7Cj4KPiAgICAgICAgIGlmIChy
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTU0NPRlBNRikpIHsKPiBAQCAtNzU2
LDIwICs3NTUsOCBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3QgcmlzY3Zf
cG11ICpwbXUsIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZQo+ICAgICAgICAgaWYgKCFyaXNj
dl9wbXVfdXNlX2lycSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+Cj4g
LSAgICAgICBmb3JfZWFjaF9vZl9jcHVfbm9kZShjcHUpIHsKPiAtICAgICAgICAgICAgICAgY2hp
bGQgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChjcHUsICJyaXNjdixjcHUtaW50YyIpOwo+IC0g
ICAgICAgICAgICAgICBpZiAoIWNoaWxkKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHJf
ZXJyKCJGYWlsZWQgdG8gZmluZCBJTlRDIG5vZGVcbiIpOwo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIG9mX25vZGVfcHV0KGNwdSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7Cj4gLSAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgZG9tYWluID0gaXJx
X2ZpbmRfaG9zdChjaGlsZCk7Cj4gLSAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGNoaWxkKTsK
PiAtICAgICAgICAgICAgICAgaWYgKGRvbWFpbikgewo+IC0gICAgICAgICAgICAgICAgICAgICAg
IG9mX25vZGVfcHV0KGNwdSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAg
ICAgICAgICAgICAgIH0KPiAtICAgICAgIH0KPiArICAgICAgIGRvbWFpbiA9IGlycV9maW5kX21h
dGNoaW5nX2Z3bm9kZShyaXNjdl9nZXRfaW50Y19od25vZGUoKSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBET01BSU5fQlVTX0FOWSk7Cj4gICAgICAgICBpZiAo
IWRvbWFpbikgewo+ICAgICAgICAgICAgICAgICBwcl9lcnIoIkZhaWxlZCB0byBmaW5kIElOVEMg
SVJRIHJvb3QgZG9tYWluXG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4g
LS0KPiAyLjM0LjEKPgoKClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
