Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C103C79FB9
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfRjNay+2YuIVcANy4yh23t/u3Bjg759OQbnrlf+FJo=; b=gP2vwT/8YmuVxn
	JSChBGRPZ+Ka5fVctTYzUZpUfBIum171CQ6bWKQWUOehZGtid9We/NSjAyiwLJLpeLoja8gbOu1RH
	swiIBD0Yn0seyklbL5Ju6YFWgoXbYz4JPHKpBV4h14rAnkl1/aBLopkwRgo2uT57N0maVNYm38Cw4
	Rykf9eOhgWir+p6rvfR71NP4bSbVq98/nbB/LJoSjano5zT51Kx8l15i/7yOlm/Vv4j4KlLowEnVX
	fc1EJcby5Jnjh9/IYTYxmOqHo4Fpn+joY8dlsMPYMIBrH2VypNqFPTGz7LZrocwpWF5VVCk3phurg
	Mk+cazTzysqctnNM7DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcptB-0000000Bx57-35rY;
	Mon, 05 Jan 2026 19:05:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpt5-0000000Bx46-3b8O
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 19:05:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so1991395e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 11:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767639906; x=1768244706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=cf82Qq/iLJzlOFNCojcZ1HQ8f70Ag3LGC5bXN22WjDRIwj9cS+0jC8yJ0FGStdWZnf
         RTmkCtlNheqMz8xfawzOnBSRcNFxYmnyg10KLIobwYodBnUAyMheOUhqNJq5XCdJC5c/
         IkAYdeJNbyJV82+8ziZDhDAzRmlUBG0/RHwMTasNrt2+RWcg1SFgSZhBDv/s2zvQpWQq
         n5RonQD0zB+V+kJlaC7p6nck6grv4YvQdmxYbRju47nDuRbjeeBT3Tr0YxLbcdLoVjlD
         s3xPjtkJy7QERDBc2Kd8gD69M19LjVVof4FS/iBGbA++dUswG7kKrIJ00E3fEx1Pz0Ns
         dRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639906; x=1768244706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=BHk6n9cKiDuVJTReEK1OAxVd53hou1GP39rRQ5Llyy5VspkqP9Ee7yDShcYklUjAW7
         A/P3a1vleDSfxNRdC/jhVARGzoOAwxy/2J67r15jrOf4u+syZd4esssx+aeVZ9S6MVnI
         OhuC+0M5JGtNowyNtKNEFrNC8EhFTjp19EpXFeKf/FGkfUUATTG4co4f4e96WsGbT+YO
         aQeATqtROVA8fxxF+CaLabJG2ibkrEdWxwHd62DJMvNVAXt+M9tx0uoIhGTyykv95AHI
         Six/3t6F3rCiu1lqop7Ny3th6z3kYnpoHiKHrsWNt7t6fEov2b+ceREZZ4ly1OqrJZl6
         1Aag==
X-Forwarded-Encrypted: i=1; AJvYcCWSo9MWYBbg7zQBXk8JsUkVFLfoOSlpoUKjaj8TF1miQf5QeZFmYGb1xCiXij7NrwyUuOISF4YR8C7rMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB2p738ESY5oc61MZ3mpW/f6opuR6MQ+1zdG442LWgrXr8ZTej
	alG/tdPR0u0kVggrId803t/njY+sFWMcURmIcUQd2FNT/Wq/hz/TNNy/
X-Gm-Gg: AY/fxX6MyPkJzIBufidTn52LvnMqASz0Ck6TvZ6YGY/19S4gxIFNXzduiHXG53RwuGz
	J07fdMWcX04wyOm7Sphf/e9obPI6dFk8Te9e5TmVrI68NAGGuJLdcd72tJHjNDJHC5HBocDtqDa
	bX+NQJz2peYsQrTVDJtj51zj7N7CHRvDiT4Le76BIVjIb75tVgabZWYYKOW8FMLwU6CM8ZR1dQT
	UofAjwmj3I1QqCQ0Th6I73S0jM7yt/9ytr0doqNJJTeW9/DFZZAFsCLH4JNgdWB/ioivjlyjp0H
	L3Xq9sFBcd20wNoJWNgP7Lz9I6zUg7tc1ZLg7ehT0YMlrEJQhIPi078YMNuUYC3qM6XcdOoUMmL
	EYOC9xvnWnI0O0BU0Fi2Ori1A7xy/XXPWQBNKnAoqGL2YVi1mb4Nw+l1SLOkn7WN4TzJQpDhkwL
	o4fmac+CLTkYbYQFa5z3ixZcSkTVD/hrAVlW4AkivzD/sJDSVgHZZOA/m7ebGC8wE=
