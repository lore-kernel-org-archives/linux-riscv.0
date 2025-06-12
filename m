Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B9C7114A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w+wCU9swzwSmcibwqgxL2/3RMbXMvXrMuwSgx2xaC+c=; b=AdBLkJc1b4hqo0bYmJ2Dc4XuyV
	soCzcgRGyR3IPyn0WNcVIrWY9r/jFcNzUNqGvofU9EDYwDa+CJz7VEviMKzelr/5Gpp6j+HqPI40x
	rQ80LNrQX1gLqFI93SgGsAack+BPNx/QnvV/eISRTyXx4LvWRwM9jSlhDIl9woF7chQDIjPygSjye
	SC8qmIH1ymxvLo5XL9UOhfZ6cjq0Pkob4Vb2eW6T6hnpk3z595NZMpObmaUJ4ozeXwhIPezs3qVsY
	T7wiXU6Ypa/EPafIwAG6euqOCBoSHF5AwMNdw4C+cs/wq3YkR+zp3h/wlRGnMM61XDy2ZP2xgE1bQ
	cfPvuR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnuV-0000000EPEB-1jHJ;
	Thu, 12 Jun 2025 19:48:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnS6-0000000ECgx-3cpv
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 19:19:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-748582445cfso918419b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749755945; x=1750360745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQsQfCGvPn4HYHeYVZtvkInHk34iWbQaz+5Wgqu7iqg=;
        b=EcAvQ0qTegz+14ibPjp0PrAeW3pKFxlFpGcrWGiyCGTCQGDcT8eujIqHVVG7bOqY2c
         w/kdoUw9nPhWTG8ty6rnBvETgYYrLvD0hZehd9h53GfMF7U9JW5uN4kFUj47vaPZ3htL
         pMDJRhDesGWEB/RxZ4p0r4fk8JUkSrEiuu1qW/r6rwIbPQf6f9eZDTl39P8lxNxK/ijj
         TctvfNakZYVCQoqLs13gwslyS2YACQnCrV8ZmPoNLWY0GV7YlFM5S6rMN70vopQq6uS8
         anrQiGClh0Dvi6iVkXvEiP6EjKOK1y/bQPH6P/y+IY63lBex665hL5SNzEGUevV+gfjT
         6TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749755945; x=1750360745;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQsQfCGvPn4HYHeYVZtvkInHk34iWbQaz+5Wgqu7iqg=;
        b=dLq4Gs3r9WJUEGVeFaGQdmDKueLOSuldGOwn55hjnVsu+MLDKO2gCjki4/JkIQmj2M
         apDmNm9lsBmNyHopad1P/EaFpNElf7s2bFtqLOO6/N1+/ehhWmQxeyr50jV7GcrZwneM
         XkpIsqpztQ5DvkO5lZP9xajEzT5NLy6HmRPoGd3Mfu6ts/Vdms8uvB5M9iOIBWKmU4QH
         xCqsF2ZT8ZTWjp7r8LRLo69mLwTnl+oTj82pjrKVjO0/D6SMOzx3SdV0NBiV2PaSBjqD
         1OGeRp9EWpkmio6M6IoRppJyqSO3JIMu521/YGev6LODkCg5G3KjLZtTDDeyrGPS1Zx+
         l+RQ==
X-Gm-Message-State: AOJu0YyJFHwwbNXePQbr6EovBHixJnTCDZjcad5UYtWaoNsi1NeJqu7E
	+d30ppZ/KjhB/qZXmyCKW5XS7rci8g0VuOJ799HwovmUW6Wp2ZYLuJpW5RTlBlUzO30pVBjq8k/
	Lbdyf
X-Gm-Gg: ASbGncs35LCjkUXIOg6Jn/8yraA3GGBrbZC3rDpzrtHLW6QE27XxRqhdz9Gj8zMkKV5
	6HRArBLFHik+aG3AJJLeFRodEKoQPlHMvQYFRZxkMN9icLUyX+bOeOggS62j2BKTkxwXMeD2Xto
	1tx/r/iKrypcRVdTdSmrbU4g8ygmfGxwVRH0vgdfezovWwqKyej1yGFeWKcZP8Fu0Vzgkez5QrS
	PHUFlz1o/hddiKztG9tzcuMDtCthi/eNJ4h8W6dNIfqv5MaOyvACVJMWWJ+qxUhhFIL1DA1xHmq
	uxkRmhyUsOsr5YYhu4XDlD1tegq03prbtQ2OhtfgGAhpa5nv/XoedRc76tlQ
X-Google-Smtp-Source: AGHT+IHUzy6R83mSy0ibqswSLOe3k/QiQ+Gl5AKy7YEaBXglEI/s5Ur8TnFI8yr/bhPVJK0Hs3zbWA==
X-Received: by 2002:a05:6a21:339c:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-21facbaecd1mr180763637.6.1749755945556;
        Thu, 12 Jun 2025 12:19:05 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74890006367sm90210b3a.52.2025.06.12.12.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:19:05 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:19:05 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 12:19:00 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.16-rc1
