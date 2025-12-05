Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4C7D3748E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klYNQUQIqBGH2r1oXNBQU/jL3qIupMxpTuhtK4Q9tGs=; b=MAPewAvT56mJnP
	ET4yIvMta+CX7h9dxU8HVjaEHBlat2ox317LJwCiTGxquFK4TCzaiMe4sHynKgbU1GiFKMEBfk/Le
	VOZiBd64yYDUF1dBW7HLQZnmCzl4BBoTHr5EjgMUqskybEnW9RuSAsneR2kuEbwCH7TwcV3BhnDLl
	7ipg/RM+ZztyHvfAGn1xweSrz6kIKW4vF5hdo3PaHIToAzTqX1V9/ZRhTEmJlHI4bwONo9NPhvgyR
	YZ1bSYG5bFr5pLZi+ly8i2mnn7DV7gcSGkSoC7vYT7iIawnPMzMaaGm0I1mpbphD5LvOqwxPrEH5T
	qawfM2Cxp6OG94RshApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbgp-00000009yC0-0TgM;
	Fri, 05 Dec 2025 19:42:03 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbgm-00000009yBh-3a3v;
	Fri, 05 Dec 2025 19:42:00 +0000
Message-ID: <14afa916-565e-4c25-8e19-ddb87644ae8b@infradead.org>
Date: Fri, 5 Dec 2025 11:41:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
 Zong Li <zong.li@sifive.com>, Andreas Korb
 <andreas.korb@aisec.fraunhofer.de>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
 <20251204-v5_user_cfi_series-v24-25-ada7a3ba14dc@rivosinc.com>
 <b5feba48-7e7c-4ab9-a193-072f3980f525@infradead.org>
 <aTMjS-Ok-DrJJjQY@debug.ba.rivosinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTMjS-Ok-DrJJjQY@debug.ba.rivosinc.com>
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

