Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34FEC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajPvW549VeRGPYbryNWtS/PJYLoedT7zoY390tiux80=; b=yx4sWtzJqGIHcy
	owlxadFezDaNgoh8DrH8Fs5/UP5oT0cFKjBg13j7p2wv0oVmd5kyLrKzL9W1J1dqD2OUO0+kPNf8p
	vsP8biAwG9LXTOA23VJRQCxpPrtQDJOORKdOBifbSpPdbdasHaBJcrA5Bg/W5d+zO8nbmntfaeQGb
	1AbgZnErly8xTPCPOQst2bQ+EbGQEPBvPtTXCtxCn6Eyylh0uqIvO2LgeaLt5tp+tqeS7p5g6fsAW
	6AUB4plVMZ9V+RmPDTpvLd6JBtBCiaxv3e6LZEusFahboJiF77ugihHuTKuM+bbTtVPc1IHnuP+xo
	Chag950+oNdJtMdLEppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyWd-0000000DTyE-3R5S;
	Thu, 11 Apr 2024 17:47:51 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyWa-0000000DTxC-0oeR
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 17:47:49 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-479de34dc36so36710137.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712857667; x=1713462467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYwphHubVdavW2q2CfHWSzZcTri349qYwqL0Kaxp6vY=;
        b=pxbttZ76begbUk1q/7moOIK1w6HRQJp2lMYO5aog9v1+iVPI9RlBes3hkJ2nuGywHX
         I+wPiAOS38R8ZXaEfXol3Fh75nHShXPTCMTZRB+FdgphRS+cFqTnGBqlBfh86Y0Pc5Dh
         FR7HjIncb858TaqdiIVI88thSoD2LvwQUCwvHMz7pdXJR3D7rZUGmydFxWuPLJrmapvV
         0Le3GXjWD+OuhYGd03teBbpWdijARc/TdYfBPGfKyzV6JQKqpJ3Pa1BcdLXWQ0h8zM2K
         bTCdA4+qQaennjxq44D56QxwRryoIi9tx4MdWkeJGCCznoZ+EQxosLVt0tIelEYzV+MY
         vBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712857667; x=1713462467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYwphHubVdavW2q2CfHWSzZcTri349qYwqL0Kaxp6vY=;
        b=RSB+NsJOE8UKL2tiJwo1cXLIfagjzQw/xGHlrgRYqgRK+JrJCRlyxhLqQlqeztIfPK
         oUP8diUF42+mMJPtAjy8qzXAU0xtbXntlhOhfA1xAyCyXrfHNMJsjnZn0dbB7zGqRVPT
         oJnoj78YNwK9f9FRch+WBZzdOdkrzQHxR43Dzif4zUg0IlA4OAEB11UIj1Y2d2AN/LCJ
         nf1ByW5oDvAIEadHtFeNOZFriZiyN8jAKojOFMTo6cwCa6PXIffjtxrRoh4cjrJ6FX1v
         bkhcSMhwA68jHpaNqfNGKimHAN63uJG/KjtB9++KF5qOq0xwnHZuHYBDZgXG9rJlqhiS
         FZRw==
X-Gm-Message-State: AOJu0Yzj4DcrKM4ifCZ4376TMC20p+rJqdQTp3J1IEZbwclg1+fdtix0
	TvUQR7L79JoHqhX5iMY7nMGA/m0w8HJ8sRXMzc2gz6iaivynoOdbJhF4bkezGv8y3+f3u/JGxhR
	+HMyMD4LzndHyi2XjzB0cu0+FnkqS5SO+zOlNef5G4GGjHM9+1O9Mb7E=
X-Google-Smtp-Source: AGHT+IEcPz+Jddb5/PFC6lnKGjEsh2a3jiEmNwqQxtj0rCsJztkrgOcBLcF0ZJvnbjJt+hL/suTSINeXHC36kW/M7Qw=
X-Received: by 2002:a05:6102:38cb:b0:47a:3da5:e5b1 with SMTP id
 k11-20020a05610238cb00b0047a3da5e5b1mr605945vst.27.1712857666585; Thu, 11 Apr
 2024 10:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240409061043.3269676-1-debug@rivosinc.com> <20240409061043.3269676-9-debug@rivosinc.com>
 <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com> <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
