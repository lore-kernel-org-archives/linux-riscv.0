Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A596C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 17:31:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5242064D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 17:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnJ/tXKk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XUsTsbQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5242064D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mvuxHJFo6JRcnAVS9DR/gQs0FwWUVZF7Dpvn5XA1FQc=; b=pnJ/tXKkXnI8X75bFePYQzqXa
	HQsBt6Hec/Kv8tiEYnRwo/fB7CeEJRfH3h6v9y65UlTTVo50KNDTx0CiY07HdA+e47iUXIlY4UYQ1
	diKDZPiquyTgH5orochGOcUX/6pXgbhp8J8AhqiGYd/0M3/haDpYszJlVKwJPX8FwZ5v4grJsGBXW
	Hn0gLFbe8JgK0qIXpNMxrOE7pUS7/+dAdkMXHQkByp8Q4QdBOGfHPGHtd8gO4ier4CA8N1m8O0i79
	Y+0U9oD0jmNoGpqcW2++aOdFAOaRno4Ef2KkNOy88OY2IJDpIsh6MUwPymL1y8KGcJbegJBspPNZC
	v6/GzbD+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWPOz-0005Gl-Hl; Mon, 10 Dec 2018 17:31:29 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWPOx-0005G2-2G
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 17:31:28 +0000
Received: by mail-pf1-x441.google.com with SMTP id z9so5727239pfi.2
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 09:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xrhcnDEwAmOP8Rn/HufuDdZnFPgjvZ7KdRhNj1gZ40g=;
 b=XUsTsbQfNGvGi0beiKpPrQvKvHmYmJ/ZRK4C8mcO2ElAVgYX53BYhtDXdBfyyRz9Mp
 /rpXtNOLxnxhx/G+kAeh6UtSERhyuyBM9qgBfgccTFevBEvQOKr9rk0dQO9l7BMZUGxC
 RU09Q+WdV6ZJ8/EgrTSS457Fmg66xcxnbzqu3hAFcd2K22PWa5juAtF2CmwRUfaLZyI8
 2AZS31FOzULIGdGjiM0lRe6XCLUeR8Hxa4dzLgarNQ5uZM2oNla1Cn1D0P28W+zOek1f
 ljTabMzCT3PIWR7LozK4Ko02hywyFx5Gz5gUmStkmxjn1MhSSYOY213ehuoEPy1wwIoh
 Zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xrhcnDEwAmOP8Rn/HufuDdZnFPgjvZ7KdRhNj1gZ40g=;
 b=PZug76nu7zBn7cJDxoulLmyWnL+ST5br1WPDXEFOsAtd8qLl15Di4gQ/As4M+JAGa7
 8whFz+WJWlngI3CLHXEWXV5LhEeofi6HC8bFrt6O8BXbutFivKLA/wvFV9u1RFFXiiOs
 +3mSjNUwYNnnmQxtUmVODf1RYyq2hY4e2COwaiwMKL+L4ewbHt6iQxVmwuFYZ5GVQZki
 j/y0zazAmRYO2A4cFYP2EIAuTTgWH9iU4p9k1ZzDCazxIWLwXzQBkl/R0tLrB+YrceBk
 hNfYhj/XIFl4dGyyyFI8u3SeK2l3XqfMxxgxQ7oGVQSQLedXMNbG6hhu7q2ZTG5qQ60w
 gLhg==
X-Gm-Message-State: AA+aEWY3OSp66tEPjFZJcuLO6tp3S3igtFAyF46b2IgbaFhju8tAsSve
 4Cjad7ruf4Gj6Q1jhG3jLcSqww==
X-Google-Smtp-Source: AFSGD/XgqiG69RKToJcO6K11F9szezaCUUL8dwQhsOJXfUHV9HNmZYkkrZpJEMRjxgNySrPcYo12xg==
X-Received: by 2002:a63:ed42:: with SMTP id m2mr11573552pgk.147.1544463075666; 
 Mon, 10 Dec 2018 09:31:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j6sm19593579pfg.126.2018.12.10.09.31.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 09:31:14 -0800 (PST)
