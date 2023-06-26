Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD3EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7eXZbLy30YBAHSxt/I5gLUFwRwkduaR4+sVe9y42gk=; b=NOU7/IPZwZ/Blx
	TNvx/pH4xjfI8WYkw6G4E3Atd4LHGamtPhyNA6b14Dwk1s3mYG2GNuu0yjbipcXoKGrXa0SwqSIEX
	1NDdUjvpUeRfcu/z6GiBEMxnvqa0EY1oX2mOxA9TMqNZDBR8qThOku0fJaqJmKjIoXBHUSTMXxx0S
	ry47NTEpulxrnb2rKuwkFzpH52ioozsU2nFJfN0mWBmTZwgxOI2EitUV9wKkiL9GhcHM3t8c7mp6W
	Z1iYRXjX5mgGdy3F9Oenlu3XRqQHx1WNiOfrmy9mjZJ6BHpUqzu9NV1IumAqJo9/rnCi40LV3rjhN
	B4olXRz1vFwEmkR6qH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDrqz-00Avgf-0J;
	Mon, 26 Jun 2023 19:26:25 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDrqv-00Avg0-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 19:26:23 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f866a3d8e4so5057902e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687807578; x=1690399578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdhf6AU7xFfNbH+mJiJHsGXbFeFQT625rjZDqqOdH3o=;
        b=bgQhc/tr2dOe24OxURwIssbTAW8cinuImIIs4wxHR6Rc7m0aBRrPdrUU7Jb0PV14Of
         H5LAfIJNZdoqSOzMGajcsDrKQNrrYBZEH8wGxi1sH3WiSkjNlD0/vZHRKhZOB6MLINN3
         HiKYxu/V+NkQQNGeIellk1sTw1t4NZp/8z2MRdlaOlzQZDAhYuxh9EnitqS0eQ0dTRuG
         pbhNH+1jx3H+tdIX8yhkaYetXbqO+GiOAHbpYGmdXkTIacwcyRW3D8hzwpxAf8bPsi+Z
         OOk9/xOz7ut8bYdvDV8GohEmgVSYbepXzPgadEf37nFtZ+5LrxZavKr+e1X30LyhQlAl
         hY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687807578; x=1690399578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdhf6AU7xFfNbH+mJiJHsGXbFeFQT625rjZDqqOdH3o=;
        b=dC69JYwODY3c1B0G6oEPgV4BSp7nmFr6kfaVxykYtfSP8eHDOlh8NE4Jp6ZaNSrjl6
         9hT5dToUHyLwJsN67nZaUXQBRV02u+RJvEU10DyPlFmCyxPv03Lr42KyyRMwmL8Kek2P
         PvOGYt58PYCS0fCLhIVe8Cw6XJGTZVDMxd2GvdDPL68wPUSpY9G+5YWtY2bpvo31LaXi
         oES4uCzxEC2fWg6keKNtL1fO818f2WZ0rioPmVeX0wJ1s/Vq721sOREq563Jrhja0B5e
         KzEVhM13KbDpaYvSs35EvGEZDeACzOWQYSVdd0qweR3ZqWUvmlcfDwYild9vuCIMaJJa
         4iuA==
X-Gm-Message-State: AC+VfDw9Mf1IAtZFIbxlkkaA601QFO0Qm6G8+zH9GZtVMKIlGTq8P0zN
	cFWBL1KE0yQFUmgojHJ3TlLH7HH7Xx23wctm8YzkKQ==
X-Google-Smtp-Source: ACHHUZ4k70aHHQYBZk12ajsNjQus+hTZHIiTLLotn416SbSKOwhRtCLRw3mxXJt91UCR61iwRgGJbhf+2GPBiHpZSUw=
X-Received: by 2002:a05:6512:280b:b0:4fb:2c1e:4e03 with SMTP id
 cf11-20020a056512280b00b004fb2c1e4e03mr3277813lfb.32.1687807578527; Mon, 26
 Jun 2023 12:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222353.3742384-1-evan@rivosinc.com> <20230624-mortally-parking-68f6bc1dd5ee@spud>
