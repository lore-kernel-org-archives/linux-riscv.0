Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D9AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 15:19:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB70610E9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 15:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AB70610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NQl4Xtcg6ZYahfck1VmO4KBnLABVxZ1AH45WJQgyHk=; b=E2+4hSFCaRwcuV
	bsi7tWQzq6OyzwjP4kFKpeZYl87NpuumfaEksFugsnRBhXR5K/D70QCiETfHwKjEMskiPX/CzGOMg
	38gwo4n0YAWofy5By0E/ltJsfCmbv1n/Nv8+KHBUX/W34gL4oe55K1nlY3w4yy1ryHBEjGBu6n/60
	mGL4HWYyAFmuQAk+gPcKOwPU9d0VtYQ/ql6s1alxG05vgxQ4lKjM8IumFPnTh6ukfVgh/10zY/7Q9
	pPniH79AJY3yDqdis4Dyay5WzV8xex9wAAm7NUqYjQ0fnBsHIirHLnrpFmHb67hE/oqelUY7Akd4B
	WDktDXlcMRD5i1jCU/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkSuW-002Xx8-3O; Tue, 09 Nov 2021 15:19:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkSuI-002XtL-Th
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 15:19:33 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DAF843F1B9
 for <linux-riscv@lists.infradead.org>; Tue,  9 Nov 2021 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636471164;
 bh=y9pgiCV7zyEmy4K4qEsg0V4Uk9a686jGv7LQXoBRsjk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=e5NFzPdlQ1kmfmKyKqcpWYA5CbDkw1wCPaWaCWAcxBegwpz/Qml33lXkK6MRjsJ92
 Jy+fkcdOW4s2CdpDFapS2TD4PcSMfPyMESs3GyqxIwSk/tQnWOzlYxl5SPTUCSW2mh
 3PO/KMyuInYFqcrJ1UMm9TU1QEXg0O7kmPlhx/a94fQFDkPDzHvxJL9QEzqf0DDEpG
 nk19pAWTwJxydVGK5TAuAW6g9ONUw2cLSrs7gX6+vOgrnDiAgWdttL70VgvKgFvTHp
 G8vYqkPfIRaGrzZR5Bmf1PxGtPJa6BqYvvVJoYdydHStj0X3zTTyzKx70LxDuh62dH
 8esQqaJ+vdqsw==
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so4885034wro.19
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 07:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y9pgiCV7zyEmy4K4qEsg0V4Uk9a686jGv7LQXoBRsjk=;
 b=Za5qjlcJfEI4r62tOEB7kFrBRl/2vb/kAd/GiBsrw2S3DeA5k2jrzQGyEutgY3Xywv
 MpJMMZucl5/Kk0K06ABm26ihGmoSgUNgjgWqZDsSYM5OlObSLCO3KLLc9HnqHblzztSS
 lIvXt1zZ2+DmrjIatLzxkXVIYF6qxZXDLO+g+0ueNsKx2+uoGUKHFr8v3cAIX90TCmvN
 UJ4ziAyvzJfyQa/mMKqSbDNy+bYk6QBmlXi6E0yhZUKNQwjJ9hY5URlJFSN5ZQgvTj/w
 VAPz3PPomIVWFovr/dYplOAHyg0O4KrJMeu5kKfFxbh2zTQcAvlBChaxsbP6ZOJRuoWM
 l2rA==
X-Gm-Message-State: AOAM53188XKnZmIakLBY9lRwCFNqy3kH08cK8GBs+RPcPxXFXewddiZQ
 R19hHrzKv5LVvSOMSEIwMGP/8aRJ+OfNuQ3ukoiX6LOwH8UgMaUnamLN7GDNP53dgBDChwIqU4o
 gpFhltTwUd36BnmSbK2KqPUH4nkTOgFqOlztd+4iQo9zDNg==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr10656250wrq.109.1636471164317; 
 Tue, 09 Nov 2021 07:19:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCNJeD7i4a5vx04KG8bWS/I2OrJ+x2Tsf+9WrdJJqRb81MbzZ2SSzENTJZ7Z8eoKS6RtsSOw==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr10656188wrq.109.1636471163864; 
 Tue, 09 Nov 2021 07:19:23 -0800 (PST)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id d15sm19453600wri.50.2021.11.09.07.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 07:19:23 -0800 (PST)
