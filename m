Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33038C71157
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFmzJp2LBBgjFGfzezH94NLpzFg3pO1jw6B40vl+Yqk=; b=obYoo7KQtVvsaz
	DjlpMbPQpCDT39C6C0qrs8yQnFUrnjNLFO141aEvRy5YhQ/BQVMP4AAUTSXhqRPW7xP04FSSb0gsf
	BKtGGulOx75H8rtwZsUMu2GrE/7GrAEpeVseoKg+xSHJ/KlKHDLuaYwfI1fQkgzkWXvlflIv3wEyM
	YTOPIOgBa9sLbB+CHURnqz2Hh8QPZxflWP2YgVV4rgKlHPeiAy3fu3fA7bmePUU+irSKGcsNXcNcZ
	3YNafH0s1Oy2IOJrk7E9X7uDsxOey5mQkddRzVaDOHanECA2quf7Fb0t5IvUyD0LNaKucbl0+LNOh
	3cyCmdwlODbFyR8dLJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS54t-0000000Bp66-0mvL;
	Thu, 19 Jun 2025 02:32:35 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS51r-0000000Booy-2f3C
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 02:29:29 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70e767ce72eso3290797b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300166; x=1750904966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=JJ9nO+vROWjmmWlu3Hr4EDR+12c9SptTENo5OHiav+Ey/PmxkFqL+prcgz0wVo4IaD
         m/ZSHImhnesX2yLJwUtIKfkHoqsOsv4VatsQu4FqQo0hkBX9/h1VN7fgtsCuu1nlqdXe
         +vPo+iD031U3IyuBetcXIe+cjIsmWRvLlit3a1lzXmQi8xliUa8M0jPdzPY5SU3IAYCw
         dR1W5loBRc4sxXJ3aG7mxa28R7yk6b1N3BtWQ7xb3OGteofpproaMimkX3+AtN1ydb4g
         1lhVv2jmmLCAF+OL0TtoVymQ0fB53ENsDAsRcja2wj0M6b7yQq7U9bbuQ10ItDdv9swr
         60GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300166; x=1750904966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=rGOJTSn/JGkYmATsrUW9mZu7rseiclje9r4ymRxfPUD/SZLBXCfxjrWKpyNVI5Ut9l
         UIvMmislkAb2UB6zULrzYWfT3I9VRmait6Bh1D5FlbSxodLC5Z6cNloL4TD1EzcmtM/5
         KwkQhgE26wyqG0lgd9oM6FFncXzUqO62nN8VqMDy5Ik6hM2jvjlrbKSUSN1hSDDrXOiq
         WetbIJB6x2ZWfq83XgbPF/0veHH1UkgTk5IDni9IRTjXwIVkXpcz+8qGA4uvjuJ9U7SL
         v4IYPvTEvRif08eP3BCt12sapAvOiZONLXcG7HhIdkj8MptB7hgxBP1xAIqswIROXrs7
         TohQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRTqAy2W3cpcs8Ae01eBVdZAtfig9AYls6Y4bVI2z1/3D3LPnnhZ07iSMsdEzTh9j7J3/cjxf/g+XYRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5kcd+l6J4wF+5JdwyYHXPGzzmy1rMzgNTP2MQG69L25yTGIdp
	tS0X2Ste6ilFQP7w8kyYDZbJCR0bZBQny6n0yxrm83tm7AXPWNNwUggpR3nV/XbJldtYyntKzN1
	8J+Hy63vwedqO79v/ZzeRGNMbtKzGKgbOp1OoqQTStg==
X-Gm-Gg: ASbGncvxDC6MKy8zr+JuCRVNrEGsjlC407GLb8Sspeeti6aGcNKbfNEM5yQvhXU8olb
	kK+ALYjoxVok6+vNc2fUaNQfryWxLnTTzvFDGxf0CF1BY3P1Vj8uUqywQzFM+mjrO+oOHy+fbTm
	jtmBlzoorLFDtjrf7ustFp2XLNrgkseVY7TOkGaWShMQ==
X-Google-Smtp-Source: AGHT+IGTWcMJ9e18SuuZAjhMb+1RhUC5KbFMVpAzHRzN1h0rYVrbKTgujtHTi15citzRIXK4WE/50371Bg3VPce6S3o=
X-Received: by 2002:a05:690c:4442:b0:70e:29af:844a with SMTP id
 00721157ae682-711755076b4mr289656047b3.18.1750300166249; Wed, 18 Jun 2025
 19:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-3-guodong@riscstar.com>
 <aFEEhik8x2k5_myN@vaman>
