Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C8C54795
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eSUhX8rXxxTPl4CTO5SKmLSHb1SeokS3ucKyTgAFW4=; b=IpePk3ZcFbOPhV6nn48WdhCCzV
	lt5wvRhe5jeWzB+eoP/6LGqbqQeLbeIL1eTUYpECEE02C6NTqmfO292cm02a9+maw3OyTK2lb2qRp
	XjCbUVUu+VeTXzStOk+Ww2TVCIIV5ZZu8DuHZoCVOcOd3bhNOnK1cx5jqWXnwYhMKn2Woq1PwhhWr
	PBtIlPfq0FOJ1jZSRzJ21ajt+0ownnVBWO1dy25UIP8eJFdT2rN/ebzRUV58/DAXjiI3hVnga1pZf
	VYFXk97Cix9JJj4ob6TUS8jAE/7hOevb8Klngtsoa5Huy15daytfbOIzrZm8wDFMTXY3+MDdAm4Hc
	Q3WoLgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQN-00000003vSH-3nws;
	Fri, 16 May 2025 15:56:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx4w-00000003rye-11ZW
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:34:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22fa48f7cb2so23918045ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409669; x=1748014469; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VTPOMqT5C2feU2knCk6fA/APYFa11AZmawpB2cqaoDc=;
        b=00OE94H1d4mpR3DbTkaxpNKEauy8kAWqQk6B50a3flNYKZBbnUb3gkKuWiuBnfqF6L
         9SJdqgJcxwIa2dmNeykRdpBdUC9cFe9TekvHDRR4pQvgpbEZxIMniG0KMenIWCnui7z+
         j3u40M+RagLFLoM56t+V9fOTG4vsnhNtOF3OIp0KSnrFZFUgP35/DxO1vojgZ71Aqu8u
         NsTGr27WFF9s37+KsOyU4T1Eiy9wya9KrDBRCNw4r3DZprmbwif8JNpJdPMeTYNwjkK8
         8nVD7R7YUrApMdSKrKtusHJwYE8hx851ca2MqeZgRwWgM6FQVrsHXaDgf2R2Ahk9ealy
         xlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409669; x=1748014469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTPOMqT5C2feU2knCk6fA/APYFa11AZmawpB2cqaoDc=;
        b=aZjX/9fsscS3lBnsShMXJjgwwresJ8xu8BNKI79iy+NNYJiwG/1w0aCwBkogakpF+G
         SWQ1puDIXRWCpLyeFi72xCBy7a6JrVgIVZ4EqfzUkUfobfsHZGkUvgde3VKhwE73ka3o
         zM45bX1q9VtbnIt+JhUrDhxCX1iU0Ukp2EZ6AIx5xVlwLmL/C3vhcGEddaxTmwrjlv34
         79j+EwrHOvUcsweZ3HO0WA8b9wG2iFYJIYyVSEdncnooWNSymEbn0HVhYg4Ui9zzqAPI
         drEuPkBSh0PFtpUIqU4z+iovU27i5FYNp+3jjoVnmvTiEpgTwTqA97wx6NrV6FXutqPJ
         teJg==
X-Forwarded-Encrypted: i=1; AJvYcCW9dayz3EYx84ejCNk4ZcJ++ADr3LMzrYUPHxs7Z1rMHfnQo0galBKXy4+2F+Juh0NDFLskJruwMnwNIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLr38UtMIwc5SNYtUhAYpIszb6llnnHqq+17NBZdz8MiWXSqkB
	0vFAhxHHzRQnmbexnkbpUytuBqlC64FQGA5fVM3gFDoGv6N1CEsroOXqz82mLEu6TFk=
