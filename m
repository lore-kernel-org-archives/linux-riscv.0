Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD7CCCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ2fdO90b7x0nW6ov70oDV1Fk6q09vK+cBNDre/EOKA=; b=adV9+AdPaFPu+rfbSTQ4PXJo3X
	e70YnK2wbi9ios4PJ0o/DzfxnGnjqta4MoHR3n1AXFVqn4f7z3vmMuPieQvDvB+OzF72KzuxjB+kk
	A6yGi3rUN1a/nP/O4oblqtaGnREZf2W3mSgnLN8HtjRa7UFWE0lG35LsjT6crHOkCzQjcotGAcg6h
	+pBGNS3I51WabZzvHBx15t+JHJ5YxDPCSQctAEoJg98LFN+Yi2nwUARXj0LMfjoRSdT/7+EPNoYz4
	IsTPm2U/0T4a6aqIDHtWId5BxjLFZ312J+G6eLa2Oh0q2T4JSBrObutYfLTcL+bWkAjJLqXLO8tZ1
	so3RCoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt0T-00000007bF2-11HD;
	Tue, 11 Nov 2025 18:22:17 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIt0Q-00000007bEb-1CPh
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 18:22:15 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so26404a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762885333; x=1763490133; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WIB2H6PdyJ1SkmEweEXB/zVmO+ijAnVaHWzNPmEF0uQ=;
        b=KwbJCT0jsJ3L7qDDL391gK4jFSk4zeNC5aDEoZQBRwclUbBoac8kiAr1I567M9lgWl
         Om9aceeWOlK/9XLl/PrQcr5ex56uQFcAijmD08pDoej0YYBkGO4iCdi+IGPYlUHz6b2O
         SxtX9lguhsgHSTqSeXsPnkvdNYDKgV8sGZHKqH7dwV0+EBUO0lG5N0W+YJItXk8TzYvD
         uSjx4Zzn/csmVAQDg0kxp0LLj9FcgFgyJd9BIddFu9Wg5fUyqA+PVUwLUMkMruwva+6x
         LvMUY4eUAspRFtcmktSu/rQSEzCtr+pZTTNtf3yub/mWarVWoZgt/7Ass+sPkmC834ua
         Wcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762885333; x=1763490133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIB2H6PdyJ1SkmEweEXB/zVmO+ijAnVaHWzNPmEF0uQ=;
        b=hA7r86tqXatLmNUN1+A4RIqTOyALgX6kLxSR6X0wSP2R/WhryKajjvjECf7YlYn7xq
         ZvExlh0ySJfNMVnYBsFRmFgpaFMIJxCBkMAEifxjMm8uKZsq9XYDxGn5AeouBY6DVbmN
         6ZhvULG9GKS2C+eKn0L5LcQ7yexKRyj9zPbwMIGTm8KqT0WmBCQbyDUl5Msj/pTB5kPG
         9CbQz/yPjj5YLPwDXH7yV1SKqKzabny0MoOlTcZOhNPrNbtlvSXQSj71SQb8j5giAnqg
         pIa2e6uCgZsD24f6ALFC8cqjwgi48o6Tz+s31tAR/DqJV3Z+80sxhd6cLxhvmLNK50QT
         jNOw==
X-Forwarded-Encrypted: i=1; AJvYcCVha77rrLviE8Lh2JPP0lXAdwwY7IWoWZDrFKbJCU5/uFX4cSJJsm/Mb0D3qEqL9TwC9KYr8nOx0pk/jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRHlCo3Ex58dMUC23C4QEBFJuXuEdliVt4fgu4liyOz+/s0c4m
	CFincr1fsi3sBJYG0QnG69boBOE9gJMsHOgHDqHnREHI9nrxnAIehtY95rg+13Ouabs=
X-Gm-Gg: ASbGnctPUVcb7W8OnYZD+mY4S+yNN5e2N0byFDmpbJoN4NmSfuZSSXoJkC6Kc7eKbPy
	oP8LlRlnjTQ294aSfD4lA6dxH0eJAo3Vgu6FINDIMnrinjGi0/uzia+pG0WJg9E+BaV8wNK7TdO
	MCbgcr1IIsH2YE5vusZWAbwCV5PnC/ph6nCWkD5yQIfLbE55yLF4AwLbOukQ1HZDtqrzxhZvE/1
	mTkhOLQsUrsjVZp38o9hTtFFqqCvx8a3bMtbydHSf19b8mB1XW+UgeWCYCy7n5cNAcl0AJiybkF
	Jfx9wpt2DyjyKmab/a4oG5ABwCCU6cMi1KgXa8YIwiyVz/bzl3lIpn5y70dV39ydmQJx1et81Fj
	wyHCzpRS3EYfsB3hK0ZmP+GVpZZBKfj+OIDbt1bf8q/OVyiAjRAKBYHU1Hph3FXoDlPWBCp5Knd
	vIDOa5Wqr4Zg==
