Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E38EC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF3MEXn4M0Q00uxT3DsscDY4pzLhkK1/SXroJI9fmwQ=; b=F2NZzIVTLPNpLnf0FQwpHSeMYT
	4XzpsmzLH/i4zSWqJHcRAESOhTCw4PoUJmvR0clAp86QBJiPGnnc/tH5rUuv5QRb7BoBExzvalXIC
	lO+/4A89CqyFMmqXKH0Mh7zVu3wJRxbByOPKIVd5JX/kCjcE/IW5DyBWJYIktoWFrXzmHk/heDWwE
	+pDP73rqSEYhu3eQE9WCS32kcttVbhx7rwBAJTrYVwmaa4vV912zwYnI4nlR/P6RJj4YXKz96kXQX
	WUTbpbBoova8KgLuDAU+QopO0dOHkFvqPw5okUnN9m7ZaNuz+3pxxPiRLrJcoRS6OtibksNSkgUop
	6/Z2eVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyGZ-0000000DOck-1Fr0;
	Thu, 11 Apr 2024 17:31:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyGD-0000000DOVt-26DX
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 17:31:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ecff9df447so119479b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712856648; x=1713461448; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGDMriGqMWX2SVCYOCeQKA5ixlUpINxXv13ekIsefu4=;
        b=ARj0LiU3Jk+GGLWJrWDRhX+WLEVyMDINKcX4jp5Agxvk/5QRHVAv2trJLZPwyWcuUO
         QqM4dEkIPhBGaoUSGzPYpS1kbHox7axjVCF++M7US0xZ7UFUaSbNPDcCGnx8HunriprM
         ttUsbRBx4ZJ8TNGrGI4YfHD8FfKS7ZrSPUUT9TSWX/FIUL6MRrqXiMqPl65wV/JTKQCZ
         1MpvdAwQc2QOaCTBnlYYYt2+JPtx+OpoRBRTddJbFyun+rzPyHWMy1DB1tOhS18dVUtz
         faWcU8sDGFSDiSOJAFD14l/h78JCpM8716TappJOVEpdcNDM9mKJVYCgFHlHpqK3OS7M
         3Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712856648; x=1713461448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGDMriGqMWX2SVCYOCeQKA5ixlUpINxXv13ekIsefu4=;
        b=v/bqsBr/TLPj8zEpOtCyfyoDGIz7ozxt3VpE07PQeYWghnY9VFjTudbliqEblGIWam
         /jzf9xGRstAhrhGpDjPVRC3rF1iZ2gsDGlZUASoDhrNmvw+N6/Kqc4ZOdk5WG+rbPSgE
         SpXo7s+urJIK4zPkUpGhouSzP256mGNXQzF+ve1Jcu9RDwkKh5iT3Rw748xJeZxAMpNa
         epKHdNp4c+wtvxfCViFB6L368+6YJmthUxxHtq2NA65rChExDYgSaVhypt5tNtaSZIoM
         kRGAgu120ZAfFVKeRSEp4q6R+wxO2MJs8ottAODG6StjnjqIgVarvxusflCOPtfLH+1A
         BASA==
X-Gm-Message-State: AOJu0Yw5Cig3aCkdzNK7Et5dNiwLVwTWpkOUvQjOxedYULdtAo/FLImg
	WHwnnzCznXgCyhDcF0fcY2ypjkHxXksoJG1F7JmGFPIoy5oi9waLNGdgAJOpghA=
X-Google-Smtp-Source: AGHT+IEiCzzp+1vro1jXejp7+//Vm+SCAsdvTNELFf+yEQKsv8bqhP5mexbLlJAAyee/qs+Xz2R5zw==
X-Received: by 2002:a05:6a00:2d20:b0:6ed:4a97:5dec with SMTP id fa32-20020a056a002d2000b006ed4a975decmr493911pfb.20.1712856647747;
        Thu, 11 Apr 2024 10:30:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x33-20020a056a0018a100b006e6c61b264bsm1436542pfh.32.2024.04.11.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 10:30:47 -0700 (PDT)
Date: Thu, 11 Apr 2024 10:30:44 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com,
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com,
	cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	waylingii@gmail.com, sameo@rivosinc.com, alexghiti@rivosinc.com,
	akpm@linux-foundation.org, shikemeng@huaweicloud.com,
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com,
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com,
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com,
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com, falcon@tinylab.org,
	viro@zeniv.linux.org.uk, bhe@redhat.com, chenjiahao16@huawei.com,
	hca@linux.ibm.com, arnd@arndb.de, kent.overstreet@linux.dev,
	boqun.feng@gmail.com, oleg@redhat.com, paulmck@kernel.org,
	broonie@kernel.org, rick.p.edgecombe@intel.com,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 08/12] riscv: dynamic (zicfiss) shadow call stack
 support
Message-ID: <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-9-debug@rivosinc.com>
 <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMDU6MDU6MzhQTSArMDAwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPkhpIERlZXBhaywKPgo+VGhhbmtzIGZvciB0aGUgcGF0Y2hlcyEKPgo+T24gVHVlLCBB
