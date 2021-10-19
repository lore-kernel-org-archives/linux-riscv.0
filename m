Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B310CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 23:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAAA6113B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 23:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AAAA6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CgQ/X1yciacQj1lIo1NlUcrwNRmDUQIOXoZuZ2kgjM=; b=ps/ynZT1/VV4sm
	dMDto+4LkNmmd4ZKYbKsr3vpdOwKOK2U9PJCH6P0ZThFVCInIdINd0Gp6fE2ZM8xR6sc3A+Wq4xaU
	heDYkB4zJgoFIYM6y/SQmLBfMhWEzuudTp/WtCdIlHaCD6wF8Hb53q7Ag8gU64YB0oLO8rb4+WBHd
	extzHTPZgVqaodfiRm+4kmLDM6VbYY99SI7AghPZjyrvhRAwdTN4mWhhPOJCtVXj6m9yggIqWotnc
	brZI6ab6rHN/iw0n4o3uU6rkvBxnOqfUeRurmspIzpBJGNgjCMMU2pO70qZeKJ5g2oF8pKbbYXbsl
	l4NtVtGuTNthnUn0dRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcyMm-002vgT-By; Tue, 19 Oct 2021 23:17:56 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcyMk-002vfb-9O
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 23:17:55 +0000
Received: by mail-io1-xd2e.google.com with SMTP id h196so22403281iof.2
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ujcgvnZnOlRivFcgptVkKE7tCIGAc0bhX8mb5ERfb2o=;
 b=hCd0PId7Pi/1Okkjq4FuvkjI8SuPmUJ9vwUPy7izIePElsqGvzMjDDU4mpVJ1j60oS
 cwgy8vfCdvp8PN+b4VEoi6/k3Owd7D5h2CzGvK++EYa2xX371YovNlitWNtdfxQivX5c
 ekp+EdmBNVuadwMzKYhZLSA29pJJFblxkUrpYhLSlxDTbAJ9GmO9R9iVydEQUKe1uCZb
 KRDQi4ZbWVWMp8Xu2zDrOj+roYTrn7gdoXkCjIXDgwEhZYWv1ha/gnrCEVQSeyRZz/sN
 CQPBJupy0VV5YwOe5WAHzJpmaPef2POWb4JlM0fb1V55l6uYQhFWRhZW/vHvW8+ywloR
 pSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ujcgvnZnOlRivFcgptVkKE7tCIGAc0bhX8mb5ERfb2o=;
 b=OwwM/DBWJfpufl0vgWnWzaXAHvuOCR3A5QkhaKIOsSahNtlWRMIAEfbdztPl9zY47j
 czIAwak7IQqP3T5dPdkxbcDxVHJpQe2PsLAEThXHxJu//rShcFoeOSqAq2JK/cbx4qlg
 nzEkq9STnxy64qiAkAqKB7OlLNs3bLjlim7HjUQ7EMT0Gp070TC6fTjNA8avGXIj+WEL
 DTcR5WMvlLhEFdeeTRvF+35MLAL9XHeLSKEQyVT91Sp1p7IQYQVRGZwYg8ajvLiF+WVl
 IR05u2qzq+c7Hv8lVC5Ves5zuvWd8Epuh/Vr/8qu8yhfMQLfgl3CNZt1QVrOcmlx+iQH
 B4+g==
X-Gm-Message-State: AOAM531uzsehf1ibGtkePJo+IMc0OrJZH5ho2FVF2l5kceLiQpdC7UFe
 hTYrbIGCVYG/5hmmWsfaCP2wjVYe4jMDnxAt/0Q=
X-Google-Smtp-Source: ABdhPJzo0l0SGDsH8K9TH53sxx00B7fpowZN0SJiXLRlusVL3AsuTTtCMo59W07PmIf6LcW3LHYm1VlSEVbQZup0B6w=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr4066740jak.18.1634685472336; 
 Tue, 19 Oct 2021 16:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
 <YW74wK03ibOS3jVZ@kernel.org>
In-Reply-To: <YW74wK03ibOS3jVZ@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 09:17:26 +1000
Message-ID: <CAKmqyKP6AU-9tcYOp-ERvYFP7t6DMp4kbQgDmJxD6wb0WTUy+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-perf-users@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>, 
 Darren Hart <dvhart@infradead.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Atish Patra <atish.patra@wdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_161754_377445_5E4AE85D 
X-CRM114-Status: GOOD (  31.74  )
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

