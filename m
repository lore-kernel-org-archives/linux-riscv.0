Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B1C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9j8xRGzjTi4vDVYxSZaSk+Bwzv2Gzyr99OpVp2YY/Q=; b=ZdFYGNTvEuu3v1
	G82+9eBq/4j/TPcnb5COqIR5/TO3l0Z7VCY6lJElMfY8ASzoCNeoxK1ZzwAWuNSpdXIOjXX5Xkkt7
	1OHvRBvyJYI4gQY49eWlvePvPhl6ixILXq4i1LbqP8q2WvOxFMNuN6bTneJQUFTdyL6EGZrIcOwlJ
	q+/5FavsRd1m89j9AhO4eruo6g826o+bDwkElYH4fxadqCS3Eo3GbAg/07GQ17KWGpetgfq1OBAf6
	FFWI3WSmQsSrc/5Lcomwxjihw5lpTv7n82yvyfxPy5PZNdHQVBaZq4yVLougu2gJ9nnWvQVsN3Zu2
	lUwfcWSjHNbUKPbUlWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJyK-0000000A4AT-0Krz;
	Fri, 25 Jul 2025 15:04:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJxY-0000000A49L-18aJ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 15:03:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-612b34ef0c2so4167696a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455820; x=1754060620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erS7uq3udGCfO5nHaYm38RMSBFxJNRFCMK005w5A8Qk=;
        b=cd5koWpSRtJhITXG2ilkqWm5NBwJA9Mz/ZvUuHW2s/kDvNwqTdnmj8LBhSCJ+2HHz1
         47F8otMVEG6bBtCiQYLC8m2pTO5Prtoeiie3Bm/6QWdPy63rzy2/bBByg8RfhM8EQEU1
         VaJ8OB83HlkH2oB1FpFLKN1+p/NRh+WaqEuqmkvXdbXqLvYeHp4UgJjQJ3gKkRpwfU/I
         ndDT9vKSjIvTNwvRcJagMnnz0xcBkzf2U/lb7JbSM2pHHIVLp/ojyU275YYwzi91AoAh
         6x4dXoa2iRkBqm3+VEaxukrY4iG78NlqoHGEx8dn2l8nIbP/SLtiFUniVmyBpPEzWqCy
         LK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455820; x=1754060620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erS7uq3udGCfO5nHaYm38RMSBFxJNRFCMK005w5A8Qk=;
        b=TmeoEV9uySv0eEpzC+x5v8y2mUt/Un6dolLU0I3pzFJshuY+154WG6Pg9HeIYgb2tH
         fgTS/GVT+QOYhWqzC+KDZchoqsUU1I7DwAkn7mFilNef9CJjOmq6CcQKD8/06VYGc8b5
         N8mkntdBjXJyturZFDsuzRWsOXwcY0/5Vfz3BrAcQPcFQQTPc34zyV5zhccisuisC5CJ
         G9HHcJhDGXOHxHo3c2fou6QFcrkaIaYoe4N7Kw5IccqaJro4z6WCROuLzthM65UQc9B/
         GOBW6g4NT76wqxYrxH9nbwYNFt3WqgW+pvWLpneUNyjeWqjjvwRykRVJuzHX137i/6ks
         ieVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh8J+JgSTuDcmfl6WP/9Ha30uQw/KIRCSejPoZXqapRK1LGzr6pB18hOJzr4+dR2HksWCIRQZqjHC4QA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrs1KRVlrlt9J8hkCfMkQP5fdLkN5Outi+V3Wnkp+Y8Ul4OXUF
	IAuKZSy971gO4PYVCSPhSK2CqtktD8bCy/yyeCCrg/F8tSigWd5JAFmtLJepUNq+S+OmmLySHB9
	j9sBjdzqxtvAgWYUZDpT6Zax7f74nzn1YkIU83MA=
X-Gm-Gg: ASbGnctUYNPS3G75V+/tzNkV9LdQa6lPatPVxGrHHu0WumgXZ++l5Ych/pTZc3INgLG
	KLvtv4j7omfeHBLBtXTBDJSgAZfrSX2MKBhKonOYcq3ByoxtXHRUjKUddFRywfc819yJnBLw3aV
	RSWeGS5Vzo18OAtq5g1H/ncW4CFEbpB28AY5NA5cp1glHRz2HN/fCBFqW3gJKa5pFYcr67pMo8M
	zaf
