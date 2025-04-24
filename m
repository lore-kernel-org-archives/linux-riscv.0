Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1836AC369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 00:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtqINmGdzTKt/Ood6m52WeunSoBQGnyaBCzm7LGPeSQ=; b=EKrVXy/iFUWhoPjhckUSVw6yyd
	D4QI6Frn9XZQ/gFHDSaGeAlovqP+sblM4+WIhXh5YPeYLTVLYOBfN8AbNjR2GZ2gVefyKG3oo4l/y
	wIvWrjtNEKxPb+2MWaPOayIOsHkC2dUUWp0fgiedD00AoM68jksdYMxoY8in1RbG6rIEPO+um98tU
	hKpjPep7nquvEia6OqhBtUzOeJJpjoW8iXvCaaZGdYNMX9OJCFNs45SgFd/kFLOR0+fpjvJSkvgHC
	kEYyOX5d8xrJu/irXiwyBM8Q6dKAV5uXRMIbhzldVSBtViSp5Fd4MELrHypKsLctZOmCctgoZGzWY
	zrNLPRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7k19-0000000CKsB-1Ssj;
	Thu, 24 Apr 2025 00:00:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7k15-0000000CKr9-1agk
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 00:00:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7399838db7fso482338b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745452834; x=1746057634; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S5OcT62i+cl9aw1kw4Ux6AcGa3HwoUmmaKY882iOUVM=;
        b=OlbQOCrCPIcDIoDnGpHuZIzKOlY0asHrwMmZy/AObQU0JLevWOxxPYuHMYNLvHcSze
         djkHKepmwFoOI9BG3o5eh1kCLT+KhTqRUfVm0FlBQOWYzDE9mPyIam/L73jMVpY5kRdt
         Mp5dYMX9dIif3hwfCgie2deW/cTUHgYfblS5rz/72bmO0jOT0K+v8OQeal7AkvenWEF/
         GwZAtkWju4SdyzIuRrEiM4rK8H+fKED+w0OroAV/9Ve+xpEztzUf0ELp99GwpIOoUxcj
         Jq0zGJz8W38x4Ucsj67NE2p1cI6dQLmhJrs6aGuMvFi87m2o/MxqhedOv63BD88O13SP
         mXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452834; x=1746057634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5OcT62i+cl9aw1kw4Ux6AcGa3HwoUmmaKY882iOUVM=;
        b=FbUVCVhtrKdnRb1pAufKKKWjRPLlGiPR8nzB97XkcVm9VXoRNqd4AFk9f+oiCKW/rG
         OWWYsYLyxfyVzvYmC+x6m4tat1V/Jt8SNGhcK8hCaMkitpiyHPXRbdDqJ71m4Rrc9daI
         GkJFGd5/Edn37onaliK7IZqLhXNL3WJy4NbMlL0G8rI8EcT1tr5C7PYHetwmKsxNSzev
         jrr7y8WIbcmXuvX3CDSxs5Hqa4GgAzxRsMPp+fmNIjuo+Kb9TFdRDDs2UrFeKdUeEehc
         /gU3R95pHKfj7f3w/uWG5mkcCkubdfu3r+hxFiSsiGwclPupucoqXP8h2D0qN1y3tNhg
         OhMA==
X-Forwarded-Encrypted: i=1; AJvYcCW62UENAZ70AF9mQzsOOa1HUJ0zjFM1QXnHrZqlya+ceww80KJzHhrzVse5UspOWn0x3a0LghL5M85tyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYsILzU0V+a5cgJQjyWAEophh0OvpmqZNBY3zpJ/SbF70AhG0m
	ldu+t3HKA6tlM2TpTEtAMKMcBeDitqqT0OJrYMwhKruo2iIgj4zAPi4ZZVlw3TM=
X-Gm-Gg: ASbGncs3LdA1e5VRT9+rwMoULbbb3pf7eRUmyJa3bqitB2pYJLetHQfVxmHTqzMd37d
	yuJ0UISLVK3E15hH1n1QyDvfV8ATlsNWgIoXbGVuxufoC3fRP5De9RXRBy1NQDJD8XKeBQ9fwmR
	plw1jrMqOk7SfgPJkW4x4I8AWqWX5x8S5QxxezmAkNHC3qh7WoNEJ+1wbxo0J0/La4vKFtAnITL
	IZLZxAETPRLPkwP8iIsbwoywnbQTMI/WyNK91VhaGTuDOevn1d8eCgs4HVfrylrhUhGLxrJomPz
	N9x663S1z7aDwc//3kEcYQBf1jFWCrqBcNhZTO52nJq9cwMjzHY=
