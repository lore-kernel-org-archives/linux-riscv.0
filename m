Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0D0C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USof3vQBW4ZJI31QQQRIjZzwIvcu3RWju95e2pSlIFw=; b=J6w57MIh/XeoJA
	pfliaQ0SfX+u7RVZfRO/lB5MzUCK+gkTRLfRoY6A4DmXxFAPcLSLtEp1c5YnROIIU/zkFENnSnuvc
	PVYH6V7HSIOM/KYnQlm0JveomeeRjgmbT6GPrgi/q15P1cROIUM7j6WJ+jzXe3879jdlcmVVwsWmi
	Hkz9XwwfbAN1s7jmbzfpur6vk2javA96cdlrTQQdr2pKakU1pohX4+YwREDsrdMGnk5py+4Zea0YX
	TKjj+dvA40SLKdD01BhTZDI7QJszfqGmV0k2KYocyLh7CxbqjuFtkTBNaF5RCHeG1nPQXLsSJi2Lg
	eG6BOTjofOeRHM1mciJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wSS-0000000GlG4-0ZtO;
	Tue, 14 May 2024 18:01:00 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wSO-0000000GlCl-2TIK
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:00:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57342829409so1831156a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715709653; x=1716314453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPFkuGbhnZyO2YuOasmxxVswDvCK0WBgSsmUFjTxFvY=;
        b=PwWdW/YusidyGdwSng8W9PS4Lg/kJVSOSXKZr055uchZ5HZHdNc1tC1a9qyHfjFEC2
         xVwJXtYjirtZc58cyxNVKUadIjK3jSYURVuzeQklJfr8OwQEuTbksBUqCmECUs24x8I+
         kVpPo4qQdEAFa/aJc0ixWDEogNgeNA05xr9hzoOXfyW4mdjUp9Mo3+1BHqmzJkqtys6s
         mEbyQ0OjIlWljdizSmf/isBsq67PvGQmbqRNzENrlXzQamFtD14JK5Af/coKWwp4hbmp
         osbSFD/LaMNoeLfViFZ+lp+GVk3vVfc/4RRca+cuLlu5cJvFXH/XH+27cKGvC8nxKnqq
         X8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715709653; x=1716314453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPFkuGbhnZyO2YuOasmxxVswDvCK0WBgSsmUFjTxFvY=;
        b=JeR2TBbaY8BQTAyq6yrhO/c4IIyv9FmJ3jFr3vM5vvk71AiMlidG0ucpSVrn9GSNUt
         343/q3zFd74AaJJnMkyBFbCq++NmLqrQWWg3/vYDB0AG0FCyEQxyiZ0wFfZPUmEQIPAX
         1wTNU+YL/xbUSMPxxYtNP+KERDS30typStON6afd/0ofazruNHOKdr0hbF3lpCPaSzNY
         GkRIP2ptG7veuIAyFnpHzDtS1JGnO0RLExAM1sC6YHic0JRN60DmbMKthLVZcZyLwtPo
         fPtCQxrNShPiFbskQYQFGAkI0YE0AdyeaZW3wVyyhAd9BLSYTlzw1Y4fPn/QBP6ak6Zy
         sczA==
X-Forwarded-Encrypted: i=1; AJvYcCVwOcUT6czx3IUj2rCz/5Pu1IUl6N3jzZsdFvPFE/I1ztMZrCklK+xmWNX1pg0Ihown8BZ7oBQrkfZdW+8iZU1BiIehKOq0W1TgzlvdLxb7
X-Gm-Message-State: AOJu0YwAh28tF7uSWqw09FxXjny9Pm2kbQodKOBNSFCRE8J1HMUJ5Bw7
	350Gc4KpxIVeKGNgcqgcQH6Ofjj45RmGXGdio9Dyt/PapsB9aLyUd4O4vC8lkrAZCKo7Cd9bxm+
	pbio4ub5nNmorDxi9hiLVxBToFwVpgHqRimmRKg==
X-Google-Smtp-Source: AGHT+IEav+Kv/bYUpFPfTWv7r39urrL/VjCf1N0diMj0Pjq5+EuaD+cN5qt0Ndddnyt68aDR99gcExBIUX9EIjG6mjI=
X-Received: by 2002:aa7:d392:0:b0:572:7014:230a with SMTP id
 4fb4d7f45d1cf-573328e4ec7mr13569756a12.14.1715709653683; Tue, 14 May 2024
 11:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240514140446.538622-1-bjorn@kernel.org> <20240514140446.538622-7-bjorn@kernel.org>
In-Reply-To: <20240514140446.538622-7-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 14 May 2024 20:00:42 +0200
Message-ID: <CAHVXubi6Hv_FCTi=a5FFoxqiUBucrX_NhVGBAWE6qXRXdzOYsA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_110056_658784_C3C13209 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgNDowNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gRW5hYmxlIEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJM
RV9NRU1PUllfSE9UUkVNT1ZFIGZvcgo+IFJJU0MtVi4KPgo+IFNpZ25lZC1vZmYtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmln
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNmJlYzFi
Y2U2NTg2Li5iOTM5OGI2NGJiNjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTE2LDYgKzE2LDggQEAgY29uZmlnIFJJU0NW
Cj4gICAgICAgICBzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaWYgQUNQSQo+ICAg
ICAgICAgc2VsZWN0IEFSQ0hfRE1BX0RFRkFVTFRfQ09IRVJFTlQKPiAgICAgICAgIHNlbGVjdCBB
UkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9QQUdFICYmIE1JR1JBVElP
Tgo+ICsgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGlmIFNQQVJTRU1F
TSAmJiA2NEJJVCAmJiBNTVUKCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgU1BBUlNFTUVNX1ZNRU1N
QVAgaGVyZS4KCj4gKyAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRSBp
ZiBNRU1PUllfSE9UUExVRwo+ICAgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX1NQTElUX1BNRF9Q
VExPQ0sgaWYgUEdUQUJMRV9MRVZFTFMgPiAyCj4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVf
VEhQX01JR1JBVElPTiBpZiBUUkFOU1BBUkVOVF9IVUdFUEFHRQo+ICAgICAgICAgc2VsZWN0IEFS
Q0hfSEFTX0JJTkZNVF9GTEFUCj4gLS0KPiAyLjQwLjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
