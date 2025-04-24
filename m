Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA183C369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8BlBsXa0eF14dAM+RcvLqB8qdtB1eLofDoGTAkdbpI=; b=Ms5Sua/WJ+L7kuFD4Ajm8fVzb8
	SpIGTlzdwQGw3QwybQQqZvpp2M4jvGADGpOeFqN22WqHa8XJlMKq0kenV2o0P27bSsJuX5IOre8ls
	YQlZlMeC0POm//yi+11b90luzlbdLMwLzY5cuBEuuWoZgnLB4uOm8HDG4vIngu/b1qaKP/0Lioen+
	QE+lVg2V/XorD6tgCeT/KLUrvKBq1xEhma7NrM4SuBTPPoYq4tYpuGy9DKZ1OjK922EnG6wkBpy/4
	feHBJWfa1CywfhIDyPBPonCPypVEnfeLY50gcg+UHuwDvQQlHOWuG+/ayU6Ktig4WeXeu6Cj4LJ1z
	8SstQ1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kcN-0000000CPr8-1CXI;
	Thu, 24 Apr 2025 00:39:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kNl-0000000CNvW-3uDN
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 00:24:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227d6b530d8so4444505ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 17:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745454241; x=1746059041; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lGbM0o/TGPFqR3aQeqhm8zgtQt8YivoCdhsm3mycjoo=;
        b=bI1qZHSg6RAhqRux2L7ZufsoUWUX4kJzhT4yFM6cPmnBS0TxQKKvXEQhvV4GAeO7qk
         b4iuYWKp8AcItGYlJd7wazw8rMq7KPNdWDxqb9DiDE5GMBxBC6NN1xp9eoZLZI2/llVj
         nzz03TlN9vcru/lp7YOChusRbz0cPouTLJk+x2bi/q3VTsuTHwpOO+Yy4ySNEm4GivSJ
         nJW4Z2kBCaNEdMGfCPWrdU86T4dcBuJPWtIRPlJbQkE4iP020eONnSS4YuNd60JY7LtF
         k/FjL//gBrCv50+nOEctOf3NLXORmIqmhMnyxf5pIAvfh95WYf+J2F+DICgTrmBI6ki8
         BFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745454241; x=1746059041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGbM0o/TGPFqR3aQeqhm8zgtQt8YivoCdhsm3mycjoo=;
        b=OwfPRL9uL1fsis9Pwd2YUQWVNk1JFIFz4y8dmcf/lI+ISzFFZxc6XkJy3dOjkMqo+/
         JAOWpIBlgKzxSYEFCVdJtW+ixBaGCCAW0/6apaL2ELiWNkhcpicqnMCT+AOpTKyp+mB+
         XW8QyZC3/aiv7n1pYvRV8mUWZ+HKgGcahGbApfvfA95a+pBqXhnZseBaS/gfDC+2IKwt
         Ghv2D1oQss3GNTtGvIDjYycXJE7MpQy2xHKDpZVu7QupQ32zT0LrXSU+FD6dQOtnvxzI
         9DB/BUfGqVZA2zciP/rcU/Ig4H7JB8DAoyZlTUFikBAKEUv1hRRrRo5F1kT5lag5kDXH
         ugsg==
X-Forwarded-Encrypted: i=1; AJvYcCXvg0DJFkoIL83bICuf4LkwoHSeOuMTXK0BbDxiLSm9JsT66lCxi2oC2nSCDOT7UfGwfijM4OdzT8R1DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQPe+1Qt6lT9iWa75ksC+xPT94x1pcXdTB53fj4u29yWA0QXLx
	CdEJXjHt3HM9JxiWU9Zmyat5df7nOksYbQB54DwgPpLNmMf41uufrfcRgjZ+ifg=
