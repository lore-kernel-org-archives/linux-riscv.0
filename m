Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEABC28B2F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJL8GATRFA6eAhiKPII234ADR82RodX5cl+Tf4t2IEg=; b=2KAgQr/XDKA7+F
	KVhf8IHiRjiajpNgrUqP8hHHdQ6V8g0msakWM694YPJoBxZ84ZBw78CAWAtXLw/vfDhlT+VBkNutK
	Y2Km6FWZSJVj/aHCjsFPPtQNz78+WnT1j8h1USHqjhkbkDH6GsJbhs46Gcuq86cBfItRiGzUku0uT
	hFOY5rg4zuFJh5WNuJ1SAGX9n+nj0VJk0D9nZP25rpKCoLMEK/hwIhJeSx5jr2Ls+raGNMwBHvHFb
	3N/7onhkLSMSyhFCPfvpAnyiAplBe4A+9EQ6Lk1+v8pO7D/7sQ8w02c5pNMW6AeYSfQtKWDjvRL13
	apwTfTxSayJmNfOV6blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzIW-00000000qXd-0aZJ;
	Mon, 17 Mar 2025 01:29:44 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzIT-00000000qWN-0Z9I
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 01:29:42 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85dd470597fso51584139f.2
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742174980; x=1742779780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXV1YPaItWH5GuExWu6nvtOdHmuNPHwz3fpSrmXloOk=;
        b=noSLJHx/SR7scllMJwNjuAI2tsfG4cqG/3rAF8In/zFBpItfGIhfnYfpBIk+X89LO9
         CRhouc9T3+lIfyFiR4KC3HuQ2aOStTUmb8UhxbCMiq8BvKwTBONaJKe4+rlE9jAfO/mU
         dxfSivsPQljXXga1gV6HHzY4WZ08+R/2svkDPezagK8OaYq5dvyj1jbHsoU5Rm5Zgvue
         DIKzBasTZtRaC5sHZJSeMsYhS2Dbcq2SXIXpUrvZEs3AjvOK1GDEzJ50zPcnLXsQpCEb
         IqIG2aCqaOzIqsDGU9UGuU1/tlXd4zkrszo2oP71uR+uO9Dp3q0NBvMSocXhbMNyfWlX
         7HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742174980; x=1742779780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXV1YPaItWH5GuExWu6nvtOdHmuNPHwz3fpSrmXloOk=;
        b=haW4PMmBQgC7qaorNkYU+Vlkljw+ENgJVWm0vqtiu7GVOzZTXezZ9+fuimQqVablXP
         VmsUnqO+eIP/C36Xs5Mhyj6gWnIJzDCZVJF0HD+jJVcsFECfTh7qbM6R4ek7gP1G7X5H
         wPl9Bc4tDmkRPzccgwf7Bsdr0sCrrpqasFGetGdQmFQ9vV4uxRS0KF8UulR8lQSh6yhI
         dwY0bPSXkp2zvKiOJoW/j171LsN7EHNVcrF8QBemaeJ2NUUMoaH1IC0FB/49ZJbVnuJS
         /CYDiXAaiOG1sTkFT7b5Gti9kBhT17Qmi/ijbIiOZ1rYePJNkW5sAgrlQiCttk8ptdmy
         iO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfg8xAJqat5MSZT/K5Dqqhln5QRlK2krvvi6/WQ90o6IKMkADro6iWUGlUCwLVIoQXdOdV/3yTfapO+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu0OWbgqAKzRiQGdXT0G6R6qejxP2GBJpVtuaX5cQEhjNns6Wz
	L8lLQXSTWQslnzISV8hk1Bpa/ewGKSAVAyoSGJ8egWeQSft0w1rlHHUCswVTRFNwWNa5LCANYan
	2AZZk2O7m/ASQVVIGveJ+fOAH5LUehwlV1CHJCg==
X-Gm-Gg: ASbGncufSxaZrWhSyBgBcHI2Xrp040vdP8S3lbtT0XjJU18j4GS6Ag8cqKPaPLF/WZA
	DrraVdBFkQ09VX8wXWB24TWc60eMDNNCks2FQPOIx0Xx3ERnux89UQOruEszutCJ4tvMTAUXwCj
	DEOKcGvEyJtHAgyTWT+x+hvonfmTkXGVy9WBstSmc=
X-Google-Smtp-Source: AGHT+IHhjOPG6EGR3h5ZoxINkquScgFy27rLR9k3To3zRQ6sSX22EXVVLbZqhYGhk5BG8qHjIGiTQP6ZKF5VsUZ7wNw=
X-Received: by 2002:a05:6e02:2146:b0:3d4:700f:67e2 with SMTP id
 e9e14a558f8ab-3d483a142bcmr103325245ab.10.1742174980058; Sun, 16 Mar 2025
 18:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com> <20250314-v5_user_cfi_series-v12-14-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-14-e51202b53138@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 17 Mar 2025 09:29:28 +0800
