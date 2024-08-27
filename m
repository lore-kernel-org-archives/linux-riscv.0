Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6F1C54731
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rIy5AvoeHHrNmhmMuDoN5OiHe3U4vLiKuf025B+WKw=; b=ofecjIzizAcKa5
	Px84n8RVy84sRrQ7WY5ctL+03qZrKCChAOl8d0mr8Bhs3nXGQ/N7A7cAVizWOc3v6Xsg5vtY5e7UJ
	m1XKBpT1fSqTxHkmJTBMxUqWccI+YGnP1Uk/pB7+ImcV/VLSwMixX2IkAKRDdymXFF8zVGLgMTRm1
	74LVnPsGurUP29OwO1YqlKYxIfyguv2/2BNeQN+FmLFosqxEk5JsamaSMaDoj1OJgq8cADg6GEbFk
	jq0A7uYFVuey4bQzlcE8h973sS+UNUZMzPqPJKQO+jNwXUfDk9PPNt3ht4N9ImixIF/LhaNhAymYR
	AR5rtJNYmOY9apZeM6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj00Z-0000000CIGl-49cI;
	Tue, 27 Aug 2024 17:29:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sizcD-0000000CCwV-1AgZ
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 17:04:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20219a0fe4dso57049795ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724778260; x=1725383060; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cHVS6GvCBnOPsiOYcG8jjXps+ccwvzgozbmG4OKMFBE=;
        b=JD5MJtKxfPu/iOX0i+t0ygOtMoCHi4+rpGSRKaRDqWA1YqvZIG4SgP2Xd4ssdqgR7O
         S5P5XCoS3TjENDsZqTQ0LgwYjxVVfMhH5o0pxjM8CXpXewaewCBlaMxuPTC9N1Fyu6XG
         1KnAWUTJkIIiKqhLP/cWz+ZF20epPZms0i3DtvEKI3rH/1TewbErT/nREryUkWpyiV7z
         xi1EwK+8tNoRraxeXjeDtCB8w3qOCL5F6tIV+2EaVCvgxi7p8qTWY5BMYOlRVJ4R3pyX
         aBHnG8/UvJ9TXf20O8X1O8S98QaFyWFHBFgGy6uGJpcYqUAxTVNTRgc24y0q09gbhzet
         YSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724778260; x=1725383060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHVS6GvCBnOPsiOYcG8jjXps+ccwvzgozbmG4OKMFBE=;
        b=JmiqgXgNZbIenZ87RSzPJjYZYL87UjkOPp2Xk+BSpErp1cgG/erZxjd34wZAYFv24e
         /G7OS14J030dQIoQ+cxKD5aJDlAZJ0QBAhUmV+0LNSYqUB6Fn3tMmTIDhONzF+P9h0jA
         6v5Z91VM1i2VmpTaSpZS9CAHUg0ta9+OZ+cUjEWBmx8ulM+Z9tFfc1l3a/SilmnvcfUb
         3zGjmGd/aKuAsf+mhVrJ89gpL8r6NwiPA1Lc9lOuWIpHAVrS8GF1TFieP1gGNfL1d3Dr
         HN/V0jM8CfTSsDM0P2E2zdXzzJB5btv3hnR7p0poyFh/k7r8ilJ9+n7Sez5+im16L3Zj
         fgcg==
X-Forwarded-Encrypted: i=1; AJvYcCU4isrRKas/YpkZHM5+cQCH2JdHsyjJ6qcn3DaRbifnO4x1xM2U/ICg9Flob+mEKd1aGYYsbsmc/9saYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiVP/4ikqeIV3D8UKy8TmkyXNO69WcwfYy6aKcSfguxhBeUjmS
	/M/BWKGGdcUImrs4uIvd8S/qIps6MokIoJIOin50IOHrjusg9ObtyaCQMVj924A=
X-Google-Smtp-Source: AGHT+IGpFb01J/dDnA2pToqsW0uyDaKXkNpjJlhzI0wYO6p2DBoqiGpaSi2i/MYfsiurNdOQfC7Pkw==
X-Received: by 2002:a17:903:41cb:b0:1ff:6b6e:d2bb with SMTP id d9443c01a7336-2039e4ef31fmr140578985ad.45.1724778260470;
        Tue, 27 Aug 2024 10:04:20 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855e2075sm85741915ad.120.2024.08.27.10.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:04:19 -0700 (PDT)
