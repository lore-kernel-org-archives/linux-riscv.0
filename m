Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE77C531DC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 02:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/agOAr0pL95/kBMisnIiBgP9Vp7OxgwolSeAF47VS0o=; b=Ag/2mzLHMzDHZR
	YqSZRT+8YgrKXH1PmwZP9SjatgtS8V0VljfOUkGdrCSsmxu9pv3LqB2CW5a0jmKA2nNUCYatl7o2g
	SA0rSL36lXyignwxPFbrMf9BuOpNKnYXLkYDDR01wxlGJZSSsjwBw474SBmlD3wmSAC5qPs6OLb8E
	UV7X2LIvyUat49JZUAXNs3iYwUy2q2+GnA1QDFu05lSvtEIcHQEhCYoxs/l2fOZuHZRWcK1uxNMGp
	HJV9MMJqwOz5zL8dzjVN9OPFcLDuPlPis0HsvnNzBzG6Wd+f7ZJde5WhNGr1PujjXM86ELd7P2K3k
	vZSZckcHmC4/D2q4AU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdKal-0000000GgKp-34Us;
	Mon, 12 Aug 2024 02:15:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJXG-0000000GcHU-1OTK
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:07:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2cb5787b4a5so2411396a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424865; x=1724029665; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Crz27ST5X2jO2vrF90biTTCavSItjpCBUjBKFknbYQ=;
        b=c6zGwX7s8QlAN2yYFbFccGmA+IP1syzgbDmkcG8rEOqGlrvzeqwqPTtTESv4BseHcY
         Ie1A7pufN1jOUCv6MuPSHUedZWv4oEJCyGfP5oRFXVuvRNeJKVDutlL7I96/2Uc6Smtc
         jHFxsVvFkY/3y/xHW3JBuNmvqU2E9lGJfvAAxdR5pJpZqw3Cs0wQ8lFckbI+EO8tjT0E
         lDSq3cGh7TQx5Ny2XM2sJLB8Xm7DS/atQiY/m9xEXiAPuTrciNHAeT1KXdk29tx1utGN
         UYHKZtbiWMjriSmCT73oDqmRf/ycJIP7KlHO62yWlQk4HyKUmmR2gjVYlz/82ejifsoA
         6PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424865; x=1724029665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Crz27ST5X2jO2vrF90biTTCavSItjpCBUjBKFknbYQ=;
        b=S8jmP9kwP2ek6bdlQorFph/chLKp8hVdoxBgpR996ZOGsyQZGDjMmKGIRz/CFOx8YL
         Lo18EShojhA7e8zxizH49TbBCxvGHnpoMG8yHvnl6v6BvS7/2PwujXe0maf/DJ+UKMmc
         Wxw4VcQoOPWxJI4lzHoiDUFIh8mquvF14ZbKx9WB0qqk27GwA4DaBY+bQSmG5+wYwusr
         oDBC/7VfC9nY+R1715+/t7Fhcqe+mzkvINW/6A6Z++tkFL/he+4jFdUZ47J9Q5VXFAug
         0XrlgWUkVCsSOAq+0x3KxOHCwFS9IoTidZdbLZLSBFoBJtrY//xeR8rTroRdjmB4+y5g
         pnLg==
X-Forwarded-Encrypted: i=1; AJvYcCU1leqVsRwWNwhr+zOIni1IHUa5APxogjQmxk+f3nvnRLxYoe82KjR2YbJXlxl9vRoF0TzgH0xjoI0niQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MADut/P5ZHX2MefO1itPPPcB8u+7KYWCE1PSrguMFCEmhqYI
	8uqdc3m12NAP3+NOxQCAl2Acy7f5hJq/nx6Wjb42YKJbCTo/vRyuy6IKdoBnHfg=
X-Google-Smtp-Source: AGHT+IFy5zs1UKvROLW81s0IANcAfrd4dDGTMIm7sbcPUJ21ofUGfdTh3DNcEjKHaI13Ofh/d6iuAg==
X-Received: by 2002:a17:90b:4a42:b0:2c8:a8f:c97 with SMTP id 98e67ed59e1d1-2d1e8078a15mr6034174a91.37.1723424864290;
        Sun, 11 Aug 2024 18:07:44 -0700 (PDT)