In-Reply-To: <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Apr 2024 17:47:10 +0000
Message-ID: <CABCJKufbEN-iO+nAQFw46Qe61HmfTfMALfz9o=EvmiAFY8+19Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240411_104748_252088_865DCF97 
X-CRM114-Status: GOOD (  25.55  )
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

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgNTozMOKAr1BNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDExLCAyMDI0IGF0IDA1OjA1OjM4UE0g
KzAwMDAsIFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4gPkhpIERlZXBhaywKPiA+Cj4gPlRoYW5rcyBm
b3IgdGhlIHBhdGNoZXMhCj4gPgo+ID5PbiBUdWUsIEFwciA5LCAyMDI0IGF0IDY6MTLigK9BTSBE
ZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBBZGRpbmcg
c3VwcG9ydCBmb3IgZHluYW1pYyBzaGFkb3cgY2FsbCBzdGFjayBvbiByaXNjdi4gemljZmlzcyBJ
U0EgZXh0bi4KPiA+PiBlbmFibGVzIHByb3RlY3Rpb24gZm9yIHNoYWRvdyBzdGFjayBhZ2FpbnN0
IHN0cmF5IHdyaXRlcy4gVGhpcyBwYXRjaAo+ID4+IGVuYWJsZXMgc2NzXyogbWFjcm9zIHRvIHVz
ZSB6aWNmaXNzIHNoYWRvdyBzdGFjayBwb2ludGVyIChDU1JfU1NQKSBpbnN0ZWFkCj4gPj4gb2Yg
cmVseWluZyBvbiBgZ3BgLgo+ID4KPiA+Q09ORklHX0RZTkFNSUNfU0NTIGltcGxpZXMgdGhhdCBy
dW50aW1lIHBhdGNoaW5nIGlzIHVzZWQgdG8gc2VsZWN0Cj4gPmJldHdlZW4gc29mdHdhcmUgU0NT
IGFuZCBhbiBhbHRlcm5hdGl2ZSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbiAoaW4KPiA+YXJtNjQn
cyBjYXNlLCBQQUMgaW5zdGVhZCBvZiBoYXJkd2FyZSBzaGFkb3cgc3RhY2tzKS4gSSB1bmRlcnN0
YW5kCj4gPnRoaXMgc2VyaWVzIGlzIHN0aWxsIGFuIFJGQywgYnV0IEkgZGlkbid0IHNlZSBydW50
aW1lIHBhdGNoaW5nCj4gPnN1cHBvcnQuIEFyZSB5b3UgcGxhbm5pbmcgb24gaW1wbGVtZW50aW5n
IHRoaXMgbGF0ZXI/Cj4KPiBTaW5jZSBJIGRpZG4ndCBzZWUgYW55IGV4YW1wbGUgb24gc2VsZWN0
aW5nIFBBQyB3aGVuIGBDT05GSUdfRFlOQU1JQ19TQ1NgCj4gaXMgc2VsZWN0ZWQuIFNvIEkgaGFk
IHRoYXQgY29uZnVzaW9uIGJ1dCB3YXNuJ3Qgc3VyZS4gSSB0aG91Z2h0IG9mIGRvaW5nIGl0Cj4g
YnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gYmluYXJ5IHJld3JpdGUgYWxsIHRoZSBmdW5jdGlvbnMu
IEl0IG1pZ2h0IGJlIHRvbyBtdWNoLgo+IFNvIEkgd2VudCBhaGVhZCB3aXRoIHVzaW5nIGBDT05G
SUdfRFlOQU1JQ19TQ1NgIGluIHRoaXMgUkZDIHNlcmllcy4KPgo+IFF1ZXN0aW9uOgo+IElmIGFy
bTY0IHdlcmUgdG8gdXNlIFBBQyB3aXRoIENPTkZJR19EWU5BTUlDX1NDUywgaG93IHdvdWxkIGl0
IGZpeHVwIHRoZSBjb2RlCj4gc2VxdWVuY2VzIGFscmVhZHkgc2V0dXAgYnkgY29tcGlsZXIgZm9y
IHNoYWRvdyBzdGFjayBwdXNoIGFuZCBwb3AgaW4gcnVudGltZT8KPiBZb3UgZXhwZWN0IHRoaXMg
dG8gYmUgc29tZSBvZmZsaW5lIHByb2Nlc3MgdXNpbmcgc29tZSBvYmplY3QgZWRpdGluZyB0b29s
IG9yCj4gYSBydW50aW1lIGRlY2lzaW9uPwoKV2UgdXNlIHVud2luZCB0YWJsZXMgZm9yIGxvY2F0
aW5nIGluc3RydWN0aW9ucyB0byBwYXRjaCwgbG9vayBmb3IKVU5XSU5EX1BBVENIX1BBQ19JTlRP
X1NDUy4gVGhlIGFjdHVhbCBwYXRjaGluZyBjb2RlIGlzIGluCmFyY2gvYXJtNjQva2VybmVsL3Bp
L3BhdGNoLXNjcy5jLiBJIHN1c3BlY3QgdGhpcyBpcyBnb2luZyB0byBiZSBhIGJpdAp0cmlja2ll
ciB3aGVuIHBhdGNoaW5nIGJldHdlZW4gdHdvIHNoYWRvdyBzdGFjayBvcHRpb25zIHRob3VnaC4K
Cj4gPklmIHRoZXJlJ3Mgbm8gcGxhbiB0byBhY3R1YWxseSBwYXRjaCBiZXR3ZWVuIFppY2Zpc3Mg
YW5kIFNDUyBhdAo+ID5ydW50aW1lLCBDT05GSUdfRFlOQU1JQ19TQ1MgZG9lc24ndCBzZWVtIGxp
a2UgdGhlIGFwcHJvcHJpYXRlIGNob2ljZQo+ID5hbmQgd2UgbWlnaHQgbmVlZCBhIHNlcGFyYXRl
IGNvbmZpZyBvcHRpb24gdGhhdCBzdGlsbCBhbGxvd3MgeW91IHRvCj4gPnJldXNlIG1vc3Qgb2Yg
dGhlIHNvZnR3YXJlIFNDUyBjb2RlLgo+Cj4gSSB3YW50ZWQgdG8gYXZvaWQgIiNpZmRlZiBSSVND
Vl9TUEVDSUZJQ19IV19TSFNUSyIgaW4gYXJjaCBhZ25vc3RpYyBzY3MgY29kZS4KPiBBbmQgdGhh
dCdzIHdoeSB3ZW50IHdpdGggQ09ORklHX0RZTkFNSUNfU0NTIHdoaWNoIHNldHMgZHluYW1pYyBz
dGF0aWMga2V5IG9uY2UuCj4gQW5kIHRoZW4gSSB1c2UgYGlzX2R5bmFtaWNgIGV2ZXJ5d2hlcmUg
ZWxzZSBpbiBhcmNoIGFnbm9zdGljIHNjcyBjb2RlLgoKV2UgY291bGQgZGVmaW5lIGFyY2hfIGZ1
bmN0aW9ucyBmb3IgYW55IGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb2RlCih3aXRoIGEgd2VhayBk
ZWZhdWx0IGltcGxlbWVudGF0aW9uKSwgYW5kIG1heWJlIGFkZCBhIGNvbmZpZyBvcHRpb24KZm9y
IHNwZWNpZnlpbmcgd2hpY2ggd2F5IHRoZSBzaGFkb3cgc3RhY2sgZ3Jvd3M/CgpTYW1pCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
