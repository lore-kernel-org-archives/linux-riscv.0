Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFQZ0cmZVRwTzHL2hPM+KQrLP0xiiU4owWR2IDP1T9A=; b=FC5GnlwcBPJhMx
	uw2FOHVSiS2dpuAPgaMveuWD2QzK18Zz+pka9TUxkyaPmISW3WUQjaKjPbExQ5cT+8hPs9xctzVN6
	IwGuqGU/3ZvXFtloY4j1uwtFixtpq4O6mo3Ji5gDDkLZMbwtKZe1ll2sBEgLpwBhn0yvnyvD6baHE
	bpWe/97jmjK1DYPpQpbzMvPJjEXn2BPRK9FnecVnZcBQo3GWBP31/biuDqSE7EgIH33KkYtxhBOSX
	8ikptWW+8gorsFDXadyqZVah9Uca68ploSb0Ss/tI9zQOH8/UQ+jMlNWVBfOnwcmqrRVROou9BNRI
	hUezES3z5A30dDDxbMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXRR-0000000Cce4-3zsu;
	Fri, 09 Aug 2024 21:46:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXRO-0000000Ccct-3YXh
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 21:46:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so3428689e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723239989; x=1723844789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPcWoPM5T6mXCkBA46P8MiJW+R84UJA1C5ibsXG+NU0=;
        b=YekN6vA4s+9d6COVdfXQWtz9Ex1DIWlsGleJ5sTgUrZsuuGba3ruwjhJd0VmwX1lSl
         CQLNn7aRdNHHtbDtIPrLYRITCgDKChgQC9v+TRKKv+EY90Y/uWO8yL2duDG37e2t3mib
         rQH1YBXk+2DY4Sk942/0p9KVCbSWHNCP8vkokffXzo8oNkx4VKT3x55rvmg/0vipWlJ8
         tuzM9WnlduqjPbobNLk7j2Gi9QKwxcE5urDpa0kQXsOd+bzwlNosPsDdK8GGoz0Wbfxc
         mv4GJbj88LH71XfZm6rEq0JHAzFKrbTAAR3zPZ8Ueuv2d33WqWy+SDXDVuKlTeQUEri0
         mopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239989; x=1723844789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPcWoPM5T6mXCkBA46P8MiJW+R84UJA1C5ibsXG+NU0=;
        b=SrcCVAAZ2bawPsXeiJpmd6jCew+QqStYWsXYq2KoiWPZjp6nbYWHWyDN11kUaBnB5j
         3vGIjU4E0doAp2xS2U2K9m8xnMhUQjR5s5d4jKGbtOz0Ir5K/9C+pwrX8jvjDmsqU7Jv
         MricbKguLXdkKaXZd1qTPgG5auCPCiNKc6N9/PysMOqsN+xCYvexurjIvyViKDddWxUd
         lHGbRxLVotkmlo59cNIIhGAXEhKcbfRmG4oq2CkGzXj5c9sgTqxtHCGs+KZbF4vHYaRr
         fQiPGt4bZKEmo8koriOvyMi8FVCkaB4BD7r+BOvGwwz0C0b6xUYK2O9EyvMKN/zBdWZo
         UByQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgQc5GdaQr7BG+9iB/bWxElazy1FxYXRzWhBr7hYbtSbsCkvDFdQdbMolf+OY6tUtm8tE0S8D1ttfq7lUu0OHWfh/VuaWSRH7fK37uCIJS
X-Gm-Message-State: AOJu0YyMzrIi2lTEpga/tl15xDQ/NEnC5hM6hy8jNVJ4v8y0I/qXAGPh
	XrdyPZq+oh9ukFdiXw72HBALb7jcc0spEcDpVu1AW525XnSH0krFi+H0P6QiZAKrKj1kv2fiDgl
	bs87LTFSvdnO1BmI5TxUWuSWUhRSph7T2PRsdzQ==
X-Google-Smtp-Source: AGHT+IGUt3SIx098yHI0NOjFFT5huwe1Am0ALs5y4vYy6uypKkqdYWRivXOcblLqYD46P9ZeahVdLkwLe4tHmNVf4K4=
X-Received: by 2002:a05:6512:3b22:b0:530:9a14:f0a0 with SMTP id
 2adb3069b0e04-530ee992c07mr2527402e87.10.1723239988591; Fri, 09 Aug 2024
 14:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240627172238.2460840-1-evan@rivosinc.com> <20240627172238.2460840-3-evan@rivosinc.com>
 <ZrO1MxZH+GwC5FQS@ghost>
