Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC824C02187
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jan 2025 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R31Nd8H96bnR6jyAyV3SNJ/o4t1RG1v//9Ao1FZoEbc=; b=yqi8BUBztuH+72
	ZJuRcq08T27jkt1x8ujqMGCkPkHXUlwzRRG3nKJcI0jVJHopJ6DusFQTgGKcI3+4qlnTZny9Y/BW8
	6mdbUTcnSJKMPIi/QECAebjzkFBqkgryOMBVM/cL8DDWaCM47VTUt38d9u1ia32a16coXY7H+H+59
	gQiSOBEeBwaSRdRZOapT5uBI/iMGGQXrMEKDEy+3Tlk1u9McQbOE3u6yMVALdZx2NGKDndsK0TZan
	84nvHNGZCOoVGTtP5N9xilgq4+DfXKJ0akwx9wnaH05s14LW3mGVpX8DwBAgeOQZvwxc674p1s4xj
	vcvrq7Gag+rqyATxZfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTFl-00000003mRH-3GUg;
	Sun, 19 Jan 2025 11:14:05 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZTFi-00000003mQg-3yrS;
	Sun, 19 Jan 2025 11:14:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso8405495a12.0;
        Sun, 19 Jan 2025 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737285240; x=1737890040; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=farCSn9nIwDEYesATkrLZqDi4SS6wrr0tkHz+ajWl3c=;
        b=M1+BAB0yMlBy2U+xv7F5G3hm0OixXavM8RP0YXCtgWU7gz+nZtmeUVpuuOzh4S+kLq
         1Ti4nrihV8IOoz/wBNf0dp6nHWj+ZQuWhRj8NzlmkQUN/qiyYUSr7qqImgZNOQrb/w4d
         tXTA2Z8s27sINSkUFG4+UyOwB6LUPrWZOgksHTX+vVAqubXC2fZ/Ehh6lgO4N+eNaFBf
         WRMZXtciIVaMhHEStQTRg6CRxkPmTi9P7K/6CzZHijDQQM5mdXeBlq6dh9hKxG++02Fs
         nsfwALIG6g6nb+KE1AEZKy2qZ1kkGGs6a0tshEvamF3Ikl6aVYdWTtJR34OJajNTB5Pf
         I4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737285240; x=1737890040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=farCSn9nIwDEYesATkrLZqDi4SS6wrr0tkHz+ajWl3c=;
        b=e7uCE9vkTxIF1BBXq3Zx3duzZ4FOgQRkUdGOvHxYSX86fC0ypQ4xwS9KN5yDaYYrjp
         9w4WPrWQp3+3sBkQBpN1lKjakpLjPIjXta1dvPASHVhyMXbH6uqScHXteLt5LDcX8f1L
         f1qwwqbm/ZnDHXS/kiMGDNI1MeQn+sVT2ADG5EVa5iq0Ta+qwfdlabpRgk/ssa1D2C16
         VBqwccD9Un1pqYsArmf5NwVSDGrQyr20O0Ic2DqY+/oe/2JPRtsgVtIcKAo3AuNvVbLc
         tE+2a1HFpiiR1Fp0iG+1Lzj1D0SgMapURahOmWJVsvL1T9Cc3m+ktuIibmjSo1HLvvH6
         xl+g==
X-Forwarded-Encrypted: i=1; AJvYcCUniuc0YjJTv0WrjIJYIDYaBFDomstTPrxDiab1FtqaHujUQI3JICeFrXAZ/sR5En/UyR1RCqwuTV81HvgkJmLJ@lists.infradead.org, AJvYcCXYz5pVNkl8HY3nd6EsSFSS9YXg8bmAVAgFgBAAIVgmjxHK+i8+520/WFDPKIqnbNSC75CIRX7OwzHYqk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPp3lohL2K6SORD9YTcLgJRplcCoAWL7oXzC0u70M2oyj0E6RT
	IyTXYv140PBN+eM4It/Uyd3kCcaZog+6AgE3Z4X1BDaXS2WeaAJY
