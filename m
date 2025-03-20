Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA727C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqxAx76l23GlrpoFMY5faPuvQckWF6y6QUd5qh4ruLE=; b=SwzjVHBHIuKg5Q
	Pafq0imLhNSTAi+sDoGfFwm2C0XubjFXWELFmrT3ePq48yJjpygSn9/y/4A8uIDO3mKbfq43dNM2v
	UGFNGtvuoqM/vXD7aB7VWdGrX3F66lAY/P7RMaPjsB/yFpRhtdHuajJrCwxZqaiqiQEPWB5vyEDB8
	1qWTV4UBaVECZCUkE7Xuo60zal54OVgWCHRi9ZlLJeDkEVpie+9KoLDCi8Jgosa95C98y+vSpTi3C
	ZMqv+Xxj/zpRqEJGCG0wnIyPzGw3eAg+rWP5tT1M5YgS91uFeU7bAtB2kMOjUrjhfXP5/o399A8Gl
	3M24oR14OKMh6QS7HQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOQC-0000000DNGp-30BV;
	Thu, 20 Mar 2025 22:31:28 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOQ9-0000000DNED-0wGJ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:31:27 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6ff4faf858cso9592537b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742509884; x=1743114684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IofsmlVDJhRwn5HSuRGp3pTAenUeDGvG4AuBmId2Qpg=;
        b=1ZOrtvwW5DffCM5W3bxLSiq1Q6R7uwcM3o/z//ypHuFsN+fuYH+GqnreHMwz1YzlPT
         1ymTcF29ctscqCAkuWpKtvu+yfKS+tRSNMsrPD5d1Kp4qMV4s8gE+2ebi3lx4Xog8r/0
         crjwyPVphzjtpv+ND4bE4EoW2W5bKDtN3yYrP3VkUPMxjgiXMKaM+oo8NFUWs729T+hm
         LniYZgD0ZhQElH8KymoTd7mLgP1ijl3W6ve6McKipGLae16pdV232koXumQU/JpkMDx6
         XMP6fQzV/Ssu//MOf4/E9BGDVBG4zIkN3PEeLueo3/hFsAq6YoJsJmLLW26XxpOrQYma
         colw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509884; x=1743114684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IofsmlVDJhRwn5HSuRGp3pTAenUeDGvG4AuBmId2Qpg=;
        b=rfnMo2GBYMA6nccK+7UbxSLZ9rGs6xRGkC2eVzZk/H7XEmt9CAw1Dtcg1UdhhzG5aW
         +THRsmf9OneYuziJxT4xCEF8hNlFdD9MPPakFtBNYTY4DyEOCldeLYTiWbUQ3BfswQFx
         iykaiTMrOs4Jidq8zti6OuyNCs+gUm7H7Vph7XJ8l/FHjwsfeU5BbiGuqWsoVihEe7TZ
         So0jXD7ICBKqhQHGwVYeMomOjswY45HekNlsPuecjAsVMWZ7BP5LgTxl9SHYxObyYEVM
         7rm4gsMEDH6RdXroVI4h/JDzyJexx1vBSpJStLkl/vJcTNM03DAZCQg8D3TyvEM8HJF7
         mZXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqQqNLuPzoaHgZ2EOv/yFyKpGcY0vqlAitHG2O+vbB00IYFl5IVY/oKRqV7tn31GNlYho1Bhw0ywLgDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+p6R43Fa5ZqxrEVShyL0zv2/qm0gNy0TDGhiowm43NQI+MiA
	EJhGAwcFn6TuDvYbgbvCHTiRxd0MiXi3SnXtp3nEvbom83vR8jtRH4iOmoIAr3hBHswZ2eNYq00
	x6eK8nuQlrtsMetVnXE6QrX1Nyp6aovYqg0ehIw==
X-Gm-Gg: ASbGnctMfDImTMJbPTPNAbvR2874+jediztW/MO7ozS3p0SvuByvokgP4wSjaYK9geF
	i6zUmCBT/lUNkneWFuPbnO2wvuCGu2xzwEc+/hbPIpE6V5fm+l4palRc6HFfXztI1s2zbA2wV/N
	85u5wP4TYIwccYxAZ4vYtjq/qT2lY=
X-Google-Smtp-Source: AGHT+IHFNCvqeNOK7sMsBmLPvgYWG7exVxSWvS9DNLcUgNmS336dZeeGcZ6AHSeGvrnkMyVPDEN8X9dkpWdV3lB6eDg=
X-Received: by 2002:a05:690c:3809:b0:6e2:1527:446b with SMTP id
 00721157ae682-700babe54c1mr17364757b3.3.1742509884010; Thu, 20 Mar 2025
 15:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-23-e51202b53138@rivosinc.com> <D8LF0RDZ6809.1I3MCCVSHRSQ2@ventanamicro.com>
