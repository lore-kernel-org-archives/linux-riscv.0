Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C48C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9tZ1LKIhbWVhucLOld3RWrQX0vwaidk3ciPnN38EbU=; b=Zk1Tz7C1jTFLfD
	FO0QBwqEnU12OsnNJixxwTX9yh9qgZgtvXw6jRqb1qKdkAYhUPfEOX21jbk++IiNgSqhdM0ZSeooF
	yoR6h3miUloePV0O2sDon+vbVFybDWtI6PyUSsQB7m+RXyJouVjwotYuTTYf7HJ+43tiI7KBkABNU
	6nbNPk7Vpus7x/O5OGErZEVvaEn3JuIq3O5FwfgcW7Xw4Xpw6oq4xc9aPHyTAnCZqS55F9EyPCMn3
	KwLL26+wlC9DdVKr+rNR4UJe8hxJC7sCUIwmLVXnyk6zmCNhMpS7psmVmAm6B48z4WYSOEuEw45Bk
	V0Tw3bcCSxYN21eC8hSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxsY-0000000DGLn-1INq;
	Thu, 11 Apr 2024 17:06:26 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxsV-0000000DGIV-36qK
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 17:06:25 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-221e1910c3bso57551fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712855177; x=1713459977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lts7IF4O3wh+oACzNnyW3TMbFIhfWZAEPaIt7vwWKBA=;
        b=xZK4vBZ+wyKOwxezZFFVu5ebS1573/rVFag3SXPOucyxgiGpOXM5Rhy2os6qT90vGU
         tNaO3adw7ihNexpifWpiQo5aT1IWStIfqyTJJhz9o7Z/wNcrg7zPpZBNaoUIGZGqrvpj
         O1dc07IuHzworlWN8xCX8ABVXi8bOxAVBJoFzWG5AAglGsMRVBsTPLVdFHxjaQ1pWCIU
         nWhorcZN0GqEpi/zXNCN5rKdEPi3gXDdHtXFMxrqVWKJxNKdnzZrp25OY09notzqTbY8
         4qARFTbsLy8k5Q8mbvEWEqJP6wu67o4677R8lWbGgHgTfTPZIwlzRrCLEcdG5Gfiy8AJ
         U5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712855177; x=1713459977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lts7IF4O3wh+oACzNnyW3TMbFIhfWZAEPaIt7vwWKBA=;
        b=TNkYSPQ6rT5YOHwFjL56D6FfxbqNdFVRwLDpU7O15yVFb3RF/oTi75nW3NCF/Khylo
         Wt65Y98BzV5hQT/LIJ+F8/Ht1W+Hp3BFqd9OVLTrXq/SOJgvQpYudMtd6zBUAylVUJ1J
         Wbq3KmrN0xLrwS3vDaMIFy/uc/fMvrSJVLmmfPtxn8UD/UsIkw8BHm0KhaIg3uyWWHq6
         V0FoYq3R2nMv/V5rLY2Dl3T1uMsao7J2MPyAuRY54/fHwfnhf/5ulQ51rkyX6VJBST8n
         nCvL2fHopZ/jSqDji9CzdylIFcgu1ohZs73A9F/caCGgOZ0Pmh1k9VCQlGRTNI9Y+RCf
         PdCQ==
X-Gm-Message-State: AOJu0YxBv1U96w9rT5SCMYmGgLNh5jdNzO6LrC0UmEgL5zeop0J38Vpu
	bIuShIBsB6s7zE8k4/R69UYjZPPEoM7Gj7TlerUW23UnoZU9aJLYVw6XFuc+J7N4l0fRzqRFDAB
	eKVYRcXvqeQ25Y8n1cJoHtf0V9ydL4R/+mbj0
X-Google-Smtp-Source: AGHT+IFxZAwM5lscGOOxViCGPaFGQ6+rp1WtH1LHvLtTGxM3d+4WQ+OijdKn8+T80A2LN6pU7d0HQjw/vH20HZ1YHlY=
X-Received: by 2002:a05:6871:203:b0:232:fa6d:c5bf with SMTP id
 t3-20020a056871020300b00232fa6dc5bfmr89066oad.45.1712855176417; Thu, 11 Apr
 2024 10:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-9-debug@rivosinc.com>
