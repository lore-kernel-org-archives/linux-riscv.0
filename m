Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD36EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGQUhZmbnuSlo9y1+7T5BorRSYWV1KwBTqVpWFQScm0=; b=fs9EXd0Tswy27c
	sF9SFAmWe8hbAfHkI7qpLu14Mp07MprX6j3MQOqWm0gtjHBAfJ3n5w2el+pyzWeuLgiqIJWQDts6B
	bumvLa6N4NzTKGR/vK6MD17Uzuha3vtCKJe7nnPLoGGAVOdEn9Br/L4dBBS0Jd2CRJHdrwufhaUPh
	k+VHiMMuQyzwHAKY6LRUTByRKYCp2yojrilK+Bar05kptq3JlncZv16f6hK4FbMNncp1UrvjWt3HE
	1b5NLzzrws6280PisAFSpxVNA0/5FXINddNs4VKAcqzLBurnhkdNwI++ynAF4U6xSm47PYgdX1NVK
	M+Y5xnyjAKh+iNd1TeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMV5Q-00BS74-0x;
	Thu, 20 Jul 2023 14:57:00 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMV5O-00BS6T-0T
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 14:56:59 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b93fba1f62so13268621fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689865016; x=1690469816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IP/2y9wfw4LxMxv/Rhk1PsVAYExL+/EttUAZLN3ays=;
        b=GZelfTlJLj4kmmIuHPW8qRTLb8r/53QDbnN6/JZxGy2qe1ixNu4HMV/nM6BHl+wEip
         vlenKfD/Bp2fuIxjGr3lnQuvi578UgWKOBfKjJQQQKZK5uVHI1UGRV7gfd+IMi7qMVJ4
         TyKH/FEY5X8lqZFt8f1rrNU//lSiNeky0ZS5xJzqd9Bqi7o3H8D3rR3nSmRa6wA1IF8/
         XvxJSxW+5MDRYf+43P6FRJ3LbO0UCbXVMYgOlw+rVFJjIc2N217W5rJ6jrSPwjyJK3RR
         +CZSctP4jQ942GyiVyrdmQNjOpyOfdDJK2M5wbXJLJObiUbvrzvz+dbL5a67N9NWBfaj
         60IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865016; x=1690469816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IP/2y9wfw4LxMxv/Rhk1PsVAYExL+/EttUAZLN3ays=;
        b=DyibxaIkDd4Qf/3ewGlQpLIiH/zChmDOvmbB8/GsK6lMsPtIp5b0WgMSiaNxVQh8SL
         AWElsyw3GK54+Nv6k9MjRMqix3fBqO40w1zDqhAw4ucnoNDXZjaEUK4ea9jL6Rjv060x
         Tbs3pXN4YjU5/ik9zAtdvqtj7S8R3GXaE7Wv74UNHdx9i2q44u8zoApLDgbIF2yBOfOD
         0pOrlF8ubF8WQhi4wmni7hGLD84BAxkzmlXj39cSc2+K63Vlxc4jZfLmqVSiAjZ/60Lm
         p2S3Q7tG9BnjJAKPQUIGMgc4oPSHiNAjT86zhRXnTjB/XDVfRU8H2bfZ4Mooq9VhsMgY
         p+DA==
X-Gm-Message-State: ABy/qLarzK9q5IT58yQCmjFvfTce+uXgV3U7LMnVUDo8Xup671zQ6CeU
	QhS/CKxSCtBjbL6gl2GxozYRDXKy67uHE1lJzI7iLNwzScqdZ7cg1TE=
X-Google-Smtp-Source: APBJJlGR05OlEqxl/MYJpBTaimhIHtYtqLde1xXeVZS8JlFG1Q+SL3h25Tq9dgmGmAx/VT2m0hPXmXPCx6UfJH268fs=
X-Received: by 2002:a2e:9297:0:b0:2b9:4b15:275f with SMTP id
 d23-20020a2e9297000000b002b94b15275fmr2433715ljh.51.1689865016301; Thu, 20
 Jul 2023 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230715150032.6917-1-andy.chiu@sifive.com> <20230715150032.6917-4-andy.chiu@sifive.com>
 <20230717-sedan-tiara-b7013d409ab8@wendy>
In-Reply-To: <20230717-sedan-tiara-b7013d409ab8@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 20 Jul 2023 22:56:45 +0800
Message-ID: <CABgGipXNR=D_E5Znkwap-0ZR64RYB1nyTwFc9EnUBRiN_N66ww@mail.gmail.com>
Subject: Re: [v1, 3/6] riscv: Add vector extension XOR implementation
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, vineetg@rivosinc.com, 
	bjorn@kernel.org, greentime.hu@sifive.com, paul.walmsley@sifive.com, 
	guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org, 
	heiko.stuebner@vrull.eu, Han-Kuan Chen <hankuan.chen@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_075658_185790_5AACC45A 
