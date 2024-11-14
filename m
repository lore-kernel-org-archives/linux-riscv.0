Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FBFD637CF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ILtxl61nvte38Kpfe0RPwrJIXNNrfSMRJxeU2WouOk=; b=f2cigHdHHVdUOBRZQM5aQObqxC
	xJ3YNf5uD1X24yRq8bjo35Qa70s2GwkSF+JYQgu5sstdaHWI8WlWjUN2qPJ2mFXBh1/9IFwg/7Yud
	NWGor4PvsibdQnWFfn6hrsG+Pmj2vnsJ4buTMPLRq112bvP1S6vk/w2DDVhAK1dhiTY2V5TOxwTdZ
	5ttnvha80MtRewzGG9yhMI5MbSon0U6x7AXT0q2bMk05dHdvqhgSPl647+ji02tFaAz18G/ynImTg
	caOTCL5oxLFmFW1ckvfc1Diyke6x2/9cEEWjSDImRJfg8du9KN+7bfo48u3yhYeC+MJqC7fK2Fa4Q
	cNUAwEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBObc-00000008QhQ-3aBy;
	Thu, 14 Nov 2024 01:25:08 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBObZ-00000008Qg9-1KXA
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 01:25:07 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3e60d3adecbso37453b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 17:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731547504; x=1732152304; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tgZBsjLXLWa/QitrFWyk7TGNAjpHhq1mYxI46BDfkY=;
        b=zVvWQfYFxWOa/ebHVMOHGDoTb91Vzotuf3Lh38zfpuPMDWpIb4COSpHXacVX163LoZ
         /GZE+bszLKvUj1yGAxk/jccFdZE72ZaThuBHtlCya/1cxJQOPh2SvjfFpJBInspDlhpH
         locnbWWbpSs00qcqLlC5UYCVUB2GCpXTM22tYdUtHVofz1MogB7gqpxQsUPiJ+eaCQ+R
         bdONUhqE5OAcGlV5elNpZ8PCFB954uDMKoERZ7Nbuv4v2S8Yl3jd5hgVYvqtrrztaCwe
         YF88FmYgEVB+58XnRCFIUaZ4OYVLO1DyvMhI/zGR1g+Z0wGwikuGZxRvtLR6jBVrsxeI
         4UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731547504; x=1732152304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tgZBsjLXLWa/QitrFWyk7TGNAjpHhq1mYxI46BDfkY=;
        b=gkjvxZ5x3bMaTRGEk6M7PJZfLl3x1JfbCJhMqKffjC3egKADy4q78dxRM1bxlzqLdb
         Cp+K6oR+rA0gVdictgf31eacia4yz3ad8nW27p4TvDOv0EqpEzZs6hz05VRdq9eddFyQ
         B7Q2w4CkC28SBExX8x8xh0opoF+Mf5WOhuIBgSeAYbAx6LAtCPuDREdWQg+Sorq8sHy2
         wy5xOkHb2EzdjWx7kgjHsVXG9Q7/rbv9lPtdjK2viozT6i5w5v7l80QD5ggyXYNc2zkf
         0ur7PpkcykoR7yNNF/Fck4+BQ2yI1bbo/BTOPLyNAhjGxvbCt37rsHEt2UdGyVE7eoJX
         5KqA==
X-Forwarded-Encrypted: i=1; AJvYcCWDLdvWr6eJppPFUNft3ufntQlqqPveV6B6JH+oid9NYnFx7SD5NWZC/KoOAeDsPQOKGI8FIbXcUTFZyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmrnklxzm6FqoKQa6eQUH6V7CUFh/hOhCQQO5rWtOo4sD5J19y
	WjXk3qYd1USO1MUd/fFPgbuuV29J9/njfDIIAcvrjjqEIO09njA7VSBRwLHIDrU=
