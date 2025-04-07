Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3973DC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 05:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFhj+cj8SRwUtWgaG8zEFOuxJ9+KUlOEKcVqTnjccYs=; b=y/R1omfppzOzGm
	/L+ju1pkxbp54XP8AZ84vCDuPWL3m8K/Hvq8fMz8vZp2bH67C17UP7GE+tvZpdXKsCks9pasobPJ1
	tbI8O2lPpRKJQsGNeQEeLkV09HKaAaRhk+b+FRsn2JoqeDp4cLQ8KwsLLOZe4s6q+j34/kLkzKgdM
	2vXAcgnMQhmBjWsMTrjRbglHpU9ih55QvpVv5APP7e+Gyi67SzPLnazW1oRfKONHovzLDgcb1Bdr9
	ZHCix13tyd6+tpT7OQPXSQ24JiQQ1GFbUGrmKRXP2UZ7nmSv/hkj43iaTyF1dI7caB9hVKC7fLi//
	GHge1lj5RP9G85YyH2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ezE-0000000GRkl-27cw;
	Mon, 07 Apr 2025 05:25:32 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eRc-0000000GNcG-0AlE
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 04:50:49 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso125920439f.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744001446; x=1744606246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSbT54uFLuQxmkO99JJbKmBYJPhP8w1aIEAoXHHJX9k=;
        b=nXjmswsidREVTPFyircmlagX1tk4i2r3XV8izG3jgiq3jkv8nNzuT/l/J6qmaZo/s/
         QcF0CcyvuCXuaDWxm7bQpL4tAThY7N5/2JDUg6IknnLhiDaGqzgKMfrCVAPl4x+S4Pu5
         CHvFu91gEyC7D6QmFutSx3mrt9XX1rLt0xm6RjFtOIufoTha2YGXuzx1iYKBIhMTsf84
         mYUiMhOPyd/8FOyYRcx3fV8I+qaBmZhdfqMZs6o4xLwLyQ5XZxN86iHlNf9YgDC5/yKO
         Zu4guGp5/Zf0H+62A6UN4LPKQHYNjvwIAjRH1ZN8jHcRpRNqzETzmRR0z4LGzMweS3PS
         ZZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001446; x=1744606246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSbT54uFLuQxmkO99JJbKmBYJPhP8w1aIEAoXHHJX9k=;
        b=u/MTI4PPTPFK3In7skH+vJCV8EdFuSyrmVvhWsIEwsNpG8IMt8LF8BYZP7DR0e+QhY
         ws59WYV86zpsX1I15NzWMDYuJhYKEnkfM1Piw+cmxazSritaUt71fi7BrdCV+y1aR8CO
         GcZRyniEShHH9Nbm05ngwCMJPFY4xo6KWULqTbjfmPXMYY1jU6oRLdL3YJHooNUqiKak
         3FP8arXwWYNZZkRFQ7hrfhUXkhfgReVG0MHbwUxh10wYBHd5Ug0WMh8VzuoeEA4xpi/n
         zNlZJvNxgy/ab7VmB/iY6dEm372+eVXzH57KI0y2+7IlN1rOoGzvgouuxFKDtit2Z6fW
         ylXA==
X-Forwarded-Encrypted: i=1; AJvYcCUgM6ziaLiOhLBf9rN9Xpd4vAKn1qUW8m+9tu1ksCgfr9ubl6Dtwrw8knrlU06UYXKxyTETZDwfZEcwxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziA0DPX8ofqV7hYk1KOxnAq+CWN7FuFb0uDhNfv0Kgc3SMSmoV
	NU1ATOvUaHwMSEimdvpRALWc+zlWjG8145mhMjqv9Ro4PJ5cFZvAMjJk5Zzm/aylzKIzwljmA3f
	XqE1FZrNYDHwhaq68L8WVoBPs5DJyNjYRu3yCeA==
X-Gm-Gg: ASbGncurXsJZib+bLD+5MGgT3ozdphAvOyp3yh6ck8kF8KXcOMVPjiX8K/R/vzD2ds/
	OLxamPGZ/hrKh8MmkM4QJhm1ph9hxesenDBUWBZ65cfPyg+W/vZziOvGMNYYozXoVJ9gvMNG8Dp
	2BBps4LTFcrVm5f/mWH77mZ+MnSPpM
