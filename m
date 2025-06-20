Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D49C7115A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zDwztAMymyiZKQkPnxgMhdL0b72G46M28AsXbHIcpA=; b=tpKYLFNtNB5AJM
	hW+DzLrm6VSRJ9J29iKOi2B/vC2pD3+0t7gIDioHhcDxS4iV+Rhi82WzClQBpZLqAgI7DWD5GSQNN
	nUHcTVRweCX6aqBIVvUY5q+w1cg27XjzDZ3X45Sb/L99aGRih4IKKxaN+jWv358tpbc+/t/qbWX3j
	2PaagfgtqHL559kwsKdePXZBzS/byoFm26oxiVH6UDCcnWKw73RKKgujb6koQUdce8ToyEOLCNUwb
	lasRhK6mNVEQjIvuUuU7tlhXqLo5coAKISKyGs+BxDM83aqcURATMOnFkLVC0oQsPf+wt/7kzOy5H
	ioh+OBiEHQbX/5njfBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRIq-0000000EZQa-2Mnv;
	Fri, 20 Jun 2025 02:16:28 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSRIo-0000000EZPy-0olx
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 02:16:27 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-875dd57d63bso44209439f.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750385784; x=1750990584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6VzlhRVh//x5/bp+2ihBVL31M01Rg7PAdE9X0/n0so=;
        b=erQSMZw0mqSymOhLUnes/JkhN1X7M+epMycH3FvErT5r6/0LIUB0qsiFAm+YLd+xmB
         Ic64IvH+A5ClgFtHges1kH9JLT743oZ0DylBNK+6RSh+u6eOhvSjrZSLGSnNGWAeBKUC
         7R27B4tckBP8klZ3dDrocOYVGj7amwF7zywTUyhDLtC7hBUE4vSrMNh7C1fGNxwZxhgl
         /1DEhP8j78zdADd0m7oSPbUXrccYeL1c3Dewq8YgSk2MN0dmPkr02bsoKiDk84suQLlh
         zl/PcqcruXwaPiPw9VokyQTt4tc9Khbwfl5y6+QH12K0ZVYrxDNHh0W9ohFV5xq2Wdgr
         LX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750385784; x=1750990584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6VzlhRVh//x5/bp+2ihBVL31M01Rg7PAdE9X0/n0so=;
        b=toUCwEpSI0wz+IRqJ2Wq0xeQ/eUlFvLIhiSTc4jdafYT4N6HzJX3kBTGnCctjZRNQa
         shCkKvgKERZGu/GL01Vuq1CLDA1+sAGeABbmN/4ogWIqtxVzPFcQewMaEVEhYWh5zHkE
         DP0/DAJn3Xkj2w8Hblwst4vnhfAgIyEl2zdLmx0/AK50ykkYjVl7lnVwvc2HRT6ArvXy
         +69bCPWdWvKcZnm4xMyKKnxo4sCr3uckrAAcdKXDZ24jaQtLtsZA+1STAuCXvwZbQVIm
         esqAn3RcfsPqSrHVtb3qYyUPQpet+h3bEBrb4Qn5dwz8TsqHJRTD2NJRjt2MSdDKITWB
         QAlw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/lLLvzrKNvZhKvEebaYIqSlLL+PixShOdQhU/jPSg4j1uFYlfE87aOUC1mMeHfHLV0I6beRUhkl1sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjseTFjC7+eeM69S0lqXa3ZD1ZNXO8qoWmC7+jZw26ja/tG2zp
	Pe3jI52ZR2oIZK9v2yK1mF7Mhoe2LwrmFEWW/XbYU18GBLCXPl/J9TLKPfDGqbjvxM/kyFKNNtz
	3Y5qsWn9WjTDamLOm98g/oeomixgWqr9/PGiKz+4o3A==
