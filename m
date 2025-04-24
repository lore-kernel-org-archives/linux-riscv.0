Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56339C369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SgtTrxkfGbXtH9EUUid9MJ5O8g08L/0SIlWjnNX2IE=; b=mU8LDJxHZWfGUN
	ZiDKFDTm/G1ZW/eo0mVJJ88eE3n1t9NxFqEoqTBoUQI1hXExK88hNqNFqR1oHzLbnzqFjWQAzdhBz
	lV9ZQxehv1wTKOLcHq5VsjbupNYT0ts2fquiXODcGT0B8s0kGCl5CWCgmzXuTw1zwclmbLTTVSiOt
	Csh7dGSmzAl6lYJLJ12Lm+2UVS/2k5e2K1UjkEgJWRK0efMz2TGqJEH33YpbD5AH03mM6/3gG7/ns
	FpuX5teFPomqEH2v00vS5bBPYwFutVsVtRZ282ztnczeMH60thVwWXqu3fX6FkwuiZE9jsyVhIuEj
	mv3G0Eo+wt9QrQqJ2QRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3A-0000000EZtR-2zLj;
	Thu, 24 Apr 2025 16:03:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v8I-0000000DvM0-0BpA
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:52:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1256385e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745495564; x=1746100364; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+dd0LSkGUj1HE7Y4OEfSLazS5H3NN900Vi5gbnC580=;
        b=SS40+ULWkap7QPMKtsALVENR3Tf0ECMgdC7xC0mbxWzU8Y8wNshClFQ5TQ41FGkJzI
         eUq5Kiwjgj6VUCtJkvZZL2llpBNLshLgF375fY5HA3wmvsles75j7rxzxnMHdhWCOycD
         qXLOmk1fOzT2gaUARC7zpHYtJyG0ZBET+tcpBWhnHiHV/uMUa1/caASLCKKPhQnfnYCc
         FQXdmp8a/28OHiP6rHNcSxtaNdDw4SHUL308aS0On+8kQE5GRvdLfYSdZpX86MaDU5l0
         Ml39mJVQDUzXGRuOrHziCT3sIYMBjN020tOIzaK6ba7PywOI9YCfaoIgh0QuHrwxox4V
         nM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495564; x=1746100364;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+dd0LSkGUj1HE7Y4OEfSLazS5H3NN900Vi5gbnC580=;
        b=kbPQxhSsprVNTpabJBiikG5UoRMQSFEhFIYn94uIBVW1mXjhK3fsMRY/Lv7PAk390H
         gC/OEfNM4F1pJDOk4iGdUkcnG5V83avVOWXZ3gF1G4paUiwvVoNXnVhGCdamRcF1lQKm
         rSrzk5oytzgS14IU8tI1DJMiV2rox7cZToG8u4A0RW2+5BOOIz/a/XGkS41zla6e+/YG
         jHs3iorZ1+MWFxR8ffPgnPji4OtFMgMFJglmKEID2pRSxaXz2CWewCYLpjx9zYUDRprY
         0qWzqwYi9kxr7QNCCJdZkW1VXX+8YedLWe63FHXcrGcoEQKQY3rZ+78G3NRrOlQ/Z5Tv
         OA7A==
X-Forwarded-Encrypted: i=1; AJvYcCWe6evHeak0K02DXHUCTx+GGvSbfwgQsNgbkpTm571XWfXiLPXCWsNOU3nCExRCacpDhdgKX0T0qbUp3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEORWEv29AKKzKY52mSjClt3aURYdSzupTZKEIKa54eCvm/8/W
	wFjJVJLmezfSR8G8A97QP0STrAMR/m+23pLwsGh9WpG+t5L4Tb27KEY6jEjyUKU=
X-Gm-Gg: ASbGncupXQZ/ZNeAND5OfX7Mgp2f5I1IYQWI+bOQrb/UQbUA7fROw8uSe4WkDzQeNAk
	Cx46tfI34TRiQmqAtKj+ycDbgpdrZnItx8oBKKqtSX+uVwgn23/6CHvjrn6vwq4qjZVcwbTf/L3
	r67dMUNFfju+BKfwzihba9rdVd7IjZ/y9kvL85K8jlfMNUPV+BXNFDbfYQzxn62aEM3VRYJJqjd
	Jw+VakEToukpjDQXTxW7TMHblQ12T+W2ZsEcfB/VZsc8FBuPB7Dn4c+yWu2ktfEJBFGBON4Q5mr
	vCigFP55bmzx8jxumjNCFszgZzNsFkxeGyl5U/mcyyKnlZr/
