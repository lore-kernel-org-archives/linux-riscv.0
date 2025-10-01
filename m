Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F8FCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHNFFzXuqI3n/RnJYaHrOuBPkWOr/1uyrrqZ9edh5kg=; b=Dst0wdDeSNPxlA
	k6aK0/kDAsEByMjrJK3FYz4N2b9fUIHBRBRtvvz2swQGlKwkiTFon+tRKw2A4o2RA68p7IBXyE6EX
	Qj1H+DyThWWJLyh5zZM0t005SuRmClEhU8Z1Cf7hS1CUmFdZuxZms6TTlH4ca9ycwMr1G/h203ihv
	w+qC9PhGyYZzAaF6XLsbwLYz4xTsexE9SHEJ35n/FMDHRFL6FIHJnQwJvxvROsPDK8Wb2cveGl1vJ
	C6eAa5FyT6FhTnRR9AmhP/+X+tqlzevg+eBEEu5ze5MK0HB1s1uecGrlb/OwgOL7pohIMW5qv1s5L
	HrrBhYVSh1oh+Zov645Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yAF-00000008G7O-1S0V;
	Wed, 01 Oct 2025 14:50:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3yAC-00000008G60-3qm4
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 14:50:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3da3b34950so666076166b.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759330239; x=1759935039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8lRt4XHwJ7UvsCLPeu4+rhzugEZMDTQiB2MnJ1uj9o=;
        b=h4UsBUcpzVAVgLifr+JRTlBpmP2sGYZ7PeJHE8y52DjhtiHrwpuixCoDltYgp+VxWh
         dgNjtbLuhzXH8pYA+yD/y0ol1IXq41Kwu7p119rpck/sTidWyDvTjcdqG2epqdvM+m8M
         TjdZmO/TWMF5sh/4njFmPSM5OUEmDOg+oYPAFdr47ivw6F7Jjf7fXr/1tEoTm/EuhOeC
         z73kihXefJntep2aisJ4pPKSJXKsJad2dOxeB5PjARayTmJpk1OzP/iqjAdEtZ11zZ6z
         RkOpIjGsHmN2nlvWIlD91hlIN8xWbtb2fOqxxbYBBAjachHCW14et+FdeKH8jLv95eUQ
         W92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759330239; x=1759935039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8lRt4XHwJ7UvsCLPeu4+rhzugEZMDTQiB2MnJ1uj9o=;
        b=HdSfSAtCfyp8+9zxcDKu83BugCU4RWLHem8a4Pt4d2gsqcLipMGAnY6umB5XlfCD4n
         /XwWWTIOAVAMJBN+QEoNWKaP2yD/rUT6at0xWq+tAEF1jWVZnqSdscDNDxtMTOHD/cNg
         CH1U0QO/hrA7lk/KDCJcBwrmh9hNHEzbWzN7fKjSeKYhJN3RWAmwAfD270hTaVL5SPtO
         dKJwghiKCbcBNkiOCAotiadlFGY0fw5xptYZSe/8mOQPRKAxJpp021PHB7Bd39WWsWoG
         RoZoRI6NWlvFQryIlbxE8dc5VL/CQ18/lXY6CAf0qYRa6Fkpacs/1JYgttSqhMRNPtUm
         YHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfeLLf6QxTgHC2KgcVeh2aqLkpfrYo1m/sCEoEkYbvnXvDf5Loaevz8vtcSTENwbv/bOy9RsIIdyATdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb2joCIQ/2gSb+K42bfoQUFE70uM872jPkko3ko4UyCngfpAxk
	joTM5mZ0AzXpb7O/JSbIBMSFf4ZHQnyQpbPQ3xjmjVxDOINDhY88n38L85PXm71rjW/AXTMywnh
	2VcOBpLpKkaWOkEY+nawo4hZaoKARIcg=
X-Gm-Gg: ASbGncuIDIvbmOinVUOsEbdZAsf8HzP/DQc2GnGmiGItMvrOm7Oy6uRjrWDjFHJqj/o
	iXkAo/gTEkT1/yXd64AXFratP979mVkPWTVDCphLXpU9eFaGjk5rsQI+RjZM1yOkUtiaMKwzYjp
	p5DCTSoID4sGZHusdfMAdZ70pFzUuDJWpDzkoiue8PVxYjC+dz8m297xQfHRkX9hcEFDxpdC/5J
	UDDSOLaOU4+QdIqwfxNKbSHqRwA/MKUl31IrB8=
X-Google-Smtp-Source: AGHT+IEhW4lQ4WJT42kTkGOTiSAPW7s/VSisFri50F+d7aFn93mDixmo8lCDZlBNBzV6Hf2cQ06jYV3kJ9ZpzgiY6Ps=
X-Received: by 2002:a17:907:6ea5:b0:b41:873d:e218 with SMTP id
 a640c23a62f3a-b46e2ff48damr449585766b.14.1759330238487; Wed, 01 Oct 2025
 07:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251001111451.299163-1-yongxuan.wang@sifive.com> <20251001111451.299163-2-yongxuan.wang@sifive.com>