In-Reply-To: <ce79482e-1b7e-4d7e-a030-8c250a7e406a@ghiti.fr>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-6E28B1B0-968F-41D6-9466-2BF4A45B34AE@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_121906_904214_5C791072 
X-CRM114-Status: GOOD (  27.73  )
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

T24gVHVlLCAxMCBKdW4gMjAyNSAxMzoxMzoyMCBQRFQgKC0wNzAwKSwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTkyNzJiMzdhYTRm
ODNjYTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5NDoKPgo+ICDCoCBMaW51eCA2LjE2LXJjMSAoMjAy
NS0wNi0wOCAxMzo0NDo0MyAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+Cj4gIMKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9hbGV4Z2hpdGkvbGludXggCj4gdGFncy9yaXNjdi1maXhlcy02LjE2LXJjMQo+Cj4g
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDBlNzgxNWU0NjQ4NDdhY2JlNWQ5YWRmYjM1
MWM2OGY4MjJiYmFhN2U6Cj4KPiAgwqAgUklTQy1WOiB2RFNPOiBDb3JyZWN0IGlubGluZSBhc3Nl
bWJseSBjb25zdHJhaW50cyBpbiB0aGUgZ2V0cmFuZG9tIAo+IHN5c2NhbGwgd3JhcHBlciAoMjAy
NS0wNi0xMCAwODo0Mzo0NiArMDAwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiByaXNjdiBmaXhlcyBmb3IgNi4x
Ni1yYzEKPgo+IC0gQSBmaXggZm9yIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGdldHJhbmRvbSB2ZHNv
IHdoZXJlIGNsYW5nIG9wdGltaXplcyAKPiBhd2F5IGEgcmVnaXN0ZXIgdmFyaWFibGUgd2hpY2gg
aXMgYm90aCBhbiBpbnB1dCBhbmQgYW4gb3V0cHV0IHBhcmFtZXRlcgo+IC0gQW5vdGhlciBmaXgg
Zm9yIHZkc28gdG8gcHJldmVudCBhbiBlcnJvciBmcm9tIGxsdm0tcmVhZGVsZgo+IC0gQSBmaXgg
Zm9yIHRoZSBydW50aW1lIGNvbnN0YW50IHN1cHBvcnQgd2hpY2ggZGlkIG5vdCBoYW5kbGUgdGhl
IHplcm8gCj4gY2FzZSBjb3JyZWN0bHkKPiAtIEEgZml4IGZvciB0aGVhZHZlY3RvciB3aGVyZSB3
ZSBkaWQgbm90IHNhdmUgYWxsIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzLCAKPiBvbmx5IGEgZmV3IG9m
IHRoZW0KClRoaXMgb25lIGlzIGV4cG9zaW5nIHNvbWUgb2YgdGhlIHdvcmtmbG93IGlzc3VlcyBh
Z2FpbjogdGhlcmUncyAKZHVwbGljYXRlIHBhdGNoZXMgaW4gaGVyZSwgYW5kIEkgbGV0IGl0IGhh
bmcgb3V0IG92ZXJuaWdodCB0byBnaXZlIApsaW51eC1uZXh0IGEgY2hhbmNlIHRvIHNlbmQgdGhl
ICJ0aGVyZSdzIGR1cGxpY2F0ZSBwYXRjaGVzIiBlbWFpbCBhbmQgCmRpZG4ndCBnZXQgYW55dGhp
bmcuICBJJ3ZlIGhhZCBpc3N1ZXMgd2l0aCBnbWFpbCBlYXRpbmcgbGludXgtbmV4dCAKbWVzc2Fn
ZXMgYmVmb3JlLCBzbyBzb3JyeSBpZiBJJ20ganVzdCBtaXNzaW5nIHRoZW0uICBTbyBub3QgcXVp
dGUgc3VyZSAKd2hhdCdzIGdvaW5nIG9uLCBidXQgSSB0aGluayB0aGF0J3MgcGFydCBvZiB0aGUg
cHJvYmxlbS4KClRoZXJlJ3MgYWxzbyBubyAiYjQgdHkiLXR5cGUgbWVzc2FnZXMsIHdoaWNoIG1h
a2VzIGl0IGhhcmQgdG8gc29ydCBvdXQgCnRoZSBkdXBsaWNhdGVzIG1hbnVhbGx5IChvciBJJ20g
bWlzc2luZyB0aGVtLCBvbmUgb2YgeW91ciBvdGhlciBtZXNzYWdlcyAKZGlkbid0IG1ha2UgcGF0
Y2h3b3JrKS4KCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj4gTm90ZSB0aGF0IHRoZXJlIGFyZSBzdGlsbCBpbXBvcnRh
bnQgcGVuZGluZyBmaXhlcyB0aGF0IG5lZWQgcmV2aWV3cyBhbmQgCj4gdGVzdHM6Cj4KPiAtIHJh
aWQ2IAo+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDYxMDEwMTIz
NC4xMTAwNjYwLTEtemhhbmdjaHVueWFuQGlzY2FzLmFjLmNuL1QvI3QpCgpJJ2xsIGp1c3QgZ3Jh
YiB0aGUgdGhhdCB0MCBmaXggLS0gSSB1bmRlcnN0YW5kIGl0IGVub3VnaCB0byB0YWtlIGl0IAp3
aXRob3V0IGEgcmVwcm9kdWNlciwgSSB3YXMgZ29pbmcgdG8geWVzdGVyZGF5IGJ1dCBzb3J0IG9m
IGp1c3QgZ290IAp0aXJlZC4gIEknbGwgZ28gcG9zdCBvbiB0aGUgdGhyZWFkLi4uCgo+IC0gaW5p
dGlhbGl6YXRpb24gb2YgdmRzbyBzdGF0aWMgZGF0YSAKPiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNTA1MjIwNzMzMjcuMjQ2NjY4LTEtd2FuZ2ppbmd3ZWlAaXNjYXMu
YWMuY24vKQoKVGhlcmUncyBhIHYzIHdpdGggc29tZSBjb21tZW50YXJ5IG92ZXIgaGVyZTogCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L21obmctRkM3RTFEMkMtRDRFMS00OTBF
LTkzNjMtNTA4NTE4QjYyRkU1QHBhbG1lcmRhYmJlbHQtbWFjLwoKPgo+IFNvIEkgbWF5IGNvbWUg
d2l0aCBhbm90aGVyIFBSIHRoaXMgd2Vlay4KPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+IEFsZXhhbmRyZSBHaGl0
aSAoMSk6Cj4gIMKgwqDCoMKgwqAgTWVyZ2UgcGF0Y2ggImZpeCByaXNjdiBydW50aW1lIGNvbnN0
YW50IHN1cHBvcnQiCj4KPiBDaGFybGVzIE1pcmFiaWxlICgxKToKPiAgwqDCoMKgwqDCoCByaXNj
djogZml4IHJ1bnRpbWUgY29uc3RhbnQgc3VwcG9ydCBmb3Igbm9tbXUga2VybmVscwoKVGhpcyBh
bHNvIHNlZW1zIHRvIGJlIGJhc2VkIG9uIGFuIGFyYml0cmFyeSBwYXRjaCwgd2hpY2ggaXMga2lu
ZCBvZiAKY2x1bmt5LiAgSXQgc2VlbXMgbGlrZSB5b3UndmUgZ290IHNvbWUgbWl4IG9mIG1lcmdp
bmcgYW5kIHJlYmFzaW5nIGdvaW5nIApvbiwgd2hpY2ggaXMgcHJvYmFibHkgYWxzbyBwYXJ0IG9m
IHdoeSB5b3VyIFBSIGZyb20gdGhlIGxhc3QgbWVyZ2UgCndpbmRvdyBoYWQgdGhlIHJlYmFzZSBp
c3N1ZT8KCj4gRmFuZ3J1aSBTb25nICgxKToKPiAgwqDCoMKgwqDCoCByaXNjdjogdmRzbzogRXhj
bHVkZSAucm9kYXRhIGZyb20gdGhlIFBUX0RZTkFNSUMgc2VnbWVudAo+Cj4gSGFuIEdhbyAoMSk6
Cj4gIMKgwqDCoMKgwqAgcmlzY3Y6IHZlY3RvcjogRml4IGNvbnRleHQgc2F2ZS9yZXN0b3JlIHdp
dGggeHRoZWFkdmVjdG9yCj4KPiBYaSBSdW95YW8gKDEpOgo+ICDCoMKgwqDCoMKgIFJJU0MtVjog
dkRTTzogQ29ycmVjdCBpbmxpbmUgYXNzZW1ibHkgY29uc3RyYWludHMgaW4gdGhlIAo+IGdldHJh
bmRvbSBzeXNjYWxsIHdyYXBwZXIKPgo+ICDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcnVudGlt
ZS1jb25zdC5owqAgfMKgIDIgKy0KPiAgwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0
cmFuZG9tLmggfMKgIDIgKy0KPiAgwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5owqDC
oMKgwqDCoMKgwqDCoCB8IDEyICsrKysrKy0tLS0tLQo+ICDCoGFyY2gvcmlzY3Yva2VybmVsL3Zk
c28vdmRzby5sZHMuU8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+ICDCoDQgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpTbyBJIGp1c3QgcmViYXNlZCB0aGlz
IHRvIGRyb3AgdGhlIGR1cGxpY2F0ZXMuICBJdCdzIG9uIHRoZSB0ZXN0ZXIsIApzaG91bGQgc2hv
dyB1cCBzb29uLi4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
