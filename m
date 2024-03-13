Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36F6C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dmkJUs5m86L+ZOADWuBrF2eGzPq6YOekbF/E1Syjj8=; b=mheGMmcgZxkLnK
	ajAHzEw2m4l2HfAd+A+8gBfQoDXJnEXysO1/jtepPUzi5P2S5o2ni1fdy8+zbRfjtuDVW99+V8jj6
	u1/7BSE7y6bEHcYBTSM63yUqoQ3QomxiZzM0UavNJ1QVwP0vq1cHXSesiM02snbdlwLSiJspP+R1Z
	Q/00dZxqDBoQJokFC+YuhOAJ6aPfL7Hm0pooaSxhmVpKG31JA/8bUPV8MDmAkF0UKLIYrBHP9BMn6
	hV/9z9wFL6xpAwFC/N0/WfZ4KlQlcYu+FqVPO/cLsw91KV4TA9aFleXPghIKWob721g6KZbtQ9wSo
	GccCexw3aqeSN0tw4I+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkR8D-0000000AiLU-1rWr;
	Wed, 13 Mar 2024 16:07:05 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkR88-0000000AiHB-3zWb
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 16:07:02 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-789cd43c77dso27364685a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710346015; x=1710950815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRzWQkcGI4VUKzs6gwS4GB6+OKCj9YOx8VUKrvxZkDE=;
        b=CuLJb2zdISgbT3sWrMtxTqgbmWd++F5IXzzybQLEhfcXQf0v0kvaO5UWvF0TVFj5Qx
         e80tnCUctzV1rBnF53A5qCpN3DhI/d0Uiq2tOJRyR1motPda1bxnlSLf5Mr7zMR4p+Zl
         0isKuY67ZjgNnKRptGSnLVrOUrNM0/MmNhSJ1x47pCibHMvvE2XwsdL8IrLCHdU8GlVo
         8u39OoZHFVC4/gEtkKxVElrk7e9P6gcGMB9SBMucoYETfjriHrBWcL6Syom45sOwgyQH
         OxhuGTnU1NYckS0j99Zq5jZNuYuLr3ysbdcxBKrFyCQ7isaYsQLGF6UtR9ktRSAywHfv
         QRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710346015; x=1710950815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRzWQkcGI4VUKzs6gwS4GB6+OKCj9YOx8VUKrvxZkDE=;
        b=uv8XzK2LOKJ0dX2rObLu1wl23eSuHPL31YeQuYet0/bxtPavCvZqEPlR/SdfYhL5NW
         FMV/mFrZzF69vsOQNl4GrJG1K2TkBC0QIf0exu5f05k6G6Ve/F1fNKnHDBA3VjVjGBiz
         /xuraSsADIBblqXy7MmmZx//Hj25xba3a4JOaT9/gPrJPPp9ia/QEWfJTdI6u3EHrRkc
         AzFa4y7JwzaBRsmiKky1jcgeihdoJCMBsysRnUdOs4DKYOpOyYPX06zqb6N6yfYsQRRJ
         /qutkRHJQ2+ShBsJOLy2vU7z92e4UyR/t7NTdXdJd2a487qKmRyLjsaM2+LWgW2FAsrP
         M1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWKgK0glDdtZVMFzbmQMsNPgCJnW/83Epc7VvHYld+c6PpNMFz4mv2kYBoDSTgY9ik+ASW7yvH9QBYibE8TPhvA1ydFhZGcPG2yMyK2ZyPd
X-Gm-Message-State: AOJu0YyhL3JWAnz1EKeCNfSEbQ1W+jlmfi/0jOGYwLGSXIvwJpGleZ4l
	shMzOZFH4zO+Tptd73c+a/eSXFIrU5TOdloQX3I2BJyN0D7rvyimLWn4ZnRbgig=
