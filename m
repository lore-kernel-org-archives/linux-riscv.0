Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59E6D637CF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qo6pM0eQeNkCAxIQfIUDpqBYfmvwbjuKvXENN/pmmeE=; b=hCN4l3oEp40K21Ue3nRgnVtn9J
	nOTQgO5YDkoyf0XnKNp8MMBEeyZpm0JEfUFNj5s3xLie+rPfmSrqsQH2Xm1E1KhW+0jIjVorPFhic
	+nkKMBjp8ZugC8jZQZ/sFOiDgXem1I5z1O17B0VkpPNg92EP0R1tNFXK0Z0btmlhJXyXUYWgEjMUl
	jldISqhYIFPV0rh2lOcn3C8Onf52oGXBg7nNzOGpfY6CaeQWTTJ2j2PUJ1gft/GyL4tBaMX3yjxdh
	OXiXUGZa+EqouWE00sBKpziWBGIcCvKWG8cOls06OVvVwJIg8GN7uBknabTLVS+2cesx75jJL0oa6
	FFJ+FjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOK3-00000008OtW-1YSy;
	Thu, 14 Nov 2024 01:06:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOJz-00000008Osq-44sm
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 01:06:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso21978b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 17:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731546414; x=1732151214; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6zYfn0VZRfW6uGvMs5S79Lwbgkv1rCFmk8b72kjuag=;
        b=Vk4/qiiiERSlDiAMjShM8AHuzvUoSAjZCD/lyn02KgHjhZv74uyVmo1knpCg9cY0tX
         m19tm15Sia7+5sqhqfZqx4FSmVpcCdRb3wWhmtepbEOS2Fn3MwH0oNzrpU0uqRESdPQp
         L1qYuaIV17c5XZYPsDNk40XiM5y0cDPzcQpNkPXsNVZk1M8eafuTbS9JLt/N3h/j7DbA
         J8vrTvPgukYfCbx0IZtLsqJ+aq9XgjX8InBCm+cl0n/U6gtjrvyo1RN76R6Ri3RD5o+g
         vSik0UPwtR/tTyZmqJADcdBj1Beg9yrWtcT6BPd0u0EpNd0psVZwm0P7EKQdzzUmhRky
         o+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546414; x=1732151214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6zYfn0VZRfW6uGvMs5S79Lwbgkv1rCFmk8b72kjuag=;
        b=AjtwRa6PLrJifjstLo842YC01bTbD+gpD2z5qenJPeIjgOltBrZDz3YUBDjIPD1fGp
         VI84SalpaZb/0B/+U2oJ9w0axrbtUV6iI5ldyKEnC/3DvWDvRF8deeycY1xMaG+iKs4y
         Oi1Sk5inD650RxsKdOroo2zoQn0SCv5KyQnOX3uSDyOjfcFu7OOIA9mjsxDKNf5AJjms
         tHfqZRDN7zM8KwSXMoSdGNh+H0lZR3DUvLN99iFFRh+RL5rKlosE6/o619wgjVmmPT35
         0a973EqZYvfhGwKFMPVNVZBlAcsDSfL+WlwUs3rgEBdc5jQH0JVYGo0/rE8KH0RNAuTY
         BmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8tJd9kmj398ukCbR8rWHIn2SutGr+HKF40espt5qJJVob+D2zHqcMaV3wqyh6HSigFnYsIZ4XhJjoEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaPDunlAwAwnPgkiXHECENgunPzkiNB+5c2S74wVgCVSjnAq2L
	JQYrwaBVHqNfvjCDautFk63B6Cy2760bvjqW08aBQdho3X1N1mkfekPytnBrxmA=
X-Google-Smtp-Source: AGHT+IHKuTOxiGEAgkHaDhIBBJNYiWEQLb5FEseKdlvV0/9ks9/baTVKfCi8JKR7Lgz6EKvk8XnoGA==
X-Received: by 2002:a05:6a00:23c4:b0:724:603f:1f9c with SMTP id d2e1a72fcca58-724603f20abmr3387327b3a.16.1731546414360;
        Wed, 13 Nov 2024 17:06:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a6e9cddsm58312b3a.74.2024.11.13.17.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 17:06:53 -0800 (PST)
