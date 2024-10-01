Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68AECE7D19
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOUTOqKfzyAG72vNX2G2IenrAstcKUsbpom4pCiw9/o=; b=a86p+I1dkgHAXc
	4Hc2J3TUqBkN1zMCx1YPEXJLrKQqZxNuLi1ffwm57hrTKfltzrHccugqHbhmVkpDrDdtygBBWD2RF
	1cLsIYe5yFRkshLCrYdGwSihN/gZUGJFPqM45fohKjWQgm+c+JFj/cIf+IpCMjTV3pSHtOpttGxCB
	r6Yf4m1GgMlYiefDVsleVu/pmkYqpVSN/d6hPjYK5X/LlnmOKbEa+oTMw11fbx9oJMxPL6QS92GDu
	2MHZJRjanBViPCvD01AG17E1n14YO5IAvTiwk9n0hAX9Va0O/RAq4Db2HwRMUfZw6P28qG2OfOd2j
	KHmYmr0SNtGJ+caSpj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbyi-00000002m2S-3SWN;
	Tue, 01 Oct 2024 12:27:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbyc-00000002m02-1Nh8
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 12:27:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5398d171fa2so3102540e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727785656; x=1728390456; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoCurHIkleGhUTp4khwR0zEhKLpu15VK4lI1dWVteZ0=;
        b=gLPxOHw6bM07ivOc+ouon5r2ouEqO9G3X75DRw8xPu/JEfudCosqgd3lxrRAjD1s0h
         /UspjIP92w/x97qd4uxjbDweLn+e40JK5IjT6T258In/a9AJUy1J1e3hDO93O1e3fvfw
         WokU8y19exse1ux+T+1dvpmBaFg42FK6GHZm4kvtIxAYSdoLmb/P/z4OHJXJSsvtsX2I
         Nt2xLf/UHx2T8IAr4SmaH1Iabv2afn6jDiiQSRvJUzNeird4JuXaNu7iDxRRerjYXPMS
         EwjwC1Z42X5dx4l2PiEw9X8tmXXMWc624jmjruFfwcM69iCMFLOLY//dgSOv6wuee7Fp
         GTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727785656; x=1728390456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoCurHIkleGhUTp4khwR0zEhKLpu15VK4lI1dWVteZ0=;
        b=PLidhdcIGeESaUH5ZRbvdS4l8+DShG6+3L0aBfjf9Ghl/kX8kxClgILWlRnex4QASb
         uC/yBPzxLRz9Xi1EYPc31hmNT7I2MqLYt/nt4sImDH165lAhAhcjBkSlDRZD5n/NAaNE
         3UoCuQSbpq5JrehjZIY2iQchytFobtarUaoK/YbdQo6r7wrluqZZgKgkdxtJW2WgUERy
         A4yWCW/XtKUaF9JwKyGwvvVBwWmH7hYJ0eeV5IW8CVsn9mRCAfxtJekOY0srneSXO3Vf
         wnaSWWvw03LrjHKdlALgnNa7DJzm0wxOOpW1HEEeqnY07rLSQKXzdw8F40GuGkBBlYLO
         Je6w==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4RzIskoHAUQWAtjavFqonGZZqLrrNtW2L9I63skzSW88+1mofqehxaZ6uigIHUlJumvc/1V1fen2BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHlo6VrQ40RJWut8gKBWioEzS4u1u2Q48kTKR5QmGXXwqfMAJ
	wYr/jUr5bJIfUTR4Jg+zgVQEJk6Q7m1E1bCtr89hzPDtj7Da54OJE7XPrhTcJt6mbteIS0AyqxN
	yRPedbAXVuMbqOJfhdygCR54zfMtWilTwa0rFPtR8lpN9p1q5
X-Google-Smtp-Source: AGHT+IG8TzlpP6uZVriUb03XpH7zYmc6S6jIBvK4noZhBbrXE9sWhgUKi4i+nF2zm0Fpa+WkCA4CyjTFVSaUXh1u58w=
X-Received: by 2002:a05:6512:3ba0:b0:52c:d6a1:5734 with SMTP id
 2adb3069b0e04-5389fc3ad9bmr8742854e87.14.1727785656074; Tue, 01 Oct 2024
 05:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
In-Reply-To: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 14:27:25 +0200
Message-ID: <CACRpkdYk9aCp7mdWJJTT-1cwNZC4RN_eB6v5rducDY5MGJ_dbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230 pinctrl
To: Ze Huang <18771902331@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_052738_393748_3C75C621 
X-CRM114-Status: GOOD (  15.65  )
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