X-Gm-Gg: ASbGncv530Vjn7DQudr8TlhFi1Ny+i1N87R46FSv0rHY155FSYUhxzCbGEFGsftBfGM
	SF565VSd71Y7M+TV9GGxNU5AnDN5C+VpEITi+ZvBux6QkToZrYQ/WxEYlT5Ycnn8H2qm3AvL8EV
	JY0MHRWiw9JvCqhf1urqFMKRM5fuULR1DnF2ScqYQ1RQ/8g0EFaNH2F9klW1++hg4tV/8R4zjCP
	QqfrFsPg/+gdWc1TqISommCZgvzHC4yVuvcNZ3wNcm38rpjodHlalGphidPP75/ovz3Y1NRjntB
	ZBiCMl5F6BqxQQ==
X-Google-Smtp-Source: AGHT+IEoTFLC8iiNkEfMuvLuAjGsOcPoNsCUGkRVkaCTnkI/9FAsHLtodq8RJ0LSASHuxw87IeFMAg==
X-Received: by 2002:a17:907:9405:b0:aa5:53d4:8876 with SMTP id a640c23a62f3a-ab36e406c75mr1277119466b.20.1737285240156;
        Sun, 19 Jan 2025 03:14:00 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c63b5fsm475163466b.32.2025.01.19.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 03:13:59 -0800 (PST)
Message-ID: <acc25734b7d89b04c19ad50981e3a82a7737dac8.camel@gmail.com>
Subject: Re: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 19 Jan 2025 12:10:58 +0100
In-Reply-To: <20250113-aftermost-whole-18401dc54137@spud>
References: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
	 <20250113-aftermost-whole-18401dc54137@spud>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_031402_987828_980EA6A3 
X-CRM114-Status: GOOD (  16.41  )
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

VGhhbmtzIGZvciB5b3VyIGhpbnRzLCBDb25vciEKCk9uIE1vbiwgMjAyNS0wMS0xMyBhdCAxNzoz
NyArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cz8K
PiA+IAo+ID4gwqBhcmNoL2FybTY0L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAuZHRzaSB8IDE2NCAr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNjQgaW5zZXJ0
aW9ucygrKQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9zb3Bo
Z28vc2cyMDAwLmR0c2kKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
c29waGdvL3NnMjAwMC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9zb3BoZ28vc2cyMDAwLmR0
c2kKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjk2YWZk
MzQyYmRlNQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9z
b3BoZ28vc2cyMDAwLmR0c2kKPiA+IEBAIC0wLDAgKzEsMTY0IEBACj4gPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiA+ICsKPiA+ICsjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ID4gKyNpbmNsdWRlICIu
Li8uLi8uLi8uLi9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LmR0c2kiCj4gPiArI2luY2x1
ZGUgIi4uLy4uLy4uLy4uL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MXguZHRzaSIKPiAKPiBG
V0lXLCB0aGlzIGNhbiBqdXN0IGJlICNpbmNsdWRlIDxyaXNjdi9zb3BoZ28vPHdoYXRldmVyPiwg
L3Nob3VsZC8gYmUgYQo+IHN5bWxpbmsgZm9yIHRoYXQsIGFzIHRoZXJlIGlzIGZvciBhcm02NC4g
QXQgdGhlIHZlcnkgbGVhc3QsIEkgZGlkIHNlZSBhCj4gcGF0Y2ggYWRkaW5nIHRoYXQgbGluayBp
biB0aGUgcGFzdC4gQ2hlY2sgb3V0IHdoYXQgdGhlIFJaL0ZpdmUgaXMgZG9pbmcKPiAodGhhdCdz
IHRoZSByaXNjdiByZW5lc2FzIGNoaXApIGZvciBhbiBleGFtcGxlIG9mIGhvdyB0aGlzIGFscmVh
ZHkgaGFzCj4gYmVlbiBkb25lIC0gSSB0aGluayBpdCdzIGRvaW5nIHdoYXQgeW91ciAiQWx0ZXJu
YXRpdmVseSBJIGNhbi4uLiIKPiBwYXJhZ3JhcGggZGVzY3JpYmVzLgoKVGhhdCdzIGV4YWN0bHkg
d2hhdCBJIG5lZWRlZCEKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
