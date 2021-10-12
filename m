Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666FFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 00:58:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E6160C49
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 00:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E6160C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5o9+lH9FWC7HR2GDlwLBNNAsfJExcK7XHtkDURj3VY=; b=ahs2d7PiwUdeUd
	9lyGQ9064KZ4MEJkYApjU3YSVojAF9TXYRKbxcgLSawRd5RHF9gNIMqGBkXh0WZ6JSb1ap8X4cPV9
	+1vX6OHoSgwIkb08Ed1qaLwwG51vSFjdUCzB0lqiUXqXHvHAyv+wHqYs7Q1M4de6d49rgEJZeg/PZ
	E7F3WhRI7GlT2Y+9/VEmZNOnPnH4uYFgKlA9YgA2Fx3B6+W1H1+Ra1lr560Ywh0LeSUys9WA9Eb3S
	ev3CjrWD7QK29WjdmTMkhnXGRNlw/0PDgtbKRFlvNttYg4VPqB3AnzZTJucd6I4KYhNOrehBJUv4K
	/5ROgFKi26uBJ3NdVvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma66r-00B8JY-3E; Tue, 12 Oct 2021 00:57:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma66a-00B8Bi-Tv
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 00:57:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v17so61396913wrv.9
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 17:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HrgUn3DKWZ7MmEFAtfrRtljQYBgKoJersDhT1IC80/A=;
 b=UEKN7SJXViOLIpLUXMBH07yr+kRk8wq5gTyFGoRE9r/FfKxtpz90BaWEbcHVPJTR+Y
 w3CJ9ax6XuCP17QkvRiHebrKOWNpsE6iP52Rhpg0RR3WkVxEg1M0jg15XvxKDUHcIbur
 e8keyInu70XI7fBsNIbfwYeDeCAXSUjjdc+x1oBfqO9tGNVoundVn061eSZ8eXdX2CNH
 NVLTH6b0Q9FknSZwTJkUnMY9RS6nobK5nSvBdOMnEQxtLWZl3N30Aplx64MB5xu5Yllt
 ExVR+pq5IzSAyx8UrIKM6vymfK6gKs5RMfClfn0HIQFJqfpHva/9F/pW/k1MGliyTYm7
 F3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HrgUn3DKWZ7MmEFAtfrRtljQYBgKoJersDhT1IC80/A=;
 b=260moD7z+s7TkCiITV/PIy7SDzTeLDeYt+oSoSdpRQO76+6rnoGu6J6VEaFEjZvHCF
 hGRUROR5+eHHSS7CqXnsq5GYyIy2SRtrZstNVQV9euDwaaqk6/++lmDev8oqLEwQwqCN
 uk27IZ7Ku/X9UGDGImhtk7i/6zbFFZtUalWgwkKiBBN65jn1DOApQldwuVqqOTbHqbA0
 BcmaYHIMvk4Rw47/60KfbzsIc9KB2qZc2qa5S1iDtHTNh8+8AWNMDTyY5J9KGc4KWICT
 gH9Z79khma43xSffr4PuJnid/g8FHBuM4Po3SHri/t8W8ur5kC5P1DszZ28aXYaQgjWF
 63iQ==
X-Gm-Message-State: AOAM532kO6d0qXNBf8Y++l37oMlTZxhdFm0sQr/E95Qg9wmdsOLBmesD
 UjaJJ4BLRRt9exXMSRxl4piQqe8I0Ft98VbNIDag5Q==
X-Google-Smtp-Source: ABdhPJy5yhEg/btymR3HWU0OoY+qjByL1JaTFyQZv+6vFuoAim6fy3oSWALXbcuYsLKqzjndh2ylpK3x0o1HO6ZuqKE=
X-Received: by 2002:a7b:c742:: with SMTP id w2mr2508708wmk.61.1634000239044;
 Mon, 11 Oct 2021 17:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211011081820.1135261-1-anup.patel@wdc.com>
 <20211011081820.1135261-2-anup.patel@wdc.com>
 <4300884.9bbH7Ay9ha@diego>
In-Reply-To: <4300884.9bbH7Ay9ha@diego>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Oct 2021 06:27:07 +0530
Message-ID: <CAAhSdy1L+FDipvx=FYEX91J0VK092i=p7uGVZGyeZTBtzPEADA@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] RISC-V: Enable CPU_IDLE drivers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_175721_026713_69DC4434 
X-CRM114-Status: GOOD (  23.67  )
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

