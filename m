Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C85E7719A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OphZGQOYEnZxPUr/pqRrB4Z7P/lrIVkwSz0+V/KUt6A=; b=fDu0Bvjipkrv/B
	O03Xnl9/Ln+liJkh6VyK5rM5AQ8tdJuh3y0QEab21WKR0GV/Etr88r890c+gVNUc5ghFLj68AP4wk
	pyVy93fwt4/KAXOeNbQdUZSgn6v6eNq9o3kO3zAb9YNlIiQfPwTKEXiLTkhljXr2eYQSo5DVJOzRY
	qJc5q7uqnkgxYryYZCGOLHe0NISIvgrVJMcNJp8dkVypifz1fLxqYxrZbeRomJ6FCQSrqY8cNfzdB
	gd76aBylpVH58yGGpcMh64RNOP2cknQ89Qu8eEzJR0TnmJCWekGwp7g4yMQckPHq9Bnmo35TgmVh1
	Ec5Jq5QkntCK3i0VPgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVoT-00000008YNP-2LNt;
	Wed, 08 Jan 2025 13:09:33 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV7y-00000008Pwv-1E3s
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 12:25:39 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so709481739f.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 04:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736339136; x=1736943936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CanfRX2VVwQsNL4vL0ZJbfChhX8AVONsvNXow+QseI8=;
        b=Iwqn2gfVO4Tc/OSO3PpNuXF29J2oMfHUBvIzQKa1KHACeaIhUZ68/VghQBGEhaYhSZ
         gtWxhsICn4EoMuBC0/IWhC/AT+N4V1ZZm6sEAFkl03Euei6kOO4p0B9WOqUPTf31Ga9g
         3DyLR9/zQMXCAt4SP6yUXxGY6e/ucTAuEYmH2GAu6G4kx49R5muhlvrk3M7FkEn3R5gr
         1qFmRvoY1c+PSJuLsGZ2IDytst1epVOXqxG/Spt/m55Z6dRF+rNcEh49WdoMQROwkob6
         oZxFToIOemX3rNIG9AfHEZOJmc0pfqJEqf9zPmm3oitBS4gI7EbFJOb7QUwI3Qb5/FkZ
         Z/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339136; x=1736943936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CanfRX2VVwQsNL4vL0ZJbfChhX8AVONsvNXow+QseI8=;
        b=cKZH3vJuVmrq/hNTL1y3cX4TWJnSJk5EKA3ZKvKWn4WI31bi+hv0wXVQClc+5O3lku
         Mw1D4kqefpBnMSk61FCMtwOxGMLA+VD1Z8PYnNh4GykSnNt1PcRR6MqFPLMmZG2hL9et
         wJTAsLEWJ9z6QzcUiOuuephC0TeWdRHtwWJKL7Kgx116eII6IA8ts+ZZlY3B0G1/ouK9
         qsZp/cyC9gnkxOEGirArvAgjAsgW2lqkuEym9JsesGifKM+V2zfSACWfKCh8gUFdiTKq
         uPtP204WWT7WEiw7VkHajCUGHDytngRsmPQYLjH/LvZffUt+mjV60Z5HUqZR3Ut8N3+M
         okmA==
X-Forwarded-Encrypted: i=1; AJvYcCUO+oiM1989K7sqhOONznYVTfR2LswghrifYX3aTPFbauQyiTTtaXGi2eNa7LKq5txxnv4GcMwmYE1C2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7YcQqUY+caJqPFdOTZOMhUd/qNPp6aZFVWqOku2pQpAPJr1Yw
	jkRc8sVFXmIYFlwt6KVyhLlxPzfUhdMTxW5uv7r5lGcJU1LD0G2HUBVKtq6hAeKx810v+Vmc4Zt
	KRqprByqU0lGvu9/v2RVhiR/OHJjTYqnG9GP3y/9eOiKynBypR/w=
X-Gm-Gg: ASbGncsDucis0dAJBC1/en8/8rACIxJGI+aKrgwvFOA6lHiynrQOdkpffc0lN/hluVH
	qkmp2FSObkfdcQ9ZpOL4uutMe6G+IiPrOFlYuceQ=
X-Google-Smtp-Source: AGHT+IEMck/5SZ4ij8JhhIbRY3+YSNfGlHjoQWvsZytN+yCwdknfE7JGvsDIVA26EqA+4vpx2wnU5VLy+H7or01oTIQ=
X-Received: by 2002:a92:1909:0:b0:3a7:d672:652d with SMTP id
 e9e14a558f8ab-3ce3aa5467fmr15597255ab.16.1736339136618; Wed, 08 Jan 2025
 04:25:36 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
 <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com> <20250107075835.1421602-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250107075835.1421602-2-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Jan 2025 17:55:25 +0530
X-Gm-Features: AbW1kva13I1stUawwKddneRUTwGSP3u-897aAWd5rjEvCiOcApFFbtYdcpKbAko
Message-ID: <CAAhSdy2O7RXv=n+O9kcMVofOWij-kdV9+iFgZoaFkaOuwosu0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_042538_535742_F8B3DAC5 
X-CRM114-Status: GOOD (  11.82  )
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjI54oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQgb3B0aW9u
YWwgcHJvcGVydHkgInJpc2N2LGhhcnQtaW5kZXhlcyIKPgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRp
bWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFw
bGljLnlhbWwgICAgICAgIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbAo+
IGluZGV4IDE5MGE2NDk5YzkzMi4uYmVmMDA1MjFkNWRhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxp
Yy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwKPiBAQCAtOTEsNiArOTEsMTQgQEAgcHJvcGVy
dGllczoKPiAgICAgICAgRmlybXdhcmUgbXVzdCBjb25maWd1cmUgaW50ZXJydXB0IGRlbGVnYXRp
b24gcmVnaXN0ZXJzIGJhc2VkIG9uCj4gICAgICAgIGludGVycnVwdCBkZWxlZ2F0aW9uIGxpc3Qu
Cj4KPiArICByaXNjdixoYXJ0LWluZGV4ZXM6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBt
YXhJdGVtczogMTYzODQKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBBIGxpc3Qgb2YgaGFy
dCBpbmRleGVzIHRoYXQgQVBMSUMgc2hvdWxkIHVzZSB0byBhZGRyZXNzIGVhY2ggaGFydAo+ICsg
ICAgICB0aGF0IGlzIG1lbnRpb25lZCBpbiB0aGUgImludGVycnVwdHMtZXh0ZW5kZWQiCj4gKwo+
ICBkZXBlbmRlbmNpZXM6Cj4gICAgcmlzY3YsZGVsZWdhdGlvbjogWyAicmlzY3YsY2hpbGRyZW4i
IF0KPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
