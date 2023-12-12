Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932C6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCL7zfrt4X+t3xJI7bQmCnKQRPH/NjjbwpuxB8mRvWw=; b=xHOY8rBQesY/E6
	9sT24Np3qilIr5SLp1YVelKA9Rz5NPUSZuZa4wFvVgnNcPd0xF0VX4D17jmjuzktxbIU8SVDtTfIR
	1SrI4tDZWyFqutoSVoTpaspjT86bdR9jobYb+DDqoQeSlorl5D1AcNRJZRsmRlIcVUlaTHalNih22
	SOxAFpl1DxLUTjgNo4LshIbuoaWbZFe7BqPrrVdp7RZideZEAB1XAoR2Rlij4wlSwfKgQLJIfhb/D
	5xT/HhK4U+IMCr5QZJrC55LgVVPVRAd/lTZ6mznO0zFZNEbWlzGjM/6NdJfGVqmyfQHo4j3SmfCqh
	jymi9l5WeeYfG73Fel+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD63Y-00CIsi-0l;
	Tue, 12 Dec 2023 16:56:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD63W-00CIrw-0a
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 16:56:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c55872d80so3669235e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702400180; x=1703004980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OpS8QvLmhoSAmNbzXuy9RYCtH6wkVeGub04kf2dZCE=;
        b=U0i/lovtxabwVXK2Sxr2OLU+SORr4epwwfS73OcqeUCN1w/Fh8KRc2VrNRHI/JxeoB
         YAPJjCKyI6LM+y744TiG7VwOrR8uvHcJmr9Iz56t0Ddr9GyXdvqcPbX671MK03Yxp4NX
         Da6n2Tn2LcsmDfKTZofKQyP1SOqX87AH+mcUAM0GmBabPTKNoG+N9CReNRAqkpWcoOsg
         z8bWwI8fsdQbD/zWg9KvD+sh7Tl3xtmbWPRjnsLDidkU039B5dRviMNwnR1Pk8LXlJe/
         9ozRcbGkePaQG6Qv5P97bO0XwiiZO2EYAHD9xN9NaJLPChloxhs5/UzsamJbQttoo2MW
         v//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400180; x=1703004980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OpS8QvLmhoSAmNbzXuy9RYCtH6wkVeGub04kf2dZCE=;
        b=Rec5y+wggrrWknqunb0BHp06Q080yeMYZ2fgjyOGOsnwE22jAjVXNU8PpEe49syhe+
         wFmx6xHIi5+rbV5NYj9FMBUhOFwcFi83L4ZFIDdiANZUpS7twKzWLPodzYo23nRhp2Mw
         6U7+iHnHhhilKf5DoMouYYaFyLHNcVeBUQMK0WIRBgBcmm8m+vtB9lbBOd02VIZGzgR7
         O3GPAPt/uh7OEa9HUIumw317Is3nOA99WkZuDpLN+MjBLe0JpriL4eZS1QY2BbIp9+ry
         +J58OuVSY+uJQaW+43lDupEVKVSScU4mrGKzIOJStaTnAeQv15IGeQmcba13nXIjLbz4
         3jgA==
X-Gm-Message-State: AOJu0YydAU0tDkcfHMgTQ3F53MC42QYZxaY5gBMYIuPm0Vw9GDVRSBIm
	MsyHJlm1en3J2GgvBgjllAHUkvRhD/ga0nf8UFp/6A==
X-Google-Smtp-Source: AGHT+IF57G5xzFkVfzhQ6L4Jp050TnfWYKoW0vXKBEg5qX6/XT790iWuyYeR8u21h8EBH9G8WN6kIULlKe+iGLmGesE=
X-Received: by 2002:a05:600c:4e4f:b0:40c:23e0:7dad with SMTP id
 e15-20020a05600c4e4f00b0040c23e07dadmr3396524wmq.168.1702400180143; Tue, 12
 Dec 2023 08:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20231212-removeasmgeneric-v2-1-a0e6d7df34a7@google.com>