In-Reply-To: <20240409061043.3269676-9-debug@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:05:38 +0000
Message-ID: <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>
Subject: Re: [RFC PATCH 08/12] riscv: dynamic (zicfiss) shadow call stack support
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com, 
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com, 
	cleger@rivosinc.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
	conor.dooley@microchip.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, waylingii@gmail.com, sameo@rivosinc.com, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, shikemeng@huaweicloud.com, 
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com, 
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com, 
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com, 
	wangkefeng.wang@huawei.com, falcon@tinylab.org, viro@zeniv.linux.org.uk, 
	bhe@redhat.com, chenjiahao16@huawei.com, hca@linux.ibm.com, arnd@arndb.de, 
	kent.overstreet@linux.dev, boqun.feng@gmail.com, oleg@redhat.com, 
	paulmck@kernel.org, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_100623_909313_BBE6129F 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

SGkgRGVlcGFrLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyEKCk9uIFR1ZSwgQXByIDksIDIwMjQg
YXQgNjoxMuKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+
IEFkZGluZyBzdXBwb3J0IGZvciBkeW5hbWljIHNoYWRvdyBjYWxsIHN0YWNrIG9uIHJpc2N2LiB6
aWNmaXNzIElTQSBleHRuLgo+IGVuYWJsZXMgcHJvdGVjdGlvbiBmb3Igc2hhZG93IHN0YWNrIGFn
YWluc3Qgc3RyYXkgd3JpdGVzLiBUaGlzIHBhdGNoCj4gZW5hYmxlcyBzY3NfKiBtYWNyb3MgdG8g
dXNlIHppY2Zpc3Mgc2hhZG93IHN0YWNrIHBvaW50ZXIgKENTUl9TU1ApIGluc3RlYWQKPiBvZiBy
ZWx5aW5nIG9uIGBncGAuCgpDT05GSUdfRFlOQU1JQ19TQ1MgaW1wbGllcyB0aGF0IHJ1bnRpbWUg
cGF0Y2hpbmcgaXMgdXNlZCB0byBzZWxlY3QKYmV0d2VlbiBzb2Z0d2FyZSBTQ1MgYW5kIGFuIGFs
dGVybmF0aXZlIGhhcmR3YXJlIGltcGxlbWVudGF0aW9uIChpbgphcm02NCdzIGNhc2UsIFBBQyBp
bnN0ZWFkIG9mIGhhcmR3YXJlIHNoYWRvdyBzdGFja3MpLiBJIHVuZGVyc3RhbmQKdGhpcyBzZXJp
ZXMgaXMgc3RpbGwgYW4gUkZDLCBidXQgSSBkaWRuJ3Qgc2VlIHJ1bnRpbWUgcGF0Y2hpbmcKc3Vw
cG9ydC4gQXJlIHlvdSBwbGFubmluZyBvbiBpbXBsZW1lbnRpbmcgdGhpcyBsYXRlcj8KCklmIHRo
ZXJlJ3Mgbm8gcGxhbiB0byBhY3R1YWxseSBwYXRjaCBiZXR3ZWVuIFppY2Zpc3MgYW5kIFNDUyBh
dApydW50aW1lLCBDT05GSUdfRFlOQU1JQ19TQ1MgZG9lc24ndCBzZWVtIGxpa2UgdGhlIGFwcHJv
cHJpYXRlIGNob2ljZQphbmQgd2UgbWlnaHQgbmVlZCBhIHNlcGFyYXRlIGNvbmZpZyBvcHRpb24g
dGhhdCBzdGlsbCBhbGxvd3MgeW91IHRvCnJldXNlIG1vc3Qgb2YgdGhlIHNvZnR3YXJlIFNDUyBj
b2RlLgoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