X-Google-Smtp-Source: AGHT+IFYV+lyD6AUZ64wWkmaKdb2jE8s1l+YlxE25IyFaRji6Gg+al5X5KNPM0lWiRmirmHIFmzF1w==
X-Received: by 2002:a05:6808:2222:b0:3e6:22f:ea48 with SMTP id 5614622812f47-3e7b7bdede7mr481448b6e.28.1731547504098;
        Wed, 13 Nov 2024 17:25:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5bcad0sm11125410a12.32.2024.11.13.17.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 17:25:03 -0800 (PST)
Date: Wed, 13 Nov 2024 17:25:00 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Nick Hu <nick.hu@sifive.com>
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
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v8 24/29] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
 <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
 <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_172505_391432_E63BAB45 
X-CRM114-Status: GOOD (  21.70  )
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

T24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDk6MjA6MTRBTSArMDgwMCwgTmljayBIdSB3cm90ZToK
PkhpIERlZXBhawo+Cj5PbiBUaHUsIE5vdiAxNCwgMjAyNCBhdCA5OjA24oCvQU0gRGVlcGFrIEd1
cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIE5vdiAxNCwgMjAy
NCBhdCAxMjoxMzozOEFNICswODAwLCBOaWNrIEh1IHdyb3RlOgo+PiA+SGkgRGVlcGFrCj4+ID4K
Pj4gPk9uIFR1ZSwgTm92IDEyLCAyMDI0IGF0IDU6MDjigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IEtlcm5lbCB3aWxsIGhhdmUgdG8gcGVy
Zm9ybSBzaGFkb3cgc3RhY2sgb3BlcmF0aW9ucyBvbiB1c2VyIHNoYWRvdyBzdGFjay4KPj4gPj4g
TGlrZSBkdXJpbmcgc2lnbmFsIGRlbGl2ZXJ5IGFuZCBzaWdyZXR1cm4sIHNoYWRvdyBzdGFjayB0
b2tlbiBtdXN0IGJlCj4+ID4+IGNyZWF0ZWQgYW5kIHZhbGlkYXRlZCByZXNwZWN0aXZlbHkuIFRo
dXMgc2hhZG93IHN0YWNrIGFjY2VzcyBmb3Iga2VybmVsCj4+ID4+IG11c3QgYmUgZW5hYmxlZC4K
Pj4gPj4KPj4gPj4gSW4gZnV0dXJlIHdoZW4ga2VybmVsIHNoYWRvdyBzdGFja3MgYXJlIGVuYWJs
ZWQgZm9yIGxpbnV4IGtlcm5lbCwgaXQgbXVzdAo+PiA+PiBiZSBlbmFibGVkIGFzIGVhcmx5IGFz
IHBvc3NpYmxlIGZvciBiZXR0ZXIgY292ZXJhZ2UgYW5kIHByZXZlbnQgaW1iYWxhbmNlCj4+ID4+
IGJldHdlZW4gcmVndWxhciBzdGFjayBhbmQgc2hhZG93IHN0YWNrLiBBZnRlciBgcmVsb2NhdGVf
ZW5hYmxlX21tdWAgaGFzCj4+ID4+IGJlZW4gZG9uZSwgdGhpcyBpcyBhcyBlYXJseSBhcyBwb3Nz
aWJsZSBpdCBjYW4gZW5hYmxlZC4KPj4gPj4KPj4gPj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1
cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4+ID4+IC0tLQo+PiA+PiAgYXJjaC9yaXNjdi9rZXJu
ZWwvYXNtLW9mZnNldHMuYyB8ICA0ICsrKysKPj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQu
UyAgICAgICAgfCAxMiArKysrKysrKysrKysKPj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQo+PiA+Pgo+PiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNt
LW9mZnNldHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPj4gPj4gaW5kZXgg
NzY2YmQzM2YxMGNiLi5hMjJhYjhhNDE2NzIgMTAwNjQ0Cj4+ID4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2FzbS1vZmZzZXRzLmMKPj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9m
ZnNldHMuYwo+PiA+PiBAQCAtNTE3LDQgKzUxNyw4IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkK
Pj4gPj4gICAgICAgICBERUZJTkUoRlJFR1NfQTYsICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0
IGZ0cmFjZV9yZWdzLCBhNikpOwo+PiA+PiAgICAgICAgIERFRklORShGUkVHU19BNywgICAgICAg
ICAgICBvZmZzZXRvZihzdHJ1Y3QgZnRyYWNlX3JlZ3MsIGE3KSk7Cj4+ID4+ICAjZW5kaWYKPj4g
Pj4gKyAgICAgICBERUZJTkUoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlQpOwo+PiA+PiArICAg
ICAgIERFRklORShTQklfRVhUX0ZXRlRfU0VULCBTQklfRVhUX0ZXRlRfU0VUKTsKPj4gPj4gKyAg
ICAgICBERUZJTkUoU0JJX0ZXRlRfU0hBRE9XX1NUQUNLLCBTQklfRldGVF9TSEFET1dfU1RBQ0sp
Owo+PiA+PiArICAgICAgIERFRklORShTQklfRldGVF9TRVRfRkxBR19MT0NLLCBTQklfRldGVF9T
RVRfRkxBR19MT0NLKTsKPj4gPj4gIH0KPj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiA+PiBpbmRleCAzNTZkNTM5
N2IyYTIuLjYyNDQ0MDhjYTkxNyAxMDA2NDQKPj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
aGVhZC5TCj4+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiA+PiBAQCAtMTY0
LDYgKzE2NCwxMiBAQCBzZWNvbmRhcnlfc3RhcnRfc2JpOgo+PiA+PiAgICAgICAgIGNhbGwgcmVs
b2NhdGVfZW5hYmxlX21tdQo+PiA+PiAgI2VuZGlmCj4+ID4+ICAgICAgICAgY2FsbCAuTHNldHVw
X3RyYXBfdmVjdG9yCj4+ID4+ICsgICAgICAgbGkgYTcsIFNCSV9FWFRfRldGVAo+PiA+PiArICAg
ICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4+ID4+ICsgICAgICAgbGkgYTAsIFNCSV9GV0ZU
X1NIQURPV19TVEFDSwo+PiA+PiArICAgICAgIGxpIGExLCAxIC8qIGVuYWJsZSBzdXBlcnZpc29y
IHRvIGFjY2VzcyBzaGFkb3cgc3RhY2sgYWNjZXNzICovCj4+ID4+ICsgICAgICAgbGkgYTIsIFNC
SV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPj4gPj4gKyAgICAgICBlY2FsbAo+PiA+PiAgICAgICAgIHNj
c19sb2FkX2N1cnJlbnQKPj4gPj4gICAgICAgICBjYWxsIHNtcF9jYWxsaW4KPj4gPj4gICNlbmRp
ZiAvKiBDT05GSUdfU01QICovCj4+ID4+IEBAIC0zMjAsNiArMzI2LDEyIEBAIFNZTV9DT0RFX1NU
QVJUKF9zdGFydF9rZXJuZWwpCj4+ID4+ICAgICAgICAgbGEgdHAsIGluaXRfdGFzawo+PiA+PiAg
ICAgICAgIGxhIHNwLCBpbml0X3RocmVhZF91bmlvbiArIFRIUkVBRF9TSVpFCj4+ID4+ICAgICAg
ICAgYWRkaSBzcCwgc3AsIC1QVF9TSVpFX09OX1NUQUNLCj4+ID4+ICsgICAgICAgbGkgYTcsIFNC
SV9FWFRfRldGVAo+PiA+PiArICAgICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4+ID4+ICsg
ICAgICAgbGkgYTAsIFNCSV9GV0ZUX1NIQURPV19TVEFDSwo+PiA+PiArICAgICAgIGxpIGExLCAx
IC8qIGVuYWJsZSBzdXBlcnZpc29yIHRvIGFjY2VzcyBzaGFkb3cgc3RhY2sgYWNjZXNzICovCj4+
ID4+ICsgICAgICAgbGkgYTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPj4gPj4gKyAgICAgICBl
Y2FsbAo+PiA+PiAgICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPj4gPj4KPj4gPj4gICNpZmRlZiBD
T05GSUdfS0FTQU4KPj4gPj4KPj4gPj4gLS0KPj4gPj4gMi40NS4wCj4+ID4+Cj4+ID5TaG91bGQg
d2UgY2xlYXIgdGhlIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sgYmVmb3JlIHRoZSBjcHUgaG90cGx1
Zwo+PiA+b3RoZXJ3aXNlIHRoZSBtZW52Y2ZnLnNzZSB3b24ndCBiZSBzZXQgYnkgdGhlIGZ3ZnQg
c2V0IHNiaSBjYWxsIHdoZW4KPj4gPnRoZSBob3RwbHVnIGNwdSBiYWNrIHRvIGtlcm5lbD8KPj4K
Pj4gSG1tLi4uCj4+Cj4+IEFuIGluY29taW5nIGhvdHBsdWcgQ1BVIGhhcyBubyBmZWF0dXJlcyBz
ZXR1cCBvbiBpdC4KPj4gSSBzZWUgdGhhdCBgc2JpX2NwdV9zdGFydGAgd2lsbCBzdXBwbHkgYHNl
Y29uZGFyeV9zdGFydF9zYmlgIGFzIHN0YXJ0Cj4+IHVwIGNvZGUgZm9yIGluY29taW5nIENQVS4g
YHNlY29uZGFyeV9zdGFydF9zYmlgIGlzIGluIGhlYWQuUyB3aGljaCBjb252ZXJnZXMKPj4gaW4g
YC5Mc2Vjb25kYXJ5X3N0YXJ0X2NvbW1vbmAuIEFuZCB0aHVzIGhvdHBsdWdnZWQgQ1BVIHNob3Vs
ZCBiZQo+PiBpc3N1aW5nIHNoYWRvdyBzdGFjayBzZXQgRldGVCBzYmkgYXMgd2VsbC4KPj4KPj4g
QW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/Cj4+Cj5UaGlzIGlzIHRoZSBjb3JyZWN0IGZsb3cuIEhv
d2V2ZXIgdGhlIG9wZW5zYmkgd2lsbCBkZW55IGl0IGR1ZSB0byB0aGUKPlNCSV9GV0ZUX1NFVF9G
TEFHX0xPQ0sgYWxyZWFkeSBiZWluZyBzZXQuCj5TbyB0aGUgbWVudmNmZy5zc2Ugd2lsbCBub3Qg
c2V0IGJ5IHRoaXMgZmxvdy4KPgo+aWYgKGNvbmYtPmZsYWdzICYgU0JJX0ZXRlRfU0VUX0ZMQUdf
TE9DSykKPiAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VERU5JRUQ7Cj4KCmhtbS4uLiBXaHk/
CgpgY29uZmAgaXMgcG9pbnRpbmcgdG8gcGVyLWhhcnQgc3RhdGUgaW4gZmlybXdhcmUuCgpPbiB0
aGlzIGluY29taW5nIGNwdSwgb3BlbnNiaSAob3IgZXF1aXZhbGVudCkgZmlybXdhcmUgbXVzdCBo
YXZlCmVuc3VyZWQgdGhhdCB0aGlzIHBlci1oYXJ0IHN0YXRlIGRvZXNuJ3QgaGF2ZSBsb2NrIHNl
dC4KCkFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cgo+UmVnYXJkcywKPk5pY2sKPj4gPgo+PiA+UmVn
YXJkcywKPj4gPk5pY2sKPj4gPj4KPj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+ID4+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
