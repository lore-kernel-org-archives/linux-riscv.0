Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB79C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LCIXN0s2WK1uSzCgeoivNq6vJPofu47OGo4pL424YM=; b=EsKflu7/0w0MZU
	9oCEksDInJAl3QCUjCSienOXzJnJDhp62wsLs3bGp5MsIp38Pk9OeK7hklO/dnYRbUVbKswPv7KGM
	hPTpti0Bc+8FfyH2k0D4WxJzV3STxfKKmRlarF0bcBni67qRjRnuIuX1jzSPgvVvUd9GjE3DvQjnF
	CsShMjJBwQbZ6W0FhcYnl81caIcFPs6a1nSvD801+J6VcFo93d2GC1XqsQPMI+J6rDThW/m4GIlLy
	XIP5AweNWT4lPycKEaV3Ui2elC3soee7R6Fyv4OO9lKZRCGqwWznkfZbauALghv2s03zxqw5FGgwC
	DNJcYtiYjnNm4cEsi1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSZm-0000000AaDi-3RTC;
	Fri, 07 Feb 2025 17:55:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSUA-0000000AYtJ-16Nq
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 17:49:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f40deb941so41830365ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 09:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950589; x=1739555389; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ueL8uhdRjf52HSBhlGadO+O+QftLnA6FgREnqVSmz0=;
        b=TpJ3ZYb88ridpC39ksZfFczdEBkQIVHwIVR9VCl0kyk3JI+uiuVjY4kRx6AAlZtteq
         lBpjJ2qYNTqD3Pz6/AZCyNFo3/pjJlPjc1C/TJYpSwJ1H1Pfvz2AYxDY7yL7K3+YSqgQ
         86IgA+77K242o8JyxQxXIvoWvAGzviJD3nTcmJyPdMUf72qSqIbCk6yjVMikm/QJC01A
         yT5WyGnVdJl2vnACcMxfQ2xbLOrh03P5r0AhwSQIVWWO5c7xCaBILMQzgy8zNj/shAIs
         fC1YtigfYCaoDiG8z+zIDN0X/AqljPZ+MOVtVh7ZraXAesgt1flvH7vYOKPg785WLDN4
         NkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950589; x=1739555389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ueL8uhdRjf52HSBhlGadO+O+QftLnA6FgREnqVSmz0=;
        b=bLI8JLvqjX/EkxKJwnfLf7qvRSyidAGk05Qo94fNUWnKM+vFiR6F/08e1TZP8mOE9G
         gt0L0S9n70yDR6V8gz1puC5XROfKAIsuNa6eBHGZIvYmh9o6GO2WLgO6JEP8YOSkoovS
         zYCKi4csB3qgNPer66DhRlUf3sFvMsVX/65WVtDj240+ukkBgtm8LcLvxNuhtW/vJZth
         OhoMQTxcZo6JstartRNaCa9gJq2c6J4z/75uIMSTY9h7mPnhaJpNzcnJmRZvZQR/jY2H
         XIaxbJmQUKlTjou4vzM/TN8gEQ5fuQrHqYDpW5wnd5HP4WDiGLgi8rgXeAzlafXkNySk
         JjqA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5HP/QmignllJdDqxVtPxZs3PUohCOISr3hPWKgr0Hc2wZmkt+LM9m4Pg9AEOxPrxuc42zfIFvICVMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCJqMkEKKPom3NDd1F3pZ51vKoNd9MoRVay2wLrTXVmt/SpWjx
	eMrlBNO0jRrq4AMBeoweLfm0UNmzTtc+VyDzWRnkC84IHnVqVOE3MxSsmdBKeA==
X-Gm-Gg: ASbGnctk5I0uuiNrbRZwT9ocBu/mpJ3KbvWOgPHASmOnbUewnY8I3pRHn8pb3Jf1NG3
	T/A9rE/z2b4CGJbZsgRJf+TTd/C74oivjAnAVK87HZMXbGknjdEETrewLBEFg2ErCyxIr5mODrL
	532Mr/Du9LzzvejglvNUlFuskax6I/78Nkmg0CXnHcj2K2v/7OlpOXx4iX65pfNeN5Jz6wwtZO/
	04pkKZf6jA71N5SEqPhNJc0JK4IiGSFhrnlLehFCalQ/ZuEUmQFfsTuYvjl6DJD3NAJfgSS0BGU
	gqm1J87UzKLjPZOSHWF2X5y8ng==
