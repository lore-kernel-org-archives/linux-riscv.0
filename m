Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD125C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 11:25:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED1661249
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 11:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED1661249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+VNjbV1xBdA8owU3KWqzfWloqo/jSizEue1fRWqVmM=; b=Qzx3Bmr/Al48vmreeb/bzUrNn
	ZuHEJXu/cnrA4Aohw+KKGsKJb8+LugY3Zg+wTy3c73ArMQHIvIjrPg5P2s0wQf6BBsx0xFUhMDXxn
	aTYwDet9QyB+CrubXR1i/vPdPbhJLR5dyy3UZctVuT17eDExEqoJEK68151tlOt2FnbWF5iCJ5rSR
	nyBr2OY8xKE8QadsswfimCMVnN0s/M5Vvl1qeC7U4G1W7scwRYAQ4tcCG4vJ8gF0gAMRqXqfjd2VD
	QlZMgW3QIwBO0oyMSXqOBguHGKBDtORI1e+8q3MWRyealClAdsugsiOFcQI3cX3DzIYVZBE5wrtr2
	eylh86cww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWHAO-0092LB-S9; Tue, 13 Apr 2021 11:25:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGqk-008xGq-7z
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 11:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=je0tXK2szor3C65YXdb81D9aE+MAP/3wuEdJm5mxyfw=; b=kHXIWDiAXhI256JXy46RN6NPlG
 QE8ZU/351AV8nGSorN40Gf8sgZ9duBCSwRi+R5FZORGqXpckM6UFq0/t71evSl8sLbVU7rUVlThVp
 nB5UQFYHBuwJNlgGwQSwBQ47Yb0PBGTmQ/C6OhAqbZKxdoZHuJ6U4eHQajZYmi/zZ7XteSsFuRfOt
 4ZLQ1EoJgZoQK1e7vX59LhF5jkpAo91Pzv3+LI9be5y/GsESVAXXiRxiIua2Er9u6SNrUUeQgDLQO
 F4U0Zhqp6sGm25oLEOCFbeKXaKJgUlUx9pjoT1PaUH7xdloHTdrmuAH2f63iVR4kjYDLsRKXI4OWK
 8jdIhTlw==;
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGqg-006x6V-EX
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 11:04:53 +0000
Received: by mail-vk1-xa29.google.com with SMTP id a62so3542664vki.0
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=je0tXK2szor3C65YXdb81D9aE+MAP/3wuEdJm5mxyfw=;
 b=Mj7Ac0nkjEdSctz+w4445kA2ADO6XOmj12OFa73aesRvYDiBgn+UpPl8quADDUYvS2
 xCraii6FMAvWuzrtW3Zja1qRh88iw06YjNgbrh0WSvy9EOKsGlWHIwZEq/Oaylx181vm
 ioZhfinaESXQZrcg94bpuFY+aj0RsEQwmVDHIzNgk21CAiEa5erqw6CCYqlgNPL6zdYF
 i2ruCYBzuUepCkhFbxq3Ms4ptjPP6Wihg3ByiWwb06T2h7jVwSnTFsiIkBBN6methXP4
 +feO0ty6+q5s6imk/y9xuEKAQHtZ+FUM89habadKZmeVL2a/yqaXocEhL3i0jjqtXAIt
 BJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=je0tXK2szor3C65YXdb81D9aE+MAP/3wuEdJm5mxyfw=;
 b=BYOGqR4tVld6uXSkewoe2g2nyD4r2phUMnLkIwtuuR8XyN4OcR5/LtQIBTt80hBFjP
 Lrs4gwOWgOSpDywcWes71TPgq6WBQPq1s7Y374NWbtqYrn/tPPypxCge1Kb0IS8TwJr/
 R7MoRrXQHfqVL88UxnfFg6o8i7QTMfNNQd9J526KNGbOaafhii5+B+9NQqXyxP6PFp1x
 Z19uQriAl6ezxGYwe51HzgF6ahitnmC3LZ2Sn6oGtb3NkZRUVMl5000p/eyaqmASUMgL
 C5htwqKn8VoAGy+v17ytuX9iptkGzWkjhrKmNVJEuh/yA6LZPLUMXm00PglI3DPMjLcb
 1HDw==
X-Gm-Message-State: AOAM530MV8WqRfo80gMowAlCGxwnOrNj9DUwpff4WoLce76MYJYx4Ihz
 DfS0gL+1C4a2ifY/JXMu9h6YspTmTtq+oIkk0iA=
