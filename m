Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2608C7115A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePc+O5j9chxvIEXr3Fmo9AhGqrZ3OWsd3ktiQjFBe50=; b=Y3L1R4xFMO23uM
	4KGapE2pkk09VgiTw8S6T0QIpQ0c+MH9cUyPhvM9gXvqHfqWhhSYwBUkIgCCmzM125kPxxXvWJA0+
	eo8tot/M6Ctz+/Mgn4EGaU9Csh+iWxO4qg8kDAOvJ6ySbaakTPc3OOK7Gpzli2JZyjLAlgao63jXR
	8mxrNDOrhUbXzTjbKX5AQuEnELNEjWbOaKjJ0P+FeRx9iB3tqQpTKXm25z3qFWcxgCBdgoDsfkl8G
	EzpuGTWTo0oU6ZXHSEEIUJMyKxuZ5m95uVhB5Q+otaIVdWGccVcYXGpag+Pl1PYvld6GJyghfEWWx
	QkZxisPBiokwG8QOg9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Yb-00000003h3W-2dVQ;
	Mon, 16 Jun 2025 07:47:05 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Jk-00000003eX9-0q1z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 07:31:45 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ddff24fdc4so47573335ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750059103; x=1750663903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQxXH/0dmAKUHVoHoL5MncVmJUg8FbHf/SfAogCBA2o=;
        b=O8+hUueru+0Qbxobl/Jc+u1+GTfPQNRvTIb9DW3nnaoqUqxGC5Qmx/G9z5ukh0fWSa
         BzyBLoE7ZUv66I+99bOpjoCvo3lTaHK05PpqTXGWorEmra2s4uwCY9OJ6tYBiC29Cs30
         JyL9h3PZVxbKh6+CRau1BpL7Uwx1xV3pHcRyb/z3avh+da40sMFHhJV/E5kYgj/REj4h
         YR5PxByWm71LuuN4z0yk1HfUZ32N2pFkj6mvXLI+fQmNI7I/8GgQcuYwNSq3OOKCl5Ql
         S6T1P7PUoBwXQpcAcigAzaYc7bTxAnS/WzbR0IEDsII8xvuiQogS6bcYDTgMWsQlcvlQ
         ub7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059103; x=1750663903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQxXH/0dmAKUHVoHoL5MncVmJUg8FbHf/SfAogCBA2o=;
        b=StGmxsmmG7SUzVlqpbHi31+Z2GaLwVlaMGVCtaYFA79R3KImaFO5znglrlcWvIcELf
         sUnlM5gohuAc6mii84DcjwyhhDjVpYjbFPsrSjZfR8+HW2j4Y6EYinN23fsLHB/FfW3G
         4gTQv5dd9pcYGM8D0dHBGP3yYj7jq211hpduUAo9LZzLEbXT4BX8S8Mq6KgAkXCDeFvy
         A3qCrlu3rS4qWmLL7iN11svRSUyTDoWUR8t1uHYCg3PkTq9yAvnDyL5mScKQ4WYwM5uE
         r2j97xHPEU138lH5n3jJTo8QXopF8QWh5XIY6/wQBOhNIK/c7NjIiZcfoU2AlJynMBb/
         f+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXlYmX91bLKq7ESubCDfdppsVPpmunnza6U8z0Baqtf0KXBNK6hTWTXAtsgb3jMq4iEbbo7yrWFwrVC8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YySuCRoNLI8gjNPQl89VrVUQUtg7SnEvR5fHmkf7LQ7Uz4lh32U
	r0H/Mh47/6F6jTa4x7mJdWhhpBFkY2khneaNgtEdttT5gQ1tEMsDhS7UO5DQMVfFLrmuObx44qu
	fPa8pdJQ0/uuaqFnobwY92NzfkiH2Dco8zrLCbb3Jjg==
X-Gm-Gg: ASbGncuazpakGww1RTxATiNtUBvwYe3sxj/tdoUoxY4fJS8TRsnxyMbjNe+evSKekf6
	eHM78OUJIRINVd+iDZivrzkSaSozNRUBSNQydjQHs+shwOPtQAA0D622jAFfQgad0s6jNub+IVi
	Uj72VrbKmfZw39k/h/rkRmvc0OR+MFzyQvzer++tsRpvw7sA==
