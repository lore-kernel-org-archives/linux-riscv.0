Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DEC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXC9ehQipWw0lb9PSaUdL3vGPKYDemGKPJXZOsql3M8=; b=hZaofkrXHoJNvQ
	mR3OCqzu0OufmmTsxAmh07KVBCddxC6OPKNCxUrwiHzHKEKhSsUOCXTGIWn37hnDtGKkiMOr/40bI
	plDsTglM9wYA6dHstkgNRWYHvyEzkFbEqD/rfbJU7eh1xGDYuNmgDLFx784o22NY/MifnxPTtsF9y
	Ab240SNv5nrs/W+Hy8LMgKDr1O161xVqD/yq6u7AGzkbwE5rJV5HNfRsApAK7fR9F8qzuSFiBxWks
	OMrNtwK3lZ32sxp8lXvx6A92MdpvmQF2BKxAfxurvAH5EL/pbJKDPtQzYcW4b5/bUGSY9mw952JsJ
	I+HcgUVn64XYHo9zzyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr61-000wut-Oo; Fri, 03 Feb 2023 08:06:57 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr5x-000wsH-RH
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 08:06:56 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-50e7a0f0cc8so58963307b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 00:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsQ1fz/5ts1oSbk5jHHBvcB4Ie2MesFk+szUUh6A4jY=;
        b=LrIwQLQExZfBlHn96+8T9yAYVF7blScAuSGTxSWxoA4gsaRWuliWlI/EmEpMiQszqy
         ItKdQsPVYDFI28Tee4ozKKOFmJpNbUFnzqLlySzvHIFtJMmeYJEU/FQDQPxO9tGnWImb
         ChxHReQT5QbqbWjN8sBcG4F9yrFw8JdAZ/oJRU2puvshBFvS43slCt/lWOAXEoBsrYSQ
         zLyAozAoYMY8rclOnYjO6ztyX7NdziBo1sVv9jsOBETK/jrWOGrchy1uLIGUrODiaV46
         Jmu17ImPhr9sA4dYAIyM8v/9YE1/IZlGVvl5wislwhzJmfmZs3Yz7Cg4FgPWs61G7dUH
         Y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsQ1fz/5ts1oSbk5jHHBvcB4Ie2MesFk+szUUh6A4jY=;
        b=j8srRoRnhu7uXjZp+MKfU4NEP6+AifGnuRf/880YMK5P3uhcebraJ1Lue1zwUkDOoP
         uKz7az/LIRP9D8COB5uV7y0B8sy0jJ9kECO3EOAukecbTSxUgXOXMIXYNGevdeXxA3iO
         rIj2F+amJ7hQdtX2e8KJxl8di2PWAFdGz4jylEHtiwiRHGAggt+hauLt6G2JD2MZBBvw
         ksh6UbXtppY8Vy3YzXOzQ4Lamt6/fYHfjkWj1MGSBtZomo8eaW8F3NWWtkJoeXI9+fmo
         tTFs0qKKet4lqL6xuX1zdyAzoq0NuFyNf9XEhPmYReC949i3ZTKyAD4oH1cis7MqKYcW
         A7Bw==
X-Gm-Message-State: AO0yUKWL3Na7rMtmJZ3duBgci8ulTg9nu7D+ihIi9l8fspdjHPQ2v1nO
	9yq+wfhdGA3c3TptWPOJAsZuIeX8uUy6+mYR25Z3Zw==
X-Google-Smtp-Source: AK7set/o+IabmEdqaU/6vnUZGJwr98FRwvsJQoYCYLMkAqoqU7g2zvHizcifaV74heDDmMnxUXCX16hSI10n6ex5G1g=
X-Received: by 2002:a81:2515:0:b0:4fd:417b:7b8a with SMTP id
 l21-20020a812515000000b004fd417b7b8amr1014395ywl.404.1675411611090; Fri, 03
 Feb 2023 00:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
In-Reply-To: <20230130101707.pdvabl3na2wpwxqu@pengutronix.de>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 3 Feb 2023 16:06:38 +0800
Message-ID: <CAHh=Yk85NHbm9eUKLm75GUP4gSP5eYFjVabTUXseyB6wHD4D=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, geert+renesas@glider.be, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000653_920941_AF9760FF 
X-CRM114-Status: GOOD (  25.01  )
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

SGkgVXdlLAoKVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4g5pa8IDIwMjPlubQx5pyIMzDml6Ug6YCx5LiAIOS4i+WNiDY6MTflr6vpgZPvvJoKPgo+IE9u
IE1vbiwgSmFuIDMwLCAyMDIzIGF0IDA1OjMyOjI5UE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6
Cj4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhlIHB1bHNlIGluYWN0aXZlIHRp
bWUsIGFuZCB0aGUgcmVzdWx0IG9mCj4gPiB0aGlzIGFsZ29yaXRobSBpcyB0aGUgcHVsc2UgYWN0
aXZlIHRpbWUuIFRoZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRoZQo+ID4gcmVzdWx0Lgo+ID4K
PiA+IFRoZSByZWZlcmVuY2UgaXMgU2lGaXZlIEZVNzQwLUMwMDAgTWFudWFsWzBdLgo+ID4KPiA+
IFswXTogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJlNjAwLTFmOTMt
NGY0MS1iMmQ4LTg2ZWQ4YjE2YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBkZgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+IGluZGV4IDYyYjZhY2M2MzczZC4u
YTVlZGExNjVkMDcxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4g
PiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+IEBAIC0xNTgsNiArMTU4LDcgQEAg
c3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwKPiA+ICAgICAgIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VT
VChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ID4gICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBn
ZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+ID4gICAgICAgZnJhYyA9IG1pbihmcmFjLCAo
MVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkgLSAxKTsKPiA+ICsgICAgIGZyYWMgPSAoMVUgPDwg
UFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsKPgo+IFRoZSBzYW1lIHByb2JsZW0gZXhp
c3RzIGluIHB3bV9zaWZpdmVfZ2V0X3N0YXRlKCksIGRvZXNuJ3QgaXQ/Cj4KPiBBcyBmaXhpbmcg
dGhpcyBpcyBhbiBpbnRlcnJ1cHRpdmUgY2hhbmdlIGFueWhvdywgdGhpcyBpcyB0aGUgb3Bwb3J0
dW5pdHkKPiB0byBhbGlnbiB0aGUgZHJpdmVyIHRvIHRoZSBydWxlcyB0ZXN0ZWQgYnkgUFdNX0RF
QlVHLgo+Cj4gVGhlIHByb2JsZW1zIEkgc2VlIGluIHRoZSBkcml2ZXIgKG9ubHkgY2hlY2tlZCBx
dWlja2x5LCBzbyBJIG1pZ2h0IGJlCj4gd3JvbmcpOgo+Cgo+ICAtIHN0YXRlLT5wZXJpb2QgIT0g
ZGRhdGEtPmFwcHJveF9wZXJpb2QgaXNuJ3QgbmVjZXNzYXJpbHkgYSBwcm9ibGVtLiBJZgo+ICAg
IHN0YXRlLT5wZXJpb2QgPiBkZGF0YS0+cmVhbF9wZXJpb2QgdGhhdCdzIGZpbmUgYW5kIHRoZSBk
cml2ZXIgc2hvdWxkCj4gICAgY29udGludWUKPgo+ICAtIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRf
Q0xPU0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ICAgIGlzIHdyb25nIGZvciB0d28gcmVhc29u
czoKPiAgICBpdCBzaG91bGQgcm91bmQgZG93biBhbmQgdXNlIHRoZSByZWFsIHBlcmlvZC4KYXJl
IHlvdSBtZWFuIHN0YXRlLT5wZXJpb2QgaXMgYSByZWR1bmRhbmN5IHZhcmlhYmxlIHNvIHdlIGNh
biB1c2UKZGRhdGEtPnJlYWxfcGVyaW9kIGRpcmVjdGx5PwoKaXQgc2VlbXMgcmVhc29uYWJsZSwg
YnV0IEkgZG9uJ3QgZ2V0IHlvdXIgcG9pbnQsIHdoeSBkbyB3ZSBuZWVkIHRvCmNoYW5nZSB0aGUg
YWxnb3JpdGhtIHRvIERJVl9ST1VORF9ET1dOX1VMTCgpIGFuZCBjaGFuZ2UgdGhlIGlmLWVsc2UK
Y29uZGl0aW9uLgoKZnJhYyA9IERJVl9ST1VORF9ET1dOX1VMTChudW0sIGRkYXRhLT5yZWFsX3Bl
cmlvZCk7CmlmIChzdGF0ZS0+cGVyaW9kIDwgZGRhdGEtPmFwcHJveF9wZXJpb2QpIHsKICAgIC4u
Lgp9Cgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAgfAo+
IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3
LnBlbmd1dHJvbml4LmRlLyB8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