Date: Tue, 27 Aug 2024 22:34:09 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller
 support
Message-ID: <Zs4HCZH3M9nRXUvu@sunil-laptop>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop>
 <87mskzcnmf.ffs@tglx>
 <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop>
 <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx>
 <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_100421_348071_9F1AB94D 
X-CRM114-Status: GOOD (  19.54  )
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMDY6MjA6MjRQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6MjLigK9QTSBUaG9tYXMgR2xl
aXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBdWcgMjYg
MjAyNCBhdCAxOToyNywgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXVn
IDI2LCAyMDI0IGF0IDc6MjLigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPiA+PiBUaGVyZSB3aWxsIGJlIGEgY29uZmxpY3QgaW4gUExJQyBpcnFjaGlw
IGRyaXZlciBkdWUgdG8gYSByZWNlbnQgcGF0Y2ggWzFdLgo+ID4gPj4gVGhpcyBwYXRjaCBpcyBu
b3QgaW4gbGF0ZXN0IFJDNSByZWxlYXNlIGJ1dCBpbiBsaW51eC1uZXh0LiBJIHVzdWFsbHkgYmFz
ZSB0aGUKPiA+ID4+IHNlcmllcyBvbiBsYXRlc3QgUkMgcmVsZWFzZS4gU2hvdWxkIEkgcmViYXNl
IHRvIGxpbnV4LW5leHQgaW4gdGhpcyBjYXNlCj4gPiA+PiBhbmQgc2VuZCB0aGUgbmV4dCByZXZp
c2lvbiBvZiB0aGUgc2VyaWVzIHJlc29sdmluZyB0aGUgY29uZmxpY3Q/Cj4gPiA+Cj4gPiA+IE5v
LCBwbGVhc2UgZG9uJ3QuCj4gPiA+Cj4gPiA+IFRoYXQgd2lsbCBiZSByZXNvbHZlZCBhdCB0aGUg
bWVyZ2UgdGltZS4KPiA+Cj4gPiBBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gcHVsbAo+ID4KPiA+ICAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0
IGlycS11cmdlbnQtMjAyNC0wOC0yNQo+ID4KPiA+IHdoaWNoIEknbSBhYm91dCB0byBzZW5kIHRv
IExpbnVzIGxhdGVzdCB0b21vcnJvdyBtb3JuaW5nLiBUaGF0IGNvbnRhaW5zCj4gPiB0aGUgY29u
ZmxpY3RpbmcgY2hhbmdlLgo+IAo+IFNvIEkndmUgYXBwbGllZCB0aGUgc2VyaWVzIG9uIHRvcCBv
ZiB0aGUgYWJvdmUuCj4gClRoYW5rcyEKCj4gVGhpcyBpbmNsdWRlZCBhIGZ1bGwtc3dpbmcgcmVi
YXNlIG9mIHRoZSBsYXN0IHBhdGNoLCB3aGljaCBJIGhvcGUgSSd2ZQo+IGRvbmUgY29ycmVjdGx5
LCBidXQgU3VuaWwgcGxlYXNlIHNlZQo+ClllYWgsIHNvcnJ5IGFib3V0IHRoYXQuIFlvdSBoYXZl
IHJlc29sdmVkIG1vc3Qgb2YgdGhlIGNvbmZsaWN0cyBidXQgZmV3CmFyZSBtaXNzaW5nICh3aGlj
aCB3ZXJlIG5vdCBvYnZpb3VzIGFueXdheSkuIENvdWxkIHlvdSBwbGVhc2UgdGFrZSBiZWxvdwpj
b21taXQgYW5kIHNxdWFzaD8KCmh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL2xpbnV4L2NvbW1p
dC9jODVmOWQwZGMzMWMwZTc3OTE2ZWNkYmI0NTc3NDhjMDVjZjRlNzVhCgpUaGFua3MhClN1bmls
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
