Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89524C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpFwMwYTe0HzbQGv7VSVg4IEIukocTnonk20FWf1xno=; b=j+/DAW06Iruo4C
	QV9dkUZGmJf+QI1yz7e9QcmkAjB0Nhy0FELPyTpfgXdqUDZylz2tL7aMvJGIKzJj4xGwa8oyMekoq
	zAsgmC43RmfUcobUsY+D4mEf99hmfsdJK1LWZwEiSovXf4njNJvyfeMR0o0w49u8xKYxT2sqa31TA
	7KYdjUWuMABA1t8YuJBqu5D9VAtC/cqNOR/cv3XOYmesukFCjWnewjJM5rgK/hHlCtcIB2G0Ol3Q9
	buclo+k3OPlRoBDM5V8mrLztlmw2c8ib0F5nlfSAbluofnjJ5WAuJ4L7UY+w47tODrG1j/mHo4tWv
	/5ohNNXy+EP1hWHgwwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lG-0000000DXHX-1G6N;
	Fri, 14 Mar 2025 08:51:22 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0QS-0000000DTQR-3Itf
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:29:54 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-85afd2b9106so167312139f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940992; x=1742545792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG/NhetTUX73vAvkNoljifPvpPm7zk3dE/2sfnfhqPg=;
        b=NqeyiVkAaipE4JMEyRcLyQJf3xm37RUO5Jnz+nJQPLqWFOMeG8OVgzSw38bb/Bgn81
         AhugTb7scQsDcU9eGFfLhLbALz+uuNBA0icNA6Epou7SsN4tkqZibLCDQSOoi4Vv9uoI
         1u68rPOcEiOrCYdu8eV+z9pqENlsO5siL6It5ro1uBd1EnaKXJA5Jf4rQO+k66cBdBLF
         HsVZ6QVrasaOV7i9haROC8hkyX8Rk4ZWvU4VNAZkDTuQDhTi433UXQSwZwTFkVxVWE+k
         SLVEONXXtp2JwNYPZPm8Yu7n9uu7ndJgagPPS1fWMoUYoAQgZNumxMLTmFuA7SufeR1G
         tg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940992; x=1742545792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG/NhetTUX73vAvkNoljifPvpPm7zk3dE/2sfnfhqPg=;
        b=s1S8at/sZ6YLuqlnA5BtqZpTEO4W8NhZQn6vkwDqMy422UcxcANzkgt9ddCdoo+73p
         TSvSG9lNMU9is+6Cw+7z0X9lz6yNIAHFpxMT8x5YLnLMgwqlyjBoWkhPCgA+LU0G2rlj
         G3LERSZ6KlLQGKQu3C1ZTrll8a9vC9k5u9nofz8T27RlcOL3n4rL41sSoKXPoPWNlyYM
         PxvmycR+Fk3epoltLpNz5LqOfv2BHk1MfsbGNfGRbK+kdmGfMnrbA4hRYs6+bFCEl34z
         vtm7hQmarl6Lob/iQcgb5P3/Jvod4ybPKlywHmh5UGKnxDKFvnxAum7CLPXp3m6TZhZl
         mgJw==
X-Forwarded-Encrypted: i=1; AJvYcCWe3QYZHgDywS5XHx7leBOTtyLXugC0BuF56hjOUzFMGoE2mANi94j+okt0Nsw4Xf3k4AHeg3sNHKha3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW0s6V5heGRqNWaftN+2v4sXkLI0oqgSlo8X1Tis5a+tANN6Wd
	vHyavXCTb914QkqMcqJhY/36steQUelA4cXIMvMsbGjy4KEXLX5mB2mr5mRN7allD2h2Afz976x
	nv4mTAdUBsPe2+W7ridERT+qd3ma+ICeLoMQBvw==
