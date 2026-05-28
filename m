Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D625ECD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 05:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZzu9/5y4p63RwvDWX9gTIq0LxicLBAIh+za1HH8yxk=; b=IZ77CPdy+CUQCb
	slUEdvs5T4xcuf5yTXWiov4Vc9ZaQCNN/RsCwGoZ2C0fR1tmT13MJSm4RlEhRqDay5zEy9BfsISQH
	IphBLyOrRcmYfhvUKoMD/cMImgfYoPV7aY+HbCO3JPfab0u/kATz9J/zYEqRq5m8hOWmGf8dkDHoN
	MqPQXeRPIYT2k8c8Y5w6FKD/k/Gulb3fYtaWkRZQMfj7qrzX9xCgBfGXOCKSCGQghDZL/VCA9rcje
	R/xTGM3pxqYPKChmvAPJuZ2A4vuj2MKb9bCVboeMXUPSQuw08WNw+HJDpA5Rp40K/c5I4UaOD1iDi
	znazNC03bfeBS27Bji0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wST8x-0000000589d-2QAH;
	Thu, 28 May 2026 05:18:55 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wST8u-00000005897-2UfB
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 05:18:54 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7cd35604a95so119704897b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 May 2026 22:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945531; cv=none;
        d=google.com; s=arc-20240605;
        b=ICtI0ulbsYE0LMQSpfkm3+eitjBskEfpKcjP2kKUNHxg+WN9NAJTm9vEdySFkrhwA8
         AWcg1pIOB0YBq0j0BSLMkHHjfkz6acF63LahE34zctscF5jU/lwj2xZZ2Tqqzolf8kMv
         DNdgkR1rfV88dOV7SDXuCW+UGGC3vtFRIUnlUNVwd0I9zihuJ3TBd21FeO+GkGwMQwje
         He9wyqsPjIMUynJqD7youKov2YAQ2Xv5xp4TDRyROt6xddWzOScsQSvuXivilINL5UwP
         3PtjEfajrHRnx7ausIuN3C/q/6Bume3MVNaTeTHyqx5X92nOaNLE3PZk+MKeweBnbG3N
         huGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        fh=YGSIDhwkNBTcM5TR/awERx6l4KmoX+lHm1/H/TTSld4=;
        b=Sig1pbeWRCCy824j7k8qO9EvmK7B1PyRumq1BBt6GGRW55E660rKApASNCs4Q1+wi9
         JtPbgvIN/ueEQofFd131Ta03LHQFGM/8ELUdbfL8qlQs5oRwHjownqMpYnVZlPIkvNBA
         2Y6eCb7XLgB5paoX2i8r9I0tikke27mJLa3Vz1nCvEbi7fGnOVqo3eCT+U6q3q8RQz/u
         pRMGrVVCbGNggf+MVkmNnAhK4XofIidV6M3xLwmLQ7m5oJ8ukesqrC2CoyYGx9t139L9
         3DhP1NyzccaZbtUqnHAvf1QLPy3cH9fVkd3lO86oaAaakk01XfVgbdPyEuhAH+nW+onk
         vwYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779945531; x=1780550331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=KEI6iAvH51LBjGKCr3+9xI/PMtTtThs7D0EkWsWN/dwT73597Qdvcph9ecwbnYqvqL
         Rrbm2w2qgao3ezF7rFh/8ckUmG0bHT1tp+NjrFvwJ6foySq60A7237h22OEls4zR2bFD
         rFoyDGztDUyue3Hze7YXBxLIwInF5+4qZj+mR1TYpCGBuGbbuvG4ao8eUjLCb6z3FVka
         kaJ8/HOyIrubKHfsXOoZDwSfG5RVPTEuOvvoe37/MqRSWrn6Q+lBiUAzE3e/lpqNpOr5
         PWZgFnXoEQfV48Y4EaxfBOXLwl63xpBSN+5ct6pB7i/Pb6fUUgEjTlQ8avorD16gQjJX
         nKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945531; x=1780550331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=pAW9JaKKAFyf+O89B+80NLOLfQRL40mep6WahODf/+XB5goxVvAqiCDeuVnYAiV6KG
         NbIBavhiopqufeFgrTaACYlclPYkO6/1Oe1Wh9F3lwXWzZGtut/V7ONLGqoPjqvn76ZO
         I3HZx/l81Z7v6/QYtF7QmijYmBGuDz3v5rrJ2pRPNHzHpukGd1tRW2zeDKk8w8E3J2a5
         Ql88RE4q7+pChoCiX6erP2zcBhk0oWVoW2v2sr1MTf3PnzsEUOHVfIZ/dTv8aWUjkQFp
         FH83Ve2OqbaZHMf3n7j5oPxPf3zXdG44J/WmPt0QM+ix4u87ht63GPDavuKW0O0KiI8u
         xuCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+388YIx1qU6XtT1YTH0eb/rm339gl7A54UTqTkZVkrU9Yaw/kf2vmWHdpL522UuRdge4SsxqTPjfcuzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCaSGmAgH4q6Z77CsmYQ3yBHSnoO8YpOYVSw8svYd/PUtcz2bs
	LCcQaLrAyANLvYEKrgWmyLCqV8sxDWoMMrTc+WAXXnqUykRFKhaCu580UFq5N2/TKO4HWUukhS5
	eJihEvoiatrfBHb3HnhPTkT/XPUo5Yixp6ycX+MDi3w==
