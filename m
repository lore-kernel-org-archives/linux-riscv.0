Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4617EC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4/r5pwc7rXusO1zI0NW4lVv1Qwl9FDBDp1k2CylIJc=; b=YD3FcCh33PG2ab
	v8X+gUY2mO+4atII2Xw9UIQegFZn8EiG19zfc1oh2p0CJ0g4zHDr3PMEGW8F2coMgf7PHxzd1//IO
	5BvDyaqoURT1luiWLikG2MIi5PKsCAZDLY207iW+ZP9dhOjpWsv2RlkYbtGKKA2mQAdzD9YstOFex
	Okl8PoolQbShpW88Tv4uwtdNdYz+xSOq+ew/GtdaxF4XC9q/+42nVvfZJ9hqiawopvFn7HuQMX4rA
	uLZwcte/EFQVEm9GkO9/CoHl+KBg43jUiYgPunl8ueijaU6SZDoVva0RR/+CGrfF5mk15JzkJe6Ug
	yCIEmsq0PQy2qaNJpbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddWg-00000009kV9-3HVb;
	Thu, 30 Jan 2025 23:00:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddWe-00000009kUj-3kpO
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 23:00:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so1897137a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 15:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738278044; x=1738882844; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbdFnQsA2+ijVtkjeNBQrudx+f60ouLemRPuBfJepVA=;
        b=GkD7gtgd7OkfBDJFZrrlIfeKKkeh8Heb1CWj4Vyk6ok2hoVoYWUDYO9IQxiyj2AkWI
         BvWog5O7jCiaUsCUnLgm/ojDxzDjaTTe1bBOHAWjdEF3t6DbeE2JCuWzzsU+ODT56zry
         pZzV/PtjdjnXHc86pyeRw+fdgYnZ3c8wcmr4dQ/4aBR+1c8Nn3VRDb439gLN9eTnZNg5
         5UmoHWJHpyxhMibyoyakWos4vj9MBtvXgJ0yo0hr1ZqBGFzsEt/lBM9ikf86k7LoPGst
         Y5DWi9w8/N4NYoE0qBmPJrykCsZ7oPeYP6ZlStLkBuUaEJ78R2mb/h9yu90zYtEmv1sL
         vysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278044; x=1738882844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbdFnQsA2+ijVtkjeNBQrudx+f60ouLemRPuBfJepVA=;
        b=ZsIoWliOjqjqehtHUVt9MkjS94H5fip1pxJqbPMSEOSdrPk1KQcY/pXDIRtNVSlThx
         daOtQT3JUx11eLnAk6zLVQZc1Jgai1GAL7DD8wPYMAVcoQYUlzX+3qjCnS0eOqxXe2Nw
         gEN9BCrKVg7XwgdX+Ccz2Qj+ubk2cdXz5CHC1MK7Z+YZcxIS3P5qkQaQpxWcvA20sCNb
         p5bnAbhSzDD+cGArtuzDypB1zYO9U1zrPy2lDs6T+3fADgYvSyK2fUF/Wl63aZrfN/g7
         s7K9Bcl48hWBNfWQzFbLKv+UWRrBF5nPfWvBjp1YZtLI0BjlSvrbTtl3pipcela3G1ld
         /Wsg==
X-Gm-Message-State: AOJu0YzWt6DuB1R/sdS1PyaJjcWtHvwWg+aXEcsArN1eDdSavRPDeq7N
	/wqrETICYz3ySdjzvnhdiECAa4di596zXi00rhkEnCpYLOsUEZiXqlUuAS/6iEw=
X-Gm-Gg: ASbGncvvvSOomYt/KJL2bc9B8znc5AKZBwLGc8FmNWa2Sv90LcS3ztQZ30NyzERY+f1
	jz6uKFPJKx+4lWD1+yBUzNvVncLBgWCXAY3jSDeTsM2AxXMWzUZmzHyF1TiobXItF+4FVOKC40h
	k6icLVDKlrA3oo71Y8l0FVfnvvQq+hda7wsTGn7P0KclZTIdzVmTy3vPytHNA54NQJSQeO+Ii80
	Lkm9ahFizxpH076+78BlRLnE64Yr/b+3YVMNPoxsCkCL9Oyx/9R8QcnrK2uvBKOoq8ed1X75R7j
	MMGOPbzSMA==
X-Google-Smtp-Source: AGHT+IFLWgsLUrLOxl40W4xTTVvUYH5wdpkg8jyUgRi9f0Lpi5/Hc0iLnKkZO5RIOcZhgJ+cqwRAkg==
X-Received: by 2002:a05:6a00:e14:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-72fd09700f2mr13043330b3a.0.1738278044015;
        Thu, 30 Jan 2025 15:00:44 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:cd5c:b7b4:1f3d:62bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf9asm1999761b3a.27.2025.01.30.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 15:00:43 -0800 (PST)
Date: Thu, 30 Jan 2025 15:00:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z5wEmX2ykQJmvnTV@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129131703.733098-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_150044_935560_C362D708 
X-CRM114-Status: GOOD (  10.41  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDI6MTc6MDNQTSArMDEwMCwgQWxla3NhbmRhciBSaWth
bG8gd3JvdGU6Cj4gRnJvbTogRGpvcmRqZSBUb2Rvcm92aWMgPGRqb3JkamUudG9kb3JvdmljQGh0
ZWNncm91cC5jb20+Cj4gCj4gVGhlIHJpc2N2IE1JUFMgUDg3MDAgdXNlcyBhIGRpZmZlcmVudCBv
cGNvZGUgZm9yIFBBVVNFLgo+IEl0IGlzIGEg4oCYaGludOKAmSBlbmNvZGluZyBvZiB0aGUgU0xM
SSBpbnN0cnVjdGlvbiwgd2l0aCByZD0wLCByczE9MCBhbmQKPiBpbW09NS4gSXQgd2lsbCBiZWhh
dmUgYXMgYSBOT1AgaW5zdHJ1Y3Rpb24gaWYgbm8gYWRkaXRpb25hbCBiZWhhdmlvcgo+IGJleW9u
ZCB0aGF0IG9mIFNMTEkgaXMgaW1wbGVtZW50ZWQuCj4gCj4gQWRkIEVSUkFUQV9NSVBTIGFuZCBF
UlJBVEFfTUlQU19QODcwMF9QQVVTRV9PUENPREUgY29uZmlncy4KPiBIYW5kbGUgZXJyYXRhIGZv
ciBNSVBTIENQVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGpvcmRqZSBUb2Rvcm92aWMgPGRqb3Jk
amUudG9kb3JvdmljQGh0ZWNncm91cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxla3NhbmRhciBS
aWthbG8gPGFyaWthbG9AZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJhaiBWaXNod2FuYXRo
YW40IDxydmlzaHdhbmF0aGFuQG1pcHMuY29tPgoKUGxlYXNlIGNvcHkgcGVvcGxlIHdobyBjb21t
ZW50ZWQgb24gcHJldmlvdXMgdmVyc2lvbnMgb2YgcGF0Y2hlcyBpbiB0aGUKbmV3IHZlcnNpb25z
IQoKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