X-Gm-Gg: ASbGncuvxgCv/8H4dQWlldfDlu34wnNMQBwlKFeW4/QPozLXvqnyTtwpv6V9U61fvuE
	U90EzhAbxFiJiQEneYYfa237zHIHc+wecp7ZImFmvl/6r9zS2XTI87CK2/cFdPJuP8kjEA8JzBm
	v9rpEmzZhjonO21wTDXujKdczsbAkcbmyiKGIcQ6ClptUbze0dARY7HDvAeFN/ayD5gqxDU/IGd
	GxToilk2VnROstO0Yh186xSKWcaO8WrkHpxEqdW8OROgj1ouXeWa5K8vCxHVBkEwKdjyhKLqLTj
	md/EJAADei2xVauWxENL8ZoubsII1SjPYq2WAnvhtiKyD9GRR8w=
X-Google-Smtp-Source: AGHT+IGyYV/yzfLVnA9w34LRw7jQyIRxTFaioHQFl6p52L2kjU27J0WT2xyCuQTG4x/GFtq73xmJJA==
X-Received: by 2002:a17:903:1103:b0:22c:3609:97ed with SMTP id d9443c01a7336-22db3c3a039mr6299555ad.30.1745454240827;
        Wed, 23 Apr 2025 17:24:00 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5103259sm672675ad.185.2025.04.23.17.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:24:00 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:23:56 -0700
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
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aAmEnK0vSgZZOORL@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_172401_985221_9FB8F93D 
X-CRM114-Status: GOOD (  20.12  )
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

