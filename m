Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF896C636D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTJ8dWnJV5CfCkASmlTR1dp/I7zLCPabOBKFWsw+f5c=; b=A+mqs1MVyJAaP0
	2ibY9WhogTZo497D5QaEAF+WpsLI/c+UsgqJENUpoGzKSW70SbiLGZDZ+DCSQhNZO/DJa3sH0Nmxz
	47RKvdIh6b7mDXh0Y48Qmc/PVv9bIqyegDaGaLBF/YJVBg4okNdl+MpUYlJuoyaufIvfKpfTneeRG
	/IkxwSvp9g02pKl0O7g/g9pzzN86L40xYK9jDy+u9vT0dqv00vBWklCbX2RLAeWGy6vJv7+Cf1AL4
	OzzIldSmiY70QBjPsi7u6e1Vt03jZ9LBzVfkf3jQ5nBpg1TYpioejo4KnjEV3f2RIpyamdN2oDIKW
	i4JnWXY3XaMz/9+hZIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8mG-009xyn-Ln; Mon, 06 Feb 2023 21:11:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8mD-009xxg-DJ
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 21:11:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id m14so11679553wrg.13
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC86KoAvXpv+8wZFzH+REYSTORb7w+ZYErKX8Nx95k4=;
        b=aSVunq7LHPF7onCKmJhaCmW36uSCjAfmH491zyI3iOAEpcl2DjyoIWNSiSzrpS6xTN
         upTQqioc+CftRH4JrFM+YnVw1Fygwo+S/Bmeqrn+FExwLMXGhbighCEImkB3LbEHfxB3
         pPZEdv3WoqjTjdS4qov4cnpM7+NBDQNjWuCMv5+UH3CEDixCf7Lt6Xjcbj1Mzs/OZvKR
         NIrWVWjKbBThOFzik29zXn6n1X6BbSxVcjsS+gIYopq+4F5xkjuGoi/EaJf8uHQ77hTV
         DNFFo8Khah5P/qRfg9uC1+q9FUEOXdBpUgPFZDZUYtrmH9uDxG67PQD0Cf4Aw0YX5lEO
         5g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC86KoAvXpv+8wZFzH+REYSTORb7w+ZYErKX8Nx95k4=;
        b=jZppcbegnR/UPk9yvGI8BSWWBfoXguzzmGPUv3PAebJ81qcU4V8qN18zX+HCySUIfK
         CyA2mo8tMJIAtwmO+Cy07CqlWg9LiG1JOcCqjfXKHuYAUWT2KJWb2UOxbTQh0M1VXPQ9
         p7DqMolQzeBiaNQuO9+t/vl3ezE1t1n1BMubL9pNm3KIvpYFfCPBQ03IqtmoGYwS8mPT
         8YZQI05L1GsN/rzPlagO4mJgk+i5RhjMwKZLW/4C/rxp0BBrumYrG72/SVBhmYSf+rjX
         vX2DoopeHSw5SkgjsOKZ/CZd+cWU+w4hayiKwW9DCBKKQXssnz6/k5CGu8TcI7ChEOJh
         xELA==
X-Gm-Message-State: AO0yUKU67HI2BDZxluOpdFO+9oqVdufslGjuzGOHbZuevm3peA/A6bV8
	3ZGUrzaa4d240OI37Nm7Ir3VgA==
X-Google-Smtp-Source: AK7set+qn6JxHyM5CZ+BNMLpM0YVwl27RX//R4K9ijKxYLiMqPu6rBJSBm8bbDpbDwvYPgV3Q3MdRQ==
X-Received: by 2002:a05:6000:1378:b0:2c3:f00c:ebb5 with SMTP id q24-20020a056000137800b002c3f00cebb5mr269377wrz.47.1675717904648;
        Mon, 06 Feb 2023 13:11:44 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d5645000000b002c3efee2f4bsm1530879wrw.80.2023.02.06.13.11.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Feb 2023 13:11:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 0/6] RISC-V Hardware Probing User Interface
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
Date: Mon, 6 Feb 2023 21:11:42 +0000
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Jisheng Zhang <jszhang@kernel.org>,
 linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 Andrew Jones <ajones@ventanamicro.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Mark Brown <broonie@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ruizhe Pan <c141028@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>,
 linux-kselftest@vger.kernel.org,
 slewis@rivosinc.com,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>,
 dram <dramforever@live.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Guo Ren <guoren@kernel.org>,
 Dao Lu <daolu@rivosinc.com>
