Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEE5D65C42
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eitslmMPFjl2vkUoGP6exfVKkMAir7ExjREk4Zt1rQ=; b=Z1GIILza/+ifmi
	aP8JdHo6F2bem/Eerys+M/fJCsIypjmvFAVknf/hTYfUIL5qSeM7U6qsTZf/zLV22alpleoe/Flb+
	lzrrt+dU17iDIgQsSUXYwBIqm1B2nCoCFFiYc+sWxbHPcT4c+WnhT9xxsU+t+YsFgSdGm92GSKzUa
	THF8EhkU4mWgAQhOl8ExdXoK1MOxNtoO8P7BydXC0q/+2e/33aXi6L/b1tXGq+XNmbb9kOEo2b1k/
	nmsKN+mE45enZEdsTM047X4ZWhOPgjYBwSjePfv6Ay4M/hrgJT1Ohni/L5SniKKcUFNBdBZIjbKYc
	V5pWF1wHC9jFUymWI/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTAn-00000008wch-2I0H;
	Thu, 14 Nov 2024 06:17:45 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTAk-00000008wc2-0vk5
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 06:17:43 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5eb67d926c4so104028eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731565061; x=1732169861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAHw3+SJRl1ztp43mDkxoKRsjkMTu01styDys5QSXWg=;
        b=Roo3LRMneF/E2DgpWj/Kt7FCI8tTwiQOSxgq5zylJb/Snctqv7SWpSWBcGxuntydIv
         bYjS4f0n0WXFXrLO/XY/9mY5VLBs6HTcJn9XYxf24hPSQjaaqucwAi5iXKtrrp3dH5mn
         VL57CVGrdXdemmZlhUcm9W0kIj9OdxZnU1gE6d+vGaN79o1Y3egv+z26fVjei+2fd+9b
         fJDM2O/0J31u8KbYeNuRQC9uJCcPe2XnVqqekQlG6As9H5QrXLnVCjiHlbiCxfFVHvPm
         G50110X/CidMEK5wEepk2QjDackqnUGyuQuqOdtoiuOnu3sTJ0qCpYs89tg9gRxkyNeu
         C4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731565061; x=1732169861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAHw3+SJRl1ztp43mDkxoKRsjkMTu01styDys5QSXWg=;
        b=aubICDL0ftnkq8RNFixZ+82YE1siJSa56d98swhVD5OWkYAqe+5LknxUodMsKoVHgl
         nwmdQIMGloyx/tiHoTD5TZl+STaQT0E72MavQLheZ8F1HuewzGySKgEGcJKJVcJZLgW1
         qnLKsU9L1Z6Ovk3TBah8CCA0nzbQUi8jwRFJMoc1P9q8f3YJ+pO/zqxU7divtU4dNnXe
         jO7pcSTE8/7zpeu0wXXsiEBfcLkRFUGvVuCdAZR//uPDn1vtsHeOMXnqftXpVpb77BvK
         MJXEWvF7DS6FSxQDK2E34HZ+tAZP9Dc3Yxbo9m6AdNtFTzelc/MXH42dkEwZVwvN+IFn
         fOjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTvS9dL1bPVInXUE5/0yYMS4v0cAgh10PENNUzv7yVN4ghFHt/e8oajSV6xsSOZmRzJTlygINt5f74VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJVcASC7HdJDJSfbO2DxKdKiCrw6Vz4Kz1jmB81EM0RouF8KtZ
	1bZfO6vVcoX+7d5Hr2J8Ag2CmAYPcqFc33eYsXasmeiIUCQ8dkR1dngJiuzuXz0HOI8YTh7x+Wf
	261AhNnbAbNYHWXVUnPNCoYwc0hky8ip0FSurrw==
