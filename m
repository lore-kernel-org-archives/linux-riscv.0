Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA2C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd1wQjqYmKdPr/U2DccVFtLjugqJen4K/xsK+zKpI+4=; b=IQMPzN6eFPltEu
	TRgsVQY+WhZj9PVBRBIM+d4nwF1AViChU2IDUujuo7vR17mofO7Hng+AjZ/+2BENtadQFmzSYhY2S
	gBvzBpiplMqeBx51400N5g41N3EoOcOu4T94SDAIkXMyEmT6C+qNsT4grsfbjDMbYNXGC5LtG4fcU
	t3Q+jw1bXhcyReA0xfrg9T53O/A7/9uA77B+1+AMaZ7sRxe//IhN5SwF2T6E0GmjWq18F3M0h/NMn
	MYyw3cHCqX/Yg1QytFjyaZrcm2/BEW0pRG8mV4SVgEmI+lQPez8xsoTK3dPYj2Vrx1//kObcgZGlX
	KcY+aj7b0zUdZA7MdfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wuw-0000000EEuz-38rS;
	Thu, 24 Apr 2025 13:47:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vcB-0000000E1PT-1qw8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:23:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf861f936so1707975e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745497418; x=1746102218; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nffUUxHQRUxihyV+Es46LKx5IUoFWP6+nxUCQrf1fjs=;
        b=C1it2bwUFAhnY6r31AcI0RfhMge0RoG+uH8B5SLeIfloAwaBr8Z9lzQ8lyYpbTHpjs
         L4n8uwGO7XWm1oiRNg5zagpg2KSs6G0FJeacZF5oBd8MJiem1T2xkFQ/rKXiRUecCpFo
         FNRRU5zcrF7rAYCT9PHzR/3JtJl63776qxTYEH0GCdhmPahDinktBomUThZ6xgfZpKnj
         08vWbnRoC7VDd0n1r+AAp2DENUykg7JLneIPMaxsRTj53+gaGqcGj26J4NqSBUqRbpm8
         sAOqoht04+K7kE0NWvkSlW0/TVgiMiBFZH9X4OrudKL9rY+z/ytM7DqPutIBOnFzgNpG
         1KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497418; x=1746102218;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nffUUxHQRUxihyV+Es46LKx5IUoFWP6+nxUCQrf1fjs=;
        b=qlUgzMyCotT/hYMQEADH4yAGgdriqBv+Iw4IxS5QJFyvHWzu7A8ZoDJXEoXBHBs78B
         7+PvIWOc8uFfPyAbXfaGRNux2TTXayDqmBvXLJJyPg1uoCudD6LYAKrrP3IDxqB+dNgi
         Jbu79Po6YJnmJM8sFQoMIiSC9y7/p4KYh3NouCHYr449SAia6cfsdcDIPNd2HIbMkBeW
         EkaptLx0+MX8MleaZ6l/la7skg98TF1dJ5iIKTGbU+l4Cl+cmNrS7S9gClgNs7hYbHgi
         IsjoUPb1/ucp2uNJSyM5jaMn5Fm1mYxB5IYMAPEFWjNh24JUw65l9L6yXrVguR3Y9yOx
         8EEw==
X-Forwarded-Encrypted: i=1; AJvYcCVP5/De0ekIH3bvfn24Y2hCXf9kJrDppiI12/cz8EaujIFFNGrSiA67QXPPxyzkOBkWkzp11kq03qmxdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0sVqNcef6JK4Duo10/3m+QrR10oBKbRH7rF5KTU2Bt9ekQH6+
	0mT35GKt6xOqEyxMGbDI4pmglPZTQnrif56Ug+8kwaTIwOz1bTTdkIw5UoVU0gc=
X-Gm-Gg: ASbGncufxuKgIoU4Oc5q5Qs6cvvqP/WmJ4ABNpvPixG8x9mG1j6XhqJ4yM+iM71QEyC
	QERebOHkV7pIFB11btCpy2w8TvkFDer7Md9AcCgI/sqZDjEXvU+IrAn6Y1hgGuLBoHQ7kp/L9rC
	BQlQdpa4bfUUH+KB9fwUMYnYokzMli6mH02MtQXbNOraKQz/cJqRa8zbvhRpnVmEE6DH4PvB9dD
	YuPkHABBV6XqaMl2QlQ7iYHBgyF7JeUik7Di4OsgUBtvk6s28tne0rJfh+rOwsDRRDBrfaE7aMR
	2gvr7Y3ZXA/xSueS8RnXFWgZ1acxJQezR2jQYB1eZqI372c1ZXvEuT+3Gvs=