Message-Id: <212CC1BD-31FF-4B8B-B05D-89C5245EE8A7@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_131149_506017_F2DE4803 
X-CRM114-Status: GOOD (  46.76  )
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

T24gNiBGZWIgMjAyMywgYXQgMjA6MTQsIEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPiB3
cm90ZToKPiAKPiAKPiBUaGVzZSBhcmUgdmVyeSBtdWNoIHVwIGZvciBkaXNjdXNzaW9uLCBhcyBp
dCdzIGEgcHJldHR5IGJpZyBuZXcgdXNlcgo+IGludGVyZmFjZSBhbmQgaXQncyBxdWl0ZSBhIGJp
dCBkaWZmZXJlbnQgZnJvbSBob3cgd2UndmUgaGlzdG9yaWNhbGx5Cj4gZG9uZSB0aGluZ3M6IHRo
aXMgaXNuJ3QganVzdCBwcm92aWRpbmcgYW4gSVNBIHN0cmluZyB0byB1c2Vyc3BhY2UsIHRoaXMK
PiBoYXMgaXRzIG93biBmb3JtYXQgZm9yIHByb3ZpZGluZyBpbmZvcm1hdGlvbiB0byB1c2Vyc3Bh
Y2UuCj4gCj4gVGhlcmUncyBiZWVuIGEgYnVuY2ggb2Ygb2ZmLWxpc3QgZGlzY3Vzc2lvbnMgYWJv
dXQgdGhpcywgaW5jbHVkaW5nIGF0Cj4gUGx1bWJlcnMuICBUaGUgb3JpZ2luYWwgcGxhbiB3YXMg
dG8gZG8gc29tZXRoaW5nIGludm9sdmluZyBwcm92aWRpbmcgYW4KPiBJU0Egc3RyaW5nIHRvIHVz
ZXJzcGFjZSwgYnV0IElTQSBzdHJpbmdzIGp1c3QgYXJlbid0IHN1ZmZpY2llbnQgZm9yIGEKPiBz
dGFibGUgQUJJIGFueSBtb3JlOiBpbiBvcmRlciB0byBwYXJzZSBhbiBJU0Egc3RyaW5nIHVzZXJz
IG5lZWQgdGhlCj4gdmVyc2lvbiBvZiB0aGUgc3BlY2lmaWNhdGlvbnMgdGhhdCB0aGUgc3RyaW5n
IGlzIHdyaXR0ZW4gdG8sIHRoZSB2ZXJzaW9uCj4gb2YgZWFjaCBleHRlbnNpb24gKHNvbWV0aW1l
cyBhdCBhIGZpbmVyIGdyYW51bGFyaXR5IHRoYW4gdGhlIFJJU0MtVgo+IHJlbGVhc2VzL3ZlcnNp
b25zIGVuY29kZSksIGFuZCB0aGUgZXhwZWN0ZWQgdXNlIGNhc2UgZm9yIHRoZSBJU0Egc3RyaW5n
Cj4gKGllLCBpcyBpdCBhIFUtbW9kZSBvciBNLW1vZGUgc3RyaW5nKS4gIFRoYXQncyBhIGxvdCBv
ZiBjb21wbGV4aXR5IHRvCj4gdHJ5IGFuZCBrZWVwIEFCSSBjb21wYXRpYmxlIGFuZCBpdCdzIHBy
b2JhYmx5IGdvaW5nIHRvIGNvbnRpbnVlIHRvIGdyb3csCj4gYXMgZXZlbiBpZiB0aGVyZSdzIG5v
IG1vcmUgY29tcGxleGl0eSBpbiB0aGUgc3BlY2lmaWNhdGlvbnMgd2UnbGwgaGF2ZQo+IHRvIGRl
YWwgd2l0aCB0aGUgdmFyaW91cyBJU0Egc3RyaW5nIHBhcnNpbmcgb2RkaXRpZXMgdGhhdCBlbmQg
dXAgYWxsCj4gb3ZlciB1c2Vyc3BhY2UuCj4gCj4gSW5zdGVhZCB0aGlzIHBhdGNoIHNldCB0YWtl
cyBhIHZlcnkgZGlmZmVyZW50IGFwcHJvYWNoIGFuZCBwcm92aWRlcyBhIHNldAo+IG9mIGtleS92
YWx1ZSBwYWlycyB0aGF0IGVuY29kZSB2YXJpb3VzIGJpdHMgYWJvdXQgdGhlIHN5c3RlbS4gIFRo
ZSBiaWcKPiBhZHZhbnRhZ2UgaGVyZSBpcyB0aGF0IHdlIGNhbiBjbGVhcmx5IGRlZmluZSB3aGF0
IHRoZXNlIG1lYW4gc28gd2UgY2FuCj4gZW5zdXJlIEFCSSBzdGFiaWxpdHksIGJ1dCBpdCBhbHNv
IGFsbG93cyB1cyB0byBlbmNvZGUgaW5mb3JtYXRpb24gdGhhdCdzCj4gdW5saWtlbHkgdG8gZXZl
ciBhcHBlYXIgaW4gYW4gSVNBIHN0cmluZyAoc2VlIHRoZSBtaXNhbGlnbmVkIGFjY2Vzcwo+IHBl
cmZvcm1hbmNlLCBmb3IgZXhhbXBsZSkuICBUaGUgcmVzdWx0aW5nIGludGVyZmFjZSBsb29rcyBh
IGxvdCBsaWtlCj4gd2hhdCBhcm02NCBhbmQgeDg2IGRvLCBhbmQgd2lsbCBob3BlZnVsbHkgZml0
IHdlbGwgaW50byBzb21ldGhpbmcgbGlrZQo+IEFDUEkgaW4gdGhlIGZ1dHVyZS4KPiAKPiBUaGUg
YWN0dWFsIHVzZXIgaW50ZXJmYWNlIGlzIGEgc3lzY2FsbC4gIEknbSBub3QgcmVhbGx5IHN1cmUg
dGhhdCdzIHRoZQo+IHJpZ2h0IHdheSB0byBnbyBhYm91dCB0aGlzLCBidXQgaXQgbWFrZXMgZm9y
IGZsZXhpYmxlIHByb3RvdHlpbmcuCj4gVmFyaW91cyBvdGhlciBhcHByb2FjaGVzIGhhdmUgYmVl
biB0YWxrZWQgYWJvdXQgbGlrZSBtYWtpbmcgSFdDQVAyIGEKPiBwb2ludGVyLCBoYXZpbmcgYSBW
RFNPIHJvdXRpbmUsIG9yIGV4cG9zaW5nIHRoaXMgdmlhIHN5c2ZzLiAgVGhvc2Ugc2VlbQo+IGxp
a2UgZ2VuZXJhbGx5IHJlYXNvbmFibGUgYXBwcm9hY2hlcywgYnV0IEkndmUgeWV0IHRvIGZpZ3Vy
ZSBvdXQgYSB3YXkKPiB0byBnZXQgdGhlIGdlbmVyYWwgY2FzZSB3b3JraW5nIHdpdGhvdXQgYSBz
eXNjYWxsIGFzIHRoYXQncyB0aGUgb25seSB3YXkKPiBJJ3ZlIGNvbWUgdXAgd2l0aCB0byBkZWFs
IHdpdGggdGhlIGhldGVyb2dlbm91cyBDUFUgY2FzZS4gIEhhcHB5IHRvIGhlYXIKPiBpZiBzb21l
b25lIGhhcyBhIGJldHRlciBpZGVhLCB0aG91Z2gsIGFzIEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8g
YWRkIGEKPiBzeXNjYWxsIGlmIHdlIGNhbiBhdm9pZCBpdC4KClBsZWFzZSB3b3JrIHdpdGggaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtYy1hcGktZG9jIGFzCml04oCZcyBj
cnVjaWFsIHdlIGhhdmUgYSBwb3J0YWJsZSBzdGFuZGFyZCBpbnRlcmZhY2UgZm9yIGFwcGxpY2F0
aW9ucyB0bwpxdWVyeSB0aGlzIGluZm9ybWF0aW9uIHRoYXQgd29ya3Mgb24gT1NlcyBvdGhlciB0
aGFuIExpbnV4LiBUaGlzIGNhbiBiZQpiYWNrZWQgYnkgd2hhdGV2ZXIgeW91IHdhbnQsIHdoZXRo
ZXIgYSBzeXNjYWxsLCBtYWdpYyBWRFNPIHRoaW5nLApzeXNmcywgZXRjLCBidXQgaXTigJlzIGtl
eSB0aGF0IHRoZSBleHBvc2VkIGludGVyZmFjZSBvdXRzaWRlIG9mIGxpYmMgaXMKbm90IExpbnV4
LXNwZWNpZmljIG90aGVyd2lzZSB3ZeKAmXJlIGdvaW5nIHRvIGdldCBmcmFnbWVudGF0aW9uIGlu
IHRoaXMKc3BhY2UuCgpJIHdvdWxkIGVuY291cmFnZSBmaWd1cmluZyBvdXQgdGhlIHJpZ2h0IHNo
YXBlIGZvciB0aGUgZXhwb3NlZAppbnRlcmZhY2UgZmlyc3QgYmVmb3JlIGNvbnRpbnVpbmcgdG8g
cmVmaW5lIGRldGFpbHMgb2YgaG93IHRoYXQKaW5mb3JtYXRpb24gZ2V0cyBjb21tdW5pY2F0ZWQg
YmV0d2VlbiB0aGUga2VybmVsIGFuZCBsaWJjLgoKSmVzcwoKPiBBbiBleGFtcGxlIHNlcmllcyBp
biBnbGliYyBleHBvc2luZyB0aGlzIHN5c2NhbGwgYW5kIHVzaW5nIGl0IGluIGFuCj4gaWZ1bmMg
c2VsZWN0b3IgZm9yIG1lbWNweSBjYW4gYmUgZm91bmQgYXQgWzFdLgo+IAo+IFsxXSBodHRwczov
L3B1YmxpYy1pbmJveC5vcmcvbGliYy1hbHBoYS8yMDIzMDIwNjE5NDgxOS4xNjc5NDcyLTEtZXZh
bkByaXZvc2luYy5jb20vVC8jdAo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBDaGFuZ2VkIHRoZSBp
bnRlcmZhY2UgdG8gbG9vayBtb3JlIGxpa2UgcG9sbCgpLiBSYXRoZXIgdGhhbiBzdXBwbHlpbmcK
PiAgIGtleV9vZmZzZXQgYW5kIGdldHRpbmcgYmFjayBhbiBhcnJheSBvZiB2YWx1ZXMgd2l0aCBu
dW1lcmljYWxseQo+ICAgY29udGlndW91cyBrZXlzLCBoYXZlIHRoZSB1c2VyIHByZS1maWxsIHRo
ZSBrZXkgbWVtYmVycyBvZiB0aGUgYXJyYXksCj4gICBhbmQgdGhlIGtlcm5lbCB3aWxsIGZpbGwg
aW4gdGhlIGNvcnJlc3BvbmRpbmcgdmFsdWVzLiBGb3IgYW55IGtleSBpdAo+ICAgZG9lc24ndCBy
ZWNvZ25pemUsIGl0IHdpbGwgc2V0IHRoZSBrZXkgb2YgdGhhdCBlbGVtZW50IHRvIC0xLiBUaGlz
Cj4gICBhbGxvd3MgdXNlcm1vZGUgdG8gcXVpY2tseSBhc2sgZm9yIGV4YWN0bHkgdGhlIGVsZW1l
bnRzIGl0IGNhcmVzCj4gICBhYm91dCwgYW5kIG5vdCBnZXQgYm9nZ2VkIGRvd24gaW4gYSBiYWNr
IGFuZCBmb3J0aCBhYm91dCBuZXdlciBrZXlzCj4gICB0aGF0IG9sZGVyIGtlcm5lbHMgbWlnaHQg
bm90IHJlY29nbml6ZS4gSW4gb3RoZXIgd29yZHMsIHRoZSBrZXJuZWwKPiAgIGNhbiBjb21tdW5p
Y2F0ZSB0aGF0IGl0IGRvZXNuJ3QgcmVjb2duaXplIHNvbWUgb2YgdGhlIGtleXMgd2hpbGUKPiAg
IHN0aWxsIHByb3ZpZGluZyB0aGUgZGF0YSBmb3IgdGhlIGtleXMgaXQgZG9lcyBrbm93Lgo+IC0g
QWRkZWQgYSBzaG9ydGN1dCB0byB0aGUgY3B1c2V0IHBhcmFtZXRlcnMgdGhhdCBpZiBhIHNpemUg
b2YgMCBhbmQKPiAgIE5VTEwgaXMgcHJvdmlkZWQgZm9yIHRoZSBDUFUgc2V0LCB0aGUga2VybmVs
IHdpbGwgdXNlIGEgY3B1IG1hc2sgb2YKPiAgIGFsbCBvbmxpbmUgQ1BVcy4gVGhpcyBpcyBjb252
ZW5pZW50IGJlY2F1c2UgSSBzdXNwZWN0IG1vc3QgY2FsbGVycwo+ICAgd2lsbCBvbmx5IHdhbnQg
dG8gYWN0IG9uIGEgZmVhdHVyZSBpZiBpdCdzIHN1cHBvcnRlZCBvbiBhbGwgQ1BVcywgYW5kCj4g
ICBpdCdzIGEgaGVhZGFjaGUgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUgYW4gYXJyYXkgb2YgYWxs
IDFzLCBub3QgdG8KPiAgIG1lbnRpb24gYSB3YXN0ZSB0byBoYXZlIHRoZSBrZXJuZWwgbG9vcCBv
dmVyIGFsbCBvZiB0aGUgb2ZmbGluZSBiaXRzLgo+IC0gRml4ZWQgbG9naWMgZXJyb3IgaW4gaWYo
b2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcuLi4pIHRoYXQgY2F1c2VkIGNyYXNoCj4gLSBJbmNsdWRl
IGNwdWZlYXR1cmUuaCBpbiBjcHVmZWF0dXJlLmggdG8gYXZvaWQgdW5kZWNsYXJlZCB2YXJpYWJs
ZQo+ICAgd2FybmluZy4KPiAtIEFkZGVkIGEgX01BU0sgZGVmaW5lCj4gLSBGaXggcmFuZG9tIGNo
ZWNrcGF0Y2ggY29tcGxhaW50cwo+IC0gVXBkYXRlZCB0aGUgc2VsZnRlc3RzIHRvIHRoZSBuZXcg
QVBJIGFuZCBhZGRlZCBzb21lIG1vcmUuCj4gLSBGaXhlZCBpbmRlbnRhdGlvbiwgY29tbWVudHMg
aW4gLlMsIGFuZCBnZW5lcmFsIGNoZWNrcGF0Y2ggY29tcGxhaW50cy4KPiAKPiBFdmFuIEdyZWVu
ICg0KToKPiAgUklTQy1WOiBNb3ZlIHN0cnVjdCByaXNjdl9jcHVpbmZvIHRvIG5ldyBoZWFkZXIK
PiAgUklTQy1WOiBBZGQgYSBzeXNjYWxsIGZvciBIVyBwcm9iaW5nCj4gIFJJU0MtVjogaHdwcm9i
ZTogU3VwcG9ydCBwcm9iaW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzIHBlcmZvcm1hbmNlCj4gIHNl
bGZ0ZXN0czogVGVzdCB0aGUgbmV3IFJJU0MtViBod3Byb2JlIGludGVyZmFjZQo+IAo+IFBhbG1l
ciBEYWJiZWx0ICgyKToKPiAgUklTQy1WOiBod3Byb2JlOiBBZGQgc3VwcG9ydCBmb3IgUklTQ1Zf
SFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQQo+ICBkdC1iaW5kaW5nczogQWRkIFJJU0MtViBtaXNh
bGlnbmVkIGFjY2VzcyBwZXJmb3JtYW5jZQo+IAo+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2NwdXMueWFtbCAgICAgICB8ICAxNSArKwo+IERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9i
ZS5yc3QgICAgICAgICAgICAgICB8ICA2NiArKysrKysKPiBEb2N1bWVudGF0aW9uL3Jpc2N2L2lu
ZGV4LnJzdCAgICAgICAgICAgICAgICAgfCAgIDEgKwo+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3B1ZmVhdHVyZS5oICAgICAgICAgICB8ICAyMyArKysKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3cHJvYmUuaCAgICAgICAgICAgICAgfCAgMTMgKysKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NtcC5oICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c3lzY2FsbC5oICAgICAgICAgICAgICB8ICAgMyArCj4gYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCAgICAgICAgIHwgIDM1ICsrKysKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vdW5pc3RkLmggICAgICAgICAgfCAgIDggKwo+IGFyY2gvcmlzY3Yva2VybmVsL2NwdS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQo+IGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyAgICAgICAgICAgICAgICB8ICAzMSArKy0KPiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYyAgICAgICAgICAgICAgICAgfCAxOTIgKysrKysrKysrKysrKysrKystCj4gdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKPiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9NYWtlZmlsZSAgICAgICAgfCAgNTggKysrKysrCj4gLi4u
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvTWFrZWZpbGUgIHwgIDEwICsKPiAuLi4v
dGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9od3Byb2JlLmMgfCAgODkgKysrKysrKysK
PiAuLi4vc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvc3lzX2h3cHJvYmUuUyAgICAgfCAgMTIgKysK
PiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9saWJjLlMgICAgICAgICAgfCAgNDYgKysr
KysKPiAxOCBmaWxlcyBjaGFuZ2VkLCA2MTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKPiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9NYWtlZmlsZQo+
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2Jl
L01ha2VmaWxlCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2h3cHJvYmUvaHdwcm9iZS5jCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvc3lzX2h3cHJvYmUuUwo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9saWJjLlMKPiAKPiAtLSAKPiAyLjI1LjEK
PiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
