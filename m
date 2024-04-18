Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDFEC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjbpOQbFEUDuksfLg+5MJPzmI6rlaCvfA73oG1jOgQs=; b=phKrUFFElZckxw
	FSbaDlwELxF6UDmr9PhgabjiJhvrG12hMQzMpbccBqcHQ/YbSkjcImb6oDg1jU0ZoYJshH+qMwgW+
	5QfL3RedsMC7fBSl55B15vj5WPizq5rskPD8LQySwuzDLxNxWFLxyqjNIiCXY4Y5O4loEz5dDYCmT
	LY3ua3V/Ep8FCPZl3F5kcV68jsY/YzPq5zYAChvhsMj6idRe4kpH+Hb1N5LCag6poJMsZsGAWMlQN
	lKimfLl39dDSJWTHKFRssDEu0imzmaTDX6CCWiJnPFJx/oBwJRltpQCzv9WJyRK6Sp4AtqLekXqaQ
	ZBu6yiKDbDhIqjV+NHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSIA-00000002UBj-3NEg;
	Thu, 18 Apr 2024 13:59:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSI7-00000002U9h-0vUf
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:59:08 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so919385b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713448745; x=1714053545; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZO5tEmqpe+L1U/C8UD1PE69dEQv50EfBPcTW8iw+NY=;
        b=jUq7heGDRflU8ohyIQ89mwbozVpRUhpTTOrNBaoAycnbjHgzmgUQAny08lxsvg+E2D
         Z4lQIQR/G2YHIwzsPCb84hRiIFSuoPM/WEixwOHs8Zg5u6pqbuzRw38ELIUuo+VdWHqN
         sCtLjumyGq7OEioeUENzihT6k1JwYBsmyEtyfIwh450jaYGrtnR8G+CE0aCGDHI1vQWy
         Un3aP2iVfDs7d+8IxiCWmaMY6q/ikEhwiIJIgj98qZN0OYw68LO8kuCYPvKQ5ge6aaxS
         NZMU9PLtSolxLwgQsseuvwVEI1+oCvNpKYME9ko2R0vD1GTyBjWpppEGBuuuIZHpfVgE
         o0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713448745; x=1714053545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZO5tEmqpe+L1U/C8UD1PE69dEQv50EfBPcTW8iw+NY=;
        b=pe+3nS7WOtpOnRBiy0Qy94sT68/dRdVPVmd/ym0tAI+ggFXQ6r6biWqGG/M6eD6R+r
         lowWSuIIxjx7VkeGcIHa2/pvBvNvKUN6MtPIYx2iX4axZxFNszsPUHMsIYA7GcnGlIyz
         qQEuFzBKGtyNP0T7xfoTZ2k+rFs67MQHioTtqqdGj5K+QJvplgesH2qkZjZT13xPoGH+
         Gh1r6cyjxsKCxGm7SVXv7ibfPgWawIRcM+AD5rBrLV7biwpA3IbfrLAGa4/BfZPyS72y
         Rmqx5YlaVQIIK9hOflBtfBaijaWtSrRPI4O+vuooN7S6pMbq+Y8me2yNwnlbMMejhAEj
         yoSA==
X-Forwarded-Encrypted: i=1; AJvYcCXwEkol17MmGl8cYL7abZH37xlYgnzklOSpq6e3N38OmjgwuH47g9JW0Tj2GjUE685iqzCZV/XrFcE2/GOrwhMT8rc1pam8N0w3lkHtAQZ/
X-Gm-Message-State: AOJu0YzB/x/nebpcDJdZ9LORNfZh6w4MMaMaXFKQw8YwfFTzZYzGwA0Z
	0/qGaqJXAnZOT7Hbq4oQaCkSEOgk45iDfFK0id2O6MLN3luFwYzR01Uqbxxwh68=
X-Google-Smtp-Source: AGHT+IGUjEe5kgj82Lo/86KEUqPTE4pNtd6avdOYxdh0NqwVwVbNQ8pG380MXUqn5yro6JHyVQnxWQ==
X-Received: by 2002:a05:6a00:8a0f:b0:6ec:da6c:fd69 with SMTP id ic15-20020a056a008a0f00b006ecda6cfd69mr2885160pfb.7.1713448744818;
        Thu, 18 Apr 2024 06:59:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.72])
        by smtp.gmail.com with ESMTPSA id km3-20020a056a003c4300b006eaa21301a7sm1488660pfb.162.2024.04.18.06.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 06:59:04 -0700 (PDT)