In-Reply-To: <20230624-mortally-parking-68f6bc1dd5ee@spud>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 26 Jun 2023 12:25:42 -0700
Message-ID: <CALs-HstvXcwBa+h0u4mz_Pjm-bNd=9DX49Xy-=Fq0t3ECmAi2w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_122621_810822_13C93C0F 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNToxMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXkgRXZhbiwKPgo+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0
IDAzOjIzOjUzUE0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiBJbiAvcHJvYy9jcHVpbmZv
LCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB3ZSBzaG93IGZvciBlYWNoIHByb2Nlc3NvciBpcwo+
ID4gc3BlY2lmaWMgdG8gdGhhdCBoYXJ0OiBtYXJjaGlkLCBtdmVuZG9yaWQsIG1pbXBpZCwgcHJv
Y2Vzc29yLCBoYXJ0LAo+ID4gY29tcGF0aWJsZSwgYW5kIHRoZSBtbXUgc2l6ZS4gQnV0IHRoZSBJ
U0Egc3RyaW5nIGdldHMgZmlsdGVyZWQgdGhyb3VnaCBhCj4gPiBsb3dlc3QgY29tbW9uIGRlbm9t
aW5hdG9yIG1hc2ssIHNvIHRoYXQgaWYgb25lIENQVSBpcyBtaXNzaW5nIGFuIElTQQo+ID4gZXh0
ZW5zaW9uLCBubyBDUFVzIHdpbGwgc2hvdyBpdC4KPiA+Cj4gPiBOb3cgdGhhdCB3ZSB0cmFjayB0
aGUgSVNBIGV4dGVuc2lvbnMgZm9yIGVhY2ggaGFydCwgbGV0J3MgcmVwb3J0IElTQQo+ID4gZXh0
ZW5zaW9uIGluZm8gYWNjdXJhdGVseSBwZXItaGFydCBpbiAvcHJvYy9jcHVpbmZvLgo+Cj4gTm8s
IHlvdSBjYW4ndCBkbyB0aGlzIGFzIGl0IGJyZWFrcyB0aGUgYXNzdW1wdGlvbnMgb2YgdXNlcnNw
YWNlIHRoYXQKPiB0aGlzIHNob3dzIHRoZSBzZXQgc3VwcG9ydGVkIGFjcm9zcyBhbGwgaGFydHMu
Cj4gU29ycnksIGJ1dCBOQUsuCgpNeSBob3BlIHdhcyB0aGF0IHdlIHdlcmUgc3RpbGwgZWFybHkg
ZW5vdWdoIHRoYXQgbm8gcHJvZHVjdGlvbiBzeXN0ZW1zCmV4aXN0ZWQgKHlldCkgdGhhdCBhY3R1
YWxseSBoYWQgZGlmZmVyZW50IElTQSBleHRlbnNpb25zIGluIHRoZSBzZXQgd2UKdHJhY2ssIGFu
ZCB0aGVyZWZvcmUgdXNlcm1vZGUgd291bGQgaGF2ZSBiZWVuIHVuYWJsZSB0byBtYWtlIHRob3Nl
CmFzc3VtcHRpb25zIGF0IHRoaXMgcG9pbnQuIElmIHN1Y2ggYSBzeXN0ZW0gZXhpc3RzLCBhbmQg
SSBkb24ndCBrbm93CmlmIGl0IGRvZXMgb3Igbm90LCB0aGVuIEkgYWdyZWUgaXQncyB0b28gbGF0
ZSB0byBtYWtlIGEgY2hhbmdlIGxpa2UKdGhpcy4KCkkgdGhvdWdodCBJJ2QgcHV0IHRoaXMgb3V0
IGhlcmUgYW5kIHNlZSBpZiBzb21lb25lIGNvdWxkIHBvaW50IGF0IHN1Y2gKYSBzeXN0ZW07IGJ1
dCBpZiBub3QgaXQnZCBiZSBncmVhdCB0byBrZWVwIC9wcm9jL2NwdWluZm8gYWNjdXJhdGUgYW5k
CmNvbnNpc3RlbnQgd2l0aCBod3Byb2JlICh3aGljaCBkb2VzIHJldHVybiBhY2N1cmF0ZSBwZXIt
aGFydCBJU0EKZXh0ZW5zaW9uIGluZm8pLgoKLUV2YW4KCj4KPiBDaGVlcnMsCj4gQ29ub3IuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
