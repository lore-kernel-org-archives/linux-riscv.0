Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91846D3ABF6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XsC2hdzpCi0zyhtEA5stFXmWpF/SIAnN1IrYe8NOMw=; b=1jZ8bprSM+G4nE
	7KaK09Zi6i2AD3Fk//gJvGxuL2G/bXhVHjDUxPYN1LpgXsl1eEUcMc4f91QqkujYK8qSUNIsrFCPp
	AUXAxAbQU0IifYgN/4NChIOCaFB6+CKZQkrHndytNQl2Z4P7H14wD89QWolYuRMZsvCEZzGX5isqV
	YhrcwyK9Rrk5vqo6M/c+73SQ0tKeADbx1V/qR30DFxbr7i4B6PE10YxyJ+gbcM1qXGP6NmTOQE+S4
	wWyzkU+iYiMsGg0Z6oETUj1VijG6umU5TujgC6lxH0aaubaQtnPavQTT4pMniSjlLa08rwSSdx1XH
	9fzpr3f30lE9aege+3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbco-00000001Jgm-2klN;
	Mon, 11 Nov 2024 21:07:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbR3-00000001GIS-3WGr
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:59 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so3969661a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358497; x=1731963297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=cUPSR/6e9aGDyutLG6dYLqLy3FkaQ4MvXaC1wBvJK5yZ8T8T5aOG08lTZuaHZljm/5
         MkNKdGv4FCudMVyq4Y10V4fp8VXcmgm4LfFA9lVtVz1Ikqqqz2JiiUspugcMWZnAPk8Z
         +8BIr1DwnGHzDkoIAAim6sqUzA1httqjdFP1b2d7j9Y6FI1S2i5T8QyEsiFR0X0XutdX
         v1oaGjNauV66/2o3PYKQlV0ubPrYomLaplHgpO8cdQaIabWLv18NB09e0KdowZO0u7Qm
         4oSQkLOtYLEME2QD9iHiIxNpWhn9CzXFdkZm0HlonMuleqLsS2r/fm7oN/d3jNqLwo8Z
         IxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358497; x=1731963297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=gKt/Y2B8ftKgWf1TEC35yrsuNog6gkXESeSiRJnHiUHm5Fd8FBeHWZzEgrsiQavkeR
         xsYu4bzKlDvkAEzJ8NKhpFOLlOSRinXdguxc8dcB0rwyveBVysOy3QFQA12R6doIlgK2
         bmwGM0zVDSibm8DGdhjYApzV3vEQkxkt5QcwJxTu+jDx8TJIonJAJPmLpALU1UihekRz
         Lbn0jO1/OcG6ksK8RGiV1jTp+DwZ4RYy1/GQhtA9H/IsVHnq6oM3KmNQigM+TkziF3Ih
         bD6C0coda/auzkWgpDahDGwfFEYW+RRxdC/odRHdL9cBqNueiwa92TIP29gc3NbRmF/j
         gexw==
X-Forwarded-Encrypted: i=1; AJvYcCVMwOlnyXWAX92m7EUo9QColZyw5pvgb1kmA6Cz9giOsPtJIoN6kTdMJzc/501KMuhsDKkXyTnJPTcv4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ3PBnULWFvtl0n9/cuhjrYCKeHtuhBLK2RPBKXqSzYki12lZo
	k4UIOrndD8YB/E9JLzRhmmsdwwwDUmXmR72kGUiRbiXDDjD+ws45Wk+PgwW14tY=
X-Google-Smtp-Source: AGHT+IEEKaEBcK4MgBqd/tJtgjOiUzsMic6zpl+RlG/WSuE/W94Zyl8KoJt+g6fHJT4sQqdqWl8Dag==
X-Received: by 2002:a17:90a:d88d:b0:2cb:5aaf:c12e with SMTP id 98e67ed59e1d1-2e9b1788b6amr17044135a91.37.1731358497234;
        Mon, 11 Nov 2024 12:54:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:56 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:54:08 -0800
Subject: [PATCH v8 23/29] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-23-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_125457_984864_8F14A180 
X-CRM114-Status: GOOD (  10.81  )
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
