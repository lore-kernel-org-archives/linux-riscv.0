Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB0D2D11F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5ZszyFO3pHbM0CrP0uvH4Tp2lLjB0I5fMYvRUCzTco=; b=YN34KH8TvWFPlY
	E4i7i65vSbrXeBYF8Tb9Npn+kt3lEOQ2jIsIFOQ7PmfsNu/j9SqFN5hsr0hdNei8HtZLcyinsiJ0X
	tUDhau7jQIQTtyYfQuZB9szKlA60QwVutABbqK3zBsmOGdnn+TboactGAizIfb3SpJ6aN6pTzI9K5
	0mTby+ejg0I85hR04pMCD5x49kqxExv1qdDwVzlzCWDYN6uQEXLZGiQMvMfj3xQERg1hH3tSgkFIE
	l4eOHDoF1ekkbiYdhj2WC487//ldCeBHk+PMonLNoyovZDtwee6uHQjQyeTjaA+aYWOhnHBmVoanX
	vVcbLJ1MSc2QR6wT9Nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffkS-00000007I5A-1A6s;
	Tue, 13 Jan 2026 14:51:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffkP-00000007I4n-29DX
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 14:51:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso65415355e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768315911; x=1768920711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrbpJFal3A/UAy+BNEZxhYFb3vg1Q5Eds5/IeT5w4c8=;
        b=ZO6wp/zTze4JO2LueCUXaAT6tTPJEQfF+Zt6xi4PbwAGKTKaHQZHg7ycgQVHRrebwh
         XKd3lK2FgyYjMgyKqMiB04yjU6d/oDdwldks8XB7E1Ti1ihG1fCPPLJPbAwd0sQGENhK
         8iPKnvbBctAgK4LpQyr5esfoZwng31KIe8rYWMTO4VS8Ec1pw02iHESR9EPmP05jqPZ6
         hPoQd/9RSaCoy1hYx0OY2ST2q3uVpAl/qLQlBe8zoSq16uhEcvUB7X47P5/eLQBe1U53
         utxl5CMI+ft0LktQLlfOVZMrwxzsQRjESF+/GfGlUDpD/TJTFT5VsAwo/+O1Ag7aTlnF
         CrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315911; x=1768920711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HrbpJFal3A/UAy+BNEZxhYFb3vg1Q5Eds5/IeT5w4c8=;
        b=HWNwXK9GqclNChzv8Il5YwIr8BGk/DFjPX4rl+J9i55WqDf1OjjQPECqppuvuRABMt
         jXksokmcdI6ClM0MLeqYPD9CeGg9x3ZUapkWRlOqeu8ZADShkuxr1eRWxPZ0MEYRX/Wf
         +pwIg9nld68C2KO+cLl2GiFK8Zc7j61QzoUSZCEGDswRG0yjOCTrNAdfOgBVnyJK3mBG
         CVppRrnK8UQZU4LjenoFmMalqAFlm+cWZ86aJcBZ2rcRYdPbD0lDfxG3Wb6FZotFb//K
         bsBzi9+Wr58lGSDoZGBUC18Ec/0JapdZBXhdH4HzuzT/xM4DToJ+fwC8mJNIg8Gt+mql
         63iw==
X-Forwarded-Encrypted: i=1; AJvYcCWftOPwMLUtFQYA/qCO+Gaj5/MRUCO9Lp1G3xyoS28MmV5buq0jJQXipJJ44ZPANRnF4XWQNy3OwlErAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhVjhpBD39iRS5OCqAOOllxUKTBgbeMDt2xvIQ1tAHjhOzvOPf
	gyVgJiR6iD0VFhBvcc1BO3Il3yQbei7n7WKP1CfUQeegIqWIbwyaZ0njjXYydVMr9Ebk5Kk2KDp
	H8dzpplFa1n4z/kl3bCOg4CisLzZ8p6M=
X-Gm-Gg: AY/fxX7pJQmw6b7KDKdmpJeSruYBEmCjdY65IpQ9Rky83b9w/uxXFg6wRZhgaramp8b
	GeMXpQ5XBWo1KgWvKNvoVEVNRg59g1xpvPQSVPyGt6+xNQKeDhG5CTkJ/2aJ9zWmOxhvgH3Zq4+
	eBKB/qBOdB6c3kgIa+wlM6es9PJj51+7bSyjiCBz01kHGJ7wydet+Lcg95TxL8EVDX5MGbpJk8H
	fBvDKwRZSee0ZimLwEbI7kYKFL5tEHgdfMWmt6PGiZTzLSbiqWtjuqmb0868kUs/somNfL64zwK
	z1WOEu//
