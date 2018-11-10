Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A59C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:39:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A0520818
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxESkn+D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MzzzTO3u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A0520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6ebS9/16nI9W5wo7BUpckCSiMNo9K6Zf5F76779Xbg=; b=hxESkn+DdexWn7
	icAu5k79DMG9NPsTVjXa0bhjnb/YNgyY/vZ0/dyZUdIh7OxNndvrdhVqLy6oR9+YTxI6VqcxsoN1F
	S2H2OPVKmDbKm9pUk3+0fBkbffHRpy9W7nxrvvOi7bLWLzLhXCtNGJASgDmfSS95EsnQSfR3VfTTz
	6fCB3SkAKwvBJiqUizJ6kiynA0RG734ChZFhn37tssY6xIA5jfZNSXaWSRU8g6HposaMpl6qH+Xq7
	eB6WqE+j0u7yPfMZYxVnFgMCz7CeSD6VfqJplqN/HRJgJTsHP482hCQfLXq3W7k1Ri3OoHWASHXp7
	/ckojwTBZxw2DW17o77Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLLz4-0005nq-CH; Sat, 10 Nov 2018 05:39:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLLz0-0005mm-Mj
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 05:39:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id b5-v6so1873827pla.6
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 21:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=A3/1sFXQUOL8UOKDGcWLhA0s/DfcT8HNWuJiRW9U6C4=;
 b=MzzzTO3u4wJK+ojMryhq648tL9PYuTe0Vmr4GGhSJMd/SJWnue+d1k9RdQc1KuWevA
 yrh6hbbQi/cmRsCyA09vVDg7ztup7L6ih0wcEYRrBjlIiTWKXS3KU4/s7F6QSKgX0v9Y
 RRSMbWxvqMDmCT3HLGqCrqaAAhvu0gd0mCriGpGr1v/iqhOzsFq2MD6SGn2JSAk8Yyye
 bk8SrpN9GN52i3aKrfeCcW7k7Yr8yOhm1RAOYSyihYeVxTQjaXtgdHmYXGqK3AkaFfYn
 B65QSOJLQ3SIzrcUnwQ6aMy0i8/6UJIWCq4GMItI47z1sP185VN4V9hhznMZzzIPyEBj
 d1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A3/1sFXQUOL8UOKDGcWLhA0s/DfcT8HNWuJiRW9U6C4=;
 b=DMBkn23sM2PgMLduZM5Hwgyh4F+30xnHetOK8YgMxad8WNLpZVtORsxxQzklxnvTNk
 LZYDGPO3Qc8AjR0q0JvqcN16KMyf+9u2d00xRMBJoaeesJL7JYbM4tj6Ar+A2iKZv6YT
 LQlO8hXUmv8nDR801MdZC2S6rgxso+T3rjIPpztQMnEiI574nTm4MYxMoa3zGpllQAK5
 joIm80AsNf7OwxP3h5aD6AFtDGu7PoXMKKZCEDzLzu23Ch0O94k+mhOzFpFxgmyz6fqt
 j7Uva/7enGsnqPCN8DT/SUPj6U1SKPi+8NXKbtQ3vS6BqNJQV/saaP67bZtocEy0CKMG
 J8Ew==
X-Gm-Message-State: AGRZ1gIOhxe4zdU/W8P/7kfrmovrNeBSnx6ofMyp4ZcMc3chQEhEW+1c
 jlbyTdrSXGxESJpCXSq4o29Sfh/xg7Q=
X-Google-Smtp-Source: AJdET5dKuTUxsok2kKvt1YZIN1xFRiD6prEycwQ6RmO67NhjCUEq1Q9QjwjZL08KL9MOehwHaXz1qw==
X-Received: by 2002:a17:902:64c1:: with SMTP id
 y1-v6mr11794125pli.210.1541828325610; 
 Fri, 09 Nov 2018 21:38:45 -0800 (PST)
Received: from [10.17.0.26] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id h128-v6sm9753006pfb.52.2018.11.09.21.38.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Nov 2018 21:38:45 -0800 (PST)
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo> <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
 <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
 <20181016220437.GB31973@mithrandir>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <e4e80da0-103b-1812-3478-8331e867a914@sifive.com>
