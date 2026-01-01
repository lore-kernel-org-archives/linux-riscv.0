Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE0EEB57B
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 22:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C70TX0bDFJkQtOXdSR3erdPTeFgHBmdWXxVcjKLha9A=; b=zjXjs00HJf4zj1
	2YAOV5w5XH5OHwe0FlZ3tNqf++Hagg5xOgVJ/R84vgMWn+7Qto6wFWJo22QQ0F4ZspaIpaQ7Gc+NG
	hQflEI0BvCk7q75+4YK++g1LhDfRglp/T4EghQiyO+VPTmoDUVcLpqHReUQfbhh09R58UGckn9gIE
	0fatRUC+Fxd5ys1X9FmQubSXhhJmhZz6G79cf+dyfmpfpNEzQNFsHD+jB0vyIxsvta9FSFU8lWI6U
	CmckDKm8QSpa/AqhRHzx+0N5vtLDTkr82FwiRwbfBQVTMx/MBeV0Vh8KxNZr+hhFKDnWxNDPYHiLr
	sdqVyVHbGYMyjD2WWu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRd0-00000007cx1-08nc;
	Thu, 01 Jan 2026 22:58:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRcx-00000007cwf-1NXw
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 22:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD92B44298
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B96FC19423
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767308322;
	bh=RbIi5TJDTEC3UxivySA2nm8bc3JBw7+A82+IHl76Oas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JMPQ5OEavke4eor11qSqdluzacM9pgxLT/75uNftYomx/dZ/c7GN8vIUISllgSs59
	 Gbw91fqZfVY/D33IIE25lrzp5gUIIZ0XDZSyAVEA6sy7XJ01kj97436zbY+2plwWMF
	 15anUid3WifUXERa4MmqCUhQu41bT2I9oq8/GctFEAkE0424KwPjMW58x6nLBEoZs2
	 8vTsXThfyqnOYPmdAz3c7Pa3yt9zz10p1rFwBn0xDPW/lPZIOjAyc3igQn0MoFEXKp
	 A7O44/U8nJxkIOu5LxhQEhchIzRK6XyAEDLsrHNHp/kTmwDMlmep8oVAQ3jO+mw/Oo
	 1Px1A480U4JuQ==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6420c08f886so14182209d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jan 2026 14:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfGPms2r/ZiA9EHL34OKfl1F/ZziB7EXHON1K4P+9TOFrsn1m4WJyXZkuGLwIescUspqjRZjnjMErTPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ8W/n+imkKtEbi0ff4JkCsA3cgSldMbuxyDClP/9G8mLMdyzG
	mjLMcqrxsu4kVU3kZF9ku+LF9jiTLKwbDNxb6m9kdWDaQ79JDfNs3DiVlXk7TY7YDF49pzaVLVY
	vJJwwLzVoXjcOIkNGMW8C/qxhHHj9p+w=
X-Google-Smtp-Source: AGHT+IGS2wpABqiEH3qZJel2X4/tAnT/x9k7y/82/oTjRgpeFKRhQhUMOFnfELr3u2G5kJutP+OFyH7GjaSju3gf+4M=
X-Received: by 2002:a05:690e:2453:b0:641:f5bc:68de with SMTP id
 956f58d0204a3-6466a8d7899mr25549975d50.75.1767308321878; Thu, 01 Jan 2026
 14:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251223093228-GYA1986709@gentoo.org> <4D38DBB2D5EA96CC+aUpkCTp00KxEuU_Z@kernel.org>
In-Reply-To: <4D38DBB2D5EA96CC+aUpkCTp00KxEuU_Z@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:58:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLmQ6Qk=fDt1do6XcpF0bkpD-=JmmEy+iL6pFy54wSfC6A@mail.gmail.com>
X-Gm-Features: AQt7F2qqol7CqtttbEg-5xwoZiRTRjr4aiAeaJta_tiuinN5LIdgHV3kBp5fC5w
Message-ID: <CAD++jLmQ6Qk=fDt1do6XcpF0bkpD-=JmmEy+iL6pFy54wSfC6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain configuration
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_145843_415639_6D61735B 
X-CRM114-Status: GOOD (  11.86  )
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

SGkgVHJveSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgRGVjIDIzLCAyMDI1IGF0
IDEwOjQz4oCvQU0gVHJveSBNaXRjaGVsbAo8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5j
b20+IHdyb3RlOgoKPiA+ID4gKyAgIHBjdHJsLT5pb19wZF9yZWcgPSBkZXZtX3BsYXRmb3JtX2lv
cmVtYXBfcmVzb3VyY2UocGRldiwgMSk7Cj4gPiA+ICsgICBpZiAoSVNfRVJSKHBjdHJsLT5pb19w
ZF9yZWcpKQo+ID4gPiArICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwY3RybC0+aW9fcGRfcmVn
KTsKPiA+ID4gKwo+ID4gPiArICAgcGN0cmwtPnJlZ21hcF9hcGJjID0KPiA+ID4gKyAgICAgICAg
ICAgc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKG5wLCAic3BhY2VtaXQsYXBi
YyIsIDEsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmcGN0cmwtPnJlZ21hcF9hcGJjX29mZnNldCk7Cj4gPiBDYW4geW91IHNpbXBseSB1c2Ug
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpLCB0aGVuIGRlZmluZQo+ID4gI2RlZmlu
ZSBBUEJDX0FTRkFSICAgICAgICAgICAgMHg1MAo+ID4gI2RlZmluZSBBUEJDX0FTU0FSICAgICAg
ICAgICAgMHg1NAoKPiBJIHRoaW5rIGl0IGp1c3QgYSBtaW5vciBpc3N1ZS4gSSB3aWxsIGtlZXAg
aXQuCj4gQnV0IGlmIGFueW9uZSBlbHNlIHRoaW5rcyB0aGUgc2FtZSB3YXkgYXMgWWl4dW4sIHBs
ZWFzZSBsZXQgbWUga25vdy4KCkl0J3Mgbm90IG1pbm9yIGJlY2F1c2UgaXQgYWRkcyBzdHVmZiB0
byB0aGUgRFQgYmluZGluZyB3ZSBkb24ndCBuZWVkCmFuZCB0aGlzIGF2b2lkcyBpdC4KClBsZWFz
ZSBnbyB3aXRoIFlpeHVuJ3Mgc3VnZ2VzdGlvbi4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
