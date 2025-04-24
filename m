Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0015EC369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 01:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jQU9/uQzYAqutVwJUy5u31qNY0ZkvVf9mXH9WhaUT4=; b=qzMUvxO/XL8zfyy1Yjwyz3553z
	y4ilO+Db46J6VVuHmkD7dtXCrquaXZL7QMyyovZyC43lp71K7q1ixgh44eRlMTYO9+IReYESYMef7
	/dFYHIYH9KMIdUta6yhKRTGi7dwcwYs+lGnyJknY8A3tSh9mdbSAumRw9xc6ydEDY/KSBcU7SrgYP
	dfqHan73BJtVWF0HyVcFKCgKdwhP+DM1BVQ92fpejuwrA4uDDhKNVnDUQDo86jlI+7PuI+To9EDke
	GnX+QEy8jzzcUCIEI3WkiP0+CJeCDFvMzPgbuMoqyaDDo7x4GBkdPba/6L/6nQ4AlxBbGGkQL9eQ0
	eGp7+cXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7l52-0000000CToq-1Ejn;
	Thu, 24 Apr 2025 01:08:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kj0-0000000CQri-236E
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 00:46:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736a7e126c7so333384b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 17:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745455557; x=1746060357; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CC8T5V5ETxB3aI46jMwjb5xUFdEfDSmv/WDvLTa/TKM=;
        b=IAaATqliWp2OKnDlRZT5S15MrX3ACtf5Mk9LDjEa8c0wWXQOz0X8Q9vhSC48mt0f1F
         pMWHBdwclQUweyciqfhw6iRKLnaoM0h20XIIx2+cazovA7kPl3iYGHHnVWcZL0lE3pXD
         3UR83hOd4uQ0Dd48PsTSGBMg7yeAWGIBodFyRNaSENTh8jbLAsBxbW+gFfU0FpUHuzYW
         xANXdI5OPvhzoZ+JOR9NCFjVyleFCkwHmaJ3InqQWyZO8aMg6YMlkfYk3uGcIpNUYkmG
         5olW2Tx3yF/A7AEOIy4xM3ioQLFkqFA71EDUjTA2z3e0pNR28KrhyJaVZU85vwK5QVL6
         gtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745455557; x=1746060357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CC8T5V5ETxB3aI46jMwjb5xUFdEfDSmv/WDvLTa/TKM=;
        b=jGkdXrA+wIlsVTzUw4W5PMS7AC7TN1DP/u3T5JFhV7lAXjCsoTydp4/fSVKj/jJIL/
         xvrDnLCTOfdNEtFNMqPZwjT4ANro4o9UnJzvwsObJ7xX1znCmlZbgo31c7RS7XH2CVNQ
         O0Lc4LOwW8VSbQL1ylQ87ByDzGaw6pOhmdVG4/CFOFlMZZPehUtZpWUhxiaSCYpskHfC
         3Ea53UhPcEaCoijwZUQRJ3BCNbrBzqXxi020Q40sV1S9ktJLANrZX/LCViDTgNXYkPm6
         CF5SfPr8YWd5arL4RkLa3C53v5iyyPVG5KBDwZrqplh7Yi526Ep4HrJz2tX8tot41wWQ
         3G/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4kya3kix2uGvVxJWda9MpOo7Xj4iS9nSVaC6u98JwVG+mta2dy7rzKkpZJzp4A3W7i5o+DDJ7g3esqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPwXTXwtkILxs8RNKQmOMI6REYfmlP4YjkckcMnlJPjfRz+jTI
	HSQaqmybBNkRyyL5GTxh5HsHgI1zgeamLXbyouPvJoeqCg2k6ru/7sy15ROPrPc=
X-Gm-Gg: ASbGncslAg6GB39l/tPMaISQ0ZXXeD6AfO1ci1we6Kw6QvWo3duZBy5T2EAO6jnCCdT
	/AZkAEFiGSzN2vgFZy9l36cPyTU1pHN16RbEwlIZw701yBF9xPQGoxBGLuv6kWSV7kED3lK9v3A
	ErxVYfWcwGtb2Su9jyPJ92/OPYDlPL3Lmnlnx37u59wTg+2woi/b9XOoKCHIHBx+JX1fS1o4ouy
	Bu2cWhIRpZ2+DfolHAQYdaPq0pmFwSy1dxXZc4fslqx3QuLeeh8xWycce1n91zm+0NTX6fgcurI
	AhWIO5/Fnf2J+nKSjYc3OeRKpVCdBGIMEZFQAUM4AuyPnPjcWzs=
