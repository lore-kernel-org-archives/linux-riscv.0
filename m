Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311BCC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIYJp28uKCyfgezt2E3AI1IA8aOVEaJ2unp3I2DWAGI=; b=cWMJIfHjKEJ6S7
	rOp7ROUERrkqf5mzGihV/FYLBxFdQ6q8Uo7VoaUkv1scXhn0svFZrj730jU/epm37ZEoIPkv1+i4R
	IPjIiL2SUejtQ+BpK+g2O8/Umzpsa9hb7NP/Joa015kLw6i5pKG3er8HE7LMS3uRw6lKlwduehBRE
	QimbiOq32KxbWzEVC5oP0S64p2i/tLqTghMzNIzvxljTEn/I/aT7+tq+v7SfaBNLIM6uvAsK9ICkk
	IxXE7P9r+x7Gk6Im10bg4v0eJKP5M2lOCoQsRHtG9r6fzl2randkrxs7scKhNU9NI5P7fH4rGaoKH
	gnxQxLRHbvClNyFkxpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEbd-008m26-01;
	Tue, 09 Jan 2024 16:05:33 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEbZ-008m0s-0r;
	Tue, 09 Jan 2024 16:05:30 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5958b9cda7aso99268eaf.0;
        Tue, 09 Jan 2024 08:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704816327; x=1705421127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTP9EiyEeva0GUJp/wJKIwTcNHCIZPpR3j0J43X6b+g=;
        b=jah00QHCOCjcy/FXgI2i3uFikPWxr6rv/xpfr6b+g4dDh9mQYx7it335OPgqh7yxqa
         CbIZzyYfYfDke2ckJkvjsW3EKqTRNzelUYfG3QH3OpN/owEnFjaeQ5S9XegG6haItJwc
         tkfy14odgF1j8im0aa1mqiEqBqcscE3wsVTwGr0OdmsF+ojBrv4pT0vqd89vgizBX/CU
         tTzWu6z+WOLRc4ildXeycjw2qJeltPyLGAh+RogSh4U2aFOmtP6BwTAZ0fUSe/iF7ffc
         PeN4EPDPir6X0owLFH58br9NJdLzr6xGOkIEjYwzNJgP8B4gIR1+0pDZh8AK7rZVAtOE
         JtLg==
X-Gm-Message-State: AOJu0Yyh6+/TP3RYvO1UCPOr4oPXtJNik0qaVVBEFQbb/3T4cXnhFd0T
	KU/Uh4KTUo/oYhrxxZOoIwwpTc7J9IRXvzsFYUE=
X-Google-Smtp-Source: AGHT+IHRqsiYjS0UsEPStnFKOygnAmrZHBpCnrANvUVJi1e1QtXAE7l8zfFAjXuasM2dCT8ERtMsi1F9sFJ5XRWSXf8=
X-Received: by 2002:a05:6820:d0a:b0:598:8d98:286d with SMTP id
 ej10-20020a0568200d0a00b005988d98286dmr696771oob.0.1704816326785; Tue, 09 Jan
 2024 08:05:26 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com> <ZZ1q+7GXqnMMwKNR@shell.armlinux.org.uk>