X-Google-Smtp-Source: AGHT+IFvpk8fVElfDmbD5bbQ4KBSF4oRicSe9nZGd6eQAPt/95H7RizUp5Ju8acqfaiZr/JLSD9aIA==
X-Received: by 2002:a05:600c:3516:b0:440:58d1:7ec3 with SMTP id 5b1f17b1804b1-4409bda5fadmr8020715e9.6.1745497417906;
        Thu, 24 Apr 2025 05:23:37 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b30c:ee4d:9e10:6a46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29bfc4sm20203525e9.8.2025.04.24.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:23:37 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 14:23:37 +0200
Message-Id: <D9EV6ZHETDM6.36DJZQTQ487O1@ventanamicro.com>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>
 <D92VG9GT3W5D.2B71FBI67EYJ6@ventanamicro.com>
 <aAmJweehK4ntbVoO@debug.ba.rivosinc.com>
In-Reply-To: <aAmJweehK4ntbVoO@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_052339_479973_BE2CCD1A 
X-CRM114-Status: GOOD (  10.70  )
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

MjAyNS0wNC0yM1QxNzo0NTo1My0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDEyOjAzOjQ0UE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTAzLTE0VDE0OjM5OjI1LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+Pj4gQEAgLTE2LDYg
KzE3LDE1IEBAIHN0YXRpYyBsb25nIHJpc2N2X3N5c19tbWFwKHVuc2lnbmVkIGxvbmcgYWRkciwg
dW5zaWduZWQgbG9uZyBsZW4sCj4+PiArCS8qCj4+PiArCSAqIElmIFBST1RfV1JJVEUgaXMgc3Bl
Y2lmaWVkIHRoZW4gZXh0ZW5kIHRoYXQgdG8gUFJPVF9SRUFECj4+PiArCSAqIHByb3RlY3Rpb25f
bWFwW1ZNX1dSSVRFXSBpcyBub3cgZ29pbmcgdG8gc2VsZWN0IHNoYWRvdyBzdGFjayBlbmNvZGlu
Z3MuCj4+PiArCSAqIFNvIHNwZWNpZnlpbmcgUFJPVF9XUklURSBhY3R1YWxseSBzaG91bGQgc2Vs
ZWN0IHByb3RlY3Rpb25fbWFwIFtWTV9XUklURSB8IFZNX1JFQURdCj4+PiArCSAqIElmIHVzZXIg
d2FudHMgdG8gY3JlYXRlIHNoYWRvdyBzdGFjayB0aGVuIHRoZXkgc2hvdWxkIHVzZSBgbWFwX3No
YWRvd19zdGFja2Agc3lzY2FsbC4KPj4+ICsJICovCj4+PiArCWlmICh1bmxpa2VseSgocHJvdCAm
IFBST1RfV1JJVEUpICYmICEocHJvdCAmIFBST1RfUkVBRCkpKQo+Pj4gKwkJcHJvdCB8PSBQUk9U
X1JFQUQ7Cj4+Cj4+V2h5IGlzbid0IHRoZSBwcmV2aW91cyBodW5rIGJlIGVub3VnaD8gIChPciB3
aHkgZG9uJ3Qgd2UgZG8ganVzdCB0aGlzPykKPj4KPj5yaXNjdl9zeXNfbW1hcCgpIGV2ZW50dWFs
bHkgY2FsbHMgYXJjaF9jYWxjX3ZtX3Byb3RfYml0cygpLCBzbyBJJ2QKPj5yYXRoZXIgZml4IGVh
Y2ggY29kZSBwYXRoIGp1c3Qgb25jZS4KPgo+IFlvdSdyZSByaWdodC4gQWJvdmUgaHVuayAoYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9tbWFuLmgpIGFsb25lIHNob3VsZCBiZSBlbm91Z2guCj4gSSBk
aWQgdGhpcyBjaGFuZ2UgaW4gYHN5c19yaXNjdi5jYCBvdXQgb2YgY2F1dGlvbi4gSWYgaXQgZmVl
bHMgbGlrZSB1bi1uZWNlc3NhcnksCj4gSSdsbCByZW1vdmUgaXQuIE5vIGhhcmQgZmVlbGluZ3Mg
ZWl0aGVyIHdheS4KCkkgdGhpbmsgaXQgbWFrZXMgdGhlIGNvZGUgaGFyZGVyIHRvIHJlYXNvbiBh
Ym91dC4gIEhlcmUgaXQgaXMgbm90IGNsZWFyCndoeSB0aGlzIGNhbGxlciBvZiBrc3lzX21tYXBf
cGdvZmYoKSBoYXMgdG8gZG8gdGhpcywgd2hpbGUgb3RoZXJzIGRvbid0LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
