Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404EBE68953
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 05:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcnYdtnaXTBxmsD7j/6ynH6vKFk8kaIJ68vgIcvIqac=; b=i8Kcv3I+UoIqO2
	61151k5FdCT3JHoxCSgCRyvByfE0r0q17WRyphsZoKzXVj6hxaOSteYAJW5pLfrVLBZgK2B0Pe59w
	8wuhvykHUINxP/AKCB+uNLx8BsNldNRgt50edtJuC+p2nWgG+cDTphwHSIwuPzUqjSOA73NmlkZTc
	BitfNrZbd/5lO/NWMZOS8zczD1HfnEYZIMnXCAIWNa+p0HB7WuC+hufnAo+LseQQxFk5zQO7+ok27
	Oz6zYltBg+X0gIMBoZKDrV4IFKeAOkn8HRO+I3c3lxR79x/Lsl9atd4R8rUe8g9lbxgWlcdRTUoDS
	vF2xdySnOZaUZLpTDPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6NP6-00000002ZKj-1HSl;
	Thu, 31 Oct 2024 05:07:28 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6NP3-00000002ZJs-0UFX
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 05:07:26 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-83abf71f244so17998739f.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 22:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1730351243; x=1730956043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVGxidBrPIxC7Pw8/J9gabfFzysrA/7Cy/+pGzP21As=;
        b=zCYfAbPPmW/yWCoiMfV9eHIOy6dZzzUDIF2Bkzt79UQxrXYaHaY0ePPZ1yWP1nGthb
         QgyMI6ipfWzt1Xnz6HdxwtYP7Uku4EQMocKLxijYcoC/cS8z3UGUdgs0ePPF0t+z7NJl
         erZgSV0XPd4yqFW4gTutcYf6HCTW3qnOr+u2kwUNbwmsoeYd9euAzX3u7FKROTFqnbYt
         Utecf9LxoCBWsMbQNXU8UoZr9Zv+xyhB+OUrhOju2cdUJ/ZaM68V/ZWFItZf3V5FSw5T
         P+WfFejjagLNtdf7nWGMVRIZDBkouvhXzB/LAF5ZBndrFdKF+HKiq8fRTvKFRntsvx3j
         ZmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730351243; x=1730956043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVGxidBrPIxC7Pw8/J9gabfFzysrA/7Cy/+pGzP21As=;
        b=n0foQVQKxSKHoTyd0KnnzVIZ0xpHUAhYuIbLOCrNXoOQG0x7iwbRbAmsONnNBtCNsj
         4BacIQI/YHX7CKGSoSeuYSO2EtBytVguVFA7YUmcI+uO6rkBlakHY/RuXG7okB+XBlgM
         9pEnxrTC9+PgBCFqEY4mKgKi6jkLTs2ONREfUk7uC0EggwM25111uRkomF5pVEoKy+v5
         9ivFq1/h8NGUF3XnNM/4r/88gtNx2i7baaKgwOjOfgsZ1ddhK1iKu3sHK6YpGnHj2zOg
         btsM7CkkddXwvZfLKbvh5z3biZ/ULy8Ltr4y7RwC87MPFwyaqxh4EFAawVDgdo6+RSFB
         KwCA==
X-Forwarded-Encrypted: i=1; AJvYcCVWJP2lgOncafMNHCoH/DVvjfqi5my42sjDdlolCOFaA23+3PZL0MEQFhAXzLTDxsyjCethY7uFplwiNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbCqnGTgN8sC5iXqGLEL1nwFZvx9ErCASA1AXKO4S76PSEne21
	GxxwNYgyHpRVt421JNpDoA31hPX+80lgtV9bwxjamstnzR7MDgNb+C8tWcZxn/+uLhUvqXGJ5Ql
	lW2M1qTcgO3a8nKkgOb4/9YY7/RqDrZjvscrewQ==