In-Reply-To: <aFEEhik8x2k5_myN@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:29:14 +0800
X-Gm-Features: AX0GCFsoo3SDAFCWa_VQKJiemtWkvUSERAjA5vBX4NjZ4H9AqhsVRRlcUwFSJ3A
Message-ID: <CAH1PCMaD1muAQWRUfDJNKZL+-y31MBbw=aeD8VgEGxJE3eATbA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192927_910671_84580C63 
X-CRM114-Status: GOOD (  17.04  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMjowMOKAr1BNIFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gMTEtMDYtMjUsIDIwOjU3LCBHdW9kb25nIFh1IHdyb3RlOgo+
ID4gQWRkIHN1cHBvcnQgZm9yIHJldHJpZXZpbmcgYW5kIGVuYWJsaW5nIGFuIG9wdGlvbmFsIGNs
b2NrIHVzaW5nCj4gPiBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpIGR1cmluZyBtbXBf
cGRtYV9wcm9iZSgpLgo+Cj4gSXRzIGRtYWVuZ2luZSwgcGxlYXNlIHRhZyB0aGVtIGFzIHN1Y2gK
CkdvdCBpdC4gSSB3aWxsIGRvLgoKVGhhbmsgeW91LCBWaW5vZC4KCgo+Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2RtYS9tbXBfcGRtYS5jIHwgNiArKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL21tcF9wZG1hLmMg
Yi9kcml2ZXJzL2RtYS9tbXBfcGRtYS5jCj4gPiBpbmRleCBhOTVkMzExMDNkMzAuLjRhNmRiZjU1
ODIzNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hL21tcF9wZG1hLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZG1hL21tcF9wZG1hLmMKPiA+IEBAIC0xNSw2ICsxNSw3IEBACj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2RldmljZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL21tcF9k
bWEuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvZG1hcG9vbC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51
eC9jbGsuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfZG1hLmg+Cj4gPiAgI2luY2x1ZGUgPGxp
bnV4L29mLmg+Cj4gPgo+ID4gQEAgLTEwMTksNiArMTAyMCw3IEBAIHN0YXRpYyBpbnQgbW1wX3Bk
bWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCj4gPiAgewo+ID4gICAgICAgc3Ry
dWN0IG1tcF9wZG1hX2RldmljZSAqcGRldjsKPiA+ICAgICAgIHN0cnVjdCBtbXBfZG1hX3BsYXRk
YXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoJm9wLT5kZXYpOwo+ID4gKyAgICAgc3RydWN0
IGNsayAqY2xrOwo+ID4gICAgICAgaW50IGksIHJldCwgaXJxID0gMDsKPiA+ICAgICAgIGludCBk
bWFfY2hhbm5lbHMgPSAwLCBpcnFfbnVtID0gMDsKPiA+ICAgICAgIGNvbnN0IGVudW0gZG1hX3Ns
YXZlX2J1c3dpZHRoIHdpZHRocyA9Cj4gPiBAQCAtMTAzNyw2ICsxMDM5LDEwIEBAIHN0YXRpYyBp
bnQgbW1wX3BkbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCj4gPiAgICAgICBp
ZiAoSVNfRVJSKHBkZXYtPmJhc2UpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihw
ZGV2LT5iYXNlKTsKPiA+Cj4gPiArICAgICBjbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5h
YmxlZChwZGV2LT5kZXYsIE5VTEwpOwo+ID4gKyAgICAgaWYgKElTX0VSUihjbGspKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGspOwo+ID4gKwo+ID4gICAgICAgaWYgKHBkZXYt
PmRldi0+b2Zfbm9kZSkgewo+ID4gICAgICAgICAgICAgICAvKiBQYXJzZSBuZXcgYW5kIGRlcHJl
Y2F0ZWQgZG1hLWNoYW5uZWxzIHByb3BlcnRpZXMgKi8KPiA+ICAgICAgICAgICAgICAgaWYgKG9m
X3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi0+b2Zfbm9kZSwgImRtYS1jaGFubmVscyIsCj4g
PiAtLQo+ID4gMi40My4wCj4KPiAtLQo+IH5WaW5vZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
