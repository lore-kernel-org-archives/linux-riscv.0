Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B462EEAA4E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh+i0SKq63q9xCeCDPUr2STTazGvzjH7nbNXzOj4ORg=; b=xt7CS9jW0LgK95
	m+BULnrC32FVb2HJPUMng+4GtJNB/KDhrR1r/vxLphpYaZl2EIV1I+JKZRtZF2AEM4q4NKUU5KJwN
	T2I/AuWvwUiwKtamiVBFeIZ9ZlBxhX6RFrNiVtQHnflbq2wxnFbuJdTWRPR7uZKX8q1//FHkZFkeG
	HJW1jqzGPor6Yy2yCRg3sFDYUOHXOQr3nfTsh7ImL0dIssSk6QzWo+GpbJGHI5pyUSy/ePLkWKKmd
	BMr3K77SUUtuOGYA4pK31D9pJfVPSVsDniIS3WKH4+q2y5LaQATmfEXvX+2XO0hT7X+xZ67Xk7uuG
	KU9WMNh/VUmWHtVOtpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnqg-008j5l-1u;
	Thu, 14 Sep 2023 15:01:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnqd-008j4m-19
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 15:01:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so1791105e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694703698; x=1695308498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lwTM7NAptIePULa3PTJyJA+6Q6I8uSQc1kUpAUbvFQ=;
        b=nTw/yCtXKs/fdx71QGlQTDKV3yA1Z+OAiUb3EQAwaNEF5oOHFG1GU7H91fTILGttYl
         bhAPm6zG0lbhrNLaUXv5F0BhjZ+6NN/WREHTYZOtPYaO/j1TQcPB3RDJfmwvR6Eo2tIZ
         Y115mTE+yG1KCuZkC1g3w5x+5jLqNxUR9StAJSvGK1pSqUn2TWjyVF/lmFBQIo5cuvi+
         Lnkr/v9Q8RZRNajZxjpraXTdA6t+huglxbgm7rPpo6YcvyI5H6Fq67PjHtcWuSF8oh6X
         RUW+olJbitScPgot1IknhXZJFbl4DwFeDun9zlYiaj6TJnW77ShvoJ+nolyF++JojXBQ
         rsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703698; x=1695308498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lwTM7NAptIePULa3PTJyJA+6Q6I8uSQc1kUpAUbvFQ=;
        b=bRqCIdCF+fLp/3FA2vsWK7qTrxOdfLL3H3e56+iSPbJvVNsrOgnqPt6F0OmcCxqz6R
         wQncCqNVXfUdGGbcbVNZUbgnXILWNLy0aXSJ4Je8xdI5NpZLjFqB7qA2cybmNWICQ3RW
         V3RYnjOM6+ydYRWVIXEgTUCq1GWsxMwSxYtREu2UZdjUkNn81t7ErXxnJ+l/FUEYSZzs
         qiBbdhP4as2WDvFyVcoRWbkpQdqBfhVPSzpX+VOT/M4h6DNey6xVu44Ob3oH5Qsqv/DK
         V/zo9jyyy3CpsplHvSfnGjLSaulsFATAhkv6/xW7o/iD/fnMjycyWWWgoUGvjdYACWD9
         x0Gg==
X-Gm-Message-State: AOJu0YwNXxpZD2LNOK0S0PGPfKGTxzuV3PsfCZCz8XXH3E5Uoi9wOU4k
	Jpst81lx0pGyoqLqDa02Cxt1ZeFSkpu8N2xmHcenjQ==
X-Google-Smtp-Source: AGHT+IFcyTtDdaB1eVUQNQHCHqX6jsxMHYXjYH0JAqO643ytu1xJEJomtzaxCmNjZVzVVmvB2enLxjJb9sajIitl9Q0=
X-Received: by 2002:a05:6512:39c2:b0:500:bddc:56d5 with SMTP id
 k2-20020a05651239c200b00500bddc56d5mr5478034lfu.37.1694703697683; Thu, 14 Sep
 2023 08:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
 <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com> <de95229a14614198894a8ce421c30d94@AcuMS.aculab.com>