In-Reply-To: <ZrO1MxZH+GwC5FQS@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 9 Aug 2024 14:45:52 -0700
Message-ID: <CALs-Hssb6R+EJjZsUAEktiFXfPFh4s6xuLqy824TUrEQSEbYAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Erick Archer <erick.archer@gmx.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_144630_913872_3C711EDD 
X-CRM114-Status: GOOD (  22.27  )
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

T24gV2VkLCBBdWcgNywgMjAyNCBhdCAxMDo1NuKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTA6MjI6
MzhBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IEluIHByZXBhcmF0aW9uIGZvciBtaXNh
bGlnbmVkIHZlY3RvciBwZXJmb3JtYW5jZSBod3Byb2JlIGtleXMsIHJlbmFtZQo+ID4gdGhlIGh3
cHJvYmUga2V5IHZhbHVlcyBhc3NvY2lhdGVkIHdpdGggbWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNz
ZXMgdG8KPiA+IGluY2x1ZGUgdGhlIHRlcm0gU0NBTEFSLiBMZWF2ZSB0aGUgb2xkIGRlZmluZXMg
aW4gcGxhY2UgdG8gbWFpbnRhaW4KPiA+IHNvdXJjZSBjb21wYXRpYmlsaXR5Lgo+ID4KPiA+IFRo
aXMgY2hhbmdlIGlzIGludGVuZGVkIHRvIGJlIGEgZnVuY3Rpb25hbCBuby1vcC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4KPiA+IC0tLQo+
ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAgLSBMZWF2ZSB0aGUgb2xkIGRlZmluZXMgaW4gcGxh
Y2UgKENvbm9yLCBQYWxtZXIpCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ICAtIEFkZGVkIHBh
dGNoIHRvIHJlbmFtZSBtaXNhbGlnbmVkIHBlcmYga2V5IHZhbHVlcyAoUGFsbWVyKQo+ID4KPiA+
ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAxNCArKysrKysr
LS0tLS0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICB8
ICA1ICsrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAg
IHwgMTAgKysrKystLS0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
YyAgICAgICB8ICA2ICsrKy0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQuYyB8IDEyICsrKysrKy0tLS0tLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+ID4gaW5kZXggNzEyMWEwMGE4NDY0Li4wZDE0ZTlkODNhNzggMTAwNjQ0Cj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ID4gQEAgLTI0MywyMyArMjQzLDIz
IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+ICAgIHRoZSBwZXJmb3JtYW5j
ZSBvZiBtaXNhbGlnbmVkIHNjYWxhciBuYXRpdmUgd29yZCBhY2Nlc3NlcyBvbiB0aGUgc2VsZWN0
ZWQgc2V0Cj4gPiAgICBvZiBwcm9jZXNzb3JzLgo+ID4KPiA+IC0gICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOYDogVGhlIHBlcmZvcm1hbmNlIG9mIG1pc2FsaWdu
ZWQKPiA+IC0gICAgYWNjZXNzZXMgaXMgdW5rbm93bi4KPiA+ICsgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfVU5LTk9XTmA6IFRoZSBwZXJmb3JtYW5jZSBvZgo+
ID4gKyAgICBtaXNhbGlnbmVkIGFjY2Vzc2VzIGlzIHVua25vd24uCj4KPiBIZXkgRXZhbiwKPgo+
IFRoaXMgc2VyaWVzIGhhc24ndCBsYW5kZWQgeWV0LCBjYW4geW91IHJlYmFzZSBhbmQgcmVzZW5k
PyBUaGVyZSBpcyBhCj4gcGF0Y2ggWzFdIHRoYXQgY2hhbmdlcyB0aGUgd29yZGluZyBvZiB0aGlz
IGRlc2NyaXB0aW9uIHRvICJtaXNhbGlnbmVkCj4gc2NhbGFyIiBpbnN0ZWFkIG9mICJtaXNhbGln
bmVkIi4gQ2FuIHlvdSBhcHBseSB0aGF0IHdvcmRpbmcgY2hhbmdlIHRvCj4gdGhlc2UgbmV3IGtl
eXM/CgpEb25lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
