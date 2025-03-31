Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9122C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYcoPEJ4LgH+0u5fDdFpjcT8Gdq+I3d9jDSg03mkq+M=; b=HOq5K2XzGPAVkD
	RsNt+EZZ3orP2ZTmxjoT3VuN+5yNH0rCQImvssSpkOO5spKTHWgdkUg3BdeTF5PcCU5/r4f8CAiGi
	FTyvFAVDBOdIOJt9YVg1HZu2WBOWYCmelnhGrBwnUOSAXFpVOznpXuExi2MePRlbUoZb7U+prZPmc
	KhloOdNtR6NhL5pyuHIrTEKCcSoslLa6c3dh5LIaE0Rs1yz9hRkDtK3AY8XISgcE7O1UhPKIvkmoR
	qR+3V/5Dnc4fM96So0BwwhksBW0OH/mo/2Gcrft8tkn4t8pcUSHqLb9/TfZIqNMQuE2WIABe504VX
	CcJeVQjPeNlzBq+BhBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFxl-00000000WyD-3MnI;
	Mon, 31 Mar 2025 14:18:05 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFv3-00000000WZ4-2o1O
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 14:15:19 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c08fc20194so889622985a.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1743430516; x=1744035316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uilIRFs2fkU4eR9GAFrL/1p6PHfB3ZqJuGaH9P0XKJQ=;
        b=F1nzBoVLhh8xVYN24OV8kNZafDysIBfB5bIY8gsJzZ7fCt5Gl4DlR0gz2xXlNoJKA9
         u3k+VBYEsBAVggTY+wxxCJYgIyka1BhTjryZnSxYUTwVQ4tTcAXhAjfUUp8MVbFTNy2/
         1Cv2VaCZ2lnMeZqh1nqzB+ILZ2Gbk0it/wKCPlpuCOtTwZZ9FHAYXsWP10xkUCRJSvBm
         NxcOoJZDG7Uarv8fSRyzr5Gy66bz7ioekxjIlHv7As8OAWpktq9J3xTmCZoHE/GEPtbI
         iKWFMt0VS5GPEZTXWs6cIFN4v39c2SJyjF3dyqUyLviT4lVrmSGHR9w5c5VW8kypNdVa
         zFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430516; x=1744035316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uilIRFs2fkU4eR9GAFrL/1p6PHfB3ZqJuGaH9P0XKJQ=;
        b=OzzFrjLcpcIVC6zNH65QrjXFr1gW0eKuWVvvnkitX7oiKbGs8q74F4p1QbX/luUpmH
         TbVpUV9vdhv7VnmVm4B8Sa0P8otUBfTGjLabS/Rwe1DMy/w08+JuclVgb8Ct/EC7LKpV
         OXjpzGV8kkauScBxHFAEmF5O7+KEn0xXm90orPPJvoTX6qOpfc7Z04abbX+qgoLuPnQW
         GT9XzHPsUugznIgyW8WeWPU7kqxX7Gyk93AmDu5uMFGjMgoS7K3kW+XUMPjm97/l7Fyb
         f6ci3m0gpDb5kY8w1p1tiQgTlQ2R32mPCL5yvGNJacy3/wDWFn8ASBpvXfonzINj+05O
         8l+A==
X-Forwarded-Encrypted: i=1; AJvYcCXlmhULcboz99tBidntM2XNJIBKdtFA39x2/zmMuzl5ph/kVDcSgCa5exOk/m7x6RwU4BqMHMZtcr/GfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx63ZTp1MAktPqPz+ZEGm8ti6LBqBe4+QKR5FMv6pSSBU3j+ncs
	o8bbvSrqr/85flQ/UdNLaoTjKaasOdSBkOmL8bmZ9uhflZt91fWa5wKNgXcPJBmEE2A/QgIh1gH
	Ag7lPuqQdWIwozhfc2mEoQuZV+Jj2jwNaNvWFcg==
X-Gm-Gg: ASbGncu6fyfFhX7kKcnpLzqpnskDiG8JgT36F2TStqbCJZ/w0M2AyPdV91ecJYVswxS
	IfPtO3CYvJI9OfB4H2YQZDePkVxC17n0GPcPwMC87SwalXH61k5Nu344YW9yO/tcnrlNki+674Q
	rDs9RtrzJFsm1j9/m+jofanYDGXECW
X-Google-Smtp-Source: AGHT+IHwKPuhE0mLVpPOzEfJh1Mnr0mMmPaWzdIwh1+ajVxJybRw9uFP9nUtH4E5/UPKuBrBWXEXNN4JNzUBzRRwv0Q=
X-Received: by 2002:a05:620a:454b:b0:7c5:3e22:616f with SMTP id
 af79cd13be357-7c69071e2c0mr1334826685a.21.1743430516023; Mon, 31 Mar 2025
 07:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk_j1ZnJ+=XQ_geN1sXMaye=P4jk-vduwj0-1soM7d+wQw@mail.gmail.com> <ktmanz3mufxvme3gspm46p7vyjxsmzfxckqxg2e5a2mbqc5pxe@uc56iqoryuzr>
