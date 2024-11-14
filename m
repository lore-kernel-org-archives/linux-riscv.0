Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2A8D637CF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aM/Ox9OcIBbtCO4OkYZkUjcnsJ+FL5eI7cb/D3KdZik=; b=0yVtBLw5a1vHer
	v1yFZQubu0mBtUs8e5hQJlKRLfWYFnXarf6ZnqVTb8UmXwPRDAOS6g+knu2yEC7L1YcUI+H1eSc6x
	5h+yKsVDbabs4UMTBLnuVinxbJTEYFGcEaSBktT1XER10Zj7+H8xyCu0kh4hU9tztrvnFBDKz+Cmk
	Pjyu5QMf1T2MyucEhbOS5RnNNFg02PjUb3++DkrIQTaV2YANGH9OxYcYXW+XbNczrefxxnI/3TgiS
	gGJWViGunYbiK2PCuv/NUXwWjUtXw37SXgbe1HyQVmycOKDjA/bBq1+JqTl19knm/TFrivX06tk4J
	1KTt0eSwN3ZsTC9uet3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOYg-00000008QO5-4290;
	Thu, 14 Nov 2024 01:22:06 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOX5-00000008QA1-2tYs
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 01:20:29 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-296085d59caso48427fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 17:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731547226; x=1732152026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEwME0rw8Umq6ByU2WCdJWTmv3KeHZlgw9873wiLpdQ=;
        b=VahUHpQkPsNAU51OfrpEeG10NsXD43LQuS6SZ403QZs9hKBp5grkOzAu24X7Nn6PX1
         /8nWPdnhf/H/DBEO5bD4c+S3dSbgBNCBeqx6f2it3tmS79pfDe03RMInOvSwPSWlbwdM
         XHJV25ss5ZTVfgefB3rav5PkOYblWK6Bb4S4Vk9JNGeEWERQEqCgDiT1GVgbj8LP41W3
         Tr3NcDgu1lc5O5vvvRHL+kQGN/ey9AWqHsBYBJRE49N9dS+xWUp0op1/S1inpP51SOmS
         S+scAoqUZXfvfZUks++8Y+cwjjm1GPVo03nV+ksc4hcXua8LyhzI07nuKZ+ERGt+Ocat
         Q/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731547226; x=1732152026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEwME0rw8Umq6ByU2WCdJWTmv3KeHZlgw9873wiLpdQ=;
        b=I9PfD60Qsar3QbMIlIvXDXi2NfjsR2c6W/tpa2GSYsHJU46X6Qy3uhE4zn63loWIaf
         2he5svCcsu6gBpJJ9S1tFeUjhX7kLGhpLaZDW6ydmkF7ddVRUfmEJ48sUiqj3An7J7tL
         E8AV5xiQOV70zPzO5HABD/TvCZviv4vRQI83jQcNC+szA0vGikBjejJAmnZ/dJooeGxq
         PNOqre4GYvRy/8t4MJAs+JdEIEQ3BqcBawfwVlSB6C05fgfuGmrGPiyYYO4sFzavJGRr
         +XSGNQfUR+mMfx/86mxfIieRuTltoQTeFHrFyXH5/RQ6DCicVX4zxpaA+hB4dhJnAOgC
         ubMg==
X-Forwarded-Encrypted: i=1; AJvYcCVU/G0OQSH9HcMxGYbmDQyUwYBtURXvN/Z1DZpJnpeWuwArjY03HY/cRKA1L1YSUzxa8918PJ7zlqFbbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/LDoCneUKL5xZmqVUPaJLhBV8hHS8lnaOMFN+LOziMNu3ixTi
	qHc0lp+28XztOTcdxCUsh6L2/7yJF+CmiWOlIjVloSrmory8qxniaKM0NNJW2QnBYJR/icOmT45
	Iq4zmBrQ1BoNDv3utpsLY89degjzjr57oLygyxA==
X-Google-Smtp-Source: AGHT+IEA0jv4B7iCg3zwq7SuzwM249FvuvavDHpayC9Iml6orm79ui/r12Xx7CfDO8cyCb2ZZ1C/3tpsPtuzZFHDjDU=
X-Received: by 2002:a05:6870:469e:b0:287:8706:ae3 with SMTP id
 586e51a60fabf-29560059eafmr20528628fac.11.1731547226302; Wed, 13 Nov 2024
 17:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com> <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
In-Reply-To: <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 14 Nov 2024 09:20:14 +0800
Message-ID: <CAKddAkDbGYeONaksq6fzLzx47BHZo3Ar7Sog3MOgf7Y+Birovw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241113_172028_017033_FAFB39BD 
X-CRM114-Status: GOOD (  24.53  )
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