X-Gm-Gg: ASbGncvfr6fo4yS56KJRKioa8HdiEL7U9ucB6nhxAFRdnVSDEdbBQgA2btl3djYWZbN
	xjXiVCpuXeYUV1cktVfIfLkhGAnp4NH2cgDx81bivWI9fJEgOFTCSZmwHFFNpeDa+mTv5RxxZPG
	eXxzaVCVkBTVuM9p1AybhpOTo3oQQ+0xTxzG27WpDUz1FPiw==
X-Google-Smtp-Source: AGHT+IFMb9mI6JMrDwTDWGg+EBY6yLgAqHEKa1UTY7olo+luMJ+3DWC5EwQujeTUmlUkh6NOSS/MWljD6rFkZYVc5ek=
X-Received: by 2002:a05:6602:8303:b0:867:15a5:d16 with SMTP id
 ca18e2360f4ac-8762e7372bemr28998539f.8.1750385784285; Thu, 19 Jun 2025
 19:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
 <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com> <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com>
In-Reply-To: <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 20 Jun 2025 10:16:12 +0800
X-Gm-Features: AX0GCFudFSxSRELkYOW_7RRTcSiKTWMBH5CUlpZzl260C95QwRIsmCDm3_hQ72g
Message-ID: <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
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
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_191626_252904_794870C7 
X-CRM114-Status: GOOD (  44.48  )
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMzozMeKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biA1LCAyMDI1IGF0IDE6MTfigK9BTSBEZWVwYWsg
R3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gemljZmlzcyAvIHppY2Zp
bHAgaW50cm9kdWNlcyBhIG5ldyBleGNlcHRpb24gdG8gcHJpdiBpc2EgYHNvZnR3YXJlIGNoZWNr
Cj4gPiBleGNlcHRpb25gIHdpdGggY2F1c2UgY29kZSA9IDE4LiBUaGlzIHBhdGNoIGltcGxlbWVu
dHMgc29mdHdhcmUgY2hlY2sKPiA+IGV4Y2VwdGlvbi4KPiA+Cj4gPiBBZGRpdGlvbmFsbHkgaXQg
aW1wbGVtZW50cyBhIGNmaSB2aW9sYXRpb24gaGFuZGxlciB3aGljaCBjaGVja3MgZm9yIGNvZGUK
PiA+IGluIHh0dmFsLiBJZiB4dHZhbD0yLCBpdCBtZWFucyB0aGF0IHN3IGNoZWNrIGV4Y2VwdGlv
biBoYXBwZW5lZCBiZWNhdXNlIG9mCj4gPiBhbiBpbmRpcmVjdCBicmFuY2ggbm90IGxhbmRpbmcg
b24gNCBieXRlIGFsaWduZWQgUEMgb3Igbm90IGxhbmRpbmcgb24KPiA+IGBscGFkYCBpbnN0cnVj
dGlvbiBvciBsYWJlbCB2YWx1ZSBlbWJlZGRlZCBpbiBgbHBhZGAgbm90IG1hdGNoaW5nIGxhYmVs
Cj4gPiB2YWx1ZSBzZXR1cCBpbiBgeDdgLiBJZiB4dHZhbD0zLCBpdCBtZWFucyB0aGF0IHN3IGNo
ZWNrIGV4Y2VwdGlvbiBoYXBwZW5lZAo+ID4gYmVjYXVzZSBvZiBtaXNtYXRjaCBiZXR3ZWVuIGxp
bmsgcmVnaXN0ZXIgKHgxIG9yIHg1KSBhbmQgdG9wIG9mIHNoYWRvdwo+ID4gc3RhY2sgKG9uIGV4
ZWN1dGlvbiBvZiBgc3Nwb3BjaGtgKS4KPiA+Cj4gPiBJbiBjYXNlIG9mIGNmaSB2aW9sYXRpb24s
IFNJR1NFR1YgaXMgcmFpc2VkIHdpdGggY29kZT1TRUdWX0NQRVJSLgo+ID4gU0VHVl9DUEVSUiB3
YXMgaW50cm9kdWNlZCBieSB4ODYgc2hhZG93IHN0YWNrIHBhdGNoZXMuCj4gPgo+ID4gVG8ga2Vl
cCB1cHJvYmVzIHdvcmtpbmcsIGhhbmRsZSB0aGUgdXByb2JlIGV2ZW50IGZpcnN0IGJlZm9yZSBy
ZXBvcnRpbmcKPiA+IHRoZSBDRkkgdmlvbGF0aW9uIGluIHNvZnR3YXJlLWNoZWNrIGV4Y2VwdGlv
biBoYW5kbGVyLiBCZWNhdXNlIHdoZW4gdGhlCj4gPiBsYW5kaW5nIHBhZCBpcyBhY3RpdmF0ZWQs
IGlmIHRoZSB1cHJvYmUgcG9pbnQgaXMgc2V0IGF0IHRoZSBscGFkCj4gPiBpbnN0cnVjdGlvbiBh
dCB0aGUgYmVnaW5uaW5nIG9mIGEgZnVuY3Rpb24sIHRoZSBzeXN0ZW0gdHJpZ2dlcnMgYSBzb2Z0
d2FyZQo+ID4gLWNoZWNrIGV4Y2VwdGlvbiBpbnN0ZWFkIG9mIGFuIGVicmVhayBleGNlcHRpb24g
ZHVlIHRvIHRoZSBleGNlcHRpb24KPiA+IHByaW9yaXR5LCB0aGVuIHVwcm9iZSBjYW4ndCB3b3Jr
IHN1Y2Nlc3NmdWxseS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaCB8ICAxICsKPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oICAgfCAgMiArKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICB8ICAzICsrCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+ID4gaW5kZXggY2Q2MjdlYzI4
OWYxLi41YTI3Y2VmZDc4MDUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2FzbS1wcm90b3R5cGVzLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXBy
b3RvdHlwZXMuaAo+ID4gQEAgLTUxLDYgKzUxLDcgQEAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRv
X3RyYXBfZWNhbGxfdSk7Cj4gPiAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxf
cyk7Cj4gPiAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfbSk7Cj4gPiAgREVD
TEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfYnJlYWspOwo+ID4gK0RFQ0xBUkVfRE9fRVJST1Jf
SU5GTyhkb190cmFwX3NvZnR3YXJlX2NoZWNrKTsKPiA+Cj4gPiAgYXNtbGlua2FnZSB2b2lkIGhh
bmRsZV9iYWRfc3RhY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ID4gIGFzbWxpbmthZ2Ugdm9p
ZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9lbnRyeS1jb21tb24uaAo+ID4gaW5kZXggYjI4Y2NjNmNkZWVhLi4zNGVkMTQ5YWY1ZDEg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4gPiBAQCAtNDAs
NCArNDAsNiBAQCBzdGF0aWMgaW5saW5lIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gK2Jvb2wgaGFuZGxl
X3VzZXJfY2ZpX3Zpb2xhdGlvbihzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiArCj4gPiAgI2Vu
ZGlmIC8qIF9BU01fUklTQ1ZfRU5UUllfQ09NTU9OX0ggKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gaW5k
ZXggOTc4MTE1NTY3YmNhLi44ZDI1ODM3YTkzODQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiBA
QCAtNDc0LDYgKzQ3NCw5IEBAIFNZTV9EQVRBX1NUQVJUX0xPQ0FMKGV4Y3BfdmVjdF90YWJsZSkK
PiA+ICAgICAgICAgUklTQ1ZfUFRSIGRvX3BhZ2VfZmF1bHQgICAvKiBsb2FkIHBhZ2UgZmF1bHQg
Ki8KPiA+ICAgICAgICAgUklTQ1ZfUFRSIGRvX3RyYXBfdW5rbm93bgo+ID4gICAgICAgICBSSVND
Vl9QVFIgZG9fcGFnZV9mYXVsdCAgIC8qIHN0b3JlIHBhZ2UgZmF1bHQgKi8KPiA+ICsgICAgICAg
UklTQ1ZfUFRSIGRvX3RyYXBfdW5rbm93biAvKiBjYXVzZT0xNiAqLwo+ID4gKyAgICAgICBSSVND
Vl9QVFIgZG9fdHJhcF91bmtub3duIC8qIGNhdXNlPTE3ICovCj4gPiArICAgICAgIFJJU0NWX1BU
UiBkb190cmFwX3NvZnR3YXJlX2NoZWNrIC8qIGNhdXNlPTE4IGlzIHN3IGNoZWNrIGV4Y2VwdGlv
biAqLwo+ID4gIFNZTV9EQVRBX0VORF9MQUJFTChleGNwX3ZlY3RfdGFibGUsIFNZTV9MX0xPQ0FM
LCBleGNwX3ZlY3RfdGFibGVfZW5kKQo+ID4KPiA+ICAjaWZuZGVmIENPTkZJR19NTVUKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ID4gaW5kZXggOGZmOGU4YjM2NTI0Li42NDM4ODM3MGUxYWQgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gPiBAQCAtMzU0LDYgKzM1NCw1NyBAQCB2b2lkIGRvX3RyYXBfZWNhbGxfdShz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+Cj4gPiAgfQo+ID4KPiA+ICsjZGVmaW5lIENGSV9UVkFM
X0ZDRklfQ09ERSAgICAgMgo+ID4gKyNkZWZpbmUgQ0ZJX1RWQUxfQkNGSV9DT0RFICAgICAzCj4g
PiArLyogaGFuZGxlIGNmaSB2aW9sYXRpb25zICovCj4gPiArYm9vbCBoYW5kbGVfdXNlcl9jZmlf
dmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gK3sKPiA+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyB0dmFsID0gY3NyX3JlYWQoQ1NSX1RWQUwpOwo+ID4gKyAgICAgICBib29sIGlzX2Zj
ZmkgPSAodHZhbCA9PSBDRklfVFZBTF9GQ0ZJX0NPREUgJiYgY3B1X3N1cHBvcnRzX2luZGlyZWN0
X2JyX2xwX2luc3RyKCkpOwo+ID4gKyAgICAgICBib29sIGlzX2JjZmkgPSAodHZhbCA9PSBDRklf
VFZBTF9CQ0ZJX0NPREUgJiYgY3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjaygpKTsKPiA+ICsKPiA+
ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogSGFuZGxlIHVwcm9iZSBldmVudCBmaXJzdC4gVGhl
IHByb2JlIHBvaW50IGNhbiBiZSBhIHZhbGlkIHRhcmdldAo+ID4gKyAgICAgICAgKiBvZiBpbmRp
cmVjdCBqdW1wcyBvciBjYWxscywgaW4gdGhpcyBjYXNlLCBmb3J3YXJkIGNmaSB2aW9sYXRpb24K
PiA+ICsgICAgICAgICogd2lsbCBiZSB0cmlnZ2VyZWQgaW5zdGVhZCBvZiBicmVha3BvaW50IGV4
Y2VwdGlvbi4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIGlmIChpc19mY2ZpICYmIHByb2Jl
X2JyZWFrcG9pbnRfaGFuZGxlcihyZWdzKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPgo+IEhpICBEZWVwYWssCj4gU29ycnkgZm9yIG1pc3Npbmcgc29tZXRoaW5nIGVhcmxpZXIu
IEkgdGhpbmsgd2Ugd291bGQgbGlrZSB0byBjbGVhcgo+IHNzdGF0dXMuU1BFTFAgaW4gdGhlIHVw
cm9iZSBoYW5kbGluZyBjYXNlLiBGb3IgZXhhbXBsZToKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IGMy
ZWE5OTljMTE2Ny4uZTg0OTJiYjU3ZTA5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTM0OSw4ICsz
NDksMTAgQEAgYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ICAgICAgICAgYm9vbCBpc19mY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfRkNGSV9DT0RF
ICYmCj4gY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkpOwo+ICAgICAgICAgYm9v
bCBpc19iY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFICYmCj4gY3B1X3N1cHBvcnRz
X3NoYWRvd19zdGFjaygpKTsKPgo+IC0gICAgICAgaWYgKGlzX2ZjZmkgJiYgcHJvYmVfYnJlYWtw
b2ludF9oYW5kbGVyKHJlZ3MpKQo+ICsgICAgICAgaWYgKGlzX2ZjZmkgJiYgcHJvYmVfYnJlYWtw
b2ludF9oYW5kbGVyKHJlZ3MpKSB7Cj4gKyAgICAgICAgICAgICAgIHJlZ3MtPnN0YXR1cyA9IHJl
Z3MtPnN0YXR1cyAmIH5TUl9FTFA7Cj4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICsg
ICAgICAgfQo+Cj4gICAgICAgICBpZiAoaXNfZmNmaSB8fCBpc19iY2ZpKSB7Cj4gICAgICAgICAg
ICAgICAgIGRvX3RyYXBfZXJyb3IocmVncywgU0lHU0VHViwgU0VHVl9DUEVSUiwgcmVncy0+ZXBj
LAo+Cj4KPiBXaGVuIGEgdXNlciBtb2RlIENGSSB2aW9sYXRpb24gb2NjdXJzLCB0aGUgRUxQIHN0
YXRlIHNob3VsZCBiZSAxLCBhbmQKPiB0aGUgc3lzdGVtIHRyYXBzIGludG8gc3VwZXJ2aXNvciBt
b2RlLiBEdXJpbmcgdGhpcyB0cmFwLCBzc3RhdHVzLlNQRUxQCj4gaXMgc2V0IHRvIDEsIGFuZCB0
aGUgRUxQIHN0YXRlIGlzIHJlc2V0IHRvIDAuIElmIHdlIGRvbuKAmXQgY2xlYXIKPiBzc3RhdHVz
LlNQRUxQLCB0aGUgRUxQIHN0YXRlIHdpbGwgYmVjb21lIDEgYWdhaW4gYWZ0ZXIgZXhlY3V0aW5n
IHRoZQo+IHNyZXQgaW5zdHJ1Y3Rpb24uIEFzIGEgcmVzdWx0LCB0aGUgc3lzdGVtIG1pZ2h0IHRy
aWdnZXIgYW5vdGhlcgo+IGZvcndhcmQgQ0ZJIHZpb2xhdGlvbiB1cG9uIGV4ZWN1dGluZyB0aGUg
bmV4dCBpbnN0cnVjdGlvbiBpbiB0aGUgdXNlcgo+IHByb2dyYW0sIHVubGVzcyBpdCBoYXBwZW5z
IHRvIGJlIGEgbHBhZCBpbnN0cnVjdGlvbi4KPgo+IFRoZSBwcmV2aW91cyBwYXRjaCB3YXMgdGVz
dGVkIG9uIFFFTVUsIGJ1dCBRRU1VIGRvZXMgbm90IHNldCB0aGUKPiBzc3RhdHVzLlNQRUxQIGJp
dCB0byAxIHdoZW4gYSBmb3J3YXJkIENGSSB2aW9sYXRpb24gb2NjdXJzLiBUaGVyZWZvcmUsCj4g
SSBzdXNwZWN0IHRoYXQgUUVNVSBtaWdodCBhbHNvIHJlcXVpcmUgc29tZSBmaXhlcy4KCkhpIERl
ZXBhaywKVGhlIGlzc3VlIHdpdGggUUVNVSB3YXMgdGhhdCB0aGUgc3ctY2hlY2sgZXhjZXB0aW9u
IGJpdCBpbiBtZWRlbGVnCmNvdWxkbid0IGJlIHNldC4gVGhpcyBoYXMgYmVlbiBmaXhlZCBpbiB0
aGUgbGF0ZXN0IFFFTVUgbWFpbmxpbmUuIEkKaGF2ZSByZS10ZXN0ZWQgdGhlIGxhdGVzdCBRRU1V
IHZlcnNpb24sIGFuZCBpdCB3b3Jrcy4KCj4KPiBUaGFua3MKPgo+ID4gKwo+ID4gKyAgICAgICBp
ZiAoaXNfZmNmaSB8fCBpc19iY2ZpKSB7Cj4gPiArICAgICAgICAgICAgICAgZG9fdHJhcF9lcnJv
cihyZWdzLCBTSUdTRUdWLCBTRUdWX0NQRVJSLCByZWdzLT5lcGMsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiT29wcyAtIGNvbnRyb2wgZmxvdyB2aW9sYXRpb24iKTsKPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gPiArfQo+ID4gKwo+ID4gKy8qCj4gPiArICogc29mdHdhcmUgY2hl
Y2sgZXhjZXB0aW9uIGlzIGRlZmluZWQgd2l0aCByaXNjLXYgY2ZpIHNwZWMuIFNvZnR3YXJlIGNo
ZWNrCj4gPiArICogZXhjZXB0aW9uIGlzIHJhaXNlZCB3aGVuOi0KPiA+ICsgKiBhKSBBbiBpbmRp
cmVjdCBicmFuY2ggZG9lc24ndCBsYW5kIG9uIDQgYnl0ZSBhbGlnbmVkIFBDIG9yIGBscGFkYAo+
ID4gKyAqICAgIGluc3RydWN0aW9uIG9yIGBsYWJlbGAgdmFsdWUgcHJvZ3JhbW1lZCBpbiBgbHBh
ZGAgaW5zdHIgZG9lc24ndAo+ID4gKyAqICAgIG1hdGNoIHdpdGggdmFsdWUgc2V0dXAgaW4gYHg3
YC4gcmVwb3J0ZWQgY29kZSBpbiBgeHR2YWxgIGlzIDIuCj4gPiArICogYikgYHNzcG9wY2hrYCBp
bnN0cnVjdGlvbiBmaW5kcyBhIG1pc21hdGNoIGJldHdlZW4gdG9wIG9mIHNoYWRvdyBzdGFjayAo
c3NwKQo+ID4gKyAqICAgIGFuZCB4MS94NS4gcmVwb3J0ZWQgY29kZSBpbiBgeHR2YWxgIGlzIDMu
Cj4gPiArICovCj4gPiArYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBk
b190cmFwX3NvZnR3YXJlX2NoZWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gK3sKPiA+ICsg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4gKyAgICAgICAgICAgICAgIGlycWVudHJ5
X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIC8q
IG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVua25vd24gdHJh
cCBoYW5kbGVyICovCj4gPiArICAgICAgICAgICAgICAgaWYgKCFoYW5kbGVfdXNlcl9jZmlfdmlv
bGF0aW9uKHJlZ3MpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZG9fdHJhcF91bmtub3du
KHJlZ3MpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlycWVudHJ5X2V4aXRfdG9fdXNlcl9t
b2RlKHJlZ3MpOwo+ID4gKyAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgIC8qIHN3
IGNoZWNrIGV4Y2VwdGlvbiBjb21pbmcgZnJvbSBrZXJuZWwgaXMgYSBidWcgaW4ga2VybmVsICov
Cj4gPiArICAgICAgICAgICAgICAgZGllKHJlZ3MsICJLZXJuZWwgQlVHIik7Cj4gPiArICAgICAg
IH0KPiA+ICt9Cj4gPiArCj4gPiAgI2lmZGVmIENPTkZJR19NTVUKPiA+ICBhc21saW5rYWdlIF9f
dmlzaWJsZSBub2luc3RyIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiA+ICB7Cj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