Date: Wed, 13 Nov 2024 17:06:50 -0800
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
Message-ID: <ZzVNKvCu4MOs7O5z@debug.ba.rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
 <20241111-v5_user_cfi_series-v8-24-dce14aa30207@rivosinc.com>
 <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkCCVjNHUinPWtOiK8Ki_ZkdoUCawfv1-+0B69J_1aJv5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_170656_299135_E95426F9 
X-CRM114-Status: GOOD (  16.59  )
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

T24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMTI6MTM6MzhBTSArMDgwMCwgTmljayBIdSB3cm90ZToK
PkhpIERlZXBhawo+Cj5PbiBUdWUsIE5vdiAxMiwgMjAyNCBhdCA1OjA44oCvQU0gRGVlcGFrIEd1
cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBLZXJuZWwgd2lsbCBoYXZlIHRv
IHBlcmZvcm0gc2hhZG93IHN0YWNrIG9wZXJhdGlvbnMgb24gdXNlciBzaGFkb3cgc3RhY2suCj4+
IExpa2UgZHVyaW5nIHNpZ25hbCBkZWxpdmVyeSBhbmQgc2lncmV0dXJuLCBzaGFkb3cgc3RhY2sg
dG9rZW4gbXVzdCBiZQo+PiBjcmVhdGVkIGFuZCB2YWxpZGF0ZWQgcmVzcGVjdGl2ZWx5LiBUaHVz
IHNoYWRvdyBzdGFjayBhY2Nlc3MgZm9yIGtlcm5lbAo+PiBtdXN0IGJlIGVuYWJsZWQuCj4+Cj4+
IEluIGZ1dHVyZSB3aGVuIGtlcm5lbCBzaGFkb3cgc3RhY2tzIGFyZSBlbmFibGVkIGZvciBsaW51
eCBrZXJuZWwsIGl0IG11c3QKPj4gYmUgZW5hYmxlZCBhcyBlYXJseSBhcyBwb3NzaWJsZSBmb3Ig
YmV0dGVyIGNvdmVyYWdlIGFuZCBwcmV2ZW50IGltYmFsYW5jZQo+PiBiZXR3ZWVuIHJlZ3VsYXIg
c3RhY2sgYW5kIHNoYWRvdyBzdGFjay4gQWZ0ZXIgYHJlbG9jYXRlX2VuYWJsZV9tbXVgIGhhcwo+
PiBiZWVuIGRvbmUsIHRoaXMgaXMgYXMgZWFybHkgYXMgcG9zc2libGUgaXQgY2FuIGVuYWJsZWQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+
PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgfCAgNCArKysrCj4+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5j
Cj4+IGluZGV4IDc2NmJkMzNmMTBjYi4uYTIyYWI4YTQxNjcyIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2Fz
bS1vZmZzZXRzLmMKPj4gQEAgLTUxNyw0ICs1MTcsOCBAQCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQp
Cj4+ICAgICAgICAgREVGSU5FKEZSRUdTX0E2LCAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCBm
dHJhY2VfcmVncywgYTYpKTsKPj4gICAgICAgICBERUZJTkUoRlJFR1NfQTcsICAgICAgICAgICAg
b2Zmc2V0b2Yoc3RydWN0IGZ0cmFjZV9yZWdzLCBhNykpOwo+PiAgI2VuZGlmCj4+ICsgICAgICAg
REVGSU5FKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUKTsKPj4gKyAgICAgICBERUZJTkUoU0JJ
X0VYVF9GV0ZUX1NFVCwgU0JJX0VYVF9GV0ZUX1NFVCk7Cj4+ICsgICAgICAgREVGSU5FKFNCSV9G
V0ZUX1NIQURPV19TVEFDSywgU0JJX0ZXRlRfU0hBRE9XX1NUQUNLKTsKPj4gKyAgICAgICBERUZJ
TkUoU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSywgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyk7Cj4+ICB9
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9oZWFkLlMKPj4gaW5kZXggMzU2ZDUzOTdiMmEyLi42MjQ0NDA4Y2E5MTcgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9oZWFkLlMKPj4gQEAgLTE2NCw2ICsxNjQsMTIgQEAgc2Vjb25kYXJ5X3N0YXJ0X3NiaToKPj4g
ICAgICAgICBjYWxsIHJlbG9jYXRlX2VuYWJsZV9tbXUKPj4gICNlbmRpZgo+PiAgICAgICAgIGNh
bGwgLkxzZXR1cF90cmFwX3ZlY3Rvcgo+PiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZXRlQKPj4g
KyAgICAgICBsaSBhNiwgU0JJX0VYVF9GV0ZUX1NFVAo+PiArICAgICAgIGxpIGEwLCBTQklfRldG
VF9TSEFET1dfU1RBQ0sKPj4gKyAgICAgICBsaSBhMSwgMSAvKiBlbmFibGUgc3VwZXJ2aXNvciB0
byBhY2Nlc3Mgc2hhZG93IHN0YWNrIGFjY2VzcyAqLwo+PiArICAgICAgIGxpIGEyLCBTQklfRldG
VF9TRVRfRkxBR19MT0NLCj4+ICsgICAgICAgZWNhbGwKPj4gICAgICAgICBzY3NfbG9hZF9jdXJy
ZW50Cj4+ICAgICAgICAgY2FsbCBzbXBfY2FsbGluCj4+ICAjZW5kaWYgLyogQ09ORklHX1NNUCAq
Lwo+PiBAQCAtMzIwLDYgKzMyNiwxMiBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+
PiAgICAgICAgIGxhIHRwLCBpbml0X3Rhc2sKPj4gICAgICAgICBsYSBzcCwgaW5pdF90aHJlYWRf
dW5pb24gKyBUSFJFQURfU0laRQo+PiAgICAgICAgIGFkZGkgc3AsIHNwLCAtUFRfU0laRV9PTl9T
VEFDSwo+PiArICAgICAgIGxpIGE3LCBTQklfRVhUX0ZXRlQKPj4gKyAgICAgICBsaSBhNiwgU0JJ
X0VYVF9GV0ZUX1NFVAo+PiArICAgICAgIGxpIGEwLCBTQklfRldGVF9TSEFET1dfU1RBQ0sKPj4g
KyAgICAgICBsaSBhMSwgMSAvKiBlbmFibGUgc3VwZXJ2aXNvciB0byBhY2Nlc3Mgc2hhZG93IHN0
YWNrIGFjY2VzcyAqLwo+PiArICAgICAgIGxpIGEyLCBTQklfRldGVF9TRVRfRkxBR19MT0NLCj4+
ICsgICAgICAgZWNhbGwKPj4gICAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4+Cj4+ICAjaWZkZWYg
Q09ORklHX0tBU0FOCj4+Cj4+IC0tCj4+IDIuNDUuMAo+Pgo+U2hvdWxkIHdlIGNsZWFyIHRoZSBT
QklfRldGVF9TRVRfRkxBR19MT0NLIGJlZm9yZSB0aGUgY3B1IGhvdHBsdWcKPm90aGVyd2lzZSB0
aGUgbWVudmNmZy5zc2Ugd29uJ3QgYmUgc2V0IGJ5IHRoZSBmd2Z0IHNldCBzYmkgY2FsbCB3aGVu
Cj50aGUgaG90cGx1ZyBjcHUgYmFjayB0byBrZXJuZWw/CgpIbW0uLi4KCkFuIGluY29taW5nIGhv
dHBsdWcgQ1BVIGhhcyBubyBmZWF0dXJlcyBzZXR1cCBvbiBpdC4KSSBzZWUgdGhhdCBgc2JpX2Nw
dV9zdGFydGAgd2lsbCBzdXBwbHkgYHNlY29uZGFyeV9zdGFydF9zYmlgIGFzIHN0YXJ0CnVwIGNv
ZGUgZm9yIGluY29taW5nIENQVS4gYHNlY29uZGFyeV9zdGFydF9zYmlgIGlzIGluIGhlYWQuUyB3
aGljaCBjb252ZXJnZXMKaW4gYC5Mc2Vjb25kYXJ5X3N0YXJ0X2NvbW1vbmAuIEFuZCB0aHVzIGhv
dHBsdWdnZWQgQ1BVIHNob3VsZCBiZQppc3N1aW5nIHNoYWRvdyBzdGFjayBzZXQgRldGVCBzYmkg
YXMgd2VsbC4KCkFtIEkgbWlzc2luZyBzb21ldGhpbmcgPwoKPgo+UmVnYXJkcywKPk5pY2sKPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
