Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD8ECF0434
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XsC2hdzpCi0zyhtEA5stFXmWpF/SIAnN1IrYe8NOMw=; b=SU3X/tMfm9k0m3
	9J82Wrge+CllCiGHIkcg+JjPnKOD0XJJ3zNKqbyd+Aqge4MdJtZmN5pSefCUHa3KLknPAknbwlzQY
	anRwC/4WB9pJaFbIiA/Hq/8RPANPCQ0Cr09OhMTiu/xgfNAhgT1HwJckbqkgRvLNorrxxqX74IpS9
	JP83CRs/110zEsA7tGXxkrzrOa9wW+AutsvO8xa2gAYJzYMZjmf+aZ50vb7DOnFn0yXzUqG5phv82
	+iFz2wSQxJVwMKAlTPSATrT7LnzjHeGr8/n003iWtOsME+wqV/faHqz/CMMHnjukydlddPqBr/Xyt
	TleKSXcEo2GOHnVJVh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtl-00000007SIW-3aHP;
	Tue, 08 Oct 2024 23:45:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrI-00000007JLz-18Ss
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=; b=nmm58Hfj5536+ae28eTFfCjaNI
	sa0aEY2vUlV3+EufLS92jd4PBb3ENR+V1yrxJme0ON8qDodI7wMdbaGdBIHlJhmO3IWE458KE4Zqa
	y/ZWoMVh5hiA1P4XIxtD4/DzCxBBG3/vZAlm6Dj9bvR3w9vj2d8O3lRP94AeN1g0FCjSmp16AjYtU
	XeKW1KGFqWui8JPJyJpyfu4vP7+S9guw1rUj3ZZh1I6qDLUs35n0MMDW5kb+0sOF7wX4SMx4goLaK
	ySolGhT67RLEyBMCYhUHu8hNfvd8uHl2YHbknwVyUiiO47RfDi0ch7tk/RU3LjSAtaN57rKg1sPw8
	NLBotb/g==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrD-00000004hib-20rz
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:10 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4005898a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427143; x=1729031943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=jn53TmrSeYrduOCaV35RNqaZLVnOGFxrov1NMPSDz19NXX8k54HeFNijC/q+mIjZ/Q
         fh05D5Z6jE315LTZpn6Sa/C5MkyLZNifbVvubQfMaHZzpP1YLnKg+INDwxh86a6T4ma6
         tL6hTIL4Ktrqx4GqTC1bZ5HEoEkx+sBR3N5JkDcchiOF+suq5nvWZmaXp/9PIcKz4IJk
         4Y+E6V+k1CUWZlUGVdmCpwILgHm6MVCE/ZPHRP3fgmkbg78eSKN3jGlawKd7WypLnGU5
         gTLpWfd3BsPqkmUAtjUyJjZ9y4uBVOcO+uVFAdX7xLo6l7n5dbEfZJTrGHRDZkq9yLJI
         Lhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427143; x=1729031943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hq3DaQ4YpzTwJN9yZW6Sl3gPyL1m035+b/05XFtk9T8=;
        b=k3pLDnN1fJ9eDdT2MW7e6Lg54Umg8bTbZPBrWf4GS8RplGW3lM2bEofoA3DZtoSDgB
         xJv+kkwgoibskLLM9xyRmgj6pHkhId1lkpumEob2wRY7lUl7DUWpyjz+ykiLcFD16bOy
         9p1h7OnLzaVeepBPmnJyOMelEwXMUjjtJSYz/F9YX+t37cCbK1vvYOn/mQ2WG0Xx3Ns8
         DT/4dt5HmK7oiSxFNKI1tT/CwFnG10y5PyAcaDSN1B7QkSa/2hhBdRHTL1lfWtQjqVQG
         +mN3dCPTx++7WR8TjjbnwTpdW7aeahweNrWLiJccFhI337wKLCbjRuA2bgkw8e3GKtEp
         rjgw==
X-Forwarded-Encrypted: i=1; AJvYcCWLTOEVJbUa2MMg57xLf0BKyQYkENgRnxVZApxI21isBpH+A7adYjfwKHERJUZJuUE3eqEwNGVhU9JmxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7RD3DqzQCbrzrHIOwH9Tg25RKw6DT50t4zKMwZ4TGk4vUSmO5
	ghsTs92q61wWhf3AaR+pwvzoDlaAU8Gka2OVtdG8XWl5Amy9K8ubJqrRgoF0Wzg=
X-Google-Smtp-Source: AGHT+IHPfRT151eXbUVtRylXwb5fgy4YgXEg3lvahlH6Tqn3Wx4wYmo7An3u+lQTNTEkhVfnPF9JZw==
X-Received: by 2002:a05:6a21:3511:b0:1cf:3c60:b8dc with SMTP id adf61e73a8af0-1d8a3c4b957mr670691637.34.1728427142989;
        Tue, 08 Oct 2024 15:39:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:39:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:09 -0700
Subject: [PATCH v6 27/33] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-27-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233907_801682_43629BFD 
X-CRM114-Status: GOOD (  11.18  )
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
