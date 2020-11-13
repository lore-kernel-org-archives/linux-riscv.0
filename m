Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD370C4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 13:22:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378402223C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 13:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGn6Cdi0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3mFJ8hE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378402223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0AkgnIYZeSwE5CrsnLNPfNzpHT6SBpERNVyslRgU4G4=; b=tGn6Cdi0/sZPStG1CQy16aqpR
	9xrRmR0bjsDfpJhMLS/PaPKdkxvX6S5ujSGL29tbubXMLVBq2WNMuEEWkjBEL6Q6FbfwPo0G6zO6M
	qbPAKr8lKBcp+/NtDydh6sjd1alTbWJhLrZj8CuG0++Cv6RHLw/L8Sxj4owYz/4ZFQ2+VI9SOFnR2
	mGwG+i+D0AF3+F6wo5RURzODBsSWQG7SsVFPsnjibCWKOSM/8z1Du/tF/XtMU5vCYhWqeEMCdj4OR
	qv5BFFnsN8/9xapihUYWS4dKD+Bi1n/12L2wHO5N8z8uok1XdjQsg2XcjsgQnj3HTXS/kRNi8UHGX
	+hfyG0sRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZ29-0003tY-1u; Fri, 13 Nov 2020 13:22:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZ26-0003t3-LV; Fri, 13 Nov 2020 13:22:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id j7so9908874wrp.3;
 Fri, 13 Nov 2020 05:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gzAM5/34WGhJmOugyCwQPFpl5aixkDcuk0CgzVtzJO0=;
 b=K3mFJ8hEOlm55D4UrfXq+sf04+yHRvyxv8188aJY0pqtVArXjpxOL6sPhoL9zHiov8
 KLrP69YCyc96Iz+M37D4aPVoqP7cy7GFUffvGmcSjad+VZPXFzycpQtenLhx707ZqJ0f
 CSUQ/tV1ra2b7NbAe6uAi9Ld5h83QhDJZ41u5kqrMrXPzFLJphgans1xKb85+YHsoxRr
 xJos6bPWwsAcQd7qniVM4oKCIg8/UaaO+tjojmQ1Q3zC0Et3veYEh8Llqb8NwViV3EOY
 59diiHzBNGOk+gN2Uc8FMgAIpQHPA1dG5Gn4uZ/5cnmTzshh4G0qNMnI8zXNRjiGh6Mc
 04hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gzAM5/34WGhJmOugyCwQPFpl5aixkDcuk0CgzVtzJO0=;
 b=JeOVert7VJSNvaGepwdGvPRclGBHWDftSL7Tv9G2Th8mJd/hg0LR5xBuZ9KMCwcrQa
 Sf8ZL0mu5sCEstDGuG+CnH67t5Y06h0tQnT3zGyrPzaIxv/x65E5K88UU55xOP8WxvRL
 MhxXUz4JrVeFIMEDlsrPhxu+72mW7xYpEjmZUAs+vltPvlgSNeav30+I7+1x0fDcnbEU
 HtlNo3BB3laYcLKkUdV8DDtTHptZLAvawEwbzSnaui6J/07SFO0jWMuiVXdv2kNjPi7D
 XbiGU1oErdr4YGI3FFELXM6GlZVd/+Mxyeto75WmW1Nj2yBu9p6kYFN2wGqdphixzMed
 7Fqw==
X-Gm-Message-State: AOAM533pwet0HD94ODv+r3GfEP2YAyfyj/tzSS1qhAgYTA4cNkZcbGQd
 YrIZBeBecd7WrWBa/shVmxXZTF+SakacOBfdpt8=
X-Google-Smtp-Source: ABdhPJzsbxweaLb3PeIq0ZgtrnX/SUHcUw7bZeFQH523s6o7TXXrg5JBgMmvN3W4NlKC8VWr6BuZsrO3TJ4kQB0FxbI=
X-Received: by 2002:adf:f241:: with SMTP id b1mr3485684wrp.248.1605273749327; 
 Fri, 13 Nov 2020 05:22:29 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
 <20201113122440.GA2164@myrica>
In-Reply-To: <20201113122440.GA2164@myrica>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 13 Nov 2020 14:22:16 +0100
Message-ID: <CAJ+HfNiE5Oa25QgdAdKzfk-=X45hXLKk_t+ZCiSaeFVTzgzsrw@mail.gmail.com>
Subject: Re: csum_partial() on different archs (selftest/bpf)
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_082230_773271_1986B707 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Netdev <netdev@vger.kernel.org>, Anders Roxell <anders.roxell@gmail.com>,
 Tom Herbert <tom@herbertland.com>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMyBOb3YgMjAyMCBhdCAxMzoyNSwgSmVhbi1QaGlsaXBwZSBCcnVja2VyCjxqZWFu
LXBoaWxpcHBlQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBGcmksIE5vdiAxMywg
MjAyMCBhdCAxMTozNjowOEFNICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4gSSB3YXMg
cnVubmluZyB0aGUgc2VsZnRlc3QvYnBmIG9uIHJpc2N2LCBhbmQgaGFkIGEgY2xvc2VyIGxvb2sg
YXQgb25lCj4gPiBvZiB0aGUgZmFpbGluZyBjYXNlczoKPiA+Cj4gPiAgICMxNC9wIHZhbGlkIHJl
YWQgbWFwIGFjY2VzcyBpbnRvIGEgcmVhZC1vbmx5IGFycmF5IDIgRkFJTCByZXR2YWwKPiA+IDY1
NTA3ICE9IC0yOSAocnVuIDEvMSkKPiA+Cj4gPiBUaGUgdGVzdCBkb2VzIGEgY3N1bV9wYXJ0aWFs
KCkgY2FsbCB2aWEgYSBCUEYgaGVscGVyLiByaXNjdiB1c2VzIHRoZQo+ID4gZ2VuZXJpYyBpbXBs
ZW1lbnRhdGlvbi4gYXJtNjQgdXNlcyB0aGUgZ2VuZXJpYyBjc3VtX3BhcnRpYWwoKSBhbmQgZmFp
bAo+ID4gaW4gdGhlIHNhbWUgd2F5IFsxXS4KPgo+IEl0J3Mgd29yc2UgdGhhbiB0aGF0LCBiZWNh
dXNlIGFybTY0LCBwYXJpc2MsIGFscGhhIGFuZCBvdGhlcnMgaW1wbGVtZW50Cj4gZG9fY3N1bSgp
LCBjYWxsZWQgYnkgdGhlIGdlbmVyaWMgY3N1bV9wYXJ0aWFsKCksIGFuZCB0aG9zZSBhbGwgcmV0
dXJuIGEKPiAxNi1iaXQgdmFsdWUuCj4KPiBJdCB3b3VsZCBiZSBnb29kIHRvIGZpcnN0bHkgZm9y
bWFsaXplIHRoZSBzaXplIG9mIHRoZSB2YWx1ZSByZXR1cm5lZCBieQo+IHRoZSBicGZfY3N1bV9k
aWZmKCkgaGVscGVyLCBiZWNhdXNlIGl0J3Mgbm90IGNsZWFyIGZyb20gdGhlIGRvYyAoYW5kIHRo
ZQo+IGhlbHBlciByZXR1cm5zIGEgczY0KS4KPgo+IFRoZW4gaG9tb2dlbml6aW5nIHRoZSBjc3Vt
X3BhcnRpYWwoKSBpbXBsZW1lbnRhdGlvbnMgaXMgZGlmZmljdWx0LiBPbmUgd2F5Cj4gZm9yd2Fy
ZCwgd2l0aG91dCBoYXZpbmcgdG8gaW1tZWRpYXRlbHkgcmV3cml0ZSBhbGwgYXJjaC1zcGVjaWZp
Ywo+IGltcGxlbWVudGF0aW9ucywgd291bGQgYmUgdG8gcmVwbGFjZSBjc3VtX3BhcnRpYWwoKSBh
bmQgZG9fY3N1bSgpIHdpdGgKPiBjc3VtX3BhcnRpYWxfMzIoKSwgY3N1bV9wYXJ0aWFsXzE2KCks
IGRvX2NzdW1fMzIoKSBhbmQgZG9fY3N1bV8xNigpLiBUaGF0Cj4gd2F5IHdlIGNhbiB1c2UgYSBn
ZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIHRoZSAzMi1iaXQgdmFyaWFudCBpZiB0aGUKPiBhcmNo
LXNwZWNpZmljIGltcGxlbWVudGF0aW9uIGlzIDE2LWJpdC4KPgoKRm9sZGluZyBBbCdzIGlucHV0
IHRvIHRoaXMgcmVwbHkuCgpJIHRoaW5rIHRoZSBicGZfY3N1bV9kaWZmKCkgaXMgc3VwcG9zZWQg
dG8gYmUgdXNlZCBpbiBjb21iaW5hdGlvbiB3aXRoCmFub3RoZXIgaGVscGVyKHMpIChlLmcuIGJw
Zl9sNF9jc3VtX3JlcGxhY2UpIHNvIEknZCBndWVzcyB0aGUgcmV0dXJuZWQKX193c3VtIHNob3Vs
ZCBiZSBzZWVuIGFzIGFuIG9wYXF1ZSB2YWx1ZSwgbm90IHNvbWV0aGluZyBCUEYgdXNlcmxhbmQK
Y2FuIHJlbHkgb24uCgpTbywgZm9yIHRoaXMgc3BlY2lmaWMgdGVzdCBjYXNlLCBpdCdzIHByb2Jh
Ymx5IGJlc3QgdG8ganVzdCB1cGRhdGUgdGhlCnRlc3QgY2FzZSAoYXMgRXJpYyBzdWdnZXN0ZWQp
LgoKCkNoZWVycywgYW5kIHRoYW5rcyBmb3IgdGhlIGlucHV0IQpCasO2cm4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
