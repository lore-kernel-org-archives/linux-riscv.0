Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D54AC35FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMOrut6R4TAN79yO8IxtUtFdOzZL3mTEbv1n5iblEg8=; b=T8rF2b080mxSWh
	gr6BUP0/UR8s8WzyC4HxwqeD8tab+t/YuqmDqPCoKLfLdKO++yTFxz82bS5mrQNX2VRcTpv0KvbiC
	QPzi99nYPoENW1Hks93gtprFN5hOObrAfdPu4/oTpuJwghW9C/n0CE3HbGwTJqKtVbc/0AyBDm7cm
	rfgU+9kwWU1dPNkXwF2+ugNMi1K6zvwEYLYjC7aTTK0y6rjgXAdBB4Vm2Y6O3sbIn+BuU8JoktI5f
	y8lKgUe3pw5ZsDa7cV3SrohYUtiVGc55HoyCu1Ch1PMP44PUaOHsCVkoDsgBgd+HuUTVAWASuN2kK
	lCFpFHC4uOwrWDtfjmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfHD-00000003DqZ-0MVb;
	Mon, 10 Mar 2025 15:42:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVO-000000031s8-0sF6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224191d92e4so73633065ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618402; x=1742223202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=DsyrYStd93Bm9fXzqKzktO2N/MRaifOTsv3qWLjFEsYc49xAmM7/F8NBYeq5V6uKIF
         qJGmZgnnfcH8UtT2+AJtJdQ0zwW9396//oNEbcYsJ+SaQ1j2fPPX7VGD5RsigmlT/so0
         KhFmTk1dpsVwJ7R21FYZ+UgfjETJLdlPpJb48+af4R74okMNQLqn1bQduDMMMTMi39UU
         VFaxj+K5o3rYoQu5CP/o3idvHuiUTcQjiwFOU4wABpGv6vHvRwf/gG8wWb2qlMYiKen1
         JcfpXNS6WpQ5WLN6kz5PRkzOvdWSpOX27VfSRPVgNcaURO5B4pz/J+8PDO0ntjl4L91s
         YzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618402; x=1742223202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uI84SXblQRDID2BHNWhhHsRc7xVUDdoiei4kS9c/0=;
        b=NnolckCqL2U8srGZTXiBPZyuV4GtRZxxzd+z9c77Ouytx+i7w+4RmYwnttFUBXoYaY
         c4rXOxMfXEvLpENu2iMv2B73r8vJqkWgyf0kVAElt6sZTXHlS59y2vVQKBZu5kTKlFiv
         sVZYmu8UAynt8W2aXqU9yH6EMxAGd/r6k3GEWzIOHiSGXIyanamleIuzP0QGzDFovsaL
         ZPAQeZw+kxIJxdsgSXGVlbPzfocxhuI9XSKFOeVaXyzWrdt9NlQfS5FSbzjnC7UGHqMz
         5Wo1dcFen5KLTEuHnZ2uBC2ESumKBZ/GcS3lCbp51y29G5+mIGbeQKBjiCeI8Ms3J0G4
         ZsLA==
X-Forwarded-Encrypted: i=1; AJvYcCXfTT8RYUkwxgS77DOYkmgU0Pf9+r2VpiBvka2IOr9WTbP+a9VL09VbFtZRMLpo5WV/yZW5r/GIo/ZAbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEFmgF9OmGdJ0AfEJlt2E4TIn9TZbV9RI7qWNTGGhs5K52YEs
	Se2m7xtMp/weGjhc5R2QqqTvdAURDD32Hmp9iPPtKzLG8e1+69XZC93+dMPMtQ0=
X-Gm-Gg: ASbGncsPcW62M7Mc74He8pdPOjGM4Y5Wv00yfpE+pwhdEfha++OBaunXTFKwZ0f/5e7
	/M3Dq+2D6bR+BRRx1Spjvvt0qVw7KSILdMyAWpYrFXMOPXN+vLW/lz1hjjsxisLVSE6u6WG/5Pe
	rfHUkxKkjLBiBOgktRDH9fGiQmlnltcCEkXZwXJHFsxh9z7QiLBCph1CaETtkwGBzRO1SlUX6z7
	EARjBR+1XqOrj1hyuGWWdq/t1BaeWU33TiChvQi3PP7udWqCI0+zkl9ZS+oSFV6DLdMpRkNcCfU
	Nu39WH/QI7mr25cIKtAMDM6T9H/3KgqGHDc16swY4ftFt1ZHkOcSWFA=
X-Google-Smtp-Source: AGHT+IFjDwjQ9fbG75ByIkC5Z62BpsOlmfgaoy0NDr7CGAoT4eOeNPAoaYep0Q4HRAItC/SdOQSQyA==
X-Received: by 2002:a05:6a00:4b4a:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-736aaab75e8mr18259867b3a.15.1741618401679;
        Mon, 10 Mar 2025 07:53:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:21 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:42 -0700
Subject: [PATCH v11 20/27] riscv: Add Firmware Feature SBI extensions
 definitions
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-20-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_075322_290018_59D329B7 
X-CRM114-Status: GOOD (  10.01  )
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
L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggM2QyNTA4
MjQxNzhiLi4yM2JmYjI1NGUzZjQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBA
QCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VY
VF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRf
RldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBs
aWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4
MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDMxIEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUg
ewogCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWChfX2kpCQkoKF9fcmlzY3ZfeGxlbiAv
IDgpICogKF9faSkpCiAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9MQVNUCQkzMQorLyog
U0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJ
X0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVt
IHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0g
MHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NU
QUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9Q
VEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NSwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQkoMSA8PCAzMSkKKyNkZWZpbmUg
U0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCSgxIDw8IDMwKQorCisjZGVmaW5lIFNCSV9G
V0ZUX1NFVF9GTEFHX0xPQ0sJCQkoMSA8PCAwKQogCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxk
cyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCgotLSAKMi4zNC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