X-CRM114-Status: GOOD (  17.89  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNjoyNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMDM6
MDA6MjlQTSArMDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gRnJvbTogR3JlZW50aW1lIEh1IDxn
cmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBm
b3IgdmVjdG9yIG9wdGltaXplZCBYT1IgYW5kIGl0IGlzIHRlc3RlZCBpbgo+ID4gcWVtdS4KPgo+
IFNpbmNlIHRoaXMgcGF0Y2ggd2FzIG9yaWdpbmFsbHkgd3JpdHRlbiwgaGFzIGl0IGJlZW4gdGVz
dGVkIGluIGhhcmR3YXJlPwoKV2UndmUgcnVuIGl0IG9uIGludGVybmFsIEZQR0FzIGJ1dCBGUEdB
cyBkb24ndCBjb3VudCwgcmlnaHQ/ICA7KQoKPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBIYW4tS3Vh
biBDaGVuIDxoYW5rdWFuLmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEhhbi1L
dWFuIENoZW4gPGhhbmt1YW4uY2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3Jl
ZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3hvci5oIHwgODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2
L2xpYi94b3IuUyAgICAgICAgIHwgODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9saWIveG9yLlMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS94b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjgxYjg4MzdmYTE2MQo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS94b3IuaAo+
Cj4gPiArc3RhdGljIHZvaWQgeG9yX3J2dl8yKHVuc2lnbmVkIGxvbmcgYnl0ZXMsIHVuc2lnbmVk
IGxvbmcgKl9fcmVzdHJpY3QgcDEsCj4gPiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2ln
bmVkIGxvbmcgKl9fcmVzdHJpY3QgcDIpCj4KPiA+ICtzdGF0aWMgdm9pZCB4b3JfcnZ2XzModW5z
aWduZWQgbG9uZyBieXRlcywgdW5zaWduZWQgbG9uZyAqX19yZXN0cmljdCBwMSwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqX19yZXN0cmljdCBwMiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqX19yZXN0cmljdCBwMykKPgo+
ID4gK3N0YXRpYyB2b2lkIHhvcl9ydnZfNCh1bnNpZ25lZCBsb25nIGJ5dGVzLCB1bnNpZ25lZCBs
b25nICpfX3Jlc3RyaWN0IHAxLAo+ID4gKyAgICAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25l
ZCBsb25nICpfX3Jlc3RyaWN0IHAyLAo+ID4gKyAgICAgICAgICAgICAgICAgICBjb25zdCB1bnNp
Z25lZCBsb25nICpfX3Jlc3RyaWN0IHAzLAo+ID4gKyAgICAgICAgICAgICAgICAgICBjb25zdCB1
bnNpZ25lZCBsb25nICpfX3Jlc3RyaWN0IHA0KQo+Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgeG9y
X3J2dl81KHVuc2lnbmVkIGxvbmcgYnl0ZXMsIHVuc2lnbmVkIGxvbmcgKl9fcmVzdHJpY3QgcDEs
Cj4gPiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKl9fcmVzdHJpY3Qg
cDIsCj4gPiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKl9fcmVzdHJp
Y3QgcDMsCj4gPiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKl9fcmVz
dHJpY3QgcDQsCj4gPiArICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKl9f
cmVzdHJpY3QgcDUpCj4KPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IHhvcl9ibG9ja190ZW1wbGF0
ZSB4b3JfYmxvY2tfcnZ2ID0gewo+ID4gKyAgICAgLm5hbWUgPSAicnZ2IiwKPiA+ICsgICAgIC5k
b18yID0geG9yX3J2dl8yLAo+ID4gKyAgICAgLmRvXzMgPSB4b3JfcnZ2XzMsCj4gPiArICAgICAu
ZG9fNCA9IHhvcl9ydnZfNCwKPiA+ICsgICAgIC5kb181ID0geG9yX3J2dl81Cj4gPiArfTsKPgo+
IFNhbWUgbmFtaW5nIHNjaGVtZSBjb21tZW50cyBhcyB0aGUgbWFpbiB2ZWN0b3IgcGF0Y2hzZXQg
YW5kIDIvNiBhcHBseQo+IGhlcmUgdG9vLgoKWWVwLCBJJ20gZG9pbmcgcy94b3JfcnZ2L3hvcl92
ZWN0b3IKClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