X-Google-Smtp-Source: AGHT+IF8wqwUphleYE2qKoazIUMOkR8h6x1rMfa0xrlvKXCx8csAkRx3P4JsSRpMyeAudqq5D+3jRA==
X-Received: by 2002:a5d:6d8a:0:b0:3a0:678f:ddd8 with SMTP id ffacd0b85a97d-3a06cf5262cmr625001f8f.2.1745495563895;
        Thu, 24 Apr 2025 04:52:43 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b30c:ee4d:9e10:6a46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5323casm1860957f8f.75.2025.04.24.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:52:43 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 13:52:43 +0200
Message-Id: <D9EUJBQ5OHN0.2KUJHGXK262TR@ventanamicro.com>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
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
 <cleger@rivosinc.com>, <broonie@kernel.org>, <rick.p.edgecombe@intel.com>,
 "Zong Li" <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAl_HRk49lnseiio@debug.ba.rivosinc.com>
In-Reply-To: <aAl_HRk49lnseiio@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045246_089576_3B926CE8 
X-CRM114-Status: GOOD (  25.65  )
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

MjAyNS0wNC0yM1QxNzowMDoyOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDAxOjA0OjM5UE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTAzLTE0VDE0OjM5OjI0LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5o
Cj4+PiBAQCAtNjIsNiArNjIsOSBAQCBzdHJ1Y3QgdGhyZWFkX2luZm8gewo+Pj4gIAlsb25nCQkJ
dXNlcl9zcDsJLyogVXNlciBzdGFjayBwb2ludGVyICovCj4+PiAgCWludAkJCWNwdTsKPj4+ICAJ
dW5zaWduZWQgbG9uZwkJc3lzY2FsbF93b3JrOwkvKiBTWVNDQUxMX1dPUktfIGZsYWdzICovCj4+
PiArI2lmZGVmIENPTkZJR19SSVNDVl9VU0VSX0NGSQo+Pj4gKwlzdHJ1Y3QgY2ZpX3N0YXR1cwl1
c2VyX2NmaV9zdGF0ZTsKPj4+ICsjZW5kaWYKPj4KPj5JIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNl
bnNlIHRvIHB1dCBhbGwgdGhlIGRhdGEgaW4gdGhyZWFkX2luZm8uCj4+a2VybmVsX3NzcCBhbmQg
dXNlcl9zc3AgaXMgbW9yZSB0aGFuIGVub3VnaCBhbmQgdGhlIHJlc3QgY2FuIGNvbWZvcnRhYmx5
Cj4+bGl2ZSBlbHNld2hlcmUgaW4gdGFza19zdHJ1Y3QuCj4+Cj4+dGhyZWFkX2luZm8gaXMgc3Vw
cG9zZWQgdG8gYmUgYXMgc21hbGwgYXMgcG9zc2libGUgLS0ganVzdCBzcGFubmluZwo+Pm11bHRp
cGxlIGNhY2hlLWxpbmVzIGNvdWxkIGJlIG5vdGljZWFibGUuCj4KPiBJIGNhbiBjaGFuZ2UgaXQg
dG8gb25seSBpbmNsdWRlIG9ubHkgYHVzZXJfc3NwYCwgYmFzZSBhbmQgc2l6ZS4KCk5vIG5lZWQg
Zm9yIGJhc2UgYW5kIHNpemUgZWl0aGVyIC0tIHdlIGRvbid0IHRvdWNoIHRoYXQgaW4gdGhlIGNv
bW1vbgpleGNlcHRpb24gY29kZS4KCj4gQnV0IGJlZm9yZSB3ZSBnbyB0aGVyZSwgc2VlIGJlbG93
Ogo+Cj4gJCBwYWhvbGUgLUMgdGhyZWFkX2luZm8ga2J1aWxkL3ZtbGludXgKPiBzdHJ1Y3QgdGhy
ZWFkX2luZm8gewo+ICAgICAgICAgIGxvbmcgdW5zaWduZWQgaW50ICAgICAgICAgIGZsYWdzOyAg
ICAgICAgICAgICAgICAvKiAgICAgMCAgICAgOCAqLwo+ICAgICAgICAgIGludCAgICAgICAgICAg
ICAgICAgICAgICAgIHByZWVtcHRfY291bnQ7ICAgICAgICAvKiAgICAgOCAgICAgNCAqLwo+Cj4g
ICAgICAgICAgLyogWFhYIDQgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8KPgo+ICAgICAgICAg
IGxvbmcgaW50ICAgICAgICAgICAgICAgICAgIGtlcm5lbF9zcDsgICAgICAgICAgICAvKiAgICAx
NiAgICAgOCAqLwo+ICAgICAgICAgIGxvbmcgaW50ICAgICAgICAgICAgICAgICAgIHVzZXJfc3A7
ICAgICAgICAgICAgICAvKiAgICAyNCAgICAgOCAqLwo+ICAgICAgICAgIGludCAgICAgICAgICAg
ICAgICAgICAgICAgIGNwdTsgICAgICAgICAgICAgICAgICAvKiAgICAzMiAgICAgNCAqLwo+Cj4g
ICAgICAgICAgLyogWFhYIDQgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8KPgo+ICAgICAgICAg
IGxvbmcgdW5zaWduZWQgaW50ICAgICAgICAgIHN5c2NhbGxfd29yazsgICAgICAgICAvKiAgICA0
MCAgICAgOCAqLwo+ICAgICAgICAgIHN0cnVjdCBjZmlfc3RhdHVzICAgICAgICAgIHVzZXJfY2Zp
X3N0YXRlOyAgICAgICAvKiAgICA0OCAgICAzMiAqLwo+ICAgICAgICAgIC8qIC0tLSBjYWNoZWxp
bmUgMSBib3VuZGFyeSAoNjQgYnl0ZXMpIHdhcyAxNiBieXRlcyBhZ28gLS0tICovCj4gICAgICAg
ICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgYTA7ICAgICAgICAgICAgICAgICAgIC8qICAg
IDgwICAgICA4ICovCj4gICAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgYTE7ICAg
ICAgICAgICAgICAgICAgIC8qICAgIDg4ICAgICA4ICovCj4gICAgICAgICAgbG9uZyB1bnNpZ25l
ZCBpbnQgICAgICAgICAgYTI7ICAgICAgICAgICAgICAgICAgIC8qICAgIDk2ICAgICA4ICovCj4K
PiAgICAgICAgICAvKiBzaXplOiAxMDQsIGNhY2hlbGluZXM6IDIsIG1lbWJlcnM6IDEwICovCj4g
ICAgICAgICAgLyogc3VtIG1lbWJlcnM6IDk2LCBob2xlczogMiwgc3VtIGhvbGVzOiA4ICovCj4g
ICAgICAgICAgLyogbGFzdCBjYWNoZWxpbmU6IDQwIGJ5dGVzICovCj4gfTsKPgo+IElmIHdlIHdl
cmUgdG8gcmVtb3ZlIGVudGlyZSBgY2ZpX3N0YXR1c2AsIGl0IHdvdWxkIHN0aWxsIGJlIDcyIGJ5
dGVzICg4OCBieXRlcwo+IGlmIHNoYWRvdyBjYWxsIHN0YWNrIHdlcmUgZW5hYmxlZCkgYW5kIGFs
cmVhZHkgc3BhbnMgYWNyb3NzIHR3byBjYWNoZWxpbmVzLgoKSXQgaGFzIG9ubHkgNjQgYnl0ZXMg
b2YgZGF0YSB3aXRob3V0IHNoYWRvdyBjYWxsIHN0YWNrLCBidXQgaXQgd2FzdGVkIDgKYnl0ZXMg
b24gdGhlIGhvbGVzLgphMiBpcyBzb21ld2hhdCBhbiBvdXRsaWVyIHRoYXQgaXMgbm90IHVzZWQg
bW9zdCBleGNlcHRpb24gcGF0aHMgYW5kCmV4Y2x1ZGluZyBpdCBtYWtlcyBldmVyeXRoaW5nIGZp
dCBuaWNlbHkgZXZlbiBub3cuCgo+IGlmIHNoYWRvdyBjYWxsIHN0YWNrIHdlcmUgZW5hYmxlZCkg
YW5kIGFscmVhZHkgc3BhbnMgYWNyb3NzIHR3byBjYWNoZWxpbmVzLiBJCj4gZGlkIHNlZSB0aGUg
Y29tbWVudCBhYm92ZSB0aGF0IGl0IHNob3VsZCBmaXQgaW5zaWRlIGEgY2FjaGVsaW5lLiBBbHRo
b3VnaCBJCj4gYXNzdW1lZCBpdHMgc3RhbGUgY29tbWVudCBnaXZlbiB0aGF0IGl0IGFscmVhZHkg
c3BhbnMgYWNyb3NzIGNhY2hlbGluZSBhbmQgSQo+IGRpZG4ndCBzZWUgYW55IHNwZWNpYWwgbWVu
dGlvbiBpbiBjb21taXQgbWVzc2FnZXMgb2YgY2hhbmdlcyB3aGljaCBncmV3IHRoaXMKPiBzdHJ1
Y3R1cmUgYWJvdmUgb25lIGNhY2hlbGluZS4gU28gSSBhc3N1bWVkIHRoaXMgd2FzIGEgc3RhbGUg
Y29tbWVudC4KPgo+IE9uIHRoZSBvdGhlciBoYW5kLCB3aGVuZXZlciBlbmFibGUvbG9jayBiaXRz
IGFyZSBjaGVja2VkLCB0aGVyZSBpcyBhIGhpZ2gKPiBsaWtlbHlob29kIHRoYXQgdXNlcl9zc3Ag
YW5kIG90aGVyIGZpZWxkcyBhcmUgZ29pbmcgdG8gYmUgYWNjZXNzZWQgYW5kCj4gdGh1cyBpdCBh
Y3R1YWxseSBtaWdodCBiZSBoZWxwZnVsIHRvIGhhdmUgaXQgYWxsIGluIG9uZSBjYWNoZWxpbmUg
ZHVyaW5nCj4gcnVudGltZS4KClllcywgYWx0aG91Z2ggYWNjZXNzaW5nIGVuYWJsZS9sb2NrIGJp
dHMgd2lsbCBiZSByZWxhdGl2ZWx5IHJhcmUuCkl0IHNlZW1zIGJldHRlciB0byBoYXZlIHRoZSBv
dmVyaGVhZCBkdXJpbmcgdGhyZWFkIHNldHVwLCByYXRoZXIgdGhhbiBvbgpldmVyeSB0cmFwLgoK
PiBTbyBJIGFtIG5vdCBzdXJlIGlmIGl0cyBoZWxwZnVsIHN0aWNraW5nIHRvIHRoZSBjb21tZW50
IHdoaWNoIGFscmVhZHkgaXMgc3RhbGUuCgpXZSBjb3VsZCBmaXggdGhlIGhvbGVzIGFuZCBhbHNv
IHVzZSBzcCBpbnN0ZWFkIG9mIGEwIGluIHRoZQpuZXdfdm1hbGxvY19jaGVjaywgc28gZXZlcnl0
aGluZyB3b3VsZCBmaXQgYmV0dGVyLgoKV2UgYXJlIHJlYWxseSBjbG9zZSB0byBmaXR0aW5nIGlu
dG8gYSBzaW5nbGUgY2FjaGUtbGluZSwgc28gSSdkIHByZWZlcgppZiBzaGFkb3cgc3RhY2sgb25s
eSBmaWxsZWQgdGhyZWFkX2luZm8gd2l0aCBkYXRhIHRoYXQgaXMgdXNlZCB2ZXJ5Cm9mdGVuIGlu
IHRoZSBleGNlcHRpb24gaGFuZGxpbmcgY29kZS4KCkkgdGhpbmsgd2UgY291bGQgZG8gd2l0aG91
dCB1c2VyX3NwIGluIHRocmVhZF9pbmZvIGFzIHdlbGwsIHNvIHRoZXJlIGFyZQpvdGhlciBwYWNr
aW5nIG9wdGlvbnMuCgpCdHcuIGNvdWxkIHNzcCBiZSBhZGRlZCB0byBwdF9yZWdzPwoKVGhhbmtz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
