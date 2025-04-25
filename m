Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C8DC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grnQaxSqTmyBx41JGaA6fjEOWASIGx5TmmxxkPy4h0o=; b=bZ8Pv8Vgz5kw5HrGD9Ed7TzURt
	eMUohpa9rwj8yyCX6SkB0VrqfYCwBEFEEcXFW3C1iubOECeaYiBMynkh7Cl0DiqdVHKlz/dcBQlQV
	fS+RurK53MEf0ISs1Xoa7os/4UGUapOsly+AnrnWIFXCV+Aq4rj6hV5JB2A3TZ8XeGvOo3mMFkrYb
	vvorZTnkFo406DCwie9ADRdftyWjhxn2lavCKsaJlr6aZmJax53kWqvc+prbAzVxltU2PgcS4RfUS
	j7dC8p6ZTwrYoIsbXkrvQlsYzwekVwYY6ouj1cICWbRr39XfxicaUsb3LWJge+YJfFtH0S3Kyv40n
	iM/ph+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NG0-00000000Sta-3d56;
	Fri, 25 Apr 2025 17:54:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8M5D-00000000Fno-0xFy
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 16:39:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22c33e4fdb8so27810915ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745599162; x=1746203962; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uObhd6griCLVRMAdAUyHQB5JJqltVnuTe7FYQAThLL4=;
        b=EGucQCcYPRigBS3FfZx8dNwMTSfSNEzE+Nr5/yYlRWGFxwLPOKoHWYSHybNNqOxzpA
         eSA0E1I6ztvIhh7RgQ3CRVlCrEKIAm/ji50DI+VVMrT2+cpogcIJsGWtjrLFgLFcfjKz
         /tAOGAsZ7XptYqCy5S723QkX16QxndvT7fBUbcS/udKFsfxFsw/Os2R/g4OLiLGITk8n
         awo34/4TgjH8d+X9eKXcIuk8fDR6fp9tRkyEMFGktbarT/uXkXeY8esWmu9T6Sp2UdBi
         SVE4GN4hDZ9rxDMPKOu6oTnkqpY9VWAIqy85CsrHxAJ1fL7rb2hEhcNSMBsymAXcC86d
         PjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599162; x=1746203962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uObhd6griCLVRMAdAUyHQB5JJqltVnuTe7FYQAThLL4=;
        b=IARFu7olwUUa0el8VK7MGQUIsqr/6MiSY5AyKWfSe34lxO8Rh3vFRgLliyDRCoYSN0
         iuA/AEuZLBr6r1M9jiBNoFkYOw5mwNEQDt4LcBop4R9dD8xrO0tzVNFCSRpHfbvjRETZ
         ZNqLBqVXqN34A1BNFUvB+zNA+yLddfjM7oJB77fMSHguZewIpaA9UbAHHXVDUh+Pi+Rw
         CKDfMEJXomPnNmBHdeN5q4ewz8wN0q9KMfkjfYJtNcul9HxQ623hV6kgCXThZ7kpCToX
         aTd50iS+yXeNiR/jb+/QLQyRUlonURJOPaM3Fukhr6iPnvSbmIHEuUr4IXcuIZDFVREq
         8KBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTxpNziSUsfe+SOEfystD+WRrRd5LUDvkM6ARi4rUHYv+1Nn3skFye88aF0vfZTTxyAYXOOeKa6/di+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+58dfX3yI9CJ57C/cjNXWSdE/UunhJNNvXpHRYcAlCl4+rh02
	NnTTfgkBc+iKFZ3DMIKWP/GumA9I3r30mlVenjcYoIDKT/jL5ddz+m1MZSbWoyk=
