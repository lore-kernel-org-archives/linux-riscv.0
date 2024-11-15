Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB676D6DDC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju4rKEkYiWN8vokTXwvfliaN018fY6Vgkq4LzAuU0Gs=; b=2LX1HBPfKE3UIC
	b3AddmAIzWS/YcSjAm7Bp4Riiry85FfT2DtrdZ+E4MvBPNzXEcWKoGdjS1hypL2SE0lI8DoSJYuMX
	aNNgiUyvp9kA+KVRECfqys1hZZxFpYAFPCcH6GnPlM/PDegQMMyVoYSWtX/wgwKrnk/k6xYI8Qc6R
	jGjleIV4yGvEkuQ+bnjDKwr2hR7vz0oJKr6w3coehl/LiXBNTfxdWpOI4YTXZ9gSNgGffAgQQC4bR
	tDfRsFJXRuRDizIK0YTvbnrAFl2dWVdEjUbcAlZWBJvV7rsoeEmZdsdRRZgdRLk2MUsYUCo5qO7NO
	++JvxNztGjZx7HtrE7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmsD-00000001Sr3-2yea;
	Fri, 15 Nov 2024 03:19:53 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmsB-00000001SqM-2kt8
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 03:19:52 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5ee9e209bb6so698567eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 19:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731640790; x=1732245590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wHT7UOLhFt9tb7tI16LMGdFlLAI81aR1dzrwfzW0EI=;
        b=DAnrqN3XGMcjlFagKnDk5X97oUKC5W0zdt28mr2uqZfJpC/66DqjO6aNi1rf4vJZ8E
         Kkrg0U+qUThsISBlaLvAFBSvRC34M769Zlg/+6/IEk+x/I/ckLfEWSspmQY5QLzN9BHO
         fnIe1gOpAeN0272w+aY7ECDVgSEMgUDbzZ7i/gbNCEsyfYGjf0hShOAHZTzLBpz8FuiL
         4eVN98MhwQ7wMH7U8A3p9LwKplFGKc46lfnVGvoh2bDupgopweMc0erSF41ih1ZdbWou
         GPdd45xojNC4YfJF1WiOsCCXbKLrGCxrdX/lNxbIABZzQ1y3l5Pt+zNt7W4iwVjtAzI6
         DLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731640790; x=1732245590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wHT7UOLhFt9tb7tI16LMGdFlLAI81aR1dzrwfzW0EI=;
        b=h4XczBDcDCtZOa7OTkfU4QeiscsvtPap/Jt80xyfG6eReXsog3w2cOI0IUL+2usnk7
         W5d9VzTtGd5mON1ZcOBveKnpgF+7AyAFd1ASRbMDtDANHNXNqxZ8veDgEKhxh6i+iTmq
         odgnNx+X/ls3HdgEB8Gkv5fOMtzGmaJpZeQgEspa4R98I7Qgn8w/n+73YTun1Ng2580w
         dpF0lNCbC6d6kFeegj0GkEQqWI09ZrGIHkpVLuKamKv6cDKkq9UTT1rP+ZY4kjAV7NTS
         Y/DSLt+h9hhm6gvCpN0Kl2jbmo5PcUelYGE83slxiWLSeuvPOzIQiYHvcu7OeInjhT3K
         ELqw==
X-Forwarded-Encrypted: i=1; AJvYcCXOF4WhsDxm2WV4B0/2XL04IjrSm35x7QcjYz0xSW6l6BqGrdaFByTl7T518t3zUgJntBHW1ulaFBB3fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylJLsVXqAUrvetvfSEf3KiI8c+wzpkAehZgLtPiEzGJUjYS1Uv
	Wk8s3m++Ud6wwe3peDOggoRdbM8cRRTAaUYeIlPvsMd6/kwmqgveryeURGIJzxN4dQ7hH6v9eh0
	mkv9a0gt3Me3mwNEqsFBdQ4MGwzIfKav1+z3LDw==
X-Google-Smtp-Source: AGHT+IHz3zxPQbbbUsepKHUF1uUsADOynrdvoPD0uimJS+ZQZoflzX/TbG/ec+1dOiYfpEXSQ93zscANzNpMS8LAAoQ=
X-Received: by 2002:a05:6870:4d1a:b0:261:b48:3c99 with SMTP id
 586e51a60fabf-2962dddcaa4mr1182864fac.23.1731640790020; Thu, 14 Nov 2024
 19:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
 <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com> <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
 <ZzVRbCZP9N4Os8Bj@debug.ba.rivosinc.com> <CAKddAkBCByf570PXfz798FtBbeGQWe2LJpdzxkE+jv3Zd3ZV1w@mail.gmail.com>
 <ZzYcVW/4M0jab1T4@debug.ba.rivosinc.com>
