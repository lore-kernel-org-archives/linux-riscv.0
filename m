Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374F3C36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXm44rsB8+fNz8xz/nTfsde3HxySMhVJNJKugyKOAjE=; b=m2s2pV4X9/q8Gc
	RWh4gRSjbke6GDIbgpfSnjmWnfjobUlS9Jx22RBQJ0iZqcQDUHvV/ocCGHl5bTRefFXBHCMduR0o3
	4bIA6/6Eog8879zZUUITdVrgdq/1sqOjpR9HnVIVHUHignYi9afyHAitOhvGN4SLHii143j4fhSs3
	S/CFVQfouv4EDUnzqaFRo84QqXcezwb0CitshxUL/XI0KzCU6j4F/rfw0FcukV+3igoSk71HnUCRF
	rcJfM7FmvtfbGnlu/UCCL+rkcK1Of+/XaEdTMYwF8RizRg6KhrbDaGYRU6kbysWsMFXmrq6IQJIYu
	R8jiTp1CPHIF5b7JwEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOOz-0000000DMqY-2UGM;
	Thu, 20 Mar 2025 22:30:13 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOOw-0000000DMoy-3UiZ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:30:12 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e64405b3b9aso985850276.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742509809; x=1743114609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhKgSRxm2mNSCqvm5Zj9K3Ods9oUsUl94h74lzVe+vg=;
        b=OJohNzzVHEpsciCD+Tc1ufr/0UrU7uXQZ6GUYBPYLO4yNpvqgAII7s5C6MhgkeA4KP
         HjDcDvyn831chHUniEqvsGAiVbkHIDK7I7gosIhPY0u37wDo5zZSEd4gmWCW6Fx8/coD
         8mLhFPqb4fHYJzgdE7rL6fpje+ho+Xxp8Y4eAbD8Z8P8CTnOllcVY/72R7YvAkHjYoWT
         fMTs9EBSCFPe9MhZGZcU3TgLiB/PiHkRTS0l4vg7Wwa7DYYKu2plWtNPnmMgsuCGBX7C
         tz9T+/WSc7AkpKi4Fq4XljmQRHBleMKewwyuRD9h2rqyZJufzRZ/DsU63VLq2YNJ4POT
         BY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509809; x=1743114609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhKgSRxm2mNSCqvm5Zj9K3Ods9oUsUl94h74lzVe+vg=;
        b=q9LMV1C55NrOZ3L0hr21IyfN5qKZgYmLhrboK9daiuyypRiftMzaghCb4ZoII5J9fB
         KWASH7SEfWAApVxUIUiMUtw/oKmOYWoWN6ZLpmVzjQAXd/KddCcJwBfUuesoY3HaRzCw
         0c/yoOQIJJiqcGDU0sEORqn/LnYoHzA6I+Sjn+Mpi7EpRx+R3apjKYhs7+6VC9Z8lJE8
         ut4+6EffqpieBo7ctVXL1812Wxl2raSGbbhjcr3EOigBih7OYzaWQjCP0Tts/eq3e/NW
         qW1KVCePudyMcNB7hSBTj45BZ/8KwVQPiYjXfXy4u55tzeWIQ18RJDyUOHZZo9EG1ESn
         Ol7A==
X-Forwarded-Encrypted: i=1; AJvYcCXZwl6WoMugYzknpNRjgZzhRYlwD+W/oex4LdIJrIfKQhHVC4XYEpleIx48bXJ/ON3eD1m67AcQlrKZqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGgPXkclxjTLJP9qQEfGjrL5hVc3faX08FH3S5dFSLOJKU9io6
	u19fouU9wiOs3SazGST1DzxjtB9AkN9Gse7iTLXOPhhvjZbELLi7yCoZcicb2dtqs6zOmty1MoK
	JEWdDY+soIJhSOjlmerhdtzVd2jNAcWE9dbNdUg==