Date: Mon, 10 Dec 2018 09:31:14 -0800 (PST)
X-Google-Original-Date: Mon, 10 Dec 2018 09:21:26 PST (-0800)
Subject: Re: [PATCH v2 0/2] Provide sched_clock for riscv_timer
In-Reply-To: <dd6a7f3f-203a-f71d-314e-9706ca4757bf@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: daniel.lezcano@linaro.org
Message-ID: <mhng-5c8b0e7e-4eba-4800-87fd-4ef883fb5ac5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_093127_118235_A2B988D4 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwOSBEZWMgMjAxOCAwODozMDozNCBQU1QgKC0wODAwKSwgZGFuaWVsLmxlemNhbm9A
bGluYXJvLm9yZyB3cm90ZToKPiBPbiAwNy8xMi8yMDE4IDE4OjU5LCBQYWxtZXIgRGFiYmVsdCB3
cm90ZToKPj4gT24gVHVlLCAwNCBEZWMgMjAxOCAwMjoyOTo1MCBQU1QgKC0wODAwKSwgYW51cEBi
cmFpbmZhdWx0Lm9yZyB3cm90ZToKPj4+IFRoaXMgcGF0Y2hzZXQgZXh0ZW5kcyByaXNjdl90aW1l
ciB0byBwcm92aWRlIHNjaGVkX2Nsb2NrIHVzaW5nIGdlbmVyaWMKPj4+IHNjaGVkX2Nsb2NrIGZy
YW1ld29yay4KPj4+Cj4+PiBUaGUgcGF0Y2hzZXQgaXMgdGVzdGVkIG9uIFFFTVUgdmlydCBtYWNo
aW5lLiBJdCBpcyBiYXNlZCBvbgo+Pj4gTGludXgtNC4yMC1yYzUKPj4+IGFuZCBjYW4gYmUgZm91
bmQgYXQgcmlzY3Zfc2NoZWRfY2xvY2tfdjIgYnJhbmNoIG9mOgo+Pj4gaHR0cHM6Ly9naXRodWIu
Y29tL2F2cGF0ZWwvbGludXguZ2l0Cj4+Pgo+Pj4gQ2hhbmdlcyBzaW5jZSB2MToKPj4+IMKgLSBB
ZGRlZCBwYXRjaCB0byBzZWxlY3QgR0VORVJJQ19TQ0hFRF9DTE9DSyBmb3IgUklTQy1WCj4+PiDC
oC0gS2NvbmZpZyBSSVNDVl9USU1FUiBkZXBlbmRzIG9uIEdFTkVSSUNfU0NIRURfQ0xPQ0sKPj4+
Cj4+PiBBbnVwIFBhdGVsICgyKToKPj4+IMKgIFJJU0MtVjogU2VsZWN0IEdFTkVSSUNfU0NIRURf
Q0xPQ0sgZm9yIGNsb2Nrc291cmNlIGRyaXZlcnMKPj4+IMKgIGNsb2Nrc291cmNlOiByaXNjdl90
aW1lcjogUHJvdmlkZSBzY2hlZF9jbG9jawo+Pj4KPj4+IMKgYXJjaC9yaXNjdi9LY29uZmlnwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4+PiDCoGRyaXZlcnMvY2xvY2tzb3Vy
Y2UvS2NvbmZpZ8KgwqDCoMKgwqDCoCB8IDIgKy0KPj4+IMKgZHJpdmVycy9jbG9ja3NvdXJjZS9y
aXNjdl90aW1lci5jIHwgOSArKysrKysrKysKPj4+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IEknbSBnb2luZyB0byBhZGQgdGhlc2UgdG8g
bXkgZm9yLW5leHQsIGJ1dCBsZXQgbWUga25vdyBpZiB0aGVzZSBzaG91bGQKPj4gZ28gdGhyb3Vn
aCBhIGNsb2NrIG1haW50YWluZXIncyB0cmVlIGluc3RlYWQgYW5kIEknbGwgZHJvcCB0aGVtLgo+
Cj4gSSdsbCB0YWtlIHRoZSBzZWNvbmQgb25lIHRocm91Z2ggbXkgdHJlZS4KCk9LLCBJIGRyb3Bw
ZWQgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