X-Google-Smtp-Source: ABdhPJw2T4zkH5O3s8wSbpVcYKdfS2ik6a773rVb2Mt8OtX9ebRpMLzavazIbmQCo0FNwIjv/JRFYGcacnplRsVrM3w=
X-Received: by 2002:a1f:1184:: with SMTP id 126mr13452119vkr.21.1618311889073; 
 Tue, 13 Apr 2021 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
 <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
 <20210413104503.GD15806@arm.com>
In-Reply-To: <20210413104503.GD15806@arm.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Tue, 13 Apr 2021 13:04:37 +0200
Message-ID: <CAHB2gtTtszK8XjhzByU-ZRP80_L922yEE7qkuJmFcUo2AaN7XQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_040450_511504_52E02538 
X-CRM114-Status: GOOD (  23.81  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTI6NDUgUE0gQ2F0YWxpbiBNYXJpbmFzCjxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAxMjoy
NTowMFBNICswMjAwLCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAx
MywgMjAyMSBhdCAxMTozNyBBTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAxMToyMjo0MEFNICswMjAwLCBD
aHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiA+ID4gV2hhdCBhYm91dCB0cnlsb2NrKCk/Cj4g
PiA+ID4gSS5lLiBvbmUgY291bGQgaW1wbGVtZW50IHRyeWxvY2soKSB3aXRob3V0IGEgbG9vcCwg
YnkgbGV0dGluZwo+ID4gPiA+IHRyeWxvY2soKSBmYWlsIGlmIHRoZSBTQyBmYWlscy4KPiA+ID4g
PiBUaGF0IGxvb2tzIHNhZmUgb24gZmlyc3QgdmlldywgYnV0IG5vYm9keSBkb2VzIHRoaXMgcmln
aHQgbm93Lgo+ID4gPgo+ID4gPiBHZW5lcmljIGNvZGUgaGFzIHRvIHVzZSBjbXB4Y2hnKCksIGFu
ZCB0aGVuIHlvdSBnZXQgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+ID4KPiA+ID4gYm9vbCB0cnls
b2NrKGF0b21pY190ICpsb2NrKQo+ID4gPiB7Cj4gPiA+ICAgICAgICAgdTMyIG9sZCA9IGF0b21p
Y19yZWFkKGxvY2spOwo+ID4gPgo+ID4gPiAgICAgICAgIGlmICgob2xkID4+IDE2KSAhPSAob2xk
ICYgMHhmZmZmKSkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4KPiA+
ID4gICAgICAgICByZXR1cm4gYXRvbWljX3RyeV9jbXB4Y2hnKGxvY2ssICZvbGQsIG9sZCArICgx
PDwxNikpOyAvKiBTQywgZm9yIFJDc2MgKi8KPiA+ID4gfQo+ID4KPiA+IFRoaXMgYXBwcm9hY2gg
cmVxdWlyZXMgdHdvIGxvYWRzIChhdG9taWNfcmVhZCgpIGFuZCBjbXB4Y2hnKCkpLCB3aGljaAo+
ID4gaXMgbm90IHJlcXVpcmVkLgo+ID4gRGV0ZWN0aW5nIHRoaXMgcGF0dGVybiBhbmQgb3B0aW1p
emluZyBpdCBpbiBhIGNvbXBpbGVyIGlzIHF1aXRlIHVubGlrZWx5Lgo+ID4KPiA+IEEgYml0IGxl
c3MgZ2VuZXJpYyBzb2x1dGlvbiB3b3VsZCBiZSB0byB3cmFwIHRoZSBMTC9TQyAod291bGQgYmUK
PiA+IG1hbmRhdG9yeSBpbiB0aGlzIGNhc2UpCj4gPiBpbnN0cnVjdGlvbnMgYW5kIGRvIHNvbWV0
aGluZyBsaWtlIHRoaXM6Cj4gPgo+ID4gdWludDMyX3QgX19zbXBfbG9hZF9hY3F1aXJlX3Jlc2Vy
dmVkKHZvaWQqKTsKPiA+IGludCBfX3NtcF9zdG9yZV9yZWxlYXNlX2NvbmRpdGlvbmFsKHZvaWQq
LCB1aW50MzJfdCk7Cj4gPgo+ID4gdHlwZWRlZiB1bmlvbiB7Cj4gPiAgICAgdWludDMyX3QgdjMy
Owo+ID4gICAgIHN0cnVjdCB7Cj4gPiAgICAgICAgIHVpbnQxNl90IG93bmVyOwo+ID4gICAgICAg
ICB1aW50MTZfdCBuZXh0Owo+ID4gICAgIH07Cj4gPiB9IGFyY2hfc3BpbmxvY2tfdDsKPiA+Cj4g
PiBpbnQgdHJ5bG9jayhhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4gPiB7Cj4gPiAgICAgYXJjaF9z
cGlubG9ja190IGw7Cj4gPiAgICAgaW50IHN1Y2Nlc3M7Cj4gPiAgICAgZG8gewo+ID4gICAgICAg
ICBsLnYzMiA9IF9fc21wX2xvYWRfYWNxdWlyZV9yZXNlcnZlZChsb2NrKTsKPiA+ICAgICAgICAg
aWYgKGwub3duZXIgIT0gbC5uZXh0KQo+ID4gICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgICAg
ICAgIGwubmV4dCsrOwo+ID4gICAgICAgICBzdWNjZXNzID0gX19zbXBfc3RvcmVfcmVsZWFzZV9j
b25kaXRpb25hbChsb2NrLCBsLnYzMik7Cj4gPiAgICAgfSB3aGlsZSAoIXN1Y2Nlc3MpOwo+ID4g
ICAgIHJldHVybiBzdWNjZXNzOwo+ID4gfQo+ID4KPiA+IEJ1dCBoZXJlIHdlIGNhbid0IHRlbGwg
dGhlIGNvbXBpbGVyIHRvIG9wdGltaXplIHRoZSBjb2RlIGJldHdlZW4gTEwgYW5kIFNDLi4uCj4K
PiBUaGlzIGluZGVlZCBuZWVkcyBzb21lIGNhcmUuIElJVUMgUklTQy1WIGhhcyBzaW1pbGFyIHJl
c3RyaWN0aW9ucyBhcyBhcm0KPiBoZXJlLCBubyBsb2FkL3N0b3JlIGluc3RydWN0aW9ucyBhcmUg
YWxsb3dlZCBiZXR3ZWVuIExSIGFuZCBTQy4gWW91Cj4gY2FuJ3QgZ3VhcmFudGVlIHRoYXQgdGhl
IGNvbXBpbGVyIHdvbid0IHNwaWxsIHNvbWUgdmFyaWFibGUgb250byB0aGUKPiBzdGFjay4KClJJ
U0MtViBiZWhhdmVzIHNpbWlsYXIsIGJ1dCB0aGUgc3BlY2lmaWNhdGlvbiBpcyBhIGJpdCBtb3Jl
IHByZWNpc2U6ClRvIGd1YXJhbnRlZSBmb3J3YXJkIHByb2dyZXNzLCB0aGUgKCJjb25zdHJhaW5l
ZCIpIExML1NDIHNlcXVlbmNlIGhhcyB0bwpjb25zaXN0IG9mIDw9MTYgaW5zdHJ1Y3Rpb25zLiBG
dXJ0aGVyLCB0aGUgImR5bmFtaWMgY29kZSBleGVjdXRlZCBiZXR3ZWVuCnRoZSBMUiBhbmQgU0Mg
aW5zdHJ1Y3Rpb25zIGNhbiBvbmx5IGNvbnRhaW4gaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIGJhc2Ug
4oCcSeKAnQppbnN0cnVjdGlvbiBzZXQsIGV4Y2x1ZGluZyBsb2Fkcywgc3RvcmVzLCBiYWNrd2Fy
ZCBqdW1wcywgdGFrZW4gYmFja3dhcmQKYnJhbmNoZXMsIEpBTFIsIEZFTkNFLCBhbmQgU1lTVEVN
IGluc3RydWN0aW9ucyIuCgpBbmQgR0NDIGdlbmVyYXRlcyBhIGJhY2t3YXJkIGp1bXAgaW4tYmV0
d2VlbiBMTCBhbmQgU0MuClNvIHdlIGhhdmUgbW9yZSB0aGFuIGVub3VnaCByZWFzb25zLCB0byBu
byBkbyBpdCB0aGlzIHdheS4KCj4KPiBCVFcsIEkgdGhpbmsgdGhlIFNDIGRvZXNuJ3QgbmVlZCBy
ZWxlYXNlIHNlbWFudGljcyBhYm92ZSwgb25seSB0aGUgTFIKPiBuZWVkcyBhY3F1aXJlIHNlbWFu
dGljcy4KPgo+IC0tCj4gQ2F0YWxpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
