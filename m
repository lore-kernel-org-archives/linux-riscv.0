Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B34C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4W/DMauT+iFavfbQUoQBz3y1jKHygUrxQMdCsG6tnds=; b=00ThjxjY1wKWKh
	BpoSsz6zXhJuEhSMFDr+2RMTBZNBNyrnC/r640nqI2LzuNqMt1alCwCUaWALupOAF5xx6ny+vI/WL
	Ra3OD9AqThNXwb5CrMAgYNyyXC/nf0aC2esTX9EHkl3VhEWMBM2vymjL70Iy1DAVWyGTDe6eu6//d
	GLGnuCGcN9EjUw2aMHAH19XgnoJsWr94pPDuBXf63PG3qlxwpGJuHqbmIt9ue8oCdMeYpK/X0OtT0
	YlLbRYBSZkX7LeuBVew0pO5PK6ML1eKrLdTjFEEnYNcL7n4E7IFwtqy2LF9c0xbqeJCDPnyAf/KwR
	WHtw6ODTMroq5P3ttSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lM-0000000DXPo-0gf0;
	Fri, 14 Mar 2025 08:51:28 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0U9-0000000DUba-0R4o
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:33:42 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so45598439f.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941220; x=1742546020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3jAuDyoIpEjI6tmCAFMHNvaGApFy5lgmMv+wfDZUXs=;
        b=ObracrmN7WehVU5TnadByPnCK5OHg81Pl08gwPWUNs5bP+KpPMOZn6HneQs46JZHzt
         cvtvuXiK+X+A82tpE1lsaVoObLIDyWwItoMbnWVIzaIypkvQT0gRLP7HwaNN4v/Nhh+7
         vQTpcmSEVSammz0R8YByFTcZp+XsRNGjtvU+X05nNI7NyOCN504+bf8iQrmli6W619us
         3LcOxy5RkWQf2Dl0vmcAlK4JKCB6dszZIK2aq2P+VFggW5G78BuqJWtdbi7BFaj19Wpy
         Xsx6HbDDSD9X53PChWOq68r4pfzLkmgYwslME8KULmqvdAFDPjShkaxs4nlI8ld3WKgz
         /KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941220; x=1742546020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3jAuDyoIpEjI6tmCAFMHNvaGApFy5lgmMv+wfDZUXs=;
        b=CBg6tQSn9uWIKljUAULYf6eyLfnwzqB6nsFXan4jrMQ5ZSy8R2W4s+E//Yc+6lKyVr
         IW0i7sP76+Fodo7WnZaNGMwG+PqRxAQ4Tgpt4x6o2vcZhwF9FGk7M75TqH+FWFUVn03v
         fsQpQrKV6h638/uPV73AcfGOK5x8SOaEEoxrPenz3d9SD2gC6n8tqf04Lmejw0yazQvD
         hxuH8wgA1RKuESY0lQxkWk/khrxNHX2foDn2yOkyJ4njdIfgwLMkJzlz4++Wb0fkheVd
         ojMfMKhGa97dTPZLtDI/zWV9c9zh2m7qSD4fxD5Ti318V/IDBPnApKiTjkpr1s6RdmnR
         Nrcw==
X-Forwarded-Encrypted: i=1; AJvYcCW88MieWPgMIMWHcolfR0xC92hPoWLgMroYDwRach4nl0IPs15TK0I91POC12/MH88L2fqZv31Z5rzg3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMyZWnJwcBCPXeZryugyQw/9s9h5KXvRmmDoxSkX6n56IjwGMS
	SuZVrz//xzvBhfevPrdlgZq2WMLJlnbnEzFOi6OgBd180XE0v7Qk5LH1Ttc4Wt0K0yzFFCsLUZ+
	Y7COaiRyHeY0I6OtnpwFJ7KdoPvmqtKkuLg2SGg==
X-Gm-Gg: ASbGncvCd5LfkgR2bj96fqKwtwiJe9GHDpHAgWKoIBlcBNt4Cj9HS7XwBoIp3ZWaOcz
	M1Pcxsi7GwyGfLhcoZ6/P5Udq0eBUHGkPEaeovsW6COsKg5XiSxRsGpxvPcCTBE/JIu3VZaoEIs
	rpj1WLmMWAKN+FCNT6wMd5nBFXtWQ=
X-Google-Smtp-Source: AGHT+IH3RGw0jAf3q6yyU3iBbuO4gdAuJlF6nM/gQmt2SaEbu2yJTY3PhHfv/TRxHNt2wY+YZrVn7xw2NK+5svg0PTM=
X-Received: by 2002:a05:6602:3983:b0:85d:b054:6eb9 with SMTP id
 ca18e2360f4ac-85dc48c650bmr200895439f.14.1741941220156; Fri, 14 Mar 2025
 01:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-24-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-24-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:33:28 +0800