In-Reply-To: <ktmanz3mufxvme3gspm46p7vyjxsmzfxckqxg2e5a2mbqc5pxe@uc56iqoryuzr>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 31 Mar 2025 22:15:04 +0800
X-Gm-Features: AQ5f1Jrt8kMW7N7ZEfeyIa8owbZaaEs8PpD6g-s-CGlZi-isOIhZl7S-Ol9dZ94
Message-ID: <CAHh=Yk8jNbhYp3goxu3zvdatz_tivcK_JocvFXDRL2ZCKELAag@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_071517_719078_9121D0E4 
X-CRM114-Status: GOOD (  23.31  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI1
5bm0M+aciDI45pelIOmAseS6lCDkuIvljYg2OjI35a+r6YGT77yaCj4KPiBPbiBGcmksIE1hciAy
OCwgMjAyNSBhdCAwNTo0MTozN1BNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gICogKFQp
IHBlcmlvZC4KPiA+ID4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIGlzIHB1bHNlICJpbmFjdGl2ZSIg
dGltZSBzbyB3ZSBuZWVkIHRvIGludmVydCBpdC4KPiA+ID4KPiA+ID4gSSdtIHRyeWluZyB0byB1
bmRlcnN0YW5kIHRoYXQuIFlvdSdyZSBzYXlpbmcgdGhhdCB0aGUgUFdNQ01QIHJlZ2lzdGVyCj4g
PiA+IGhvbGRzIHRoZSBpbmFjdGl2ZSB0aW1lLiBMb29raW5nIGF0IHRoZSBsb2dpYyBkaWFncmFt
IChGaWd1cmUgMjkpIG9mCj4gPiA+ICJTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWwgdjFwNiIgdGhh
dCBpcyBiZWNhdXNlIHB3bXMgaXMgZmVlZCBpbnRvIHRoZQo+ID4gPiBjb21wYXJhdG9yIGFmdGVy
IGdvaW5nIHRocm91Z2ggdGhhdCBYTk9SIHdoZXJlIHRoZSBsb3dlciBpbnB1dCBpcyBhbHdheXMK
PiA+ID4gMCAoYXMgcHdtY21wWGNlbnRlciBpcyBhbHdheXMgMCkgYW5kIHNvIGVmZmVjdGl2ZWx5
IGNvdW50cyBiYWNrd2FyZHMsCj4gPiA+IHJpZ2h0Pwo+ID4gPiBJbiB0aGF0IGNhc2UgdGhlIHNl
bnRlbmNlICJUaGUgb3V0cHV0IG9mIGVhY2ggY29tcGFyYXRvciBpcyBoaWdoCj4gPiA+IHdoZW5l
dmVyIHRoZSB2YWx1ZSBvZiBwd21zIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byB0aGUgY29y
cmVzcG9uZGluZwo+ID4gPiBwd21jbXBYLiIgZnJvbSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIENv
bXBhcmUgUmVnaXN0ZXJzIGlzIHdyb25nLgo+ID4gPgo+ID4gSGkgVXdlLCBJJ3ZlIGNvbnRhY3Rl
ZCB0aGUgc3BlYydzIGF1dGhvciwgYW5kIGhlIGlzIHdpbGxpbmcgdG8gY29ycmVjdAo+ID4gdGhl
IHNwZWMtcmVsYXRlZCBlcnJvci4KPiA+Cj4gPiBCYXNlZCBvbiB5b3VyIHN1Z2dlc3Rpb25zLCBJ
IHRoaW5rIHdlIGhhdmUgdHdvIGFwcHJvYWNoZXMKPiA+IDEuIEZpcnN0IGFkZCBjb21tZW50cyBl
eHBsYWluaW5nIHdoZXJlIHRoZSBzcGVjIGFuZCBpbXBsZW1lbnRhdGlvbgo+ID4gZG9uJ3QgbWF0
Y2gsIHRoZW4gYWZ0ZXIgdGhlIHNwZWMgaXMgY29ycmVjdGVkLCBzdWJtaXQgYW5vdGhlciBwYXRj
aCB0bwo+ID4gcmVtb3ZlIHRoZSBjb21tZW50cwo+ID4gMi4gTm8gbmVlZCB0byBhZGQgdGhpcyBl
cnJvciBleHBsYW5hdGlvbiBwYXJ0LCBiZWNhdXNlIHRoZSBzcGVjIHdpbGwKPiA+IGJlIGNvcnJl
Y3RlZCBsYXRlci4KPiA+Cj4gPiBJIGRvbid0IGhhdmUgYSBwcmVmZXJlbmNlLCBzbyBJIHdhbnRl
ZCB0byBjaGVjayB3aXRoIHlvdSAtIGRvIHlvdSBsZWFuCj4gPiBtb3JlIHRvd2FyZCBvcHRpb24g
MSBvciBvcHRpb24gMgo+Cj4gSSB3b3VsZCBnbyBmb3IgMSwgbWVudGlvbmluZyB0aGUgdmVyc2lv
biBvZiB0aGUgYnJva2VuIGRvY3VtZW5hdGF0aW9uCj4gYW5kIHRoZSBleHBlY3RhdGlvbiB0aGF0
IHRoaXMgd2lsbCBiZSBmaXhlZCBpbiBsYXRlciByZXZpc2lvbnMuIFNvIHRoZXJlCj4gaXMgbm8g
Y29uZnVzaW9uIHdoZW4gdGhlIGRvY3VtZW5hdGF0aW9uIGlzIGZpeGVkIGJ1dCB0aGUgY29tbWVu
dHMgbm90Cj4gcmVtb3ZlZCB5ZXQuCkhpIFV3ZSwgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2sKCkkg
dW5kZXJzdGFuZC4gSSdsbCBwcm9jZWVkIHdpdGggb3B0aW9uIG9uZSB0byBoYW5kbGUgdGhlIHBh
dGNoIGZvciB0aGUKbmV4dCB2ZXJzaW9uLgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