X-Gm-Gg: ASbGncsrm5f7uWXPC8s8qi7wARXU8X0ao+0e5YNuLQOEt7ttYLHC1VcV085f5G4Uxdn
	F2Q4REswwuzPJ5ypEUD2wwcA2bwixlIST7CEqTAhED/qQuGM1R6A/HJ5fJX0K5vAHH/E93Hs2++
	XyFCtJetWV+Kl5ARCk6/Z+DxfgkkaWdQLF2v7gxLqxCEATmSBEWP3ZhsaBO5kGj5Ar+zp601QjJ
	PwZZOxF/Kx5d6veo1gCDq8WAmyml70g1HQJo+Niknrfv1waqssBXFLgNddSLQrralM7IzyApkYS
	mv876Fq4JGVXSVhDPNmcoYV5CnDRw37mhlM4NprnY/W3ixxzHSE=
X-Google-Smtp-Source: AGHT+IFNazEr6ZYOzQGCXjgc58dYoHgOgILSppSPlOaxKyAejkPiwQZrkFFar4hARLXGCzwX+g5Izw==
X-Received: by 2002:a17:903:40c9:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-22dbf4db64dmr47389315ad.5.1745599161894;
        Fri, 25 Apr 2025 09:39:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51028basm34556395ad.196.2025.04.25.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:39:21 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:39:18 -0700
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
Message-ID: <aAu6toR4VkcPMTlH@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
 <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
 <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
 <aAp_87-Xr6gn_hD7@debug.ba.rivosinc.com>
 <D9FOY8JACYTH.1FU7ZTEHFC5NI@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9FOY8JACYTH.1FU7ZTEHFC5NI@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_093923_509926_5C1ADFB1 
X-CRM114-Status: GOOD (  23.18  )
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

