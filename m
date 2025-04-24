Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59072C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RINXU4KVOl0dYPbxxMzCkWa5PDy36nA13RYYrM6TpMI=; b=xNIpljRxIHj2t1
	k50gaAroWot3JoyuSwgYSImBO69SDDN+aG58DAsH6Bn25J3NToJUM0kE1SGpgBjb3eIiFad6SUThw
	LU/uWC9pl7oE9anfxf7BcUGce4zqChoz4Unx+TWwcgUaSqjdawfSc63VZQekVXw5cH0YU96N8KKql
	5lXAlp7QpiQDa4Dn3P4ufNVlTNQHdhzfmJ7w1ThHlFlRR8UohNMyztTrFN0XrSaYyvBj2Uxb3NEq/
	eGHy8XZft7w7mygaWBtsF77xGKuKevDhdU7Agf/awZAYpgCv8PNH1Pg/EnnjPVTOXbWnpIxxjGfmU
	F9a4WcJrFyGPUVUJIuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wxb-0000000EFjK-2yf2;
	Thu, 24 Apr 2025 13:49:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w3K-0000000E5qI-2Axy
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:51:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so974155e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499101; x=1746103901; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLukpWT5NNOxSvsbTFh0JQPpU9SQzhdcC+2BWmCpzxc=;
        b=ZUFd6WQV3jIBCpmbWrSKvvSI6UJUh8xYuONqA/xEiAp0qQ0cvbRhTIVzqgJ1HY9Bf3
         7M1D9A5OzppjGdjpyYYn1/ovdFZ7g2kXJH6Ft4//lhbu1s+NHzvo8WvDRSwggmy9gzZP
         CNBp3Iu/awoT7Cxh0R4x0HZBSfewsdNbwSskAv9ieMussM+4GONP/OuzDX32K71RdkFH
         pNcphVYUwcDKS7WnIBLJ051UF0sGK0XBU5OkugKX2J/nVJ85Umbxw/Y8PJA7i9aEfo2x
         wEx9fxd0OamGp+QdTz2PrPvVGnNBzpQhs0LmlAxKV/k6ZQbYfJoc2ispvcXAL96PHrvu
         HMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499101; x=1746103901;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLukpWT5NNOxSvsbTFh0JQPpU9SQzhdcC+2BWmCpzxc=;
        b=RFpDDpnGtM69Yt+/OwhPLceuxMmSQUemN6rNn/kMHzpWfbevy9lqaj93wU16PYO4WN
         FcsKbVFYrVp/ZxGrzJlEUD/4BxB3X9fwCMph8vSi4diepFt/VrD4XTGQtT1H7EtIqN1w
         uUAJtBcElxzsCHV17nnOAEdnm4pf4BzM7VZax0RJo48gyG0d0gi7w6olwJofCgG8R1KE
         4qqHLj0pe/axHyeoK7psYenPJDgYoQYqUHTsZdjn28CuNYC0qQNCWhlPsBEhVLzAEEdC
         b3awb/Tx5IojyQ4+QK58/UEm+gXlI+wcCmQx5Xv1YrsxYa9BRYQxZNrJkK1e2UdQRa12
         stNA==
X-Forwarded-Encrypted: i=1; AJvYcCWXQOBoUcz3iab8mhDypDxh0FDS5dk+KBEWqQZj0Rh1ryx8eAblsomeg4AxJpf8lZk+X56KXAP1zKYETw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzumpCKqiwuNFTxm2JNXHqNNWq8BBNfTXC4zi0qdqX0GV+4Ky5h
	uwHlIELIZX3jberNiMHOzyw0gOClPB+vtwC9/9aGYx1nGk4C18+DEa63HvU0mlxpuD4H79K6/6j
	QHZ/Oaw==
