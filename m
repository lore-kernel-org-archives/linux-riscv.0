Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63CBC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrBexVrfinFESARqS261c2DOeFLVoyU3BZLfRFHQNbE=; b=ThcPgZBy7QwFYh
	ojnforU7ckoO16Vpu8qki47MorvRwJGVDLk4iu6uWbeKStUG9ebY2/yOFwqYhtgy/Ek4eobyAaHd+
	AlCm25+C0qWj/A2FzIaJEJAxuVOw9jp6B3qzYAyKZay/UDbUMaWHQFYR4uJ2kRiYNKFT92tblcQrI
	Qr4+ebCWm8FK6vbWE7Wj37WIzVSPIdDtp0ptJNuLmAC6KcRyJCWOb7snT5tY2Zj8mZtA4qEdGju6/
	6Trb4zqQKsEwqlfzcdQpK6IwtavAeJYGR2uDlVuUYxDgEu0JNP78oV3UYDd5uoWv2TPRyB092+JDU
	62fYqMWUtHQT4aGFz8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZWJ-0000000EtJT-2a5P;
	Mon, 27 May 2024 12:32:07 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZWG-0000000EtJ5-3l4v
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:32:06 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-df4e40a3cb6so5583567276.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813122; x=1717417922; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJDUGLRRsJ0ivWLRLg9qi0jczqwj4hSiWcWfn/3vXsg=;
        b=tGo/9i8a7bi3EFNmdKE7sxZR+1pAkX4/y3XJyizSRj3OvbMK39VkkGtZTeqjzgyh1u
         kEuZnYsTDDnrgwRmX321+W5YtSVt0KqIINfAAoqAPXTvHIB9/WednvF2SGgaHCpH/D8N
         uIbT7wCiiiETsUfCBj6HCcB1LH0vlQAaypJ8PMrLmGFIRzZGnLwI6eHL82ddWHmcPC49
         OD3N/siFhzZapiKYJp3yYpoZCrdQLb7tCB+QQN2eMNCPIhLw6ug6fZottlIx9uByVJK2
         QIrq2itLQZtqfQJrlcFvPZOh7eN+7QzFo0ESMdz00nVJHshw7viS3mn0XoTucdf7ngTM
         XY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813122; x=1717417922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJDUGLRRsJ0ivWLRLg9qi0jczqwj4hSiWcWfn/3vXsg=;
        b=InP2ZyA/miMmrdleWVNc32A1JadHu6B8lKEUX+RZzK8UrpOaerv04p0f0dHv0ex9o2
         kpH4elVHz+dpJWwBOxXShAI1zCQjaWlITMYmpWtlxbQtZqHPc97d9F38eOP7gGke6gx4
         y65DayP0Bc9pNgjTiJe/rSCpAj80OZEIxT5WSpd73hjtNdSZbHsvyqEAWAMXqecluJqP
         IPpuifs3SzPfd02x4cP/tw/SHpX/a/ITXgkG8G1idxvV/nIctqLHZ0AOYaTXC29/ZJFX
         PXDJOZMJP6aQmMXVtKVHi/ShBhNoYNVJbjjLSskUcjn3iGQ18mrLrR8Hpb0TIPN1pxhZ
         HK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM1r0rApWKKaS3qd0KV//9E0o7v76Q2axE8sI/VUdWEZbfPtFr9ANm0fvz5IM3pHPrWyID4QAP4b6kSDM5AjCoP6isbIZaDAxLUdLwK5Rq
X-Gm-Message-State: AOJu0YyQJlkwGPilkPzJNAgfNwavsZY4X/aGTkNarjmBxPCqDj/GUeXX
	p+go0ifoGmWsskVHHrFnMp8SUxl3cfnVYssqPSojafS/108NMyNNASTTxS+a0jTX/o2ariFeEIU
	zFbP7oLNwMW6e/D+m0F61WrUn9yb9UnA0fuWTOQ==
X-Google-Smtp-Source: AGHT+IFbWEK6qKocYhw6f8EvHhlrGAgfVZ6YKjWo+tvRZyGR5zLrpIUyxn/pC4oFmBGHvnvExLlnPLbfXeXIcI3u80E=
X-Received: by 2002:a25:abeb:0:b0:df7:69a2:f823 with SMTP id
 3f1490d57ef6-df77215546amr9090048276.7.1716813122592; Mon, 27 May 2024
 05:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com> <20240503111436.113089-7-yuklin.soo@starfivetech.com>
In-Reply-To: <20240503111436.113089-7-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:31:51 +0200
Message-ID: <CACRpkdajd1WkzscPiZL8JKvf10VHy5ppYjy-zAOaNTh0cFXtbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/7] gpiolib: enable GPIO interrupt to wake up a
 system from sleep
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_053204_954701_CCFF41D4 
X-CRM114-Status: GOOD (  16.78  )
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