cHIgOSwgMjAyNCBhdCA2OjEy4oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBBZGRpbmcgc3VwcG9ydCBmb3IgZHluYW1pYyBzaGFkb3cgY2FsbCBzdGFj
ayBvbiByaXNjdi4gemljZmlzcyBJU0EgZXh0bi4KPj4gZW5hYmxlcyBwcm90ZWN0aW9uIGZvciBz
aGFkb3cgc3RhY2sgYWdhaW5zdCBzdHJheSB3cml0ZXMuIFRoaXMgcGF0Y2gKPj4gZW5hYmxlcyBz
Y3NfKiBtYWNyb3MgdG8gdXNlIHppY2Zpc3Mgc2hhZG93IHN0YWNrIHBvaW50ZXIgKENTUl9TU1Ap
IGluc3RlYWQKPj4gb2YgcmVseWluZyBvbiBgZ3BgLgo+Cj5DT05GSUdfRFlOQU1JQ19TQ1MgaW1w
bGllcyB0aGF0IHJ1bnRpbWUgcGF0Y2hpbmcgaXMgdXNlZCB0byBzZWxlY3QKPmJldHdlZW4gc29m
dHdhcmUgU0NTIGFuZCBhbiBhbHRlcm5hdGl2ZSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbiAoaW4K
PmFybTY0J3MgY2FzZSwgUEFDIGluc3RlYWQgb2YgaGFyZHdhcmUgc2hhZG93IHN0YWNrcykuIEkg
dW5kZXJzdGFuZAo+dGhpcyBzZXJpZXMgaXMgc3RpbGwgYW4gUkZDLCBidXQgSSBkaWRuJ3Qgc2Vl
IHJ1bnRpbWUgcGF0Y2hpbmcKPnN1cHBvcnQuIEFyZSB5b3UgcGxhbm5pbmcgb24gaW1wbGVtZW50
aW5nIHRoaXMgbGF0ZXI/CgpTaW5jZSBJIGRpZG4ndCBzZWUgYW55IGV4YW1wbGUgb24gc2VsZWN0
aW5nIFBBQyB3aGVuIGBDT05GSUdfRFlOQU1JQ19TQ1NgCmlzIHNlbGVjdGVkLiBTbyBJIGhhZCB0
aGF0IGNvbmZ1c2lvbiBidXQgd2Fzbid0IHN1cmUuIEkgdGhvdWdodCBvZiBkb2luZyBpdApidXQg
SSBkb24ndCBrbm93IGhvdyB0byBiaW5hcnkgcmV3cml0ZSBhbGwgdGhlIGZ1bmN0aW9ucy4gSXQg
bWlnaHQgYmUgdG9vIG11Y2guClNvIEkgd2VudCBhaGVhZCB3aXRoIHVzaW5nIGBDT05GSUdfRFlO
QU1JQ19TQ1NgIGluIHRoaXMgUkZDIHNlcmllcy4KClF1ZXN0aW9uOgpJZiBhcm02NCB3ZXJlIHRv
IHVzZSBQQUMgd2l0aCBDT05GSUdfRFlOQU1JQ19TQ1MsIGhvdyB3b3VsZCBpdCBmaXh1cCB0aGUg
Y29kZSAKc2VxdWVuY2VzIGFscmVhZHkgc2V0dXAgYnkgY29tcGlsZXIgZm9yIHNoYWRvdyBzdGFj
ayBwdXNoIGFuZCBwb3AgaW4gcnVudGltZT8KWW91IGV4cGVjdCB0aGlzIHRvIGJlIHNvbWUgb2Zm
bGluZSBwcm9jZXNzIHVzaW5nIHNvbWUgb2JqZWN0IGVkaXRpbmcgdG9vbCBvcgphIHJ1bnRpbWUg
ZGVjaXNpb24/IAoKPgo+SWYgdGhlcmUncyBubyBwbGFuIHRvIGFjdHVhbGx5IHBhdGNoIGJldHdl
ZW4gWmljZmlzcyBhbmQgU0NTIGF0Cj5ydW50aW1lLCBDT05GSUdfRFlOQU1JQ19TQ1MgZG9lc24n
dCBzZWVtIGxpa2UgdGhlIGFwcHJvcHJpYXRlIGNob2ljZQo+YW5kIHdlIG1pZ2h0IG5lZWQgYSBz
ZXBhcmF0ZSBjb25maWcgb3B0aW9uIHRoYXQgc3RpbGwgYWxsb3dzIHlvdSB0bwo+cmV1c2UgbW9z
dCBvZiB0aGUgc29mdHdhcmUgU0NTIGNvZGUuCgpJIHdhbnRlZCB0byBhdm9pZCAiI2lmZGVmIFJJ
U0NWX1NQRUNJRklDX0hXX1NIU1RLIiBpbiBhcmNoIGFnbm9zdGljIHNjcyBjb2RlLgpBbmQgdGhh
dCdzIHdoeSB3ZW50IHdpdGggQ09ORklHX0RZTkFNSUNfU0NTIHdoaWNoIHNldHMgZHluYW1pYyBz
dGF0aWMga2V5IG9uY2UuCkFuZCB0aGVuIEkgdXNlIGBpc19keW5hbWljYCBldmVyeXdoZXJlIGVs
c2UgaW4gYXJjaCBhZ25vc3RpYyBzY3MgY29kZS4KPgo+U2FtaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
