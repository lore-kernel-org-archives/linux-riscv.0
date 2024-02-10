Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A592DC4829A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/27tV6AZ5jagnx6P8RPTh2Aoxje/EQj7Cc1GXhKmfvI=; b=UYiHIbnxcNKKu7
	3WVdwAl7NvCd+UzOtXJfWvRD4BdWQQ1Beeg5CNYh91bG2h8MySpotuQpvTHqlpzjJjMFNWqWqqt8F
	i/scJRI7MY/RD9bLrJ9Nnucr/saug5wIaenruijUz0vG+5hRGC4//zk7pWwkNEhKYe0MKNPd8i+lk
	zfvTE3j0Urkz7JnEt72nLqydIOKklvuw0DxmcH5N+JsvtJxGwzC/dOjDsVp2tdJms0CPYp8pMdMSE
	Nml6QmBx+0cZiG7Oq0L9Er2IxBB/cbVFLPPpUp/WvA0gYoCZISh9jF+Z0g2f2fzzHa2S0K2QOTMNy
	BHx9K+pNgVdutkbQ9czw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYiUD-00000001PxH-31VE;
	Sat, 10 Feb 2024 08:13:21 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYiUA-00000001Pws-17zQ
	for linux-riscv@lists.infradead.org;
	Sat, 10 Feb 2024 08:13:20 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2365898276.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Feb 2024 00:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707552797; x=1708157597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=L3oZGSf2BK//tb5fOmRyHQ9GtLsd/AHILrPflBoQE+/tpWwzMhJkv78dH6lJfbR5tN
         e3mBppFHbuObm37RBlyp3CkCXIbwfYp0UqrAm/omHS7UEoULD1lQ89abuccqL5v4tLY7
         OXD0AzEh/BU7y2TDfjcGqjqyqdo073QHdN6wOM1HFHJVGJisFHEIoyeDOGrZoFCcmWQK
         IJ7j/DMwMqk+5Ft4WpD74471vi4QJxU6xEyuOzUGtgZc31uoAnlyEbIwTUqFy6m8+Wxm
         lcOFXuQQs+QvWPYKZm8+f+YUzgDXVXwLYlCXtX89HokUx68geylpPvdVIPann+F4UNCX
         8J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707552797; x=1708157597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=s3/QtJ8vTQhYbUXE0SYBH+iuj0vhvyytQX0edBM/p+Qtd728qjHw0YVy/HY6X7/B1N
         jin+SL7cR5rBVuYs6hRhMeEdj+WaKmuW0CN1CB3/ZLXJQe/zOKA+gR0xQL4hxOaC3CRL
         S5xcp4uQtng3GFTn3sqzS1uTlUrUAXFwS0JpmNyqOxeIKqiigzUKdQ0ix/RPMWshYJPh
         FEgeozNFIdOkUBzm21jXhxWrcoRuodL53M67FsZ5iz84mi8AP+qYJVUCxRV9Bq+9Enuj
         nL0eBmJ59Jp1ZZTWSy3uMmN7r4IOG+PzW8dHK52sxB4vK06jiMPLSY0cTppUvDYVnA85
         UFlA==
X-Gm-Message-State: AOJu0Yyj37cXYamxqolp9uEF6ZDz8pOKgcYI7oEZMbT+ZI2UU3MUObDd
	FyFQhfT+QgzJ+4aPQ2c3caNlqIbzWiCKQqCWzG+4T6nrxNvbfhJm9SJidrpWfo6tlKobnvGMDZ7
	LW1IFXZZ9jQ159u7fP9dGVrWm5THovLW2S5KInQ==
X-Google-Smtp-Source: AGHT+IF4tUvf6ttwQdM3xfeC1VlLijJBFO5NkKyzXeExzVFNvP7Fl5D8PP7Tfno5g/OaAlhCpe9aPfGgUUtsjZouSLw=
X-Received: by 2002:a25:7c02:0:b0:dc2:201a:7f1a with SMTP id
 x2-20020a257c02000000b00dc2201a7f1amr2506701ybc.30.1707552796867; Sat, 10 Feb
 2024 00:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud>