X-Google-Smtp-Source: AGHT+IF66winHwsZTzBvf8Uey5RMKI0SX4CQ5488zJ8YeRxzDzvy84lnyO0cdv/SDDbyPhlyPr9KWw==
X-Received: by 2002:a05:620a:5634:b0:788:731d:7120 with SMTP id vv20-20020a05620a563400b00788731d7120mr284640qkn.19.1710346015070;
        Wed, 13 Mar 2024 09:06:55 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id k25-20020a05620a07f900b007884003f9a0sm4895880qkk.122.2024.03.13.09.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 09:06:54 -0700 (PDT)
Message-ID: <aac2aeca-0447-4f2f-ab3b-b4412e8a09f1@sifive.com>
Date: Wed, 13 Mar 2024 11:06:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
 <42665ccc-d020-48c4-a5bb-2713f7cbb75c@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <42665ccc-d020-48c4-a5bb-2713f7cbb75c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_090701_080140_C879845A 
X-CRM114-Status: GOOD (  18.09  )
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

T24gMjAyNC0wMy0xMyA5OjQzIEFNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAxMi8wMy8y
MDI0IDIwOjI1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4gQ29tbWl0IDhlYzk5YjAzMzE0NyAo
ImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBhCj4+IHBsYXRm
b3JtIGRyaXZlciIpIGJyb2tlIHRoZSBNTUlPIHRpbWVyIG9uIHRoZSBBbGx3aW5uZXIgRDEgU29D
IGJlY2F1c2UKPj4gdGhlIElSUSBkb21haW4gaXMgbm8gbG9uZ2VyIGF2YWlsYWJsZSB3aGVuIHRp
bWVyX3Byb2JlKCkgaXMgY2FsbGVkOgo+IAo+IERpZCB5b3UgbWVhbjogcy9ubyBsb25nZXIgYXZh
aWxhYmxlL25vdCB5ZXQgYXZhaWxhYmxlLyA/CgpJIG1lYW4gdGhhdCwgYmVmb3JlIHRoaXMgY29t
bWl0LCB0aGUgSVJRIGRvbWFpbiB3YXMgYXZhaWxhYmxlIGR1cmluZwp0aW1lcl9wcm9iZSgpOyBi
dXQgYWZ0ZXIgdGhpcyBjb21taXQsIHRoZSBJUlEgZG9tYWluIGlzIG5vdCBhdmFpbGFibGUgZHVy
aW5nCnRpbWVyX3Byb2JlKCkuCgo+PiDCoMKgIFvCoMKgwqAgMC4wMDAwMDBdIGlycTogbm8gaXJx
IGRvbWFpbiBmb3VuZCBmb3IgaW50ZXJydXB0LWNvbnRyb2xsZXJAMTAwMDAwMDAgIQo+PiDCoMKg
IFvCoMKgwqAgMC4wMDAwMDBdIEZhaWxlZCB0byBtYXAgaW50ZXJydXB0IGZvciAvc29jL3RpbWVy
QDIwNTAwMDAKPj4gwqDCoCBbwqDCoMKgIDAuMDAwMDAwXSBGYWlsZWQgdG8gaW5pdGlhbGl6ZSAn
L3NvYy90aW1lckAyMDUwMDAwJzogLTIyCj4+Cj4+IEZpeCB0aGlzIGJ5IHdyYXBwaW5nIHRoZSB0
aW1lciBpbml0aWFsaXphdGlvbiBpbiBhIHBsYXRmb3JtIGRyaXZlci4KPj4gYnVpbHRpbl9wbGF0
Zm9ybV9kcml2ZXJfcHJvYmUoKSBtdXN0IGJlIHVzZWQgYmVjYXVzZSB0aGUgZHJpdmVyIHVzZXMK
Pj4gdGltZXJfb2ZfaW5pdCgpLCB3aGljaCBpcyBtYXJrZWQgYXMgX19pbml0LiBPbmx5IGNvbnZl
cnQgdGhlIHN1bjhpCj4+IHZhcmlhbnRzIG9mIHRoZSBoYXJkd2FyZSwgYmVjYXVzZSBzb21lIG9s
ZGVyIFNvQ3Mgc3RpbGwgbmVlZCB0aGUgdGltZXIKPj4gcHJvYmVkIGVhcmx5IGZvciBzY2hlZF9j
bG9jaygpLgo+Pgo+PiBGaXhlczogOGVjOTliMDMzMTQ3ICgiaXJxY2hpcC9zaWZpdmUtcGxpYzog
Q29udmVydCBQTElDIGRyaXZlciBpbnRvIGEgcGxhdGZvcm0KPj4gZHJpdmVyIikKPj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+IC0t
LQo+Pgo+PiDCoCBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMgfCAyNCArKysrKysr
KysrKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXN1bjRpLmMKPj4gYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjRpLmMKPj4gaW5k
ZXggN2JkY2M2MGFkNDNjLi43MjhkYWMyYmFhODQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvdGltZXItc3VuNGkuYwo+PiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVy
LXN1bjRpLmMKPj4gQEAgLTIwLDYgKzIwLDcgQEAKPj4gwqAgI2luY2x1ZGUgPGxpbnV4L29mLmg+
Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51
eC9vZl9pcnEuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4gwqAg
wqAgI2luY2x1ZGUgInRpbWVyLW9mLmgiCj4+IMKgIEBAIC0yMTgsOSArMjE5LDI0IEBAIHN0YXRp
YyBpbnQgX19pbml0IHN1bjRpX3RpbWVyX2luaXQoc3RydWN0IGRldmljZV9ub2RlCj4+ICpub2Rl
KQo+PiDCoCB9Cj4+IMKgIFRJTUVSX09GX0RFQ0xBUkUoc3VuNGksICJhbGx3aW5uZXIsc3VuNGkt
YTEwLXRpbWVyIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3VuNGlfdGlt
ZXJfaW5pdCk7Cj4+IC1USU1FUl9PRl9ERUNMQVJFKHN1bjhpX2EyMywgImFsbHdpbm5lcixzdW44
aS1hMjMtdGltZXIiLAo+PiAtwqDCoMKgwqDCoMKgwqDCoCBzdW40aV90aW1lcl9pbml0KTsKPj4g
LVRJTUVSX09GX0RFQ0xBUkUoc3VuOGlfdjNzLCAiYWxsd2lubmVyLHN1bjhpLXYzcy10aW1lciIs
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgIHN1bjRpX3RpbWVyX2luaXQpOwo+PiDCoCBUSU1FUl9PRl9E
RUNMQVJFKHN1bml2LCAiYWxsd2lubmVyLHN1bml2LWYxYzEwMHMtdGltZXIiLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdW40aV90aW1lcl9pbml0KTsKPj4gKwo+PiArc3Rh
dGljIGludCBfX2luaXQgc3VuNGlfdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gc3VuNGlfdGltZXJfaW5pdChkZXZfb2Zfbm9k
ZSgmcGRldi0+ZGV2KSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHN1bjRpX3RpbWVyX29mX21hdGNoW10gPSB7Cj4+ICvCoMKgwqAgeyAuY29tcGF0aWJs
ZSA9ICJhbGx3aW5uZXIsc3VuOGktYTIzLXRpbWVyIiB9LAo+PiArwqDCoMKgIHsgLmNvbXBhdGli
bGUgPSAiYWxsd2lubmVyLHN1bjhpLXYzcy10aW1lciIgfSwKPj4gK8KgwqDCoCB7IC8qIHNlbnRp
bmVsICovIH0KPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN1
bjRpX3RpbWVyX2RyaXZlciA9IHsKPj4gK8KgwqDCoCAuZHJpdmVywqDCoMKgID0gewo+PiArwqDC
oMKgwqDCoMKgwqAgLm5hbWXCoMKgwqDCoMKgwqDCoCA9ICJzdW40aS10aW1lciIsCj4+ICvCoMKg
wqDCoMKgwqDCoCAub2ZfbWF0Y2hfdGFibGXCoMKgwqAgPSBzdW40aV90aW1lcl9vZl9tYXRjaCwK
Pj4gK8KgwqDCoCB9LAo+PiArfTsKPj4gK2J1aWx0aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKHN1
bjRpX3RpbWVyX2RyaXZlciwgc3VuNGlfdGltZXJfcHJvYmUpOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