In-Reply-To: <20251001111451.299163-2-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 1 Oct 2025 09:50:25 -0500
X-Gm-Features: AS18NWCjePyVL2irwP1oRSr4D1JRwAnvm3VjfUjkW76exkwwNp3e-bPQLEqNsE4
Message-ID: <CAFTtA3N9xBv9=pd1=yvS+KRiLgDx-Nd52jEBm_1Fn1BMMwviVA@mail.gmail.com>
Subject: Re: [PATCH v 1/2] riscv: ptrace: Optimize the allocation of vector regset
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, "Bill O'Donnell" <bodonnel@redhat.com>, 
	Joel Granados <joel.granados@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_075040_982904_4C2A4B83 
X-CRM114-Status: GOOD (  22.99  )
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

SGkgWW9uZy1YdWFuLAoKT24gV2VkLCBPY3QgMSwgMjAyNSBhdCA2OjE14oCvQU0gWW9uZy1YdWFu
IFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdmVjdG9yIHJl
Z3NldCB1c2VzIHRoZSBtYXhpbXVtIHBvc3NpYmxlIHZsZW4gdmFsdWUgdG8gZXN0aW1hdGUgdGhl
Cj4gLm4gZmllbGQuIEJ1dCBub3QgYWxsIHRoZSBoYXJkd2FyZXMgc3VwcG9ydCB0aGUgbWF4aW11
bSB2bGVuLiBMaW51eAo+IG1pZ2h0IHdhc3RlcyB0aW1lIHRvIHByZXBhcmUgYSBsYXJnZSBtZW1v
cnkgYnVmZmVyKGFib3V0IDJeNiBwYWdlcykgZm9yCj4gdGhlIHZlY3RvciByZWdzZXQuCj4KPiBU
aGUgcmVnc2V0IGNhbiBvbmx5IGNvcHkgdmVjdG9yIHJlZ2lzdGVycyB3aGVuIHRoZSBwcm9jZXNz
IGFyZSB1c2luZwo+IHZlY3Rvci4gQWRkIC5hY3RpdmUgY2FsbGJhY2sgYW5kIGRldGVybWluZSB0
aGUgbiBmaWVsZCBvZiB2ZWN0b3IgcmVnc2V0Cj4gaW4gcmlzY3Zfdl9zZXR1cF9jdHhfY2FjaGUo
KSBkb2Vzbid0IGFmZmVjdCB0aGUgcHRyYWNlIHN5c2NhbGwgYW5kCj4gY29yZWR1bXAuIEl0IGNh
biBhdm9pZCBvdmVyc2l6ZWQgYWxsb2NhdGlvbnMgYW5kIGJldHRlciBtYXRjaGVzIHJlYWwKPiBo
YXJkd2FyZSBsaW1pdHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGlt
ZS5odUBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwu
Y29tPgoKVGhhbmtzLApBbmR5Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rv
ci5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgIHwgMjQgKysrKysr
KysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgfCAg
MiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBpbmRleCBiNjE3ODZkNDNjMjAuLmU3YWE0NDkz
NjhhZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC01MSw2ICs1MSw3IEBAIHZv
aWQgcHV0X2NwdV92ZWN0b3JfY29udGV4dCh2b2lkKTsKPiAgdm9pZCByaXNjdl92X3RocmVhZF9m
cmVlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKPiAgdm9pZCBfX2luaXQgcmlzY3Zfdl9zZXR1
cF9jdHhfY2FjaGUodm9pZCk7Cj4gIHZvaWQgcmlzY3Zfdl90aHJlYWRfYWxsb2Moc3RydWN0IHRh
c2tfc3RydWN0ICp0c2spOwo+ICt2b2lkIF9faW5pdCB1cGRhdGVfcmVnc2V0X3ZlY3Rvcl9pbmZv
KHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4KPiAgc3RhdGljIGlubGluZSB1MzIgcmlzY3Zfdl9mbGFn
cyh2b2lkKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBpbmRleCA4ZTg2MzA1ODMxZWEuLmU2MjcyZDc0
NTcyZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gQEAgLTE1Myw2ICsxNTMsMTcgQEAgc3RhdGljIGlu
dCByaXNjdl92cl9zZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMCwgcmlzY3Zfdl92c2l6ZSk7Cj4gICAgICAgICByZXR1cm4g
cmV0Owo+ICB9Cj4gKwo+ICtzdGF0aWMgaW50IHJpc2N2X3ZyX2FjdGl2ZShzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnRhcmdldCwgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0ICpyZWdzZXQpCj4gK3sKPiAr
ICAgICAgIGlmICghKGhhc192ZWN0b3IoKSB8fCBoYXNfeHRoZWFkdmVjdG9yKCkpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArCj4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnN0
YXRlX3F1ZXJ5KHRhc2tfcHRfcmVncyh0YXJnZXQpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJlZ3NldC0+bjsKPiArfQo+ICAjZW5kaWYKPgo+ICAj
aWZkZWYgQ09ORklHX1JJU0NWX0lTQV9TVVBNCj4gQEAgLTE4NCw3ICsxOTUsNyBAQCBzdGF0aWMg
aW50IHRhZ2dlZF9hZGRyX2N0cmxfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICB9
Cj4gICNlbmRpZgo+Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgcmlzY3ZfdXNl
cl9yZWdzZXRbXSA9IHsKPiArc3RhdGljIHN0cnVjdCB1c2VyX3JlZ3NldCByaXNjdl91c2VyX3Jl
Z3NldFtdIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiAgICAgICAgIFtSRUdTRVRfWF0gPSB7Cj4gICAg
ICAgICAgICAgICAgIFVTRVJfUkVHU0VUX05PVEVfVFlQRShQUlNUQVRVUyksCj4gICAgICAgICAg
ICAgICAgIC5uID0gRUxGX05HUkVHLAo+IEBAIC0yMDcsMTEgKzIxOCwxMCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHVzZXJfcmVnc2V0IHJpc2N2X3VzZXJfcmVnc2V0W10gPSB7Cj4gICAgICAgICBb
UkVHU0VUX1ZdID0gewo+ICAgICAgICAgICAgICAgICBVU0VSX1JFR1NFVF9OT1RFX1RZUEUoUklT
Q1ZfVkVDVE9SKSwKPiAgICAgICAgICAgICAgICAgLmFsaWduID0gMTYsCj4gLSAgICAgICAgICAg
ICAgIC5uID0gKCgzMiAqIFJJU0NWX01BWF9WTEVOQikgKwo+IC0gICAgICAgICAgICAgICAgICAg
ICBzaXplb2Yoc3RydWN0IF9fcmlzY3Zfdl9yZWdzZXRfc3RhdGUpKSAvIHNpemVvZihfX3UzMiks
Cj4gICAgICAgICAgICAgICAgIC5zaXplID0gc2l6ZW9mKF9fdTMyKSwKPiAgICAgICAgICAgICAg
ICAgLnJlZ3NldF9nZXQgPSByaXNjdl92cl9nZXQsCj4gICAgICAgICAgICAgICAgIC5zZXQgPSBy
aXNjdl92cl9zZXQsCj4gKyAgICAgICAgICAgICAgIC5hY3RpdmUgPSByaXNjdl92cl9hY3RpdmUs
Cj4gICAgICAgICB9LAo+ICAjZW5kaWYKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfU1VQTQo+
IEBAIC0yMzMsNiArMjQzLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXRfdmll
dyByaXNjdl91c2VyX25hdGl2ZV92aWV3ID0gewo+ICAgICAgICAgLm4gPSBBUlJBWV9TSVpFKHJp
c2N2X3VzZXJfcmVnc2V0KSwKPiAgfTsKPgo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9WCj4g
K3ZvaWQgX19pbml0IHVwZGF0ZV9yZWdzZXRfdmVjdG9yX2luZm8odW5zaWduZWQgbG9uZyBzaXpl
KQo+ICt7Cj4gKyAgICAgICByaXNjdl91c2VyX3JlZ3NldFtSRUdTRVRfVl0ubiA9IChzaXplICsg
c2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X3ZfcmVnc2V0X3N0YXRlKSkgLwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoX191MzIpOwo+ICt9Cj4gKyNlbmRpZgo+
ICsKPiAgc3RydWN0IHB0X3JlZ3Nfb2Zmc2V0IHsKPiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7
Cj4gICAgICAgICBpbnQgb2Zmc2V0Owo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gaW5kZXggOTAxZTY3YWRmNTc2
Li4zZWQwNzFkYWI5ZDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+IEBAIC02Niw2ICs2Niw4IEBAIHZv
aWQgX19pbml0IHJpc2N2X3Zfc2V0dXBfY3R4X2NhY2hlKHZvaWQpCj4gICAgICAgICBpZiAoISho
YXNfdmVjdG9yKCkgfHwgaGFzX3h0aGVhZHZlY3RvcigpKSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Cj4gKyAgICAgICB1cGRhdGVfcmVnc2V0X3ZlY3Rvcl9pbmZvKHJpc2N2X3ZfdnNpemUp
Owo+ICsKPiAgICAgICAgIHJpc2N2X3ZfdXNlcl9jYWNoZXAgPSBrbWVtX2NhY2hlX2NyZWF0ZV91
c2VyY29weSgicmlzY3ZfdmVjdG9yX2N0eCIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92c2l6ZSwgMTYsIFNMQUJfUEFO
SUMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMCwgcmlzY3Zfdl92c2l6ZSwgTlVMTCk7Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