X-Google-Smtp-Source: AGHT+IGlHrTGN9QhI9D4GcPAN0WpXBCiJkY6o1Su8HuTrk460ua/0mSfGa1CiVo2PPimvYizFp7ESg==
X-Received: by 2002:a05:600c:4f93:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d7f0929c2mr4085365e9.18.1767639905594;
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm2991115e9.7.2026.01.05.11.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Date: Mon, 5 Jan 2026 19:05:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: ebiggers@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
 dengler@linux.ibm.com, freude@linux.ibm.com, herbert@gondor.apana.org.au,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260105190503.53cc31dd@pumpkin>
In-Reply-To: <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
	<859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_110507_914474_A9C9B807 
X-CRM114-Status: GOOD (  10.45  )
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

T24gTW9uLCA1IEphbiAyMDI2IDE1OjQwOjIyICswMDAwCkFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiA+ICAJLyogTW9zdCBzaWduaWZpY2FudCBvY3Rl
dCBvZiBwbGFpbnRleHREYXRhIGNvcnJlc3BvbmRzIHRvIGRhdGFbMF0gKi8KPiA+ICAJc3dhcF9i
dWYociwgZGF0YSwgMTYpOwo+ID4gIAo+ID4gLSBhZXNfZW5jcnlwdCgmY3R4LCBkYXRhLCBkYXRh
KTsgKyBhZXNfZW5jcnlwdF9uZXcoJmFlcywgZGF0YSwgZGF0YSk7ICAKPiAKPiBPbmUgdGhpbmcg
eW91IG1pZ2h0IHdhbnQgdG8gY29uc2lkZXIsIHdoaWNoIHJlZHVjZXMgdGhlIGNodXJuIGluIHRo
ZSBzZXJpZXMuCj4gCj4gWW91IGNhbiB1c2UgX0dlbmVyaWMoKSB0byBkbyB0eXBlLWJhc2VkIGRp
c3BhdGNoIG9uIHRoZSBmaXJzdCBwb2ludGVyLsKgCj4gU29tZXRoaW5nIGxpa2UgdGhpczoKPiAK
PiB2b2lkIGFlc19lbmNyeXB0KGNvbnN0IHN0cnVjdCBjcnlwdG9fYWVzX2N0eCAqY3R4LCB1OCAq
b3V0LCBjb25zdCB1OCAqaW4pOwo+IHZvaWQgYWVzX2VuY3J5cHRfbmV3KGFlc19lbmNyeXB0X2Fy
ZyBrZXksIHU4IG91dFthdF9sZWFzdCBBRVNfQkxPQ0tfU0laRV0sCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnN0IHU4IGluW2F0X2xlYXN0IEFFU19CTE9DS19TSVpFXSk7Cj4gCj4gI2Rl
ZmluZSBhZXNfZW5jcnlwdChjdHgsIG91dCwgaW4pwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDC
oMKgIF9HZW5lcmljKGN0eCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgY3J5
cHRvX2Flc19jdHggKjogYWVzX2VuY3J5cHQoY3R4LCBvdXQsIGluKSzCoCBcCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFlc19lbmNyeXB0X2FyZzogYWVzX2VuY3J5cHRfbmV3KGN0eCwgb3V0
LCBpbikpCj4gCj4gCj4gaS5lLiBpdCBrZWVwcyB0aGUgX25ldygpLWlzbSBpbiBhIHNpbmdsZSBo
ZWFkZXIsIHdpdGhvdXQgbmVlZGluZyB0bwo+IGNoYW5nZSB0aGUgZHJpdmVycyBhIHNlY29uZCB0
aW1lLgoKWW91J2xsIG5lZWQgdG8gY2FzdCB0aGUgJ2N0eCcgYXJndW1lbnQgaW4gYm90aCBjYWxs
cy4KQWxsIHRoZSBjb2RlIGluIGFuIF9HZW5lcmljKCkgbXVzdCBjb21waWxlIGNsZWFubHkgaW4g
YWxsIHRoZSBjYXNlcy4KKFRvdGFsbHkgYW5ub3lpbmcuLi4uKQoKCURhdmlkCgo+IAo+IH5BbmRy
ZXcKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