U29ycnkgZm9yZ290IHRvIHJlc3BvbmQgdG8gcmVzdCBvZiB5b3VyIGNvbW1lbnRzIG9uIHRoaXMg
dGhyZWFkLgoKCk9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDAxOjA0OjM5UE0gKzAyMDAsIFJhZGlt
IEtyxI1tw6HFmSB3cm90ZToKPjIwMjUtMDMtMTRUMTQ6Mzk6MjQtMDc6MDAsIERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGhyZWFkX2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8u
aAo+PiBAQCAtNjIsNiArNjIsOSBAQCBzdHJ1Y3QgdGhyZWFkX2luZm8gewo+PiAgCWxvbmcJCQl1
c2VyX3NwOwkvKiBVc2VyIHN0YWNrIHBvaW50ZXIgKi8KPj4gIAlpbnQJCQljcHU7Cj4+ICAJdW5z
aWduZWQgbG9uZwkJc3lzY2FsbF93b3JrOwkvKiBTWVNDQUxMX1dPUktfIGZsYWdzICovCj4+ICsj
aWZkZWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJCj4+ICsJc3RydWN0IGNmaV9zdGF0dXMJdXNlcl9j
Zmlfc3RhdGU7Cj4+ICsjZW5kaWYKCjwuLi4gc25pcHBlZCAuLi4+Cgo+Cj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
Cj4+IEBAIC0xNDcsNiArMTQ3LDIwIEBAIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNlcHRpb24p
Cj4+Cj4+ICAJUkVHX0wgczAsIFRBU0tfVElfVVNFUl9TUCh0cCkKPj4gIAljc3JyYyBzMSwgQ1NS
X1NUQVRVUywgdDAKPj4gKwkvKgo+PiArCSAqIElmIHByZXZpb3VzIG1vZGUgd2FzIFUsIGNhcHR1
cmUgc2hhZG93IHN0YWNrIHBvaW50ZXIgYW5kIHNhdmUgaXQgYXdheQo+PiArCSAqIFplcm8gQ1NS
X1NTUCBhdCB0aGUgc2FtZSB0aW1lIGZvciBzYW5pdGl6YXRpb24uCj4+ICsJICovCj4+ICsJQUxU
RVJOQVRJVkUoIm5vcDsgbm9wOyBub3A7IG5vcCIsCj4+ICsJCQkJX19zdHJpbmdpZnkoCQkJXAo+
PiArCQkJCWFuZGkgczIsIHMxLCBTUl9TUFA7CVwKPj4gKwkJCQlibmV6IHMyLCBza2lwX3NzcF9z
YXZlOwlcCj4+ICsJCQkJY3NycncgczIsIENTUl9TU1AsIHgwOwlcCj4+ICsJCQkJUkVHX1MgczIs
IFRBU0tfVElfVVNFUl9TU1AodHApOyBcCj4+ICsJCQkJc2tpcF9zc3Bfc2F2ZTopLAo+PiArCQkJ
CTAsCj4+ICsJCQkJUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLAo+PiArCQkJCUNPTkZJR19SSVNDVl9V
U0VSX0NGSSkKPgo+KEknZCBwcmVmZXIgdGhpcyBjbG9zZXIgdG8gdGhlIHVzZXJfc3AgYW5kIGtl
cm5lbF9zcCBzd2FwLCBpdCdzIGJyZWFraW5nCj4gdGhlIGZsb3cgaGVyZS4gIFdlIGFsc28gYWxy
ZWFkeSBrbm93IGlmIHdlJ3ZlIHJldHVybmVkIGZyb20gdXNlcnNwYWNlCj4gb3Igbm90IGV2ZW4g
d2l0aG91dCBTUl9TUFAsIGJ1dCByZXVzaW5nIHRoZSBpbmZvcm1hdGlvbiBtaWdodCB0YW5nbGUK
PiB0aGUgbG9naWMuKQoKSWYgQ1NSX1NDUkFUQ0ggd2FzIDAsIHRoZW4gd2Ugd291bGQgYmUgY29t
aW5nIGZyb20ga2VybmVsIGVsc2UgZmxvdyBnb2VzCnRvIGAuTHNhdmVfY29udGV4dGAuIElmIHdl
IHdlcmUgY29taW5nIGZyb20ga2VybmVsIG1vZGUsIHRoZW4gZXZlbnR1YWxseQpmbG93IG1lcmdl
cyB0byBgLkxzYXZlX2NvbnRleHRgLgoKU28gd2Ugd2lsbCBiZSBzYXZpbmcgQ1NSX1NTUCBvbiBh
bGwga2VybmVsIC0tID4ga2VybmVsIHRyYXAgaGFuZGxpbmcuIFRoYXQKd291bGQgYmUgdW5uZWNl
c3NhcnkuIElJUkMsIHRoaXMgd2FzIG9uZSBvZiB0aGUgZmlyc3QgcmV2aWV3IGNvbW1lbnRzIGlu
CmVhcmx5IFJGQyBzZXJpZXMgb2YgdGhlc2UgcGF0Y2ggc2VyaWVzICh0byBub3QgdG91Y2ggQ1NS
X1NTUCB1bi1uZWNlc3NhcmlseSkKCldlIGNhbiBhdm9pZCB0aGF0IGJ5IGVuc3VyaW5nIHdoZW4g
d2UgYnJhbmNoIGJ5IGRldGVybWluaW5nIGlmIHdlIGFyZSBjb21pbmcKZnJvbSB1c2VyIHRvIHNv
bWV0aGluZyBsaWtlIGAuTHNhdmVfc3NwYCB3aGljaCBldmVudHVhbGx5IG1lcmdlcyBpbnRvCiIu
THNhdmVfY29udGV4dCIuIEFuZCBpZiB3ZSB3ZXJlIGNvbWluZyBmcm9tIGtlcm5lbCB0aGVuIHdl
IHdvdWxkIGJyYW5jaCB0bwpgLkxzYXZlX2NvbnRleHRgIGFuZCB0aHVzIHNraXBwaW5nIHNzcCBz
YXZlIGxvZ2ljLiBCdXQgIyBvZiBicmFuY2hlcyBpdAppbnRyb2R1Y2VzIGluIGVhcmx5IGV4Y2Vw
dGlvbiBoYW5kbGluZyBpcyBlcXVpdmFsZW50IHRvIHdoYXQgY3VycmVudCBwYXRjaGVzCmRvLiBT
byBJIGRvbid0IHNlZSBhbnkgdmFsdWUgaW4gZG9pbmcgdGhhdC4KCkxldCBtZSBrbm93IGlmIEkg
YW0gbWlzc2luZyBzb21ldGhpbmcuCgo+Cj4+ICAJY3NyciBzMiwgQ1NSX0VQQwo+PiAgCWNzcnIg
czMsIENTUl9UVkFMCj4+ICAJY3NyciBzNCwgQ1NSX0NBVVNFCj4+IEBAIC0yMzYsNiArMjUwLDE4
IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zyb21fZXhjZXB0aW9uKQo+PiAgCWNzcncg
Q1NSX1NDUkFUQ0gsIHRwCj4+ICsKPj4gKwkvKgo+PiArCSAqIEdvaW5nIGJhY2sgdG8gVSBtb2Rl
LCByZXN0b3JlIHNoYWRvdyBzdGFjayBwb2ludGVyCj4+ICsJICovCkkgY2FuIHJlbW92ZSBteSBj
b21tZW50IGJlY2F1c2UgaXQncyBvYnZpb3VzLgoKPgo+QXJlIHdlPyAgSSB0aGluayB3ZSBjYW4g
YmUganVzdCBhcyB3ZWxsIHJldHVybmluZyBiYWNrIHRvIGtlcm5lbC1zcGFjZS4KPlNpbWlsYXIg
dG8gaG93IHdlIGNhbiBlbnRlciB0aGUgZXhjZXB0aW9uIGhhbmRsZXIgZnJvbSBrZXJuZWwtc3Bh
Y2UuCgpZZXMgd2UgYXJlLiBTZWUgZXhjZXJwdCBmcm9tIGByZXRfZnJvbV9leGNlcHRpb25gIGlu
IGBlbnRyeS5TYAoKIiIiClNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zyb21fZXhjZXB0aW9u
KQoJUkVHX0wgczAsIFBUX1NUQVRVUyhzcCkKI2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKCS8q
IHRoZSBNUFAgdmFsdWUgaXMgdG9vIGxhcmdlIHRvIGJlIHVzZWQgYXMgYW4gaW1tZWRpYXRlIGFy
ZyBmb3IgYWRkaSAqLwoJbGkgdDAsIFNSX01QUAoJYW5kIHMwLCBzMCwgdDAKI2Vsc2UKCWFuZGkg
czAsIHMwLCBTUl9TUFAKI2VuZGlmCglibmV6IHMwLCAxZgoKPC4uLiBzbmlwcGVkIC4uLj4KCgkv
KgoJICogR29pbmcgYmFjayB0byBVIG1vZGUsIHJlc3RvcmUgc2hhZG93IHN0YWNrIHBvaW50ZXIK
CSAqLwoJQUxURVJOQVRJVkUoIm5vcHMoMikiLAoJCQkJX19zdHJpbmdpZnkoCQkJXAoJCQkJUkVH
X0wgczMsIFRBU0tfVElfVVNFUl9TU1AodHApOyBcCgkJCQljc3J3IENTUl9TU1AsIHMzKSwKCQkJ
CTAsCgkJCQlSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MsCgkJCQlDT05GSUdfUklTQ1ZfVVNFUl9DRkkp
CgoxOgojaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9WX1BSRUVNUFRJVkUKCW1vdmUgYTAsIHNwCglj
YWxsIHJpc2N2X3ZfY29udGV4dF9uZXN0aW5nX2VuZAoKPC4uLiBzbmlwcGVkIC4uLj4KCiIiIgoK
Cj4KPj4gKwlBTFRFUk5BVElWRSgibm9wOyBub3AiLAo+PiArCQkJCV9fc3RyaW5naWZ5KAkJCQkJ
XAo+PiArCQkJCVJFR19MIHMzLCBUQVNLX1RJX1VTRVJfU1NQKHRwKTsgXAo+PiArCQkJCWNzcncg
Q1NSX1NTUCwgczMpLAo+PiArCQkJCTAsCj4+ICsJCQkJUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLAo+
PiArCQkJCUNPTkZJR19SSVNDVl9VU0VSX0NGSSkKPj4gKwo+Cj5UaGFua3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
