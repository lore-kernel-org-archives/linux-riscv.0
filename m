Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B41CEACF1
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XsC2hdzpCi0zyhtEA5stFXmWpF/SIAnN1IrYe8NOMw=; b=FcXwwNpxfQED/c
	C5LVBdRsibdR/mtOqQ3FKvQHcy0KEWe9WCzu+EvjE2l34lxrHqmS2A6WGac8xXHVHVuXfX3pra7T7
	Xvdd9MWifLm09/QZhsKUwuUs8io7JzcWOiM4dpBrJ/UQLqJsLmIWOQrbXFdnnfKBV54FcqtnQ0u6h
	LfQ14qMH/2/eVlr1Fz7hrpr2riZKegzwPuTCF90prTe3xzXQvPdE/2vq1TSf4MmF14o3ZHrEdOCsJ
	7NvLRNxUGp1Rzutm9HIxRdciV3c8ZwdBlftDSdarJqoXMbOegH4W6hSfb4R1tFfbG3FNI5BDSdxYy
	bo6mNe+ZLZnT1zHveoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgim-00000003fBr-1mSH;
	Tue, 01 Oct 2024 17:31:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQ4-00000003RY3-3CSZ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e07d85e956so4868780a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798892; x=1728403692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=QSNLksMULnSI6FWXU4VHywZriflVrh+QR1cwUKn/kAFl/vNs5W2XuySblF1AdOBZUZ
         16bAQvWPCJ6wmpFkdWdkEwfAiYJ/DtX/lqEtOo4fBLqAUwvFRjQjUhoFZJAjWG2Vl73n
         F0qv5o/Spw7jfcCbb8CNT5eC7fz5opH061/LgzVTAvFkiGfsI1kdk6HHZX1D8c52M3Sg
         nSVCyiHsX72zCJKA1kZWbb3oUqkDFS8GNmSjdi1/xEDQMo0TW+AKE79ToekLAVX4ISHk
         BOKUtKrNVre6Egw4mQ1NxmRxTSWPGEjrfbOCNi9CkK5b4GARXPIBXDQWsVBxQRURJeHB
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798892; x=1728403692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=bsmFBq9Lb+/VmKAPtW6GbfbUPnFP552T2St5FQV7kHuyd/7Z1YgsNwfoUwEDUS4Oig
         GcxMCHua7xdQy17TWJsQDIzi9SN8AFPkVXCixRwpiYm99q3MQd4/uhKeIuAN4pdtGAA+
         aGeVlEYtybAmKg8mFtkjPaLyvZ9LqdkfLgnW1744MmZUfPd8cFTjcgUFC3USKtaeezHK
         I+oFhGgN1vj5BIFN3iaz5S9Hn/S0b2gFW/NExg3/jK04jLB8wDjXodimsYKRGRkWtYqE
         N4ZtGYr2/Gj2RFOqPZPuiTTYNwGY/rbeUYYtaDJXbaVN7cxvfbiHpCCx8oEzX2mDSTRy
         5P3A==
X-Forwarded-Encrypted: i=1; AJvYcCWr2I+77dWo2ifewnIYvZYzVOj+FuYUWBhfunG3ggpCx1xk4GasW659so+Zo9jfiVgUd8cx1vQ5Ha1fAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwusU9bbgU0QgxI17gpCTSOGlq3cxN4fOj2UWqlHebsf62bVb9a
	UYZwiDyqZDFtmgdZARVq+apSqmWymwAgk0mLuGBm41muIV0ceRww6pkwhbPiX9A=
X-Google-Smtp-Source: AGHT+IE1mC9nGVWp9Ep/VDB2JSrhkpX0Jq7sG4mPQqlp/n+0JH5ZZvXoSkfUlTtqgO8CiZuzgQPUOQ==
X-Received: by 2002:a17:90b:264e:b0:2d8:82da:2627 with SMTP id 98e67ed59e1d1-2e1848f671bmr199013a91.27.1727798892044;
        Tue, 01 Oct 2024 09:08:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:32 -0700
Subject: [PATCH 27/33] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-27-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090812_857229_F28FABBC 
X-CRM114-Status: GOOD (  11.41  )
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
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDk4ZjYz
MWIwNTFkYi4uNzU0ZTVjZGFiZjQ2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTM0LDYgKzM0LDcg
QEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX1BNVSA9IDB4NTA0RDU1LAogCVNCSV9FWFRf
REJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKKwlTQklfRVhUX0ZX
RlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGll
IHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4
MDAwMDAwLApAQCAtMjgxLDYgKzI4MiwzMiBAQCBzdHJ1Y3Qgc2JpX3N0YV9zdHJ1Y3QgewogCiAj
ZGVmaW5lIFNCSV9TSE1FTV9ESVNBQkxFCQktMQogCisvKiBTQkkgZnVuY3Rpb24gSURzIGZvciBG
VyBmZWF0dXJlIGV4dGVuc2lvbiAqLworI2RlZmluZSBTQklfRVhUX0ZXRlRfU0VUCQkweDAKKyNk
ZWZpbmUgU0JJX0VYVF9GV0ZUX0dFVAkJMHgxCisKK2VudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IHsK
KwlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRwkJPSAweDAsCisJU0JJX0ZXRlRfTEFORElO
R19QQUQJCQk9IDB4MSwKKwlTQklfRldGVF9TSEFET1dfU1RBQ0sJCQk9IDB4MiwKKwlTQklfRldG
VF9ET1VCTEVfVFJBUAkJCT0gMHgzLAorCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORwkJPSAw
eDQsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg1LAorCVNCSV9GV0ZUX0xP
Q0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JN
X1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZXRlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4
N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAw
MCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfRU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZX
RlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFM
X1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAorfTsKKworI2RlZmluZSBTQklfRldGVF9HTE9C
QUxfRkVBVFVSRV9CSVQJCSgxIDw8IDMxKQorI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFU
VVJFX0JJVAkJKDEgPDwgMzApCisKKyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwkJCSgx
IDw8IDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVD
X1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElG
VAkyNAoKLS0gCjIuNDUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
