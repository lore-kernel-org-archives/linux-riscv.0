Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E42C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTPMDNbLdg3SLPmo47V9b77I8AHejVG83fAx6KTv8iI=; b=CQB+UzXo8/MnZO
	S1R44zvqFZmH2W/xSh7pkS2WwhXAm/CO1g/T0tYMTyco/QjXqfZDNPTIUAaagni8ikgUH4vAk+ZZl
	D2Fp838I2ykAkfHGHYl52YcZbtRrB298vgNy+kO9/1tLL0DbliNdOrV5K8SCoSCuweKQEg3AwBToN
	geMLSog1/CoQl31jcEHeIWgQJOUulyuiEVKu9zBYYaqWRCFc3nYfiXjVnexbX5++PF6eGz/K0A0nV
	iGc8McZWLEwCuUU2xVslbmqeI/d56RQMrUEHLlgWRQZxF9Q3ocQAZBwxDoIHse3IiGtkUCeCA5bgz
	GAYOTnqLf2UWPNhvkRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeog-000LpH-2w;
	Mon, 14 Aug 2023 21:09:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeoe-000Loi-0g
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 21:09:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bc63ef9959so41206195ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692047370; x=1692652170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PuvQpJrJqrNy7astmt5IVebXoF5w/a9tG+pRmbryqo=;
        b=kxnjP4K14WJSvLPejXWZrEY2njof9Zmsz4pFZ+tWjEdwYQPwfyIy1Mbf1S1FDVBq9l
         9MWRs8VsKnOSdrE1QbDjEkJezJ9LJ2HWu8lANe7NqKHvNsNkhjfFXFiphBgOObgoJjGR
         Gfg8K0Q8n07N+ZzpKj9/KJ0ZLGM2DIevYNjic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692047370; x=1692652170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PuvQpJrJqrNy7astmt5IVebXoF5w/a9tG+pRmbryqo=;
        b=aGor0lEB29YAClUY0DXKKYmbgDd3IEpjWOWZVeQSYHw01hOAy54yjNB38sJLZ/hBkQ
         ueNBxkxSeYK646jYzJ3JwS0U/prAzJjermKGVsdjrV+lXwux+v98zJGOnykCID53s6kJ
         Kn2CDYeEykUM4j6Csm1NKpHLDFzHTbLaFs0Pj7nYFZl+pzh//N1gVwC0PhyMgTnIBHnJ
         AFaSw9USWHKSJZezAEcR29vVhQCGBk3/C7b7ws+X9L2SOSJjJdRJS/QB5AlmyzMQcxmw
         99b7wDLsvIXDr9Gv8w3bfRejRWmme5QozdUL6Rp3ez4PskLhhU5OUcnh5oMZ7LY5YMa6
         Nu+w==
X-Gm-Message-State: AOJu0YxFfl74GjTyWKmy0XYe6+kZe7YWXn8nB5WNt+K+QaJV1nb6U6Hk
	+RBVu+6tW6HKtfz+0DTSjczOiw==
X-Google-Smtp-Source: AGHT+IFYeDWP5PYNKsk0YR+BiKLZK4N4Rwa0P0VjZkZ6hsNlrW8rO0WgiTO5nntV4saLBRmYH2B/dg==
X-Received: by 2002:a17:902:ee44:b0:1b0:6038:2982 with SMTP id 4-20020a170902ee4400b001b060382982mr10965327plo.41.1692047370203;
        Mon, 14 Aug 2023 14:09:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001b857352285sm9941444plb.247.2023.08.14.14.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:09:29 -0700 (PDT)
Date: Mon, 14 Aug 2023 14:09:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: SCS support
Message-ID: <202308141409.76B8A274BF@keescook>
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X>
 <202308141131.6B90A4205@keescook>
 <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
 <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_140932_250243_9FF6418F 
X-CRM114-Status: GOOD (  13.83  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMDE6MTg6MzBQTSAtMDcwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAxMTo1N+KAr0FNIFNhbWkgVG9sdmFuZW4g
PHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPiB3cm90ZToKPiA+IExvb2tzIGxpa2UgX19idWlsdGlu
X2ZyYW1lX2FkZHJlc3MgYmVoYXZlcyBkaWZmZXJlbnRseSBvbiBSSVNDLVYuCj4gPiBBZnRlciBz
dGFyaW5nIGF0IHRoZSBkaXNhc3NlbWJseSBhIGJpdCwgdXNpbmcKPiA+IF9fYnVpbHRpbl9mcmFt
ZV9hZGRyZXNzKDApIC0gMSBpbnN0ZWFkIG9mICsgMSBzZWVtcyB0byB5aWVsZCBjb3JyZWN0Cj4g
PiByZXN1bHRzLgo+IAo+IEVsbGlvdHQgd2FzIGtpbmQgZW5vdWdoIHRvIHBvaW50IG91dCB0byBt
ZSBvZmYtbGlzdCB0aGF0IHRoaXMgYmVoYXZpb3IKPiBoYXMgYmVlbiBkb2N1bWVudGVkIGhlcmU6
Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRv
Yy9ibG9iL21hc3Rlci9yaXNjdi1jYy5hZG9jI2ZyYW1lLXBvaW50ZXItY29udmVudGlvbgo+IAo+
IEknbGwgaW5jbHVkZSBhIHBhdGNoIHRvIGZpeCB0aGUgdGVzdCBvbiBSSVNDLVYgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KClBlcmZlY3QhIFRoYW5rcyBmb3IgZmlndXJpbmcgb3V0IHRoZSBvZmZzZXQu
IDopCgotLSAKS2VlcyBDb29rCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
