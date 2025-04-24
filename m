Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7DCC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahNhmecb8tmZViByAF8Koj2MJfeBMzwby7eppTSK9RQ=; b=o2inp1TXe++oOt
	sZskayV3EHbTwh3U5FXIzVkGvvoTGb8G3PrcsbHzCQKamQYmdz8ipCEHak9XVLeaRwzHIoBwkdPWZ
	31qY9QeRHI2zq66PARxiQguF2Q7yLed23cjpKo7+S1XbwlJQK4JfdFvTyJbTadPwhem8x6pa4yXqU
	GdSlchEgNR8nJg8vFmYkuIEltMzEUVNt00OAv/Udn2Xjw+4RT8AsVN6kf37o/uE6vTySj8G0jeq2l
	PBXURaQh+MnoZeYP0Nju7OPehW3VNnQmJAnAEtRbssmDl3Qgj/Qx9M04F0rTPKWSMwOwF3K/Lf4Sa
	1dRPNA75mjWpYdcZ0z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s56-0000000DLUP-3nPs;
	Thu, 24 Apr 2025 08:37:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qtr-0000000D8Mk-1rjh
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22409077c06so10384725ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479295; x=1746084095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56/SgN8tPGcoGAXYBKRxyrEfzuX2/hNCTBzPLMLGwJ8=;
        b=Ga1k1SqqJ8iJK+natk2+sula7XGvPWwCveNRflmvuPQihxPckvdbVJO4vUwDqI/8db
         SNaCr7c9Kmfu9/0CeeJVCx4t5h8fsXD6w7jin2JIp5ZH3OHlfV6KI2tgYsxaWvq8JFHE
         2TDrdyaw3ZB6/pdaM5cUf8bqaidRL+aBPQsD0POB6YJrLMgdFxNW7apLdQWsxAaQvnZD
         ZmeJXzRV6zHx88xzXFhVdixdi83c2UkURotwfZ3BlfW2xa58uAmaIJ0DVV4HwkM2F6ad
         q2MCtLJACZ6zDmMgUWCDiTRxO2ZoBc3LpZrntez4cZ55Z/+8ceTPPPR2ZvEHmDnrbxcH
         HMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479295; x=1746084095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56/SgN8tPGcoGAXYBKRxyrEfzuX2/hNCTBzPLMLGwJ8=;
        b=nzp8neITLgfXqpXykOf3sXJRJIe9z8Idy1i8r+OpUvTuf08ZFhhvl+mzuoqaYmDMx/
         eT0ERswbxUQfqWxWgZCgPKXLA3b2C1deLvDg7VHi8MtxsgrNXgn7jpoHzmf5TrlXEcWp
         3WGtAqwas5C3j1K+wRTqEcxs55ESefgI0QojyRyh7doliXI0+NHKb7psx3bIEKInyOUZ
         e9NxpJUIRBHI+uAqpVshxKEPydD6EyqF3j05uuQEUJS3IRls/yHRW1ik6giKhbbchsPI
         i8TZHNrxpXRaQ1HWcuCnflnVpxnXgGtWbK121n8++xaBxwmto9x61aazeUomEcvnDMtE
         pfqA==
X-Forwarded-Encrypted: i=1; AJvYcCWfjktcJ1Yo3Ua+U2kP8Mq6EaxsxiI9hQrvJRoRWt6GKijEmA2T5HK2kCSiEGUhCjZkhz2YV26N48ItSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGn1Usgd/M9ibdt4KKTPluoBiZaZ93CwgaQuMYwBMGkMOowyux
	tZHjcCUz592xcSDLeVNoa+NlY8KWOP8mGvHUPUYtzxawCkBoGlkGhrDEobnwPtc=
X-Gm-Gg: ASbGnctyJsqtrxbY2uMvMuRlOBi4reIBQYrjOfpju5AQCGwY6YT+GCG+Hb1+UA1XyFX
	82aKVQc9kd0tmJOxi1Xl3aEOG4Yu0dWwYzDH4rUWZpH2sjVARngTTYMIKFZ6EYEia8nAoAbEbLa
	YdE5mo/ieZctV681r4beTube1bijcvnrH+hymWRiSt3HQnZkB2iLaTyQqVxC6xS1sE/pnd8ng1C
	eCddJYeBYsoEAvNLwt6O71YL0TLm2d7U2fhkMyGMRiXntdCfwLeIX6uNpreRl4MAfz9Y8kOpNov
	4uS4DZ0U1unMz8ortqsj9NZwMhvESNfWyl4cv1CEOg36R7N3RqI=
X-Google-Smtp-Source: AGHT+IES6ugcFiGiBeYn0Bu9yj72YjguM/2DnNhh5dwYD/ciftAfP8S7Lu2JJFwp+N1aQgpYEtpBuA==
X-Received: by 2002:a17:903:24a:b0:223:668d:eba9 with SMTP id d9443c01a7336-22db3bb6f7dmr25356505ad.10.1745479294876;
        Thu, 24 Apr 2025 00:21:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:37 -0700
Subject: [PATCH v13 22/28] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-22-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002135_493258_A41B401F 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lY2Vzc2Fy
eSBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoZSBGV0ZUIGV4dGVuc2lvbi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFpv
bmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggM2QyNTA4MjQxNzhiLi4yM2JmYjI1
NGUzZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRf
aWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0
MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2
NTQsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMg
cmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00
MDEsNiArNDAyLDMxIEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogCiAjZGVmaW5lIFNC
SV9OQUNMX1NITUVNX1NSRVRfWChfX2kpCQkoKF9fcmlzY3ZfeGxlbiAvIDgpICogKF9faSkpCiAj
ZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9MQVNUCQkzMQorLyogU0JJIGZ1bmN0aW9uIElE
cyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJ
MHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVtIHNiaV9md2Z0X2ZlYXR1
cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0gMHgwLAorCVNCSV9GV0ZU
X0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCisJ
U0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJ
TkcJCT0gMHg0LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJUCQk9IDB4NSwKKwlTQklf
RldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlTQklfRldGVF9MT0NBTF9Q
TEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX0VO
RAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX1NUQVJUCQk9IDB4
ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJPSAweGJmZmZmZmZmLAor
CVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAwMDAwLAorCVNCSV9GV0ZU
X0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisKKyNkZWZpbmUgU0JJX0ZX
RlRfR0xPQkFMX0ZFQVRVUkVfQklUCQkoMSA8PCAzMSkKKyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZP
Uk1fRkVBVFVSRV9CSVQJCSgxIDw8IDMwKQorCisjZGVmaW5lIFNCSV9GV0ZUX1NFVF9GTEFHX0xP
Q0sJCQkoMSA8PCAwKQogCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxkcyAqLwogI2RlZmluZSBT
QklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
