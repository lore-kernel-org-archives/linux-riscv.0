Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE9EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED0eMO2Tz2/p+Xw1n5g3nQT8RztahEK5icqZP7XN0wI=; b=VDAvK4UC2mcgkA
	oaz8+K4Y/GjJXSx+qMEvfz2/B1nXGK2P2onlybZITWo9FolXPiCxhpyZO+QMcOP9XL8mJTNoTQUSs
	UFEWGfQ0LsIZAJwLNJdQpd5lGacT8+dl5Nmh+UyFGhN9BqqAY6NGGZSMCWCcMLCzXR+64rpBzgMbf
	8WrqLj41MWBhK9JAjA0s+rMl15OMMzAm0/i3JtGdpeSzYMhQ+7gor5o45dUd5dRHY4SBydZ8l0atY
	iRgYnGNWu2zQey+nyHXbQjrzK1nZ3QxblmyDxDHibsPwZs923GykwV0du4OBxhkeXV4qroKfFQWji
	j44LoUPbKkaQtva+grbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFM84-004dWz-1e;
	Fri, 30 Jun 2023 21:58:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFM81-004dV8-1a
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 21:58:11 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3984901e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 14:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688162280; x=1690754280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG0hwR/YJu67kWtnANEbUEQK/5fjQu8DbldxOC2Vvw8=;
        b=GufFu96ensIgCOxTtY6Iy8CuG94cVYrHIt0XQx4DxLs5kAtCFyjBPt3IFW/ayeS0VL
         O+N5cTyYLfWwkUwPu5JYQF2Tlk1JXPsNwD8UTMNfwkNcffmS+19eWJYJNoHKImH4KVjh
         zNnuNRnamqGCmg5dVCJ/YF026OX9CvH/gJsnKqaA1JRz/pginEx1ttOuZq8P+SgHn+5x
         OUBT2JQeq3boCgB7F5jblwBjKRkQXXlnh4C9v7ohE8DmfO7fUdpOlC6w6o2nUm9Dh1H3
         yruQdTp+/KbUYCUkB3aMj+TMsc7+mcplOVaITXyquG47sT/+22MJpEsZ/rJrgE1SCFB+
         YzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688162280; x=1690754280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG0hwR/YJu67kWtnANEbUEQK/5fjQu8DbldxOC2Vvw8=;
        b=bNt6lOhii1f0Y/NE3EGtIdpFJRcmuWoUugRzFVYKX2qGxaBIhOMp3/fRdomsx9+fV8
         ZJK6UGD6h3wZxXHO7cxiDYoAhXTlsetsDf9E+Lqj/Nh58DzXu73rzZGUQiY7oQcC3g8g
         QAVpz+xecM54Gj5lxIDXQg1LKtQ7ye4NklZIDq74uwx8HP6VqTvS93m/YoE/U22oqzW8
         JkeqXxGtG8iLOTJSejPobUWaddbKRu1FFtXsnRyoN/D/7lBKyfaldoD9b7oyI9ZNudOE
         NFi8MI6Ppb4X9VH1D8fRLfpNs5cI8PZJxgDQE1Rmru6ZZHaBbMrClNt/JRjGeSByHcYk
         pnaA==
X-Gm-Message-State: ABy/qLahbA1XMtnWPDVPJduAtSsjX10L+K3z+rbQwRbDoQrlL2Og5Ads
	5ANbQ3dUNAoIN989gpS4KqhI+lvhjyOikX8kDQxKfg==
X-Google-Smtp-Source: APBJJlErcH2Vqh20jSjJGGlb9PDjFbHudImBHXsqb2BZk/LTF20VtsQO0qiQBYAgA0UAQ0dvvhoPE0iwBYWaJmnLYlw=
X-Received: by 2002:a05:6512:3586:b0:4fb:61ea:95dc with SMTP id
 m6-20020a056512358600b004fb61ea95dcmr3061888lfr.7.1688162279907; Fri, 30 Jun
 2023 14:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <20230623222016.3742145-3-evan@rivosinc.com>
 <20230626-hardcopy-upchuck-7c37f1a6ef7b@wendy>
In-Reply-To: <20230626-hardcopy-upchuck-7c37f1a6ef7b@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 30 Jun 2023 14:57:23 -0700
Message-ID: <CALs-HssoL9grnv80OGzUP2rKF9H5YPGt6M0xBHHwdhEf=iLt1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: alternative: Remove feature_probe_func
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_145809_744787_EF103885 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgNjowN+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEV2YW4sCj4KPiBPbiBGcmksIEp1biAy
MywgMjAyMyBhdCAwMzoyMDoxNlBNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gTm93IHRo
YXQgd2UncmUgdGVzdGluZyB1bmFsaWduZWQgbWVtb3J5IGNvcHkgYW5kIG1ha2luZyB0aGF0Cj4g
PiBkZXRlcm1pbmF0aW9uIGdlbmVyaWNhbGx5LCB0aGVyZSBhcmUgbm8gbW9yZSB1c2VycyBvZiB0
aGUgdmVuZG9yCj4gPiBmZWF0dXJlX3Byb2JlX2Z1bmMoKS4gV2hpbGUgSSB0aGluayBpdCdzIHBy
b2JhYmx5IGdvaW5nIHRvIG5lZWQgdG8gY29tZQo+ID4gYmFjaywgdGhlcmUgYXJlIG5vIHVzZXJz
IHJpZ2h0IG5vdywgc28gbGV0J3MgcmVtb3ZlIGl0IHVudGlsIGl0J3MKPiA+IG5lZWRlZC4KPgo+
IEhvdyBjb21lIHRoaXMgaXMgZG9uZSBhcyBhIHNlcGFyYXRlIHBhdGNoLCByYXRoZXIgdGhhbiBk
ZWxldGUgdGhlIGRlYWQKPiBjb2RlIGFzIHBhcnQgb2YgdGhlIHByb2JlIGFkZGl0aW9uPyBFYXNl
IG9mIHJldmlldz8KClllcywgaXQganVzdCBzZWVtZWQgbGlrZSBhIGxvZ2ljYWxseSBkaXN0aW5j
dCBjaGFuZ2UuIFRoYW5rcyBmb3IgdGhlIHJldmlldyEKLUV2YW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
