Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A07C71135
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 03:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc5sxbhqikkzDtu93xxWlAAjoaJPV9V5lUNrvTPJOm0=; b=P39HR6Uk2DM3vc
	lRGcsazu2yijFsPDJDMR3Uh0YLFttUEQryeLchdiUS/iK/KWiEzi6UcBC9DKfX5CjCtfZrfxkcRAB
	AXOaYTQ/UHSs5lHsw10XIVKxSyMW8BTmEkrVEuTCMXLVx/FMVArGaF4J7FXn/FYYdy++G1kj/34IT
	yNI+NuyHPmMkoV+dXAKtCaw7c8iiGWMQvQeZZZpoWqPwsvP7XPJ+atD5G0kySyTgW0EJXHRtCRyz0
	3yst26m8WLSOxfx8SxM6evEuTEpbA+0Dr3M1sMVUCzLr7RhIF0/rvAeVGWRxRZjom2VHJBUecvSqm
	eDAo3T04U0TReWIMCZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR05L-00000003DAc-3au1;
	Mon, 16 Jun 2025 03:00:35 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyxS-000000036qQ-4Ase
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 01:48:24 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e82323de932so1304122276.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750038501; x=1750643301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOzSlHGrohqg16jZUYXWufW0vuZiNjJeJ11ROGdnH0s=;
        b=K0OmzCXbVk2JPIk+jTb16bUYxE6Xv7F5BWGnlWkw7zx0G4rkr0JsCA+rN3PJXU/AV9
         xGy0hsGlvBWYbXjhccUXTLm+JZrokl5hYs7TCgtAofwGlTEdI9GBsIEoCS292IFqiiZz
         f2vRLDoCFF9j9qULxC9BtbgFKJv7jJME7/RsfpH/ijZ1w9zRmYIcgM9vk0eSLIaSR0im
         yPVYwmjF6sGF5N6aEuTEKJXcFgvoiLR3FmLmNe48QE0a6UFdJyqh/tXyqeL/7H5NmhZt
         1Abq5tY6HblpQePIVJr/oHtdN+4Prz4MbrLcavvYtcK0Pi5vzpaLFm3rUnw4rJ6mpxPQ
         rHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750038501; x=1750643301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOzSlHGrohqg16jZUYXWufW0vuZiNjJeJ11ROGdnH0s=;
        b=lOPxh4lKCNPsXiKwrhKAxOWd7AOwu85X6Kn7NAGdTKDnAuDqoVShw0JN5S5hNa+sgF
         fMsss3/4pdGtISMu4/wSygW8LcFlufSWBnQgvmDyzp/lkJHnVj8Bff7AzHdBxWXctGRr
         1GByLT9Cv5azXcA90n+64vrDpKhwODA2aKszqbpQJArvrjh8OrJMT1f0gfcVeeVIpct5
         HgpLI7fZ1lSQ1h67+E+5GzJu7zlMQlqHK/1QG4wMlLst7UCmqysWzlwMQGe5D6Yj1rZ+
         cwgFPO9x360vzF1Z7zdJLgaUy5Av/WEvcK5h1zIZ4RiCgm9eNKqWvo/HboSSTZbBrJfd
         S4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVpA13xPe7nP49QNgNTSz2YRfbnplqg5IHKLv31/cL44BDjYH4Q5y3Txto7kthBIrgoWQRvJ0cvcKSjqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/JNAxIaIBk/3wb9JVAOQt27Pxld8p+7quxDH9Tf9h90RpUHCt
	I7jPG3fd3hXFzeoBYHw7sg+EF6DnQngkWUFqAQnGT0CvjpKrri0NSzISLfUXIt98fovQ95s1j9K
	BI8YzOW1BckrnqLa58i9NnocI6dSiQsm7aTyQXEqCPA==
X-Gm-Gg: ASbGncvomBfTp7si4j6T3OmKuz57vt8Rf5V6jRbXcNE77+jPZZy47Qg5dG6MekyzyxR
	Ob9SV7ktZsnbIUz7ihXEV05pX4qGCRw0K/8ejlSQVtgiYHcXdaF9bKzfI+WaaH4XhaHtCdq19It
	ugz3sLM6NVA5ZMyFaDyzONZrqUEsTDrmJqsKYbGx4VtRylbw==
X-Google-Smtp-Source: AGHT+IFalCf8ZLoxrhpSKn9vCQOzYoFcnEfNXOj4LlRmMvOTsepmvXs4hWpCrqsUwKhOi0aW6UpNob7XRbuxVWD8Dgs=
X-Received: by 2002:a05:6902:98e:b0:e7d:b107:d829 with SMTP id
 3f1490d57ef6-e822acac597mr10474564276.34.1750038501428; Sun, 15 Jun 2025
 18:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250611031023.28769-1-nick.hu@sifive.com> <20250611031023.28769-2-nick.hu@sifive.com>
 <9c429671-8409-4911-8559-73a069d66964@kernel.org> <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
 <19dd3d16-aadd-469c-a090-238baba14d4e@kernel.org>