X-Gm-Gg: ASbGncuTzEdNIJHhK5wKNuh1FDQttpRC6rjhnHXh/Q+sGqiTSonZhsoOyG5JYtH/T7I
	BDiKts7G81b1h1Fty4/NrVBzL876RQx1Uxx/mqkP65kYFmndtGUhW8bDlqAno5YT3teJ9v5nSXZ
	e1cjIT2pP+QvYzI8Xd+SZQKbMDU4wqqU95T1/NaAf/1RwB9D9hF654nt4fJ8D3Mo3zts3AhHSdu
	Rm87SwkvrXssMGYL0LambmByUIvLojCdQ9jyDZ53GFEsNGo1G3sDDVL+2EQ6p288+KlDFPUrMn0
	V97EwNLSmwhY6tzOcYQgPDIf5wx7aVwu3Xk2KO/3Yy+yaVHE
X-Google-Smtp-Source: AGHT+IEM7f4Ug05qJLQixhJCwrNUQhZVnfUcKsq0i+OggaoW7x6aAvFNMmOAKB/VOVrygSxaqnTFQw==
X-Received: by 2002:a05:600c:3d89:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-4409bd8d808mr9055605e9.4.1745499100564;
        Thu, 24 Apr 2025 05:51:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b30c:ee4d:9e10:6a46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b8efsm20710185e9.6.2025.04.24.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:51:40 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 14:51:39 +0200
Message-Id: <D9EVSGGM0XDE.25R31NY7EQTJX@ventanamicro.com>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack()
 syscall
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
 <D92VAWLM8AGD.3CF1VH6NYHCYV@ventanamicro.com>
 <aAmtKhlwKV7oz7RF@debug.ba.rivosinc.com>
In-Reply-To: <aAmtKhlwKV7oz7RF@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_055142_575447_4B259C9E 
X-CRM114-Status: GOOD (  23.91  )
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