Message-ID: <b3cc6176-60b0-119c-ba1d-1fdc015bd081@canonical.com>
Date: Tue, 9 Nov 2021 16:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v7 1/1] RISC-V: Use SBI SRST extension when available
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <Anup.Patel@wdc.com>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Philipp Tomsich <ptomsich@ventanamicro.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Kumar Sankaran <ksankaran@ventanamicro.com>,
 Mark Himelstein <markhimelstein@riscv.org>,
 Atish Patra <atishp@atishpatra.org>
References: <mhng-6c25dda6-4c85-447c-ad9c-7641f2858b10@palmerdabbelt-glaptop>
 <mhng-40d64bc7-5a95-4a16-af45-1d7fd7c6167e@palmerdabbelt-glaptop>
 <CAOnJCUJpLSWJ1VsJuUwfrG8vn0+hCkg2RgdOhNLTEq8C7Mo88w@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAOnJCUJpLSWJ1VsJuUwfrG8vn0+hCkg2RgdOhNLTEq8C7Mo88w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_071931_181140_300E4CBB 
X-CRM114-Status: GOOD (  45.84  )
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

T24gNy8yOS8yMSAwODoxMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMjgsIDIw
MjEgYXQgOTozMCBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToK
Pj4KPj4gT24gU3VuLCAxMSBKdWwgMjAyMSAxMTo1OTozMyBQRFQgKC0wNzAwKSwgUGFsbWVyIERh
YmJlbHQgd3JvdGU6Cj4+PiBPbiBGcmksIDA5IEp1bCAyMDIxIDIyOjAxOjAyIFBEVCAoLTA3MDAp
LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiDvu79PbiAwOC8wNy8yMSwgOToyMiBB
TSwgIkFudXAgUGF0ZWwiIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPj4+Pgo+Pj4+ICAg
ICAgT24gV2VkLCBKdWwgNywgMjAyMSBhdCAxOjU3IEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJk
YWJiZWx0QGdvb2dsZS5jb20+IHdyb3RlOgo+Pj4+ICAgICAgPgo+Pj4+ICAgICAgPiBPbiBNb24s
IDIxIEp1biAyMDIxIDIxOjQ2OjQ2IFBEVCAoLTA3MDApLCBhbnVwQGJyYWluZmF1bHQub3JnIHdy
b3RlOgo+Pj4+ICAgICAgPiA+IEhpIFBhbG1lciwKPj4+PiAgICAgID4gPgo+Pj4+ICAgICAgPiA+
IE9uIFdlZCwgSnVuIDksIDIwMjEgYXQgNTo0MyBQTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQHdk
Yy5jb20+IHdyb3RlOgo+Pj4+ICAgICAgPiA+Pgo+Pj4+ICAgICAgPiA+PiBUaGUgU0JJIFNSU1Qg
ZXh0ZW5zaW9uIHByb3ZpZGVzIGEgc3RhbmRhcmQgd2F5IHRvIHBvd2Vyb2ZmIGFuZAo+Pj4+ICAg
ICAgPiA+PiByZWJvb3QgdGhlIHN5c3RlbSBpcnJlc3BlY3RpdmUgdG8gd2hldGhlciBMaW51eCBS
SVNDLVYgUy1tb2RlCj4+Pj4gICAgICA+ID4+IGlzIHJ1bm5pbmcgbmF0aXZlbHkgKEhTLW1vZGUp
IG9yIGluc2lkZSBHdWVzdC9WTSAoVlMtbW9kZSkuCj4+Pj4gICAgICA+ID4+Cj4+Pj4gICAgICA+
ID4+IFRoZSBTQkkgU1JTVCBleHRlbnNpb24gaXMgYXZhaWxhYmxlIGluIHRoZSBTQkkgdjAuMyBz
cGVjaWZpY2F0aW9uLgo+Pj4+ICAgICAgPiA+PiAoUmVmZXIsIGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi9yaXNjdi1zYmktZG9jL3JlbGVhc2VzL3RhZy92MC4zLjAtcmMxKQo+Pj4+ICAgICAgPiA+
Cj4+Pj4gICAgICA+ID4gQ2FuIHlvdSBwbGVhc2UgY29uc2lkZXIgdGhpcyBwYXRjaCBmb3IgTGlu
dXgtNS4xNC1yYzEgPwo+Pj4+ICAgICAgPiA+Cj4+Pj4gICAgICA+ID4gVGhlIFNCSSB2MC4zIHNw
ZWMgaXMgYWxyZWFkeSBmcm96ZW4gYW5kIHRoaXMgcGF0Y2ggaGFzIGJlZW4KPj4+PiAgICAgID4g
PiBmbG9hdGluZyBvbiBMS01MIGZvciBxdWl0ZSBhIGZldyBtb250aHMgbm93Lgo+Pj4+ICAgICAg
Pgo+Pj4+ICAgICAgPiBJIGRpZG4ndCByZWFsaXplIHRoYXQgU0JJLTAuMyBoYWQgYmVlbiBmcm96
ZWQuICBUaGF0IGxpbmsgaXMgdG8gYSBSQywKPj4+PiAgICAgID4gdGhlIGNvb3Jlc3BvbmRpbmcg
djAuMy4wIHRhZyBpc24ndCBpbiB0aGF0IHJlcG8uICBDYW4geW91IGdpdmUgbWUgYQo+Pj4+ICAg
ICAgPiBwb2ludGVyIHRvIHRoZSBmcm96ZW4gc3BlYz8KPj4+Pgo+Pj4+ICAgICAgSGVyZSdzIHRo
ZSBsaW5rIHRvIFNCSSB2MC4zLjAgdGFnOgo+Pj4+ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvdGFnL3YwLjMuMAo+Pj4+Cj4+Pj4gICAgICBXZSB0
cmVhdCBSQyB0YWdzIGFzIGZyb3plbiBpbiBTQkkgc3BlYyBiZWNhdXNlIG5vIGZ1bmN0aW9uYWwK
Pj4+PiAgICAgIGNoYW5nZXMgYXJlIGRvbmUgaW4gU0JJIHNwZWMgYWZ0ZXIgaXQgaXMgdGFnZ2Vk
IGFzIFJDLiBXZSBvbmx5Cj4+Pj4gICAgICBkbyB0eXBvIGZpeGVzIGFuZCBjbGFyaWZpY2F0aW9u
cyBvbiBTQkkgc3BlYyBSQyByZWxlYXNlLgo+Pj4KPj4+IFRyZWF0aW5nIHRoZSAwLjMuMC1yYzEg
YXMgZnJvemVuIGFzIHNvb24gYXMgaXQncyByZWxlYXNlZCBpcyBhCj4+PiB0ZXJyaWZ5aW5nIHBv
bGljeTogc29tZSBvZiB0aGUgZml4ZXMgSSBzZW50IGluIGFmdGVyIEkgc2F3IHJjMSByZWxlYXNl
ZAo+Pj4gY2hhbmdlIHRoZSBhY3R1YWwgbWVhbmluZyBvZiB0aGUgdGV4dCwgZXZlbiBpZiB0aGV5
IHdlcmUgbWVhbnQgdG8gY2hhbmdlCj4+PiB0aGVtIHRvIHdoYXQgSSB0aG91Z2h0IHRoZSBpbnRl
bmRlZCBtZWFuaW5nIHdhcyBzdXBwb3NlZCB0byBiZS4gIFRoYXQKPj4+IG1lYW5zIHRoZSBhY3R1
YWwgdGV4dCBvZiAwLjMuMC1yYzEgYW5kIDAuMy4wIGNvbmZsaWN0IHdpdGggZWFjaCBvdGhlci4K
Pj4+IEdpdmVuIHRoYXQgZnJvemVuIGNvbWVzIHdpdGggYSBndWFybnRlZSBvZiBiYWNrd2FyZHMg
Y29tcGF0aWJpbGl0eSwgZG9lcwo+Pj4gdGhhdCBtZWFuIHRoYXQgdGhlIGJlaGF2aW9yIGFsbG93
ZWQgYnkgMC4zLjAtcmMxIGlzIGNvbXBsaWFudCB3aXRoIHRoZQo+Pj4gU0JJLCBldmVuIGlmIGl0
IHdhcyBsaWtlbHkganVzdCBhbGxvd2VkIGJ5IGEgd29yZGluZyBtaXN0YWtlPwo+Pj4KPj4+IElm
IHlvdSdyZSBnb2luZyB0byBmcmVlemUgdGhpbmdzIGF0IHJjMSB0aGVuIHlvdSByZWFsbHkgbmVl
ZCB0byBiZSBxdWl0ZQo+Pj4gZXhwbGljaXQgYWJvdXQgdGhhdCwgYXMgZ2VuZXJhbGx5IHRoZSBw
b2ludCBvZiBSQ3MgaXMgdG8gZWxpY2l0Cj4+PiByZXZpZXcvdGVzdGluZy4gIExvb2tzIGxpa2Ug
SSB3YXMgdGhlIG9ubHkgcGVyc29uIHRvIGhhdmUgcHJvdmlkZWQgYW55Cj4+PiByZXZpZXcsIHNv
IEkgZ3Vlc3MgSSB3YXMgdGhlIG9ubHkgb25lIHdobyBhc3N1bWVkICJXZSBkb24ndCBleHBlY3Qg
YW55Cj4+PiBzaWduaWZpY2FudCBmdW5jdGlvbmFsIGNoYW5nZXMuIFdlIHdpbGwgd2FpdCBmb3Ig
YW55IGZ1cnRoZXIgZmVlZGJhY2sKPj4+IGFuZCByZWxlYXNlIHRoZSBvZmZpY2lhbCB2MC4zIGlu
IGEgbW9udGggb3Igc28uIiBhY3R1YWxseSBtZWFudCAidGhpcyBpcwo+Pj4gZnJvemVuIi4KPj4+
Cj4+Pj4gQ2FuIHlvdSB0YWtlIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTUuMTQgPz8KPj4+Cj4+PiBO
bywgc29ycnksIGl0J3Mgd2F5IHRvbyBsYXRlIGZvciB0aGF0LiAgUGxlYXNlIGJlIHNwZWNpZmlj
IGFib3V0IHdoZW4KPj4+IHlvdSBmcmVlemUgc3BlY2lmaWNhdGlvbnMgaW4gdGhlIGZ1dHVyZSwg
c28gd2UgY2FuIGFsbCBzdGF5IG9uIHRoZSBzYW1lCj4+PiBwYWdlLgo+Pgo+PiBJIHdlbnQgYW5k
IHRhbGtlZCB0byBLcnN0ZSwgYW5kIGhlIHNheXMgdGhhdCB0aGVyZSdzIGEgd2hvbGUgcHJvY2Vz
cyBmb3IKPj4gZnJlZXppbmcgZXh0ZW5zaW9ucyB0aGF0IHRoaXMgaGFzbid0IGdvbmUgdGhyb3Vn
aC4gIFRoZXkgZG9uJ3QgaGF2ZQo+PiBhbnl0aGluZyB3cml0dGVuIGRvd24gdGhhdCBJIGNhbiBw
b2ludCB0bywgYnV0IGNhbiB5b3UgZ3V5cyBwbGVhc2UganVzdAo+PiBnZXQgb24gdGhlIHNhbWUg
cGFnZSBhYm91dCB0aGlzPyAgSXQgc2VlbXMgbGlrZSBldmVyeSB0aW1lIEkgdGFsayB0bwo+IAo+
IEFic29sdXRlbHkuIFRoZSBmcmVlemluZyBleHRlbnNpb25zIHByb2Nlc3MgaXMgZG9jdW1lbnRl
ZCByaWdodCBub3dbMV0KPiBidXQgdGhhdCBpcyBvbmx5IG1lYW50Cj4gZm9yIElTQS9oYXJkd2Fy
ZS9wbGF0Zm9ybSBzcGVjaWZpY2F0aW9ucy4gVGhlcmUgaXMgbm8gcHJvY2VzcyBkZWZpbmVkCj4g
Zm9yIGEgU0JJIHNwZWNpZmljYXRpb24gd2hpY2ggaXMgcHVyZWx5Cj4gYSBzb2Z0d2FyZSBzcGVj
aWZpY2F0aW9uIGJlY2F1c2UgU0JJIHNwZWNpZmljYXRpb24gcmVsZWFzZQo+IHByb2Nlc3Nlcyh2
MC4xIGFuZCB2MC4yKSBwcmVkYXRlIHRoZXNlIGRvY3VtZW50ZWQgcHJvY2Vzc2VzLgo+IFRoZSBT
Qkkgc3BlY2lmaWNhdGlvbiBpcyBvd25lZCBieSB0aGUgUGxhdGZvcm0gSFNDIHdoaWNoIGZhbGxz
IHVuZGVyCj4gdGhlIHB1cnZpZXcgb2Ygc29mdHdhcmUgSEMuCj4gWW91IGNhbiBzZWUgYSBkZXRh
aWxlZCBjaGFydCBvZiB0aGUgUlZJIG9yZ2FuaXphdGlvbiBhdCBbMl0uIEFsbCB0aGUKPiBhc3Bl
Y3RzIG9mIFNCSSBzcGVjaWZpY2F0aW9uIGFyZSBkaXNjdXNzZWQKPiBpbiBwbGF0Zm9ybSBtZWV0
aW5nc1szXSBhbmQgZnJvemVuIG9ubHkgYWZ0ZXIgcHVibGljIHJldmlld1s0XSBhbmQKPiBhcHBy
b3ZhbCBmcm9tIHRoZSBwbGF0Zm9ybSB3b3JraW5nIGdyb3VwCj4gYW5kIHRoZSBzb2Z0d2FyZSBI
Qy4gVGhlIG9mZmljaWFsIFNCSSBzcGVjaWZpY2F0aW9uKHYwLjMpIHdpbGwgYWxzbyBiZQo+IGF2
YWlsYWJsZSBhbG9uZyB3aXRoIGFsbCBvdGhlciBSSVNDLVYgc3BlY2lmaWNhdGlvbnMKPiBvbmNl
IHRoZXkgZmlndXJlIG91dCBob3cgdG8gc3RydWN0dXJlIG5vbi1JU0Egc3BlY2lmaWNhdGlvbnMu
Cj4gCj4gSSBoYXZlIGNjJ2QgS3VtYXIgKGNoYWlyIG9mIHRoZSBQbGF0Zm9ybSBIU0MpIGFuZCBQ
aGlsaXAgKGNoYWlyIG9mIHRoZQo+IHNvZnR3YXJlIEhDKSBpbiBjYXNlIHRoZXkgd2FudCB0byBh
ZGQgYW55dGhpbmcuCj4gSSB3YXMgbm90IGF3YXJlIG9mIHRoZSBmYWN0IHRoYXQgS3JzdGUvQW5k
cmV3IGFyZSBub3QgYXdhcmUgb2YgdGhlCj4gcHJvZ3Jlc3Mgb2YgdGhlIFNCSSBzcGVjaWZpY2F0
aW9uLgo+IEkgd2lsbCByYWlzZSB0aGlzIHRvcGljIGR1cmluZyB0aGUgbmV4dCBtZWV0aW5nIGFu
ZCBtYWtlIHN1cmUgdGhleSBhcmUKPiBpbiB0aGUgbG9vcCBhcyB3ZWxsLgo+IAo+PiBzb21lb25l
IGZyb20gdGhlIFJJU0MtViBmb3VuZGF0aW9uIEkgZ2V0IGEgY29uZmxpY3RpbmcgZGVzY3JpcHRp
b24gb2YKPj4gd2hhdCdzIGdvaW5nIG9uLCBhbmQgSSdtIGVudGlyZWx5IG91dCBvZiBwYXRpZW5j
ZSB3aGVuIGl0IGNvbWVzIHRvCj4+IGdldHRpbmcgYmxhbWVkIGZvciBhbGwgdGhlIGNoYW9zIG92
ZXIgdGhlcmUuCj4+Cj4gSSBhZ3JlZSB0aGUgUlZJIHByb2Nlc3MgaGFzIG5vdCBiZWVuIHZlcnkg
Y2xlYXIgaW4gdGhlIHBhc3QuIEhvd2V2ZXIsCj4gdGhhdCBoYXMgY2hhbmdlZCBhIGxvdCBpbiBy
ZWNlbnQgdGltZXMgdGhhbmtzIHRvIE1hcmsgYW5kCj4gb3RoZXIgd29ya2luZyBncm91cCBjaGFp
cnMuIEkgZG9uJ3QgdGhpbmsgYW55Ym9keSBpcyBibGFtaW5nIHlvdSBmb3IKPiB0aGUgZGVsYXkg
aW4gcmF0aWZpY2F0aW9uIG9mIHRoZSBSVkkgc3BlY2lmaWNhdGlvbnMuCj4gVGhlcmUgaXMgYSBj
bGVhciBwYXRoIGZvciBhbGwgdGhlIHNwZWNpZmljYXRpb25zIHRvIGJlIHJhdGlmaWVkIGUuZy4K
PiB0aGUgQUlBIGFuZCBIIGV4dGVuc2lvbnMgYXJlIHBsYW5uZWQgdG8gYmUgZnJvemVuIGJ5IHRo
ZSBlbmQgb2YgdGhpcwo+IHllYXIuCj4gTGV0IG1lIGtub3cgaWYgeW91IHdhbnQgdG8gc2VlIHRo
ZSB0aW1lbGluZSBvZiBlYWNoIHNwZWNpZmljYXRpb24gYW5kCj4gSSBjYW4gcG9pbnQgeW91IHRv
IHRoZSBjb3JyZWN0IHNoZWV0Lgo+IAo+IFsxXSBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9wcmVz
ZW50YXRpb24vZC8xblE1dUZiMzlLQTZndlVpNVNSZVdmSVFTaVJON2hwNno3WlBmY3RFNG1Lay9l
ZGl0I3NsaWRlPWlkLmdhMGE5OTRjM2M4XzBfNgo+IFsyXSBodHRwczovL2RvY3MuZ29vZ2xlLmNv
bS9wcmVzZW50YXRpb24vZC8xZUVWdXU2bFJaZDlpaURuWlFTWk1FN1E3c3Z0VEczcEdJS0hQbVo3
OUI4RS9lZGl0I3NsaWRlPWlkLmdhMjc1YTUwNGRmXzBfOQo+IFszXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtcGxhdGZvcm0tc3BlY3Mvd2lraQo+IFs0XSBodHRwczovL2xpc3RzLnJp
c2N2Lm9yZy9nL3RlY2gtdW5peHBsYXRmb3Jtc3BlYy9tZXNzYWdlLzEwNDIKCmh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvdGFnL3YwLjMuMS1y
YzEKaGFzOgoKIlRoaXMgdGFnIHRoZSByZWxlYXNlIGNhbmRpZGF0ZSBvZiB2ZXJzaW9uIDAuMy4x
IG9mIHRoZSBSSVNDLVYgU0JJIApzcGVjaWZpY2F0aW9uLiBJdCBkb2Vzbid0IGhhdmUgYW55IHNp
Z25pZmljYW50IGNoYW5nZXMgb3RoZXIgdGhhbiB0eXBvcy4KQSBuZXcgcmVsZWFzZSBpcyBjcmVh
dGVkIHRvIGFkYXB0IHRoZSByYXRpZmljYXRpb24gcHJvY2VzcyBmb3Igbm9uLUlTQSAKc3BlY2lm
aWNhdGlvbnMgZGVmaW5lZCBieSBSVkkgcmVjZW50bHkuIgoKSGFzIHRoaXMgcGF0Y2ggdG8gd2Fp
dCB1bnRpbCByZWxlYXNlIDAuMy4xIG9mIHRoZSBTQkkgc3BlY2lmaWNhdGlvbiBpcyAKcmF0aWZp
ZWQ/CldoYXQgaXMgdGhlIHRpbWVsaW5lPwoKQ291bGQgeW91LCBwbGVhc2UsIHByb3ZpZGUgYSBs
aW5rIHRoZSB0aGUgbm9uLUlTQSByYXRpZmljYXRpb24gcHJvY2VzcyAKZGVzY3JpcHRpb24uCgpC
ZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