X-Gm-Gg: ASbGncsnkozU/X8vrrM2vc/BnOvfN+ogfWov/qXm84qe/waQWZXDvYzAR/Cpuz16MHQ
	TAz8HGgZt59S2DUh0IxITOS58tPA+o1pIWpRH0cDJvCVeE1rcQli9tPZXRKKhUzA4CX2poyZ/AV
	jpLK50F9CbOv5oZGvHD28LiSMsC0Q=
X-Google-Smtp-Source: AGHT+IGRGLu273ia/uJ1kVEfWXIabWgbH3cTFkXdos2+rXsX2htUfTI0qOd7W1pVul4CWeCQ4K4xAqme80WLVyOqC1E=
X-Received: by 2002:a05:6602:3809:b0:85b:3c49:8825 with SMTP id
 ca18e2360f4ac-85dc47a4b7emr202235439f.4.1741940992038; Fri, 14 Mar 2025
 01:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-9-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-9-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:29:41 +0800
X-Gm-Features: AQ5f1JqloEVd2PMJQWiW4SYNMnwxagAj6nW3aH_4ypy943_pLM-QCjhzDDCcitw
Message-ID: <CANXhq0rKE-PFP=OnD4o3+fDxgmzLxuz3LDyGmvBqnTgVO8oCsw@mail.gmail.com>
Subject: Re: [PATCH v11 09/27] riscv mmu: write protect and shadow stack
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
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012952_829349_41F72D6C 
X-CRM114-Status: GOOD (  25.55  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDLigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBgZm9ya2AgaW1wbGVtZW50cyBjb3B5IG9uIHdyaXRlIChD
T1cpIGJ5IG1ha2luZyBwYWdlcyByZWFkb25seSBpbiBjaGlsZAo+IGFuZCBwYXJlbnQgYm90aC4K
Pgo+IHB0ZXBfc2V0X3dycHJvdGVjdCBhbmQgcHRlX3dycHJvdGVjdCBjbGVhcnMgX1BBR0VfV1JJ
VEUgaW4gUFRFLgo+IEFzc3VtcHRpb24gaXMgdGhhdCBwYWdlIGlzIHJlYWRhYmxlIGFuZCBvbiBm
YXVsdCBjb3B5IG9uIHdyaXRlIGhhcHBlbnMuCj4KPiBUbyBpbXBsZW1lbnQgQ09XIG9uIHNoYWRv
dyBzdGFjayBwYWdlcywgY2xlYXJpbmcgdXAgVyBiaXQgbWFrZXMgdGhlbSBYV1IgPQo+IDAwMC4g
VGhpcyB3aWxsIHJlc3VsdCBpbiB3cm9uZyBQVEUgc2V0dGluZyB3aGljaCBzYXlzIG5vIHBlcm1z
IGJ1dCBWPTEgYW5kCj4gUEZOIGZpZWxkIHBvaW50aW5nIHRvIGZpbmFsIHBhZ2UuIEluc3RlYWQg
ZGVzaXJlZCBiZWhhdmlvciBpcyB0byB0dXJuIGl0Cj4gaW50byBhIHJlYWRhYmxlIHBhZ2UsIHRh
a2UgYW4gYWNjZXNzIChsb2FkL3N0b3JlKSBmYXVsdCBvbiBzc3B1c2gvc3Nwb3AKPiAoc2hhZG93
IHN0YWNrKSBhbmQgdGhlbiBwZXJmb3JtIENPVyBvbiBzdWNoIHBhZ2VzLiBUaGlzIHdheSByZWd1
bGFyIHJlYWRzCj4gd291bGQgc3RpbGwgYmUgYWxsb3dlZCBhbmQgbm90IGxlYWQgdG8gQ09XIG1h
aW50YWluaW5nIGN1cnJlbnQgYmVoYXZpb3IKPiBvZiBDT1cgb24gbm9uLXNoYWRvdyBzdGFjayBi
dXQgd3JpdGVhYmxlIG1lbW9yeS4KPgo+IE9uIHRoZSBvdGhlciBoYW5kIGl0IGRvZXNuJ3QgaW50
ZXJmZXJlIHdpdGggZXhpc3RpbmcgQ09XIGZvciByZWFkLXdyaXRlCj4gbWVtb3J5LiBBc3N1bXB0
aW9uIGlzIGFsd2F5cyB0aGF0IF9QQUdFX1JFQUQgbXVzdCBoYXZlIGJlZW4gc2V0IGFuZCB0aHVz
Cj4gc2V0dGluZyBfUEFHRV9SRUFEIGlzIGhhcm1sZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVl
cGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggfCAxMiArKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
IGluZGV4IGNjZDJmYTM0YWZiOC4uNTQ3MDc2ODZmMDQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiBAQCAtNDExLDcgKzQxMSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV9kZXZt
YXAocHRlX3QgcHRlKQo+Cj4gIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3dycHJvdGVjdChwdGVf
dCBwdGUpCj4gIHsKPiAtICAgICAgIHJldHVybiBfX3B0ZShwdGVfdmFsKHB0ZSkgJiB+KF9QQUdF
X1dSSVRFKSk7Cj4gKyAgICAgICByZXR1cm4gX19wdGUoKHB0ZV92YWwocHRlKSAmIH4oX1BBR0Vf
V1JJVEUpKSB8IChfUEFHRV9SRUFEKSk7Cj4gIH0KPgo+ICAvKiBzdGF0aWMgaW5saW5lIHB0ZV90
IHB0ZV9ta3JlYWQocHRlX3QgcHRlKSAqLwo+IEBAIC02MTIsNyArNjEyLDE1IEBAIHN0YXRpYyBp
bmxpbmUgcHRlX3QgcHRlcF9nZXRfYW5kX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICBz
dGF0aWMgaW5saW5lIHZvaWQgcHRlcF9zZXRfd3Jwcm90ZWN0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBh
ZGRyZXNzLCBwdGVfdCAqcHRlcCkKPiAgewo+IC0gICAgICAgYXRvbWljX2xvbmdfYW5kKH4odW5z
aWduZWQgbG9uZylfUEFHRV9XUklURSwgKGF0b21pY19sb25nX3QgKilwdGVwKTsKPiArICAgICAg
IHB0ZV90IHJlYWRfcHRlID0gUkVBRF9PTkNFKCpwdGVwKTsKPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBwdGVwX3NldF93cnByb3RlY3QgY2FuIGJlIGNhbGxlZCBmb3Igc2hhZG93IHN0YWNrIHJh
bmdlcyB0b28uCj4gKyAgICAgICAgKiBzaGFkb3cgc3RhY2sgbWVtb3J5IGlzIFhXUiA9IDAxMCBh
bmQgdGh1cyBjbGVhcmluZyBfUEFHRV9XUklURSB3aWxsIGxlYWQgdG8KPiArICAgICAgICAqIGVu
Y29kaW5nIDAwMGIgd2hpY2ggaXMgd3JvbmcgZW5jb2Rpbmcgd2l0aCBWID0gMS4gVGhpcyBzaG91
bGQgbGVhZCB0byBwYWdlIGZhdWx0Cj4gKyAgICAgICAgKiBidXQgd2UgZG9udCB3YW50IHRoaXMg
d3JvbmcgY29uZmlndXJhdGlvbiB0byBiZSBzZXQgaW4gcGFnZSB0YWJsZXMuCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIGF0b21pY19sb25nX3NldCgoYXRvbWljX2xvbmdfdCAqKXB0ZXAsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgKChwdGVfdmFsKHJlYWRfcHRlKSAmIH4odW5zaWduZWQgbG9u
ZylfUEFHRV9XUklURSkgfCBfUEFHRV9SRUFEKSk7Cj4gIH0KPgo+ICAjZGVmaW5lIF9fSEFWRV9B
UkNIX1BURVBfQ0xFQVJfWU9VTkdfRkxVU0gKPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25nIExp
IDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