In-Reply-To: <ZzYcVW/4M0jab1T4@debug.ba.rivosinc.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 15 Nov 2024 11:19:39 +0800
Message-ID: <CAKddAkA7X7WeT8Fn6BdEij8sfHvd9cAJWf+8vJAQ95jn70F1Ug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241114_191951_729263_B4929A22 
X-CRM114-Status: GOOD (  26.99  )
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

SGkgRGVlcGFrCgpPbiBUaHUsIE5vdiAxNCwgMjAyNCBhdCAxMTo1MOKAr1BNIERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+Cj4gSGkgTmljaywKPgo+IFRoYW5rcyBm
b3IgcmV2aWV3aW5nIGFuZCBoZWxwaW5nLgo+Cj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDI6
MTc6MzBQTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+SGkgRGVlcGFrCj4gPgo+ID5PbiBUaHUs
IE5vdiAxNCwgMjAyNCBhdCA5OjI14oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDk6MjA6MTRBTSAr
MDgwMCwgTmljayBIdSB3cm90ZToKPiA+PiA+SGkgRGVlcGFrCj4gPj4gPgo+ID4+ID5PbiBUaHUs
IE5vdiAxNCwgMjAyNCBhdCA5OjA24oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4+ID4+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFk
LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+PiA+PiA+PiBpbmRleCAzNTZkNTM5N2Iy
YTIuLjYyNDQ0MDhjYTkxNyAxMDA2NDQKPiA+PiA+PiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9oZWFkLlMKPiA+PiA+PiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+PiA+
PiA+PiBAQCAtMTY0LDYgKzE2NCwxMiBAQCBzZWNvbmRhcnlfc3RhcnRfc2JpOgo+ID4+ID4+ID4+
ICAgICAgICAgY2FsbCByZWxvY2F0ZV9lbmFibGVfbW11Cj4gPj4gPj4gPj4gICNlbmRpZgo+ID4+
ID4+ID4+ICAgICAgICAgY2FsbCAuTHNldHVwX3RyYXBfdmVjdG9yCj4gPj4gPj4gPj4gKyAgICAg
ICBsaSBhNywgU0JJX0VYVF9GV0ZUCj4gPj4gPj4gPj4gKyAgICAgICBsaSBhNiwgU0JJX0VYVF9G
V0ZUX1NFVAo+ID4+ID4+ID4+ICsgICAgICAgbGkgYTAsIFNCSV9GV0ZUX1NIQURPV19TVEFDSwo+
ID4+ID4+ID4+ICsgICAgICAgbGkgYTEsIDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8gYWNjZXNz
IHNoYWRvdyBzdGFjayBhY2Nlc3MgKi8KPiA+PiA+PiA+PiArICAgICAgIGxpIGEyLCBTQklfRldG
VF9TRVRfRkxBR19MT0NLCj4gPj4gPj4gPj4gKyAgICAgICBlY2FsbAo+ID4+ID4+ID4+ICAgICAg
ICAgc2NzX2xvYWRfY3VycmVudAo+ID4+ID4+ID4+ICAgICAgICAgY2FsbCBzbXBfY2FsbGluCj4g
Pj4gPj4gPj4gICNlbmRpZiAvKiBDT05GSUdfU01QICovCj4gPj4gPj4gPj4gQEAgLTMyMCw2ICsz
MjYsMTIgQEAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5lbCkKPiA+PiA+PiA+PiAgICAgICAg
IGxhIHRwLCBpbml0X3Rhc2sKPiA+PiA+PiA+PiAgICAgICAgIGxhIHNwLCBpbml0X3RocmVhZF91
bmlvbiArIFRIUkVBRF9TSVpFCj4gPj4gPj4gPj4gICAgICAgICBhZGRpIHNwLCBzcCwgLVBUX1NJ
WkVfT05fU1RBQ0sKPiA+PiA+PiA+PiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZXRlQKPiA+PiA+
PiA+PiArICAgICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4gPj4gPj4gPj4gKyAgICAgICBs
aSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4gPj4gPj4gPj4gKyAgICAgICBsaSBhMSwgMSAv
KiBlbmFibGUgc3VwZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93IHN0YWNrIGFjY2VzcyAqLwo+ID4+
ID4+ID4+ICsgICAgICAgbGkgYTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPiA+PiA+PiA+PiAr
ICAgICAgIGVjYWxsCj4gPj4gPj4gPj4gICAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4gPj4gPj4g
Pj4KPiA+PiA+PiA+PiAgI2lmZGVmIENPTkZJR19LQVNBTgo+ID4+ID4+ID4+Cj4gPj4gPj4gPj4g
LS0KPiA+PiA+PiA+PiAyLjQ1LjAKPiA+PiA+PiA+Pgo+ID4+ID4+ID5TaG91bGQgd2UgY2xlYXIg
dGhlIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sgYmVmb3JlIHRoZSBjcHUgaG90cGx1Zwo+ID4+ID4+
ID5vdGhlcndpc2UgdGhlIG1lbnZjZmcuc3NlIHdvbid0IGJlIHNldCBieSB0aGUgZndmdCBzZXQg
c2JpIGNhbGwgd2hlbgo+ID4+ID4+ID50aGUgaG90cGx1ZyBjcHUgYmFjayB0byBrZXJuZWw/Cj4g
Pj4gPj4KPiA+PiA+PiBIbW0uLi4KPiA+PiA+Pgo+ID4+ID4+IEFuIGluY29taW5nIGhvdHBsdWcg
Q1BVIGhhcyBubyBmZWF0dXJlcyBzZXR1cCBvbiBpdC4KPiA+PiA+PiBJIHNlZSB0aGF0IGBzYmlf
Y3B1X3N0YXJ0YCB3aWxsIHN1cHBseSBgc2Vjb25kYXJ5X3N0YXJ0X3NiaWAgYXMgc3RhcnQKPiA+
PiA+PiB1cCBjb2RlIGZvciBpbmNvbWluZyBDUFUuIGBzZWNvbmRhcnlfc3RhcnRfc2JpYCBpcyBp
biBoZWFkLlMgd2hpY2ggY29udmVyZ2VzCj4gPj4gPj4gaW4gYC5Mc2Vjb25kYXJ5X3N0YXJ0X2Nv
bW1vbmAuIEFuZCB0aHVzIGhvdHBsdWdnZWQgQ1BVIHNob3VsZCBiZQo+ID4+ID4+IGlzc3Vpbmcg
c2hhZG93IHN0YWNrIHNldCBGV0ZUIHNiaSBhcyB3ZWxsLgo+ID4+ID4+Cj4gPj4gPj4gQW0gSSBt
aXNzaW5nIHNvbWV0aGluZyA/Cj4gPj4gPj4KPiA+PiA+VGhpcyBpcyB0aGUgY29ycmVjdCBmbG93
LiBIb3dldmVyIHRoZSBvcGVuc2JpIHdpbGwgZGVueSBpdCBkdWUgdG8gdGhlCj4gPj4gPlNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0sgYWxyZWFkeSBiZWluZyBzZXQuCj4gPj4gPlNvIHRoZSBtZW52Y2Zn
LnNzZSB3aWxsIG5vdCBzZXQgYnkgdGhpcyBmbG93Lgo+ID4+ID4KPiA+PiA+aWYgKGNvbmYtPmZs
YWdzICYgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSykKPiA+PiA+ICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRURFTklFRDsKPiA+PiA+Cj4gPj4KPiA+PiBobW0uLi4gV2h5Pwo+ID4+Cj4gPj4gYGNv
bmZgIGlzIHBvaW50aW5nIHRvIHBlci1oYXJ0IHN0YXRlIGluIGZpcm13YXJlLgo+ID4+Cj4gPj4g
T24gdGhpcyBpbmNvbWluZyBjcHUsIG9wZW5zYmkgKG9yIGVxdWl2YWxlbnQpIGZpcm13YXJlIG11
c3QgaGF2ZQo+ID4+IGVuc3VyZWQgdGhhdCB0aGlzIHBlci1oYXJ0IHN0YXRlIGRvZXNuJ3QgaGF2
ZSBsb2NrIHNldC4KPiA+Pgo+ID4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gPj4KPiA+Q3Vy
cmVudCBPcGVuU0JJIGRvZXNuJ3QgY2xlYXIgdGhlIGxvY2sgaW4gdGhlIHdhcm0gaW5pdCBvZiB0
aGUgaG90cGx1ZyBwYXRoLgo+ID5JdCBzZWVtcyBsaWtlIHdlIG5lZWQgYSBwYXRjaCB0byBhZGRy
ZXNzIGl0Lgo+Cj4gR290IGl0IHRoYW5rcy4KPiBTaW5jZSB5b3UgYWxyZWFkeSBrbm93IHdoYXQn
cyB0aGUgcHJvYmxlbSwgY2FuIHlvdSBzZW5kIGEgcGF0Y2ggdG8gb3BlbnNiaS4KPiBJZiB5b3Ug
d2FudCByYXRoZXIgaGF2ZSBtZSBkbyBpdCwgbGV0IG1lIGtub3cuIFRoYW5rcy4KPgpObyBwcm9i
bGVtLiBJJ2xsIHNlbmQgYSBwYXRjaCB0byBvcGVuc2JpLgoKUmVnYXJkcywKTmljawo+ID4KPiA+
UmVnYXJkcywKPiA+Tmljawo+ID4+ID5SZWdhcmRzLAo+ID4+ID5OaWNrCj4gPj4gPj4gPgo+ID4+
ID4+ID5SZWdhcmRzLAo+ID4+ID4+ID5OaWNrCj4gPj4gPj4gPj4KPiA+PiA+PiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+ID4+ID4+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+ID4+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+PiA+PiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