T24gVGh1LCBTZXAgMjYsIDIwMjQgYXQgNTo1OOKAr1BNIFplIEh1YW5nIDwxODc3MTkwMjMzMUAx
NjMuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZv
ciB0aGUgcGluY3RybCBkcml2ZXIgb2YgdGhlIENhbmFhbgo+IEsyMzAgU29DLiBUaGUgSzIzMCBT
b0MgZmVhdHVyZXMgNjQgSU8gcGlucywgZWFjaCBvZiB3aGljaCBjYW4gYmUgY29uZmlndXJlZAo+
IGZvciB1cCB0byBmaXZlIGRpZmZlcmVudCBmdW5jdGlvbnMuCj4KPiBUaGUgY29udHJvbGxlciBt
YW5hZ2VzIHRoZSBlbnRpcmUgcGluIGNvbmZpZ3VyYXRpb24gYW5kIG11bHRpcGxleGluZwo+IHRo
cm91Z2ggYSBzaW5nbGUgcmVnaXN0ZXIsIHdoaWNoIGNvbnRyb2wgZmVhdHVyZXMgc3VjaCBhcyBz
Y2htaXR0IHRyaWdnZXIsCj4gZHJpdmUgc3RyZW5ndGgsIGJpYXMgcHVsbC11cC9kb3duLCBpbnB1
dC9vdXRwdXQgZW5hYmxlLCBwb3dlciBzb3VyY2UsIGFuZAo+IG11eCBtb2RlLgo+Cj4gVGhlIGNo
YW5nZXMgaGF2ZSBiZWVuIHRlc3RlZCBvbiBDYW5NVi1LMjMwLVYxLjEgYm9hcmQuCj4KPiBUaGUg
cGluIGZ1bmN0aW9uIGRlZmluaXRpb24gY2FuIGJlIGZvdW5kIGhlcmUgWzFdLCBhbmQgbW9zdCBv
ZiB0aGUgRFRTIGRhdGEKPiB3YXMgY29udmVydGVkIGZyb20gdGhlIHZlbmRvcidzIGNvZGUgWzJd
LgoKQmluZGluZ3MgQUNLZWQgYW5kIHBhdGNoZXMgbG9vayBnb29kIHRvIEkgYXBwbGllZCBwYXRj
aAoxICYgMiB0byB0aGUgcGluIGNvbnRyb2wgdHJlZS4KClBsZWFzZSBmdW5uZWwgcGF0Y2ggMyB0
aHJvdWdoIHRoZSBTb0MgdHJlZS4KCj4gcHJlcmVxdWlzaXRlLW1lc3NhZ2UtaWQ6IDx0ZW5jZW50
XzIyQkEwNDI1QjRERjFDQTE3MTNCNjJFNDQyM0MxQkZCRjgwOUBxcS5jb20+Cj4gcHJlcmVxdWlz
aXRlLXBhdGNoLWlkOiA3MDRlZmM2ZTc2ODE0ZTE4Nzc3NDg5NTlkNzMxOWQ1NThjODM4NmMxCj4g
cHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBjMjE0NGNmNDY4YzU3Yjg1NjgzMGE2MTYxNWJhNmJhNTAx
ZThlYzU4Cj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBjZWQ0YTAxY2NkOGRkYWIyZmQzMDhkNTQz
ZGRmNDdiZDE2NDE1MThhCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBmOGI5ODNiMzAxZDBjMTRm
MTQ0OGI5ZTRjMzIxMjYyYTUwOWUwNjFlCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA4MzRiNjVi
NmEyYjAzN2RhZWQ1Y2ZmYzZhNDE5NjM2MjI1NjhkYzljCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlk
OiAyNDAxNzAzYjU3NDQ4YzllYTJjM2RjNzY1MGI0NTAyNDkxYTI4OTQ0CgpJIGRvbid0IGtub3cg
YWJvdXQgYWxsIHRoaXMgc3R1ZmYgYnV0IG5laXRoZXIgYmluZGluZ3Mgb3IgY29kZSBzZWVtcwp0
byBjb250YWluIGFueXRoaW5nIHRoYXQgd29uJ3QgY29tcGlsZSBzbyBJIGp1c3QgYXNzdW1lIHRo
YXQgYW55IG9mIHRoZXNlCmRlcGVuZGVuY2llcyBhcmUgcHVyZWx5IGZvciBwYXRjaCAzLzMgYW5k
IEkgbm90aGluZyBibG9ja3MgbWUKbWVyZ2luZyBwYXRjaGVzIDEgJiAyIHNvIEkganVzdCB3ZW50
IGFoZWFkIHdpdGggdGhhdC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
