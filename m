Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACBFC369DC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7oE9zEbvfuvDyshs3RLMm7au++D330TvjjuFgNXaqmI=; b=dC6k828r9KUNVy
	B+AuZzH1YWlCbVoNB5mvVIJgr+Jd33qspEg+19gwKGlZKM0JP3sZuj94Ss9FQCFDFz8xC6OQ651CE
	KmH07p9/4iBP4TaKi0alh4luggrcL0RB/TAlHL6NihRMGio8o5hshMQsfHb3P9gZLcolHa7VM14ig
	MFcJDy3cH/4FRxpPUqh0LHKSTqgXWsev+2PVHf7kTsjWJSLIG4q6frLBsa6qlmtPkwNQLAbDqJNWk
	aMH8QcRap6pLU5U/IoY8xk6pRkSFvgQrqFn3SUCDjg9FbKZSI7kmplZFIponcRpmKrAWUrjA5WT6T
	dJk4IpPWUj/mily1XNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCt-00000006NNL-3lsf;
	Mon, 28 Apr 2025 13:07:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nt2-00000006Fxz-0Qht
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 12:47:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1020341666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745844422; x=1746449222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoDbPOw1p4YqIw8f4N+AkxYNr205WVYeWbe3sl8vltk=;
        b=rs0s17Lv6LFQ0Y+qg9AeRWOwh1kP7gso64tqtp3RakFc6ZSIMN31XzXFVy6Nbw7VRL
         FikziF4pyEbzUvLUwP2xdMJCT+7t/QFEhLs55CabPYk+esrZj8/GA/Kzp/t6oCiSNaxE
         DGP9AnPAEHnXm9ytjvxLFSQFy33cVINY/VQu2gSIHFWKjYhWcaYntt1qIhSU1hH3Hv5n
         LzBtRm7Eph5uLm3Ed/Slf430d46kNecVx8FZCXhVK/+SFZCI+sQ8hOmQtmfu/e4PT3Wp
         RLBpAPfahAOOnKk7E2Qz1hdX+xl/t4E8J6kmHy9DbIuQPxWHV+aklHXfjK8I1Qo/O42Y
         MIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844422; x=1746449222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoDbPOw1p4YqIw8f4N+AkxYNr205WVYeWbe3sl8vltk=;
        b=pi5Hc1Lzg2NeaeYjDYL3j1QW5zT20zTDwMu8OcIr/wLrLFwsuOeqAkH+bI5TofGL4J
         yBl8LeqAQUy4+wx0u1OGRiJC6olXEityJkINJ0Wzr1ZDdSpnpBkiMzJTSv7fUs62QSWv
         7tjSUhZ8pqr/NmRsxV7YmraOm5lLNUOkEwcAOka0e/c5aWfl5wIukVxERyVkOKb8NkYm
         /1eJJQlr4xYuQdwqn9spnn8oSetyq2LxV2+ucFZZAvzLpH/U103EobuGJ/WUop3ZndZU
         L6lkPsEuP3/yLjgJv8NwV24mnfn+X/ODI2SMneyvi6JTZ8lwJBD+FHRWC1BZmx0uvca2
         baMw==
X-Forwarded-Encrypted: i=1; AJvYcCVC7bs4KwkDqJqdlg1d6xfVg3qkCkv+UH7TX61VSFdGS4vKzPsXd1PznxutIu1HHIk/k8yNxgQmsp6vHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoxVnLb4N27n7ZhbOmJy6o9KIfis+Ht5cgeDL6OVN90R5Rfon7
	m5kCpDHQL5Gt33jewL3pImgNXcGuV3lA1rEkrs443ABT0s34qeAqE08cF8ODdtP5qCK4g+kTByW
	+DiNc6bR6rr8L9wSAbqqsu8ojVS4irsUTIKic/Q==
X-Gm-Gg: ASbGncsHf8PKZhVGYYoUZDWcsH5hgUA5hRe0KBrP+5N6V9QV0z/+TyZt+WLDgJMW4Zj
	GPybuxh+e75oUhowqOQf2jY0Q1nsyYBBVd5GI3zE45RPBDZuZhW5qS3ru8S328X6DDTfciOdepw
	Npo/Gb0fKA5h4+qecqlVoeinBPUocofENUwA==
X-Google-Smtp-Source: AGHT+IGk5TDZtIZeyBrVJJpzccoOP1uFny6dcETQUFtcD2er4S/mHnZ1uSMgcYFWUm241dVvRYAz/RFBf7vixx+9hnA=
X-Received: by 2002:a17:907:1b0b:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ace710a0eacmr1048006166b.13.1745844422192; Mon, 28 Apr 2025
 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-4-guodong@riscstar.com>
 <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