Date: Thu, 18 Apr 2024 19:28:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt
 controller support
Message-ID: <ZiEnHtWbT04bXYmP@sunil-laptop>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
 <87a5lqsrvh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5lqsrvh.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_065907_297074_6470A3A4 
X-CRM114-Status: GOOD (  25.53  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDM6NDk6MjJQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+IAo+
ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgYmVsb3cgRUNSIGFwcHJvdmVkIGJ5
IEFTV0cuCj4gPiAxKSBNQURUIC0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xb01H
UHlPRDU4SmFQZ01sMXBLYXNULVZLc0lLaWE3elIvdmlldz91c3A9c2hhcmluZwo+ID4KPiA+IFRo
ZSBzZXJpZXMgcHJpbWFyaWx5IGVuYWJsZXMgaXJxY2hpcCBkcml2ZXJzIGZvciBSSVNDLVYgQUNQ
SSBiYXNlZAo+ID4gcGxhdGZvcm1zLgo+ID4KPiA+IFRoZSBzZXJpZXMgY2FuIGJlIGJyb2FkbHkg
Y2F0ZWdvcml6ZWQgbGlrZSBiZWxvdy4gCj4gPgo+ID4gMSkgUENJIEFDUEkgcmVsYXRlZCBmdW5j
dGlvbnMgYXJlIG1pZ3JhdGVkIGZyb20gYXJtNjQgdG8gY29tbW9uIGZpbGUgc28KPiA+IHRoYXQg
d2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgdGhlbSBmb3IgUklTQy1WLgo+ID4KPiA+IDIpIEFk
ZGVkIHN1cHBvcnQgZm9yIHJlLW9yZGVyaW5nIHRoZSBwcm9iZSBvZiBpbnRlcnJ1cHQgY29udHJv
bGxlcnMgd2hlbgo+ID4gSVJRQ0hJUF9BQ1BJX0RFQ0xBUkUgaXMgdXNlZC4KPiA+Cj4gPiAzKSBU
byBlbnN1cmUgcHJvYmUgb3JkZXIgYmV0d2VlbiBpbnRlcnJ1cHQgY29udHJvbGxlcnMgYW5kIGRl
dmljZXMsCj4gPiBpbXBsaWNpdCBkZXBlbmRlbmN5IGlzIGNyZWF0ZWQgc2ltaWxhciB0byB3aGVu
IF9ERVAgaXMgcHJlc2VudC4KPiA+Cj4gPiA0KSBXaGVuIFBOUCBkZXZpY2VzIGxpa2UgR2VuZXJp
YyAxNjU1MEEgVUFSVCwgaGF2ZSB0aGUgZGVwZW5kZW5jeSBvbiB0aGUKPiA+IGludGVycnVwdCBj
b250cm9sbGVyLCB0aGV5IHdpbGwgbm90IGJlIGFkZGVkIHRvIFBOUCBkYXRhIHN0cnVjdHVyZXMu
IFNvLAo+ID4gYWRkZWQgc2Vjb25kIHBoYXNlIG9mIHBucGFjcGlfaW5pdCB0byBoYW5kbGUgdGhp
cy4KPiA+Cj4gPiA1KSBBQ1BJIHN1cHBvcnQgYWRkZWQgaW4gUklTQy1WIGludGVycnVwdCBjb250
cm9sbGVyIGRyaXZlcnMuCj4gPgo+ID4gVGhpcyBzZXJpZXMgaXMgc3RpbGwga2VwdCBhcyBSRkMg
dG8gc2VlayBmZWVkYmFjayBvbiBhYm92ZSBkZXNpZ24KPiA+IGNoYW5nZXMuIExvb2tpbmcgZm9y
d2FyZCBmb3IgdGhlIGZlZWRiYWNrIQo+ID4KPiA+IENoYW5nZXMgc2luY2UgUkZDIHYzOgo+ID4g
CTEpIE1vdmVkIHRvIF9ERVAgbWV0aG9kIGluc3RlYWQgb2YgZndfZGV2bGluay4KPiA+IAkyKSBQ
TElDL0FQTElDIGRyaXZlciBwcm9iZSB1c2luZyBuYW1lc3BhY2UgZGV2aWNlcy4KPiA+IAkzKSBI
YW5kbGluZyBQTlAgZGV2aWNlcyBhcyBwYXJ0IG9mIGNsZWFyaW5nIGRlcGVuZGVuY3kuCj4gPiAJ
NCkgUmViYXNlZCB0byBsYXRlc3QgbGludXgtbmV4dCB0byBnZXQgQUlBIERUIGRyaXZlcnMuCj4g
Pgo+ID4gQ2hhbmdlcyBzaW5jZSBSRkMgdjI6Cj4gPiAJMSkgSW50cm9kdWNlZCBmd19kZXZsaW5r
IGZvciBBQ1BJIG5vZGVzIGZvciBJUlEgZGVwZW5kZW5jeS4KPiA+IAkyKSBEcm9wcGVkIHBhdGNo
ZXMgaW4gZHJpdmVycyB3aGljaCBhcmUgbm90IHJlcXVpcmVkIGR1ZSB0bwo+ID4gCSAgIGZ3X2Rl
dmxpbmsgc3VwcG9ydC4KPiA+IAkzKSBEcm9wcGVkIHBjaV9zZXRfbXNpKCkgcGF0Y2ggYW5kIGFk
ZGVkIGEgcGF0Y2ggaW4KPiA+IAkgICBwY2lfY3JlYXRlX3Jvb3RfYnVzKCkuCj4gPiAJNCkgVXBk
YXRlZCBwbnBfaXJxKCkgcGF0Y2ggc28gdGhhdCBub25lIG9mIHRoZSBhY3R1YWwgUE5QCj4gPiAJ
ICAgZHJpdmVycyBuZWVkIHRvIGNoYW5nZS4KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MToK
PiA+IAkxKSBBYmFuZG9uZWQgc3dub2RlIGFwcHJvYWNoIGFzIHBlciBNYXJjJ3MgZmVlZGJhY2su
Cj4gPiAJMikgVG8gY29wZSB1cCB3aXRoIEFJQSBzZXJpZXMgY2hhbmdlcyB3aGljaCBjaGFuZ2Vk
IGlycWNoaXAgZHJpdmVyCj4gPiAJICAgcHJvYmUgZnJvbSBjb3JlX2luaXRjYWxsKCkgdG8gcGxh
dGZvcm1fZHJpdmVyLCBhZGRlZCBwYXRjaGVzCj4gPiAJICAgdG8gc3VwcG9ydCBkZWZlcnJlZCBw
cm9iaW5nLgo+ID4gCTMpIFJlYmFzZWQgb24gdG9wIG9mIEFudXAncyBBSUEgdjExIGFuZCBhZGRl
ZCB0YWdzLgo+ID4KPiA+IFRvIHRlc3QgdGhlIHNlcmllcywKPiA+Cj4gPiAxKSBRZW11IHNob3Vs
ZCBiZSBidWlsdCB1c2luZyB0aGUgcmlzY3ZfYWNwaV9uYW1lc3BhY2VfdjEgYnJhbmNoIGF0Cj4g
PiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9xZW11LmdpdAo+ID4KPiA+IDIpIEVESzIgc2hv
dWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSBpbnN0cnVjdGlvbnMgYXQ6Cj4gPiBodHRwczovL2dpdGh1
Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQvUkVBRE1F
Lm1kCj4gCj4gSGkgU3VuaWwsCj4gCj4gSSBzdGFydGVkIHBsYXlpbmcgd2l0aCB5b3VyIHdvcmss
IGFuZCBGWUk6IFVzaW5nIFUtYm9vdCBpbnN0ZWFkIG9mIEVESzIKPiB3b3JrcyBvdXQgb2YgdGhl
IGJveCAod2l0aCBhY3BpLmNvbmZpZyBhZGRlZCB0byBVLWJvb3QpLgo+IAo+IEkgY2hhbmdlZCBt
eSByb290ZnMvYm9vdCB0b29saW5nIGxpa2UgWzFdLCBhbmQgaXQgYm9vdHMuCj4gCj4gKEZvciB0
aG9zZSB3aG8gcHJlZmVyIHdvcmtpbmcgd2l0aCBVLWJvb3QgVUVGSSBpbnN0ZWFkIG9mIEVESzIu
KQo+IAo+IApIaSBCasO2cm4sCgpUaGlzIGlzIGNvb2whLiBJIHdhcyBub3QgYXdhcmUgdGhhdCB1
LWJvb3QgYWxzbyBzdXBwb3J0cyBBQ1BJIG9uClJJU0MtVi4gTWFueSB0aGFua3MhCgpUaGFua3Ms
ClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