In-Reply-To: <D8LF0RDZ6809.1I3MCCVSHRSQ2@ventanamicro.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Mar 2025 15:31:09 -0700
X-Gm-Features: AQ5f1JrziMLdrjsoBdVgxAHm84jf6CZ2h4oWTVpyzciuX161uoZpfiFXMbIZdgY
Message-ID: <CAKC1njQR9yARvWffjznjpeZK5zLFpg0-qCUo25_8niH29YL6uA@mail.gmail.com>
Subject: Re: [PATCH v12 23/28] riscv: kernel command line option to opt out of
 user cfi
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153125_260725_904D1DA4 
X-CRM114-Status: GOOD (  19.50  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMjozNeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDMtMTRUMTQ6Mzk6NDItMDc6MDAs
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPiA+IFRoaXMgY29tbWl0IGFkZHMg
YSBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbiB1c2luZyB3aGljaCB1c2VyIGNmaSBjYW4gYmUK
PiA+IGRpc2FibGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPiBpbmRleCBkMzFkODk2MTg3NjMuLjgxMzE2
MmNlNGYxNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPiBAQCAtMTcsNiArMTcsOCBAQAo+
ID4gICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS91c2VyY2ZpLmg+Cj4g
Pgo+ID4gK2Jvb2wgZGlzYWJsZV9yaXNjdl91c2VyY2ZpOwo+ID4gKwo+ID4gICNkZWZpbmUgU0hT
VEtfRU5UUllfU0laRSBzaXplb2Yodm9pZCAqKQo+ID4KPiA+ICBib29sIGlzX3Noc3RrX2VuYWJs
ZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ID4gQEAgLTM5Niw2ICszOTgsOSBAQCBpbnQg
YXJjaF9zZXRfc2hhZG93X3N0YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2ln
bmVkIGxvbmcgc3RhdHVzKQo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBzaXplID0gMCwgYWRkciA9
IDA7Cj4gPiAgICAgICBib29sIGVuYWJsZV9zaHN0ayA9IGZhbHNlOwo+ID4KPiA+ICsgICAgIGlm
IChkaXNhYmxlX3Jpc2N2X3VzZXJjZmkpCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4g
Kwo+ID4gICAgICAgaWYgKCFjcHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkpCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+IEBAIC00NzUsNiArNDgwLDkgQEAgaW50IGFy
Y2hfc2V0X2luZGlyX2JyX2xwX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2lnbmVk
IGxvbmcgc3RhdHVzKQo+ID4gIHsKPiA+ICAgICAgIGJvb2wgZW5hYmxlX2luZGlyX2xwID0gZmFs
c2U7Cj4gPgo+ID4gKyAgICAgaWYgKGRpc2FibGVfcmlzY3ZfdXNlcmNmaSkKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiAgICAgICBpZiAoIWNwdV9zdXBwb3J0c19pbmRpcmVj
dF9icl9scF9pbnN0cigpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4g
PiBAQCAtNTA3LDMgKzUxNSwxNiBAQCBpbnQgYXJjaF9sb2NrX2luZGlyX2JyX2xwX3N0YXR1cyhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssCj4gPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHNldHVwX2dsb2JhbF9yaXNjdl9lbmFibGUoY2hh
ciAqc3RyKQo+ID4gK3sKPiA+ICsgICAgIGlmIChzdHJjbXAoc3RyLCAidHJ1ZSIpID09IDApCj4g
PiArICAgICAgICAgICAgIGRpc2FibGVfcmlzY3ZfdXNlcmNmaSA9IHRydWU7Cj4gPiArCj4gPiAr
ICAgICBwcl9pbmZvKCJTZXR0aW5nIHJpc2N2IHVzZXJjZmkgdG8gYmUgJXNcbiIsCj4gPiArICAg
ICAgICAgICAgIChkaXNhYmxlX3Jpc2N2X3VzZXJjZmkgPyAiZGlzYWJsZWQiIDogImVuYWJsZWQi
KSk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMTsKPiA+ICt9Cj4gPiArCj4gPiArX19zZXR1cCgi
ZGlzYWJsZV9yaXNjdl91c2VyY2ZpPSIsIHNldHVwX2dsb2JhbF9yaXNjdl9lbmFibGUpOwo+Cj4g
SSdkIHByZWZlciB0d28gY29tbWFuZCBsaW5lIG9wdGlvbnMgaW5zdGVhZC4KCk9uZSBmb3Igemlj
ZmlscCBhbmQgb25lIGZvciB6aWNmaXNzID8KPgo+IEluIGFueSBjYXNlLCBJIHRoaW5rIHdlIHN0
aWxsIGRvY3VtZW50IHBhcmFtcyBpbiBrZXJuZWwtcGFyYW1ldGVycy50eHQuCgpOb3RlZCwgd2ls
bCBkbyB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