X-Google-Smtp-Source: AGHT+IH4j35h3jLwkaElmed40lsuZThIxCdtbM8R+7icxou6aZCYqN/7j54Ho7tdgxWbsJBSD2dEvQ==
X-Received: by 2002:a05:6a00:3a1d:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-73e2680c3aemr381304b3a.9.1745452833588;
        Wed, 23 Apr 2025 17:00:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941cc1sm177897b3a.60.2025.04.23.17.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:00:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:00:29 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
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
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, broonie@kernel.org, rick.p.edgecombe@intel.com,
	Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aAl_HRk49lnseiio@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_170035_637293_C2F31F7C 
X-CRM114-Status: GOOD (  22.75  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMDE6MDQ6MzlQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wMy0xNFQxNDozOToyNC0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4+IEBAIC02
Miw2ICs2Miw5IEBAIHN0cnVjdCB0aHJlYWRfaW5mbyB7Cj4+ICAJbG9uZwkJCXVzZXJfc3A7CS8q
IFVzZXIgc3RhY2sgcG9pbnRlciAqLwo+PiAgCWludAkJCWNwdTsKPj4gIAl1bnNpZ25lZCBsb25n
CQlzeXNjYWxsX3dvcms7CS8qIFNZU0NBTExfV09SS18gZmxhZ3MgKi8KPj4gKyNpZmRlZiBDT05G
SUdfUklTQ1ZfVVNFUl9DRkkKPj4gKwlzdHJ1Y3QgY2ZpX3N0YXR1cwl1c2VyX2NmaV9zdGF0ZTsK
Pj4gKyNlbmRpZgo+Cj5JIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIHB1dCBhbGwgdGhl
IGRhdGEgaW4gdGhyZWFkX2luZm8uCj5rZXJuZWxfc3NwIGFuZCB1c2VyX3NzcCBpcyBtb3JlIHRo
YW4gZW5vdWdoIGFuZCB0aGUgcmVzdCBjYW4gY29tZm9ydGFibHkKPmxpdmUgZWxzZXdoZXJlIGlu
IHRhc2tfc3RydWN0Lgo+Cj50aHJlYWRfaW5mbyBpcyBzdXBwb3NlZCB0byBiZSBhcyBzbWFsbCBh
cyBwb3NzaWJsZSAtLSBqdXN0IHNwYW5uaW5nCj5tdWx0aXBsZSBjYWNoZS1saW5lcyBjb3VsZCBi
ZSBub3RpY2VhYmxlLgoKSSBjYW4gY2hhbmdlIGl0IHRvIG9ubHkgaW5jbHVkZSBvbmx5IGB1c2Vy
X3NzcGAsIGJhc2UgYW5kIHNpemUuCgpCdXQgYmVmb3JlIHdlIGdvIHRoZXJlLCBzZWUgYmVsb3c6
CgokIHBhaG9sZSAtQyB0aHJlYWRfaW5mbyBrYnVpbGQvdm1saW51eApzdHJ1Y3QgdGhyZWFkX2lu
Zm8gewogICAgICAgICBsb25nIHVuc2lnbmVkIGludCAgICAgICAgICBmbGFnczsgICAgICAgICAg
ICAgICAgLyogICAgIDAgICAgIDggKi8KICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAg
ICAgcHJlZW1wdF9jb3VudDsgICAgICAgIC8qICAgICA4ICAgICA0ICovCgogICAgICAgICAvKiBY
WFggNCBieXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLwoKICAgICAgICAgbG9uZyBpbnQgICAgICAg
ICAgICAgICAgICAga2VybmVsX3NwOyAgICAgICAgICAgIC8qICAgIDE2ICAgICA4ICovCiAgICAg
ICAgIGxvbmcgaW50ICAgICAgICAgICAgICAgICAgIHVzZXJfc3A7ICAgICAgICAgICAgICAvKiAg
ICAyNCAgICAgOCAqLwogICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAgICBjcHU7ICAg
ICAgICAgICAgICAgICAgLyogICAgMzIgICAgIDQgKi8KCiAgICAgICAgIC8qIFhYWCA0IGJ5dGVz
IGhvbGUsIHRyeSB0byBwYWNrICovCgogICAgICAgICBsb25nIHVuc2lnbmVkIGludCAgICAgICAg
ICBzeXNjYWxsX3dvcms7ICAgICAgICAgLyogICAgNDAgICAgIDggKi8KICAgICAgICAgc3RydWN0
IGNmaV9zdGF0dXMgICAgICAgICAgdXNlcl9jZmlfc3RhdGU7ICAgICAgIC8qICAgIDQ4ICAgIDMy
ICovCiAgICAgICAgIC8qIC0tLSBjYWNoZWxpbmUgMSBib3VuZGFyeSAoNjQgYnl0ZXMpIHdhcyAx
NiBieXRlcyBhZ28gLS0tICovCiAgICAgICAgIGxvbmcgdW5zaWduZWQgaW50ICAgICAgICAgIGEw
OyAgICAgICAgICAgICAgICAgICAvKiAgICA4MCAgICAgOCAqLwogICAgICAgICBsb25nIHVuc2ln
bmVkIGludCAgICAgICAgICBhMTsgICAgICAgICAgICAgICAgICAgLyogICAgODggICAgIDggKi8K
ICAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgYTI7ICAgICAgICAgICAgICAgICAg
IC8qICAgIDk2ICAgICA4ICovCgogICAgICAgICAvKiBzaXplOiAxMDQsIGNhY2hlbGluZXM6IDIs
IG1lbWJlcnM6IDEwICovCiAgICAgICAgIC8qIHN1bSBtZW1iZXJzOiA5NiwgaG9sZXM6IDIsIHN1
bSBob2xlczogOCAqLwogICAgICAgICAvKiBsYXN0IGNhY2hlbGluZTogNDAgYnl0ZXMgKi8KfTsK
CklmIHdlIHdlcmUgdG8gcmVtb3ZlIGVudGlyZSBgY2ZpX3N0YXR1c2AsIGl0IHdvdWxkIHN0aWxs
IGJlIDcyIGJ5dGVzICg4OCBieXRlcwppZiBzaGFkb3cgY2FsbCBzdGFjayB3ZXJlIGVuYWJsZWQp
IGFuZCBhbHJlYWR5IHNwYW5zIGFjcm9zcyB0d28gY2FjaGVsaW5lcy4gSQpkaWQgc2VlIHRoZSBj
b21tZW50IGFib3ZlIHRoYXQgaXQgc2hvdWxkIGZpdCBpbnNpZGUgYSBjYWNoZWxpbmUuIEFsdGhv
dWdoIEkKYXNzdW1lZCBpdHMgc3RhbGUgY29tbWVudCBnaXZlbiB0aGF0IGl0IGFscmVhZHkgc3Bh
bnMgYWNyb3NzIGNhY2hlbGluZSBhbmQgSQpkaWRuJ3Qgc2VlIGFueSBzcGVjaWFsIG1lbnRpb24g
aW4gY29tbWl0IG1lc3NhZ2VzIG9mIGNoYW5nZXMgd2hpY2ggZ3JldyB0aGlzCnN0cnVjdHVyZSBh
Ym92ZSBvbmUgY2FjaGVsaW5lLiBTbyBJIGFzc3VtZWQgdGhpcyB3YXMgYSBzdGFsZSBjb21tZW50
LgoKT24gdGhlIG90aGVyIGhhbmQsIHdoZW5ldmVyIGVuYWJsZS9sb2NrIGJpdHMgYXJlIGNoZWNr
ZWQsIHRoZXJlIGlzIGEgaGlnaApsaWtlbHlob29kIHRoYXQgdXNlcl9zc3AgYW5kIG90aGVyIGZp
ZWxkcyBhcmUgZ29pbmcgdG8gYmUgYWNjZXNzZWQgYW5kCnRodXMgaXQgYWN0dWFsbHkgbWlnaHQg
YmUgaGVscGZ1bCB0byBoYXZlIGl0IGFsbCBpbiBvbmUgY2FjaGVsaW5lIGR1cmluZwpydW50aW1l
LgoKU28gSSBhbSBub3Qgc3VyZSBpZiBpdHMgaGVscGZ1bCBzdGlja2luZyB0byB0aGUgY29tbWVu
dCB3aGljaCBhbHJlYWR5IGlzIHN0YWxlLgoKPgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4gQEAgLTE0Nyw2ICsx
NDcsMjAgQEAgU1lNX0NPREVfU1RBUlQoaGFuZGxlX2V4Y2VwdGlvbikKPj4KPj4gIAlSRUdfTCBz
MCwgVEFTS19USV9VU0VSX1NQKHRwKQo+PiAgCWNzcnJjIHMxLCBDU1JfU1RBVFVTLCB0MAo+PiAr
CS8qCj4+ICsJICogSWYgcHJldmlvdXMgbW9kZSB3YXMgVSwgY2FwdHVyZSBzaGFkb3cgc3RhY2sg
cG9pbnRlciBhbmQgc2F2ZSBpdCBhd2F5Cj4+ICsJICogWmVybyBDU1JfU1NQIGF0IHRoZSBzYW1l
IHRpbWUgZm9yIHNhbml0aXphdGlvbi4KPj4gKwkgKi8KPj4gKwlBTFRFUk5BVElWRSgibm9wOyBu
b3A7IG5vcDsgbm9wIiwKPj4gKwkJCQlfX3N0cmluZ2lmeSgJCQlcCj4+ICsJCQkJYW5kaSBzMiwg
czEsIFNSX1NQUDsJXAo+PiArCQkJCWJuZXogczIsIHNraXBfc3NwX3NhdmU7CVwKPj4gKwkJCQlj
c3JydyBzMiwgQ1NSX1NTUCwgeDA7CVwKPj4gKwkJCQlSRUdfUyBzMiwgVEFTS19USV9VU0VSX1NT
UCh0cCk7IFwKPj4gKwkJCQlza2lwX3NzcF9zYXZlOiksCj4+ICsJCQkJMCwKPj4gKwkJCQlSSVND
Vl9JU0FfRVhUX1pJQ0ZJU1MsCj4+ICsJCQkJQ09ORklHX1JJU0NWX1VTRVJfQ0ZJKQo+Cj4oSSdk
IHByZWZlciB0aGlzIGNsb3NlciB0byB0aGUgdXNlcl9zcCBhbmQga2VybmVsX3NwIHN3YXAsIGl0
J3MgYnJlYWtpbmcKPiB0aGUgZmxvdyBoZXJlLiAgV2UgYWxzbyBhbHJlYWR5IGtub3cgaWYgd2Un
dmUgcmV0dXJuZWQgZnJvbSB1c2Vyc3BhY2UKPiBvciBub3QgZXZlbiB3aXRob3V0IFNSX1NQUCwg
YnV0IHJldXNpbmcgdGhlIGluZm9ybWF0aW9uIG1pZ2h0IHRhbmdsZQo+IHRoZSBsb2dpYy4pCj4K
Pj4gIAljc3JyIHMyLCBDU1JfRVBDCj4+ICAJY3NyciBzMywgQ1NSX1RWQUwKPj4gIAljc3JyIHM0
LCBDU1JfQ0FVU0UKPj4gQEAgLTIzNiw2ICsyNTAsMTggQEAgU1lNX0NPREVfU1RBUlRfTk9BTElH
TihyZXRfZnJvbV9leGNlcHRpb24pCj4+ICAJY3NydyBDU1JfU0NSQVRDSCwgdHAKPj4gKwo+PiAr
CS8qCj4+ICsJICogR29pbmcgYmFjayB0byBVIG1vZGUsIHJlc3RvcmUgc2hhZG93IHN0YWNrIHBv
aW50ZXIKPj4gKwkgKi8KPgo+QXJlIHdlPyAgSSB0aGluayB3ZSBjYW4gYmUganVzdCBhcyB3ZWxs
IHJldHVybmluZyBiYWNrIHRvIGtlcm5lbC1zcGFjZS4KPlNpbWlsYXIgdG8gaG93IHdlIGNhbiBl
bnRlciB0aGUgZXhjZXB0aW9uIGhhbmRsZXIgZnJvbSBrZXJuZWwtc3BhY2UuCj4KPj4gKwlBTFRF
Uk5BVElWRSgibm9wOyBub3AiLAo+PiArCQkJCV9fc3RyaW5naWZ5KAkJCQkJXAo+PiArCQkJCVJF
R19MIHMzLCBUQVNLX1RJX1VTRVJfU1NQKHRwKTsgXAo+PiArCQkJCWNzcncgQ1NSX1NTUCwgczMp
LAo+PiArCQkJCTAsCj4+ICsJCQkJUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLAo+PiArCQkJCUNPTkZJ
R19SSVNDVl9VU0VSX0NGSSkKPj4gKwo+Cj5UaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