X-Gm-Features: AQ5f1Jq1XMUvueQ2i8jGfmFKuB0WixGyohaNaR6cxlktpRaErRRA5S28rQgfU70
Message-ID: <CANXhq0oz72vtaAxKH02ccJg+JHO9JnWbWhfwdDAgNd14ghNMCg@mail.gmail.com>
Subject: Re: [PATCH v12 14/28] riscv: Implements arch agnostic indirect branch
 tracking prctls
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
X-CRM114-CacheID: sfid-20250316_182941_178758_43426532 
X-CRM114-Status: GOOD (  27.60  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgNjo1MeKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IHByY3RscyBpbXBsZW1lbnRlZCBhcmU6Cj4gUFJfU0VUX0lO
RElSX0JSX0xQX1NUQVRVUywgUFJfR0VUX0lORElSX0JSX0xQX1NUQVRVUyBhbmQKPiBQUl9MT0NL
X0lORElSX0JSX0xQX1NUQVRVUwo+Cj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1
Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5o
IHwgMTYgKysrKysrKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgfCAgMiAr
LQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICB8ICA1ICsrKwo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC91c2VyY2ZpLmMgICAgICB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJj
ZmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oCj4gaW5kZXggYzRkY2QyNTZm
MTlhLi5hOGNlYzdjMTRkMWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91
c2VyY2ZpLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaAo+IEBAIC0x
Niw3ICsxNiw5IEBAIHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJnczsKPiAgc3RydWN0IGNmaV9zdGF0
dXMgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB1YmNmaV9lbiA6IDE7IC8qIEVuYWJsZSBmb3Ig
YmFja3dhcmQgY2ZpLiAqLwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB1YmNmaV9sb2NrZWQgOiAx
Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9uZykg
KiA4KSAtIDIpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB1ZmNmaV9lbiA6IDE7IC8qIEVuYWJs
ZSBmb3IgZm9yd2FyZCBjZmkuIE5vdGUgdGhhdCBFTFAgZ29lcyBpbiBzc3RhdHVzICovCj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHVmY2ZpX2xvY2tlZCA6IDE7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIHJzdmQgOiAoKHNpemVvZih1bnNpZ25lZCBsb25nKSAqIDgpIC0gNCk7Cj4gICAgICAgICB1
bnNpZ25lZCBsb25nIHVzZXJfc2hkd19zdGs7IC8qIEN1cnJlbnQgdXNlciBzaGFkb3cgc3RhY2sg
cG9pbnRlciAqLwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzaGR3X3N0a19iYXNlOyAvKiBCYXNl
IGFkZHJlc3Mgb2Ygc2hhZG93IHN0YWNrICovCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNoZHdf
c3RrX3NpemU7IC8qIHNpemUgb2Ygc2hhZG93IHN0YWNrICovCj4gQEAgLTMzLDYgKzM1LDEwIEBA
IGJvb2wgaXNfc2hzdGtfbG9ja2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayk7Cj4gIGJvb2wg
aXNfc2hzdGtfYWxsb2NhdGVkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayk7Cj4gIHZvaWQgc2V0
X3Noc3RrX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiAgdm9pZCBzZXRfc2hzdGtf
c3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBlbmFibGUpOwo+ICtib29sIGlz
X2luZGlyX2xwX2VuYWJsZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiArYm9vbCBpc19p
bmRpcl9scF9sb2NrZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKPiArdm9pZCBzZXRfaW5k
aXJfbHBfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBlbmFibGUpOwo+ICt2
b2lkIHNldF9pbmRpcl9scF9sb2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayk7Cj4KPiAgI2Rl
ZmluZSBQUl9TSEFET1dfU1RBQ0tfU1VQUE9SVEVEX1NUQVRVU19NQVNLIChQUl9TSEFET1dfU1RB
Q0tfRU5BQkxFKQo+Cj4gQEAgLTU4LDYgKzY0LDE0IEBAIHZvaWQgc2V0X3Noc3RrX3N0YXR1cyhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgZW5hYmxlKTsKPgo+ICAjZGVmaW5lIHNldF9z
aHN0a19zdGF0dXModGFzaywgZW5hYmxlKQo+Cj4gKyNkZWZpbmUgaXNfaW5kaXJfbHBfZW5hYmxl
ZCh0YXNrKSBmYWxzZQo+ICsKPiArI2RlZmluZSBpc19pbmRpcl9scF9sb2NrZWQodGFzaykgZmFs
c2UKPiArCj4gKyNkZWZpbmUgc2V0X2luZGlyX2xwX3N0YXR1cyh0YXNrLCBlbmFibGUpCj4gKwo+
ICsjZGVmaW5lIHNldF9pbmRpcl9scF9sb2NrKHRhc2spCj4gKwo+ICAjZW5kaWYgLyogQ09ORklH
X1JJU0NWX1VTRVJfQ0ZJICovCj4KPiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50
cnkuUwo+IGluZGV4IDY4Yzk5MTI0ZWE1NS4uMDA0OTRiNTRmZjRhIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
Cj4gQEAgLTE0Myw3ICsxNDMsNyBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9uKQo+
ICAgICAgICAgICogRGlzYWJsZSB0aGUgRlBVL1ZlY3RvciB0byBkZXRlY3QgaWxsZWdhbCB1c2Fn
ZSBvZiBmbG9hdGluZyBwb2ludAo+ICAgICAgICAgICogb3IgdmVjdG9yIGluIGtlcm5lbCBzcGFj
ZS4KPiAgICAgICAgICAqLwo+IC0gICAgICAgbGkgdDAsIFNSX1NVTSB8IFNSX0ZTX1ZTCj4gKyAg
ICAgICBsaSB0MCwgU1JfU1VNIHwgU1JfRlNfVlMgfCBTUl9FTFAKPgo+ICAgICAgICAgUkVHX0wg
czAsIFRBU0tfVElfVVNFUl9TUCh0cCkKPiAgICAgICAgIGNzcnJjIHMxLCBDU1JfU1RBVFVTLCB0
MAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCBjZDExNjY3NTkzZmUuLjQ1ODcyMDFkZDgxZCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9jZXNzLmMKPiBAQCAtMTYwLDYgKzE2MCwxMSBAQCB2b2lkIHN0YXJ0X3RocmVh
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBwYywKPiAgICAgICAgIHNldF9z
aHN0a19zdGF0dXMoY3VycmVudCwgZmFsc2UpOwo+ICAgICAgICAgc2V0X3Noc3RrX2Jhc2UoY3Vy
cmVudCwgMCwgMCk7Cj4gICAgICAgICBzZXRfYWN0aXZlX3Noc3RrKGN1cnJlbnQsIDApOwo+ICsg
ICAgICAgLyoKPiArICAgICAgICAqIGRpc2FibGUgaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIG9u
IGV4ZWMuCj4gKyAgICAgICAgKiBsaWJjIHdpbGwgZW5hYmxlIGl0IGxhdGVyIHZpYSBwcmN0bC4K
PiArICAgICAgICAqLwo+ICsgICAgICAgc2V0X2luZGlyX2xwX3N0YXR1cyhjdXJyZW50LCBmYWxz
ZSk7Cj4KPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ICAgICAgICAgcmVncy0+c3RhdHVzICY9IH5T
Ul9VWEw7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+IGluZGV4IGI5M2IzMjRlZWQyNi4uNzkzN2JjZWY5Mjcx
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+IEBAIC03Miw2ICs3MiwzNSBAQCB2b2lkIHNldF9zaHN0
a19sb2NrKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKPiAgICAgICAgIHRhc2stPnRocmVhZF9p
bmZvLnVzZXJfY2ZpX3N0YXRlLnViY2ZpX2xvY2tlZCA9IDE7Cj4gIH0KPgo+ICtib29sIGlzX2lu
ZGlyX2xwX2VuYWJsZWQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ICt7Cj4gKyAgICAgICBy
ZXR1cm4gdGFzay0+dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUudWZjZmlfZW4gPyB0cnVlIDog
ZmFsc2U7Cj4gK30KPiArCj4gK2Jvb2wgaXNfaW5kaXJfbHBfbG9ja2VkKHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzaykKPiArewo+ICsgICAgICAgcmV0dXJuIHRhc2stPnRocmVhZF9pbmZvLnVzZXJf
Y2ZpX3N0YXRlLnVmY2ZpX2xvY2tlZCA/IHRydWUgOiBmYWxzZTsKPiArfQo+ICsKPiArdm9pZCBz
ZXRfaW5kaXJfbHBfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBlbmFibGUp
Cj4gK3sKPiArICAgICAgIGlmICghY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICB0YXNrLT50aHJlYWRfaW5m
by51c2VyX2NmaV9zdGF0ZS51ZmNmaV9lbiA9IGVuYWJsZSA/IDEgOiAwOwo+ICsKPiArICAgICAg
IGlmIChlbmFibGUpCj4gKyAgICAgICAgICAgICAgIHRhc2stPnRocmVhZC5lbnZjZmcgfD0gRU5W
Q0ZHX0xQRTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgdGFzay0+dGhyZWFkLmVu
dmNmZyAmPSB+RU5WQ0ZHX0xQRTsKPiArCj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX0VOVkNGRywg
dGFzay0+dGhyZWFkLmVudmNmZyk7Cj4gK30KPiArCj4gK3ZvaWQgc2V0X2luZGlyX2xwX2xvY2so
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ICt7Cj4gKyAgICAgICB0YXNrLT50aHJlYWRfaW5m
by51c2VyX2NmaV9zdGF0ZS51ZmNmaV9sb2NrZWQgPSAxOwo+ICt9Cj4gIC8qCj4gICAqIElmIHNp
emUgaXMgMCwgdGhlbiB0byBiZSBjb21wYXRpYmxlIHdpdGggcmVndWxhciBzdGFjayB3ZSB3YW50
IGl0IHRvIGJlIGFzIGJpZyBhcwo+ICAgKiByZWd1bGFyIHN0YWNrLiBFbHNlIFBBR0VfQUxJR04g
aXQgYW5kIHJldHVybiBiYWNrCj4gQEAgLTM3MiwzICs0MDEsNTMgQEAgaW50IGFyY2hfbG9ja19z
aGFkb3dfc3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKPgo+ICAgICAgICAg
cmV0dXJuIDA7Cj4gIH0KPiArCj4gK2ludCBhcmNoX2dldF9pbmRpcl9icl9scF9zdGF0dXMoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25nIF9fdXNlciAqc3RhdHVzKQo+ICt7Cj4g
KyAgICAgICB1bnNpZ25lZCBsb25nIGZjZmlfc3RhdHVzID0gMDsKPiArCj4gKyAgICAgICBpZiAo
IWNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9scF9pbnN0cigpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICAvKiBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcg
aXMgZW5hYmxlZCBvbiB0aGUgdGFzayBvciBub3QgKi8KPiArICAgICAgIGZjZmlfc3RhdHVzIHw9
IChpc19pbmRpcl9scF9lbmFibGVkKHQpID8gUFJfSU5ESVJfQlJfTFBfRU5BQkxFIDogMCk7Cj4g
Kwo+ICsgICAgICAgcmV0dXJuIGNvcHlfdG9fdXNlcihzdGF0dXMsICZmY2ZpX3N0YXR1cywgc2l6
ZW9mKGZjZmlfc3RhdHVzKSkgPyAtRUZBVUxUIDogMDsKPiArfQo+ICsKPiAraW50IGFyY2hfc2V0
X2luZGlyX2JyX2xwX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2lnbmVkIGxvbmcg
c3RhdHVzKQo+ICt7Cj4gKyAgICAgICBib29sIGVuYWJsZV9pbmRpcl9scCA9IGZhbHNlOwo+ICsK
PiArICAgICAgIGlmICghY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgICAgIC8qIGluZGlyZWN0IGJy
YW5jaCB0cmFja2luZyBpcyBsb2NrZWQgYW5kIGZ1cnRoZXIgY2FuJ3QgYmUgbW9kaWZpZWQgYnkg
dXNlciAqLwo+ICsgICAgICAgaWYgKGlzX2luZGlyX2xwX2xvY2tlZCh0KSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgLyogUmVqZWN0IHVua25vd24gZmxh
Z3MgKi8KPiArICAgICAgIGlmIChzdGF0dXMgJiB+UFJfSU5ESVJfQlJfTFBfRU5BQkxFKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICBlbmFibGVfaW5kaXJf
bHAgPSAoc3RhdHVzICYgUFJfSU5ESVJfQlJfTFBfRU5BQkxFKSA/IHRydWUgOiBmYWxzZTsKPiAr
ICAgICAgIHNldF9pbmRpcl9scF9zdGF0dXModCwgZW5hYmxlX2luZGlyX2xwKTsKPiArCj4gKyAg
ICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAraW50IGFyY2hfbG9ja19pbmRpcl9icl9scF9zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICt7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
SWYgaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGlzIG5vdCBzdXBwb3J0ZWQgb3Igbm90IGVuYWJs
ZWQgb24gdGFzaywKPiArICAgICAgICAqIG5vdGhpbmcgdG8gbG9jayBoZXJlCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIGlmICghY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkgfHwK
PiArICAgICAgICAgICAhaXNfaW5kaXJfbHBfZW5hYmxlZCh0YXNrKSB8fCBhcmcgIT0gMCkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgc2V0X2luZGlyX2xw
X2xvY2sodGFzayk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPgpMR1RNCgpSZXZpZXdl
ZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgoKPiAtLQo+IDIuMzQuMQo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