In-Reply-To: <de95229a14614198894a8ce421c30d94@AcuMS.aculab.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 14 Sep 2023 08:01:01 -0700
Message-ID: <CALs-Hstcz3OAxUi80nm+U0R56VBUUPQT=+XMOLpVJsn2ZOcM1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: David Laight <David.Laight@aculab.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Marc Zyngier <maz@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Simon Hosie <shosie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_080139_591358_0754E800 
X-CRM114-Status: GOOD (  30.86  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTo0N+KAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuCj4gPiBT
ZW50OiAxNCBTZXB0ZW1iZXIgMjAyMyAwODozMwo+IC4uLgo+ID4gPiA+ICAgICByemZpdmU6Cj4g
PiA+ID4gICAgICAgICBjcHUwOiBSYXRpbyBvZiBieXRlIGFjY2VzcyB0aW1lIHRvIHVuYWxpZ25l
ZCB3b3JkIGFjY2VzcyBpcwo+ID4gPiA+IDEuMDUsIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgZmFz
dAo+ID4gPgo+ID4gPiBIcm0sIEknbSBhIGxpdHRsZSBzdXJwcmlzZWQgdG8gYmUgc2VlaW5nIHRo
aXMgbnVtYmVyIGNvbWUgb3V0IHNvIGNsb3NlCj4gPiA+IHRvIDEuIElmIHlvdSByZWJvb3QgYSBm
ZXcgdGltZXMsIHdoYXQga2luZCBvZiB2YXJpYW5jZSBkbyB5b3UgZ2V0IG9uCj4gPiA+IHRoaXM/
Cj4gPgo+ID4gUm9jay1zb2xpZCBhdCAxLjA1IChldmVuIHdpdGggaW5jcmVhc2VkIHJlc29sdXRp
b246IDEuMDU4NTMgb24gMyB0cmllcykKPgo+IFdvdWxkIHRoYXQgbWF0Y2ggemVybyBvdmVyaGVh
ZCB1bmxlc3MgdGhlIGFjY2VzcyBjcm9zc2VzIGEKPiBjYWNoZSBsaW5lIGJvdW5kYXJ5Pwo+IChJ
IGNhbid0IHJlbWVtYmVyIHdoZXRoZXIgdGhlIHRlc3QgaXMgdXNpbmcgaW5jcmVhc2luZyBhZGRy
ZXNzZXMuKQoKWWVzLCB0aGUgdGVzdCBkb2VzIHVzZSBpbmNyZWFzaW5nIGFkZHJlc3NlcywgaXQg
Y29waWVzIGFjcm9zcyA0IHBhZ2VzLgpXZSBzdGFydCB3aXRoIGEgd2FybXVwLCBzbyBjYWNoaW5n
IGVmZmVjdHMgYmV5b25kIEwxIGFyZSBsYXJnZWx5IG5vdAp0YWtlbiBpbnRvIGFjY291bnQuCgo+
Cj4gLi4uCj4gPiA+ID4gICAgIHZleHJpc2N2L29yYW5nZWNyYWI6Cj4gPiA+ID4KPiA+ID4gPiAg
ICAgICAgIGNwdTA6IFJhdGlvIG9mIGJ5dGUgYWNjZXNzIHRpbWUgdG8gdW5hbGlnbmVkIHdvcmQg
YWNjZXNzIGlzCj4gPiA+ID4gMC4wMCwgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBzbG93Cj4gPgo+
ID4gY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29yZCBhY2Nl
c3MgaXMgMC4wMDQxNywKPiA+IHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvdwo+ID4KPiA+ID4g
PiBJIGFtIGEgYml0IHN1cnByaXNlZCBieSB0aGUgbmVhci16ZXJvIHZhbHVlcy4gIEFyZSB0aGVz
ZSBleHBlY3RlZD8KPiA+ID4KPiA+ID4gVGhpcyBjb3VsZCBiZSBleHBlY3RlZCwgaWYgZmlybXdh
cmUgaXMgdHJhcHBpbmcgdGhlIHVuYWxpZ25lZCBhY2Nlc3Nlcwo+ID4gPiBhbmQgY29taW5nIG91
dCA+MTAweCBzbG93ZXIgdGhhbiBhIG5hdGl2ZSBhY2Nlc3MuIElmIHlvdSdyZSBpbnRlcmVzdGVk
Cj4gPiA+IGluIGdldHRpbmcgYSBsaXR0bGUgbW9yZSByZXNvbHV0aW9uLCB5b3UgY291bGQgdHJ5
IHRvIHByaW50IGEgZmV3IG1vcmUKPiA+ID4gZGVjaW1hbCBwbGFjZXMgd2l0aCBzb21ldGhpbmcg
bGlrZSAoc29ycnkgZ21haWwgbWFuZ2xlcyB0aGUgd2hpdGVzcGFjZQo+ID4gPiBvbiB0aGlzKToK
Pgo+IEknZCBleHBlY3Qgb25lIG9mIHRocmVlIHBvc3NpYmxlIHZhbHVlczoKPiAtIDEuMHg6IEJh
c2ljYWxseSB6ZXJvIGNvc3QgZXhjZXB0IGZvciBjYWNoZSBsaW5lL3BhZ2UgYm91bmRhcmllcy4K
PiAtIH4yOiBIYXJkd2FyZSBkb2VzIHR3byByZWFkcyBhbmQgbWVyZ2VzIHRoZSB2YWx1ZXMuCj4g
LSA+MTAwOiBUcmFwIGZpeGVkIHVwIGluIHNvZnR3YXJlLgo+Cj4gSSdkIHRoaW5rIHRoZSAnMicg
Y2FzZSBjb3VsZCBiZSBjb25zaWRlcmVkIGZhc3QuCj4gWW91IG9ubHkgbmVlZCB0byB0aW1lIG9u
ZSBhY2Nlc3MgdG8gc2VlIGlmIGl0IHdhcyBhIGZhdWx0LgoKV2UncmUgY29tcGFyaW5nIG1pc2Fs
aWduZWQgd29yZCBhY2Nlc3NlcyB3aXRoIGJ5dGUgYWNjZXNzZXMgb2YgdGhlCnNhbWUgdG90YWwg
c2l6ZS4gU28gMS4wIG1lYW5zIGEgbWlzYWxpZ25lZCBsb2FkIGlzIGJhc2ljYWxseSBubwpkaWZm
ZXJlbnQgZnJvbSA4IGJ5dGUgbG9hZHMuIFRoZSBnb2FsIHdhcyB0byBoZWxwIHBlb3BsZSB0aGF0
IGFyZQpmb3JjZWQgdG8gZG8gb2RkIGxvYWRzIGFuZCBzdG9yZXMgZGVjaWRlIHdoZXRoZXIgdGhl
eSBhcmUgYmV0dGVyIG9mZgptb3ZpbmcgYnkgYnl0ZXMgb3IgYnkgbWlzYWxpZ25lZCB3b3Jkcy4g
KEluIGNvbnRyYXN0LCB0aGUgYW5zd2VyIHRvCiJzaG91bGQgSSBkbyBhIG1pc2FsaWduZWQgd29y
ZCBsb2FkIG9yIGFuIGFsaWduZWQgd29yZCBsb2FkIiBpcwpnZW5lcmFsbHkgYWx3YXlzICJkbyB0
aGUgYWxpZ25lZCBvbmUgaWYgeW91IGNhbiIsIHNvIGNvbXBhcmluZyB0aG9zZQp0d28gdGhpbmdz
IGRpZG4ndCBzZWVtIGFzIHVzZWZ1bCkuCgpXZSBvcHRlZCBmb3IgMS4wIGFzIGEgY3V0b2ZmLCBz
aW5jZSBldmVuIGF0IDEuMDUsIHlvdSBnZXQgYSBib29zdCBmcm9tCmRvaW5nIG1pc2FsaWduZWQg
d29yZCBsb2FkcyBvdmVyIGJ5dGUgY29waWVzLiBJIGFza2VkIGFib3V0IHRoZQp2YXJpYW5jZSBi
ZWNhdXNlIEkgZG9uJ3Qgd2FudCB0byBzZWUgbWFjaGluZXMgdGhhdCBjaGFuZ2UgdGhlaXIgbWlu
ZApmcm9tIGJvb3QgdG8gYm9vdC4gSSBvcmlnaW5hbGx5IGNvbnNpZGVyZWQgdHJ5aW5nIHRvIGNy
ZWF0ZSBhICJncmF5CnpvbmUiIHdoZXJlIHRoZSBhbnN3ZXIgZ29lcyBiYWNrIHRvIFVOS05PV04s
IGJ1dCBpbiB0aGUgZW5kIHRoYXQganVzdAptb3ZlcyB0aGUgZmlkZGx5IHBvaW50IHJhdGhlciB0
aGFuIHJlYWxseSBlbGltaW5hdGluZyBpdC4KCllvdSdyZSByaWdodCB0aGF0IGluIHRoZW9yeSB3
ZSBqdXN0IG5lZWQgb25lIHBlcmZlY3QgYWNjZXNzIHRvIHRlc3QsCmJ1dCB0ZXN0aW5nIG9ubHkg
b25jZSBtYWtlcyBpdCBzdXNjZXB0aWJsZSB0byBoaWNjdXBzLiBXZSB3ZW50IHdpdGgKZG9pbmcg
aXQgbWFueSB0aW1lcyBpbiBhIGZpeGVkIHBlcmlvZCBhbmQgdGFraW5nIHRoZSBtaW5pbXVtIHRv
CmhvcGVmdWxseSByZW1vdmUgbm9pc2UgbGlrZSBOTUktbGlrZSB0aGluZ3MsIGJyYW5jaCBwcmVk
aWN0aW9uIG1pc3NlcywKb3IgY2FjaGUgZXZpY3Rpb24uCgpHZWVydCwKVGhhbmtzIGZvciBwcm92
aWRpbmcgdGhlIG51bWJlcnMuIFllcywgd2UgY291bGQgYWRkIGFub3RoZXIgZGlnaXQgdG8KdGhl
IHByaW50LiBUaG91Z2ggaWYgeW91IGFscmVhZHkga25vdyB5b3UncmUgYXQgbGVhc3QgMTAweCBz
bG93ZXIsCm1heWJlIGtub3dpbmcgZXhhY3RseSBob3cgbXVjaCBzbG93ZXIgaXNuJ3Qgc3VwZXIg
bWVhbmluZ2Z1bCwganVzdAp2ZXJ5IG11Y2ggYXZvaWQgdW5hbGlnbmVkIGFjY2Vzc2VzIG9uIHRo
ZXNlIHN5c3RlbXMgOikuIEhvcGVmdWxseSBvdmVyCnRpbWUgdGhlIG51bWJlciBvZiBzeXN0ZW1z
IGxpa2UgdGhpcyB3aWxsIGR3aW5kbGUuCgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
