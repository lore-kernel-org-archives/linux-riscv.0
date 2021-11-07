Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470E2C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0618A613A6
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 17:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0618A613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doqcR+y/Cb8aka7HwF2rnndnaF2BZdGeFX+UuHK+9Dg=; b=o66Ktq7sztVK2tkGpcNLE73nbD
	1o3/ODDYzlSTWEZUnmaBF779W+JRSBlA8zcFrx7hjByGHJ/yYS8s3uEonYpb2yRegNv9hkRsOD+Ik
	41SArj3AQ+fRXeK0i0EF0b+9RQXwr8o8bcbxymKR0I79H+/YLxtCaxOtmgZ1rJ7O9RJWCHjO9dI7z
	1Z+8U6nre1n0Cm4iVB/reDZSe6JUVg7ZycgUUUKILaJvgHBuG9oc0usRtTrnHyPCAhmHKL3PBHqXH
	L0OFQSgJWvP++2DAXbbt12TLHeqfpU32DbWUvkIS/CQoRcjRvTPFxg4dyu8so1jQw4QdtpSBBCvUK
	MN2MUPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjm2Z-00Edsa-U5; Sun, 07 Nov 2021 17:33:11 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjm2W-00EdrT-Jd; Sun, 07 Nov 2021 17:33:10 +0000
Received: by mail-oi1-x229.google.com with SMTP id bk14so1028936oib.7;
 Sun, 07 Nov 2021 09:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
 b=QIfw+m72ItgaApqkAoLUYKEHkpy+eMpUCLymo2SVE2e06bxlhsvsGBIpx80FAFL6zX
 lQmhx5vWsnqdO5AzfRwzYmC9JyeI+x703tpvfwQKurLg2VtZOzsNtJVqgO0A8u3N2B9I
 BYJElUmFFKGlmNuNH1pVTHbG46IPWj2FGkpJks4IWHqhA3hkwgU7q4GC5oDjmilXskFD
 oTKdooszpWu854bZrRMH7UW0QrvSFFnK9cGOfGPg2b3g5hqd+nvAec6GccpfULS1MyoN
 kwidN5WRwT1FH2PsDPsfoM+Wt2eEwiLbpjLKm84c+sezJpyJvFv7kmoqDjei75CdMOoF
 bVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tMVMvSELY54S0UdLfdOcY9hXGDCgRpBmnCTKjFa8UlE=;
 b=Ih9uFPUbYrPadKkS8uoAo+9F1VH1BoXWmLKTORMal8GiaRzXM5OgxZwVGUclsZuPtG
 fqxdwFv8ZOdB7p/gUs3xfc1fiz9kCg8XvrKO/IJZruVV44kZ63kBHWrOYPrKgGSG4gf0
 Z35RxgzGqVARblbiRGP9wVX3nwy5zMW49JcluLOv+5fU1YdpOEpgrxVRaBEW+HI00dtB
 JBJ8G80BXJX6PsqucEnVjcn0GnefGUWwGuC0gaahPQggbrTVTfyhm6z+kVzMCh9i1rIR
 NuC7XMunnDKWx65bPzWt1FPWXoRYEurQOqG1kLgj0yRE5JLXqP7WigZ5DzZah5HD+Xaz
 z9qg==
X-Gm-Message-State: AOAM533sQ+CLpLld5GbA8CfrbrfmaobQvysFk1opcwZQ0CvvIJpTzYPi
 y6zy9+EmxaVezVcm0YQ8x4k=
X-Google-Smtp-Source: ABdhPJygB0wkAZr+IyDwhIXD/1Ky9Z1d16PhZAI/x4npp+2qcv9Jc+QXaxpUDgRoNUJ2QI01eNmjeA==
X-Received: by 2002:aca:650d:: with SMTP id m13mr16262607oim.42.1636306383620; 
 Sun, 07 Nov 2021 09:33:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c18sm4840649otr.32.2021.11.07.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 09:33:03 -0800 (PST)