X-Gm-Gg: ASbGncvLaCRjWOjfp2yRzKMeDD037uXD+D30bChRIoOaxWIaDRmjWPMKetjNKyfVCg7
	1rcZIoggYCrWd4uqgrOzVEkame8oaJ5VaTvgXEBGfRGcRqyBhW0VMKLGKwSSEFs8t1MPjSuSiGk
	FKogtEPafr9aEcljvwiPOUQHUN9j8=
X-Google-Smtp-Source: AGHT+IEQPzBHifdPzQrM8MhMztEZK/jnjn8OcNor9KhvI4hEsyHN6f7exl2vjGFEVUFZVWt5FCpCyI9kZub1gEwdZzk=
X-Received: by 2002:a05:6902:a05:b0:e60:99d2:cbc2 with SMTP id
 3f1490d57ef6-e66a4db6ba8mr1114497276.25.1742509809144; Thu, 20 Mar 2025
 15:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com> <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
In-Reply-To: <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Mar 2025 15:29:55 -0700
X-Gm-Features: AQ5f1JpPoZ6b9vZ5xwZpI2oxEH4zoWU0U5E6Pfiy0DThCuNWaEl3L1CWR9SNfKo
Message-ID: <CAKC1njQHu1UeSSApWHXedEURBezuQL1BDcrpsSfi=D0JmDFX8A@mail.gmail.com>
Subject: Re: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
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
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153011_153939_9C7A332F 
X-CRM114-Status: GOOD (  22.44  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMjoyNeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDMtMTRUMTQ6Mzk6NDQtMDc6MDAs
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPiA+IFRoaXMgcGF0Y2ggY3JlYXRl
cyBhIGNvbmZpZyBmb3Igc2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgcGFkIGluc3Ry
Cj4gPiBzdXBwb3J0LiBTaGFkb3cgc3RhY2sgc3VwcG9ydCBhbmQgbGFuZGluZyBpbnN0ciBzdXBw
b3J0IGNhbiBiZSBlbmFibGVkIGJ5Cj4gPiBzZWxlY3RpbmcgYENPTkZJR19SSVNDVl9VU0VSX0NG
SWAuIFNlbGVjdGluZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYCB3aXJlcwo+ID4gdXAgcGF0aCB0
byBlbnVtZXJhdGUgQ1BVIHN1cHBvcnQgYW5kIGlmIGNwdSBzdXBwb3J0IGV4aXN0cywga2VybmVs
IHdpbGwKPiA+IHN1cHBvcnQgY3B1IGFzc2lzdGVkIHVzZXIgbW9kZSBjZmkuCj4gPgo+ID4gSWYg
Q09ORklHX1JJU0NWX1VTRVJfQ0ZJIGlzIHNlbGVjdGVkLCBzZWxlY3QgYEFSQ0hfVVNFU19ISUdI
X1ZNQV9GTEFHU2AsCj4gPiBgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0tgIGFuZCBEWU5BTUlD
X1NJR0ZSQU1FIGZvciByaXNjdi4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0yNTAsNiArMjUwLDI2IEBAIGNvbmZpZyBBUkNIX0hB
U19CUk9LRU5fRFdBUkY1Cj4gPiArY29uZmlnIFJJU0NWX1VTRVJfQ0ZJCj4gPiArICAgICBkZWZf
Ym9vbCB5Cj4gPiArICAgICBib29sICJyaXNjdiB1c2Vyc3BhY2UgY29udHJvbCBmbG93IGludGVn
cml0eSIKPiA+ICsgICAgIGRlcGVuZHMgb24gNjRCSVQgJiYgJChjYy1vcHRpb24sLW1hYmk9bHA2
NCAtbWFyY2g9cnY2NGltYV96aWNmaXNzKQo+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDVl9BTFRF
Uk5BVElWRQo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLCj4gPiAr
ICAgICBzZWxlY3QgQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdTCj4gPiArICAgICBzZWxlY3QgRFlO
QU1JQ19TSUdGUkFNRQo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBQcm92aWRlcyBDUFUgYXNz
aXN0ZWQgY29udHJvbCBmbG93IGludGVncml0eSB0byB1c2Vyc3BhY2UgdGFza3MuCj4gPiArICAg
ICAgIENvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgaXMgcHJvdmlkZWQgYnkgaW1wbGVtZW50aW5nIHNo
YWRvdyBzdGFjayBmb3IKPiA+ICsgICAgICAgYmFja3dhcmQgZWRnZSBhbmQgaW5kaXJlY3QgYnJh
bmNoIHRyYWNraW5nIGZvciBmb3J3YXJkIGVkZ2UgaW4gcHJvZ3JhbS4KPiA+ICsgICAgICAgU2hh
ZG93IHN0YWNrIHByb3RlY3Rpb24gaXMgYSBoYXJkd2FyZSBmZWF0dXJlIHRoYXQgZGV0ZWN0cyBm
dW5jdGlvbgo+ID4gKyAgICAgICByZXR1cm4gYWRkcmVzcyBjb3JydXB0aW9uLiBUaGlzIGhlbHBz
IG1pdGlnYXRlIFJPUCBhdHRhY2tzLgo+ID4gKyAgICAgICBJbmRpcmVjdCBicmFuY2ggdHJhY2tp
bmcgZW5mb3JjZXMgdGhhdCBhbGwgaW5kaXJlY3QgYnJhbmNoZXMgbXVzdCBsYW5kCj4gPiArICAg
ICAgIG9uIGEgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24gZWxzZSBDUFUgd2lsbCBmYXVsdC4gVGhp
cyBtaXRpZ2F0ZXMgYWdhaW5zdAo+ID4gKyAgICAgICBKT1AgLyBDT1AgYXR0YWNrcy4gQXBwbGlj
YXRpb25zIG11c3QgYmUgZW5hYmxlZCB0byB1c2UgaXQsIGFuZCBvbGQgdXNlci0KPiA+ICsgICAg
ICAgc3BhY2UgZG9lcyBub3QgZ2V0IHByb3RlY3Rpb24gImZvciBmcmVlIi4KPiA+ICsgICAgICAg
ZGVmYXVsdCB5Cj4KPiBBIGhpZ2ggbGV2ZWwgcXVlc3Rpb24gdG8ga2ljayBvZmYgbXkgcmV2aWV3
Ogo+Cj4gV2h5IGFyZSBsYW5kaW5nIHBhZHMgYW5kIHNoYWRvdyBzdGFja3MgbWVyZ2VkIHRvZ2V0
aGVyPwo+Cj4gQXBhcnQgZnJvbSBhZGRpbmcgYnVpbGQgZmxleGliaWxpdHksIHdlIGNvdWxkIGFs
c28gc3BsaXQgdGhlIHBhdGNoZXMKPiBpbnRvIHR3byBpc29sYXRlZCBzZXJpZXMsIGJlY2F1c2Ug
dGhlIGZlYXR1cmVzIGFyZSBpbmRlcGVuZGVudC4KClN0cmljdGx5IGZyb20gQ1BVIGV4dGVuc2lv
bnMgcG9pbnQgb2YgdmlldyB0aGV5IGFyZSBpbmRlcGVuZGVudCBmZWF0dXJlcy4KQWx0aG91Z2gg
ZnJvbSBhIHVzYWJpbGl0eSBwb2ludCBvZiB2aWV3IHRoZXkgY29tcGxlbWVudCBlYWNoIG90aGVy
LiBBIHVzZXIKd2FudGluZyB0byBlbmFibGUgc3VwcG9ydCBmb3IgY29udHJvbCBmbG93IGludGVn
cml0eSB3b3VsZG4ndCBiZSBlbmFibGluZwpvbmx5IGxhbmRpbmcgcGFkIGFuZCBsZWF2aW5nIHJl
dHVybiBmbG93IG9wZW4gZm9yIGFuIGF0dGFja2VyIGFuZCB2aWNlLXZlcnNhLgpUaGF0J3Mgd2h5
IEkgZGVmaW5lZCBhIHNpbmdsZSBDT05GSUcgZm9yIENGSS4KCkZyb20gb3JnYW5pemluZyBwYXRj
aGVzIGluIHRoZSBwYXRjaCBzZXJpZXMsIHNoYWRvdyBzdGFjayBhbmQgbGFuZGluZwpwYWQgcGF0
Y2hlcyBkbyBub3QgY3Jvc3MgaW50byBlYWNoIG90aGVyIGFuZCBhcmUgZGlmZmVyZW50IGZyb20g
ZWFjaApvdGhlciBleGNlcHQgZHQtYmluZGluZ3MsIGh3cHJvYmUsIGNzciBkZWZpbml0aW9ucy4g
SSBjYW4gc2VwYXJhdGUgdGhlbQpvdXQgYXMgd2VsbCBpZiB0aGF0J3MgZGVzaXJlZC4KCkZ1cnRo
ZXJtb3JlLCBJIGRvIG5vdCBzZWUgYW4gaW1wbGVtZW50YXRpb24gb25seSBpbXBsZW1lbnRpbmcg
emljZmlscAp3aGlsZSBub3QgaW1wbGVtZW50aW5nIHppY2Zpc3MuIFRoZXJlIGlzIGEgY2FzZSBv
ZiBhIG5vbW11IGNhc2Ugd2hlcmUKb25seSB6aWNmaWxwIG1pZ2h0IGJlIGltcGxlbWVudGVkIGFu
ZCBubyB6aWNmaXNzLiBIb3dldmVyIHRoYXQncyB0aGUgY2FzZQp3aGljaCBpcyBhbnl3YXlzIHJp
c2N2IGxpbnV4IGtlcm5lbCBpcyBub3QgYWN0aXZlbHkgYmVpbmcgdGVzdGVkLiBJSVJDLAppdCB3
YXMgKG5vbW11IGxpbnV4KSBjb25zaWRlcmVkIHRvIGJlIHBoYXNlZCBvdXQvbm90IHN1cHBvcnRl
ZCBhcyB3ZWxsLgoKV2UgY291bGQgaGF2ZSB0d28gZGlmZmVyZW50IGNvbmZpZ3MgYnV0IEkgZG9u
J3Qgc2VlIHdoYXQgd291bGQgc2VydmUKYXBhcnQgZnJvbSB0aGUgYWJpbGl0eSB0byBidWlsZCBz
dXBwb3J0IGZvciBsYW5kaW5nIHBhZCBhbmQgc2hhZG93IHN0YWNrCmRpZmZlcmVudGx5LiBBcyBJ
IHNhaWQgZnJvbSBhIHVzYWJpbGl0eSBwb2ludCBvZiB2aWV3IGJvdGggZmVhdHVyZXMKYXJlIGNv
bXBsaW1lbnRpbmcKdG8gZWFjaCBvdGhlciByYXRoZXIgdGhhbiBzdGFuZGluZyBvdXQgYWxvbmUg
YW5kIHByb3ZpZGluZyBmdWxsIHByb3RlY3Rpb24uCgpBIGtlcm5lbCBpcyBidWlsdCB3aXRoIHN1
cHBvcnQgZm9yIGVuYWJsaW5nIGJvdGggZmVhdHVyZXMgb3Igbm9uZS4gU3VyZSB1c2VyCmNhbiB1
c2UgZWl0aGVyIG9mIHRoZSBwcmN0bCB0byBlbmFibGUgZWl0aGVyIG9mIHRoZSBmZWF0dXJlcyBp
biB3aGF0ZXZlcgpjb21iaW5hdGlvbiB0aGV5IHNlZSBmaXQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