X-Gm-Gg: ASbGncvvWiMIRbN577vKGgz+bbrae6ffwxQBlsJkEd6CfgV3Us1GZByPbPM5wev6YRM
	LHAMEo7Mql4LFYvGg7iW8qcnsKZ8X20yL3GIITiRl2CUfh1tOKWjxyExHaRvSkaZQ8DNwBdssiM
	eH+tG29miYL+fAoPYAHPwiANATi/tP4+o/DmrRdC5BZgphLlZnuHvxkn7wm4NAYK2e1Rb3Ers+C
	9WK2WXryg2b7wgnzQVq6KvTyCy2vvKuGPqGmdQWN4J7Z4r06NWb0iaWaOTkoucBXICzgPbpnkSY
	/vPZOugj8Bh5ZA+Xkt/6DL9BAfN2QyTrtctShoSmldrrbzROaYhqz4Glm9ilRA==
X-Google-Smtp-Source: AGHT+IFZckSqO5+1mOJ5q3W7tqhvvuTMvoIraIWCKDFfhzREKyJxJcIAzKyffAUquxEcLFZdJvL5nQ==
X-Received: by 2002:a17:902:f60a:b0:22e:17ee:aa69 with SMTP id d9443c01a7336-231d45740d0mr41158275ad.50.1747409669319;
        Fri, 16 May 2025 08:34:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac944esm15870145ad.49.2025.05.16.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:34:28 -0700 (PDT)
Date: Fri, 16 May 2025 08:34:25 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Message-ID: <aCdbASlCyqhid82c@debug.ba.rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
 <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
 <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
 <D9WLRSAB63M5.3DZD4ND3WVZ6F@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9WLRSAB63M5.3DZD4ND3WVZ6F@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_083430_280841_00A1B011 
