Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AA8C87FCB
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 01:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1hvoqnDQ0w6ahb6XX4ti9ydIf5SX4yn8ELulpT8NdJI=; b=Pug7l8fGPhRVXEBDiy8ZxmxjZf
	nQ5uOc+4f/Dzu9HAkvIBzoV8XCiIS8ET5Fh9jprQMWCmXVDt+MFz6DttZx9NXOdNhN+C7Rs/2RjKZ
	nOcrM9R3IjvQLSzH7cYmn8AcGT9JP819hp2he9wh/UX+OcT2frcjJb7xoUIGZPo1mRrwAxn+/eiHc
	ywOs8x4D/lORyKZMDWPJPlJx0JoN2I1I5Ge+mOSK38Sy9Dxo2eEB/WDhaU3hrDE8CtU8QA+jZKGss
	Fmi/EVVWSCCdG4pBL6v4Dyf16qAaS6svQ92tKNEs7qHYhD9H0tbfVGlnyQtTUPTmKTUFVYx2qjC2b
	G6/veKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHkG-00000002h8x-3bJt;
	Thu, 31 Jul 2025 01:06:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHkA-00000002h89-0mdf
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 01:06:08 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4209a0d426so437125a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Jul 2025 18:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1753923961; x=1754528761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdyh6VXwkAfvxERUzBdY6UfC1oO6pBpGRvc13yyypPY=;
        b=SSqptUnvAvsQSTKwjfXgoIZX/rRCgvik0QJB3XOZt0abgwE5y2DuY37vzTmPw3CKQj
         LIeQ77riAmY6fG20KEzmVcKPw3FxVJOiGEg8rcslgARoBYzeA0pHeSnRiTE9jpPCx0sZ
         McOCxOuhsTlryB0rNstk+tvULQQPI/730teJb9HfgjLjWohGGFYzvrF8o0EUa690em++
         8iWBB5NSkjNHCZWEauie6ImbVANDUU9lxX6thJDxk7UaDveffv2ge/R5E1+2Ql+70oES
         yWVVcJvpElTpB8ZpVIrEtl/eGMa5NKGM9Mz047BqgFxgvc+9MnxfuiImZPvYHpuoHMly
         M/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753923961; x=1754528761;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdyh6VXwkAfvxERUzBdY6UfC1oO6pBpGRvc13yyypPY=;
        b=UvGOaV1alNmOKvLUmStdXXyIPKg20HoXcnpg6fH3Vcq+YEarv3oPljkf0ERbAFAJq0
         zf2yD2EskdZi6FVA+cUdbzu6ko9sNz6Rstp21bhULp8qJqYd0vgMYX0VnRn8J7MOmrtg
         c7e4BvczxQ1RVLqOT7OPK7uwNrrTuaZpmzMnycJAfPS0V2IAJosvx4bD2z7CH3p8S0Mi
         /B1qZhHHGZfTgXVFlEyPQAE8gepTuQXgNYLtRyJVXY2fEdwAHxo6ZuZdwc4NNV2fSJ5C
         +jErAkRKeFKxK+fypd8Y4wYS0CwkA1AjNxEN4Q8SAWur6GUrSYTkoa0LyXN2KCH8uGA5
         HL2g==
X-Forwarded-Encrypted: i=1; AJvYcCVydRg3qeCTuubg4ASB7OAWvhqio+5SBJ3fd6C2BbDQhtJlxb0GiczwA1PO08mpnDIf2Aa1MUAFUBPcHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWn2s4x/eMFlBR/MKydR4cOox/UJptFmVE4jev1oF/lHQmkbVw
	a2Oea15x/M81xeIzIZIhe54DbkJqf1uxmVYHtcx92GUsuJtiGwlU0LzPqc8Wgvn/FKI=
X-Gm-Gg: ASbGnctlvZ7CPBUeDkaAMsAWirRhmJAKEB83EqLh70qz9A620Z//W0A7T5nBNp04do1
	XE5h/iVuHxFHxjaQABhrxK2Ky+DhweSMyZ1kOy2HXXyVt8UOHgYd9jD87aF48BjEO6qL+n+ZMIM
	aocXo+SgCTVrrNs3cFbB9CbIASYIkTaQpLmiVNTJbpVmVV2XpCFMdxxda9BAT0OiWdskgO+8Z51
	hrw5KR4O9pLmPMGxEQV2/nlW9oCtaJQA1rrVHxbwtvVyE0jFSuC8wonF7lUKKTBGKJjc5ugfEw/
	Aj922uS2JKXfllyKcG8bk590tdFZ+13d/v+qvLSjgp80yIMowhzVOwXQ5MUWJRXyKk0YBs0fXms
	V2/kVIk4HjPE8BYh5ljFM0LAAnbPFLEr6oiH95Hsg78BGFA==