In-Reply-To: <19dd3d16-aadd-469c-a090-238baba14d4e@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 16 Jun 2025 09:48:10 +0800
X-Gm-Features: AX0GCFuk6UQINAiWg9qRWYn3jgDichbt9fCZYVL_UNVZi-NYRKmQpcuss8-kLqU
Message-ID: <CAKddAkB=yeLCh3oVFeot45nTr3d0tZjfiV+YmWR-DWFb8w+=jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_184823_049870_4FB21295 
X-CRM114-Status: GOOD (  15.39  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMzoyMOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMS8wNi8yMDI1IDA5OjE1LCBOaWNrIEh1IHdy
b3RlOgo+ID4gT24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMjo1N+KAr1BNIEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAxMS8wNi8yMDI1IDA1
OjEwLCBOaWNrIEh1IHdyb3RlOgo+ID4+PiBTaUZpdmUgRG9tYWluIE1hbmFnZW1lbnQgY29udHJv
bGxlciBpbmNsdWRlcyB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHMKPiA+Pj4gLSBTaUZpdmUgVGls
ZSBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+Pj4gLSBTaUZpdmUgQ2x1c3RlciBNYW5hZ2VtZW50
IENvbnRyb2xsZXIKPiA+Pj4gLSBTaUZpdmUgQ29yZSBDb21wbGV4IE1hbmFnZW1lbnQgQ29udHJv
bGxlcgo+ID4+Pgo+ID4+PiBUaGVzZSBjb250cm9sbGVycyBjb250cm9sIHRoZSBjbG9jayBhbmQg
cG93ZXIgZG9tYWluIG9mIHRoZQo+ID4+PiBjb3JyZXNwb25kaW5nIGRvbWFpbi4KPiA+Pj4KPiA+
Pj4gSG93ZXZlciwgU2luY2Ugd2UgZG9uJ3QgaGF2ZSBhIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxl
IHN0cmluZyB5ZXQsIHNvCj4gPj4+IGFkZCAnLSB7fScgZm9yIHRoZSBmaXJzdCBlbnRyeSBbMV1b
Ml0uCj4gPj4KPiA+Pgo+ID4+IEJ1dCB5b3UgbXVzdCBoYXZlIFNvYyBzcGVjaWZpYyBjb21wYXRp
YmxlIHN0cmluZ3MuIFNlZSBwcmV2aW91cyBkaXNjdXNzaW9uLgo+ID4+Cj4gPiBNYXliZSBJJ20g
bWlzc2luZyBzb21ldGhpbmcsIGJ1dCBzaW5jZSB3ZSBkb24ndCBoYXZlIGEgU29DLXNwZWNpZmlj
IGNvbXBhdGlibGUKPiA+IHN0cmluZyB5ZXQsIEkgdGhvdWdodCB3ZSBhZ3JlZWQgdG8gaW5jbHVk
ZSBhIGAtIHt9YCBhcyB0aGUgZmlyc3QKPiA+IGVudHJ5LCBhbG9uZyB3aXRoIGFuCj4gPiBleHBs
YW5hdGlvbiBpbiBib3RoIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgY29tbWVudHMgWzFdLgo+IEJ1
dCB5b3VyIGNvbW1pdCBtc2cgZG9lcyBub3QgZXhwbGFpbi4gWW91IG5lZWQgdG8gZXhwbGFpbiB3
aHkgeW91IGRvIG5vdAo+IGhhdmUgU29DIHNwZWNpZmljIGNvbXBhdGlibGVzLiBTYXlpbmcgIkkg
ZG8gbm90IGhhdmUgYSBTb0Mgc3BlY2lmaWMKPiBjb21wYXRpYmxlIiBpcyBub3QgYW4gYXJndW1l
bnQgZXhwbGFpbmluZyB3aHkgeW91IGRvIG5vdCBoYXZlIFNvQwo+IHNwZWNpZmljIGNvbXBhdGli
bGUuCj4KWW91J3JlIHJpZ2h0LiBIb3cgYWJvdXQgdXBkYXRpbmcgdGhlIGNvbW1pdCBtc2cgdG8g
IldoZW4gdGhlIFNvQ3MgYXJlCnJlYWR5LCB3ZSB3aWxsIGFkZCB0aGUgU29DIGNvbXBhdGlibGUg
c3RyaW5nIGF0IHRoYXQgdGltZSIgPwoKQmVzdCByZWdhcmRzLApOaWNrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