X-CRM114-Status: GOOD (  20.83  )
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

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMTA6NDg6MzVBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wNS0xNVQwOToyODoyNSswMjowMCwgQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPjoKPj4gT24gMDYvMDUvMjAyNSAxMjoxMCwgUmFkaW0gS3LEjW3DocWZIHdyb3Rl
Ogo+Pj4gMjAyNS0wNS0wMlQxNjozMDozNi0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+Ogo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIv
YXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+Pj4+IEBAIC05MSw2ICs5MSwzMiBAQAo+Pj4+ICsu
bWFjcm8gcmVzdG9yZV91c2Vyc3NwIHRtcAo+Pj4+ICsJQUxURVJOQVRJVkUoIm5vcHMoMikiLAo+
Pj4+ICsJCV9fc3RyaW5naWZ5KAkJCQlcCj4+Pj4gKwkJUkVHX0wgXHRtcCwgVEFTS19USV9VU0VS
X1NTUCh0cCk7CVwKPj4+PiArCQljc3J3IENTUl9TU1AsIFx0bXApLAo+Pj4+ICsJCTAsCj4+Pj4g
KwkJUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLAo+Pj4+ICsJCUNPTkZJR19SSVNDVl9VU0VSX0NGSSkK
Pj4+PiArLmVuZG0KPj4+IERvIHdlIG5lZWQgdG8gZW1pdCB0aGUgbm9wcyB3aGVuIENPTkZJR19S
SVNDVl9VU0VSX0NGSSBpc24ndCBzZWxlY3RlZD8KPj4+Cj4+PiAoV2h5IG5vdCBwdXQgI2lmZGVm
IENPTkZJR19SSVNDVl9VU0VSX0NGSSBhcm91bmQgdGhlIEFMVEVSTkFUSVZFUz8pCj4+Cj4+IFRo
ZSBhbHRlcm5hdGl2ZXMgYXJlIHVzZWQgdG8gY3JlYXRlIGEgZ2VuZXJpYyBrZXJuZWwgdGhhdCBj
b250YWlucyB0aGUKPj4gY29kZSBmb3IgYSBsYXJnZSBudW1iZXIgb2YgZXh0ZW5zaW9ucyBhbmQg
b25seSBlbmFibGUgaXQgYXQgcnVudGltZQo+PiBkZXBlbmRpbmcgb24gdGhlIHBsYXRmb3JtIGNh
cGFiaWxpdGllcy4gVGhpcyB3YXkgZGlzdHJvcyBjYW4gc2hpcCBhCj4+IHNpbmdsZSBrZXJuZWwg
dGhhdCB3b3JrcyBvbiBhbGwgcGxhdGZvcm1zLgo+Cj5ZdXAsIGFuZCBpZiBhIGtlcm5lbCBpcyBj
b21waWxlZCB3aXRob3V0IENPTkZJR19SSVNDVl9VU0VSX0NGSSwgdGhlIG5vcHMKPndpbGwgb25s
eSBlbmxhcmdlIHRoZSBiaW5hcnkgYW5kIHBvdGVudGlhbGx5IHNsb3cgZG93biBleGVjdXRpb24u
Cj5JbiBvdGhlciB3b3Jkcywgd2h5IHdlIGRvbid0IGRvIHNvbWV0aGluZyBsaWtlIHRoaXMKPgo+
ICghQ09ORklHX1JJU0NWX1VTRVJfQ0ZJID8gIiIgOgo+ICAgKFJJU0NWX0lTQV9FWFRfWklDRklT
UyA/IF9fc3RyaW5naWZ5KC4uLikgOiAibm9wcyh4KSIpKQo+Cj5pbnN0ZWFkIG9mIHRoZSBjdXJy
ZW50Cj4KPiAoQ09ORklHX1JJU0NWX1VTRVJfQ0ZJICYmCj4gICAgUklTQ1ZfSVNBX0VYVF9aSUNG
SVNTID8gX19zdHJpbmdpZnkoLi4uKSA6ICJub3BzKHgpIikKPgo+SXQgY291bGQgYmUgYSBuZXcg
cHJlcHJvY2Vzc29yIG1hY3JvIGluIGNhc2Ugd2Ugd2FudGVkIHRvIG1ha2UgaXQgbmljZSwKPmJ1
dCBpdCdzIHByb2JhYmx5IG5vdCBhIGNvbW1vbiBjYXNlLCBzbyBhbiBpZmRlZiBjb3VsZCB3b3Jr
IGFzIHdlbGwuCj4KPkRvIHdlIGp1c3QgZ2VuZXJhbGx5IG5vdCBjYXJlIGFib3V0IHN1Y2ggbWlu
b3Igb3B0aW1pemF0aW9ucz8KCk9uIGl0cyBvd24ganVzdCBmb3IgdGhpcyBzZXJpZXMsIEkgYW0g
bm90IHN1cmUgaWYgSSB3b3VsZCBjYWxsIGl0IGV2ZW4gYQptaW5vciBvcHRpbWl6YXRpb24uCgpC
dXQgc3VyZSwgaXQgbWF5IChvciBtYXkgbm90KSBoYXZlIG5vdGljZWFibGUgZWZmZWN0IGlmIHNv
bWVvbmUgd2VyZQp0byBnbyBhcm91bmQgYW5kIG11Y2sgd2l0aCBBTFRFUk5BVElWRVMgbWFjcm8g
YW5kIGVtaXQgYG9sZF9jYCBvbmx5CmlmIGNvbmZpZyB3ZXJlIHNlbGVjdGVkLiBUaGF0IHNob3Vs
ZCBiZSBhIHBhdGNoIHNldCBvbiBpdHMgb3duIHdpdGgKZGF0YSBwcm92aWRpbmcgYmVuZWZpdHMg
ZnJvbSBpdC4KCj4KPihJZiB3ZSB3YW50ZWQgdG8gZ28gYW4gZXh0cmEgbWlsZSwgd2UgY291bGQg
YWxzbyBrZWVwIHRoZSBub3BzIHdoZW4gYm90aAo+IENPTkZJR19SSVNDVl9VU0VSX0NGSSBhbmQg
UklTQ1ZfSVNBX0VYVF9aSUNGSVNTIGFyZSBwcmVzZW50LCBidXQKPiBjb21tYW5kIGxpbmUgcmlz
Y3Zfbm91c2VyY2ZpIGRpc2FibGVkIGJhY2t3YXJkIGNmaS4pCj4KPlRoYW5rcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
