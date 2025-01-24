Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632BCC0218B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHXxl5PGdxiuwV5ak0/qzHYfgg+KnKfQS6kUlygawGg=; b=A6oUju9rtVFa5z
	AL794lSvITJgq6a2xNtWKn4jQ64/iFe4Y0VQVkwC5gzK6BIf2VJiCp+k0yRMGra1LEIKa4T6tOdBb
	ImVnLZw0RKP7g2Q0nYDgSYXhKIdq4lk/TnNg//I/zi2LnUusgfzxIbyth9hUAu4eSVEc/ma9sRtcd
	CQvQK0soaZw3vJSWo1RPPwu635+h/UcS7lN69iMA3LqaaJKabXHUMVJHcROKyesEw0EZyjQQtL8+t
	ZiozoIyplVHj/bPJTk0waYWqkeUjXxhMoFpSt6uB54gsXXNL0j3uw/4vbEGtWXATKDHzE32if6Lf0
	faPBNtdBosgVHlOFRRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJQj-0000000EiUJ-2Pi8;
	Fri, 24 Jan 2025 13:09:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJQh-0000000EiTW-03pM
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 13:09:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2219764e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 05:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737724136; x=1738328936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDJAtGJ/zMEYhFkMGfbSVTh26K1so6Pl/GTU/JVyf0o=;
        b=UjR5zY1akCHqT1xPh13BrwAZDhSS1dPmxGb8GF8bzQ52gXcbDal0SqIHBjGzUEa3Sc
         bkL+uIvWu9pun/hXDn6BUOCHo5PrmpeOc9k4UBCfudzrCsjSqV/YbG9MbI6+ReoywbV/
         og2wSYttr/N306HkNBw1Aq52XQmWMsSg5cikJ5PhvoAOlx38slGTqO75XzBy47oFQO2p
         NCvBK6NnkJky0iKr+FhSEwrhneNo689W8cuLFDeHNA6Y1Ca/SRgUNEqnWBCQ6fGTxmkS
         QUvQTqMY4GEVvSMS+jf+MEMymgH0ij8JhyYvB9fk2xvY6j5m5GwXHksoA2gd2M9v8ph7
         9F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737724136; x=1738328936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDJAtGJ/zMEYhFkMGfbSVTh26K1so6Pl/GTU/JVyf0o=;
        b=uI8zolNxuzyBmzGCiZY0k8R0mdUIAs3NxSiBXxpXyMCc4ZUF+tAETjt5Ulrt4q0n8e
         6Vs2rMrZ3JqT+Q3okJTFTh7cxTBi1wvRLvIXwQZgsTIoszqZzFcamJ5SuZYGybA2k+Xd
         mSq91FEoBY65ta2Wu851WWElkP5t7B2onJCwXbsWXZLEsG3T+5x/6EFxlf1FcnyXdo1+
         VgEGW2CT17O+lA/SoZc8bVVo9Hec+vJV41L/PNU1y7J7vYMlsoalLXqJGgDogKFIAG4e
         vB7+qSbq7Bi0ky3mRaxRoYblYXH1dNXuTZO6HKjvutGQUbYIHB2fFs5lW7c3ApIqePl2
         EdWA==
X-Forwarded-Encrypted: i=1; AJvYcCVxoL4Q6dDLmtx+eWAOmdwQKK1ymjbEfhxr0IK5JrrhzoXlNpgMDPbWlbZM4RLAXZFJ04Zr/tsomLLxJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxhazo9dlBVFvakD+f49yfBzhL7tqOYvUSa1wJwvq9fcJLi8q4
	0SNjp8XjTLo4R32MhdOcbKsxX6MNfy44ei8WX0RjuvCFP2LQvh2WxDgpLhw+NHq+/aNF/F3w/3x
	eu4WRO1uWkp/nPfLakJvf89QKeQ==
X-Gm-Gg: ASbGncsTZLFoeBWV9nqYw6wrIm/99KcmY5t9OAgQFG6MZjsDyI/lqJsHFS374ccfHsG
	uGbp9Wxa0obfM7cxy8o4aoRLo1JqYG0muWMc9kWJn3APFAnY3V0qjObqsHlu/JIHJcn2X2Brmtk
	xU
