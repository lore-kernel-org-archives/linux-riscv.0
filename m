Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54968C54754
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvngNuYUzTRShJDs+VFdjVfL+ZKr/zIXixaIwqHYbH8=; b=00gEz2fJxgJ/Vg
	KLgLibGq9Ad66WHaglYGDSZBgNNB43WatS806c5qRiJKfDNpgr3bXssVsnwOT44fSFnNia+jBUTSk
	neZKJfQqVFRxJNSt8NVBE8N+iZZDASI/9JAr02isSFzbn3Z/1O1E3RYnnF8vEbj11fMfT1O+ryRao
	wCuB3k5xEKQaNl9AlO1XjlZCoHrdReRPV0yRCGtZ8Pq1wm+yXNhe5rnKNqXGChCLZiqyLi0zBaZGw
	1QXJAbg2S+lxTuKtixJmwyjk6PM2PDk6XCaU9HJweds1f5z06gIUjzejc1SwxBlydjVDjzMcSOOoc
	uh37BDXel53MGFvZA6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT3R-0000000HMJE-3PEc;
	Thu, 15 May 2025 07:30:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT1Q-0000000HLyU-2caa;
	Thu, 15 May 2025 07:28:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB84144380;
	Thu, 15 May 2025 07:28:26 +0000 (UTC)
Message-ID: <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
Date: Thu, 15 May 2025 09:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and save/restore
 of CSR_SSP on trap entry/exit
Content-Language: en-US
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
 Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
 <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedvleeivdevgeekudefjeeigeeuvdekueeiuedufeethffhiedvleeileduuddtgfenucffohhmrghinhepvghnthhrhidrshgspdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemgegsjedumeegvggtieemjehfhegsmeejsgdtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemgegsjedumeegvggtieemjehfhegsmeejsgdtuddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemgegsjedumeegvggtieemjehfhegsmeejsgdtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedupdhrtghpthhtoheprhhkrhgtmhgrrhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtohepuggvsghughesrhhivhhoshhinhgtr
 dgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhphgrseiihihtohhrrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_002852_786058_8F9DA5C6 
X-CRM114-Status: GOOD (  12.94  )
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

SGkgUmFkaW0sCgpPbiAwNi8wNS8yMDI1IDEyOjEwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4g
W0FoLCBJIG1pc3NlZCB2MTMgYW5kIHYxNCwgZmVlbCBmcmVlIHRvIENjIG1lIG9uIG5leHQgdmVy
c2lvbnMuXQo+Cj4gMjAyNS0wNS0wMlQxNjozMDozNi0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1
Z0ByaXZvc2luYy5jb20+Ogo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
UyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4gQEAgLTkxLDYgKzkxLDMyIEBACj4+ICsu
bWFjcm8gc2F2ZV91c2Vyc3NwIHRtcCwgc3RhdHVzCj4+ICsJQUxURVJOQVRJVkUoIm5vcHMoNCki
LAo+PiArCQlfX3N0cmluZ2lmeSgJCQkJXAo+PiArCQlhbmRpIFx0bXAsIFxzdGF0dXMsIFNSX1NQ
UDsJCVwKPj4gKwkJYm5leiBcdG1wLCBza2lwX3NzcF9zYXZlOwkJXAo+PiArCQljc3JydyBcdG1w
LCBDU1JfU1NQLCB4MDsJCVwKPj4gKwkJUkVHX1MgXHRtcCwgVEFTS19USV9VU0VSX1NTUCh0cCk7
CVwKPj4gKwkJc2tpcF9zc3Bfc2F2ZTopLAo+PiArCQkwLAo+PiArCQlSSVNDVl9JU0FfRVhUX1pJ
Q0ZJU1MsCj4+ICsJCUNPTkZJR19SSVNDVl9VU0VSX0NGSSkKPj4gKy5lbmRtCj4+ICsKPj4gKy5t
YWNybyByZXN0b3JlX3VzZXJzc3AgdG1wCj4+ICsJQUxURVJOQVRJVkUoIm5vcHMoMikiLAo+PiAr
CQlfX3N0cmluZ2lmeSgJCQkJXAo+PiArCQlSRUdfTCBcdG1wLCBUQVNLX1RJX1VTRVJfU1NQKHRw
KTsJXAo+PiArCQljc3J3IENTUl9TU1AsIFx0bXApLAo+PiArCQkwLAo+PiArCQlSSVNDVl9JU0Ff
RVhUX1pJQ0ZJU1MsCj4+ICsJCUNPTkZJR19SSVNDVl9VU0VSX0NGSSkKPj4gKy5lbmRtCj4gRG8g
d2UgbmVlZCB0byBlbWl0IHRoZSBub3BzIHdoZW4gQ09ORklHX1JJU0NWX1VTRVJfQ0ZJIGlzbid0
IHNlbGVjdGVkPwo+Cj4gKFdoeSBub3QgcHV0ICNpZmRlZiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkg
YXJvdW5kIHRoZSBBTFRFUk5BVElWRVM/KQoKClRoZSBhbHRlcm5hdGl2ZXMgYXJlIHVzZWQgdG8g
Y3JlYXRlIGEgZ2VuZXJpYyBrZXJuZWwgdGhhdCBjb250YWlucyB0aGUgCmNvZGUgZm9yIGEgbGFy
Z2UgbnVtYmVyIG9mIGV4dGVuc2lvbnMgYW5kIG9ubHkgZW5hYmxlIGl0IGF0IHJ1bnRpbWUgCmRl
cGVuZGluZyBvbiB0aGUgcGxhdGZvcm0gY2FwYWJpbGl0aWVzLiBUaGlzIHdheSBkaXN0cm9zIGNh
biBzaGlwIGEgCnNpbmdsZSBrZXJuZWwgdGhhdCB3b3JrcyBvbiBhbGwgcGxhdGZvcm1zLgoKVGhh
bmtzIGZvciB5b3VyIHJldmlld3Mgb24gdGhpcyBzZXJpZXMsCgpBbGV4CgoKPgo+IFRoYW5rcy4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