Date: Fri, 9 Nov 2018 21:38:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181016220437.GB31973@mithrandir>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_213858_743061_0B558AE0 
X-CRM114-Status: GOOD (  24.97  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110053841.GwzCkQ86UrQhLNN5HORCxC4I8TdIppo6SkEx5T3hapU@z>

Ck9uIDEwLzE2LzE4IDM6MDQgUE0sIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDE2LCAyMDE4IGF0IDEwOjMxOjQyQU0gLTA3MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4+IE9u
IDEwLzE2LzE4IDQ6MDEgQU0sIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+Pj4gT24gTW9uLCBPY3Qg
MTUsIDIwMTggYXQgMDM6NTc6MzVQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4gT24g
MTAvMTAvMTggNjo0OSBBTSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgT2N0
IDA5LCAyMDE4IGF0IDExOjUxOjIyQU0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+Pj4+Pj4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+Pj4+PiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgb25l
IG9mCj4+Pj4+PiArCSJzaWZpdmUsZnU1NDAtYzAwMC1wd20wIiwic2lmaXZlLHB3bTAiLgo+Pj4+
PiBXaGF0J3MgdGhlICcwJyBpbiBoZXJlPyBBIHZlcnNpb24gbnVtYmVyPwo+Pj4+Pgo+Pj4+IEkg
dGhpbmsgeWVzLiBTaW5jZSBmdTU0MCBpcyB0aGUgZmlyc3QgTGludXggY2FwYWJsZSBSSVNDLVYg
Y29yZSwgU2lGaXZlIEd1eXMKPj4+PiBkZWNpZGVkIG1hcmsgaXQgYXMgdmVyc2lvbiAwLgo+Pj4+
Cj4+Pj4gQFdlc2x5OiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLgo+Pj4gSXQgc2Vl
bXMgZmFpcmx5IHN1cGVyZmx1b3VzIHRvIG1lIHRvIGhhdmUgYSB2ZXJzaW9uIG51bWJlciBpbiBh
ZGRpdG9uIHRvCj4+PiB0aGUgZnU1NDAtYzAwMCwgd2hpY2ggYWxyZWFkeSBzZWVtcyB0byBiZSB0
aGUgY29yZSBwbHVzIHNvbWUgc29ydCBvZgo+Pj4gcGFydCBudW1iZXIuIERvIHlvdSByZWFsbHkg
ZXhwZWN0IHRoZXJlIHRvIGJlIGFueSBjaGFuZ2VzIGluIHRoZSBTb0MKPj4+IHRoYXQgd291bGQg
cmVxdWlyZSBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHN0cmluZyBhdCB0aGlzIHBvaW50PyBJZiB0
aGUKPj4+IFNvQyBoYXMgdGFwZWQgb3V0LCBob3cgd2lsbCB5b3UgZXZlciBnZXQgYSBkaWZmZXJl
bnQgdmVyc2lvbiBvZiB0aGUgUFdNCj4+PiBJUCBpbiBpdD8KPj4+Cj4+PiBJIHdvdWxkIGV4cGVj
dCBhbnkgaW1wcm92ZW1lbnRzIG9yIGNoYW5nZXMgdG8gdGhlIFBXTSBJUCB0byBzaG93IHVwIGlu
IGEKPj4+IGRpZmZlcmVudCBTb0MgZ2VuZXJhdGlvbiwgYXQgd2hpY2ggcG9pbnQgaXQgd291bGQg
YmUgc29tZXRoaW5nIGxpa2UKPj4+ICJzaWZpdmUsZnU2NDAtYzAwMCIgbWF5YmUsIG9yIHBlcmhh
cHMgInNpZml2ZSxmdTU0MC1kMDAwIiwgb3Igd2hhdGV2ZXIKPj4+IHRoZSBudW1iZXJpbmcgaXMu
Cj4+Cj4+IFRoZSAiMCIgc3VmZml4IHJlZmVycyB0byBhIHJldmlzaW9uIG51bWJlciBmb3IgdGhl
IHVuZGVybHlpbmcgUFdNIElQIGJsb2NrLgo+Pgo+PiBJdCdzIGNlcnRhaW5seSBpbXBvcnRhbnQg
dG8ga2VlcCB0aGF0IHZlcnNpb24gbnVtYmVyIG9uIHRoZSAic2lmaXZlLHB3bTAiCj4+IGNvbXBh
dGlibGUgc3RyaW5nIHRoYXQgZG9lc24ndCBoYXZlIHRoZSBjaGlwIG5hbWUgYXNzb2NpYXRlZCB3
aXRoIGl0Lgo+IElzbid0IHRoZSBoYXJkd2FyZSBpZGVudGlmaWVkIGJ5ICJzaWZpdmUscHdtMCIg
YW5kICJzaWZpdmUsZnU1NDAtYzAwMCIKPiBlZmZlY3RpdmVseSBpZGVudGljYWw/IAoKClRoZSBp
bnRlbnRpb24gd2FzIHRoYXQgdGhlICJzaWZpdmUscHdtMCIgY29tcGF0aWJsZSBzdHJpbmcgc3Bl
Y2lmaWVzIGEKcmVnaXN0ZXIgaW50ZXJmYWNlIGFuZCBwcm9ncmFtbWluZyBtb2RlbCB0aGF0IHRo
ZSBJUCBibG9jayBleHBvc2VzIHRvCnRoZSBzb2Z0d2FyZSwgcmF0aGVyIHRoYW4gYSBwYXJ0aWN1
bGFyIHVuZGVybHlpbmcgaGFyZHdhcmUKaW1wbGVtZW50YXRpb24uwqAgVGhhdCBpcyBpbiBjb250
cmFzdCB0byBhIHN0cmluZyBsaWtlCiJzaWZpdmUsZnU1NDAtYzAwMC1wd20iIHdoaWNoIG1pZ2h0
IGFjdGl2YXRlIHBhcnRpY3VsYXIgd29ya2Fyb3VuZHMgb3IKcXVpcmtzIHRoYXQgYXJlIHNwZWNp
ZmljIHRvIHRoZSBpbnRlZ3JhdGlvbiBvZiB0aGUgSVAgYmxvY2sgb24gYSBnaXZlbiBTb0MuCgoK
VGhlIGlkZWEgaXMgdGhhdCwgZm9yIHRoaXMgYW5kIHNpbWlsYXIgb3Blbi1zb3VyY2UgaGFyZHdh
cmUgSVAgYmxvY2tzLAp0aGUgZHJpdmVyIGNvZGUgY2FuIGp1c3QgbWF0Y2ggb24gYSBnZW5lcmlj
ICJzaWZpdmUscHdtMCIgY29tcGF0aWJsZQpzdHJpbmcuwqAgVGhlIFNvQyBEVCBkYXRhIHdvdWxk
IGluY2x1ZGUgYm90aCB0aGUgU29DLXNwZWNpZmljCiJzaWZpdmUsZnU1NDAtYzAwMC1wd20wIiBh
bmQgdGhlIGNvbW1vbiBpbnRlcmZhY2UgInNpZml2ZSxwd20wIi7CoCBCdXQKdGhlIGRyaXZlciB3
b3VsZCBvbmx5IG5lZWQgdGhlIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyBpZiB0aGUg
U29DCndvdW5kIHVwIG5lZWRpbmcgc29tZSBTb0Mtc3BlY2lmaWMgcXVpcmtzLgoKCkluIHRoZSBw
YXN0LCBzb21lIGZvbGtzIGhhdmUgaGFkIGEgcHJvYmxlbSB3aXRoIHRoYXQgaWRlYSwgc2luY2Ug
Zm9yCmNsb3NlZC1zb3VyY2UgSVAgYmxvY2tzLCBpdCdzIGJlZW4gZGlmZmljdWx0IHRvIGRldGVy
bWluZSB3aGF0IGNoYW5nZXMKd2VudCBpbnRvIGEgc3BlY2lmaWMgdmVyc2lvbiBvZiB0aGUgSVAg
YmxvY2suwqAgVGh1cyBmb2xrcyBnZW5lcmF0aW5nCmRhdGEgZm9yIGxhdGVyIFNvQ3MgdXN1YWxs
eSBzcGVjaWZ5IGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGFub3RoZXIsCm9sZGVyLCBTb0MgdGhh
dCBzZWVtcyB0byBoYXZlIHRoZSBkZXNpcmVkIGJlaGF2aW9yLsKgIEJ1dCBzaW5jZSB0aGlzCnBh
cnRpY3VsYXIgSVAgYmxvY2sgaGFzIG9wZW4tc291cmNlIFJUTCwgYW5kIGNvbnRhaW5zIGEgInNp
Zml2ZSxwd21YIgp2ZXJzaW9uIHN0cmluZyBpbiB0aGUgUlRMIGl0c2VsZjoKCgpodHRwczovL2dp
dGh1Yi5jb20vc2lmaXZlL3NpZml2ZS1ibG9ja3MvYmxvYi9tYXN0ZXIvc3JjL21haW4vc2NhbGEv
ZGV2aWNlcy9wd20vUFdNLnNjYWxhI0w3NAoKCi4uLiBpdCdzIHN0cmFpZ2h0Zm9yd2FyZCB0byBz
ZWUgd2hhdCBpbnRlcmZhY2UgdGhlIGhhcmR3YXJlIGV4cG9zZXMgdG8KdGhlIHNvZnR3YXJlIGZv
ciBhIGdpdmVuIGNvbXBhdGlibGUgc3RyaW5nLgoKCj4gSXMgdGhlcmUgYSBuZWVkIHRvIGhhdmUg
dHdvIGNvbXBhdGlibGUgc3RyaW5ncwo+IHRoYXQgcmVmZXIgdG8gdGhlIGV4YWN0IHNhbWUgaGFy
ZHdhcmU/CgoKVGhlcmUncyBubyBpbnRlbnRpb24gdGhhdCAic2lmaXZlLHB3bTAiIGFuZCAic2lm
aXZlLGZ1NTQwLWMwMDAtcHdtMCIKcmVmZXIgdG8gdGhlIHNhbWUgaGFyZHdhcmU7IGp1c3QgdGhl
IHNhbWUgc29mdHdhcmUgaW50ZXJmYWNlIGFuZApwcm9ncmFtbWluZyBtb2RlbC7CoCBFdmVuIG5v
dywgaXQncyB1c3VhbGx5IHByZXR0eSB1bmxpa2VseSB0aGF0IHR3bwpkaWZmZXJlbnQgU29DcyB0
aGF0IHJlZmVyIHRvIChzYXkpICJudmlkaWEsdGVncmEyMC1wd20iIGNvbnRhaW4gdGhlIHNhbWUK
aGFyZHdhcmUsIHNpbmNlIGRpZmZlcmVuY2VzIGluIHN5bnRoZXNpcywgcGxhY2UgYW5kIHJvdXRl
LCBFQ09zLCBhbmQKaW50ZWdyYXRpb24gY2hhbmdlIHRoZSBhY3R1YWwgcmVhbGl6YXRpb24gb2Yg
dGhlIGhhcmR3YXJlLsKgIFNvbWUgZm9sa3MKaW50ZXJwcmV0ZWQgdGhhdCBjb21wYXRpYmxlIHN0
cmluZyByZXVzZSBhcyBpbXBseWluZyB0aGUgc2FtZSAiaGFyZHdhcmUiCmlzIGluIHVzZSBvbiBi
b3RoIFNvQ3MsIGJ1dCB3ZSdyZSByZWFsbHkganVzdCBpZGVudGlmeWluZyBhIHNvZnR3YXJlCmlu
dGVyZmFjZS4KCgo+PiBBcyB0byB3aGV0aGVyIHRoZXJlIGNvdWxkIGV2ZXIgYmUgYSBGVTU0MC1D
MDAwIHBhcnQgd2l0aCBkaWZmZXJlbnQgSVAgYmxvY2sKPj4gdmVyc2lvbnMgb24gaXQ6IEZVNTQw
LUMwMDAgaXMgdWx0aW1hdGVseSBhIG1hcmtldGluZyBuYW1lLsKgIFdoaWxlCj4+IHRoZW9yZXRp
Y2FsbHkgd2Ugc2hvdWxkbid0IGhhdmUgYW5vdGhlciAiRlU1NDAtQzAwMCIgY2hpcCB3aXRoIGRp
ZmZlcmVudAo+PiBwZXJpcGhlcmFsIElQIGJsb2NrIHZlcnNpb25zIG9uIGl0LCBJIGRvbid0IHRo
aW5rIGFueSBlbmdpbmVlciBjYW4gZ3VhcmFudGVlCj4+IHRoYXQgaXQgd29uJ3QgaGFwcGVuLgo+
IEkgd291bGQgYXJndWUgdGhhdCBpZiBhdCBzb21lIHBvaW50IHRoZXJlIHdhcyBpbmRlZWQgYSBj
aGlwIHdpdGggdGhlCj4gc2FtZSBuYW1lIGJ1dCBhIGRpZmZlcmVudCBJUCBibG9jayB2ZXJzaW9u
IGluIGl0LCB3ZSBjYW4gZmlndXJlIG91dCB3aGF0Cj4gdG8gY2FsbCBpdC4gU3VyZSB0aGVyZSBh
cmUgbm8gZ3VhcmFudGVlcywgYnV0IGl0J3Mgc3RpbGwgZmFpcmx5IHVubGlrZWx5Cj4gaW4gbXkg
b3Bpbmlvbiwgc28gSSBwZXJzb25hbGx5IHdvdWxkbid0IHdvcnJ5IGFib3V0IHRoaXMgdXAgZnJv
bnQuCj4KPiBBbnl3YXksIEkgZG9uJ3QgZmVlbCBzdHJvbmdseSBlaXRoZXIgd2F5LCBJJ20ganVz
dCBwb2ludGluZyBvdXQgdGhhdAo+IHRoaXMgaXMgc29tZXdoYXQgdW51c3VhbC4gSWYgeW91IHdh
bnQgdG8ga2VlcCBpdCwgZmVlbCBmcmVlIHRvLgoKClRoYW5rcyBmb3IgdGhlIHJldmlldywgVGhp
ZXJyeSAtCgoKLSBQYXVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