CgpPbiAxMi81LzI1IDEwOjI0IEFNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MDQsIDIwMjUgYXQgMDI6MTc6MjdQTSAtMDgwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pgo+Pgo+
PiBPbiAxMi80LzI1IDEyOjA0IFBNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+PiBUaGlzIHBhdGNo
IGNyZWF0ZXMgYSBjb25maWcgZm9yIHNoYWRvdyBzdGFjayBzdXBwb3J0IGFuZCBsYW5kaW5nIHBh
ZCBpbnN0cgo+Pj4gc3VwcG9ydC4gU2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgaW5z
dHIgc3VwcG9ydCBjYW4gYmUgZW5hYmxlZCBieQo+Pj4gc2VsZWN0aW5nIGBDT05GSUdfUklTQ1Zf
VVNFUl9DRklgLiBTZWxlY3RpbmcgYENPTkZJR19SSVNDVl9VU0VSX0NGSWAgd2lyZXMKPj4+IHVw
IHBhdGggdG8gZW51bWVyYXRlIENQVSBzdXBwb3J0IGFuZCBpZiBjcHUgc3VwcG9ydCBleGlzdHMs
IGtlcm5lbCB3aWxsCj4+PiBzdXBwb3J0IGNwdSBhc3Npc3RlZCB1c2VyIG1vZGUgY2ZpLgo+Pj4K
Pj4+IElmIENPTkZJR19SSVNDVl9VU0VSX0NGSSBpcyBzZWxlY3RlZCwgc2VsZWN0IGBBUkNIX1VT
RVNfSElHSF9WTUFfRkxBR1NgLAo+Pj4gYEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLYCBhbmQg
RFlOQU1JQ19TSUdGUkFNRSBmb3IgcmlzY3YuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkg
PHpvbmcubGlAc2lmaXZlLmNvbT4KPj4+IFRlc3RlZC1ieTogQW5kcmVhcyBLb3JiIDxhbmRyZWFz
LmtvcmJAYWlzZWMuZnJhdW5ob2Zlci5kZT4KPj4+IFRlc3RlZC1ieTogVmFsZW50aW4gSGF1ZGlx
dWV0IDx2YWxlbnRpbi5oYXVkaXF1ZXRAY2Fub25pY2FsLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+PiDCoGFyY2gvcmlz
Y3YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMiArKysrKysr
KysrKysrKysrKysrKysrCj4+PiDCoGFyY2gvcmlzY3YvY29uZmlncy9oYXJkZW5pbmcuY29uZmln
IHzCoCA0ICsrKysKPj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
Pj4gaW5kZXggMGM2MDM4ZGM1ZGZkLi5mNTU3NGM2ZjY2ZDggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKPj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gQEAgLTExNDYs
NiArMTE0NiwyOCBAQCBjb25maWcgUkFORE9NSVpFX0JBU0UKPj4+Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBJZiB1bnN1cmUsIHNheSBOLgo+Pj4KPj4+ICtjb25maWcgUklTQ1ZfVVNFUl9DRkkK
Pj4+ICvCoMKgwqAgZGVmX2Jvb2wgeQo+Pj4gK8KgwqDCoCBib29sICJyaXNjdiB1c2Vyc3BhY2Ug
Y29udHJvbCBmbG93IGludGVncml0eSIKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiA2NEJJVCAmJiBc
Cj4+PiArwqDCoMKgwqDCoMKgwqAgJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFyY2g9cnY2NGlt
YV96aWNmaXNzX3ppY2ZpbHAgLWZjZi1wcm90ZWN0aW9uPWZ1bGwpCj4+PiArwqDCoMKgIGRlcGVu
ZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPj4+ICvCoMKgwqAgc2VsZWN0IFJJU0NWX1NCSQo+Pj4g
K8KgwqDCoCBzZWxlY3QgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0sKPj4+ICvCoMKgwqAgc2Vs
ZWN0IEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFHUwo+Pj4gK8KgwqDCoCBzZWxlY3QgRFlOQU1JQ19T
SUdGUkFNRQo+Pj4gK8KgwqDCoCBoZWxwCj4+PiArwqDCoMKgwqDCoCBQcm92aWRlcyBDUFUgYXNz
aXN0ZWQgY29udHJvbCBmbG93IGludGVncml0eSB0byB1c2Vyc3BhY2UgdGFza3MuCj4+Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ1BVLWFzc2lzdGVkCj4+Cj4+PiArwqDCoMKgwqDC
oCBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHByb3ZpZGVkIGJ5IGltcGxlbWVudGluZyBzaGFk
b3cgc3RhY2sgZm9yCj4+PiArwqDCoMKgwqDCoCBiYWNrd2FyZCBlZGdlIGFuZCBpbmRpcmVjdCBi
cmFuY2ggdHJhY2tpbmcgZm9yIGZvcndhcmQgZWRnZSBpbiBwcm9ncmFtLgo+Pj4gK8KgwqDCoMKg
wqAgU2hhZG93IHN0YWNrIHByb3RlY3Rpb24gaXMgYSBoYXJkd2FyZSBmZWF0dXJlIHRoYXQgZGV0
ZWN0cyBmdW5jdGlvbgo+Pj4gK8KgwqDCoMKgwqAgcmV0dXJuIGFkZHJlc3MgY29ycnVwdGlvbi4g
VGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPj4+ICvCoMKgwqDCoMKgIEluZGlyZWN0
IGJyYW5jaCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFsbCBpbmRpcmVjdCBicmFuY2hlcyBtdXN0
IGxhbmQKPj4+ICvCoMKgwqDCoMKgIG9uIGEgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gZWxzZSBD
UFUgd2lsbCBmYXVsdC4gVGhpcyBtaXRpZ2F0ZXMgYWdhaW5zdAo+Pj4gK8KgwqDCoMKgwqAgSk9Q
IC8gQ09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIGl0LCBh
bmQgb2xkIHVzZXItCj4+PiArwqDCoMKgwqDCoCBzcGFjZSBkb2VzIG5vdCBnZXQgcHJvdGVjdGlv
biAiZm9yIGZyZWUiLgo+Pj4gK8KgwqDCoMKgwqAgZGVmYXVsdCB5Lgo+Pgo+PiDCoMKgwqDCoMKg
IERlZmF1bHQgaXMgeSBpZiBoYXJkd2FyZSBzdXBwb3J0cyBpdC4KPj4gPwo+IAo+IE5vIGRlZmF1
bHQgWSBtZWFucyBzdXBwb3J0IGlzIGJ1aWx0IGluIHRoZSBrZXJuZWwgZm9yIGNmaS4KCiAgKGlm
IHRoZSBjb21waWxlciBzdXBwb3J0cyBpdD8pCgo+IElmIGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9y
dCBDRkkgaW5zdHJ1Y3Rpb25zLCB0aGVuIGtlcm5lbCB3aWxsIGRvIGZvbGxvd2luZwo+IAo+IC0g
cHJjdGxzIHRvIG1hbmFnZSBzaGFkb3cgc3RhY2svbGFuZGluZyBwYWQgZW5hYmxlL2Rpc2FibGUg
d2lsbCBmYWlsLgo+IC0gdkRTTyB3aWxsIG5vdCBoYXZlIHNoYWRvdyBzdGFjayBpbnN0cnVjdGlv
bnMgaW4gaXQuCgpUaGFua3MgZm9yIHRoZSBpbmZvLgoKLS0gCn5SYW5keQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