X-Google-Smtp-Source: AGHT+IFSRc4jFZIKl/995vivdy0v1krVWENkLmQTo2FqdjSK7VIBAtsfvTZB7Ln0D+cPb89ZAHZGNw==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8f65:a6e6 with SMTP id adf61e73a8af0-20444f6b564mr805436637.27.1745455557578;
        Wed, 23 Apr 2025 17:45:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fadec8c0sm113497a12.68.2025.04.23.17.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:45:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:45:53 -0700
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
Subject: Re: [PATCH v12 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
Message-ID: <aAmJweehK4ntbVoO@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>
 <D92VG9GT3W5D.2B71FBI67EYJ6@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D92VG9GT3W5D.2B71FBI67EYJ6@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_174558_527207_63B25B52 
X-CRM114-Status: GOOD (  16.20  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMTI6MDM6NDRQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wMy0xNFQxNDozOToyNS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbWFu
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tYW4uaAo+PiArc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIGFyY2hfY2FsY192bV9wcm90X2JpdHModW5zaWduZWQgbG9uZyBwcm90LAo+PiAr
CQkJCQkJICAgdW5zaWduZWQgbG9uZyBwa2V5IF9fYWx3YXlzX3VudXNlZCkKPj4gK3sKPj4gKwl1
bnNpZ25lZCBsb25nIHJldCA9IDA7Cj4+ICsKPj4gKwkvKgo+PiArCSAqIElmIFBST1RfV1JJVEUg
d2FzIHNwZWNpZmllZCwgZm9yY2UgaXQgdG8gVk1fUkVBRCB8IFZNX1dSSVRFLgo+PiArCSAqIE9u
bHkgVk1fV1JJVEUgbWVhbnMgc2hhZG93IHN0YWNrLgo+PiArCSAqLwo+Cj5UaGlzIGZ1bmN0aW9u
IGFsc28gY2hhbmdlcyBQUk9UX1dYIHRvIFZNX1JXWCwgd2hpY2ggaXMgZWZmZWN0aXZlbHkgbm90
Cj5jaGFuZ2luZyBhbnl0aGluZywgYnV0IEkgdGhpbmsgaXQgZGVzZXJ2ZXMgYW4gZXhwbGljaXQg
aW50ZW50Lgo+KEF0IGxlYXN0IGluIHRoZSBjb21taXQgbWVzc2FnZS4pCgpXaWxsIGRvIHRoYXQu
Cgo+Cj4+ICsJaWYgKHByb3QgJiBQUk9UX1dSSVRFKQo+PiArCQlyZXQgPSAoVk1fUkVBRCB8IFZN
X1dSSVRFKTsKPj4gKwlyZXR1cm4gcmV0Owo+PiArfQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+PiBA
QCAtMTYsNiArMTcsMTUgQEAgc3RhdGljIGxvbmcgcmlzY3Zfc3lzX21tYXAodW5zaWduZWQgbG9u
ZyBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbiwKPj4gKwkvKgo+PiArCSAqIElmIFBST1RfV1JJVEUg
aXMgc3BlY2lmaWVkIHRoZW4gZXh0ZW5kIHRoYXQgdG8gUFJPVF9SRUFECj4+ICsJICogcHJvdGVj
dGlvbl9tYXBbVk1fV1JJVEVdIGlzIG5vdyBnb2luZyB0byBzZWxlY3Qgc2hhZG93IHN0YWNrIGVu
Y29kaW5ncy4KPj4gKwkgKiBTbyBzcGVjaWZ5aW5nIFBST1RfV1JJVEUgYWN0dWFsbHkgc2hvdWxk
IHNlbGVjdCBwcm90ZWN0aW9uX21hcCBbVk1fV1JJVEUgfCBWTV9SRUFEXQo+PiArCSAqIElmIHVz
ZXIgd2FudHMgdG8gY3JlYXRlIHNoYWRvdyBzdGFjayB0aGVuIHRoZXkgc2hvdWxkIHVzZSBgbWFw
X3NoYWRvd19zdGFja2Agc3lzY2FsbC4KPj4gKwkgKi8KPj4gKwlpZiAodW5saWtlbHkoKHByb3Qg
JiBQUk9UX1dSSVRFKSAmJiAhKHByb3QgJiBQUk9UX1JFQUQpKSkKPj4gKwkJcHJvdCB8PSBQUk9U
X1JFQUQ7Cj4KPldoeSBpc24ndCB0aGUgcHJldmlvdXMgaHVuayBiZSBlbm91Z2g/ICAoT3Igd2h5
IGRvbid0IHdlIGRvIGp1c3QgdGhpcz8pCj4KPnJpc2N2X3N5c19tbWFwKCkgZXZlbnR1YWxseSBj
YWxscyBhcmNoX2NhbGNfdm1fcHJvdF9iaXRzKCksIHNvIEknZAo+cmF0aGVyIGZpeCBlYWNoIGNv
ZGUgcGF0aCBqdXN0IG9uY2UuCgpZb3UncmUgcmlnaHQuIEFib3ZlIGh1bmsgKGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vbW1hbi5oKSBhbG9uZSBzaG91bGQgYmUgZW5vdWdoLgpJIGRpZCB0aGlzIGNo
YW5nZSBpbiBgc3lzX3Jpc2N2LmNgIG91dCBvZiBjYXV0aW9uLiBJZiBpdCBmZWVscyBsaWtlIHVu
LW5lY2Vzc2FyeSwKSSdsbCByZW1vdmUgaXQuIE5vIGhhcmQgZmVlbGluZ3MgZWl0aGVyIHdheS4K
Cj4KPlRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