X-Google-Smtp-Source: AGHT+IG7FJMgPtfRCGVUd42ESIK259+aN9eWQqyJklSOa/MO6VQJpXEcW6dUNhSMzGxd2dKaH8zhRU4hxB0bmjF65gU=
X-Received: by 2002:a05:600c:1d14:b0:477:7b16:5fb1 with SMTP id
 5b1f17b1804b1-47d84b0a96emr254622505e9.7.1768315910641; Tue, 13 Jan 2026
 06:51:50 -0800 (PST)
MIME-Version: 1.0
References: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
 <87jyxrrokt.ffs@tglx>
In-Reply-To: <87jyxrrokt.ffs@tglx>
From: Sanjay Embedded_SE <sanjayembeddedse@gmail.com>
Date: Tue, 13 Jan 2026 20:21:37 +0530
X-Gm-Features: AZwV_QgH89pF1zeNZxnvegoOZrx2X0Mp4O6Pa_BjaVeCQT-ZP__rC3byjsT3VJU
Message-ID: <CAJ=4qSabcHy=BCDT-yfnWMm9Jwv8J2WKGgZdK-j8ThYGG8H2Sg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: adapt to syscore API passing context data
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, virendrasinhchauhan1206@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_065153_604118_9D13A0AC 
X-CRM114-Status: GOOD (  12.31  )
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

Pj4gVGVzdGVkIHRoaXMgb24gcmlzY3Y2NCAoY3Jvc3MtY29tcGlsZWQgb24geDg2XzY0KSB1c2lu
ZyBsaW51eC1uZXh0Cj4+IChuZXh0LTIwMjUxMjE5KS4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUg
YnVpbGQgZmFpbHMgd2l0aDoKPj4KPj4gZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1t
YWluLmM6MTExOjIwOiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2YKPj4g4oCYaW50ICgqKSh2b2lk
ICop4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhpbnQgKCopKHZvaWQp4oCZ
Cj4+Cj4+IFRoaXMgcGF0Y2ggY29ycmVjdGx5IGZpeGVzIHRoZSBjb21waWxhdGlvbiBlcnJvciBi
eSB1cGRhdGluZyB0aGUgQVBMSUMKPj4gZHJpdmVyIHRvIHRoZSBuZXcgc3lzY29yZSBBUEkuCj4+
Cj4+IFRlc3RlZC1ieTogS2VrZSBNaW5nIDxtaW5nLmp2bGVAZ21haWwuY29tPgoKPiBUaGlzIGNv
bW1pdCBkb2VzIG5vdCBleGlzdCBhbmQgdGhlIHBhdGNoIGRvZXMgbm90IGFwcGx5IGFzIHRoaXMg
Z290IGZpeGVkCj4gYWxyZWFkeSB3aXRoIGFuIHVwZGF0ZSBmb2xkZWQgaW4gb24gRGVjLiAxNnRo
Ogo+Cj4gIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rp
cC90aXAuZ2l0L2NvbW1pdC8/aD1pcnEvZHJpdmVycyZpZD05NWE4ZGRkZTM2NjAxZDBhNjQ1NDc1
ZmIwODBlZDExOGRiNTljOGMzCj4KPiBJIGhhdmUgbm8gaWRlYSB3aGljaCB0cmVlIHlvdSBhcmUg
d29ya2luZyBhZ2FpbnN0Lgo+Cj4gVGhhbmtzLAo+Cj4gICAgICAgIHRnbHgKClRoYW5rIHlvdSBm
b3IgcHJvdmlkaW5nIGRldGFpbHMgb24gYWxyZWFkeSBtZXJnZSBjaGFuZ2VzLgpJc3N1ZSB3YXMg
cmVwcm9kdWNpYmxlIG9uIHRoZSBsaW51eC1uZXh0IGJyYW5jaCBhbmQgdGhlIHNhbWUgd2FzCmNv
bmZpcm1lZCBhbmQgdmFsaWRhdGVkIGJ5IEtla2UgTWluZyBhbHNvLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
