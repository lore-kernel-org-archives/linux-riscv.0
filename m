Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B26BD462D0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wysTS2O01s3A75bazGvzDBzWC9jV/XCvMsEQtmRSykI=; b=jXb6BYwWsrLs73
	2uxqYf59arAxmU4OaP6+EUJVShFpwpWaUqeBzou0z2h5/4bRjCdbAFTZMHsqtP+fBrxrBICx+AYUG
	oklBC/SbC3SnyuYfLd7PXy2PzMh4sy/eTOrKem95HMcAGRCv+140JrwuhlwEcDpMGWuOBz/ExejUZ
	QhJcxUwZvh1sjh9kqolOAF+ThvW1pZC5W8NzCPfj0nCEKft5Npv2HMt/aFFdoz1b7SA7jgyR7Qx8v
	sAnb1OslQtvJa8DYdbJHGvth6C4Y5kMy8CIYrzcyNWdhV8ndLD8BnEnkG2bvA+JSCOPr6nTbU2XI7
	AYqy02apqd8uXNo/ynvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBG0A-00000007PtZ-3eQb;
	Wed, 13 Nov 2024 16:13:54 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBG07-00000007PsY-2Z6r
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 16:13:53 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5ee8eaa1694so942717eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1731514429; x=1732119229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4CnOM9V0G25evq0IkfWx5gKqtwex3+JBvT1EkxAWJE=;
        b=UpLub6lB4tC5dC6RSU9WxQAGPDKdC0vbsi4BcrgkfpcM1M6KCZSLOV820fd2sK88dA
         sAK6zxsBVKn3X4nv8CLsCi+c1mPf98yLiQDhlkvPPqBFx90TGzgGVabU8ZQf1EEmAyS0
         hLhPT6+SRnh2zy3WSif+Zy0InIija59jgn9mK4C2k+R1bqd4j56ei/+S1phxF0Cj1fIF
         Q+guCZc0lKJR574FA0d4k3lqhqfOQa/M8krJv1Y1H0sROF6qTYPsw6qwSnKky6uG5qbu
         BD/oalz0yKMHWEgQVGRxgzQio0Us2E++bfdOrls4YndWl9feOmcKGwTJ35UiT0doi5k2
         jHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731514429; x=1732119229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4CnOM9V0G25evq0IkfWx5gKqtwex3+JBvT1EkxAWJE=;
        b=hDMLgtMqfgzfWwYSLQ0rcT06ojmq4iv13U7HyiVFFMR7HGKjaSWahJPBdFJMVWPU7r
         OdC06nYBXqKkyrep0kbycQ2Ve7+XhEYRMetoQWs3qbT62Kg7oWqSo1F6qYariWWrFBRb
         yRNDhkkyLx2htss8X+Eq1iSbNrMJNMNJI+gypzcamyccunr+jl7z6yGu25hd8L1CZkGi
         hBDzgpwNp4QZ9PZCR79liLPV6H0vicr9IbQ5NNGAlD0rClUGpFAfU5MpUXJQz/QMggaT
         v8yLnQQzW7DCiReKYYWbFtu7lJVKgN73wTFeiQSjB3q1Ih8HwS2RVOLbV3zyKUNBkCal
         U3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXALHP4EQs3grtAnhsuUnRrpddgz3kdKeRZMYZy39kh/lUocMxzTi85oRIFBZa1VcKEmrz/LcwDjXwWSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo7vFGVfEuQGUEKi9CUUCwyQwzhiGbGadW/zNKUUmlAt3YwJP7
	nvTWGe3r5NrjfbPTxZYK+Jkg/lvd+kMalxHaqEG2MY3vkptOelYOqc45UBLgng2etO77sXQlpej
	HANcm844jPXVqgllS4ZIo5iAljYIAQNmiOi6Lsg==
X-Google-Smtp-Source: AGHT+IGDFpRJff+OKPz21HLMWXvGQyDkqQzC8F4K0hofednOGXa7SW/5Crlgs/h6Bl5IR8Aw+zrRHhGFgVmxSg02ZdY=
X-Received: by 2002:a05:6820:1805:b0:5eb:c72e:e29c with SMTP id
 006d021491bc7-5ee86a500a2mr5293321eaf.8.1731514429462; Wed, 13 Nov 2024
 08:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com> <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 14 Nov 2024 00:13:38 +0800
Message-ID: <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241113_081351_708526_410AEE5F 
X-CRM114-Status: GOOD (  18.78  )
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

