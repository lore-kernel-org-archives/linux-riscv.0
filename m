Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B8CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfTHZmaEERXbSvwrXIG5sX56Kxb5tKv97YZ8npcX2mQ=; b=Uwb2bHzO5JDhva
	B/wDH0xCs7F9t5skOUdyDbn0rbqe43EXtwx7EyfRpsSOkWFljDHlvEA++IWl7zhHPttjMPki/prbC
	UbmQL4mnXfPsrj0pMp+6nPPg7zNTWmyVXvdhN6TO9g1id46DtPb15xPa5CboO/xxLtg8RSfUc1dH8
	XUIjzs3R4t6xeLeKqPSrVlm497QxRjFT8eIKKb2B2jBtudNjTSBSVxx4BHP7W+MSQOQCqAcp36jrS
	RfjmbvTve+x4iRzMf/qNTRmZyCmq3ctKonH9Cr9Ed1u8t9DAx7dclcnYjZyN4I1YKWjbMzRGw4Yii
	CKUtOnqNpYc1Uh04GnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuS4-0000000Ebhg-0e4s;
	Mon, 20 Oct 2025 18:17:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuS1-0000000EbhK-33k5
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:17:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b660019ac2aso588057266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760984263; x=1761589063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UXXcTo7pL8FwdLQ65iPxxNc1MmWR0vs1OAODGrVg5s=;
        b=OGQLwQDkL7lcl7ZgzJNO7KXp1flRz7hrgFOvKhiKYVtRGgYyT/KZICzho0dvdu6aV+
         iKEiIfaitRTYG/R2Eq104/dI44CxQ7H/EVuGcYBSp6BVILXmVX9x5b9WC3cvQ2Fw12le
         fGdWKmBtGdGQQI/LOt36Bsa1CcIJ22ZYLZa5nFckwUFW+/wo6v5PvWl9e7o9KLPFamR5
         8ou5/o5nxSaiu2FxoIAWLnsRysMCi4PADzd8GA35W9xloYPoB3OqmMxMV/fotC+c5SUQ
         OMsG9v4K1M83cjcRTrfHq6fF2jSFs3vQNmR2JWM+1i+cOD4AOn4NVYwLqTnEC2lJNV5t
         1fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984263; x=1761589063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UXXcTo7pL8FwdLQ65iPxxNc1MmWR0vs1OAODGrVg5s=;
        b=uzJumZDnBJOv+dDdRlhP9iXBcIfUpxP78fOlht5mk8+ZDKnZ4yrtKpP40OHev7U3nU
         Jl7msLBNlaqRp7uiLf3nasb+bpx17cEK0WN5WMFMEazApm+xg1EXcPtWMrq2nkczzeSQ
         bDCRXZabgw/R3ALJLWeLwsrAg1OH5ROl4UY7GI0mlLgNh4hOaG7aT8rm5/cEuYkzQJ1e
         kV/+PfZ2R7OAAWwGHC3S79kxtHRbv+jXUCJoKSkAQCmY2pkRPtuO5p28AJqIO5fNtmHj
         R7q1YuBKMhF4zx9jpy6rM2TLq+zoXRWw/EY6ZHcA9PcbtRc4W72bZfodmbHSn0wRu4nr
         z4/g==
X-Gm-Message-State: AOJu0YwwPkwt6EtVaqEXkwL4bwsx1M5p3OoQ50sGf5ihGogMmY6FxyCi
	Ieqj8I1H+StiPeqP1t3eVw6K8ugxgHRZb0sSaUub7agD4uGDjHWKRjTkL37S86NLaVTwbk6F1em
	i2/zLVmb5gmK4nnvG7wPbJN+WCiLNE5PPhRbcScJ8wsJ0AhaktKPI