Received: from sunil-laptop ([2405:204:5602:8c56:518:77d3:10fd:70a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcfed6c1sm3637969a91.36.2024.08.11.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:07:43 -0700 (PDT)
Date: Mon, 12 Aug 2024 06:37:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <ZrlgVUXC_dCW9ISM@sunil-laptop>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180746_386044_E510F609 
X-CRM114-Status: GOOD (  27.32  )
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

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDY6Mjk6MTJBTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGJlbG93IEVDUiBhcHByb3ZlZCBi
eSBBU1dHLgo+IDEpIE1BRFQgLSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFvTUdQ
eU9ENThKYVBnTWwxcEthc1QtVktzSUtpYTd6Ui92aWV3P3VzcD1zaGFyaW5nCj4gCj4gVGhlIHNl
cmllcyBwcmltYXJpbHkgZW5hYmxlcyBpcnFjaGlwIGRyaXZlcnMgZm9yIFJJU0MtViBBQ1BJIGJh
c2VkCj4gcGxhdGZvcm1zLgo+IAo+IFRoZSBzZXJpZXMgY2FuIGJlIGJyb2FkbHkgY2F0ZWdvcml6
ZWQgbGlrZSBiZWxvdy4gCj4gCj4gMSkgUENJIEFDUEkgcmVsYXRlZCBmdW5jdGlvbnMgYXJlIG1p
Z3JhdGVkIGZyb20gYXJtNjQgdG8gY29tbW9uIGZpbGUgc28KPiB0aGF0IHdlIGRvbid0IG5lZWQg
dG8gZHVwbGljYXRlIHRoZW0gZm9yIFJJU0MtVi4KPiAKPiAyKSBBZGRlZCBzdXBwb3J0IGZvciBy
ZS1vcmRlcmluZyB0aGUgcHJvYmUgb2YgaW50ZXJydXB0IGNvbnRyb2xsZXJzIHdoZW4KPiBJUlFD
SElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+IAo+IDMpIFRvIGVuc3VyZSBwcm9iZSBvcmRlciBi
ZXR3ZWVuIGludGVycnVwdCBjb250cm9sbGVycyBhbmQgZGV2aWNlcywKPiBpbXBsaWNpdCBkZXBl
bmRlbmN5IGlzIGNyZWF0ZWQgc2ltaWxhciB0byB3aGVuIF9ERVAgaXMgcHJlc2VudC4KPiAKPiA0
KSBBQ1BJIHN1cHBvcnQgYWRkZWQgaW4gUklTQy1WIGludGVycnVwdCBjb250cm9sbGVyIGRyaXZl
cnMuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2NzoKPiAJMSkgVXBkYXRlZCBjb21taXQgbWVzc2FnZXMg
YXMgcGVyIGZlZWRiYWNrIGZyb20gQmpvcm4gb24gcGF0Y2hlcyAyLCAzIGFuZCA4Lgo+IAkyKSBB
ZGRyZXNzZWQgQW51cCBQYXRlbCdzIGNvbW1lbnRzLgo+IAkzKSBBZGRlZCBUZXN0ZWQtYnkgdGFn
IGZyb20gQmrDtnJuIFTDtnBlIHdoaWNoIEkgbWlzc2VkIHRvIGFkZCBpbiBwcmV2aW91cyB2ZXJz
aW9uLgo+IAk0KSBSZWJhc2VkIHRvIDYuMTEtcmMzIGFuZCB1cGRhdGVkIHRoZSBSQiB0YWdzIGZy
b20gQW51cC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHY2Ogo+IAkxKSBVcGRhdGUgdG8gY29tbWl0IG1l
c3NhZ2UvY29kZSBjb21tZW50cyBhcyBwZXIgZmVlZGJhY2sgZnJvbSBCam9ybi4KPiAJMikgUmVi
YXNlZCB0byA2LjExLXJjMS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHY1Ogo+IAkxKSBBZGRyZXNzZWQg
ZmVlZGJhY2sgZnJvbSBUaG9tYXMuCj4gCTIpIENyZWF0ZWQgc2VwYXJhdGUgcGF0Y2ggZm9yIHJl
ZmFjdG9yaW5nIERUIGNvZGUgaW4gSU1TSUMKPiAJMykgU2VwYXJhdGVkIGEgZml4IGluIHJpc2N2
LWludGMgaXJxY2hpcCBkcml2ZXIgYW5kIHNlbnQKPiAJICAgc2VwYXJhdGVseS4gVGhpcyBzZXJp
ZXMgZGVwZW5kcyBvbiB0aGF0IHBhdGNoIFsxXS4KPiAJNCkgRHJvcHBlZCBzZXJpYWwgZHJpdmVy
IHBhdGNoIHNpbmNlIGl0IGRlcGVuZHMgb24gQW5keSdzCj4gCSAgIHJlZmFjdG9yaW5nIHNlcmll
cyBbMl0uIFJJU0MtViBwYXRjaGVzIHdpbGwgYmUgc2VudAo+IAkgICBzZXBhcmF0ZWx5IGxhdGVy
IG9uY2UgQW5keSBzZXJpZXMgZ2V0IGFjY2VwdGVkLgo+IAk1KSBSZWJhc2VkIHRvIHY2LjEwLXJj
MSB3aGljaCBoYXMgQUlBIERUIHBhdGNoZXMuCj4gCTYpIFVwZGF0ZWQgdGFncy4KPiAKPiBDaGFu
Z2VzIHNpbmNlIFJGQyB2NDoKPiAJMSkgUmVtb3ZlZCBSRkMgdGFnIGFzIHRoZSBSRkN2NCBkZXNp
Z24gbG9va2VkIHJlYXNvbmFibGUuCj4gCTIpIERyb3BwZWQgUENJIHBhdGNoIG5lZWRlZCB0byBh
dm9pZCB3YXJuaW5nIHdoZW4gdGhlcmUgaXMgbm8gTVNJCj4gCSAgIGNvbnRyb2xsZXIuIFRoaXMg
d2lsbCBiZSBzZW50IGxhdGVyIHNlcGFyYXRlbHkgYWZ0ZXIgdGhlCj4gCSAgIGN1cnJlbnQgc2Vy
aWVzLgo+IAkzKSBEcm9wcGVkIFBOUCBoYW5kbGluZyBvZiBfREVQIHNpbmNlIHRoZXJlIGlzIG5l
dyBBQ1BJIElEIGZvcgo+IAkgICBnZW5lcmljIDE2NTUwIFVBUlQuIEFkZGVkIHRoZSBzZXJpYWwg
ZHJpdmVyIHBhdGNoIGluc3RlYWQuCj4gCTQpIFJlYmFzZWQgdG8gbGF0ZXN0IGxpbnV4LW5leHQu
Cj4gCTUpIFJlb3JkZXJlZC9zcXVhc2hlZCBwYXRjaGVzIGluIHRoZSBzZXJpZXMKPiAKPiBDaGFu
Z2VzIHNpbmNlIFJGQyB2MzoKPiAJMSkgTW92ZWQgdG8gX0RFUCBtZXRob2QgaW5zdGVhZCBvZiBm
d19kZXZsaW5rLgo+IAkyKSBQTElDL0FQTElDIGRyaXZlciBwcm9iZSB1c2luZyBuYW1lc3BhY2Ug
ZGV2aWNlcy4KPiAJMykgSGFuZGxpbmcgUE5QIGRldmljZXMgYXMgcGFydCBvZiBjbGVhcmluZyBk
ZXBlbmRlbmN5Lgo+IAk0KSBSZWJhc2VkIHRvIGxhdGVzdCBsaW51eC1uZXh0IHRvIGdldCBBSUEg
RFQgZHJpdmVycy4KPiAKPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MjoKPiAJMSkgSW50cm9kdWNlZCBm
d19kZXZsaW5rIGZvciBBQ1BJIG5vZGVzIGZvciBJUlEgZGVwZW5kZW5jeS4KPiAJMikgRHJvcHBl
ZCBwYXRjaGVzIGluIGRyaXZlcnMgd2hpY2ggYXJlIG5vdCByZXF1aXJlZCBkdWUgdG8KPiAJICAg
ZndfZGV2bGluayBzdXBwb3J0Lgo+IAkzKSBEcm9wcGVkIHBjaV9zZXRfbXNpKCkgcGF0Y2ggYW5k
IGFkZGVkIGEgcGF0Y2ggaW4KPiAJICAgcGNpX2NyZWF0ZV9yb290X2J1cygpLgo+IAk0KSBVcGRh
dGVkIHBucF9pcnEoKSBwYXRjaCBzbyB0aGF0IG5vbmUgb2YgdGhlIGFjdHVhbCBQTlAKPiAJICAg
ZHJpdmVycyBuZWVkIHRvIGNoYW5nZS4KPiAKPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MToKPiAJMSkg
QWJhbmRvbmVkIHN3bm9kZSBhcHByb2FjaCBhcyBwZXIgTWFyYydzIGZlZWRiYWNrLgo+IAkyKSBU
byBjb3BlIHVwIHdpdGggQUlBIHNlcmllcyBjaGFuZ2VzIHdoaWNoIGNoYW5nZWQgaXJxY2hpcCBk
cml2ZXIKPiAJICAgcHJvYmUgZnJvbSBjb3JlX2luaXRjYWxsKCkgdG8gcGxhdGZvcm1fZHJpdmVy
LCBhZGRlZCBwYXRjaGVzCj4gCSAgIHRvIHN1cHBvcnQgZGVmZXJyZWQgcHJvYmluZy4KPiAJMykg
UmViYXNlZCBvbiB0b3Agb2YgQW51cCdzIEFJQSB2MTEgYW5kIGFkZGVkIHRhZ3MuCj4gCkhpIFJh
ZmFlbCwKCkhvcGUgeW91IGFyZSBiYWNrIHRoaXMgd2VlayEuCgpUaGlzIHNlcmllcyBoYXMgc3Bl
bnQgcXVpdGUgYSBiaXQgb2YgdGltZSBub3cgb24gdGhlIGxpc3QuIEFzIHlvdSBhcmUKYXdhcmUs
IGZldyBjbGFyaWZpY2F0aW9ucyBsaWtlIF9QSUMgY29kZXMgYXJlIGFsc28gZG9uZSBub3cuIFRo
ZXJlIGlzCm5vIG1ham9yIGNoYW5nZSBhZnRlciB5b3UgaGFkIGFncmVlZCBmb3IgdGhlIGRlc2ln
bi4gU28sIGNhbiB0aGlzIGJlCmNvbnNpZGVyZWQgZm9yIHRoZSBuZXh0IHJlbGVhc2UgcGxlYXNl
PwoKVGhhbmtzIQpTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