X-Google-Smtp-Source: AGHT+IHGfS4PKdttSchEGmgyuX1Kywz/fBalH2X8p7gNn6r8V46aaJwbraqbv88gDObf9rt2X3E0glQHYih5p35dMYw=
X-Received: by 2002:a17:907:7f0b:b0:ae0:a483:39bc with SMTP id
 a640c23a62f3a-af61960265emr269272666b.46.1753455819042; Fri, 25 Jul 2025
 08:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
 <e4d9cac8-f7e0-4f69-85ac-19cba4a612c9@riscstar.com> <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
In-Reply-To: <CANAwSgQKQUxejwPTrsn=VgDjrsQc4qvKBrVJeWOirf-EtngDFg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 25 Jul 2025 20:33:21 +0530
X-Gm-Features: Ac12FXx40DUQdalB_A00prV9fyKpQQ8r_85tTODBZycf4BQGm1iLuSo9HpqJj6w
Message-ID: <CANAwSgTkoXzrBs5oDYsef5zNGL_2kkazzJLpFo-x6XtXx-nXTA@mail.gmail.com>
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_080344_312844_E16BC1D4 
X-CRM114-Status: GOOD (  27.49  )
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

SGkgQWxleAoKT24gRnJpLCAyNSBKdWwgMjAyNSBhdCAxNToxOSwgQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPiBPbiBGcmksIDI1IEp1bCAy
MDI1IGF0IDA3OjI2LCBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIDcvMjQvMjUgNDo1NiBBTSwgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4gSGkgQWxleCwK
PiA+ID4KPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIHdvcmsgb24gdGhlIFAxIFBNSUMgcGF0Y2gg
Zm9yIFNwYWNlbWl0IEsxIFNvQyAtIEJhbmFuYSBQaSBGMy4KPiA+ID4KPiA+ID4gSSd2ZSBiZWVu
IHRlc3RpbmcgeW91ciBwYXRjaCBzZXJpZXMgZm9yIHRoZSBCYW5hbmEgUGkgRjMgWzBdIHRvIGVu
YWJsZSBTRCBjYXJkCj4gPiA+IGFuZCBlTU1DIGZ1bmN0aW9uYWxpdHksCj4gPiA+Cj4gPiA+IFsw
XSBodHRwczovL3BhdGNoZXcub3JnL2xpbnV4LzIwMjUwNzEwMTc1MTA3LjEyODAyMjEtMS1lbGRl
ckByaXNjc3Rhci5jb20vCj4gPiA+Cj4gPiA+IFdoaWxlIGRlYnVnZ2luZywgSSBjcm9zcy1yZWZl
cmVuY2VkIHRoZSBwYXRjaCB3aXRoIHRoZSBCUEktRjMtVjMgYm9hcmQKPiA+ID4gc2NoZW1hdGlj
IFsxXQo+ID4gPiBhbmQgbm90aWNlZCBzZXZlcmFsIGRpc2NyZXBhbmNpZXMgaW4gdGhlIHBvd2Vy
IGNvbmZpZ3VyYXRpb246Cj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20v
ZmlsZS9kLzE5aUxKNXhuQ0Jfb0s4VmVRamtQR2p6QW4zOVdZeXlsdi92aWV3Cj4gPiA+Cj4gPiA+
IEluY29ycmVjdCBWb2x0YWdlIFJhbmdlczogVGhlIG1pbmltdW0gYW5kIG1heGltdW0gdm9sdGFn
ZSB2YWx1ZXMgZm9yCj4gPiA+IG11bHRpcGxlIHJlZ3VsYXRvcnMKPiA+ID4gKGluY2x1ZGluZyBC
VUNLcywgQUxET3MsIGFuZCBETERPcykgSW4gdGhlIHBhdGNoLCBkbyBub3QgbWF0Y2ggdGhlCj4g
PiA+IHNwZWNpZmljYXRpb25zIGluCj4gPiA+IHRoZSBzY2hlbWF0aWMncyBwb3dlciB0cmVlLgo+
ID4KPiA+IEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91IGNoZWNraW5nIHRoaXMuCj4gPgo+ID4gVGhl
IHZhbHVlcyBJIHVzZWQgd2VyZSBkZXJpdmVkIGZyb20gdGhlIHZlbmRvciBjb2RlIHRoYXQgSQo+
ID4gc3RhcnRlZCB3aXRoLiAgSSB3YXMgYXNzdXJlZCB0aGF0IHRoaXMgYmFzZWxpbmUgd29ya2Vk
IG9uCj4gPiB0aGUgQmFuYW5hIFBpIEJQSS1GMy4KPiA+Cj4gSSBhbSBqdXN0IGZvbGxvd2luZyBl
eGFtcGxlcyBmcm9tIFNvQyBsaWtlIFJvY2tjaGlwIGFuZCBTYW1zdW5nLgo+Cj4gPiBGb3IgdGhl
IHJlY29yZCwgSSAqZG8qIGhhdmUgYSBmdW5jdGlvbmluZyBTRCBjYXJkIGFuZCBlTU1DLgo+ID4g
SSdtIG5vdCBzdXJlIGp1c3Qgbm93IHdoYXQgeW91IGFyZSB1c2luZyBkaWZmZXJzIGZyb20gd2hh
dAo+ID4gSSBhbSB1c2luZy4KPiA+Cj4gPiBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCBhbmQg
cmVjb25jaWxlIHRoZSBkaWZmZXJlbmNlcyB5b3UKPiA+IHBvaW50IG91dCBidXQgSSdtIG5vdCBh
YmxlIHRvIGRvIHRoYXQgYXQgdGhpcyB0aW1lOyBtYXliZQo+ID4gbmV4dCB3ZWVrLgo+Cj4gWW91
IGFyZSB1c2luZyB0aGUgZGVmYXVsdCAgcmFuZ2VzICAwLjV+My40VkAzLjVBLgo+IEJ1dCBpbiB0
aGUgc2NoZW1hdGljJ3MgcG93ZXIgdHJlZSwgY29tcG9uZW50cyBzdWNoIGFzIFAxIChVMTQwMSkg
YW5kIEsxIChVeHh4KQo+IHNwZWNpZnkgcHJlY2lzZSB2b2x0YWdlIHJhbmdlcywgZm9yIGV4YW1w
bGU6Cj4gMC454oCvVuKAr8Kx4oCvMSUKPiAxLjjigK9W4oCvwrHigK8xJQo+IDMuM+KAr1bigK/C
seKArzElCj4KCkkgbWlnaHQgYmUgbWlzdGFrZW4sIGJ1dCBJIGNhbWUgYWNyb3NzIHdoYXQgc2Vl
bXMgdG8gYmUgdGhlIFNwYWNlbWlUClAxIGRhdGFzaGVldCBbMF0uClVuZm9ydHVuYXRlbHksIEni
gJltIG5vdCBhYmxlIHRvIHVuZGVyc3RhbmQgQ2hpbmVzZS4KClswXSBodHRwczovL2RldmVsb3Bl
ci5zcGFjZW1pdC5jb20vZG9jdW1lbnRhdGlvbj90b2tlbj1RNHVOd0Y5YTZpZElvNWs5VTBBY0s0
aVhuM2ImdHlwZT1wZGYKCkkgc3VzcGVjdCB0aGUgZHJpdmVyIGNvbmZpZ3VyYXRpb24gbWlnaHQg
c3RpbGwgYmUgaW5jb21wbGV0ZSwgYXMgdGhlcmUgYXBwZWFyCnRvIGJlIGNlcnRhaW4gcmVnaXN0
ZXIgYml0cyB0aGF0IG5lZWQgdG8gYmUgc2V0IGZvciBwcm9wZXIgZnVuY3Rpb25hbGl0eS4KVGhh
dCBzYWlkLCBJIGNvdWxkIGJlIG1pc3Rha2VuLgoKSWYgeW91IGhhdmUgYWNjZXNzIHRvIHRoaXMg
ZG9jdW1lbnQgcGx6IHNoYXJlLgoKVGhhbmtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