X-Gm-Features: AQ5f1Jq9VtRi-a7yZrBf9Dkd8SyU6WoszDfJNK4kl56yJIBZAJsMP2Zbo_BuGRQ
Message-ID: <CANXhq0p3UKhL-+Qo5UouwCV0rWpanM7rcnJjLHXhn9jL-MJLgA@mail.gmail.com>
Subject: Re: [PATCH v11 24/27] riscv: create a config for shadow stack and
 landing pad instr support
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
X-CRM114-CacheID: sfid-20250314_013341_141073_139D5AAD 
X-CRM114-Status: GOOD (  20.13  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDTigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGNyZWF0ZXMgYSBjb25maWcgZm9yIHNo
YWRvdyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5nIHBhZCBpbnN0cgo+IHN1cHBvcnQuIFNoYWRv
dyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5nIGluc3RyIHN1cHBvcnQgY2FuIGJlIGVuYWJsZWQg
YnkKPiBzZWxlY3RpbmcgYENPTkZJR19SSVNDVl9VU0VSX0NGSWAuIFNlbGVjdGluZyBgQ09ORklH
X1JJU0NWX1VTRVJfQ0ZJYCB3aXJlcwo+IHVwIHBhdGggdG8gZW51bWVyYXRlIENQVSBzdXBwb3J0
IGFuZCBpZiBjcHUgc3VwcG9ydCBleGlzdHMsIGtlcm5lbCB3aWxsCj4gc3VwcG9ydCBjcHUgYXNz
aXN0ZWQgdXNlciBtb2RlIGNmaS4KPgo+IElmIENPTkZJR19SSVNDVl9VU0VSX0NGSSBpcyBzZWxl
Y3RlZCwgc2VsZWN0IGBBUkNIX1VTRVNfSElHSF9WTUFfRkxBR1NgLAo+IGBBUkNIX0hBU19VU0VS
X1NIQURPV19TVEFDS2AgYW5kIERZTkFNSUNfU0lHRlJBTUUgZm9yIHJpc2N2Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3YvS2NvbmZpZyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNzYxMmM1MmU5YjFlLi4wYTJlNTBmMDU2ZTggMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4gQEAgLTI1MCw2ICsyNTAsMjYgQEAgY29uZmlnIEFSQ0hfSEFTX0JST0tFTl9EV0FSRjUKPiAg
ICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC83ZmZh
YmI2MWE1NTY5NDQ0YjVhYzkzMjJlMjJlNTQ3MWNjNWU0YTc3Cj4gICAgICAgICBkZXBlbmRzIG9u
IExEX0lTX0xMRCAmJiBMTERfVkVSU0lPTiA8IDE4MDAwMAo+Cj4gK2NvbmZpZyBSSVNDVl9VU0VS
X0NGSQo+ICsgICAgICAgZGVmX2Jvb2wgeQo+ICsgICAgICAgYm9vbCAicmlzY3YgdXNlcnNwYWNl
IGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkiCj4gKyAgICAgICBkZXBlbmRzIG9uIDY0QklUICYmICQo
Y2Mtb3B0aW9uLC1tYWJpPWxwNjQgLW1hcmNoPXJ2NjRpbWFfemljZmlzcykKPiArICAgICAgIGRl
cGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPiArICAgICAgIHNlbGVjdCBBUkNIX0hBU19VU0VS
X1NIQURPV19TVEFDSwo+ICsgICAgICAgc2VsZWN0IEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFHUwo+
ICsgICAgICAgc2VsZWN0IERZTkFNSUNfU0lHRlJBTUUKPiArICAgICAgIGhlbHAKPiArICAgICAg
ICAgUHJvdmlkZXMgQ1BVIGFzc2lzdGVkIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgdG8gdXNlcnNw
YWNlIHRhc2tzLgo+ICsgICAgICAgICBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHByb3ZpZGVk
IGJ5IGltcGxlbWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4gKyAgICAgICAgIGJhY2t3YXJkIGVk
Z2UgYW5kIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBmb3IgZm9yd2FyZCBlZGdlIGluIHByb2dy
YW0uCj4gKyAgICAgICAgIFNoYWRvdyBzdGFjayBwcm90ZWN0aW9uIGlzIGEgaGFyZHdhcmUgZmVh
dHVyZSB0aGF0IGRldGVjdHMgZnVuY3Rpb24KPiArICAgICAgICAgcmV0dXJuIGFkZHJlc3MgY29y
cnVwdGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPiArICAgICAgICAgSW5k
aXJlY3QgYnJhbmNoIHRyYWNraW5nIGVuZm9yY2VzIHRoYXQgYWxsIGluZGlyZWN0IGJyYW5jaGVz
IG11c3QgbGFuZAo+ICsgICAgICAgICBvbiBhIGxhbmRpbmcgcGFkIGluc3RydWN0aW9uIGVsc2Ug
Q1BVIHdpbGwgZmF1bHQuIFRoaXMgbWl0aWdhdGVzIGFnYWluc3QKPiArICAgICAgICAgSk9QIC8g
Q09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIGl0LCBhbmQg
b2xkIHVzZXItCj4gKyAgICAgICAgIHNwYWNlIGRvZXMgbm90IGdldCBwcm90ZWN0aW9uICJmb3Ig
ZnJlZSIuCj4gKyAgICAgICAgIGRlZmF1bHQgeQo+ICsKPiAgY29uZmlnIEFSQ0hfTU1BUF9STkRf
QklUU19NSU4KPiAgICAgICAgIGRlZmF1bHQgMTggaWYgNjRCSVQKPiAgICAgICAgIGRlZmF1bHQg
OAo+CkxHVE0uCgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+IC0t
Cj4gMi4zNC4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
