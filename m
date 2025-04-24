Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0CC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 04:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxQT629c2rWytMkziSTJ1lQoucRYtnLvbVXE1Gp3Pp8=; b=zNVlImFksrsaU2K1aCqLknDfEO
	H0Knkut0T1p0UHcKUTs9wcWEQE89UViKObaqrPhIQRVS3fJI72QOo8T+GvVATclqBteZwvEaj4wW7
	mS7vma9C7vsyH2NO+Z3639FEPbQ5UZkFe6WzBYMKzsWmP4Bb9YU8nWv49faaNbgtKbj6IbPQCslaP
	dM6+aNGpwelNTBcMrIBzrVDRNxaaLCICGuakb9soal7OKozbieiW4puBvxdoM/ts9PEw2dU/nVRdT
	hw+lXXdeR2lAxdZQO8eFGKHHpDhHp63DPrXGwRygdD7TuLvr6fKumyL6GLr9zPsXS6iVXNbJP9ERI
	9IDCyRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oRf-0000000CpEa-1rfp;
	Thu, 24 Apr 2025 04:44:19 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oRa-0000000CpCj-3df9
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 04:44:18 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7376e311086so668604b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 21:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745469854; x=1746074654; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d8Qiq1brGqi76YM1jZPx/K29TOoSYoqtc1NwyaTJxB8=;
        b=upbO/w8M7hupRyP6CIXyd57Pu2FtbxwdMwJi0ZLHKh1feKSGB4IaMqyDOJCpSJ/gD5
         n89ue87SQYkbvZvoNmwOaaSO0PzHLcRNBDjDKUzjOP600XPK345JfTDGFIANSbyCOd5S
         VvDnBTs5CccBdVkYl+uACpJ5O6EMBN+ILFQMWGkEGZO+5fVn++cImRajjgbw2wSZLU1I
         VYUOTUHAPE980iZih5ULnkj2fTHT2ktfSae6ZXREXQHAHfaSQvCMG6ZRjqstgzSn6wV9
         CS4LGjWA2bQRd+Ka7u3mSW26iL0yPpt04RjHNssSs04NTUtxjNz7F3G5LRcIAsOiOmVP
         Rw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745469854; x=1746074654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8Qiq1brGqi76YM1jZPx/K29TOoSYoqtc1NwyaTJxB8=;
        b=MSQlBXN36ETmDb4rVgTHzEl+5XGhu61FmyHXOHPRUDUqtVEqPODCoKR3s3YH3akRPc
         PMfcaWxtDYPmFERaIkWoTRpXWAC1A7lUTuMjghPLopbLYaIo8FZPJY59cBsKHRg1Hqvu
         RXGhXSevjZOqaFESOwZgUuWxO6OhkLHkt1zUSzholzP7JVMmz5YE8LG3QGhGb+wr5Rz6
         e+b9GW2n/GKMJzal4pwj1KZgHZZNmo7XSd/wepFtCLugTS6ThikAQll5EcyoOKKuPjB5
         GhlrLyr1pk2NiRr+0WsY2GkPRgMLbwNh15FKVRyYWkqXN0/UJllaATS2O5Rhf8yJwrrT
         mLaw==
X-Forwarded-Encrypted: i=1; AJvYcCW+3ZULgCntgYdBw+LZrTtvEn7EScognAg8gjX4iHKZ/XvKXkTABIvxiEeUQZ9qQvu/yUa5wEpx/GNA5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVyP2y08lL4tVupGh0OTTc8bKetZhQflhLBxndeI4YVkL26Z9p
	/S82YrF1jRsKefmUquiZlvQXvvQU8NAc1H0SjqwzEdwt+ZHjtu9mfX8NB+dJzCk=
X-Gm-Gg: ASbGncsn7CjPm03fNhVGm6u9PNx4DLWwCf3zJlmcrV64UktOT5lplYcsfF/5zXemUru
	hJ9se5IC8tJYqgxrnGwPMfbbYc/mQltrprwnTmScU71DS23+Ti8641Cfrf4bIMJ4Z8IL18bWLmJ
	N124DpVvTvbrY7hyoXWlvtg/vhhIr41rkBxDzL/l63elKqvJ+O46B8HF0hRbSABuZfhr/JVguiG
	AYDIjVMODhLy+XI/4gl/F6xU0X6v3x099r6cC35ALUcJp3tjkYhHfpje94Y+5RMcePBJq3xIgVJ
	UiRjru8dqCdGBJ9rGyb7tZrcrFlmyAzck6DkuBpClGGpzglvabA=