T24gRnJpLCBNYXkgMywgMjAyNCBhdCAxOjE14oCvUE0gQWxleCBTb28gPHl1a2xpbi5zb29Ac3Rh
cmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IEFkZCBmdW5jdGlvbiBncGlvY2hpcF93YWtldXBfaXJx
X3NldHVwKCkgdG8gY29uZmlndXJlIGFuZCBlbmFibGUgYQo+IEdQSU8gcGluIHdpdGggaW50ZXJy
dXB0IHdha2V1cCBjYXBhYmlsaXR5IGFjY29yZGluZyB0byB1c2VyLWRlZmluZWQKPiB3YWtldXAt
Z3Bpb3MgcHJvcGVydHkgaW4gdGhlIGRldmljZSB0cmVlLiBJbnRlcnJ1cHQgZ2VuZXJhdGVkIGJ5
Cj4gdG9nZ2xpbmcgdGhlIGxvZ2ljIGxldmVsIChyaXNpbmcvZmFsbGluZyBlZGdlKSBvbiB0aGUg
c3BlY2lmaWVkCj4gR1BJTyBwaW4gY2FuIHdha2UgdXAgYSBzeXN0ZW0gZnJvbSBzbGVlcCBtb2Rl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBTb28gPHl1a2xpbi5zb29Ac3RhcmZpdmV0ZWNoLmNv
bT4KClRoaXMgaXMgYSB2ZXJ5IGhlbHBmdWwgcGF0Y2ggSSB0aGluay4KCkknbSBsb29raW5nIGZv
cndhcmQgdG8gdGhlIG5leHQgaXRlcmF0aW9uLgoKPiBAQCAtMTA0NSw4ICsxMDQ3LDE1IEBAIGlu
dCBncGlvY2hpcF9hZGRfZGF0YV93aXRoX2tleShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdm9pZCAq
ZGF0YSwKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9yZW1vdmVfaXJxY2hpcDsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICByZXQg
PSBncGlvY2hpcF93YWtldXBfaXJxX3NldHVwKGdjKTsKPiArICAgICAgIGlmIChyZXQpCj4gKyAg
ICAgICAgICAgICAgIGdvdG8gZXJyX3JlbW92ZV9kZXZpY2U7CgpEbyB3ZSBoYXZlIGFueSBpbi10
cmVlIGRyaXZlcnMgdGhhdCBkbyB0aGlzIGJ5IHRoZW1zZWx2ZXMgYWxyZWFkeT8KCkluIHRoYXQg
Y2FzZSB3ZSBzaG91bGQgY29udmVydCB0aGVtIHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGluIHRoZSBz
YW1lCnBhdGNoIHRvIGF2b2lkIHJlZ3Jlc3Npb25zLgoKPiArc3RhdGljIGlycXJldHVybl90IGdw
aW9fd2FrZV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3QgaXJxX2RhdGEgKmlycV9kYXRhID0gZGF0YTsKCkknbSBtaW5pbWFsaXN0IHNvIEkgdXN1
YWxseSBqdXN0IGNhbGwgdGhlIHBhcmFtZXRlciAiZCIgaW5zdGVhZCBvZiAiZGF0YSIKYW5kIGly
cV9kYXRhIEkgd291bGQgY2FsbCAqaWQgYnV0IGl0J3MgeW91ciBwaWNrLgoKPiArCj4gKyAgICAg
ICBpZiAoIWlycV9kYXRhIHx8IGlycSAhPSBpcnFfZGF0YS0+aXJxKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gSVJRX05PTkU7Cj4gKwo+ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwoKUGxl
YXNlIGFkZCBzb21lIGRlYnVnIHByaW50OgoKc3RydWN0IGdwaW9fY2hpcCAqZ2MgPSBpcnFfZGF0
YS0+Y2hpcF9kYXRhOwoKY2hpcF9kYmcoZ2MsICJHUElPIHdha2V1cCBvbiBJUlEgJWRcbiIsIGly
cSk7CgpUaGUgcmVzdCBsb29rcyBnb29kIHRvIG1lIChhZnRlciBmaXhpbmcgQW5keSdzIGNvbW1l
bnRzISkKCkkgd291bGQgcGVyaGFwcyBwdXQgc29tZQpkZWJ1ZyBwcmludCB0aGF0ICJHUElPIHdh
a2V1cCBlbmFibGVkIGF0IG9mZnNldCAlZCIgaW4gdGhlCmVuZCBhcyB3ZWxsLCBzbyBwZW9wbGUg
Y2FuIGVhc2lseSBmb2xsb3cgdGhpcyBpbiB0aGUgZGVidWcgcHJpbnRzLgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