In-Reply-To: <20231212-removeasmgeneric-v2-1-a0e6d7df34a7@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 12 Dec 2023 08:56:05 -0800
Message-ID: <CAKwvOdnTH+SgiLDkq4KmjVifF-bkxKfBNxE2o+XHjuRa6ZCSRA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: remove unused header
To: tanzirh@google.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <nnn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_085626_245059_87018438 
X-CRM114-Status: GOOD (  15.14  )
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

T24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgNDoyMOKAr1BNIDx0YW56aXJoQGdvb2dsZS5jb20+IHdy
b3RlOgo+Cj4gYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYnVpbGRzIHdpdGhvdXQgdXNp
bmcgYW55dGhpbmcKPiBmcm9tIGFzbS1nZW5lcmljL21tYW4tY29tbW9uLmguIFRoZXJlIHNlZW1z
IHRvIGJlIG5vIHJlYXNvbgo+IHRvIGluY2x1ZGUgdGhpcyBmaWxlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVGFuemlyIEhhc2FuIDx0YW56aXJoQGdvb2dsZS5jb20+CgpUaGFua3MgZm9yIHRoZSBwYXRj
aCEKCkZpeGVzOiA5ZTJlNjA0MmE3ZWMgKCJyaXNjdjogQWxsb3cgUFJPVF9XUklURS1vbmx5IG1t
YXAoKSIpClJldmlld2VkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xl
LmNvbT4KVGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNv
bT4KCj4gLS0tCj4KPiAtLS0KCllvdSdyZSBzdGlsbCBnZXR0aW5nIGZ1bmt5IGV4dHJhIGAtLS1g
OyBsZXQncyB0YWtlIGEgbG9vayBsYXRlciBhdCBob3cKeW91J3JlIHVzaW5nIGBiNGAgdG9nZXRo
ZXIgb2ZmbGluZS4gIEl0J3Mgbm90IGEgcHJvYmxlbSBmb3IgbWUgdG8KYXBwbHkgdGhlIHBhdGNo
LCBidXQgc29tZXRoaW5nIHN0aWxsIGlzbid0IHF1aXRlIHJpZ2h0LiAoRG8gbm90IHNlbmQgYQp2
MyBvdmVyIHRoaXMpCgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBDaGFuZ2VkIG5hbWUgdG8gcmlzY3Y6
IHJlbW92ZSB1bnVzZWQgaGVhZGVyCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjMxMjExLXJlbW92ZWFzbWdlbmVyaWMtdjEtMS1hMDI3NGU4MDI3ODlAZ29vZ2xl
LmNvbQo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyB8IDEgLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiBpbmRleCBh
MmNhNWI3NzU2YTUuLmViY2FmMzg2ZWE2MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfcmlzY3YuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gQEAg
LTE0LDcgKzE0LDYgQEAKPiAgI2luY2x1ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KPiAgI2luY2x1ZGUg
PGFzbS91YWNjZXNzLmg+Cj4gICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+Cj4gLSNpbmNsdWRlIDxh
c20tZ2VuZXJpYy9tbWFuLWNvbW1vbi5oPgo+ICAjaW5jbHVkZSA8dmRzby92c3lzY2FsbC5oPgo+
Cj4gIHN0YXRpYyBsb25nIHJpc2N2X3N5c19tbWFwKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWdu
ZWQgbG9uZyBsZW4sCj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogYTM5YjZhYzM3ODFkNDZiYTE4MTkz
YzlkYmIyMTEwZjMxZTliZmZlOQo+IGNoYW5nZS1pZDogMjAyMzEyMTEtcmVtb3ZlYXNtZ2VuZXJp
Yy1mNmJlMTNhNDJiNmIKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFRhbnppciBIYXNhbiA8dGFu
emlyaEBnb29nbGUuY29tPgo+CgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