X-Google-Smtp-Source: AGHT+IEitFVHRTgSCgRhWMe9hU5oQbZR2x7Kpm268qxNcn6QnDdeucUqxqlmgTha+1K/W91b8N7XWQ==
X-Received: by 2002:a05:6a00:2182:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73e246647e4mr1767338b3a.14.1745469854052;
        Wed, 23 Apr 2025 21:44:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6aa52sm463483b3a.94.2025.04.23.21.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 21:44:13 -0700 (PDT)
Date: Wed, 23 Apr 2025 21:44:09 -0700
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
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
Message-ID: <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_214415_179489_A89479EC 
X-CRM114-Status: GOOD (  34.94  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMTE6NDU6NThBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wMy0xNFQxNDozOTozMS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2Vy
Y2ZpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaAo+PiBAQCAtMTQsNyArMTUs
OCBAQCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3M7Cj4+ICBzdHJ1Y3QgY2ZpX3N0YXR1cyB7Cj4+
ICAJdW5zaWduZWQgbG9uZyB1YmNmaV9lbiA6IDE7IC8qIEVuYWJsZSBmb3IgYmFja3dhcmQgY2Zp
LiAqLwo+PiAtCXVuc2lnbmVkIGxvbmcgcnN2ZCA6ICgoc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICog
OCkgLSAxKTsKPj4gKwl1bnNpZ25lZCBsb25nIHViY2ZpX2xvY2tlZCA6IDE7Cj4+ICsJdW5zaWdu
ZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9uZykgKiA4KSAtIDIpOwo+Cj5UaGUg
cnN2ZCBmaWVsZCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5IGFzIHRoZSBjb250YWluZXIgZm9yIHRo
ZSBiaXRmaWVsZAo+aXMgJ3Vuc2lnbmVkIGxvbmcnIHNpemVkLgo+Cj5XaHkgZG9uJ3Qgd2UgdXNl
IGJvb2xzIGhlcmUsIHRob3VnaD8KPkl0IG1pZ2h0IHByb2R1Y2UgYSBiZXR0ZXIgYmluYXJ5IGFu
ZCB3ZSdyZSBub3QgaHVydGluZyBmb3Igc3RydWN0IHNpemUuCgpJZiB5b3UgcmVtZW1iZXIgb25l
IG9mIHRoZSBwcmV2aW91cyBwYXRjaCBkaXNjdXNzaW9uLCB0aGlzIGdvZXMgaW50bwpgdGhyZWFk
X2luZm9gIERvbid0IHdhbnQgdG8gYmxvYXQgaXQuIEV2ZW4gaWYgd2UgZW5kIHNob3ZpbmcgaW50
byB0YXNrX3N0cnVjdCwKZG9uJ3Qgd2FudCB0byBibG9hdCB0aGF0IGVpdGhlci4gSSBjYW4ganVz
dCBjb252ZXJ0IGl0IGludG8gYml0bWFzayBpZgpiaXRmaWVsZHMgYXJlIGFuIGV5ZXNvcmUgaGVy
ZS4KCj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+PiBAQCAtMjQsNiArMjQsMTYgQEAgYm9vbCBpc19zaHN0
a19lbmFibGVkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKPj4gK2Jvb2wgaXNfc2hzdGtfYWxs
b2NhdGVkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykKPj4gK3sKPj4gKwlyZXR1cm4gdGFzay0+
dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUuc2hkd19zdGtfYmFzZSA/IHRydWUgOiBmYWxzZTsK
Pgo+SSB0aGluayB0aGF0IHRoZSBmb2xsb3dpbmcgaXMgY2xlYXJlcjoKPgo+ICByZXR1cm4gdGFz
ay0+dGhyZWFkX2luZm8udXNlcl9jZmlfc3RhdGUuc2hkd19zdGtfYmFzZQo+Cj4oU2ltaWxhciBm
b3IgYWxsIG90aGVyIGltcGxpY2l0IGNvbnZlcnNpb24gdGVybmFyaWVzLikKCkhtbS4uLiBub3Rl
ZC4KCj4KPj4gQEAgLTQyLDYgKzUyLDI2IEBAIHZvaWQgc2V0X2FjdGl2ZV9zaHN0ayhzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgc2hzdGtfYWRkcikKPj4gK3ZvaWQgc2V0
X3Noc3RrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgZW5hYmxlKQo+PiAr
ewo+PiArCWlmICghY3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjaygpKQo+PiArCQlyZXR1cm47Cj4+
ICsKPj4gKwl0YXNrLT50aHJlYWRfaW5mby51c2VyX2NmaV9zdGF0ZS51YmNmaV9lbiA9IGVuYWJs
ZSA/IDEgOiAwOwo+PiArCj4+ICsJaWYgKGVuYWJsZSkKPj4gKwkJdGFzay0+dGhyZWFkLmVudmNm
ZyB8PSBFTlZDRkdfU1NFOwo+PiArCWVsc2UKPj4gKwkJdGFzay0+dGhyZWFkLmVudmNmZyAmPSB+
RU5WQ0ZHX1NTRTsKPj4gKwo+PiArCWNzcl93cml0ZShDU1JfRU5WQ0ZHLCB0YXNrLT50aHJlYWQu
ZW52Y2ZnKTsKPgo+VGhlcmUgaXMgYSBuZXcgaGVscGVyIHdlIGNvdWxkIHJldXNlIGZvciB0aGlz
Ogo+Cj4gIGVudmNmZ191cGRhdGVfYml0cyh0YXNrLCBFTlZDRkdfU1NFLCBlbmFibGUgPyBFTlZD
RkdfU1NFIDogMCk7CgpZZWFoIGl0J3MgaW4gc3dpdGNoX3RvLmggaGVhZGVyLiBJJ2xsIHRoaW5r
IGFib3V0IGl0LgoKPgo+PiArfQo+PiBAQCAtMjYyLDMgKzI5Miw4MyBAQCB2b2lkIHNoc3RrX3Jl
bGVhc2Uoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCj4+ICtpbnQgYXJjaF9zZXRfc2hhZG93X3N0
YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2lnbmVkIGxvbmcgc3RhdHVzKQo+
PiArewo+PiArCS8qIFJlcXVlc3QgaXMgdG8gZW5hYmxlIHNoYWRvdyBzdGFjayBhbmQgc2hhZG93
IHN0YWNrIGlzIG5vdCBlbmFibGVkIGFscmVhZHkgKi8KPj4gKwlpZiAoZW5hYmxlX3Noc3RrICYm
ICFpc19zaHN0a19lbmFibGVkKHQpKSB7Cj4+ICsJCS8qIHNoYWRvdyBzdGFjayB3YXMgYWxsb2Nh
dGVkIGFuZCBlbmFibGUgcmVxdWVzdCBhZ2Fpbgo+PiArCQkgKiBubyBuZWVkIHRvIHN1cHBvcnQg
c3VjaCB1c2VjYXNlIGFuZCByZXR1cm4gRUlOVkFMLgo+PiArCQkgKi8KPj4gKwkJaWYgKGlzX3No
c3RrX2FsbG9jYXRlZCh0KSkKPj4gKwkJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICsJCXNpemUg
PSBjYWxjX3Noc3RrX3NpemUoMCk7Cj4+ICsJCWFkZHIgPSBhbGxvY2F0ZV9zaGFkb3dfc3RhY2so
MCwgc2l6ZSwgMCwgZmFsc2UpOwo+Cj5XaHkgZG9uJ3Qgd2UgdXNlIHRoZSB1c2Vyc3BhY2UtYWxs
b2NhdGVkIHN0YWNrPwo+Cj5JJ20gY29tcGxldGVseSBtaXNzaW5nIHRoZSBkZXNpZ24gaWRlYSBo
ZXJlLi4uICBVc2Vyc3BhY2UgaGFzIGFic29sdXRlCj5vdmVyIHRoZSBzaGFkb3cgc3RhY2sgcG9p
bnRlciBDU1IsIHNvIHdlIGRvbid0IG5lZWQgdG8gZG8gbXVjaCBpbiBMaW51eDoKPgo+MS4gaW50
ZXJmYWNlIHRvIHNldCB1cCBwYWdlIHRhYmxlcyB3aXRoIC1XLSBQVEUgYW5kCj4yLiBpbnRlcmZh
Y2UgdG8gY29udHJvbCBzZW52Y2ZnLlNTRS4KPgo+VXNlcnNwYWNlIGNhbiBkbyB0aGUgcmVzdC4K
CkRlc2lnbiBpcyBsaWtlIGZvbGxvd2luZzoKCldoZW4gYSB1c2VyIHRhc2sgd2FudHMgdG8gZW5h
YmxlIHNoYWRvdyBzdGFjayBmb3IgaXRzZWxmLCBpdCBoYXMgdG8gaXNzdWUKYSBzeXNjYWxsIHRv
IGtlcm5lbCAobGlrZSB0aGlzIHByY3RsKS4gTm93IGl0IGNhbiBiZSBkb25lIGluZGVwZW5kZW50
bHkgYnkKdXNlciB0YXNrIGJ5IGZpcnN0IGlzc3VpbmcgYG1hcF9zaGFkb3dfc3RhY2tgLCB0aGVu
IGFza2luZyBrZXJuZWwgdG8gbGlnaHQKdXAgZW52Y2ZnIGJpdCBhbmQgZXZlbnR1YWxseSB3aGVu
IHJldHVybiB0byB1c2VybW9kZSBoYXBwZW5zLCBpdCBjYW4gd3JpdGUKdG8gQ1NSLiBJdCBpcyBu
byBkaWZmZXJlbnQgZnJvbSBkb2luZyBhbGwgb2YgdGhlIGFib3ZlIHRvZ2V0aGVyIGluIHNpbmds
ZQpgcHJjdGxgIGNhbGwuIFRoZXkgYXJlIGVxdWl2YWxlbnQgaW4gdGhhdCBuYXR1cmUuCgpCYWNr
Z3JvdW5kIGlzIHRoYXQgeDg2IGZvbGxvd2VkIHRoaXMgYmVjYXVzZSB4ODYgaGFkIHdvcmtsb2Fk
cy9iaW5hcmllcy8KZnVuY3Rpb25zIHdpdGggKGRlZXApcmVjdXJzaXZlIGZ1bmN0aW9ucyBhbmQg
dGh1cyBieSBkZWZhdWx0IHdlcmUgZm9yY2VkCnRvIGFsd2F5cyBhbGxvY2F0ZSBzaGFkb3cgc3Rh
Y2sgdG8gYmUgb2YgdGhlIHNhbWUgc2l6ZSBhcyBkYXRhIHN0YWNrLiBUbwpyZWR1Y2UgYnVyZGVu
IG9uIHVzZXJzcGFjZSBmb3IgZGV0ZXJtaW5pbmcgYW5kIHRoZW4gYWxsb2NhdGluZyBzYW1lIHNp
emUKKHNpemUgb2YgZGF0YSBzdGFjaykgc2hhZG93IHN0YWNrLCBwcmN0bCB3b3VsZCBkbyB0aGUg
am9iIG9mIGNhbGN1bGF0aW5nCmRlZmF1bHQgc2hhZG93IHN0YWNrIHNpemUgKGFuZCByZWR1Y2Ug
cHJvZ3JhbW1pbmcgZXJyb3IgaW4gdXNlcm1vZGUpLiBhcm02NApmb2xsb3dlZCB0aGUgc3VpdGUu
IEkgZG9uJ3Qgd2FudCB0byBmaW5kIG91dCB3aGF0J3MgdGhlIGNvbXBhdGlibGl0eSBpc3N1ZXMK
d2Ugd2lsbCBzZWUgYW5kIHRodXMganVzdCBmb2xsb3dpbmcgdGhlIHN1aXRlIChnaXZlbiB0aGF0
IGJvdGggYXBwcm9hY2hlcwphcmUgZXF1aXZhbGVudCkuIFRha2UgYSBsb29rIGF0IHN0YXRpYyBg
Y2FsY19zaHN0a19zaXplKHVuc2lnbmVkIGxvbmcgc2l6ZSlgLgoKQ29taW5nIGJhY2sgdG8geW91
ciBxdWVzdGlvbiBvZiB3aHkgbm90IGFsbG93aW5nIHVzZXJzcGFjZSB0byBtYW5hZ2UgaXRzCm93
biBzaGFkb3cgc3RhY2suIEFuc3dlciBpcyB0aGF0IGl0IGNhbiBtYW5hZ2UgaXRzIG93biBzaGFk
b3cgc3RhY2suIElmIGl0CmRvZXMsIGl0IGp1c3QgaGF2ZSB0byBiZSBhd2FyZSBvZiBzaXplIGl0
cyBhbGxvY2F0aW5nIGZvciBzaGFkb3cgc3RhY2suCgpUaGVyZSBpcyBhbHJlYWR5IGEgcGF0Y2gg
c2VyaWVzIGdvaW5nIG9uIHRvIG1hbmFnZSB0aGlzIHVzaW5nIGNsb25lMy4KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA4LWNsb25lMy1zaGFkb3ctc3RhY2stdjE1LTQtM2ZhMjQ1
YzZlM2JlQGtlcm5lbC5vcmcvCgpJIGZ1bGx5IGV4cGVjdCBncmVlbiB0aHJlYWQgaW1wbGVtZW50
YXRpb25zIGluIHJ1c3QvZ28gb3Igc3dhcGNvbnRleHQKYmFzZWQgdGhyZWFkIG1hbmFnZW1lbnQg
ZG9pbmcgdGhpcyBvbiB0aGVpciBvd24uCgpDdXJyZW50IGRlc2lnbiBpcyB0byBlbnN1cmUgZXhp
c3RpbmcgYXBwcyBkb250IGhhdmUgdG8gY2hhbmdlIGEgbG90IGluCnVzZXJzcGFjZSBhbmQgYnkg
ZGVmYXVsdCBrZXJuZWwgZ2l2ZXMgY29tcGF0aWJpbGl0eS4gQW55b25lIGVsc2Ugd2FudGluZwp0
byBvcHRpbWl6ZSB0aGUgdXNhZ2Ugb2Ygc2hhZG93IHN0YWNrIGNhbiBkbyBzbyB3aXRoIGN1cnJl
bnQgZGVzaWduLgoKLSAKPgo+PiAraW50IGFyY2hfbG9ja19zaGFkb3dfc3RhY2tfc3RhdHVzKHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKPj4gKwkJCQkgIHVuc2lnbmVkIGxvbmcgYXJnKQo+PiAr
ewo+PiArCS8qIElmIHNodHN0ayBub3Qgc3VwcG9ydGVkIG9yIG5vdCBlbmFibGVkIG9uIHRhc2ss
IG5vdGhpbmcgdG8gbG9jayBoZXJlICovCj4+ICsJaWYgKCFjcHVfc3VwcG9ydHNfc2hhZG93X3N0
YWNrKCkgfHwKPj4gKwkgICAgIWlzX3Noc3RrX2VuYWJsZWQodGFzaykgfHwgYXJnICE9IDApCj4+
ICsJCXJldHVybiAtRUlOVkFMOwo+Cj5UaGUgdGFzayBtaWdodCB3YW50IHRvIHByZXZlbnQgc2hh
ZG93IHN0YWNrIGZyb20gYmVpbmcgZW5hYmxlZD8KCkJ1dCBXaHkgd291bGQgaXQgd2FudCB0byBk
byB0aGF0PyBUYXNrIGNhbiBzaW1wbHkgbm90IGlzc3VlIHRoZSBwcmN0bC4gVGhlcmUKYXJlIGds
aWJjIHR1bmFibGVzIGFzIHdlbGwgdXNpbmcgd2hpY2ggaXQgY2FuIGJlIGRpc2FibGVkLgoKPgo+
VGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