X-Gm-Gg: Acq92OG5K+uDfGw3eQnV4hQf7N+wChjKcyGYqpQQHIifLdwm+cXZq2NX4udBlHw1+WQ
	dwFyvc+c6rTD5/zaBs5qxXHwrUfvbQg5Q8QVjFPEUAsuBhjqOWf7cV5t7QGOqIAMtklIwU3ZxgO
	x0439NwMi2/CQZHoLuj0o0MDCe8bo3wyo07NrXfNoMmiJDU184zhIyfhN0xQxCB0rrlstNvmoYA
	keY214UtBzwg/ByctafqsWnq1bgLzAcrp0vCDkdc0ih7FBtSDCkL7dfgkf/y/jy8c00tepDOhN2
	3dtxMDJhfvsX3xJyccg9TV6EEQTS/EQX3Cj70y1MyIGxt6CsDI+D2ju499obcfxrttcBMaA+43M
	SRw==
X-Received: by 2002:a05:690e:1181:b0:654:6450:19f7 with SMTP id
 956f58d0204a3-6604471b0bdmr104584d50.0.1779945530981; Wed, 27 May 2026
 22:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
In-Reply-To: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 28 May 2026 13:18:39 +0800
X-Gm-Features: AVHnY4KOywjUf4xyXWLMCKeI0N-wdBoPItg6KtOmuhSwAAW2j9qgS8Kea3oyUX8
Message-ID: <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_221852_896546_AF35D9C9 
X-CRM114-Status: GOOD (  11.18  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgMzoyM+KAr1BNIEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgWmljY3JzZSBJU0EgZXh0ZW5zaW9uIHRvIGFs
bCBlaWdodCBYMTAwIGNvcmVzLiBaaWNjcnNlCj4gcHJvdmlkZXMgYSBmb3J3YXJkIHByb2dyZXNz
IGd1YXJhbnRlZSBvbiBMUi9TQyBzZXF1ZW5jZXMgaW4gbWFpbgo+IG1lbW9yeSByZWdpb25zIHdp
dGggY2FjaGVhYmlsaXR5IGFuZCBjb2hlcmVuY2UgUE1Bcy4KPgo+IFRoZSBTcGFjZW1pVCBYMTAw
IGNvcmUgc3VwcG9ydHMgaXQgcGVyIHRoZSBTcGFjZW1pVCBLMyBoYXJkd2FyZQo+IHNwZWNpZmlj
YXRpb24uCgpGb3IgdGhlIHJlY29yZCwgSSBoYXZlIHRlc3RlZCB0aGlzIGNoYW5nZSBvbiBTcGFj
ZW1pVCBLMyBQaWNvLUlUWC4KClRoZSBzdHJlc3MgdGVzdCBpcyBydW4gYnkgZW5hYmxpbmcgQ09O
RklHX0xPQ0tfVE9SVFVSRV9URVNUPXkgdGhlbgpib290cyB0aGUga2VybmVsIHdpdGg6CgogIGxv
Y2t0b3J0dXJlLnRvcnR1cmVfdHlwZT1zcGluX2xvY2sgbG9ja3RvcnR1cmUubndyaXRlcnNfc3Ry
ZXNzPTE2Cgpkcml2aW5nIGFsbCA4IGhhcnRzLiBJdCBzdXJ2aXZlZCBzdXN0YWluZWQgdG9ydHVy
ZSBbcmFuIGZvciB+MTAgbWludXRlc10Kd2l0aCAwIEZhaWwuCgouLi4gLi4uClsgIDczNS41ODg5
NDddIHRvcnR1cmVfc3Bpbl9sb2NrX3dyaXRlX2RlbGF5OiBkZWxheSA9IDI1IGppZmZpZXMuClsg
IDczOC4wMTUwOTZdIHRvcnR1cmVfc3Bpbl9sb2NrX3dyaXRlX2RlbGF5OiBkZWxheSA9IDI1IGpp
ZmZpZXMuClsgIDczOS4yMDQ3MTNdIHRvcnR1cmVfc3Bpbl9sb2NrX3dyaXRlX2RlbGF5OiBkZWxh
eSA9IDI1IGppZmZpZXMuClsgIDc0MS4xOTUyMTFdIFdyaXRlczogIFRvdGFsOiA3MTQzMTk0MjAg
IE1heC9NaW46IDQ1OTQ2NTk5LzQzNjc5ODc2ICAgRmFpbDogMAoKVGhhbmtzLApHdW9kb25nIC8g
ZG9jdWxhcnh1CmRvY3VsYXJ4dUBvdXRsb29rLmNvbQoKPgo+IFNpZ25lZC1vZmYtYnk6IEd1b2Rv
bmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2szLmR0c2kgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMy5kdHNpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