T24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMjo1NiBBTSBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8K
PGFybmFsZG8ubWVsb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRW0gRnJpLCBPY3QgMTUsIDIwMjEg
YXQgMTA6NTY6MzNBTSArMTAwMCwgQWxpc3RhaXIgRnJhbmNpcyBlc2NyZXZldToKPiA+IEZyb206
IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KPiA+Cj4gPiBDb252
ZXJ0IHRvb2xzL3BlcmYgdG8gb25seSB1c2UgYSA2NC1iaXQgdGltZV90LiBPbiA2NC1iaXQgYXJj
aGl0ZWN0dXJlcwo+ID4gdGhpcyBpc24ndCBhIGZ1bmN0aW9uYWwgY2hhbmdlLiBPbiAzMi1iaXQg
YXJjaGl0ZWN0dXJlcyB3ZSBub3cgb25seQo+ID4gcGVyZm9ybSA2NC1iaXQgdGltZV90IHN5c2Nh
bGxzIChfX05SX2Z1dGV4X3RpbWU2NCkgYW5kIHVzZSBhIHN0cnVjdAo+ID4gdGltZXNwZWM2NC4K
PiA+Cj4gPiBUaGlzIHdvbid0IHdvcmsgb24ga2VybmVscyBiZWZvcmUgNS4xLCBidXQgYXMgcGVy
ZiBpcyB0aWVkIHRvIHRoZSBrZXJuZWwKPiA+IHRoYXQncyBvay4KPgo+IE5vLCBwZXJmIGlzIG5v
dCB0aWVkIHRvIHRoZSBrZXJuZWwsIG9uZSBjYW4gdXNlIGEgbmV3IHBlcmYgdG9vbCBvbiBhbnkK
PiBwcmV2aW91cyBrZXJuZWwsIGFuZCBhbiBvbGQgcGVyZiB0b29sIHNob3VsZCB3b3JrIG9uIG5l
dyBrZXJuZWxzIGFzCj4gd2VsbC4KCisgQW5kcsOpLCBJIHdvbid0IGJlIGRvaW5nIHRoaXMgdGhl
IHdheSB5b3UgcmVxdWVzdGVkCgpPaywgc28gYmFjayB0byB0aGUgcHJldmlvdXMgdmVyc2lvbiB0
aGVuLiBJJ2xsIHNlbmQgdGhlIHBhdGNoZXMgc29vbi4KCkFsaXN0YWlyCgo+Cj4gLSBBcm5hbGRv
Cj4KPiA+IFRoaXMgYWxsb3dzIHVzIHRvIGJ1aWxkIHBlcmYgZm9yIDMyLWJpdCBhcmNoaXRlY3R1
cmVzIHdpdGggNjQtYml0IHRpbWVfdAo+ID4gbGlrZSBSSVNDLVYgMzItYml0Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4K
PiA+IC0tLQo+ID4gIHRvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaCB8IDI2ICsrKysrKysrKysrKysr
KysrKysrLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaCBi
L3Rvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaAo+ID4gaW5kZXggYjM4NTNhYWMzMDIxYy4uYjk2NjVk
NDNkMjk4OCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvYmVuY2gvZnV0ZXguaAo+ID4gKysr
IGIvdG9vbHMvcGVyZi9iZW5jaC9mdXRleC5oCj4gPiBAQCAtMTIsNiArMTIsNyBAQAo+ID4gICNp
bmNsdWRlIDxzeXMvc3lzY2FsbC5oPgo+ID4gICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KPiA+ICAj
aW5jbHVkZSA8bGludXgvZnV0ZXguaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvdGltZV90eXBlcy5o
Pgo+ID4KPiA+ICBzdHJ1Y3QgYmVuY2hfZnV0ZXhfcGFyYW1ldGVycyB7Cj4gPiAgICAgICBib29s
IHNpbGVudDsKPiA+IEBAIC0yNywxMiArMjgsMTQgQEAgc3RydWN0IGJlbmNoX2Z1dGV4X3BhcmFt
ZXRlcnMgewo+ID4gICAgICAgdW5zaWduZWQgaW50IG5yZXF1ZXVlOwo+ID4gIH07Cj4gPgo+ID4g
KyNkZWZpbmUgdGltZXNwZWM2NCBfX2tlcm5lbF90aW1lc3BlYwo+ID4gKwo+ID4gIC8qKgo+ID4g
ICAqIGZ1dGV4KCkgLSBTWVNfZnV0ZXggc3lzY2FsbCB3cmFwcGVyCj4gPiAgICogQHVhZGRyOiAg
IGFkZHJlc3Mgb2YgZmlyc3QgZnV0ZXgKPiA+ICAgKiBAb3A6ICAgICAgICAgICAgICBmdXRleCBv
cCBjb2RlCj4gPiAgICogQHZhbDogICAgIHR5cGljYWxseSBleHBlY3RlZCB2YWx1ZSBvZiB1YWRk
ciwgYnV0IHZhcmllcyBieSBvcAo+ID4gLSAqIEB0aW1lb3V0OiB0eXBpY2FsbHkgYW4gYWJzb2x1
dGUgc3RydWN0IHRpbWVzcGVjIChleGNlcHQgd2hlcmUgbm90ZWQKPiA+ICsgKiBAdGltZW91dDog
dHlwaWNhbGx5IGFuIGFic29sdXRlIHN0cnVjdCB0aW1lc3BlYzY0IChleGNlcHQgd2hlcmUgbm90
ZWQKPiA+ICAgKiAgICAgICAgICAgb3RoZXJ3aXNlKS4gT3ZlcmxvYWRlZCBieSBzb21lIG9wcwo+
ID4gICAqIEB1YWRkcjI6ICBhZGRyZXNzIG9mIHNlY29uZCBmdXRleCBmb3Igc29tZSBvcHMKPiA+
ICAgKiBAdmFsMzogICAgdmFyaWVzIGJ5IG9wCj4gPiBAQCAtNDcsMTUgKzUwLDI2IEBAIHN0cnVj
dCBiZW5jaF9mdXRleF9wYXJhbWV0ZXJzIHsKPiA+ICAgKiBUaGVzZSBhcmd1bWVudCBkZXNjcmlw
dGlvbnMgYXJlIHRoZSBkZWZhdWx0cyBmb3IgYWxsCj4gPiAgICogbGlrZS1uYW1lZCBhcmd1bWVu
dHMgaW4gdGhlIGZvbGxvd2luZyB3cmFwcGVycyBleGNlcHQgd2hlcmUgbm90ZWQgYmVsb3cuCj4g
PiAgICovCj4gPiAtI2RlZmluZSBmdXRleCh1YWRkciwgb3AsIHZhbCwgdGltZW91dCwgdWFkZHIy
LCB2YWwzLCBvcGZsYWdzKSBcCj4gPiAtICAgICBzeXNjYWxsKFNZU19mdXRleCwgdWFkZHIsIG9w
IHwgb3BmbGFncywgdmFsLCB0aW1lb3V0LCB1YWRkcjIsIHZhbDMpCj4gPiArLyoqCj4gPiArICog
V2Ugb25seSBzdXBwb3J0IDY0LWJpdCB0aW1lX3QgZm9yIHRoZSB0aW1lb3V0Lgo+ID4gKyAqIE9u
IDY0LWJpdCBhcmNoaXRlY3R1cmVzIHdlIGNhbiB1c2UgX19OUl9mdXRleAo+ID4gKyAqIE9uIDMy
LWJpdCBhcmNoaXRlY3R1cmVzIHdlIHVzZSBfX05SX2Z1dGV4X3RpbWU2NC4gVGhpcyBvbmx5IHdv
cmtzIG9uIGtlcm5lbAo+ID4gKyAqIHZlcnNpb25zIDUuMSsuCj4gPiArICovCj4gPiArI2lmIF9f
QklUU19QRVJfTE9ORyA9PSA2NAo+ID4gKyMgZGVmaW5lIGZ1dGV4KHVhZGRyLCBvcCwgdmFsLCB0
aW1lb3V0LCB1YWRkcjIsIHZhbDMsIG9wZmxhZ3MpIFwKPiA+ICsgICAgIHN5c2NhbGwoX19OUl9m
dXRleCwgdWFkZHIsIG9wIHwgb3BmbGFncywgdmFsLCB0aW1lb3V0LCB1YWRkcjIsIHZhbDMpCj4g
PiArI2Vsc2UKPiA+ICsjIGRlZmluZSBmdXRleCh1YWRkciwgb3AsIHZhbCwgdGltZW91dCwgdWFk
ZHIyLCB2YWwzLCBvcGZsYWdzKSBcCj4gPiArICAgICBzeXNjYWxsKF9fTlJfZnV0ZXhfdGltZTY0
LCB1YWRkciwgb3AgfCBvcGZsYWdzLCB2YWwsIHRpbWVvdXQsIHVhZGRyMiwgdmFsMykKPiA+ICsj
ZW5kaWYKPiA+Cj4gPiAgLyoqCj4gPiAgICogZnV0ZXhfd2FpdCgpIC0gYmxvY2sgb24gdWFkZHIg
d2l0aCBvcHRpb25hbCB0aW1lb3V0Cj4gPiAgICogQHRpbWVvdXQ6IHJlbGF0aXZlIHRpbWVvdXQK
PiA+ICAgKi8KPiA+ICBzdGF0aWMgaW5saW5lIGludAo+ID4gLWZ1dGV4X3dhaXQodV9pbnQzMl90
ICp1YWRkciwgdV9pbnQzMl90IHZhbCwgc3RydWN0IHRpbWVzcGVjICp0aW1lb3V0LCBpbnQgb3Bm
bGFncykKPiA+ICtmdXRleF93YWl0KHVfaW50MzJfdCAqdWFkZHIsIHVfaW50MzJfdCB2YWwsIHN0
cnVjdCB0aW1lc3BlYzY0ICp0aW1lb3V0LCBpbnQgb3BmbGFncykKPiA+ICB7Cj4gPiAgICAgICBy
ZXR1cm4gZnV0ZXgodWFkZHIsIEZVVEVYX1dBSVQsIHZhbCwgdGltZW91dCwgTlVMTCwgMCwgb3Bm
bGFncyk7Cj4gPiAgfQo+ID4gQEAgLTc0LDcgKzg4LDcgQEAgZnV0ZXhfd2FrZSh1X2ludDMyX3Qg
KnVhZGRyLCBpbnQgbnJfd2FrZSwgaW50IG9wZmxhZ3MpCj4gPiAgICogZnV0ZXhfbG9ja19waSgp
IC0gYmxvY2sgb24gdWFkZHIgYXMgYSBQSSBtdXRleAo+ID4gICAqLwo+ID4gIHN0YXRpYyBpbmxp
bmUgaW50Cj4gPiAtZnV0ZXhfbG9ja19waSh1X2ludDMyX3QgKnVhZGRyLCBzdHJ1Y3QgdGltZXNw
ZWMgKnRpbWVvdXQsIGludCBvcGZsYWdzKQo+ID4gK2Z1dGV4X2xvY2tfcGkodV9pbnQzMl90ICp1
YWRkciwgc3RydWN0IHRpbWVzcGVjNjQgKnRpbWVvdXQsIGludCBvcGZsYWdzKQo+ID4gIHsKPiA+
ICAgICAgIHJldHVybiBmdXRleCh1YWRkciwgRlVURVhfTE9DS19QSSwgMCwgdGltZW91dCwgTlVM
TCwgMCwgb3BmbGFncyk7Cj4gPiAgfQo+ID4gQEAgLTExMSw3ICsxMjUsNyBAQCBmdXRleF9jbXBf
cmVxdWV1ZSh1X2ludDMyX3QgKnVhZGRyLCB1X2ludDMyX3QgdmFsLCB1X2ludDMyX3QgKnVhZGRy
MiwgaW50IG5yX3dhawo+ID4gICAqLwo+ID4gIHN0YXRpYyBpbmxpbmUgaW50Cj4gPiAgZnV0ZXhf
d2FpdF9yZXF1ZXVlX3BpKHVfaW50MzJfdCAqdWFkZHIsIHVfaW50MzJfdCB2YWwsIHVfaW50MzJf
dCAqdWFkZHIyLAo+ID4gLSAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdGltZXNwZWMgKnRpbWVv
dXQsIGludCBvcGZsYWdzKQo+ID4gKyAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdGltZXNwZWM2
NCAqdGltZW91dCwgaW50IG9wZmxhZ3MpCj4gPiAgewo+ID4gICAgICAgcmV0dXJuIGZ1dGV4KHVh
ZGRyLCBGVVRFWF9XQUlUX1JFUVVFVUVfUEksIHZhbCwgdGltZW91dCwgdWFkZHIyLCAwLAo+ID4g
ICAgICAgICAgICAgICAgICAgIG9wZmxhZ3MpOwo+ID4gLS0KPiA+IDIuMzEuMQo+Cj4gLS0KPgo+
IC0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
