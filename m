Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC1BC16B13
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDUn9gqXL+oyZV97qSyZFDm+B+f6Yi2kR1YgrGNYSEQ=; b=Utxkaq8tMZvfbX
	vvuDAZYo8KAf51798NMTSJokS5zs8f5p3X+v8ONK1zGGoWsDZIS2ogCTD6lHvg4XxHxhLUrsV7BD0
	hNU6QtNMQUtGyg2+hs2ZcJ0CuKH6/f/fpuY6IVnwv/sxhriXCEaTHy0vhgfuO92qh0q52SCksi2Ok
	XqQY/gFwYPWCkzsElbQyiREMbvUlxTzY/zlfcerSpEY1N1wHkvZZvzcrNFuXHy+I1byM+rbe7QLuC
	dGCkwH1lx6lDQYTR7BHCjx926Te74h4iqQOjaEH6WwGUZ6gekduOIJyn80qdOB2MqhgULMWckic3c
	mUJG7etEfKHaaCGZOtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDwg-0000000H13W-1TWd;
	Tue, 23 Apr 2024 11:04:18 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDwY-0000000H0rZ-2M2C
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 11:04:16 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ea09b6c826so1191115a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713870231; x=1714475031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcipzruX2A9Yhl78blb5w8gS3iCFD8VtiVRtnpWsvs4=;
        b=ONWHRHdLNKIw4pk0cwmcUgOCXiT45pwg5aZY+NR/Oai3Kxul2I/t53hJFRB4CsGOOQ
         7Gavac332KbWl3y8XH6YPGLmHm/ovGkJW5RRTzfGsyKoK7jHwmyP3Dwg1GeP5v1Ef0kR
         X1abQVxcbCMNQiSNFdBrivUNsjKs0YaF/0i9fxyOSXZj+aRDjSl+swbPJus4HGQLA+Q2
         cX1dTngSj9JcHMRK7T3OrnATKq3UvGiZB9A/JRpL1XkxzVprIGvkgFGZcCCR9Rk+S/4S
         ufMZCt1KIQyrniao0e6v4FnhyvMeFuql429WRO+eNqd1rkk1Yv+pX+Fp2h+D8c6i6pXt
         VOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713870231; x=1714475031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcipzruX2A9Yhl78blb5w8gS3iCFD8VtiVRtnpWsvs4=;
        b=ld83XE2sE6Z2xt4robioO1fN5QGm3Qj2hwoRNOFbLb2IYAWUtWHZHMSVlKDs65KOaM
         W4h/RWKikAPHVSrdY5CvJ3wQSixbMBnDtd/kbO0cBat2ujJOwReFAi2FZuu5TKTG8LEi
         p/P/lpC6PGHyfXK4Av3LDOLmufwbKJlo9i0h8RYhTmZtW4sJy1ifNdkK82sz4ri9Xq6H
         PDB37UHmyVF0SpJIL2r/9/vmDCBEhOcluzBWowKFMRvFUJh3aV9QP9eM9ydyIGHWxAQf
         B7sheNXcrKWpeNroxFmSx7X/REp8dg+jcvpUrJ2NKAC3df6/Pnj4q5J5p/ccoQthX/wL
         gVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx2x1pR6i5zSl0j8X/vrNAcxW/XL/K8xYzkRMQ3ApSsh0Wpm+Dqg4j3PLyWbD6dVqcvpSuT6U7U0sFzz2JbA8q4ZyVBC9th9J4BBO/m72H
X-Gm-Message-State: AOJu0Yyr0W1F9lZR9IXpB8PZn4+1NZk2YuF3T8Chmi2yQBWFW6oiqU2A
	FE02AIO7fKyXsBdJfX7Y/VXTDwq90TyvnPRBUTw8co9cB374A+Kx2lhsLpq4cFUIKwxHkHtbBrP
	ZCGdDFO/j/zZ8+30d/54SuWv87iKNvhllOkoyyA==
X-Google-Smtp-Source: AGHT+IFhGsfWfuGFv/LZLhvGKnt4RFHXPxHS5wX4JPzKOB99V9981I2BjbU0RZ8Sg5EH28NR6FPScsajfozyvhNOLIs=
X-Received: by 2002:a05:6870:55d2:b0:21e:a839:d807 with SMTP id
 qk18-20020a05687055d200b0021ea839d807mr16500749oac.54.1713870231186; Tue, 23
 Apr 2024 04:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com> <d143cd11-26ea-42e3-8f32-700a34b3705e@arm.com>