X-Google-Smtp-Source: AGHT+IHgsZ6GDRjZreNqZqXrg+8gWBFkhsOds9i8Gem5eMBAg33B4vZazV1IYc7GtJj2mgzKsVOwwA==
X-Received: by 2002:a17:902:d551:b0:282:2c52:508e with SMTP id d9443c01a7336-2984ed41a29mr3269885ad.8.1762885333020;
        Tue, 11 Nov 2025 10:22:13 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9fc2csm3813175ad.53.2025.11.11.10.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 10:22:12 -0800 (PST)
Date: Tue, 11 Nov 2025 10:22:09 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v22 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <aRN-0Z9MNeJ9IZf2@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
 <CANXhq0oEpCow0G+KsJ6ZPuwsxmAFVqoKGEzygiwSmxFsmntiWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0oEpCow0G+KsJ6ZPuwsxmAFVqoKGEzygiwSmxFsmntiWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_102214_419749_2A00C41F 
X-CRM114-Status: GOOD (  20.82  )
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

T24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgMDE6NTg6MzdQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIEZyaSwgT2N0IDI0LCAyMDI1IGF0IDEyOjUx4oCvQU0gRGVlcGFrIEd1cHRhIHZpYSBCNCBS
ZWxheQo+PGRldm51bGwrZGVidWcucml2b3NpbmMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBGcm9tOiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4KPj4gVGhpcyBwYXRj
aCBjcmVhdGVzIGEgY29uZmlnIGZvciBzaGFkb3cgc3RhY2sgc3VwcG9ydCBhbmQgbGFuZGluZyBw
YWQgaW5zdHIKPj4gc3VwcG9ydC4gU2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgaW5z
dHIgc3VwcG9ydCBjYW4gYmUgZW5hYmxlZCBieQo+PiBzZWxlY3RpbmcgYENPTkZJR19SSVNDVl9V
U0VSX0NGSWAuIFNlbGVjdGluZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYCB3aXJlcwo+PiB1cCBw
YXRoIHRvIGVudW1lcmF0ZSBDUFUgc3VwcG9ydCBhbmQgaWYgY3B1IHN1cHBvcnQgZXhpc3RzLCBr
ZXJuZWwgd2lsbAo+PiBzdXBwb3J0IGNwdSBhc3Npc3RlZCB1c2VyIG1vZGUgY2ZpLgo+Pgo+PiBJ
ZiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgaXMgc2VsZWN0ZWQsIHNlbGVjdCBgQVJDSF9VU0VTX0hJ
R0hfVk1BX0ZMQUdTYCwKPj4gYEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLYCBhbmQgRFlOQU1J
Q19TSUdGUkFNRSBmb3IgcmlzY3YuCj4+Cj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxp
QHNpZml2ZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3Np
bmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmlu
Zy5jb25maWcgfCAgNCArKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+PiBpbmRleCAwYzYwMzhkYzVkZmQuLjRmOWY5MzU4ZTZlMyAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtMTE0Niw2
ICsxMTQ2LDI4IEBAIGNvbmZpZyBSQU5ET01JWkVfQkFTRQo+Pgo+PiAgICAgICAgICAgIElmIHVu
c3VyZSwgc2F5IE4uCj4+Cj4+ICtjb25maWcgUklTQ1ZfVVNFUl9DRkkKPj4gKyAgICAgICBkZWZf
Ym9vbCB5Cj4+ICsgICAgICAgYm9vbCAicmlzY3YgdXNlcnNwYWNlIGNvbnRyb2wgZmxvdyBpbnRl
Z3JpdHkiCj4+ICsgICAgICAgZGVwZW5kcyBvbiA2NEJJVCAmJiAkKGNjLW9wdGlvbiwtbWFiaT1s
cDY0IC1tYXJjaD1ydjY0aW1hX3ppY2Zpc3MpICYmIFwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICQoY2Mtb3B0aW9uLC1mY2YtcHJvdGVjdGlvbj1mdWxsKQo+Cj5IaSBEZWVwYWssCj5J
IG5vdGljZWQgdGhhdCB5b3UgYWRkZWQgYSAkKGNjLW9wdGlvbiwtZmNmLXByb3RlY3Rpb249ZnVs
bCkgY2hlY2sgaW4KPnRoaXMgdmVyc2lvbi4gSSB0aGluayB0aGlzIGNoZWNrIHdpbGwgZmFpbCBi
eSBhIGNjMSB3YXJuaW5nIHdoZW4gdXNpbmcKPmEgbmV3ZXIgdG9vbGNoYWluLCBiZWNhdXNlIC1m
Y2YtcHJvdGVjdGlvbiBjYW5ub3QgYmUgdXNlZCBhbG9uZSwgaXQKPm11c3QgYmUgc3BlY2lmaWVk
IHRvZ2V0aGVyIHdpdGggdGhlIGFwcHJvcHJpYXRlIC1tYXJjaCBvcHRpb24uCj5Gb3IgZXhhbXBs
ZToKPiAgMS4gLWZjZi1wcm90ZWN0aW9uPWJyYW5jaCByZXF1aXJlcyAtbWFyY2g9Li4uX3ppY2Zp
bHAKPiAgMi4gLWZjZi1wcm90ZWN0aW9uPXJldHVybiByZXF1aXJlcyAtbWFyY2g9Li4uX3ppY2Zp
c3MKPiAgMy4gLWZjZi1wcm90ZWN0aW9uPWZ1bGwgcmVxdWlyZXMgLW1hcmNoPS4uLl96aWNmaWxw
X3ppY2Zpc3MKCnRvb2xjaGFpbiB0aGF0IEkgaGF2ZSBmcm9tIEp1bmUgZG9lc24ndCByZXF1aXJl
IC1tYXJjaD0uLi5femljZmlscF96aWNmaXNzCmZvciAtZmNmLXByb3RlY3Rpb249ZnVsbC4gSWYg
dGhhdCBoYXMgY2hhbmdlZCwgSSB0aGluayB0aGlzIHdpbGwgbmVlZCBhCnJldmlzaW9uLgoKPgo+
Cj4+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+PiArICAgICAgIHNlbGVj
dCBSSVNDVl9TQkkKPj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0sK
Pj4gKyAgICAgICBzZWxlY3QgQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdTCj4+ICsgICAgICAgc2Vs
ZWN0IERZTkFNSUNfU0lHRlJBTUUKPj4gKyAgICAgICBoZWxwCj4+ICsgICAgICAgICBQcm92aWRl
cyBDUFUgYXNzaXN0ZWQgY29udHJvbCBmbG93IGludGVncml0eSB0byB1c2Vyc3BhY2UgdGFza3Mu
Cj4+ICsgICAgICAgICBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHByb3ZpZGVkIGJ5IGltcGxl
bWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4+ICsgICAgICAgICBiYWNrd2FyZCBlZGdlIGFuZCBp
bmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgZm9yIGZvcndhcmQgZWRnZSBpbiBwcm9ncmFtLgo+PiAr
ICAgICAgICAgU2hhZG93IHN0YWNrIHByb3RlY3Rpb24gaXMgYSBoYXJkd2FyZSBmZWF0dXJlIHRo
YXQgZGV0ZWN0cyBmdW5jdGlvbgo+PiArICAgICAgICAgcmV0dXJuIGFkZHJlc3MgY29ycnVwdGlv
bi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPj4gKyAgICAgICAgIEluZGlyZWN0
IGJyYW5jaCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFsbCBpbmRpcmVjdCBicmFuY2hlcyBtdXN0
IGxhbmQKPj4gKyAgICAgICAgIG9uIGEgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gZWxzZSBDUFUg
d2lsbCBmYXVsdC4gVGhpcyBtaXRpZ2F0ZXMgYWdhaW5zdAo+PiArICAgICAgICAgSk9QIC8gQ09Q
IGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIGl0LCBhbmQgb2xk
IHVzZXItCj4+ICsgICAgICAgICBzcGFjZSBkb2VzIG5vdCBnZXQgcHJvdGVjdGlvbiAiZm9yIGZy
ZWUiLgo+PiArICAgICAgICAgZGVmYXVsdCB5Lgo+PiArCj4+ICBlbmRtZW51ICMgIktlcm5lbCBm
ZWF0dXJlcyIKPj4KPj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvY29uZmlncy9oYXJkZW5pbmcuY29uZmlnIGIvYXJjaC9yaXNjdi9jb25maWdzL2hhcmRl
bmluZy5jb25maWcKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4wODlmNGNlZTgyZjQKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9hcmNoL3Jpc2N2L2NvbmZp
Z3MvaGFyZGVuaW5nLmNvbmZpZwo+PiBAQCAtMCwwICsxLDQgQEAKPj4gKyMgUklTQ1Ygc3BlY2lm
aWMga2VybmVsIGhhcmRlbmluZyBvcHRpb25zCj4+ICsKPj4gKyMgRW5hYmxlIGNvbnRyb2wgZmxv
dyBpbnRlZ3JpdHkgc3VwcG9ydCBmb3IgdXNlcm1vZGUuCj4+ICtDT05GSUdfUklTQ1ZfVVNFUl9D
Rkk9eQo+Pgo+PiAtLQo+PiAyLjQzLjAKPj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