X-Google-Smtp-Source: AGHT+IHhVdalfJg/Z7eY6UsCfbBA0DkGD01gM9P/N23DqqMhnu+Yb+G3qK68lvaA0KDDPK6sloLhNYPOVe1kjlQCo1M=
X-Received: by 2002:a05:6602:4009:b0:85e:201e:3e35 with SMTP id
 ca18e2360f4ac-8611c2a4dc8mr1200799239f.3.1744001446586; Sun, 06 Apr 2025
 21:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com> <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 7 Apr 2025 12:50:35 +0800
X-Gm-Features: ATxdqUEcEvSvDd4YNmxt5x00v_2QFe_U7ZYW7BCOZdpLL6G50qHXNh2VbNcPJLM
Message-ID: <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack() syscall
To: Deepak Gupta <debug@rivosinc.com>
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
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_215048_106666_D4ECBAC7 
X-CRM114-Status: GOOD (  34.18  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgNTozOeKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEFzIGRpc2N1c3NlZCBleHRlbnNpdmVseSBpbiB0aGUgY2hh
bmdlbG9nIGZvciB0aGUgYWRkaXRpb24gb2YgdGhpcwo+IHN5c2NhbGwgb24geDg2ICgieDg2L3No
c3RrOiBJbnRyb2R1Y2UgbWFwX3NoYWRvd19zdGFjayBzeXNjYWxsIikgdGhlCj4gZXhpc3Rpbmcg
bW1hcCgpIGFuZCBtYWR2aXNlKCkgc3lzY2FsbHMgZG8gbm90IG1hcCBlbnRpcmVseSB3ZWxsIG9u
dG8gdGhlCj4gc2VjdXJpdHkgcmVxdWlyZW1lbnRzIGZvciBzaGFkb3cgc3RhY2sgbWVtb3J5IHNp
bmNlIHRoZXkgbGVhZCB0byB3aW5kb3dzCj4gd2hlcmUgbWVtb3J5IGlzIGFsbG9jYXRlZCBidXQg
bm90IHlldCBwcm90ZWN0ZWQgb3Igc3RhY2tzIHdoaWNoIGFyZSBub3QKPiBwcm9wZXJseSBhbmQg
c2FmZWx5IGluaXRpYWxpc2VkLiBJbnN0ZWFkIGEgbmV3IHN5c2NhbGwgbWFwX3NoYWRvd19zdGFj
aygpCj4gaGFzIGJlZW4gZGVmaW5lZCB3aGljaCBhbGxvY2F0ZXMgYW5kIGluaXRpYWxpc2VzIGEg
c2hhZG93IHN0YWNrIHBhZ2UuCj4KPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgdGhpcyBzeXNjYWxs
IGZvciByaXNjdi4gcmlzY3YgZG9lc24ndCByZXF1aXJlIHRva2VuCj4gdG8gYmUgc2V0dXAgYnkg
a2VybmVsIGJlY2F1c2UgdXNlciBtb2RlIGNhbiBkbyB0aGF0IGJ5IGl0c2VsZi4gSG93ZXZlciB0
bwo+IHByb3ZpZGUgY29tcGF0aWJpbGl0eSBhbmQgcG9ydGFiaWxpdHkgd2l0aCBvdGhlciBhcmNo
aXRlY3R1ZXMsIHVzZXIgbW9kZQo+IGNhbiBzcGVjaWZ5IHRva2VuIHNldCBmbGFnLgo+Cj4gUmV2
aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBE
ZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvTWFrZWZpbGUgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jIHwgMTQ0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggOGQxODZi
ZmNlZDQ1Li4zYTg2MWQzMjA2NTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFr
ZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC0xMjUsMyArMTI1
LDQgQEAgb2JqLSQoQ09ORklHX0FDUEkpICAgICAgICAgICs9IGFjcGkubwo+ICBvYmotJChDT05G
SUdfQUNQSV9OVU1BKSAgICAgICAgKz0gYWNwaV9udW1hLm8KPgo+ICBvYmotJChDT05GSUdfR0VO
RVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTKSArPSBidWdzLm8KPiArb2JqLSQoQ09ORklHX1JJU0NW
X1VTRVJfQ0ZJKSArPSB1c2VyY2ZpLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dXNlcmNmaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI0MDIyODA5YTdiNQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMKPiBAQCAtMCwwICsxLDE0NCBAQAo+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsgKiBDb3B5cmln
aHQgKEMpIDIwMjQgUml2b3MsIEluYy4KPiArICogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9iaXRvcHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9tbS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW1hbi5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvdWFjY2Vzcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3VzZXIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9wcmN0bC5oPgo+ICsjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICsjaW5jbHVkZSA8YXNtL3Vz
ZXJjZmkuaD4KPiArCj4gKyNkZWZpbmUgU0hTVEtfRU5UUllfU0laRSBzaXplb2Yodm9pZCAqKQo+
ICsKPiArLyoKPiArICogV3JpdGVzIG9uIHNoYWRvdyBzdGFjayBjYW4gZWl0aGVyIGJlIGBzc3B1
c2hgIG9yIGBzc2Ftb3N3YXBgLiBgc3NwdXNoYCBjYW4gaGFwcGVuCj4gKyAqIGltcGxpY2l0bHkg
b24gY3VycmVudCBzaGFkb3cgc3RhY2sgcG9pbnRlZCB0byBieSBDU1JfU1NQLiBgc3NhbW9zd2Fw
YCB0YWtlcyBwb2ludGVyIHRvCj4gKyAqIHNoYWRvdyBzdGFjay4gVG8ga2VlcCBpdCBzaW1wbGUs
IHdlIHBsYW4gdG8gdXNlIGBzc2Ftb3N3YXBgIHRvIHBlcmZvcm0gd3JpdGVzIG9uIHNoYWRvdwo+
ICsgKiBzdGFjay4KPiArICovCj4gK3N0YXRpYyBub2lubGluZSB1bnNpZ25lZCBsb25nIGFtb191
c2VyX3Noc3RrKHVuc2lnbmVkIGxvbmcgKmFkZHIsIHVuc2lnbmVkIGxvbmcgdmFsKQo+ICt7Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogTmV2ZXIgZXhwZWN0IC0xIG9uIHNoYWRvdyBzdGFjay4g
RXhwZWN0IHJldHVybiBhZGRyZXNzZXMgYW5kIHplcm8KPiArICAgICAgICAqLwo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBzd2FwID0gLTE7Cj4gKwo+ICsgICAgICAgX19lbmFibGVfdXNlcl9hY2Nl
c3MoKTsKPiArICAgICAgIGFzbSBnb3RvKAo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwdXNo
XG4iCj4gKyAgICAgICAgICAgICAgICIub3B0aW9uIGFyY2gsICt6aWNmaXNzXG4iCj4gKyAgICAg
ICAgICAgICAgICIxOiBzc2Ftb3N3YXAuZCAlW3N3YXBdLCAlW3ZhbF0sICVbYWRkcl1cbiIKCkhp
IERlZXBhaywKSXQganVzdCBjYW1lIHRvIG15IG1pbmQsIGRvIHdlIG5lZWQgdG8gZW5zdXJlIHRo
YXQgbWVudmNmZy5TU0UgaXMgbm90Cnplcm8gYmVmb3JlIGV4ZWN1dGluZyB0aGUgc3NhbW9zd2Fw
IGluc3RydWN0aW9uPyBTaW5jZSBzc2Ftb3N3YXAgaXMKbm90IGVuY29kZWQgdXNpbmcgTU9QLCBJ
4oCZbSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIG1ha2Ugc3VyZSB0aGF0CmV4ZWN1dGluZyBzc2Ft
b3N3YXAgd29u4oCZdCBhY2NpZGVudGFsbHkgdHJpZ2dlciBhbiBpbGxlZ2FsIGluc3RydWN0aW9u
CmV4Y2VwdGlvbi4gVGhhbmtzLgoKPiArICAgICAgICAgICAgICAgX0FTTV9FWFRBQkxFKDFiLCAl
bFtmYXVsdF0pCj4gKyAgICAgICAgICAgICAgIFJJU0NWX0FDUVVJUkVfQkFSUklFUgo+ICsgICAg
ICAgICAgICAgICAiLm9wdGlvbiBwb3BcbiIKPiArICAgICAgICAgICAgICAgOiBbc3dhcF0gIj1y
IiAoc3dhcCksIFthZGRyXSAiK0EiICgqYWRkcikKPiArICAgICAgICAgICAgICAgOiBbdmFsXSAi
ciIgKHZhbCkKPiArICAgICAgICAgICAgICAgOiAibWVtb3J5Igo+ICsgICAgICAgICAgICAgICA6
IGZhdWx0Cj4gKyAgICAgICAgICAgICAgICk7Cj4gKyAgICAgICBfX2Rpc2FibGVfdXNlcl9hY2Nl
c3MoKTsKPiArICAgICAgIHJldHVybiBzd2FwOwo+ICtmYXVsdDoKPiArICAgICAgIF9fZGlzYWJs
ZV91c2VyX2FjY2VzcygpOwo+ICsgICAgICAgcmV0dXJuIC0xOwo+ICt9Cj4gKwo+ICsvKgo+ICsg
KiBDcmVhdGUgYSByZXN0b3JlIHRva2VuIG9uIHRoZSBzaGFkb3cgc3RhY2suICBBIHRva2VuIGlz
IGFsd2F5cyBYTEVOIHdpZGUKPiArICogYW5kIGFsaWduZWQgdG8gWExFTi4KPiArICovCj4gK3N0
YXRpYyBpbnQgY3JlYXRlX3JzdG9yX3Rva2VuKHVuc2lnbmVkIGxvbmcgc3NwLCB1bnNpZ25lZCBs
b25nICp0b2tlbl9hZGRyKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7Cj4gKwo+
ICsgICAgICAgLyogVG9rZW4gbXVzdCBiZSBhbGlnbmVkICovCj4gKyAgICAgICBpZiAoIUlTX0FM
SUdORUQoc3NwLCBTSFNUS19FTlRSWV9TSVpFKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gKwo+ICsgICAgICAgLyogT24gUklTQy1WIHdlJ3JlIGNvbnN0cnVjdGluZyB0b2tl
biB0byBiZSBmdW5jdGlvbiBvZiBhZGRyZXNzIGl0c2VsZiAqLwo+ICsgICAgICAgYWRkciA9IHNz
cCAtIFNIU1RLX0VOVFJZX1NJWkU7Cj4gKwo+ICsgICAgICAgaWYgKGFtb191c2VyX3Noc3RrKCh1
bnNpZ25lZCBsb25nIF9fdXNlciAqKWFkZHIsICh1bnNpZ25lZCBsb25nKXNzcCkgPT0gLTEpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsKPiArICAgICAgIGlmICh0b2tlbl9h
ZGRyKQo+ICsgICAgICAgICAgICAgICAqdG9rZW5fYWRkciA9IGFkZHI7Cj4gKwo+ICsgICAgICAg
cmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGFsbG9jYXRlX3NoYWRv
d19zdGFjayh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0b2tlbl9v
ZmZzZXQsIGJvb2wgc2V0X3RvaykKPiArewo+ICsgICAgICAgaW50IGZsYWdzID0gTUFQX0FOT05Z
TU9VUyB8IE1BUF9QUklWQVRFOwo+ICsgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJy
ZW50LT5tbTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgcG9wdWxhdGUsIHRva19sb2MgPSAwOwo+
ICsKPiArICAgICAgIGlmIChhZGRyKQo+ICsgICAgICAgICAgICAgICBmbGFncyB8PSBNQVBfRklY
RURfTk9SRVBMQUNFOwo+ICsKPiArICAgICAgIG1tYXBfd3JpdGVfbG9jayhtbSk7Cj4gKyAgICAg
ICBhZGRyID0gZG9fbW1hcChOVUxMLCBhZGRyLCBzaXplLCBQUk9UX1JFQUQsIGZsYWdzLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgVk1fU0hBRE9XX1NUQUNLIHwgVk1fV1JJVEUsIDAsICZwb3B1
bGF0ZSwgTlVMTCk7Cj4gKyAgICAgICBtbWFwX3dyaXRlX3VubG9jayhtbSk7Cj4gKwo+ICsgICAg
ICAgaWYgKCFzZXRfdG9rIHx8IElTX0VSUl9WQUxVRShhZGRyKSkKPiArICAgICAgICAgICAgICAg
Z290byBvdXQ7Cj4gKwo+ICsgICAgICAgaWYgKGNyZWF0ZV9yc3Rvcl90b2tlbihhZGRyICsgdG9r
ZW5fb2Zmc2V0LCAmdG9rX2xvYykpIHsKPiArICAgICAgICAgICAgICAgdm1fbXVubWFwKGFkZHIs
IHNpemUpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIH0KPiAr
Cj4gKyAgICAgICBhZGRyID0gdG9rX2xvYzsKPiArCj4gK291dDoKPiArICAgICAgIHJldHVybiBh
ZGRyOwo+ICt9Cj4gKwo+ICtTWVNDQUxMX0RFRklORTMobWFwX3NoYWRvd19zdGFjaywgdW5zaWdu
ZWQgbG9uZywgYWRkciwgdW5zaWduZWQgbG9uZywgc2l6ZSwgdW5zaWduZWQgaW50LCBmbGFncykK
PiArewo+ICsgICAgICAgYm9vbCBzZXRfdG9rID0gZmxhZ3MgJiBTSEFET1dfU1RBQ0tfU0VUX1RP
S0VOOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbmVkX3NpemUgPSAwOwo+ICsKPiArICAg
ICAgIGlmICghY3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjaygpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICsgICAgICAgLyogQW55dGhpbmcgb3RoZXIgdGhhbiBz
ZXQgdG9rZW4gc2hvdWxkIHJlc3VsdCBpbiBpbnZhbGlkIHBhcmFtICovCj4gKyAgICAgICBpZiAo
ZmxhZ3MgJiB+U0hBRE9XX1NUQUNLX1NFVF9UT0tFTikKPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFVubGlrZSBvdGhlciBhcmNo
aXRlY3R1cmVzLCBvbiBSSVNDLVYsIFNTUCBwb2ludGVyIGlzIGhlbGQgaW4gQ1NSX1NTUCBhbmQg
aXMgYXZhaWxhYmxlCj4gKyAgICAgICAgKiBDU1IgaW4gYWxsIG1vZGVzLiBDU1IgYWNjZXNzZXMg
YXJlIHBlcmZvcm1lZCB1c2luZyAxMmJpdCBpbmRleCBwcm9ncmFtbWVkIGluIGluc3RydWN0aW9u
Cj4gKyAgICAgICAgKiBpdHNlbGYuIFRoaXMgcHJvdmlkZXMgc3RhdGljIHByb3BlcnR5IG9uIHJl
Z2lzdGVyIHByb2dyYW1taW5nIGFuZCB3cml0ZXMgdG8gQ1NSIGNhbid0Cj4gKyAgICAgICAgKiBi
ZSB1bmludGVudGlvbmFsIGZyb20gcHJvZ3JhbW1lcidzIHBlcnNwZWN0aXZlLiBBcyBsb25nIGFz
IHByb2dyYW1tZXIgaGFzIGd1YXJkZWQgYXJlYXMKPiArICAgICAgICAqIHdoaWNoIHBlcmZvcm0g
d3JpdGVzIHRvIENTUl9TU1AgcHJvcGVybHksIHNoYWRvdyBzdGFjayBwaXZvdGluZyBpcyBub3Qg
cG9zc2libGUuIFNpbmNlCj4gKyAgICAgICAgKiBDU1JfU1NQIGlzIHdyaXRlYWJsZSBieSB1c2Vy
IG1vZGUsIGl0IGl0c2VsZiBjYW4gc2V0dXAgYSBzaGFkb3cgc3RhY2sgdG9rZW4gc3Vic2VxdWVu
dAo+ICsgICAgICAgICogdG8gYWxsb2NhdGlvbi4gQWx0aG91Z2ggaW4gb3JkZXIgdG8gcHJvdmlk
ZSBwb3J0YWJsaXR5IHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlIChiZWNhdXNlCj4gKyAgICAgICAg
KiBgbWFwX3NoYWRvd19zdGFja2AgaXMgYXJjaCBhZ25vc3RpYyBzeXNjYWxsKSwgUklTQy1WIHdp
bGwgZm9sbG93IGV4cGVjdGF0aW9uIG9mIGEgdG9rZW4KPiArICAgICAgICAqIGZsYWcgaW4gZmxh
Z3MgYW5kIGlmIHByb3ZpZGVkIGluIGZsYWdzLCBzZXR1cCBhIHRva2VuIGF0IHRoZSBiYXNlLgo+
ICsgICAgICAgICovCj4gKwo+ICsgICAgICAgLyogSWYgdGhlcmUgaXNuJ3Qgc3BhY2UgZm9yIGEg
dG9rZW4gKi8KPiArICAgICAgIGlmIChzZXRfdG9rICYmIHNpemUgPCBTSFNUS19FTlRSWV9TSVpF
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsKPiArCj4gKyAgICAgICBpZiAoYWRk
ciAmJiAoYWRkciAmIChQQUdFX1NJWkUgLSAxKSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ICsKPiArICAgICAgIGFsaWduZWRfc2l6ZSA9IFBBR0VfQUxJR04oc2l6ZSk7Cj4g
KyAgICAgICBpZiAoYWxpZ25lZF9zaXplIDwgc2l6ZSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FT1ZFUkZMT1c7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGFsbG9jYXRlX3NoYWRvd19zdGFjayhh
ZGRyLCBhbGlnbmVkX3NpemUsIHNpemUsIHNldF90b2spOwo+ICt9Cj4KPiAtLQo+IDIuMzQuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