SGkgRGVlcGFrCgpPbiBUdWUsIE5vdiAxMiwgMjAyNCBhdCA1OjA44oCvQU0gRGVlcGFrIEd1cHRh
IDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gS2VybmVsIHdpbGwgaGF2ZSB0byBwZXJm
b3JtIHNoYWRvdyBzdGFjayBvcGVyYXRpb25zIG9uIHVzZXIgc2hhZG93IHN0YWNrLgo+IExpa2Ug
ZHVyaW5nIHNpZ25hbCBkZWxpdmVyeSBhbmQgc2lncmV0dXJuLCBzaGFkb3cgc3RhY2sgdG9rZW4g
bXVzdCBiZQo+IGNyZWF0ZWQgYW5kIHZhbGlkYXRlZCByZXNwZWN0aXZlbHkuIFRodXMgc2hhZG93
IHN0YWNrIGFjY2VzcyBmb3Iga2VybmVsCj4gbXVzdCBiZSBlbmFibGVkLgo+Cj4gSW4gZnV0dXJl
IHdoZW4ga2VybmVsIHNoYWRvdyBzdGFja3MgYXJlIGVuYWJsZWQgZm9yIGxpbnV4IGtlcm5lbCwg
aXQgbXVzdAo+IGJlIGVuYWJsZWQgYXMgZWFybHkgYXMgcG9zc2libGUgZm9yIGJldHRlciBjb3Zl
cmFnZSBhbmQgcHJldmVudCBpbWJhbGFuY2UKPiBiZXR3ZWVuIHJlZ3VsYXIgc3RhY2sgYW5kIHNo
YWRvdyBzdGFjay4gQWZ0ZXIgYHJlbG9jYXRlX2VuYWJsZV9tbXVgIGhhcwo+IGJlZW4gZG9uZSwg
dGhpcyBpcyBhcyBlYXJseSBhcyBwb3NzaWJsZSBpdCBjYW4gZW5hYmxlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9o
ZWFkLlMgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4gaW5kZXggNzY2YmQzM2YxMGNi
Li5hMjJhYjhhNDE2NzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNl
dHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiBAQCAtNTE3LDQg
KzUxNyw4IEBAIHZvaWQgYXNtX29mZnNldHModm9pZCkKPiAgICAgICAgIERFRklORShGUkVHU19B
NiwgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgZnRyYWNlX3JlZ3MsIGE2KSk7Cj4gICAgICAg
ICBERUZJTkUoRlJFR1NfQTcsICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IGZ0cmFjZV9yZWdz
LCBhNykpOwo+ICAjZW5kaWYKPiArICAgICAgIERFRklORShTQklfRVhUX0ZXRlQsIFNCSV9FWFRf
RldGVCk7Cj4gKyAgICAgICBERUZJTkUoU0JJX0VYVF9GV0ZUX1NFVCwgU0JJX0VYVF9GV0ZUX1NF
VCk7Cj4gKyAgICAgICBERUZJTkUoU0JJX0ZXRlRfU0hBRE9XX1NUQUNLLCBTQklfRldGVF9TSEFE
T1dfU1RBQ0spOwo+ICsgICAgICAgREVGSU5FKFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0ssIFNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0spOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IGluZGV4IDM1NmQ1Mzk3YjJhMi4u
NjI0NDQwOGNhOTE3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IEBAIC0xNjQsNiArMTY0LDEyIEBAIHNlY29u
ZGFyeV9zdGFydF9zYmk6Cj4gICAgICAgICBjYWxsIHJlbG9jYXRlX2VuYWJsZV9tbXUKPiAgI2Vu
ZGlmCj4gICAgICAgICBjYWxsIC5Mc2V0dXBfdHJhcF92ZWN0b3IKPiArICAgICAgIGxpIGE3LCBT
QklfRVhUX0ZXRlQKPiArICAgICAgIGxpIGE2LCBTQklfRVhUX0ZXRlRfU0VUCj4gKyAgICAgICBs
aSBhMCwgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCj4gKyAgICAgICBsaSBhMSwgMSAvKiBlbmFibGUg
c3VwZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93IHN0YWNrIGFjY2VzcyAqLwo+ICsgICAgICAgbGkg
YTIsIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sKPiArICAgICAgIGVjYWxsCj4gICAgICAgICBzY3Nf
bG9hZF9jdXJyZW50Cj4gICAgICAgICBjYWxsIHNtcF9jYWxsaW4KPiAgI2VuZGlmIC8qIENPTkZJ
R19TTVAgKi8KPiBAQCAtMzIwLDYgKzMyNiwxMiBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2Vy
bmVsKQo+ICAgICAgICAgbGEgdHAsIGluaXRfdGFzawo+ICAgICAgICAgbGEgc3AsIGluaXRfdGhy
ZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUKPiAgICAgICAgIGFkZGkgc3AsIHNwLCAtUFRfU0laRV9P
Tl9TVEFDSwo+ICsgICAgICAgbGkgYTcsIFNCSV9FWFRfRldGVAo+ICsgICAgICAgbGkgYTYsIFNC
SV9FWFRfRldGVF9TRVQKPiArICAgICAgIGxpIGEwLCBTQklfRldGVF9TSEFET1dfU1RBQ0sKPiAr
ICAgICAgIGxpIGExLCAxIC8qIGVuYWJsZSBzdXBlcnZpc29yIHRvIGFjY2VzcyBzaGFkb3cgc3Rh
Y2sgYWNjZXNzICovCj4gKyAgICAgICBsaSBhMiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+ICsg
ICAgICAgZWNhbGwKPiAgICAgICAgIHNjc19sb2FkX2N1cnJlbnQKPgo+ICAjaWZkZWYgQ09ORklH
X0tBU0FOCj4KPiAtLQo+IDIuNDUuMAo+ClNob3VsZCB3ZSBjbGVhciB0aGUgU0JJX0ZXRlRfU0VU
X0ZMQUdfTE9DSyBiZWZvcmUgdGhlIGNwdSBob3RwbHVnCm90aGVyd2lzZSB0aGUgbWVudmNmZy5z
c2Ugd29uJ3QgYmUgc2V0IGJ5IHRoZSBmd2Z0IHNldCBzYmkgY2FsbCB3aGVuCnRoZSBob3RwbHVn
IGNwdSBiYWNrIHRvIGtlcm5lbD8KClJlZ2FyZHMsCk5pY2sKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