T24gRnJpLCBBcHIgMjUsIDIwMjUgYXQgMDE6NDI6NDRQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wNC0yNFQxMToxNjoxOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAwMzozNjo1NFBNICswMjAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMDQtMjNUMjE6NDQ6MDktMDc6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBPbiBUaHUsIEFwciAxMCwgMjAy
NSBhdCAxMTo0NTo1OEFNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4+MjAyNS0w
My0xNFQxNDozOTozMS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Ogo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmgKPj4+Pj4+IEBAIC0xNCw3ICsxNSw4IEBAIHN0
cnVjdCBrZXJuZWxfY2xvbmVfYXJnczsKPj4+Pj4+ICBzdHJ1Y3QgY2ZpX3N0YXR1cyB7Cj4+Pj4+
PiAgCXVuc2lnbmVkIGxvbmcgdWJjZmlfZW4gOiAxOyAvKiBFbmFibGUgZm9yIGJhY2t3YXJkIGNm
aS4gKi8KPj4+Pj4+IC0JdW5zaWduZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9u
ZykgKiA4KSAtIDEpOwo+Pj4+Pj4gKwl1bnNpZ25lZCBsb25nIHViY2ZpX2xvY2tlZCA6IDE7Cj4+
Pj4+PiArCXVuc2lnbmVkIGxvbmcgcnN2ZCA6ICgoc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICogOCkg
LSAyKTsKPj4+Pj4KPj4+Pj5UaGUgcnN2ZCBmaWVsZCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5IGFz
IHRoZSBjb250YWluZXIgZm9yIHRoZSBiaXRmaWVsZAo+Pj4+PmlzICd1bnNpZ25lZCBsb25nJyBz
aXplZC4KPj4+Pj4KPj4+Pj5XaHkgZG9uJ3Qgd2UgdXNlIGJvb2xzIGhlcmUsIHRob3VnaD8KPj4+
Pj5JdCBtaWdodCBwcm9kdWNlIGEgYmV0dGVyIGJpbmFyeSBhbmQgd2UncmUgbm90IGh1cnRpbmcg
Zm9yIHN0cnVjdCBzaXplLgo+Pj4+Cj4+Pj4gSWYgeW91IHJlbWVtYmVyIG9uZSBvZiB0aGUgcHJl
dmlvdXMgcGF0Y2ggZGlzY3Vzc2lvbiwgdGhpcyBnb2VzIGludG8KPj4+PiBgdGhyZWFkX2luZm9g
IERvbid0IHdhbnQgdG8gYmxvYXQgaXQuIEV2ZW4gaWYgd2UgZW5kIHNob3ZpbmcgaW50byB0YXNr
X3N0cnVjdCwKPj4+PiBkb24ndCB3YW50IHRvIGJsb2F0IHRoYXQgZWl0aGVyLiBJIGNhbiBqdXN0
IGNvbnZlcnQgaXQgaW50byBiaXRtYXNrIGlmCj4+Pj4gYml0ZmllbGRzIGFyZSBhbiBleWVzb3Jl
IGhlcmUuCj4+Pgo+Pj4gICJ1bnNpZ25lZCBsb25nIHJzdmQgOiAoKHNpemVvZih1bnNpZ25lZCBs
b25nKSAqIDgpIC0gMik7Igo+Pj4KPj4+aXMgYW4gZXllc29yZSB0aGF0IGRlZmluZXMgZXhhY3Rs
eSB0aGUgc2FtZSBhcyB0aGUgdHdvIGxpbmVzIGFsb25lCj4+Pgo+Pj4gIHVuc2lnbmVkIGxvbmcg
dWJjZmlfZW4gOiAxOwo+Pj4gIHVuc2lnbmVkIGxvbmcgdWJjZmlfbG9ja2VkIDogMTsKPj4+Cj4+
PlRoYXQgb25lIHNob3VsZCBiZSByZW1vdmVkLgo+Pj4KPj4+SWYgd2UgaGF2ZSBvbmx5IDQgYml0
cyBpbiA0LzggYnl0ZXMsIHRoZW4gYml0ZmllbGRzIGRvIGdlbmVyYXRlIHdvcnNlCj4+PmNvZGUg
dGhhbiA0IGJvb2xzIGFuZCBhIDAvNCBieXRlIGhvbGUuICBUaGUgc3RydWN0IHNpemUgc3RheXMg
dGhlIHNhbWUuCj4+Pgo+Pj5JIGRvbid0IGNhcmUgbXVjaCBhYm91dCB0aGUgc3dpdGNoIHRvIGJv
b2xzLCB0aG91Z2gsIGJlY2F1c2UgdGhpcyBjb2RlCj4+PmlzIG5vdCBjYWxsZWQgb2Z0ZW4uCj4+
Cj4+IEknbGwgcmVtb3ZlIHRoZSBiaXRmaWVsZHMsIGhhdmUgc2luZ2xlIGB1bnNpZ25lZCBsb25n
IGNmaV9jb250cm9sX3N0YXRlYAo+PiBBbmQgZG8gYCNkZWZpbmUgUklTQ1ZfVUJDRklfRU4gMWAg
YW5kIHNvIG9uLgo+Cj5JIG1pZ2h0IGhhdmUgc2VlbWVkIHRvbyBtdWNoIGFnYWluc3QgdGhlIGJp
dGZpZWRzLCBzb3JyeS4gIEkgYW0gYWdhaW5zdAo+dGhlIHJzdmQgZmllbGRzLCBiZWNhdXNlIGl0
IGlzIGEgcG9pbnRsZXNzIGNvZ25pdGl2ZSBvdmVyaGVhZCBhbmQgZXZlbgo+dGhpcyBzZXJpZXMg
YWxyZWFkeSBoYWQgYSBidWcgaW4gdGhlbS4KCkFhaCBnb3QgaXQuCgo+Cj4jZGVmaW5lcyBzaG91
bGQgZ2VuZXJhdGUgdGhlIHNhbWUgY29kZSBhcyBiaXRmaWVsZHMgKHdvcnNlIHRoYW4gYm9vbHMp
LAo+c28gdGhlIHNvdXJjZSBjb2RlIGlzIHJlYWxseSBhIG1hdHRlciBvZiBwZXJzb25hbCBwcmVm
ZXJlbmNlLgo+KEkgZG8gcHJlZmVyIGJpdGZpZWxkcy4pCj4KPj4+Pj4+IEBAIC0yNjIsMyArMjky
LDgzIEBAIHZvaWQgc2hzdGtfcmVsZWFzZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPj4+Pj4+
ICtpbnQgYXJjaF9sb2NrX3NoYWRvd19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrLAo+Pj4+Pj4gKwkJCQkgIHVuc2lnbmVkIGxvbmcgYXJnKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsJ
LyogSWYgc2h0c3RrIG5vdCBzdXBwb3J0ZWQgb3Igbm90IGVuYWJsZWQgb24gdGFzaywgbm90aGlu
ZyB0byBsb2NrIGhlcmUgKi8KPj4+Pj4+ICsJaWYgKCFjcHVfc3VwcG9ydHNfc2hhZG93X3N0YWNr
KCkgfHwKPj4+Pj4+ICsJICAgICFpc19zaHN0a19lbmFibGVkKHRhc2spIHx8IGFyZyAhPSAwKQo+
Pj4+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Cj4+Pj4+VGhlIHRhc2sgbWlnaHQgd2FudCB0
byBwcmV2ZW50IHNoYWRvdyBzdGFjayBmcm9tIGJlaW5nIGVuYWJsZWQ/Cj4+Pj4KPj4+PiBCdXQg
V2h5IHdvdWxkIGl0IHdhbnQgdG8gZG8gdGhhdD8gVGFzayBjYW4gc2ltcGx5IG5vdCBpc3N1ZSB0
aGUgcHJjdGwuIFRoZXJlCj4+Pj4gYXJlIGdsaWJjIHR1bmFibGVzIGFzIHdlbGwgdXNpbmcgd2hp
Y2ggaXQgY2FuIGJlIGRpc2FibGVkLgo+Pj4KPj4+VGhlIHRhc2sgbWlnaHQgZG8gaXQgYXMgc29t
ZSBsYXN0IHJlc29ydCB0byBwcmV2ZW50IGEgYnVnZ3kgY29kZSBmcm9tCj4+PmVuYWJsaW5nIHNo
YWRvdyBzdGFja3MgdGhhdCB3b3VsZCBqdXN0IGNyYXNoLiAgT3Igd2hhdGV2ZXIgY29tcGxpY2F0
ZWQKPj4+cmVhc29uIHVzZXJzcGFjZSBjYW4gdGhpbmsgb2YuCj4+Pgo+Pj5JdCdzIG1vcmUgdGhl
IG90aGVyIHdheSBhcm91bmQuICBJIHdvbmRlciB3aHkgd2UncmUgcmVtb3ZpbmcgdGhpcyBvcHRp
b24KPj4+d2hlbiB3ZSBkb24ndCByZWFsbHkgY2FyZSB3aGF0IHVzZXJzcGFjZSBkb2VzIHRvIGl0
c2VsZi4KPj4+SSB0aGluayBpdCdzIGNvbXBsaWNhdGluZyB0aGUga2VybmVsIHdpdGhvdXQgYW4g
b2J2aW91cyBnYWluLgo+Pgo+PiBJdCBqdXN0IGZlZWxzIHdpZXJkLiBUaGVyZSBpc24ndCBhbnl0
aGluZyBsaWtlIHRoaXMgZm9yIG90aGVyIGZlYXR1cmVzIGxpdC11cAo+PiB2aWEgZW52Y2ZnLiBE
b2VzIGh3cHJvYmUgYWxsb3cgdGhpcyBvbiBwZXItdGFzayBiYXNpcz8gSSdsbCBsb29rIGludG8g
aXQuCj4KPkkgdGhpbmsgUE1NIGRvZXNuJ3QgYWxsb3cgdG8gbG9jayBhbmQgdGhlIHJlc3QgZG9u
J3Qgc2VlbSBjb25maWd1cmFibGUKPmZyb20gdXNlcnNwYWNlLgo+Cj5JdCdzIG5vdCB0aGF0IGlt
cG9ydGFudCBhbmQgd2UgaG9wZWZ1bGx5IHdvbid0IGJlIGJyZWFraW5nIGFueSB1c2Vyc3BhY2UK
PmlmIHdlIGRlY2lkZWQgdG8gYWxsb3cgaXQgbGF0ZXIsIHNvIEknbSBmaW5lIHdpdGggdGhpcyB2
ZXJzaW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