In-Reply-To: <d143cd11-26ea-42e3-8f32-700a34b3705e@arm.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 23 Apr 2024 19:03:40 +0800
Message-ID: <CAEEQ3wkDMuu+jh56YB3G0vY_ENdUjDL6byMsJXd0C9aQu1FZKw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, john.garry@huawei.com, 
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, sudeep.holla@arm.com, 
	tiantao6@huawei.com, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_040410_622838_1A4A881E 
X-CRM114-Status: GOOD (  20.13  )
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

SGkgUGFsbWVyLAoKT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTE6MjnigK9QTSBKZXJlbXkgTGlu
dG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA0LzE3LzI0
IDIyOjQzLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gQmVmb3JlIGNhY2hlaW5mbyBjYW4gYmUgYnVp
bHQgY29ycmVjdGx5LCB3ZSBuZWVkIHRvIGluaXRpYWxpemUgbGV2ZWwKPiA+IGFuZCB0eXBlLiBT
aW5jZSBSU0lDLVYgY3VycmVudGx5IGRvZXMgbm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0
Cj4gPiBkZXNjcmliZXMgY2FjaGUtcmVsYXRlZCBhdHRyaWJ1dGVzIGxpa2UgQVJNNjQsIHdlIGNh
bm5vdCBvYnRhaW4gdGhlbQo+ID4gZGlyZWN0bHksIHNvIG5vdyB3ZSBvYnRhaW4gY2FjaGUgbGVh
dmVzIGZyb20gdGhlIEFDUEkgUFBUVCB0YWJsZQo+ID4gKGFjcGlfZ2V0X2NhY2hlX2luZm8oKSkg
YW5kIHNldCB0aGUgY2FjaGUgdHlwZSB0aHJvdWdoIHNwbGl0X2xldmVscy4KPiA+Cj4gPiBTdWdn
ZXN0ZWQtYnk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50b25AYXJtLmNvbT4KPiA+IFN1Z2dl
c3RlZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAg
IGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Nh
Y2hlaW5mby5jCj4gPiBpbmRleCAzMGE2ODc4Mjg3YWQuLmU0N2ExZTZiZDNmZSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jYWNoZWluZm8uYwo+ID4gQEAgLTYsNiArNiw3IEBACj4gPiAgICNpbmNsdWRlIDxs
aW51eC9jcHUuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiAgICNpbmNsdWRlIDxh
c20vY2FjaGVpbmZvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+Cj4gPiAgIHN0
YXRpYyBzdHJ1Y3QgcmlzY3ZfY2FjaGVpbmZvX29wcyAqcnZfY2FjaGVfb3BzOwo+ID4KPiA+IEBA
IC03OCw2ICs3OSwyNyBAQCBpbnQgcG9wdWxhdGVfY2FjaGVfbGVhdmVzKHVuc2lnbmVkIGludCBj
cHUpCj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnByZXYgPSBOVUxMOwo+ID4gICAgICAg
aW50IGxldmVscyA9IDEsIGxldmVsID0gMTsKPiA+Cj4gPiArICAgICBpZiAoIWFjcGlfZGlzYWJs
ZWQpIHsKPiA+ICsgICAgICAgICAgICAgaW50IHJldCwgZndfbGV2ZWxzLCBzcGxpdF9sZXZlbHM7
Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJldCA9IGFjcGlfZ2V0X2NhY2hlX2luZm8oY3B1LCAm
ZndfbGV2ZWxzLCAmc3BsaXRfbGV2ZWxzKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkKPiA+
ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgICAgICAg
ICBCVUdfT04oKHNwbGl0X2xldmVscyA+IGZ3X2xldmVscykgfHwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgIChzcGxpdF9sZXZlbHMgKyBmd19sZXZlbHMgPiB0aGlzX2NwdV9jaS0+bnVtX2xlYXZl
cykpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBmb3IgKDsgbGV2ZWwgPD0gdGhpc19jcHVfY2kt
Pm51bV9sZXZlbHM7IGxldmVsKyspIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAobGV2
ZWwgPD0gc3BsaXRfbGV2ZWxzKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
aV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfREFUQSwgbGV2ZWwpOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNI
RV9UWVBFX0lOU1QsIGxldmVsKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisr
LCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9
Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAg
ICB9Cj4gPiArCj4gPiAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiY2FjaGUt
c2l6ZSIpKQo+ID4gICAgICAgICAgICAgICBjaV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hF
X1RZUEVfVU5JRklFRCwgbGV2ZWwpOwo+ID4gICAgICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChucCwgImktY2FjaGUtc2l6ZSIpKQo+Cj4gWWVzLCBsb29rcyBnb29kLgo+Cj4gUmV2aWV3ZWQt
Ynk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50b25AYXJtLmNvbT4KPgo+Cj4KPiBUaGFua3Ms
CgpDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhpcyBwYXRjaHNldD8gVGhhbmtzLgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