X-Google-Smtp-Source: AGHT+IGKSS0oE6ZZZVTE5+2/YcSg10PO2QOjMDrhYFcNxF/PI3ziUnGYHfAwByoaNayiDU4uhIQ2KaN8z8HN2+g036w=
X-Received: by 2002:a05:6e02:1a45:b0:3a3:96c4:29bc with SMTP id
 e9e14a558f8ab-3a60f217586mr23325355ab.11.1730351243169; Wed, 30 Oct 2024
 22:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241022040218.450573-1-inochiama@gmail.com> <20241022040218.450573-3-inochiama@gmail.com>
 <87jzdr2vyg.ffs@tglx>
In-Reply-To: <87jzdr2vyg.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 31 Oct 2024 10:37:10 +0530
Message-ID: <CAAhSdy3Rmhhv5uzOzCT_B3EzQiXgV1FejZQbc5sLpwwFOXd5cg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yangyu Chen <cyy@cyyself.name>, 
	Hal Feng <hal.feng@starfivetech.com>, Yixun Lan <dlan@gentoo.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_220725_455966_2E35E63C 
X-CRM114-Status: GOOD (  14.76  )
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

SGkgVGhvbWFzLAoKT24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMToxNuKAr1BNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDIyIDIwMjQg
YXQgMTI6MDIsIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gPiBBZGQgYSBkcml2ZXIgZm9yIHRoZSBU
LUhFQUQgQzkwMCBBQ0xJTlQgU1NXSSBkZXZpY2UsIHdoaWNoIGlzIGFuCj4gPiBlbmhhbmNlZCBp
bXBsZW1lbnRhdGlvbiBvZiB0aGUgUklTQy1WIEFDTElOVCBTU1dJIHNwZWNpZmljYXRpb24uCj4g
PiBUaGlzIGRldmljZSBhbGxvd3MgdGhlIHN5c3RlbSB0byBzZW5kIGlwaSB2aWEgZmFzdCBkZXZp
Y2UgaW50ZXJmYWNlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBnbWFpbC5jb20+Cj4KPiBDYW4gc29tZW9uZSBmcm9tIHRoZSBSSVNDViBmb2xrcyBwbGVh
c2UgY29uZmlybSB0aGF0IHRodGlzIGlzIGdvb2QgdG8KPiBnbz8KClRoZSBULUhFQUQgQzkwMCBB
Q0xJTlQgU1NXSSBpcyBub3QgY29tcGxpYW50IHRvIGFueSBSSVNDLVYgc3BlY2lmaWNhdGlvbgpz
byBhdCB0aGlzIHBvaW50IGl0IGlzIGEgVC1IRUFEIHNwZWNpZmljIGRldmljZS4gVGhlIFJJU0Mt
ViBBQ0xJTlQgU1NXSQpzcGVjaWZpY2F0aW9uIGNpdGVkIGJ5IHRoaXMgZHJpdmVyIHdhcyBuZXZl
ciByYXRpZmllZCBieSBSSVNDLVYgaW50ZXJuYXRpb25hbAppbi1mYXZvciBvZiB0aGUgcmF0aWZp
ZWQgUklTQy1WIEFJQSBzcGVjaWZpY2F0aW9uIHdoaWNoIGhhcyBhIG11Y2ggY2xlYW5lcgp3YXkg
b2YgZG9pbmcgSVBJIChhcyBzb2Z0d2FyZSBpbmplY3RlZCBNU0lzKSBpbXBsZW1lbnRlZCBieSB0
aGUgSU1TSUMKZHJpdmVyIGFuZCB0aGlzIGFsc28gc3VwcG9ydHMgSVBJIHZpcnR1YWxpemF0aW9u
LgoKU2luY2UgdGhpcyBpcyBhIFQtSEVBRCBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiwgdGhlIGRl
c2NyaXB0aW9uIGluIGFsbApwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIHNob3VsZCBiZSB1cGRhdGVk
IHRvIHJlcGxhY2UgcmVmZXJlbmNlcyBvZiB0aGUKUklTQy1WIEFDTElOVCBTU1dJIHNwZWNpZmlj
YXRpb24gd2l0aCBwdWJsaWNseSBhdmFpbGFibGUgVC1IRUFECmRvY3VtZW50YXRpb24uIE9uY2Us
IHRoaXMgaXMgZG9uZSwgSSB0aGluayB0aGlzIHNlcmllcyBjYW4gZ28gYWhlYWQuCgpSZWdhcmRz
LApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