SGkgRGVlcGFrCgpPbiBUaHUsIE5vdiAxNCwgMjAyNCBhdCA5OjA24oCvQU0gRGVlcGFrIEd1cHRh
IDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQg
MTI6MTM6MzhBTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+SGkgRGVlcGFrCj4gPgo+ID5PbiBU
dWUsIE5vdiAxMiwgMjAyNCBhdCA1OjA44oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gS2VybmVsIHdpbGwgaGF2ZSB0byBwZXJmb3JtIHNoYWRv
dyBzdGFjayBvcGVyYXRpb25zIG9uIHVzZXIgc2hhZG93IHN0YWNrLgo+ID4+IExpa2UgZHVyaW5n
IHNpZ25hbCBkZWxpdmVyeSBhbmQgc2lncmV0dXJuLCBzaGFkb3cgc3RhY2sgdG9rZW4gbXVzdCBi
ZQo+ID4+IGNyZWF0ZWQgYW5kIHZhbGlkYXRlZCByZXNwZWN0aXZlbHkuIFRodXMgc2hhZG93IHN0
YWNrIGFjY2VzcyBmb3Iga2VybmVsCj4gPj4gbXVzdCBiZSBlbmFibGVkLgo+ID4+Cj4gPj4gSW4g
ZnV0dXJlIHdoZW4ga2VybmVsIHNoYWRvdyBzdGFja3MgYXJlIGVuYWJsZWQgZm9yIGxpbnV4IGtl
cm5lbCwgaXQgbXVzdAo+ID4+IGJlIGVuYWJsZWQgYXMgZWFybHkgYXMgcG9zc2libGUgZm9yIGJl
dHRlciBjb3ZlcmFnZSBhbmQgcHJldmVudCBpbWJhbGFuY2UKPiA+PiBiZXR3ZWVuIHJlZ3VsYXIg
c3RhY2sgYW5kIHNoYWRvdyBzdGFjay4gQWZ0ZXIgYHJlbG9jYXRlX2VuYWJsZV9tbXVgIGhhcwo+
ID4+IGJlZW4gZG9uZSwgdGhpcyBpcyBhcyBlYXJseSBhcyBwb3NzaWJsZSBpdCBjYW4gZW5hYmxl
ZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMu
Y29tPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIHwgIDQg
KysrKwo+ID4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgICAgIHwgMTIgKysrKysrKysr
KysrCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9hc20tb2Zmc2V0cy5jCj4gPj4gaW5kZXggNzY2YmQzM2YxMGNiLi5hMjJhYjhhNDE2NzIg
MTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ID4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiA+PiBAQCAtNTE3LDQgKzUxNyw4
IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkKPiA+PiAgICAgICAgIERFRklORShGUkVHU19BNiwg
ICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgZnRyYWNlX3JlZ3MsIGE2KSk7Cj4gPj4gICAgICAg
ICBERUZJTkUoRlJFR1NfQTcsICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IGZ0cmFjZV9yZWdz
LCBhNykpOwo+ID4+ICAjZW5kaWYKPiA+PiArICAgICAgIERFRklORShTQklfRVhUX0ZXRlQsIFNC
SV9FWFRfRldGVCk7Cj4gPj4gKyAgICAgICBERUZJTkUoU0JJX0VYVF9GV0ZUX1NFVCwgU0JJX0VY
VF9GV0ZUX1NFVCk7Cj4gPj4gKyAgICAgICBERUZJTkUoU0JJX0ZXRlRfU0hBRE9XX1NUQUNLLCBT
QklfRldGVF9TSEFET1dfU1RBQ0spOwo+ID4+ICsgICAgICAgREVGSU5FKFNCSV9GV0ZUX1NFVF9G
TEFHX0xPQ0ssIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0spOwo+ID4+ICB9Cj4gPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+
ID4+IGluZGV4IDM1NmQ1Mzk3YjJhMi4uNjI0NDQwOGNhOTE3IDEwMDY0NAo+ID4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQu
Uwo+ID4+IEBAIC0xNjQsNiArMTY0LDEyIEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4gPj4gICAg
ICAgICBjYWxsIHJlbG9jYXRlX2VuYWJsZV9tbXUKPiA+PiAgI2VuZGlmCj4gPj4gICAgICAgICBj
YWxsIC5Mc2V0dXBfdHJhcF92ZWN0b3IKPiA+PiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZXRlQK
PiA+PiArICAgICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4gPj4gKyAgICAgICBsaSBhMCwg
U0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4gPj4gKyAgICAgICBsaSBhMSwgMSAvKiBlbmFibGUgc3Vw
ZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93IHN0YWNrIGFjY2VzcyAqLwo+ID4+ICsgICAgICAgbGkg
YTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPiA+PiArICAgICAgIGVjYWxsCj4gPj4gICAgICAg
ICBzY3NfbG9hZF9jdXJyZW50Cj4gPj4gICAgICAgICBjYWxsIHNtcF9jYWxsaW4KPiA+PiAgI2Vu
ZGlmIC8qIENPTkZJR19TTVAgKi8KPiA+PiBAQCAtMzIwLDYgKzMyNiwxMiBAQCBTWU1fQ09ERV9T
VEFSVChfc3RhcnRfa2VybmVsKQo+ID4+ICAgICAgICAgbGEgdHAsIGluaXRfdGFzawo+ID4+ICAg
ICAgICAgbGEgc3AsIGluaXRfdGhyZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUKPiA+PiAgICAgICAg
IGFkZGkgc3AsIHNwLCAtUFRfU0laRV9PTl9TVEFDSwo+ID4+ICsgICAgICAgbGkgYTcsIFNCSV9F
WFRfRldGVAo+ID4+ICsgICAgICAgbGkgYTYsIFNCSV9FWFRfRldGVF9TRVQKPiA+PiArICAgICAg
IGxpIGEwLCBTQklfRldGVF9TSEFET1dfU1RBQ0sKPiA+PiArICAgICAgIGxpIGExLCAxIC8qIGVu
YWJsZSBzdXBlcnZpc29yIHRvIGFjY2VzcyBzaGFkb3cgc3RhY2sgYWNjZXNzICovCj4gPj4gKyAg
ICAgICBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+ID4+ICsgICAgICAgZWNhbGwKPiA+
PiAgICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPiA+Pgo+ID4+ICAjaWZkZWYgQ09ORklHX0tBU0FO
Cj4gPj4KPiA+PiAtLQo+ID4+IDIuNDUuMAo+ID4+Cj4gPlNob3VsZCB3ZSBjbGVhciB0aGUgU0JJ
X0ZXRlRfU0VUX0ZMQUdfTE9DSyBiZWZvcmUgdGhlIGNwdSBob3RwbHVnCj4gPm90aGVyd2lzZSB0
aGUgbWVudmNmZy5zc2Ugd29uJ3QgYmUgc2V0IGJ5IHRoZSBmd2Z0IHNldCBzYmkgY2FsbCB3aGVu
Cj4gPnRoZSBob3RwbHVnIGNwdSBiYWNrIHRvIGtlcm5lbD8KPgo+IEhtbS4uLgo+Cj4gQW4gaW5j
b21pbmcgaG90cGx1ZyBDUFUgaGFzIG5vIGZlYXR1cmVzIHNldHVwIG9uIGl0Lgo+IEkgc2VlIHRo
YXQgYHNiaV9jcHVfc3RhcnRgIHdpbGwgc3VwcGx5IGBzZWNvbmRhcnlfc3RhcnRfc2JpYCBhcyBz
dGFydAo+IHVwIGNvZGUgZm9yIGluY29taW5nIENQVS4gYHNlY29uZGFyeV9zdGFydF9zYmlgIGlz
IGluIGhlYWQuUyB3aGljaCBjb252ZXJnZXMKPiBpbiBgLkxzZWNvbmRhcnlfc3RhcnRfY29tbW9u
YC4gQW5kIHRodXMgaG90cGx1Z2dlZCBDUFUgc2hvdWxkIGJlCj4gaXNzdWluZyBzaGFkb3cgc3Rh
Y2sgc2V0IEZXRlQgc2JpIGFzIHdlbGwuCj4KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8KPgpU
aGlzIGlzIHRoZSBjb3JyZWN0IGZsb3cuIEhvd2V2ZXIgdGhlIG9wZW5zYmkgd2lsbCBkZW55IGl0
IGR1ZSB0byB0aGUKU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyBhbHJlYWR5IGJlaW5nIHNldC4KU28g
dGhlIG1lbnZjZmcuc3NlIHdpbGwgbm90IHNldCBieSB0aGlzIGZsb3cuCgppZiAoY29uZi0+Zmxh
Z3MgJiBTQklfRldGVF9TRVRfRkxBR19MT0NLKQogICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9F
REVOSUVEOwoKUmVnYXJkcywKTmljawo+ID4KPiA+UmVnYXJkcywKPiA+Tmljawo+ID4+Cj4gPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