X-Google-Smtp-Source: AGHT+IEjHI16GxKyLasfzKkpzXfv5K8fdxEJHSmO2c+vsZ5EW3jLub+wreQ1LSFrfqb50SzP3xXNNY/tkYcEG9qkkXQ=
X-Received: by 2002:a05:6e02:1445:b0:3dc:87c7:a5b5 with SMTP id
 e9e14a558f8ab-3de07c2710fmr92538565ab.3.1750059102855; Mon, 16 Jun 2025
 00:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com> <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 16 Jun 2025 15:31:31 +0800
X-Gm-Features: AX0GCFv07zIy78CxiGqhmmuXUJ1bc3WRbaeMC8WS8lGUU29aYh3F-BEq_8IQZZA
Message-ID: <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
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
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_003144_265154_CFBE110E 
X-CRM114-Status: GOOD (  35.71  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxOjE34oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gemljZmlzcyAvIHppY2ZpbHAgaW50cm9kdWNlcyBhIG5ldyBl
eGNlcHRpb24gdG8gcHJpdiBpc2EgYHNvZnR3YXJlIGNoZWNrCj4gZXhjZXB0aW9uYCB3aXRoIGNh
dXNlIGNvZGUgPSAxOC4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHNvZnR3YXJlIGNoZWNrCj4gZXhj
ZXB0aW9uLgo+Cj4gQWRkaXRpb25hbGx5IGl0IGltcGxlbWVudHMgYSBjZmkgdmlvbGF0aW9uIGhh
bmRsZXIgd2hpY2ggY2hlY2tzIGZvciBjb2RlCj4gaW4geHR2YWwuIElmIHh0dmFsPTIsIGl0IG1l
YW5zIHRoYXQgc3cgY2hlY2sgZXhjZXB0aW9uIGhhcHBlbmVkIGJlY2F1c2Ugb2YKPiBhbiBpbmRp
cmVjdCBicmFuY2ggbm90IGxhbmRpbmcgb24gNCBieXRlIGFsaWduZWQgUEMgb3Igbm90IGxhbmRp
bmcgb24KPiBgbHBhZGAgaW5zdHJ1Y3Rpb24gb3IgbGFiZWwgdmFsdWUgZW1iZWRkZWQgaW4gYGxw
YWRgIG5vdCBtYXRjaGluZyBsYWJlbAo+IHZhbHVlIHNldHVwIGluIGB4N2AuIElmIHh0dmFsPTMs
IGl0IG1lYW5zIHRoYXQgc3cgY2hlY2sgZXhjZXB0aW9uIGhhcHBlbmVkCj4gYmVjYXVzZSBvZiBt
aXNtYXRjaCBiZXR3ZWVuIGxpbmsgcmVnaXN0ZXIgKHgxIG9yIHg1KSBhbmQgdG9wIG9mIHNoYWRv
dwo+IHN0YWNrIChvbiBleGVjdXRpb24gb2YgYHNzcG9wY2hrYCkuCj4KPiBJbiBjYXNlIG9mIGNm
aSB2aW9sYXRpb24sIFNJR1NFR1YgaXMgcmFpc2VkIHdpdGggY29kZT1TRUdWX0NQRVJSLgo+IFNF
R1ZfQ1BFUlIgd2FzIGludHJvZHVjZWQgYnkgeDg2IHNoYWRvdyBzdGFjayBwYXRjaGVzLgo+Cj4g
VG8ga2VlcCB1cHJvYmVzIHdvcmtpbmcsIGhhbmRsZSB0aGUgdXByb2JlIGV2ZW50IGZpcnN0IGJl
Zm9yZSByZXBvcnRpbmcKPiB0aGUgQ0ZJIHZpb2xhdGlvbiBpbiBzb2Z0d2FyZS1jaGVjayBleGNl
cHRpb24gaGFuZGxlci4gQmVjYXVzZSB3aGVuIHRoZQo+IGxhbmRpbmcgcGFkIGlzIGFjdGl2YXRl
ZCwgaWYgdGhlIHVwcm9iZSBwb2ludCBpcyBzZXQgYXQgdGhlIGxwYWQKPiBpbnN0cnVjdGlvbiBh
dCB0aGUgYmVnaW5uaW5nIG9mIGEgZnVuY3Rpb24sIHRoZSBzeXN0ZW0gdHJpZ2dlcnMgYSBzb2Z0
d2FyZQo+IC1jaGVjayBleGNlcHRpb24gaW5zdGVhZCBvZiBhbiBlYnJlYWsgZXhjZXB0aW9uIGR1
ZSB0byB0aGUgZXhjZXB0aW9uCj4gcHJpb3JpdHksIHRoZW4gdXByb2JlIGNhbid0IHdvcmsgc3Vj
Y2Vzc2Z1bGx5Lgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGVl
cGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLXByb3RvdHlwZXMuaCB8ICAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
bnRyeS1jb21tb24uaCAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAg
ICAgICAgICAgIHwgIDMgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAg
ICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXNtLXByb3RvdHlwZXMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3Rv
dHlwZXMuaAo+IGluZGV4IGNkNjI3ZWMyODlmMS4uNWEyN2NlZmQ3ODA1IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaAo+IEBAIC01MSw2ICs1MSw3IEBAIERFQ0xB
UkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3UpOwo+ICBERUNMQVJFX0RPX0VSUk9SX0lO
Rk8oZG9fdHJhcF9lY2FsbF9zKTsKPiAgREVDTEFSRV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNh
bGxfbSk7Cj4gIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2JyZWFrKTsKPiArREVDTEFS
RV9ET19FUlJPUl9JTkZPKGRvX3RyYXBfc29mdHdhcmVfY2hlY2spOwo+Cj4gIGFzbWxpbmthZ2Ug
dm9pZCBoYW5kbGVfYmFkX3N0YWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiAgYXNtbGlua2Fn
ZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9lbnRyeS1jb21tb24uaAo+IGluZGV4IGIyOGNjYzZjZGVlYS4uMzRlZDE0OWFmNWQx
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4gQEAgLTQwLDQgKzQw
LDYgQEAgc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gIH0KPiAgI2VuZGlmCj4KPiArYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlv
bGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiArCj4gICNlbmRpZiAvKiBfQVNNX1JJU0NW
X0VOVFJZX0NPTU1PTl9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gaW5kZXggOTc4MTE1NTY3YmNhLi44ZDI1
ODM3YTkzODQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtNDc0LDYgKzQ3NCw5IEBAIFNZTV9EQVRB
X1NUQVJUX0xPQ0FMKGV4Y3BfdmVjdF90YWJsZSkKPiAgICAgICAgIFJJU0NWX1BUUiBkb19wYWdl
X2ZhdWx0ICAgLyogbG9hZCBwYWdlIGZhdWx0ICovCj4gICAgICAgICBSSVNDVl9QVFIgZG9fdHJh
cF91bmtub3duCj4gICAgICAgICBSSVNDVl9QVFIgZG9fcGFnZV9mYXVsdCAgIC8qIHN0b3JlIHBh
Z2UgZmF1bHQgKi8KPiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3Vua25vd24gLyogY2F1c2U9
MTYgKi8KPiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3Vua25vd24gLyogY2F1c2U9MTcgKi8K
PiArICAgICAgIFJJU0NWX1BUUiBkb190cmFwX3NvZnR3YXJlX2NoZWNrIC8qIGNhdXNlPTE4IGlz
IHN3IGNoZWNrIGV4Y2VwdGlvbiAqLwo+ICBTWU1fREFUQV9FTkRfTEFCRUwoZXhjcF92ZWN0X3Rh
YmxlLCBTWU1fTF9MT0NBTCwgZXhjcF92ZWN0X3RhYmxlX2VuZCkKPgo+ICAjaWZuZGVmIENPTkZJ
R19NTVUKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCA4ZmY4ZThiMzY1MjQuLjY0Mzg4MzcwZTFhZCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+IEBAIC0zNTQsNiArMzU0LDU3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Cj4gIH0KPgo+ICsjZGVmaW5lIENGSV9UVkFMX0ZDRklf
Q09ERSAgICAgMgo+ICsjZGVmaW5lIENGSV9UVkFMX0JDRklfQ09ERSAgICAgMwo+ICsvKiBoYW5k
bGUgY2ZpIHZpb2xhdGlvbnMgKi8KPiArYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHR2YWwgPSBj
c3JfcmVhZChDU1JfVFZBTCk7Cj4gKyAgICAgICBib29sIGlzX2ZjZmkgPSAodHZhbCA9PSBDRklf
VFZBTF9GQ0ZJX0NPREUgJiYgY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3RyKCkpOwo+
ICsgICAgICAgYm9vbCBpc19iY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFICYmIGNw
dV9zdXBwb3J0c19zaGFkb3dfc3RhY2soKSk7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IEhhbmRsZSB1cHJvYmUgZXZlbnQgZmlyc3QuIFRoZSBwcm9iZSBwb2ludCBjYW4gYmUgYSB2YWxp
ZCB0YXJnZXQKPiArICAgICAgICAqIG9mIGluZGlyZWN0IGp1bXBzIG9yIGNhbGxzLCBpbiB0aGlz
IGNhc2UsIGZvcndhcmQgY2ZpIHZpb2xhdGlvbgo+ICsgICAgICAgICogd2lsbCBiZSB0cmlnZ2Vy
ZWQgaW5zdGVhZCBvZiBicmVha3BvaW50IGV4Y2VwdGlvbi4KPiArICAgICAgICAqLwo+ICsgICAg
ICAgaWYgKGlzX2ZjZmkgJiYgcHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKHJlZ3MpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsKCkhpICBEZWVwYWssClNvcnJ5IGZvciBtaXNzaW5nIHNv
bWV0aGluZyBlYXJsaWVyLiBJIHRoaW5rIHdlIHdvdWxkIGxpa2UgdG8gY2xlYXIKc3N0YXR1cy5T
UEVMUCBpbiB0aGUgdXByb2JlIGhhbmRsaW5nIGNhc2UuIEZvciBleGFtcGxlOgoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
CmluZGV4IGMyZWE5OTljMTE2Ny4uZTg0OTJiYjU3ZTA5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTM0OSw4
ICszNDksMTAgQEAgYm9vbCBoYW5kbGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQogICAgICAgIGJvb2wgaXNfZmNmaSA9ICh0dmFsID09IENGSV9UVkFMX0ZDRklfQ09E
RSAmJgpjcHVfc3VwcG9ydHNfaW5kaXJlY3RfYnJfbHBfaW5zdHIoKSk7CiAgICAgICAgYm9vbCBp
c19iY2ZpID0gKHR2YWwgPT0gQ0ZJX1RWQUxfQkNGSV9DT0RFICYmCmNwdV9zdXBwb3J0c19zaGFk
b3dfc3RhY2soKSk7CgotICAgICAgIGlmIChpc19mY2ZpICYmIHByb2JlX2JyZWFrcG9pbnRfaGFu
ZGxlcihyZWdzKSkKKyAgICAgICBpZiAoaXNfZmNmaSAmJiBwcm9iZV9icmVha3BvaW50X2hhbmRs
ZXIocmVncykpIHsKKyAgICAgICAgICAgICAgIHJlZ3MtPnN0YXR1cyA9IHJlZ3MtPnN0YXR1cyAm
IH5TUl9FTFA7CiAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKKyAgICAgICB9CgogICAgICAg
IGlmIChpc19mY2ZpIHx8IGlzX2JjZmkpIHsKICAgICAgICAgICAgICAgIGRvX3RyYXBfZXJyb3Io
cmVncywgU0lHU0VHViwgU0VHVl9DUEVSUiwgcmVncy0+ZXBjLAoKCldoZW4gYSB1c2VyIG1vZGUg
Q0ZJIHZpb2xhdGlvbiBvY2N1cnMsIHRoZSBFTFAgc3RhdGUgc2hvdWxkIGJlIDEsIGFuZAp0aGUg
c3lzdGVtIHRyYXBzIGludG8gc3VwZXJ2aXNvciBtb2RlLiBEdXJpbmcgdGhpcyB0cmFwLCBzc3Rh
dHVzLlNQRUxQCmlzIHNldCB0byAxLCBhbmQgdGhlIEVMUCBzdGF0ZSBpcyByZXNldCB0byAwLiBJ
ZiB3ZSBkb27igJl0IGNsZWFyCnNzdGF0dXMuU1BFTFAsIHRoZSBFTFAgc3RhdGUgd2lsbCBiZWNv
bWUgMSBhZ2FpbiBhZnRlciBleGVjdXRpbmcgdGhlCnNyZXQgaW5zdHJ1Y3Rpb24uIEFzIGEgcmVz
dWx0LCB0aGUgc3lzdGVtIG1pZ2h0IHRyaWdnZXIgYW5vdGhlcgpmb3J3YXJkIENGSSB2aW9sYXRp
b24gdXBvbiBleGVjdXRpbmcgdGhlIG5leHQgaW5zdHJ1Y3Rpb24gaW4gdGhlIHVzZXIKcHJvZ3Jh
bSwgdW5sZXNzIGl0IGhhcHBlbnMgdG8gYmUgYSBscGFkIGluc3RydWN0aW9uLgoKVGhlIHByZXZp
b3VzIHBhdGNoIHdhcyB0ZXN0ZWQgb24gUUVNVSwgYnV0IFFFTVUgZG9lcyBub3Qgc2V0IHRoZQpz
c3RhdHVzLlNQRUxQIGJpdCB0byAxIHdoZW4gYSBmb3J3YXJkIENGSSB2aW9sYXRpb24gb2NjdXJz
LiBUaGVyZWZvcmUsCkkgc3VzcGVjdCB0aGF0IFFFTVUgbWlnaHQgYWxzbyByZXF1aXJlIHNvbWUg
Zml4ZXMuCgpUaGFua3MKCj4gKwo+ICsgICAgICAgaWYgKGlzX2ZjZmkgfHwgaXNfYmNmaSkgewo+
ICsgICAgICAgICAgICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR1NFR1YsIFNFR1ZfQ1BFUlIs
IHJlZ3MtPmVwYywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiT29wcyAtIGNvbnRy
b2wgZmxvdyB2aW9sYXRpb24iKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAg
ICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBz
b2Z0d2FyZSBjaGVjayBleGNlcHRpb24gaXMgZGVmaW5lZCB3aXRoIHJpc2MtdiBjZmkgc3BlYy4g
U29mdHdhcmUgY2hlY2sKPiArICogZXhjZXB0aW9uIGlzIHJhaXNlZCB3aGVuOi0KPiArICogYSkg
QW4gaW5kaXJlY3QgYnJhbmNoIGRvZXNuJ3QgbGFuZCBvbiA0IGJ5dGUgYWxpZ25lZCBQQyBvciBg
bHBhZGAKPiArICogICAgaW5zdHJ1Y3Rpb24gb3IgYGxhYmVsYCB2YWx1ZSBwcm9ncmFtbWVkIGlu
IGBscGFkYCBpbnN0ciBkb2Vzbid0Cj4gKyAqICAgIG1hdGNoIHdpdGggdmFsdWUgc2V0dXAgaW4g
YHg3YC4gcmVwb3J0ZWQgY29kZSBpbiBgeHR2YWxgIGlzIDIuCj4gKyAqIGIpIGBzc3BvcGNoa2Ag
aW5zdHJ1Y3Rpb24gZmluZHMgYSBtaXNtYXRjaCBiZXR3ZWVuIHRvcCBvZiBzaGFkb3cgc3RhY2sg
KHNzcCkKPiArICogICAgYW5kIHgxL3g1LiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMy4K
PiArICovCj4gK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJh
cF9zb2Z0d2FyZV9jaGVjayhzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAgICAgaWYg
KHVzZXJfbW9kZShyZWdzKSkgewo+ICsgICAgICAgICAgICAgICBpcnFlbnRyeV9lbnRlcl9mcm9t
X3VzZXJfbW9kZShyZWdzKTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIG5vdCBhIGNmaSB2aW9s
YXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVua25vd24gdHJhcCBoYW5kbGVyICovCj4g
KyAgICAgICAgICAgICAgIGlmICghaGFuZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihyZWdzKSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBkb190cmFwX3Vua25vd24ocmVncyk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiArICAgICAgIH0g
ZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIC8qIHN3IGNoZWNrIGV4Y2VwdGlvbiBjb21pbmcgZnJv
bSBrZXJuZWwgaXMgYSBidWcgaW4ga2VybmVsICovCj4gKyAgICAgICAgICAgICAgIGRpZShyZWdz
LCAiS2VybmVsIEJVRyIpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICAjaWZkZWYgQ09ORklHX01N
VQo+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiAgewo+Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
