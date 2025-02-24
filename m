Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFE5C021BB
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09xmD3leDnRefg9FB9+6EunjnHZn6li+xmPW2YuFz1E=; b=J86ufrgpOwxRjV
	4CT8gnEv1M9cu/NrhGuCLVXFsQsiAwIp9DpDGqbnVljJyZpII+Gmq5CNxrNPwkZJ94U5I0P0n9WRj
	mZnqF1ZduULxwrgwwsuMAz1ktXELYX8ik/xx+rWMWUG+JsfQamq0/nNRg0BwVwmmyvOQlyAjHml/B
	dOV8G58+9LH8AcYwsq+d7THGD13TdZ76PGgzjBkSkD5C3lHy6cXrYOMnHIbx1Wm3+khwtcvkENeiT
	8Pt98Zjkk+uofTrZ2CppRyZ39xwIWig3EPU8ygy/3URWxjdouUBWslpstejwGo6UXAV0tduskOguf
	38JEAEo6jwMn+MH77PNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbmV-0000000EWR8-1TpW;
	Mon, 24 Feb 2025 16:58:11 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmblz-0000000EWFL-2NOy
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 16:57:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C5A2611C6
	for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 16:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F17C4CEDD
	for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 16:57:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YGvl/X5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1740416256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kbt09C33MAk+YKGq1E7A3qrzPN58ot8VJKi0PWNi2bc=;
	b=YGvl/X5Z5n3R8NtQqWPHvGLHjEectTaRigKtzcKzY29O9wSJ7CW0rojfD71ONpA/QXWXtX
	f5tuo7XT8AFTfcyBVJzAAE/I6vxwjPb1I/BJfPeVJbP/xgkTGslBeu0mnEuCKeZc6SlIaY
	vrjj17MM34L7sqbiSE2OxHAsErsQD4g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fa31a574 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Mon, 24 Feb 2025 16:57:35 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f3f4890596so2477542b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 08:57:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeZleOI21FqY/ocm5mAD4jKCgOtboVIBG3DSEHnTNWSU/9fRjZnymX1iqmZj9pQTBeOvxZJMS01K4jCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/mFxp3hvMgg+GNXYeyalNcuXy0SHEpsbTyv42iTzEmvJZ4DuP
	hozHt4WW1qpcrN0SH40Cc5uQaOpZvCtzg8LZlUinbGC+zsjwX6L1UDFsthECzJqlg8yOJg5giyZ
	8wBfZ7kptzDJckwDBPKPHR3s1OiU=
X-Google-Smtp-Source: AGHT+IFFefefdwhnFakKRznoH6UM2IfBKZSke6V097+eiJJj9e+hqoCv6KiH8wOCXuXZQfbi0ZsL5zMRaMnNN/OiqLk=
X-Received: by 2002:a05:6808:3507:b0:3f4:1879:2af6 with SMTP id
 5614622812f47-3f425c0a825mr8214115b6e.34.1740416254414; Mon, 24 Feb 2025
 08:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20250224122541.65045-1-xry111@xry111.site>
In-Reply-To: <20250224122541.65045-1-xry111@xry111.site>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Feb 2025 17:57:24 +0100
X-Gmail-Original-Message-ID: <CAHmME9okzk+Cj1yrXQuwjwDsJd+x=UJVM_rLUqgdB6oeCYjw-Q@mail.gmail.com>
X-Gm-Features: AWEUYZkuzElQp9cVAl_1iXa4R9rcNiIQYnYm0gUgHgwF0Zs5UMK7tkScIF0urC0
Message-ID: <CAHmME9okzk+Cj1yrXQuwjwDsJd+x=UJVM_rLUqgdB6oeCYjw-Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: vDSO: Wire up getrandom() vDSO implementation
To: Xi Ruoyao <xry111@xry111.site>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMToyNuKAr1BNIFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTEx
MS5zaXRlPiB3cm90ZToKPgo+IEhvb2sgdXAgdGhlIGdlbmVyaWMgdkRTTyBpbXBsZW1lbnRhdGlv
biB0byB0aGUgTG9vbmdBcmNoIHZEU08gZGF0YSBwYWdlCj4gYnkgcHJvdmlkaW5nIHRoZSByZXF1
aXJlZCBfX2FyY2hfY2hhY2hhMjBfYmxvY2tzX25vc3RhY2ssCj4gX19hcmNoX2dldF9rX3Zkc29f
cm5nX2RhdGEsIGFuZCBnZXRyYW5kb21fc3lzY2FsbCBpbXBsZW1lbnRhdGlvbnMuIEFsc28KPiB3
aXJlIHVwIHRoZSBzZWxmdGVzdHMuCgpUaG9tYXMgbm90ZWQgdGhlIExvb25nQXJjaCBjb3B5cGFz
dGEsIGJ1dCBhbHNvLCB0aGVyZSdzIG5vCl9fYXJjaF9nZXRfa192ZHNvX3JuZ19kYXRhIGltcGxl
bWVudGF0aW9uIGhlcmUsIGxpa2UgdGhlIG1lc3NhZ2Ugc2F5cywKcHJlc3VtYWJseSBiZWNhdXNl
IG9mIHRoZSBnZW5lcmljIGRhdGEgc3RvcmFnZSB3b3JrLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