In-Reply-To: <kftfye2zn2ogyvuv7diuyrv5qkp43csbpkcqfcms2xp5lsuubm@z2kocdzkb7qk>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Apr 2025 20:46:50 +0800
X-Gm-Features: ATxdqUH6-_RHeS-1gOEkcXcvrWC9i9ud1F8bZVmjThNvU434y3rwyRGiOnAAjoM
Message-ID: <CAH1PCMZC5xrX07rd5bo+06zJoJDiAH3UNHqH5catwEALNJL2dQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054704_426111_39949F62 
X-CRM114-Status: GOOD (  17.46  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNDoxOOKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gU3VuLCBBcHIgMjAsIDIw
MjUgYXQgMDM6MDI6NDhQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLmR0c2kKPiA+IGluZGV4IGMwY2M0Yjk5YzkzNS4uZTdkYmE2MjNlODc3
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKPiA+IEBAIC01NTYs
NSArNTU2LDE4NSBAQCBzZWNfdWFydDE6IHNlcmlhbEBmMDYxMjAwMCB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJyZXNlcnZlZCI7IC8qIGZvciBURUUgdXNhZ2UgKi8KPiA+ICAgICAgICAgICAg
ICAgfTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcHdtMDogcHdtQGQ0MDFhMDAwIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLXB3bSIsICJtYXJ2
ZWxsLHB4YTkxMC1wd20iOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhk
NDAxYTAwMCAweDAgMHgxMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgI3B3bS1jZWxscyA9
IDwxPjsKPgo+IEkgd2FudCB0byBtYWtlIGFsbCBwd21zIHVzZSAjcHdtLWNlbGxzID0gPDM+IGlu
IHRoZSBsb25nIHJ1bi4gQ2FuIHlvdQoKU3VyZS4gSSBjYW4gZG8gdGhpcy4KCj4gcGxlYXNlIHVz
ZSB0aGF0IGZvciB0aGUgbmV3IGJpbmRpbmc/IChPZiBjb3Vyc2UgdGhpcyBuZWVkcyBhZGFwdGlv
biBpbgo+IHRoZSBiaW5kaW5nIGRvYywgdGhlIGNvZGUgc2hvdWxkIGFscmVhZHkgYmUgcHJlcGFy
ZWQgZm9yIHRoYXQuKQo+CgpJIGdvdCB3aGF0IHlvdSBtZWFuLiBUaGUgY29kZSBjaGFuZ2UgZm9y
IHRoYXQgaXMgYWxyZWFkeSBpbnRlZ3JhdGVkIGludG8KdjYuMTUtcmMxLgpDb21taXQgODk1ZmU0
NTM3Y2M4ICgicHdtOiBBZGQgdXBncmFkZSBwYXRoIHRvICNwd20tY2VsbHMgPSA8Mz4gZm9yIHVz
ZXJzIG9mCm9mX3B3bV9zaW5nbGVfeGxhdGUoKSIpCgpOb3csIGlmIEkgY2hhbmdlIHRoaXMgI3B3
bS1jZWxscyBmcm9tIDwxPiB0byA8Mz4sIHdpdGhvdXQgdGhlIGR0LWJpbmRpbmcgZG9jCmNoYW5n
ZXMsIEkgd291bGQgZXhwZWN0IHRvIHNlZSB3YXJuaW5ncyAoIiAjcHdtLWNlbGxzOiAxIHdhcyBl
eHBlY3RlZCIpIGR1cmluZwogIG1ha2UgZHRic19jaGVjayBXPTMKCkFueSBzdWdnZXN0aW9ucyB3
aGVuIHRoZSBkdC1iaW5kaW5nIGNoYW5nZXMgd2lsbCBiZSBtZXJnZWQ/Cm9yIEkgY2FuIGFkZCB5
b3VyIHBhdGNoIGFzIGEgZGVwZW5kZW5jeS4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2Ni
Nzk5ZDhhNWJiMjg0Y2Q4NjE3ODVhNjkxYjhkNWUzMjkzMDBkOTkuMTczODg0MjkzOC5naXQudS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZzeXNjb25fYXBiYyBDTEtfUFdNMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmVzZXRzID0gPCZzeXNjb25fYXBiYyBSRVNFVF9QV00wPjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAgICAgICAgICB9Owo+Cj4gVGhlIGVy
cm9yIHRoYXQgdGhlIGJ1aWxkIGJvdCByZXBvcnRzIGhhcHBlbnMgKEkgdGhpbmspIGJlY2F1c2Ug
Q0xLX1BXTTAKPiBpc24ndCBrbm93bi4KPgoKWWVzLCB0aGFua3MgZm9yIGNoZWNraW5nLiBUaGlz
IHBhdGNoc2V0IGRlcGVuZHMgb24gdGhlIGNsayBhbmQgcmVzZXQuCkkgd2lsbCBhZGQgdGhlbSBh
cyBwcmVyZXF1aXNpdGUuCgotR3VvZG9uZwoKCj4gQmVzdCByZWdhcmRzCj4gVXdlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