In-Reply-To: <ZZ1q+7GXqnMMwKNR@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 9 Jan 2024 17:05:15 +0100
Message-ID: <CAJZ5v0jvuTAMak-x=ekphwgNsUWABGRcDPb8D4QB=KhfyC76Sg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_080529_311379_1902B3B5 
X-CRM114-Status: GOOD (  36.09  )
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

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCA0OjQ54oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxs
aW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gTW9uLCBEZWMgMTgsIDIwMjMgYXQg
MDk6MTc6MzRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBXZWQsIERl
YyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IEphbWVzIE1vcnNlIDxqYW1lcy5tb3Jz
ZUBhcm0uY29tPgo+ID4gPgo+ID4gPiBBQ1BJIGhhcyB0d28gd2F5cyBvZiBkZXNjcmliaW5nIHBy
b2Nlc3NvcnMgaW4gdGhlIERTRFQuIEZyb20gQUNQSSB2Ni41LAo+ID4gPiA1LjIuMTI6Cj4gPiA+
Cj4gPiA+ICJTdGFydGluZyB3aXRoIEFDUEkgU3BlY2lmaWNhdGlvbiA2LjMsIHRoZSB1c2Ugb2Yg
dGhlIFByb2Nlc3NvcigpIG9iamVjdAo+ID4gPiB3YXMgZGVwcmVjYXRlZC4gT25seSBsZWdhY3kg
c3lzdGVtcyBzaG91bGQgY29udGludWUgd2l0aCB0aGlzIHVzYWdlLiBPbgo+ID4gPiB0aGUgSXRh
bml1bSBhcmNoaXRlY3R1cmUgb25seSwgYSBfVUlEIGlzIHByb3ZpZGVkIGZvciB0aGUgUHJvY2Vz
c29yKCkKPiA+ID4gdGhhdCBpcyBhIHN0cmluZyBvYmplY3QuIFRoaXMgdXNhZ2Ugb2YgX1VJRCBp
cyBhbHNvIGRlcHJlY2F0ZWQgc2luY2UgaXQKPiA+ID4gY2FuIHByZWNsdWRlIGFuIE9TUE0gZnJv
bSBiZWluZyBhYmxlIHRvIG1hdGNoIGEgcHJvY2Vzc29yIHRvIGEKPiA+ID4gbm9uLWVudW1lcmFi
bGUgZGV2aWNlLCBzdWNoIGFzIHRob3NlIGRlZmluZWQgaW4gdGhlIE1BRFQuIEZyb20gQUNQSQo+
ID4gPiBTcGVjaWZpY2F0aW9uIDYuMyBvbndhcmQsIGFsbCBwcm9jZXNzb3Igb2JqZWN0cyBmb3Ig
YWxsIGFyY2hpdGVjdHVyZXMKPiA+ID4gZXhjZXB0IEl0YW5pdW0gbXVzdCBub3cgdXNlIERldmlj
ZSgpIG9iamVjdHMgd2l0aCBhbiBfSElEIG9mIEFDUEkwMDA3LAo+ID4gPiBhbmQgdXNlIG9ubHkg
aW50ZWdlciBfVUlEIHZhbHVlcy4iCj4gPiA+Cj4gPiA+IEFsc28gc2VlIGh0dHBzOi8vdWVmaS5v
cmcvc3BlY3MvQUNQSS82LjUvMDhfUHJvY2Vzc29yX0NvbmZpZ3VyYXRpb25fYW5kX0NvbnRyb2wu
aHRtbCNkZWNsYXJpbmctcHJvY2Vzc29ycwo+ID4gPgo+ID4gPiBEdXBsaWNhdGUgZGVzY3JpcHRp
b25zIGFyZSBub3QgYWxsb3dlZCwgdGhlIEFDUEkgcHJvY2Vzc29yIGRyaXZlciBhbHJlYWR5Cj4g
PiA+IHBhcnNlcyB0aGUgVUlEIGZyb20gYm90aCBkZXZpY2VzIGFuZCBjb250YWluZXJzLiBhY3Bp
X3Byb2Nlc3Nvcl9nZXRfaW5mbygpCj4gPiA+IHJldHVybnMgYW4gZXJyb3IgaWYgdGhlIFVJRCBl
eGlzdHMgdHdpY2UgaW4gdGhlIERTRFQuCj4gPgo+ID4gSSdtIG5vdCByZWFsbHkgc3VyZSBob3cg
dGhlIGFib3ZlIGlzIHJlbGF0ZWQgdG8gdGhlIGFjdHVhbCBwYXRjaC4KPiA+Cj4gPiA+IFRoZSBt
aXNzaW5nIHByb2JlIGZvciBDUFVzIGRlc2NyaWJlZCBhcyBwYWNrYWdlcwo+ID4KPiA+IEl0IGlz
IHVuY2xlYXIgd2hhdCBleGFjdGx5IGlzIG1lYW50IGJ5ICJDUFVzIGRlc2NyaWJlZCBhcyBwYWNr
YWdlcyIuCj4gPgo+ID4gRnJvbSB0aGUgcGF0Y2gsIGl0IGxvb2tzIGxpa2UgdGhvc2Ugd291bGQg
YmUgUHJvY2Vzc29yKCkgb2JqZWN0cwo+ID4gZGVmaW5lZCB1bmRlciBhIHByb2Nlc3NvciBjb250
YWluZXIgZGV2aWNlLgo+ID4KPiA+ID4gY3JlYXRlcyBhIHByb2JsZW0gZm9yCj4gPiA+IG1vdmlu
ZyB0aGUgY3B1X3JlZ2lzdGVyKCkgY2FsbHMgaW50byB0aGUgYWNwaV9wcm9jZXNzb3IgZHJpdmVy
LCBhcyBDUFVzCj4gPiA+IGRlc2NyaWJlZCBsaWtlIHRoaXMgZG9uJ3QgZ2V0IHJlZ2lzdGVyZWQs
IGxlYWRpbmcgdG8gZXJyb3JzIGZyb20gb3RoZXIKPiA+ID4gc3Vic3lzdGVtcyB3aGVuIHRoZXkg
dHJ5IHRvIGFkZCBuZXcgc3lzZnMgZW50cmllcyB0byB0aGUgQ1BVIG5vZGUuCj4gPiA+IChlLmcu
IHRvcG9sb2d5X3N5c2ZzX2luaXQoKSdzIHVzZSBvZiB0b3BvbG9neV9hZGRfZGV2KCkgdmlhIGNw
dWhwKQo+ID4gPgo+ID4gPiBUbyBmaXggdGhpcywgcGFyc2UgdGhlIHByb2Nlc3NvciBjb250YWlu
ZXIgYW5kIGNhbGwgYWNwaV9wcm9jZXNzb3JfYWRkKCkKPiA+ID4gZm9yIGVhY2ggcHJvY2Vzc29y
IHRoYXQgaXMgZGlzY292ZXJlZCBsaWtlIHRoaXMuCj4gPgo+ID4gRGlzY292ZXJlZCBsaWtlIHdo
YXQ/Cj4gPgo+ID4gPiBUaGUgcHJvY2Vzc29yIGNvbnRhaW5lcgo+ID4gPiBoYW5kbGVyIGlzIGFk
ZGVkIHdpdGggYWNwaV9zY2FuX2FkZF9oYW5kbGVyKCksIHNvIG5vIGRldGFjaCBjYWxsIHdpbGwK
PiA+ID4gYXJyaXZlLgo+ID4KPiA+IFRoZSBhYm92ZSByZXF1aXJlcyBjbGFyaWZpY2F0aW9uIHRv
by4KPgo+IFRoZSBhYm92ZSBjb21tZW50cy4uLiB5ZWEuIEFzIEkgZGlkbid0IHdyaXRlIHRoZSBj
b21taXQgZGVzY3JpcHRpb24sIGJ1dAo+IEphbWVzIGRpZCwgYW5kIEphbWVzIGhhcyBiYXNpY2Fs
bHkgdmFuaXNoZWQsIEkgZG9uJ3QgdGhpbmsgdGhlc2UgY2FuIGJlCj4gYW5zd2VyZWQsIHNob3J0
IG9mIHJld3JpdGluZyB0aGUgZW50aXJlIGNvbW1pdCBtZXNzYWdlLCB3aXRoIG1lIHNwZW5kaW5n
Cj4gYSBsb3Qgb2YgdGltZSB3aXRoIHRoZSBBQ1BJIHNwZWNpZmljYXRpb24gdHJ5aW5nIHRvIGdl
dCB0aGUgdGVybWlub2xvZ3kKPiByaWdodCAtIGJlY2F1c2UgYXQgbG90IG9mIHRoZSBhYm92ZSBv
biB0aGUgZmFjZSBvZiBpdCBzZWVtcyB0byBiZSB0aGluZ3MKPiB0byBkbyB3aXRoIHdyb25nIHRl
cm1pbm9sb2d5IGJlaW5nIHVzZWQuCj4KPiBJIHdhc24ndCBleHBlY3RpbmcgdGhpcyBsZXZlbCBv
ZiBpc3N1ZXMgd2l0aCB0aGlzIHBhdGNoIHNldCwgYW5kIEkgbm93Cj4gZmVlbCBjb21wbGV0ZWx5
IG91dCBvZiBteSBkZXB0aCB3aXRoIHRoaXMgc2VyaWVzLiBJJ20gd29uZGVyaW5nIHdoZXRoZXIK
PiBJIHNob3VsZCBldmVuIGNvbnRpbnVlIHdpdGggaXQsIHNpbmNlIEkgZG9uJ3QgaGF2ZSB0aGUg
QUNQSSBrbm93bGVkZ2UKPiB0byBhZGRyZXNzIGEgbG90IG9mIHRoZXNlIGNvbW1lbnRzLgoKV2Vs
bCwgc29ycnkgYWJvdXQgdGhpcy4KCkkgbWV0IEphbWVzIGF0IHRoZSBMUEMgbGFzdCB5ZWFyLCBz
byBoZSBzZWVtcyB0byBiZSBzdGlsbCBhcm91bmQsIGluCnNvbWUgd2F5IGF0IGxlYXN0Li4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