In-Reply-To: <20240209-rage-keg-1b2982cd17d9@spud>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 10 Feb 2024 02:13:06 -0600
Message-ID: <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_001318_395136_E43E5B99 
X-CRM114-Status: GOOD (  17.81  )
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

T24gRnJpLCBGZWIgOSwgMjAyNCBhdCA5OjE44oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI3LCAyMDI0IGF0IDAyOjQ2OjM4UE0gKzAx
MDAsIE1pZ3VlbCBPamVkYSB3cm90ZToKPiA+IE9uIEZyaSwgSmFuIDI2LCAyMDI0IGF0IDExOjAx
4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
SXMgdGhhdCBldmVuIG5lZWRlZD8gV2UgYWxyZWFkeSBoYXZlIEFSQ0hfU1VQUE9SVFNfQ0ZJX0NM
QU5HIGFuZCBBRkFJVQo+ID4gPiBydXN0IHN1cHBvcnRzIGl0IGlmIGNsYW5nIGRvZXMsIHNvIGEg
c2Vjb25kIG9wdGlvbiBpcyBzdXBlcmZsdW91cz8KPiA+Cj4gPiBGcm9tIGEgcXVpY2sgbG9vaywg
SSBkb24ndCBzZWUgaXQgZW5hYmxlZCBpbiBhbnkgUklTQy1WIGJ1aWx0LWluCj4gPiB0YXJnZXQg
aW4gYHJ1c3RjYCB5ZXQuCj4gPgo+ID4gSXQgbWF5IGFsc28gc3RpbGwgYmUgdGhlIGNhc2UgdGhh
dCBLQ0ZJIG5lZWRzIHNvbWUgdHdlYWtzIGZvciwgc2F5LAo+ID4gUklTQy1WLCBiZWZvcmUgdGhl
IGZsYWcgYWN0dWFsbHkgd29ya3MsIGkuZS4gd2UgY291bGRuJ3QganVzdCB0ZXN0IHRoZQo+ID4g
ZmxhZyBpbiB0aGF0IGNhc2UgLS0gUmFtb246IGhvdyBsaWtlbHkgaXMgaXQgdGhhdCBSSVNDLVYg
d291bGQgd29yayBpZgo+ID4gS0NGSSB3b3JrcyBmb3IgYWFyY2g2NCBhbmQgeDg2XzY0Pwo+Cj4g
V2VsbCwgdGhlcmUncyBiZWVuIG5vIHJlcGx5IGhlcmUuIEknbGwgZG8gc2EgeW91IHN1Z2dlc3Rl
ZCBhbmQgYWRkIGEKPiBkZXBlbmRzIG9uICFDRklfQ0xBTkcgdG8gUlVTVC4KPgo+IENoZWVycywK
PiBDb25vci4KPgoKSSBhc2tlZCBvbiBadWxpcCBhbmQgaXQgc291bmRzIGxpa2UgUmFtb24gbWF5
IGJlIG91dCBbMV0uIEl0Cl9wcm9iYWJseV8gd29ya3MsIGJ1dCBnb2luZyB3aXRoIGEgZGVwZW5k
ZW5jeSB0byBub3QgYmUgYmxvY2tlZCBvbgpLQ0ZJIGlzIHByb2JhYmx5IHJlYXNvbmFibGUgZm9y
IG5vdy4KCi0gVHJldm9yCgpbMV06IGh0dHBzOi8vcnVzdC1sYW5nLnp1bGlwY2hhdC5jb20vI25h
cnJvdy9zdHJlYW0vMzQzMTE5LXByb2plY3QtZXhwbG9pdC1taXRpZ2F0aW9ucy90b3BpYy9LQ0ZJ
LjIwb24uMjBSSVNDLVYuMjBxdWVzdGlvbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