MjAyNS0wNC0yM1QyMDoxNjo1OC0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDExOjU2OjQ0QU0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTAzLTE0VDE0OjM5OjI5LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBBcyBkaXNjdXNzZWQgZXh0ZW5zaXZlbHkgaW4gdGhl
IGNoYW5nZWxvZyBmb3IgdGhlIGFkZGl0aW9uIG9mIHRoaXMKPj4+IHN5c2NhbGwgb24geDg2ICgi
eDg2L3Noc3RrOiBJbnRyb2R1Y2UgbWFwX3NoYWRvd19zdGFjayBzeXNjYWxsIikgdGhlCj4+PiBl
eGlzdGluZyBtbWFwKCkgYW5kIG1hZHZpc2UoKSBzeXNjYWxscyBkbyBub3QgbWFwIGVudGlyZWx5
IHdlbGwgb250byB0aGUKPj4+IHNlY3VyaXR5IHJlcXVpcmVtZW50cyBmb3Igc2hhZG93IHN0YWNr
IG1lbW9yeSBzaW5jZSB0aGV5IGxlYWQgdG8gd2luZG93cwo+Pj4gd2hlcmUgbWVtb3J5IGlzIGFs
bG9jYXRlZCBidXQgbm90IHlldCBwcm90ZWN0ZWQgb3Igc3RhY2tzIHdoaWNoIGFyZSBub3QKPj4+
IHByb3Blcmx5IGFuZCBzYWZlbHkgaW5pdGlhbGlzZWQuIEluc3RlYWQgYSBuZXcgc3lzY2FsbCBt
YXBfc2hhZG93X3N0YWNrKCkKPj4+IGhhcyBiZWVuIGRlZmluZWQgd2hpY2ggYWxsb2NhdGVzIGFu
ZCBpbml0aWFsaXNlcyBhIHNoYWRvdyBzdGFjayBwYWdlLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggaW1w
bGVtZW50cyB0aGlzIHN5c2NhbGwgZm9yIHJpc2N2LiByaXNjdiBkb2Vzbid0IHJlcXVpcmUgdG9r
ZW4KPj4+IHRvIGJlIHNldHVwIGJ5IGtlcm5lbCBiZWNhdXNlIHVzZXIgbW9kZSBjYW4gZG8gdGhh
dCBieSBpdHNlbGYuIEhvd2V2ZXIgdG8KPj4+IHByb3ZpZGUgY29tcGF0aWJpbGl0eSBhbmQgcG9y
dGFiaWxpdHkgd2l0aCBvdGhlciBhcmNoaXRlY3R1ZXMsIHVzZXIgbW9kZQo+Pj4gY2FuIHNwZWNp
ZnkgdG9rZW4gc2V0IGZsYWcuCj4+Cj4+UklTQy1WIHNoYWRvdyBzdGFjayBjb3VsZCB1c2UgbW1h
cCgpIGFuZCBtYWR2aXNlKCkgcGVyZmVjdGx5IHdlbGwuCj4KPiBEZXZpYXRpbmcgZnJvbSB3aGF0
IG90aGVyIGFyY2hlcyBhcmUgZG9pbmcgd2lsbCBjcmVhdGUgbW9yZSB0aHJhc2guIEkgZXhwZWN0
Cj4gdGhlcmUgd2lsbCBiZSBtZXJnaW5nIG9mIGNvbW1vbiBsb2dpYyBiZXR3ZWVuIHg4NiwgYXJt
NjQgYW5kIHJpc2N2LiBJbmZhY3QgSQo+IGRpZCBwb3N0IG9uZSBzdWNoIFJGQyBwYXRjaCBzZXQg
bGFzdCB5ZWFyIChkaWRuJ3QgZm9sbG93IHVwIG9uIGl0KS4gVXNpbmcKPiBgbW1hcC9tYWR2aXNl
YCBkZWZlYXRzIHRoYXQgcHVycG9zZSBvZiBjcmVhdGluZyBjb21tb24gbG9naWMgYmV0d2VlbiBh
cmNoZXMuCj4KPiBUaGVyZSBhcmUgcGl0ZmFsbHMgYXMgbWVudGlvbmVkIHdpdGggcmVzcGVjdCB0
byBtbWFwL21hZGl2c2UgYmVjYXVzZSBvZgo+IHVuaXF1ZSBuYXR1cmUgb2Ygc2hhZG93IHN0YWNr
LiBBbmQgdGh1cyBpdCB3YXMgYWNjZXB0ZWQgdG8gY3JlYXRlIGEgbmV3IHN5c2NhbGwKPiB0byBj
cmVhdGUgc3VjaCBtYXBwaW5ncy4gUklTQy1WIHdpbGwgc3RpY2sgdG8gdGhhdC4KCk9rLgoKPj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC91c2VyY2ZpLmMKPj4+ICtzdGF0aWMgbm9pbmxpbmUgdW5zaWduZWQgbG9uZyBhbW9fdXNl
cl9zaHN0ayh1bnNpZ25lZCBsb25nICphZGRyLCB1bnNpZ25lZCBsb25nIHZhbCkKPj4+ICt7Cj4+
PiArCS8qCj4+PiArCSAqIE5ldmVyIGV4cGVjdCAtMSBvbiBzaGFkb3cgc3RhY2suIEV4cGVjdCBy
ZXR1cm4gYWRkcmVzc2VzIGFuZCB6ZXJvCj4+PiArCSAqLwo+Pj4gKwl1bnNpZ25lZCBsb25nIHN3
YXAgPSAtMTsKPj4+ICsJX19lbmFibGVfdXNlcl9hY2Nlc3MoKTsKPj4+ICsJYXNtIGdvdG8oCj4+
PiArCQkiLm9wdGlvbiBwdXNoXG4iCj4+PiArCQkiLm9wdGlvbiBhcmNoLCAremljZmlzc1xuIgo+
Pgo+PlNob3VsZG4ndCBjb21waWxlciBhY2NlcHQgc3NhbW9zd2FwLmQgb3Bjb2RlIGV2ZW4gd2l0
aG91dCB6aWNmaXNzIGFyY2g/Cj4KPiBJdHMgaWxsZWdhbCBpbnN0cnVjdGlvbiBpZiBzaGFkb3cg
c3RhY2sgYXJlbid0IGF2YWlsYWJsZS4gQ3VycmVudCB0b29sY2hhaW4KPiBlbWl0cyBpdCBvbmx5
IGlmIHppY2Zpc3MgaXMgc3BlY2lmaWVkIGluIG1hcmNoLgoKT29mLCBJJ2xsIGxvb2sgd2h5IGFy
Y2ggaXMgYmVpbmcgdXNlZCBsaWtlIHRoYXQsIHRoYW5rcy4KCihJIHRob3VnaHQgYXJjaCBpcyBv
bmx5IGZvciBjb21waWxlciBnZW5lcmF0ZWQgY29kZSwgc28gYXNzZW1ibHkKIG1uZW1vbmljcyB3
b3VsZCBhbHdheXMgYmUgZGVmaW5lZCBpZiB0aGUgY29tcGlsZXIga25vd3MgdGhlbS4pCgo+Pgo+
Pj4gKwkJIi5vcHRpb24gcG9wXG4iCj4+PiArCQk6IFtzd2FwXSAiPXIiIChzd2FwKSwgW2FkZHJd
ICIrQSIgKCphZGRyKQo+Pj4gKwkJOiBbdmFsXSAiciIgKHZhbCkKPj4+ICsJCTogIm1lbW9yeSIK
Pj4+ICsJCTogZmF1bHQKPj4+ICsJCSk7Cj4+PiArCV9fZGlzYWJsZV91c2VyX2FjY2VzcygpOwo+
Pj4gKwlyZXR1cm4gc3dhcDsKPj4+ICtmYXVsdDoKPj4+ICsJX19kaXNhYmxlX3VzZXJfYWNjZXNz
KCk7Cj4+PiArCXJldHVybiAtMTsKPj4KPj5JIHRoaW5rIHdlIHNob3VsZCByZXR1cm4gMCBhbmQg
LUVGQVVMVC4KPj5XZSBjYW4gaWdub3JlIHRoZSBzd2FwcGVkIHZhbHVlLCBvciByZXR1cm4gaXQg
dGhyb3VnaCBhIHBvaW50ZXIuCj4KPiBDb25zdW1lciBvZiB0aGlzIGRldGVjdHMgLTEgYW5kIHRo
ZW4gcmV0dXJuIC1FRkFVTFQuCj4gV2Ugd291bGQgZXZlbnR1YWxseSBuZWVkIHRoaXMgd2hlbiBj
cmVhdGluZyBzaGFkb3cgc3RhY2sgdG9rZW5zIGZvcgo+IGtlcm5lbCBzaGFkb3cgc3RhY2suIEkg
YmVsaWV2ZSBgLTFgIGlzIHNhZmUgcmV0dXJuIHZhbHVlIHdoaWNoIGNhbid0Cj4gYmUgY29uc3Ry
dWVkIGFzIG5lZ2F0aXZlIGtlcm5lbCBhZGRyZXNzICgtRUZBVUxUIHdpbGwgYmUpCgpJIGJlbGll
dmUgaXQgYXMgd2VsbCwgYnV0IEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHdoeSB3ZSBuZWVkIHRvIHJp
c2sgaXQKd2hlbiB3ZSBjYW4gcmV0dXJuIHRoZSBzdGFjayB2YWx1ZSB0aG91Z2ggYSBwb2ludGVy
IGFuZCBoYXZlIHNpbXBsZQpzdWNjZXNzL2ZhaWx1cmUgcmV0dXJuIHZhbHVlLgoKPj4+ICt9Cj4+
PiArCj4+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgYWxsb2NhdGVfc2hhZG93X3N0YWNrKHVuc2ln
bmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+Pj4gKwkJCQkJICAgdW5zaWduZWQg
bG9uZyB0b2tlbl9vZmZzZXQsIGJvb2wgc2V0X3RvaykKPj4+ICt7Cj4+PiArCWludCBmbGFncyA9
IE1BUF9BTk9OWU1PVVMgfCBNQVBfUFJJVkFURTsKPj4KPj5JcyBNQVBfR1JPV1NET1dOIHBvaW50
bGVzcz8KPgo+IE5vdCBzdXJlLiBEaWRuJ3Qgc2VlIHRoYXQgaW4geDg2IG9yIGFybTY0IHNoYWRv
dyBzdGFjayBjcmVhdGlvbi4KPiBMZXQgbWUga25vdyBpZiBpdHMgdXNlZnVsLgoKSXQgaXMgZm9y
IGF1dG9tYXRlZCBncm93aW5nIG9mIHRoZSBzdGFjay4gIEkgdGhpbmsgdGhhdCB0aGUgZGVmYXVs
dApzdGFjayBpcyBwb2ludGxlc3NseSBsYXJnZSBhbHJlYWR5LCBhbmQgaWYgb3RoZXIgYXJjaGVz
IGRvbid0IGRvIGl0LCBzbwp3ZSBjYW4gcHJvYmFibHkgZm9sbG93IHRoZWlyIGRlc2lnbiBoZXJl
IGFzIHdlbGwuLi4KCj4+PiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4+
PiArCXVuc2lnbmVkIGxvbmcgcG9wdWxhdGUsIHRva19sb2MgPSAwOwo+Pj4gKwo+Pj4gKwlpZiAo
YWRkcikKPj4+ICsJCWZsYWdzIHw9IE1BUF9GSVhFRF9OT1JFUExBQ0U7Cj4+PiArCj4+PiArCW1t
YXBfd3JpdGVfbG9jayhtbSk7Cj4+PiArCWFkZHIgPSBkb19tbWFwKE5VTEwsIGFkZHIsIHNpemUs
IFBST1RfUkVBRCwgZmxhZ3MsCj4+Cj4+UFJPVF9SRUFEIGltcGxpZXMgVk1fUkVBRCwgc28gd29u
J3QgdGhpcyBzZWxlY3QgUEFHRV9DT1BZIGluIHRoZQo+PnByb3RlY3Rpb25fbWFwIGluc3RlYWQg
b2YgUEFHRV9TSEFET1dTVEFDSz8KPgo+IFBST1RfUkVBRCBpcyBwb2ludGxlc3MgaGVyZSBhbmQg
cmVkdW5kYW50LiBJIGhhdmVuJ3QgY2hlY2tlZCBpZiBJIHJlbW92ZSBpdAo+IHdoYXQgaGFwcGVu
cy4KPgo+IGBWTV9TSEFET1dfU1RBQ0tgIHRha2VzIHByZWNlZGVuY2UgKHRha2UgYSBsb29rIGF0
IHB0ZV9ta3dyaXRlIGFuZCBwbWRfbWt3cml0ZS4KPiBPbmx5IHdheSBgVk1fU0hBRE9XX1NUQUNL
YCBpcyBwb3NzaWJsZSBpbiB2bWZsYWdzIGlzIHZpYSBgbWFwX3NoYWRvd19zdGFja2Agb3IKPiBg
Zm9yay9jbG9uZWAgb24gZXhpc3RpbmcgdGFzayB3aXRoIHNoYWRvdyBzdGFjayBlbmFibGVkLgo+
Cj4gSW4gYSBudXRzaGVsbCB1c2VyIGNhbid0IHNwZWNpZnkgYFZNX1NIQURPV19TVEFDS2AgZGly
ZWN0bHkgKGluZGlyZWN0bHkgdmlhCj4gbWFwX3NoYWRvd19zdGFjayBzeXNjYWxsIG9yIGZvcmsv
Y2xvbmUpIC4gQnV0IGlmIHNldCBpbiB2bWFmbGFncyB0aGVuIGl0J2xsCj4gdGFrZSBwcmVjZWRl
bmNlLgoKWWVhaCwgSSBkb24ndCBsaWtlIHRoYXQgdWdseSBzcGVjaWFsIGNhc2UgYXQgYWxsLCBz
byBJIHdhcyBob3Bpbmcgd2UKY291bGQgc29tZWhvdyBhdm9pZCBpdC4gOikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
