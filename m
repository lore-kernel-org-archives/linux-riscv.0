Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50823C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aC0wOrYOZ06Hlqg+6NzZxaQ6xsAHfzRkWtYqWvv4vog=; b=bwbvUuoTB8wXk0
	ijgtBUaH64XlGVxP4kAPW/rZ8te4RhJtboMA3TZlE4aCtuYXBHrfQYQErznAVnIGccv1Xb+j+XvKs
	+P48VyYIgufBPBQsz2RHg7qMZzzpcAgISm1XRmY4/YFMhzgpW3N/6BIRqdERQBBIdwogw7gvMYQ3Z
	tsnF5JlaJlR9/ZjCdSgGcFu5XB9HL7ZncdAMjF3AzZkJ3dD+Kde+a6nUtL7rGfEGnVT7gf89SrRVe
	8w/kN+ionMKj0SkMiJeGKMdDx51873t7Lz4LPDmWS3i+GObnw/TClS2/JbKqcGhM4nPdXkzY5YlOO
	VG0pgJV2zLMKkCAVF4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy4y-00000000KNb-0CKE;
	Thu, 08 May 2025 10:02:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy4v-00000000KMm-3oWl
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 10:02:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so791735e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746698528; x=1747303328; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBoYS0wz++EQw8/z3GxgW1EZr6KbY89jyHXnVjV8trs=;
        b=X6/Du0BUCJLCDnHsd7HoNu+5X5ji0JgAvyj8I+eCctKtxcWqF0Pe10ptAHD99mk9Hw
         YhHipFKTbvPOS56Fs0A3XVAq+hoymfejYs3myf8J22kfZw9FsNmHd1dlKINYCuBCm3gw
         Hs8U4mexvybRKHG+h//KY3FtjaojPfdRdECWZYMA6qWRFmmiY4wrr3iMb0JouE9W/FX6
         OB0hLRnNYYXEZmpv+Og2uJrpyWL+QKIMHhuIYLgMvF6vJamMB0DzD/9JWwkCEYQmcqPH
         q63nGIrfVCAB28HKH+Qwh6ysbjtD0hyFJgAQSmJPMN32G5njNW9ISYs0sNp5HEbvCmL2
         pVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698528; x=1747303328;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBoYS0wz++EQw8/z3GxgW1EZr6KbY89jyHXnVjV8trs=;
        b=ZNOk9YmkxMhv1S+SPZVd+zGfbZJBxyt3fXeLhveNaxbed5lECH/8nR3xojYtIFkW8W
         HoqYf5P3f3ewy4txdSm0YpEte7WycgZUeKLaL18iAed1pLhWqiuC9dpbXn9P/LbSBdLV
         Zz5oiiz9ucoB9dEN3ci1dpzUmlNTa7NiuLnZsLhY9mzlwp2+x8RHVUy1qsjABWpvFclT
         wKOAUm23tUBXBmn4KBhymSeRBRWbzVcjP89cMRfs8CEZlaLcYEMbL4EBhF4TYceeJlbM
         kHRm4EDLne3QGPypCMwgoboUWYhaNH/UqWWifRFQC2ETodoG2s01Zx0andDl0A3oAzPy
         5pGg==
X-Forwarded-Encrypted: i=1; AJvYcCV7DIv7szsQnbLIKUMFDCoybl+h2vB0upzT519Fy2pYVaNdKtABpIsR2she9D5RI3W9M69Zr5TR5e2ECQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWYDgJf3LYuPmSz5ZBH+iDsx102MT7zZ1SeJGH9w03XlbAOXoN
	sB+eWITxLIkam+xFEObnBwh5SouyPVJWOUq3PRtRzDOZK6O3PCUNOOW+ycfQp/3gp1HkKYcCI7Z
	8
X-Gm-Gg: ASbGncs3AmMlttNZ0lS39KGS2fA9oc5DKgEDmVcrrLfnCFOSzLvUphnuucLtBgUnX5p
	RSXO8jF0ryRFLCYAK+3Tj3Zg7QiqMKAgxyxeniFrkXKCrYgWJbh+1N0gk0QhJUippKvg58M8qZZ
	exIpI0P2K24bRtFhfOf4NmbSGj3lq7+56uvjhL3qCsVGlXZUNwDewIH1I/12kh0VwrEsxIvJIvN
	r7V3nhbeYuVtRaNCFTJeU/DePQnanApwLTUWjYKmFZFo6mhQM9ir6NszkWCE9v2tiCMRv0J8rg/
	Yh4PDyy96+dGI/qyIwO6WK17OTwYJ61FT/4bqnYH4sn4UVziGv/HEZvCrM4=
X-Google-Smtp-Source: AGHT+IHUaQx/Mee6s3Ke3xU/t61RV8r367qD/26lQfVX2YZuAy0gm6pedVbgXrEeJfa8XZl3movr0A==
X-Received: by 2002:a05:600c:1c97:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-441d44bc487mr21958065e9.2.1746698528415;
        Thu, 08 May 2025 03:02:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm20004897f8f.54.2025.05.08.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:02:08 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 12:02:07 +0200
Message-Id: <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
 <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_030209_946707_5DC8B341 
X-CRM114-Status: GOOD (  10.18  )
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

MjAyNS0wNS0wOFQxMTo0ODowMCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU0JJIHJlc2V0IHN0YXRl
IGhhcyBvbmx5IHR3byB2YXJpYWJsZXMgLS0gcGMgYW5kIGExLgo+PiBUaGUgcmVzdCBpcyBrbm93
biwgc28ga2VlcCBvbmx5IHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24uCj4+Cj4+IFRoZSByZXNl
dCBzdHJ1Y3R1cmVzIG1ha2Ugc2Vuc2UgaWYgd2Ugd2FudCB1c2Vyc3BhY2UgdG8gY29udHJvbCB0
aGUKPj4gcmVzZXQgc3RhdGUgKHdoaWNoIHdlIGRvKSwgYnV0IEknZCBzdGlsbCByZW1vdmUgdGhl
bSBub3cgYW5kIHJlaW50cm9kdWNlCj4+IHdpdGggdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2UgbGF0
ZXIgLS0gd2UgY291bGQgcHJvYmFibHkgaGF2ZSBqdXN0IGEKPj4gc2luZ2xlIHJlc2V0IHN0YXRl
IHBlciBWTSwgaW5zdGVhZCBvZiBhIHJlc2V0IHN0YXRlIGZvciBlYWNoIFZDUFUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+
Cj4gUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTYKCls1LzVdIHdhcyBhbHJlYWR5IGFw
cGxpZWQsIHdoaWNoIG1lYW5zIHRoYXQgWzMvNV0gd291bGQgYmUgbmljZXIgd2l0aAoKICBtZW1z
ZXQoJnZjcHUtPmFyY2guc21zdGF0ZWVuX2NzciwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guc21zdGF0
ZWVuX2NzcikpOwoKaW4gdGhlIG5ldyBmdW5jdGlvbiAoa3ZtX3Jpc2N2X3ZjcHVfY29udGV4dF9y
ZXNldCkgd2hlcmUgd2UgbWVtc2V0KDApCnRoZSBvdGhlciBjc3IgY29udGV4dC4KClNob3VsZCBJ
IGFkZCBhIHBhdGNoIHRvIGRvIHRoYXQgaW4gdjI/CgpUaGFua3MuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
