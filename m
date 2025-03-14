Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1CFC35FFB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KVkPAbp4TIk5uhdL3pVS13PRt3ZJdo9EOUC3duI/Pk=; b=qskdtvmMq9o1PW
	YHg8yaVkJIblX2Z4G4HTwr6QxCkVw7mhglbh2hlVpWSFfOvQqlw7WcXLiCfpGoAQ7njzFTOY5vrs+
	9gKBblnLxNtpjA/M4nvP1cl8zGx5vhcKQRy5b9+rmhaBtd0q1e5BpDyb5DItG14xkhPxhGgN1tWIv
	fvM5915/zKwvod3YwkLy9PkWWEQRY7xRMVAbPjvNHfRa3tpWxTnqzZotHQlQGpsokQ3pwAzoJzT1+
	n5JMnioricn0P+Xi6dUP4ARlaSqwTHWI8S/8V3I5S++pQ78SJa91sy7hKbfWsOv1dPlexDeM2g8XC
	HiGfcxFQpwgLFsl2O+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs3-0000000FSyd-48hu;
	Fri, 14 Mar 2025 22:51:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCm5-0000000FLcD-2GAK
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=wxaplZUgROh7QEyvXgaGSGBpfUL9KoHoiOWsJ+5Erjg=; b=VjtuFaVwKDkAPkO6WsbMgvP+mn
	lPF4wQgkeCUN7cJGuzmT8R98/MxfUxVaLGxYjetBrxH9zEeRSxUlmwpRXb7Q0a8/b2ZG8SS+M5pCc
	EYd7GoZS0t0Xm+3VRoZXF/u9DuvhBzUGt6386PA06kQ3geHeJ1Xy69F3Pbn4mQ8zy0GYiVdt8Sdo1
	MpQNngOLN8PJbIf3sSztn2xntWt7gIORy1CmzuQcRIRbHOYwl98LmMzGJaokQyz84uWuXEkYibcL7
	83HiqBtphB8eaifIBXhtQKvR8+XuHHCutTx8xCW69z4Mm3zXDk1qTa3PuTEDEbmN8V/vPNjNGPofa
	88RpSgAw==;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClv-000000073zl-45tD
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:59 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22401f4d35aso50707715ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988422; x=1742593222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxaplZUgROh7QEyvXgaGSGBpfUL9KoHoiOWsJ+5Erjg=;
        b=kJY0ZdLdnSB6hkf82M5tcaaSbAqEuHIzeB+iaysiTyScuiXocTJKO9fMdl306BmO4L
         ft+ulAfzXOQtDylRjfEXuT9Cm+/qG/IEwrX2KG1r6K4tVq/MYDgynkCO1eb4BI4ic74i
         UYUirJCQ2cMRxLcB3ExqA6i/OWrbUkzc+52XbcFxjF0K+ku9RQa0Cu19KCtjVXIiUNFI
         hbCRLN4CyYw2Fb2L3xQso/gO7WHQCR/3OAwoyfsbUFLJzWtZm4UFPuNAqjbqHVpu+F3K
         GTOxrrG8T7e3xVrRHEzq0PSCCleq5xlo/ooss1CuOSuFIfMkTGbeVXWaNS+yVCQ3dgbv
         rEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988422; x=1742593222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxaplZUgROh7QEyvXgaGSGBpfUL9KoHoiOWsJ+5Erjg=;
        b=UCcb++U0S9TLOEcPlQB9pdPdj+u/rG3bxXEbiFDRM9FXm4zgsfpEWsetQZ0c+32PLj
         CoGi9BGVRnKXSVEdH644K/JY/9suFEiEGDYHoheDwZNOc/aVGJe4xaB2ZpkSHFBZRq1O
         w0YOjzQPQM8he0eCFJF17AahDvacqitgh6KKwjrqXXO5XVhNwKG2l1+8EP9xF29um8RT
         V4V1nvRpYCE833sjcpl0b7ld3eHOJW7WYCfXEiKWXPiH5JKwbNH+VaZLQFyrm8wblZ1c
         xgPih1RAsiXLio1BZowLFfJPzvli6Z1MOKZ+lFWeQi0iXiUFnqNXWpxmk4iOand6fukU
         ZyMA==
X-Forwarded-Encrypted: i=1; AJvYcCWWKfeyoB7ieZElMMF608uV6vHtKZlB5/12Tic6WxWeEz/bhgh1A2gZ2O+9cFs6x9txjWSZbIAYbf3xOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3AChAbbiBY7F4Rgmn1XH9JfVBgHNY29RAVpV40Hx4983Fc8vS
	4+9LgTSqkB5VcU7F84bCNYB+Mgy8FX0tEOa0vzXAdXe6cjryPOjVpwvJMWr8ARw=
X-Gm-Gg: ASbGncve6bGmsTWVf12XTx0Ant82KXFMxutR8BKTGvycHhEYbUHdYJqSRA/kYGCf1QT
	pRh1mUr2hQUVW/M+n047mA3J1XKYINAfOZaUH/TR1oBbJ+G3jr0HV3+qYl0zUAlyv5EPlFAqpez
	ahGgLfyols8Mp7KPauM42z96zUYhJ1AYUOMQf7m6Olxr+g8nquX1kYLbtC/6moSm5xbDyAazGlU
	UpaDb3M9EkuwZo7LpT09n8BdMyb/cKyG2HP7S9+y98cZ5l8bKVzfFZeJTt8tBmw4nEfDa0rEumH
	DWpU8FqYCw7Jg8wO7Gevmh17ZbZ1XY6xKN2LsW/CsYD+1kps/UMkW0I=
X-Google-Smtp-Source: AGHT+IFnWo7zLhMGwvu4KurXEf7kIkAyH1HMaWOYapOqu0jjJNCjRbXuH7ozNEXPbffeeQud8LolDg==
X-Received: by 2002:a17:902:fc84:b0:223:fb3a:8647 with SMTP id d9443c01a7336-225e0aee9c6mr56406685ad.41.1741988422612;
        Fri, 14 Mar 2025 14:40:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:22 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:40 -0700
Subject: [PATCH v12 21/28] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-21-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214053_158570_1E67FDE0 
X-CRM114-Status: UNSURE (   9.39  )
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
QklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