X-Gm-Gg: ASbGnct8QFbCsWAbYHoQXwlUZn1oP3Fyva14DfRI23wc+R5GIjhwRt5OrI1ZtBYQ2sK
	WWLEk8kSFkKXVuIo6EoKo285DGjNso83RVrLu8aDKozMpJC2evqfpTWOcoXeUkiUo1SBkpc2oxq
	wPAhWLOPgrGAcmHDKb/yi1T1Z5BXkpqDOpdvRoah39KvrnrxquVigCQxsIyb7nKmZqdEsh04Jg5
	LVrOnXPSj2gqyhV3woeFYT4gJixmmOUKqB+qXWwoW93DF87khTAK8kAzhA1xbyeHVUOnw==
X-Google-Smtp-Source: AGHT+IE2YX2MuyqDCpADnZtzGiOKWQ5b8+e2b63WAsVNIvj3nVcKo/cbPm6L3qfNz9F3rs5HfaKJIMicSN1A2TOvLhU=
X-Received: by 2002:a17:907:2686:b0:b41:873d:e218 with SMTP id
 a640c23a62f3a-b64730451abmr1549689766b.14.1760984263574; Mon, 20 Oct 2025
 11:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <cf5a13ec-19d0-9862-059b-943f36107bf3@kernel.org>
In-Reply-To: <cf5a13ec-19d0-9862-059b-943f36107bf3@kernel.org>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 20 Oct 2025 11:17:07 -0700
X-Gm-Features: AS18NWBNpKo72nAY38NedTed4Hihs0U7r6IFP45uNtYvMxh_aFQJiZ7l3bXQnLw
Message-ID: <CALs-HsutifN4N9sOoc3=pepJjMpH+YmRMXySamhESUVvzO8ThQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: avoid uninitialized variable use in hwprobe_arch_id()
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_111745_938538_43289410 
X-CRM114-Status: GOOD (  10.25  )
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

T24gU2F0LCBPY3QgMTgsIDIwMjUgYXQgODozMuKAr0FNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFJlc29sdmUgdGhpcyBzbWF0Y2ggd2FybmluZzoKPgo+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYzo1MCBod3Byb2JlX2FyY2hfaWQoKSBlcnJvcjog
dW5pbml0aWFsaXplZCBzeW1ib2wgJ2NwdV9pZCcuCj4KPiBUaGlzIGNvdWxkIGhhcHBlbiBpZiBo
d3Byb2JlX2FyY2hfaWQoKSB3YXMgY2FsbGVkIHdpdGggYSBrZXkgSUQgb2YKPiBzb21ldGhpbmcg
b3RoZXIgdGhhbiBNVkVORE9SSUQsIE1JTVBJRCwgYW5kIE1BUkNISUQuICBUaGlzIGRvZXMgbm90
Cj4gaGFwcGVuIGluIHRoZSBjdXJyZW50IGNvZGViYXNlLiAgVGhlIG9ubHkgY2FsbGVyIG9mIGh3
cHJvYmVfYXJjaF9pZCgpCj4gaXMgYSBmdW5jdGlvbiB0aGF0IG9ubHkgcGFzc2VzIG9uZSBvZiB0
aG9zZSB0aHJlZSBrZXkgSURzLgo+Cj4gRm9yIHRoZSBzYWtlIG9mIHJlZHVjaW5nIHN0YXRpYyBh
bmFseXplciB3YXJuaW5nIG5vaXNlLCBhbmQgaW4gdGhlCj4gdW5saWtlbHkgZXZlbnQgdGhhdCBo
d3Byb2JlX2FyY2hfaWQoKSBpcyBzb21lZGF5IGNhbGxlZCB3aXRoIHNvbWUKPiBvdGhlciBrZXkg
SUQsIHZhbGlkYXRlIGh3cHJvYmVfYXJjaF9pZCgpJ3MgaW5wdXQgdG8gZW5zdXJlIHRoYXQKPiAn
Y3B1X2lkJyBpcyBhbHdheXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHVzZS4KPgo+IEZpeGVzOiBlYTNk
ZTljZThhYTI4MCAoIlJJU0MtVjogQWRkIGEgc3lzY2FsbCBmb3IgSFcgcHJvYmluZyIpCj4gQ2M6
IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgV2Fs
bXNsZXkgPHBqd0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2
b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