X-Google-Smtp-Source: AGHT+IF/SorbAbjXbn/nrCDj1xlGQZyh9Tb/1BFx5yZDCatQmC6DlRJonI//aGPXQYjj5gUcvfUUQConp4xKP57Wh80=
X-Received: by 2002:a05:6871:8a5:b0:296:14ae:8b7d with SMTP id
 586e51a60fabf-29614aed449mr409087fac.10.1731565060984; Wed, 13 Nov 2024
 22:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
 <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com> <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
 <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com>
In-Reply-To: <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 14 Nov 2024 14:17:30 +0800
Message-ID: <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>
Subject: Re: [PATCH v8 24/29] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
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
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_221742_321199_C990E7DF 
X-CRM114-Status: GOOD (  27.69  )
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

SGkgRGVlcGFrCgpPbiBUaHUsIE5vdiAxNCwgMjAyNCBhdCA5OjI14oCvQU0gRGVlcGFrIEd1cHRh
IDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQg
MDk6MjA6MTRBTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+SGkgRGVlcGFrCj4gPgo+ID5PbiBU
aHUsIE5vdiAxNCwgMjAyNCBhdCA5OjA24oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMTI6MTM6MzhB
TSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+PiA+SGkgRGVlcGFrCj4gPj4gPgo+ID4+ID5PbiBU
dWUsIE5vdiAxMiwgMjAyNCBhdCA1OjA44oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+ID4+ID4+Cj4gPj4gPj4gS2VybmVsIHdpbGwgaGF2ZSB0byBwZXJmb3Jt
IHNoYWRvdyBzdGFjayBvcGVyYXRpb25zIG9uIHVzZXIgc2hhZG93IHN0YWNrLgo+ID4+ID4+IExp
a2UgZHVyaW5nIHNpZ25hbCBkZWxpdmVyeSBhbmQgc2lncmV0dXJuLCBzaGFkb3cgc3RhY2sgdG9r
ZW4gbXVzdCBiZQo+ID4+ID4+IGNyZWF0ZWQgYW5kIHZhbGlkYXRlZCByZXNwZWN0aXZlbHkuIFRo
dXMgc2hhZG93IHN0YWNrIGFjY2VzcyBmb3Iga2VybmVsCj4gPj4gPj4gbXVzdCBiZSBlbmFibGVk
Lgo+ID4+ID4+Cj4gPj4gPj4gSW4gZnV0dXJlIHdoZW4ga2VybmVsIHNoYWRvdyBzdGFja3MgYXJl
IGVuYWJsZWQgZm9yIGxpbnV4IGtlcm5lbCwgaXQgbXVzdAo+ID4+ID4+IGJlIGVuYWJsZWQgYXMg
ZWFybHkgYXMgcG9zc2libGUgZm9yIGJldHRlciBjb3ZlcmFnZSBhbmQgcHJldmVudCBpbWJhbGFu
Y2UKPiA+PiA+PiBiZXR3ZWVuIHJlZ3VsYXIgc3RhY2sgYW5kIHNoYWRvdyBzdGFjay4gQWZ0ZXIg
YHJlbG9jYXRlX2VuYWJsZV9tbXVgIGhhcwo+ID4+ID4+IGJlZW4gZG9uZSwgdGhpcyBpcyBhcyBl
YXJseSBhcyBwb3NzaWJsZSBpdCBjYW4gZW5hYmxlZC4KPiA+PiA+Pgo+ID4+ID4+IFNpZ25lZC1v
ZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ID4+ID4+IC0tLQo+ID4+
ID4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIHwgIDQgKysrKwo+ID4+ID4+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPj4gPj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4+ID4+Cj4gPj4gPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jCj4gPj4gPj4gaW5kZXggNzY2YmQzM2YxMGNiLi5hMjJhYjhhNDE2NzIg
MTAwNjQ0Cj4gPj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ID4+
ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiA+PiA+PiBAQCAtNTE3
LDQgKzUxNyw4IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkKPiA+PiA+PiAgICAgICAgIERFRklO
RShGUkVHU19BNiwgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgZnRyYWNlX3JlZ3MsIGE2KSk7
Cj4gPj4gPj4gICAgICAgICBERUZJTkUoRlJFR1NfQTcsICAgICAgICAgICAgb2Zmc2V0b2Yoc3Ry
dWN0IGZ0cmFjZV9yZWdzLCBhNykpOwo+ID4+ID4+ICAjZW5kaWYKPiA+PiA+PiArICAgICAgIERF
RklORShTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVCk7Cj4gPj4gPj4gKyAgICAgICBERUZJTkUo
U0JJX0VYVF9GV0ZUX1NFVCwgU0JJX0VYVF9GV0ZUX1NFVCk7Cj4gPj4gPj4gKyAgICAgICBERUZJ
TkUoU0JJX0ZXRlRfU0hBRE9XX1NUQUNLLCBTQklfRldGVF9TSEFET1dfU1RBQ0spOwo+ID4+ID4+
ICsgICAgICAgREVGSU5FKFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0ssIFNCSV9GV0ZUX1NFVF9GTEFH
X0xPQ0spOwo+ID4+ID4+ICB9Cj4gPj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ID4+ID4+IGluZGV4IDM1NmQ1Mzk3
YjJhMi4uNjI0NDQwOGNhOTE3IDEwMDY0NAo+ID4+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUwo+ID4+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ID4+ID4+IEBA
IC0xNjQsNiArMTY0LDEyIEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4gPj4gPj4gICAgICAgICBj
YWxsIHJlbG9jYXRlX2VuYWJsZV9tbXUKPiA+PiA+PiAgI2VuZGlmCj4gPj4gPj4gICAgICAgICBj
YWxsIC5Mc2V0dXBfdHJhcF92ZWN0b3IKPiA+PiA+PiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZX
RlQKPiA+PiA+PiArICAgICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4gPj4gPj4gKyAgICAg
ICBsaSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4gPj4gPj4gKyAgICAgICBsaSBhMSwgMSAv
KiBlbmFibGUgc3VwZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93IHN0YWNrIGFjY2VzcyAqLwo+ID4+
ID4+ICsgICAgICAgbGkgYTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPiA+PiA+PiArICAgICAg
IGVjYWxsCj4gPj4gPj4gICAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4gPj4gPj4gICAgICAgICBj
YWxsIHNtcF9jYWxsaW4KPiA+PiA+PiAgI2VuZGlmIC8qIENPTkZJR19TTVAgKi8KPiA+PiA+PiBA
QCAtMzIwLDYgKzMyNiwxMiBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+ID4+ID4+
ICAgICAgICAgbGEgdHAsIGluaXRfdGFzawo+ID4+ID4+ICAgICAgICAgbGEgc3AsIGluaXRfdGhy
ZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUKPiA+PiA+PiAgICAgICAgIGFkZGkgc3AsIHNwLCAtUFRf
U0laRV9PTl9TVEFDSwo+ID4+ID4+ICsgICAgICAgbGkgYTcsIFNCSV9FWFRfRldGVAo+ID4+ID4+
ICsgICAgICAgbGkgYTYsIFNCSV9FWFRfRldGVF9TRVQKPiA+PiA+PiArICAgICAgIGxpIGEwLCBT
QklfRldGVF9TSEFET1dfU1RBQ0sKPiA+PiA+PiArICAgICAgIGxpIGExLCAxIC8qIGVuYWJsZSBz
dXBlcnZpc29yIHRvIGFjY2VzcyBzaGFkb3cgc3RhY2sgYWNjZXNzICovCj4gPj4gPj4gKyAgICAg
ICBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+ID4+ID4+ICsgICAgICAgZWNhbGwKPiA+
PiA+PiAgICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPiA+PiA+Pgo+ID4+ID4+ICAjaWZkZWYgQ09O
RklHX0tBU0FOCj4gPj4gPj4KPiA+PiA+PiAtLQo+ID4+ID4+IDIuNDUuMAo+ID4+ID4+Cj4gPj4g
PlNob3VsZCB3ZSBjbGVhciB0aGUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyBiZWZvcmUgdGhlIGNw
dSBob3RwbHVnCj4gPj4gPm90aGVyd2lzZSB0aGUgbWVudmNmZy5zc2Ugd29uJ3QgYmUgc2V0IGJ5
IHRoZSBmd2Z0IHNldCBzYmkgY2FsbCB3aGVuCj4gPj4gPnRoZSBob3RwbHVnIGNwdSBiYWNrIHRv
IGtlcm5lbD8KPiA+Pgo+ID4+IEhtbS4uLgo+ID4+Cj4gPj4gQW4gaW5jb21pbmcgaG90cGx1ZyBD
UFUgaGFzIG5vIGZlYXR1cmVzIHNldHVwIG9uIGl0Lgo+ID4+IEkgc2VlIHRoYXQgYHNiaV9jcHVf
c3RhcnRgIHdpbGwgc3VwcGx5IGBzZWNvbmRhcnlfc3RhcnRfc2JpYCBhcyBzdGFydAo+ID4+IHVw
IGNvZGUgZm9yIGluY29taW5nIENQVS4gYHNlY29uZGFyeV9zdGFydF9zYmlgIGlzIGluIGhlYWQu
UyB3aGljaCBjb252ZXJnZXMKPiA+PiBpbiBgLkxzZWNvbmRhcnlfc3RhcnRfY29tbW9uYC4gQW5k
IHRodXMgaG90cGx1Z2dlZCBDUFUgc2hvdWxkIGJlCj4gPj4gaXNzdWluZyBzaGFkb3cgc3RhY2sg
c2V0IEZXRlQgc2JpIGFzIHdlbGwuCj4gPj4KPiA+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8K
PiA+Pgo+ID5UaGlzIGlzIHRoZSBjb3JyZWN0IGZsb3cuIEhvd2V2ZXIgdGhlIG9wZW5zYmkgd2ls
bCBkZW55IGl0IGR1ZSB0byB0aGUKPiA+U0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyBhbHJlYWR5IGJl
aW5nIHNldC4KPiA+U28gdGhlIG1lbnZjZmcuc3NlIHdpbGwgbm90IHNldCBieSB0aGlzIGZsb3cu
Cj4gPgo+ID5pZiAoY29uZi0+ZmxhZ3MgJiBTQklfRldGVF9TRVRfRkxBR19MT0NLKQo+ID4gICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FREVOSUVEOwo+ID4KPgo+IGhtbS4uLiBXaHk/Cj4KPiBg
Y29uZmAgaXMgcG9pbnRpbmcgdG8gcGVyLWhhcnQgc3RhdGUgaW4gZmlybXdhcmUuCj4KPiBPbiB0
aGlzIGluY29taW5nIGNwdSwgb3BlbnNiaSAob3IgZXF1aXZhbGVudCkgZmlybXdhcmUgbXVzdCBo
YXZlCj4gZW5zdXJlZCB0aGF0IHRoaXMgcGVyLWhhcnQgc3RhdGUgZG9lc24ndCBoYXZlIGxvY2sg
c2V0Lgo+Cj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPgpDdXJyZW50IE9wZW5TQkkgZG9lc24n
dCBjbGVhciB0aGUgbG9jayBpbiB0aGUgd2FybSBpbml0IG9mIHRoZSBob3RwbHVnIHBhdGguCkl0
IHNlZW1zIGxpa2Ugd2UgbmVlZCBhIHBhdGNoIHRvIGFkZHJlc3MgaXQuCgpSZWdhcmRzLApOaWNr
Cj4gPlJlZ2FyZHMsCj4gPk5pY2sKPiA+PiA+Cj4gPj4gPlJlZ2FyZHMsCj4gPj4gPk5pY2sKPiA+
PiA+Pgo+ID4+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPj4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPj4gPj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