X-Google-Smtp-Source: AGHT+IGCNvJ7EgcnoF3QHnHMqKw/UAmUFjGDJjH1iVtnR9s74xJWvxerOMvE4ZmsPL/fP9iLvOMiyMoMp3XT2gRsRrI=
X-Received: by 2002:ac2:5471:0:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-5439c2875ecmr8654363e87.52.1737724136244; Fri, 24 Jan 2025
 05:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
 <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
 <6ebe8b7c-7df3-4bea-9175-35512e9960a7@ghiti.fr> <Z5NG7-0YyophMcZy@ghost>
In-Reply-To: <Z5NG7-0YyophMcZy@ghost>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 24 Jan 2025 08:08:44 -0500
X-Gm-Features: AWEUYZnIDwsF945WyHr9mtBFNIjlBwvALsm-NE6fl2eYJrt8m8IoEvZ8uO1jeLo
Message-ID: <CAMzpN2gL9GWx-YzJd+sgQ30=gk3TN342W8Memz5j1C02jgQfrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and kernel
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_050859_059907_4EF74273 
X-CRM114-Status: GOOD (  30.44  )
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

T24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMjo1M+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMDg6MTk6
MThBTSArMDEwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gSGkgQ2hhcmxpZSwKPiA+Cj4g
PiBPbiAyMy8wMS8yMDI1IDIwOjE0LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+IFRoaXMg
ZnVuY3Rpb24gd2FzIHVuaWZpZWQgaW50byBhIHNpbmdsZSBmdW5jdGlvbiBpbiBjb21taXQgYWI5
MTY0ZGFlMjczCj4gPiA+ICgicmlzY3Y6IGVudHJ5OiBDb25zb2xpZGF0ZSByZXRfZnJvbV9rZXJu
ZWxfdGhyZWFkIGludG8gcmV0X2Zyb21fZm9yayIpLgo+ID4gPiBIb3dldmVyIHRoYXQgaW1wb3Nl
ZCBhIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLiBQYXJ0aWFsbHkgcmV2ZXJ0aW5nIHRoaXMKPiA+
ID4gY29tbWl0IHRvIGhhdmUgcmV0X2Zyb21fZm9yaygpIHNwbGl0IGFnYWluIHJlc3VsdHMgaW4g
YSAxJSBpbmNyZWFzZSBvbgo+ID4gPiB0aGUgbnVtYmVyIG9mIHRpbWVzIGZvcmsgaXMgYWJsZSB0
byBiZSBjYWxsZWQgcGVyIHNlY29uZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxp
ZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIHwgIDMgKystCj4gPiA+ICAgYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKy0tLQo+ID4g
PiAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8IDE3ICsrKysrKysr
KysrLS0tLS0tCj4gPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYXNtLXByb3RvdHlwZXMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlw
ZXMuaAo+ID4gPiBpbmRleCA3MzNmZjYwOTc3ODc5NzAwMTAwNmMzM2JiYTllM2NjNWIxZjE1Mzg3
Li5iZmM4ZWE1ZjkzMTliMTk0NDllYzU5NDkzYjQ1YjkyNmRmODg4ODMyIDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oCj4gPiA+IEBAIC01Miw3ICs1
Miw4IEBAIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3MpOwo+ID4gPiAgIERF
Q0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX20pOwo+ID4gPiAgIERFQ0xBUkVfRE9f
RVJST1JfSU5GTyhkb190cmFwX2JyZWFrKTsKPiA+ID4gLWFzbWxpbmthZ2Ugdm9pZCByZXRfZnJv
bV9mb3JrKHZvaWQgKmZuX2FyZywgaW50ICgqZm4pKHZvaWQgKiksIHN0cnVjdCBwdF9yZWdzICpy
ZWdzKTsKPiA+ID4gK2FzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX2tlcm5lbCh2b2lkICpm
bl9hcmcsIGludCAoKmZuKSh2b2lkICopLCBzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiA+ICth
c21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9ya191c2VyKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsK
PiA+ID4gICBhc21saW5rYWdlIHZvaWQgaGFuZGxlX2JhZF9zdGFjayhzdHJ1Y3QgcHRfcmVncyAq
cmVncyk7Cj4gPiA+ICAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpOwo+ID4gPiAgIGFzbWxpbmthZ2Ugdm9pZCBkb19pcnEoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpOwo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+ID4gaW5kZXggOTIyNWMzMjIyNzlhYTkwZTczN2Ix
ZDcxNDRkYjA4NDMxOWNmODEwMy4uOTM4NmVmNzQ0NDI2N2YwYjliZjhhMDU1MGY0ZTMxZGVhZWI4
NTg4MSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiA+IEBAIC0zMTksMTQgKzMxOSwyMSBA
QCBTWU1fQ09ERV9FTkQoaGFuZGxlX2tlcm5lbF9zdGFja19vdmVyZmxvdykKPiA+ID4gICBBU01f
Tk9LUFJPQkUoaGFuZGxlX2tlcm5lbF9zdGFja19vdmVyZmxvdykKPiA+ID4gICAjZW5kaWYKPiA+
ID4gLVNZTV9DT0RFX1NUQVJUKHJldF9mcm9tX2ZvcmtfYXNtKQo+ID4gPiArU1lNX0NPREVfU1RB
UlQocmV0X2Zyb21fZm9ya19rZXJuZWxfYXNtKQo+ID4gPiAgICAgY2FsbCBzY2hlZHVsZV90YWls
Cj4gPiA+ICAgICBtb3ZlIGEwLCBzMSAvKiBmbiAqLwo+ID4gPiAgICAgbW92ZSBhMSwgczAgLyog
Zm5fYXJnICovCj4gPiA+ICAgICBtb3ZlIGEyLCBzcCAvKiBwdF9yZWdzICovCj4gPiA+IC0gICBj
YWxsIHJldF9mcm9tX2ZvcmsKPiA+ID4gKyAgIGNhbGwgcmV0X2Zyb21fZm9ya19rZXJuZWwKPiA+
ID4gICAgIGogcmV0X2Zyb21fZXhjZXB0aW9uCj4gPiA+IC1TWU1fQ09ERV9FTkQocmV0X2Zyb21f
Zm9ya19hc20pCj4gPiA+ICtTWU1fQ09ERV9FTkQocmV0X2Zyb21fZm9ya19rZXJuZWxfYXNtKQo+
ID4gPiArCj4gPiA+ICtTWU1fQ09ERV9TVEFSVChyZXRfZnJvbV9mb3JrX3VzZXJfYXNtKQo+ID4g
PiArICAgY2FsbCBzY2hlZHVsZV90YWlsCj4gPiA+ICsgICBtb3ZlIGEwLCBzcCAvKiBwdF9yZWdz
ICovCj4gPiA+ICsgICBjYWxsIHJldF9mcm9tX2ZvcmtfdXNlcgo+ID4gPiArICAgaiByZXRfZnJv
bV9leGNlcHRpb24KPiA+ID4gK1NZTV9DT0RFX0VORChyZXRfZnJvbV9mb3JrX3VzZXJfYXNtKQo+
ID4gPiAgICNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+ID4gPiAgIC8qCj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9j
ZXNzLmMKPiA+ID4gaW5kZXggMGQwN2U2ZDhmNmI1N2JlYmE0MzhkYmJhNWU4Yzc0YTAxNDU4MmJl
ZS4uNWYxNTIzNmNiNTI2YmQ5ZmU2MTYzNmVkMzcyYjRiNzZjOTRkZjk0NiAxMDA2NDQKPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Nlc3MuYwo+ID4gPiBAQCAtMzgsNyArMzgsOCBAQCB1bnNpZ25lZCBsb25nIF9f
c3RhY2tfY2hrX2d1YXJkIF9fcmVhZF9tb3N0bHk7Cj4gPiA+ICAgRVhQT1JUX1NZTUJPTChfX3N0
YWNrX2Noa19ndWFyZCk7Cj4gPiA+ICAgI2VuZGlmCj4gPiA+IC1leHRlcm4gYXNtbGlua2FnZSB2
b2lkIHJldF9mcm9tX2ZvcmtfYXNtKHZvaWQpOwo+ID4gPiArZXh0ZXJuIGFzbWxpbmthZ2Ugdm9p
ZCByZXRfZnJvbV9mb3JrX2tlcm5lbF9hc20odm9pZCk7Cj4gPiA+ICtleHRlcm4gYXNtbGlua2Fn
ZSB2b2lkIHJldF9mcm9tX2ZvcmtfdXNlcl9hc20odm9pZCk7Cj4gPiA+ICAgdm9pZCBub2luc3Ry
IGFyY2hfY3B1X2lkbGUodm9pZCkKPiA+ID4gICB7Cj4gPiA+IEBAIC0yMDgsMTQgKzIwOSwxOCBA
QCBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVj
dCB0YXNrX3N0cnVjdCAqc3JjKQo+ID4gPiAgICAgcmV0dXJuIDA7Cj4gPiA+ICAgfQo+ID4gPiAt
YXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmsodm9pZCAqZm5fYXJnLCBpbnQgKCpmbikodm9p
ZCAqKSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICthc21saW5rYWdlIHZvaWQgcmV0X2Zy
b21fZm9ya19rZXJuZWwodm9pZCAqZm5fYXJnLCBpbnQgKCpmbikodm9pZCAqKSwgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gPiA+ICAgewo+ID4gPiAtICAgaWYgKHVubGlrZWx5KGZuKSkKPiA+ID4g
LSAgICAgICAgICAgZm4oZm5fYXJnKTsKPiA+ID4gKyAgIGZuKGZuX2FyZyk7Cj4gPiA+ICAgICBz
eXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gPiAgIH0KPiA+ID4gK2FzbWxpbmth
Z2Ugdm9pZCByZXRfZnJvbV9mb3JrX3VzZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICt7
Cj4gPiA+ICsgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gPiArfQo+ID4g
PiArCj4gPiA+ICAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qg
c3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQo+ID4gPiAgIHsKPiA+ID4gICAgIHVuc2ln
bmVkIGxvbmcgY2xvbmVfZmxhZ3MgPSBhcmdzLT5mbGFnczsKPiA+ID4gQEAgLTIzOCw2ICsyNDMs
NyBAQCBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBzdHJ1Y3Qg
a2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCj4gPiA+ICAgICAgICAgICAgIHAtPnRocmVhZC5zWzBd
ID0gKHVuc2lnbmVkIGxvbmcpYXJncy0+Zm47Cj4gPiA+ICAgICAgICAgICAgIHAtPnRocmVhZC5z
WzFdID0gKHVuc2lnbmVkIGxvbmcpYXJncy0+Zm5fYXJnOwo+ID4gPiArICAgICAgICAgICBwLT50
aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9mb3JrX2tlcm5lbF9hc207Cj4gPiA+
ICAgICB9IGVsc2Ugewo+ID4gPiAgICAgICAgICAgICAqY2hpbGRyZWdzID0gKihjdXJyZW50X3B0
X3JlZ3MoKSk7Cj4gPiA+ICAgICAgICAgICAgIC8qIFR1cm4gb2ZmIHN0YXR1cy5WUyAqLwo+ID4g
PiBAQCAtMjQ3LDEyICsyNTMsMTEgQEAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVj
dCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQo+ID4gPiAgICAgICAg
ICAgICBpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgY2hpbGRyZWdzLT50cCA9IHRsczsKPiA+ID4gICAgICAgICAgICAgY2hpbGRyZWdzLT5h
MCA9IDA7IC8qIFJldHVybiB2YWx1ZSBvZiBmb3JrKCkgKi8KPiA+ID4gLSAgICAgICAgICAgcC0+
dGhyZWFkLnNbMF0gPSAwOwo+ID4gPiArICAgICAgICAgICBwLT50aHJlYWQucmEgPSAodW5zaWdu
ZWQgbG9uZylyZXRfZnJvbV9mb3JrX3VzZXJfYXNtOwo+ID4gPiAgICAgfQo+ID4gPiAgICAgcC0+
dGhyZWFkLnJpc2N2X3ZfZmxhZ3MgPSAwOwo+ID4gPiAgICAgaWYgKGhhc192ZWN0b3IoKSkKPiA+
ID4gICAgICAgICAgICAgcmlzY3Zfdl90aHJlYWRfYWxsb2MocCk7Cj4gPiA+IC0gICBwLT50aHJl
YWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9mb3JrX2FzbTsKPiA+ID4gICAgIHAtPnRo
cmVhZC5zcCA9ICh1bnNpZ25lZCBsb25nKWNoaWxkcmVnczsgLyoga2VybmVsIHNwICovCj4gPiA+
ICAgICByZXR1cm4gMDsKPiA+ID4gICB9Cj4gPiA+Cj4gPgo+ID4gQ2FuIHlvdSBiZW5jaG1hcmsg
dGhpcyBjaGFuZ2Ugb24gc29tZSBIVz8gSSdtIG5vdCBzdXJlIHdlIHdvdWxkIGluZGVlZCBnYWlu
Cj4gPiB0aGlzIDElLgo+Cj4gSXQgcmVkdWNlcyB0aGUgc3lzY2FsbCBwYXRoIGJ5IDMgaW5zdHJ1
Y3Rpb25zLCB0d28gZm9yIG5vdCBuZWVkaW5nIHRvCj4gbW92ZSB0aGUgZm4gYW5kIGZuX2FyZ3Mg
ZnJvbToKPgo+IG1vdmUgYTAsIHMxIC8qIGZuICovCj4gbW92ZSBhMSwgczAgLyogZm5fYXJnICov
Cj4KPiBBbmQgb25lIGZvciBub3QgbmVlZGluZyB0byBkbyB0aGUgY29uZGl0aW9uYWwuIFRoaXMg
b25lIGlzIGFsc28gc2F2ZWQgb24KPiBrZXJuZWwgdGhyZWFkcy4KPgo+IEl0J3MgYSB2ZXJ5IHNt
YWxsIGltcHJvdmVtZW50LCBidXQgdGhlcmUgaXMgb25seSBzb21ldGhpbmcgbGlrZSAxMDAKPiBp
bnN0cnVjdGlvbnMgYWxvbmcgdGhlIGRpcmVjdCBzeXNjYWxsIHBhdGggc28gaXQgZW5kcyB1cCBi
ZWluZyBhIGxhcmdlCj4gcGVyY2VudGFnZS4gT24gaGFyZHdhcmUgbW92aW5nIHJlZ2lzdGVycyBp
cyB2ZXJ5IGNoZWFwIGFuZCB0aGlzIGJyYW5jaAo+IHdpbGwgYmUgYWxtb3N0IGFsd2F5cyBiZSBj
b3JyZWN0bHkgcHJlZGljdGVkIHNvIHRoZSBjb3N0IGlzIGNsb3NlIHRvCj4gemVyby4gSSBqdXN0
IGZpZ3VyZWQgdGhhdCBzaW5jZSBJIGFtIG1ha2luZyBjaGFuZ2VzIGFyb3VuZCBoZXJlIGl0IHdv
dWxkCj4gYmUgbmljZSBpZiBpdCB3YXMgb3B0aW1hbCBpbnN0ZWFkIG9mIGJlaW5nIGNsb3NlIHRv
IG9wdGltYWwuCgpUaGF0IG1heSBiZSB0aGUgY2FzZSBvbiB0aGUgY2hpbGQgcHJvY2VzcyBzaWRl
LCBidXQgY29tcGFyZWQgdG8gdGhlCmNvc3Qgb2YgdGhlIGZvcmsgb24gdGhlIHBhcmVudCBwcm9j
ZXNzIHNpZGUgKGFsbG9jYXRpbmcgYW5kCmluaXRpYWxpemluZyBhIG5ldyB0YXNrIHN0cnVjdCks
IGl0J3MgbWluaXNjdWxlLgoKCgpCcmlhbiBHZXJzdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