X-Google-Smtp-Source: AGHT+IFb66tbhTzdTWT9ySJpwp5cY+LGlbPQQrJtDC5ft56L8OAOgN+oAeGIQ0FHVWx/yxVsrp5u7w==
X-Received: by 2002:a17:90b:388a:b0:313:fb08:4261 with SMTP id 98e67ed59e1d1-31f5de7b6c6mr6417950a91.32.1753923960683;
        Wed, 30 Jul 2025 18:06:00 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31f63f0cb39sm3076891a91.30.2025.07.30.18.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 18:05:59 -0700 (PDT)
Date: Wed, 30 Jul 2025 18:05:59 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jul 2025 18:02:07 PDT (-0700)
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during syscall
In-Reply-To: <DBHTIDY0HRM0.2B8L1WG7IBCXM@ventanamicro.com>
CC: fustini@kernel.org, Bjorn Topel <bjorn@rivosinc.com>,
  Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, samuel.holland@sifive.com,
  dfustini@tenstorrent.com, andybnac@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv-bounces@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rkrcmar@ventanamicro.com
Message-ID: <mhng-E49DDC7D-A330-4626-A122-4146AADDBB33@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_180602_334878_9473187C 
X-CRM114-Status: GOOD (  32.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMSBKdWwgMjAyNSAwNzo1NDoyNSBQRFQgKC0wNzAwKSwgcmtyY21hckB2ZW50YW5h
bWljcm8uY29tIHdyb3RlOgo+IDIwMjUtMDctMjFUMTQ6MzU6MzgrMDI6MDAsIFJhZGltIEtyxI1t
w6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPjoKPj4gU2hvdWxkbid0IHRoZSBSSVNDLVYg
TGludXggc3lzY2FsbCBBQkkgYmUgZGVmaW5lZCBzb21ld2hlcmU/Cj4KPiBUbyBjbGFyaWZ5IHRo
aXMgcG9pbnQuICBNeSBpc3N1ZSBpcyB3aXRoIHRoZSBmb2xsb3dpbmcgcGFydCBpbgo+IERvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi92ZWN0b3IucnN0Ogo+Cj4+PiAgQXMgaW5kaWNhdGVkIGJ5IHZl
cnNpb24gMS4wIG9mIHRoZSBWIGV4dGVuc2lvbiBbMV0sIHZlY3RvciByZWdpc3RlcnMgYXJlCj4+
PiAgY2xvYmJlcmVkIGJ5IHN5c3RlbSBjYWxscy4KPj4+ICBbLi4uXQo+Pj4gIDE6IGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi9yaXNjdi12LXNwZWMvYmxvYi9tYXN0ZXIvY2FsbGluZy1jb252ZW50
aW9uLmFkb2MKPgo+IFRoZSBJU0EgZG9lcyBub3Qgc2F5IHRoYXQgdmVjdG9yIHJlZ2lzdGVycyBh
cmUgY2xvYmJlcmVkIGJ5IHN5c3RlbQo+IGNhbGxzLiAgQWxsIHRoZSBJU0Egc2F5cyBpczoKPgo+
ICAgIlRoaXMgQXBwZW5kaXggaXMgb25seSBhIHBsYWNlaG9sZGVyIHRvIGhlbHAgZXhwbGFpbiB0
aGUgY29udmVudGlvbnMKPiAgICB1c2VkIGluIHRoZSBjb2RlIGV4YW1wbGVzLCBhbmQgaXMgbm90
IGNvbnNpZGVyZWQgZnJvemVuIG9yCj4gICAgcGFydCBvZiB0aGUgcmF0aWZpY2F0aW9uIHByb2Nl
c3MuICBUaGUgb2ZmaWNpYWwgUklTQy1WIHBzQUJJIGRvY3VtZW50Cj4gICAgaXMgYmVpbmcgZXhw
YW5kZWQgdG8gc3BlY2lmeSB0aGUgdmVjdG9yIGNhbGxpbmcgY29udmVudGlvbnMuIgoKSXQgYWxz
byBzYXlzCgogICAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2VzIGFsbCBjYWxsZXItc2F2
ZWQgdmVjdG9yIHJlZ2lzdGVycyAKICAgICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFydCB0
byBiZWNvbWUgdW5zcGVjaWVkLgoKaW4gdGhlIElTQSBtYW51YWwsIGEgZmV3IHNlbnRlbmNlcyBs
YXRlciBpbiB0aGF0IHBhZ2UuICBTbyB0aGF0J3Mgd2hhdCAKd2Ugd2VyZSB0cnlpbmcgdG8gZ2V0
IGF0IHdpdGggdGhlIGRvY3VtZW50YXRpb24gcG9pbnRlciwgYnV0IG1heWJlIGl0J3MgCmJldHRl
ciB0byBoYXZlIHNvbWV0aGluZyBtb3JlIGV4cGxpY2l0IGxpa2UKCiAgICBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZlY3Rvci5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvdmVjdG9yLnJzdAogICAgaW5kZXggMzk4N2Y1Zjc2YTlkLi5lODU5MTY2MGE3YmIgMTAw
NjQ0CiAgICAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvdmVjdG9yLnJzdAogICAgKysr
IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZlY3Rvci5yc3QKICAgIEBAIC0xMzQsNyArMTM0
LDEwIEBAIHByb2Nlc3NlcyBpbiBmb3JtIG9mIHN5c2N0bCBrbm9iOgogICAgIDMuICBWZWN0b3Ig
UmVnaXN0ZXIgU3RhdGUgQWNyb3NzIFN5c3RlbSBDYWxscwogICAgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgCiAgICAtQXMgaW5kaWNhdGVkIGJ5IHZl
cnNpb24gMS4wIG9mIHRoZSBWIGV4dGVuc2lvbiBbMV0sIHZlY3RvciByZWdpc3RlcnMgYXJlCiAg
ICAtY2xvYmJlcmVkIGJ5IHN5c3RlbSBjYWxscy4KICAgICtMaW51eCBhZG9wdHMgdGhlIHN5c2Nh
bGwgQUJJIHByb3Bvc2VkICBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgViBleHRlbnNpb24gWzFdLAog
ICAgK3doZXJlIHZlY3RvciByZWdpc3RlcnMgYXJlIGNsb2JiZXJlZCBieSBzeXN0ZW0gY2FsbHMu
ICBTcGVjaWZpY2FsbHkKICAgICsKICAgICsgICAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1
c2VzIGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwogICAgKyAgICAodjAtdjMxLCB2
bCwgdnR5cGUpIGFuZCB2c3RhcnQgdG8gYmVjb21lIHVuc3BlY2llZC4KICAgIAogICAgIDE6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi12LXNwZWMvYmxvYi9tYXN0ZXIvY2FsbGluZy1j
b252ZW50aW9uLmFkb2MKCj4gd2hpbGUgdGhlIFJJU0MtViBwc0FCSSBzYXlzOgo+Cj4gICAiVGhl
IGNhbGxpbmcgY29udmVudGlvbiBmb3Igc3lzdGVtIGNhbGxzIGRvZXMgbm90IGZhbGwgd2l0aGlu
IHRoZQo+ICAgIHNjb3BlIG9mIHRoaXMgZG9jdW1lbnQuIFBsZWFzZSByZWZlciB0byB0aGUgZG9j
dW1lbnRhdGlvbiBvZiB0aGUKPiAgICBSSVNDLVYgZXhlY3V0aW9uIGVudmlyb25tZW50IGludGVy
ZmFjZSAoZS5nIE9TIGtlcm5lbCBBQkksIFNCSSkuIgo+Cj4gV2UgbWFkZSBhIGNpcmN1bGFyIGRl
cGVuZGVuY3ksIG1pc2ludGVycHJldGVkIHRoZSBJU0EsIGFuZCBwcm9iYWJseQo+IGltcGxlbWVu
dGVkIGEgc3Vib3B0aW1hbCBzeXNjYWxsIEFCSSAtLSBwcmVzZXJ2aW5nIHZlY3RvciByZWdpc3Rl
cnMKPiBzZWVtcyBzdHJpY3RseSBiZXR0ZXIuCgpXZSdkIHJlYWxseSBuZWVkIHVzZXJzcGFjZSB0
byBoYXZlIGFuIEFCSSB0aGF0IHByZXNlcnZlcyB2ZWN0b3IgCnJlZ2lzdGVycyBmb3IgaXQgdG8g
YmUgdXNlZnVsIGluIHRoZSBrZXJuZWwuICBBcyBpdCBzdGFuZHMgdGhlcmUncyAKcHJldHR5IG11
Y2ggbm90aGluZyB0aGF0J3MgZ29pbmcgdG8gaGF2ZSB1c2VmdWwgdmVjdG9yIHN0YXRlIG92ZXIg
YSAKc3lzY2FsbCwgYXMgdGhleSdyZSBhbG1vc3QgYWx3YXlzIGhpZGRlbiBiZWhpbmQgc29tZSBD
IGZ1bmN0aW9uIGFuZCAKdGhvc2UgY2xvYmJlciB0aGUgdmVjdG9yIHN0YXRlLiAgSSBoYXZlIGEg
cGF0Y2ggb3V0IGZvciBHQ0MgdGhhdCBlbmFibGVzIAphIHN5c3RlbS13aWRlIHZlY3RvciBBQkks
IGJ1dCBJIGRvbid0IGhhdmUgdGltZSB0byB0ZXN0L2JlbmNobWFyayBpdCBzbyAKaXQncyBraW5k
IG9mIGhhcmQgdG8ganVzdGlmeS4KClRoYXQgc2FpZDoKCk15IGZpcnN0IGd1ZXNzIGhlcmUgd291
bGQgYmUgdGhhdCB0cmFzaGluZyB0aGUgViByZWdpc3RlciAKc3RhdGUgaXMgc3RpbGwgZmFzdGVy
IG9uIHRoZSBtYWNoaW5lcyB0aGF0IHRyaWdnZXJlZCB0aGlzIHBhdGNoLCBpdCdzIApqdXN0IHRo
YXQgdGhlIHdheSB3ZSdyZSB0cmFzaGluZyBpdCBpcyBzbG93LiAgV2UncmUgZG9pbmcgc29tZSB3
YWNreSAKdGhpbmdzIGluIHRoZXJlIChWSUxMLCBMTVVMLCBjbGVhcmluZyB0byAtMSksIHNvIGl0
J3Mgbm90IHN1cnByaXNpbmcgCnRoYXQgc29tZSBpbXBsZW1lbnRhdGlvbnMgYXJlIHNsb3cgb24g
dGhlc2Ugcm91dGluZXMuCgpUaGlzIGNhbWUgdXAgZHVyaW5nIHRoZSBvcmlnaW5hbCBwYXRjaCBh
bmQgd2UgZGVjaWRlZCB0byBqdXN0IGdvIHdpdGggCnRoaXMgd2F5ICh3aGljaCBpcyByZWNvbW1l
bmRlZCBieSB0aGUgSVNBKSB1bnRpbCBzb21lb25lIGNvdWxkIApkZW1vbnN0cmF0ZSBpdCdzIHNs
b3csIHNvIHNvdW5kcyBsaWtlIGl0J3MgdGltZSB0byBnbyByZXZpc2l0IHRob3NlLiAgCgpTbyBJ
J2Qgc3RhcnQgd2l0aCBzb21ldGhpbmcgbGlrZQoKICAgIGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAog
ICAgaW5kZXggYjYxNzg2ZDQzYzIwLi4xZmJhMzNlNjJkMmIgMTAwNjQ0CiAgICAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCiAgICArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCiAgICBAQCAtMjg3LDcgKzI4Nyw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQodm9pZCkKICAgICAgICAgICAgICAgICAgICAidm12LnYu
aSAgICAgICAgdjgsIC0xXG5cdCIKICAgICAgICAgICAgICAgICAgICAidm12LnYuaSAgICAgICAg
djE2LCAtMVxuXHQiCiAgICAgICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYyNCwgLTFc
blx0IgogICAgLSAgICAgICAgICAgICAgICJ2c2V0dmwgICAgICAgICAlMCwgeDAsICUxXG5cdCIK
ICAgICAgICAgICAgICAgICAgICAiLm9wdGlvbiBwb3Bcblx0IgogICAgICAgICAgICAgICAgICAg
IDogIj0mciIgKHZsKSA6ICJyIiAodnR5cGVfaW52YWwpKTsKCnRvIHRyeSBhbmQgc2VlIGlmIHdl
J3JlIHRyaXBwaW5nIG92ZXIgYmFkIGltcGxlbWVudGF0aW9uIGJlaGF2aW9yLCBpbiAKd2hpY2gg
Y2FzZSB3ZSBjYW4ganVzdCBoaWRlIHRoaXMgYWxsIGluIHRoZSBrZXJuZWwuICBUaGVuIHdlIGNh
biBzcGxpdCAKb3V0IHRoZXNlIHBlcmZvcm1hbmNlIGlzc3VlcyBmcm9tIG90aGVyIHRoaW5ncyBs
aWtlIGxhenkgc2F2ZS9yZXN0b3JlIAphbmQgYSBWLXByZXNlcnZpbmcgdUFCSSwgYXMgaXQgc3Rh
bmRzIHRoaXMgaXMgYWxsIHNvcnQgb2YgZ2V0dGluZyBtaXhlZCAKdXAuCgo+PiBIb3cgY29tZSB3
ZSBjb3VsZCBoYXZlIGJyb2tlbiBpdCB3aXRoIDk2NTdlOWI3ZDI1Mz8KPgo+IFdlIGNoYW5nZWQg
dGhlIEFCSSBvbmNlLCBzbyBtYXliZSB3ZSBjYW4gY2hhbmdlIGl0IGJhY2s/CgpXZSBkaWRuJ3Qg
Y2hhbmdlIHRoZSBBQkksIHRoZSBkb2N1bWVudGF0aW9uIGFsd2F5cyBzYWlkICJ2ZWN0b3IgcmVn
aXN0ZXJzIGFyZQpjbG9iYmVyZWQgYnkgc3lzdGVtIGNhbGxzIi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