T24gVHVlLCBPY3QgMTIsIDIwMjEgYXQgNDo0NiBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBBbSBNb250YWcsIDExLiBPa3RvYmVyIDIw
MjEsIDEwOjE4OjEzIENFU1Qgc2NocmllYiBBbnVwIFBhdGVsOgo+ID4gV2UgZm9yY2Ugc2VsZWN0
IENQVV9QTSBhbmQgcHJvdmlkZSBhc20vY3B1aWRsZS5oIHNvIHRoYXQgd2UgY2FuCj4gPiB1c2Ug
Q1BVIElETEUgZHJpdmVycyBmb3IgTGludXggUklTQy1WIGtlcm5lbC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQHdkYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCj4gPiAgYXJjaC9yaXNj
di9jb25maWdzL2RlZmNvbmZpZyAgICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvY29uZmlncy9y
djMyX2RlZmNvbmZpZyB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWlkbGUu
aCAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMgICAgICAgfCAgMyArKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jcHVpZGxlLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29u
ZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCA4ZGUyYWZiNDYwZjcuLmQwMmYxZjVh
MjQzMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9y
aXNjdi9LY29uZmlnCj4gPiBAQCAtNDYsNiArNDYsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAgICAg
IHNlbGVjdCBDTE9ORV9CQUNLV0FSRFMKPiA+ICAgICAgIHNlbGVjdCBDTElOVF9USU1FUiBpZiAh
TU1VCj4gPiAgICAgICBzZWxlY3QgQ09NTU9OX0NMSwo+ID4gKyAgICAgc2VsZWN0IENQVV9QTSBp
ZiBDUFVfSURMRQo+ID4gICAgICAgc2VsZWN0IEVEQUNfU1VQUE9SVAo+ID4gICAgICAgc2VsZWN0
IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBTTVAKPiA+ICAgICAgIHNlbGVjdCBHRU5FUklDX0FU
T01JQzY0IGlmICE2NEJJVAo+ID4gQEAgLTU2NCw1ICs1NjUsMTEgQEAgc291cmNlICJrZXJuZWwv
cG93ZXIvS2NvbmZpZyIKPiA+Cj4gPiAgZW5kbWVudQo+ID4KPiA+ICttZW51ICJDUFUgUG93ZXIg
TWFuYWdlbWVudCIKPiA+ICsKPiA+ICtzb3VyY2UgImRyaXZlcnMvY3B1aWRsZS9LY29uZmlnIgo+
ID4gKwo+ID4gK2VuZG1lbnUKPiA+ICsKPiA+ICBzb3VyY2UgImFyY2gvcmlzY3Yva3ZtL0tjb25m
aWciCj4gPiAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJlL0tjb25maWciCj4KPiBhbm90aGVyIGlz
c3VlLCB0aGUgImFyY2gvcmlzY3Yva3ZtL0tjb25maWciIGxpbmUgYWJvdmUgY29tZXMgZnJvbSBh
Cj4gY29tbWl0IHRoYXQgaXMgbm90IGluIHRoZSByaXNjdi10cmVlIGF0IGFsbCBidXQgaW4gdGhl
IGt2bS10cmVlIFswXSwKPiBtYWtpbmcgdGhpcyBwYXRjaCBmYWlsIHRvIGFwcGx5IG9udG8gcmlz
Y3YvZm9yLW5leHQgYWxvbmUuCj4KPiBJZiB5b3UgaGF2ZSBtdWx0aXBsZSBpbmRlcGVuZGVudCBw
YXRjaCBzZXJpZXMgaW4gZmxpZ2h0LCBsaWtlIHNob3duIGluCj4gdGhlIGdpdGh1YiBicmFuY2gg
eW91IHJlZmVyZW5jZXMsIGl0IG1pZ2h0IGJlIGVhc2llciB0byBiYXNlIGVhY2ggb24KPiB0b3Ag
b2YgdGhlIHJlbGV2YW50IGJyYW5jaCBjbGVhbmx5IGFuZCBhZnRlciBvbmUgZ2V0cyBhcHBsaWVk
IHJlYmFzZQo+IHRoZSBvdGhlciBvbmVzLgoKSSBrbm93IEkgaGF2ZSBiZWVuIGRvaW5nIHRoYXQg
YnV0IHRoaXMgdGltZSBhY2NpZGVudGx5IHBpY2tlZCB0aGUgd3JvbmcKYnJhbmNoIHRvIHJlYmFz
ZSB1cG9uLgoKVGhhbmtzIGZvciB0cnlpbmcuCgpSZWdhcmRzLApBbnVwCgo+Cj4gVGhhdCB3YXkg
eW91J3JlIG5vdCBkZXBlbmRlbnQgb24gdGhlIG90aGVycyBnb2luZyBpbiBmaXJzdCBhbmQgYWxz
bwo+IHBlb3BsZSBjYW4gdGVzdCBwYXRjaCBzZXJpZXMgaW5kaXZpZHVhbGx5IHdpdGhvdXQgdG9v
IG11Y2ggaGFzc2xlLgo+Cj4gVGhhbmtzCj4gSGVpa28KPgo+Cj4gWzBdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2t2bXMzOTAvbGludXguZ2l0L2NvbW1p
dC8/aD1uZXh0JmlkPTk5Y2RjNmMxOGMyZDgxNWU5NDBlODFiOWI0NzdkNDY5YmRkNDE3ODgKPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