X-Google-Smtp-Source: AGHT+IE6OgQOwi69kOmyTP+cvlnuvv/NziCa4NqzRul258V7kLWTeAlJ+6B/WB+eU+A9dOCwtErZPw==
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr70009195ad.48.1738950587991;
        Fri, 07 Feb 2025 09:49:47 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36541c36sm33757455ad.63.2025.02.07.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:49:47 -0800 (PST)
Date: Fri, 7 Feb 2025 23:19:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
	kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com, helgaas@kernel.org
Subject: Re: [PATCH v3 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20250207174939.w2e2bdvvcmqojlse@thinkpad>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <ddedd8f76f83fea2c6d3887132d2fe6f2a6a02c1.1736923025.git.unicorn_wang@outlook.com>
 <20250119122353.v3tzitthmu5tu3dg@thinkpad>
 <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
 <20250122173451.5c7pdchnyee7iy6t@thinkpad>
 <86msfhviek.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86msfhviek.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_094950_306658_7641BC6A 
X-CRM114-Status: GOOD (  22.15  )
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

T24gVGh1LCBKYW4gMjMsIDIwMjUgYXQgMTI6MTI6MDNQTSArMDAwMCwgTWFyYyBaeW5naWVyIHdy
b3RlOgo+IE9uIFdlZCwgMjIgSmFuIDIwMjUgMTc6MzQ6NTEgKzAwMDAsCj4gTWFuaXZhbm5hbiBT
YWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiAK
PiA+ICsgTWFyYyAoZm9yIHRoZSBJUlFDSElQIGltcGxlbWVudGF0aW9uIHJldmlldykKPiA+IAo+
ID4gT24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDk6Mjg6MTJQTSArMDgwMCwgQ2hlbiBXYW5nIHdy
b3RlOgo+ID4gPiAKPiA+ID4gPiA+ICtzdGF0aWMgaW50IHNnMjA0Ml9wY2llX3NldHVwX21zaShz
dHJ1Y3Qgc2cyMDQyX3BjaWUgKnBjaWUsCj4gPiA+ID4gPiArCQkJCSBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm1zaV9ub2RlKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJc3RydWN0IGRldmljZSAqZGV2
ID0gcGNpZS0+Y2Ruc19wY2llLT5kZXY7Cj4gPiA+ID4gPiArCXN0cnVjdCBmd25vZGVfaGFuZGxl
ICpmd25vZGUgPSBvZl9ub2RlX3RvX2Z3bm9kZShkZXYtPm9mX25vZGUpOwo+ID4gPiA+ID4gKwlz
dHJ1Y3QgaXJxX2RvbWFpbiAqcGFyZW50X2RvbWFpbjsKPiA+ID4gPiA+ICsJaW50IHJldCA9IDA7
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCWlmICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKG1zaV9u
b2RlLCAibXNpLWNvbnRyb2xsZXIiKSkKPiA+ID4gPiA+ICsJCXJldHVybiAtRU5PREVWOwo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gKwlyZXQgPSBvZl9pcnFfZ2V0X2J5bmFtZShtc2lfbm9kZSwgIm1z
aSIpOwo+ID4gPiA+ID4gKwlpZiAocmV0IDw9IDApIHsKPiA+ID4gPiA+ICsJCWRldl9lcnIoZGV2
LCAiJXBPRjogZmFpbGVkIHRvIGdldCBNU0kgaXJxXG4iLCBtc2lfbm9kZSk7Cj4gPiA+ID4gPiAr
CQlyZXR1cm4gcmV0Owo+ID4gPiA+ID4gKwl9Cj4gPiA+ID4gPiArCXBjaWUtPm1zaV9pcnEgPSBy
ZXQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCWlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9k
YXRhKHBjaWUtPm1zaV9pcnEsCj4gPiA+ID4gPiArCQkJCQkgc2cyMDQyX3BjaWVfbXNpX2NoYWlu
ZWRfaXNyLCBwY2llKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJcGFyZW50X2RvbWFpbiA9IGly
cV9kb21haW5fY3JlYXRlX2xpbmVhcihmd25vZGUsIE1TSV9ERUZfTlVNX1ZFQ1RPUlMsCj4gPiA+
ID4gPiArCQkJCQkJICZzZzIwNDJfcGNpZV9tc2lfZG9tYWluX29wcywgcGNpZSk7Cj4gPiA+ID4g
PiArCWlmICghcGFyZW50X2RvbWFpbikgewo+ID4gPiA+ID4gKwkJZGV2X2VycihkZXYsICIlcGZ3
OiBGYWlsZWQgdG8gY3JlYXRlIElSUSBkb21haW5cbiIsIGZ3bm9kZSk7Cj4gPiA+ID4gPiArCQly
ZXR1cm4gLUVOT01FTTsKPiA+ID4gPiA+ICsJfQo+ID4gPiA+ID4gKwlpcnFfZG9tYWluX3VwZGF0
ZV9idXNfdG9rZW4ocGFyZW50X2RvbWFpbiwgRE9NQUlOX0JVU19ORVhVUyk7Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gVGhlIE1TSSBjb250cm9sbGVyIGlzIHdpcmVkIHRvIFBMSUMgaXNuJ3QgaXQ/IElm
IHNvLCB3aHkgY2FuJ3QgeW91IHVzZQo+ID4gPiA+IGhpZXJhcmNoaWFsIE1TSSBkb21haW4gaW1w
bGVtZW50YXRpb24gYXMgbGlrZSBvdGhlciBjb250cm9sbGVyIGRyaXZlcnM/Cj4gPiA+IAo+ID4g
PiBUaGUgbWV0aG9kIHVzZWQgaGVyZSBpcyBzb21ld2hhdCBzaW1pbGFyIHRvIGR3X3BjaWVfYWxs
b2NhdGVfZG9tYWlucygpIGluCj4gPiA+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZGVzaWdud2FyZS1ob3N0LmMuIFRoaXMgTVNJIGNvbnRyb2xsZXIgaXMKPiA+ID4gYWJvdXQgTWV0
aG9kIEEsIHRoZSBQQ0llIGNvbnRyb2xsZXIgaW1wbGVtZW50cyBhbiBNU0kgaW50ZXJydXB0IGNv
bnRyb2xsZXIKPiA+ID4gaW5zaWRlLCBhbmQgY29ubmVjdCB0byBQTElDIHVwd2FyZCB0aHJvdWdo
IG9ubHkgT05FIGludGVycnVwdCBsaW5lLiBCZWNhdXNlCj4gPiA+IE1TSSB0byBQTElDIGlzIG11
bHRpcGxlIHRvIG9uZSwgSSB1c2UgbGluZWFyIG1vZGUgaGVyZSBhbmQgdXNlIGNoYWluZWQgSVNS
Cj4gPiA+IHRvIGhhbmRsZSB0aGUgaW50ZXJydXB0cy4KPiA+ID4gCj4gPiAKPiA+IEhtbSwgb2su
IEknbSBub3QgYW4gSVJRQ0hJUCBleHBlcnQsIGJ1dCBJJ2xsIGRlZmVyIHRvIE1hcmMgdG8gcmV2
aWV3IHRoZSBJUlFDSElQCj4gPiBpbXBsZW1lbnRhdGlvbiBwYXJ0Lgo+IAo+IEkgZG9uJ3Qgb2Zm
ZXIgdGhpcyBzZXJ2aWNlIGFueW1vcmUsIEknbSBhZnJhaWQuCj4gCj4gQXMgZm9yIHRoZSAiSSBj
cmVhdGUgbXkgb3duIG5vbi1oaWVyYXJjaGljYWwgSVJRIGRvbWFpbiIsIHRoaXMgaXMKPiBzb21l
dGhpbmcgdGhhdCBoYXBwZW5zIGZvciBhbGwgY29tcGxldGVseSBtaXMtZGVzaWduZWQgaW50ZXJy
dXB0Cj4gY29udHJvbGxlcnMsIE1TSSBvciBub3QsIHRoYXQgbXVsdGlwbGV4IGludGVycnVwdHMu
Cj4gCj4gVGhlc2UgaW1wbGVtZW50YXRpb25zIGFyZSBzdHVjayBpbiB0aGUgcHJldmlvdXMgY2Vu
dHVyeSwgYW5kIHNlZWluZwo+IHRoaXMgb24gbW9kZXJuIGRlc2lnbnMsIGZvciBhICJzZXJ2ZXIg
U29DIiwgaXMgcmVhbGx5IHBhdGhldGljLgo+IAo+IG1heWJlIHlvdSBub3cgdW5kZXJzdGFuZCB3
aHkgSSBkb24ndCBvZmZlciB0aGlzIHNvcnQgb2YgcmV2aWV3aW5nCj4gc2VydmljZSBhbnltb3Jl
Lgo+IAoKT2ssIEkgY2FuIHVuZGVyc3RhbmQgeW91ciBwYWluIGFzIGEgbWFpbnRhaW5lci4gSSds
bCB0cnkgbXkgYmVzdCB0byByZXZpZXcgdGhlc2UKaW1wbGVtZW50YXRpb25zIGFzIEkgaGF2ZSBu
byBvdGhlciBjaG9pY2UgOikKCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCv
jSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