To: Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-28-digetx@gmail.com> <YYbqlmOM95q7Hbjo@latitude>
 <be0c74c6-05a9-cad5-c285-6626d05f8860@gmail.com>
 <9a22c22d-94b1-f519-27a2-ae0b8bbf6e99@roeck-us.net>
 <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Message-ID: <5a17fee3-4214-c2b9-abc1-ab9d6071591b@roeck-us.net>
Date: Sun, 7 Nov 2021 09:32:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <658cf796-e3b1-f816-1e15-9e9e08b8ade0@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_093308_660463_C79D10F3 
X-CRM114-Status: GOOD (  26.77  )
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

T24gMTEvNy8yMSA5OjE2IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDcuMTEuMjAyMSAy
MDowOCwgR3VlbnRlciBSb2VjayDQv9C40YjQtdGCOgo+PiBPbiAxMS83LzIxIDg6NTMgQU0sIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDA2LjExLjIwMjEgMjM6NTQsIEpvbmF0aGFuIE5ldXNj
aMOkZmVyINC/0LjRiNC10YI6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAy
MSBhdCAxMjoxNjo1N0FNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+IFVzZSBk
ZXZtX3JlZ2lzdGVyX3Bvd2VyX2hhbmRsZXIoKSB0aGF0IHJlcGxhY2VzIGdsb2JhbCBwbV9wb3dl
cl9vZmYKPj4+Pj4gdmFyaWFibGUgYW5kIGFsbG93cyB0byByZWdpc3RlciBtdWx0aXBsZSBwb3dl
ci1vZmYgaGFuZGxlcnMuIEl0IGFsc28KPj4+Pj4gcHJvdmlkZXMgcmVzdGFydC1oYW5kbGVyIHN1
cHBvcnQsIGkuZS4gYWxsIGluIG9uZSBBUEkuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4KPj4+PiBXaGVu
IEkgYm9vdCB3aXRoIChtb3N0IG9mKSB0aGlzIHBhdGNoc2V0IGFwcGxpZWQsIEkgZ2V0IHRoZSB3
YXJuaW5nIGF0Cj4+Pj4ga2VybmVsL3JlYm9vdC5jOjE4NzoKPj4+Pgo+Pj4+ICDCoMKgwqDCoC8q
Cj4+Pj4gIMKgwqDCoMKgICogSGFuZGxlciBtdXN0IGhhdmUgdW5pcXVlIHByaW9yaXR5LiBPdGhl
cndpc2UgY2FsbCBvcmRlciBpcwo+Pj4+ICDCoMKgwqDCoCAqIGRldGVybWluZWQgYnkgcmVnaXN0
cmF0aW9uIG9yZGVyLCB3aGljaCBpcyB1bnJlbGlhYmxlLgo+Pj4+ICDCoMKgwqDCoCAqLwo+Pj4+
ICDCoMKgwqDCoFdBUk5fT04oIWF0b21pY19ub3RpZmllcl9oYXNfdW5pcXVlX3ByaW9yaXR5KCZy
ZXN0YXJ0X2hhbmRsZXJfbGlzdCwKPj4+PiBuYikpOwo+Pj4+Cj4+Pj4gQXMgdGhlIE5UWEVDIGRy
aXZlciBkb2Vzbid0IHNwZWNpZnkgYSBwcmlvcml0eSwgSSB0aGluayB0aGlzIGlzIGFuIGlzc3Vl
Cj4+Pj4gdG8gYmUgZml4ZWQgZWxzZXdoZXJlLgo+Pj4+Cj4+Pj4gT3RoZXIgdGhhbiB0aGF0LCBp
dCB3b3JrcyBhbmQgbG9va3MgZ29vZCwgYXMgZmFyIGFzIEkgY2FuIHRlbGwuCj4+Pj4KPj4+Pgo+
Pj4+IEZvciB0aGlzIHBhdGNoOgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIE5ldXNj
aMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4+Pj4gVGVzdGVkLWJ5OiBKb25hdGhhbiBO
ZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+Pj4KPj4+IFRoYW5rIHlvdS4gWW91
IGhhdmUgY29uZmxpY3RpbmcgcmVzdGFydCBoYW5kbGVycywgYXBwYXJlbnRseSBOVFhFQwo+Pj4g
ZHJpdmVyIHNob3VsZCBoYXZlIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZSB3YXRjaGRvZyBkcml2
ZXIuIEl0IHNob3VsZAo+Pj4gYmUgYSBjb21tb24gcHJvYmxlbSBmb3IgdGhlIHdhdGNoZG9nIGRy
aXZlcnMsIEkgd2lsbCBsb3dlciB3YXRjaGRvZydzCj4+PiBkZWZhdWx0IHByaW9yaXR5IHRvIGZp
eCBpdC4KPj4+Cj4+Cj4+IFRoZSB3YXRjaGRvZyBzdWJzeXN0ZW0gYWxyZWFkeSB1c2VzICIwIiBh
cyBkZWZhdWx0IHByaW9yaXR5LCB3aGljaCB3YXMKPj4gaW50ZW5kZWQgYXMgcHJpb3JpdHkgb2Yg
bGFzdCByZXNvcnQgZm9yIHJlc3RhcnQgaGFuZGxlcnMuIEkgZG8gbm90IHNlZQo+PiBhIHJlYXNv
biB0byBjaGFuZ2UgdGhhdC4KPiAKPiBSaWdodCwgSSBtZWFudCB0aGF0IHdhdGNoZG9nIGRyaXZl
cnMgd2hpY2ggdXNlIHJlc3RhcnQgaGFuZGxlciBzZXQgdGhlCj4gbGV2ZWwgdG8gdGhlIGRlZmF1
bHQgMTI4IFsxXS4gQWx0aG91Z2gsIG1heWJlIGl0J3MgYSBwcm9ibGVtIG9ubHkgZm9yCj4gaS5N
WCBkcml2ZXJzIGluIHByYWN0aWNlLCBJJ2xsIHRha2UgYSBjbG9zZXIgbG9vayBhdCB0aGUgb3Ro
ZXIgZHJpdmVycy4KPiAKClRoZXkgZG9uJ3QgaGF2ZSB0byBkbyB0aGF0LiBUaGUgZGVmYXVsdCBp
cyBwcmlvcml0eSAwLiBJdCBpcyB0aGUgZGVjaXNpb24Kb2YgdGhlIGRyaXZlciBhdXRob3IgdG8g
c2V0IHRoZSB3YXRjaGRvZydzIHJlc3RhcnQgcHJpb3JpdHkuIFNvIGl0IGlzIHdyb25nCnRvIGNs
YWltIHRoYXQgdGhpcyB3b3VsZCBiZSAiYSBjb21tb24gcHJvYmxlbSBmb3IgdGhlIHdhdGNoZG9n
IGRyaXZlcnMiLApiZWNhdXNlIGl0IGlzbid0LiBQcmVzdW1hYmx5IHRoZXJlIHdhcyBhIHJlYXNv
biBmb3IgdGhlIGRyaXZlciBhdXRob3IKdG8gc2VsZWN0IHRoZSBkZWZhdWx0IHByaW9yaXR5IG9m
IDEyOC4gSWYgdGhlcmUgaXMgYSBwbGF0Zm9ybSB3aGljaCBoYXMKYSBiZXR0ZXIgbWVhbnMgdG8g
cmVzdGFydCB0aGUgc3lzdGVtLCBpdCBzaG91bGQgc2VsZWN0IGEgcHJpb3JpdHkgb2YKMTI5IG9y
IGhpZ2hlciBpbnN0ZWFkIG9mIGFmZmVjdGluZyBfYWxsXyBwbGF0Zm9ybXMgdXNpbmcgdGhlIGlt
eCB3YXRjaGRvZwp0byByZXNldCB0aGUgc3lzdGVtLgoKU3VyZSwgeW91IGNhbiBuZWdvdGlhdGUg
dGhhdCB3aXRoIHRoZSBkcml2ZXIgYXV0aG9yLCBidXQgdGhlIGRlZmF1bHQgc2hvdWxkCnJlYWxs
eSBiZSB0byBjaGFuZ2UgdGhlIHByaW9yaXR5IGZvciBsZXNzIGFmZmVjdGVkIHBsYXRmb3Jtcy4K
Ckd1ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
