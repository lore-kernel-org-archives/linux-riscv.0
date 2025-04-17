Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CEEC369CF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kppsqxsp/y67gEBkQObO53mQ5kam5g3H18Gtr4/bO84=; b=pM1eKM77utcdy8
	KYiW8ZKVoymE17T3JirqDmR0wm7uyfJOKxX6bSkBWExPVjlTLPnfYYfxlV6gnyF8Zjs4zJm0aSJxH
	0zS8bcsl7LaMIBehJRTn8vnEpBSihWEQBijJE5YIfUwfh7EybL0aX9bK39J0DcL+cpnHGYaglDeHG
	KuPs/OGfcw+znvfhhUcDMgOpm6jBnjn+JnkKqfnYAP+TFjKDDpH1a+iBhTOD6F+syCt/6k9SUShPn
	H+KY+H6pABXpsXZKC5pXLp+rIsImNkXmMnMloAmMHBDkC7OC4SVDn4oYDuwukkDKooJDhFbJsWcKZ
	UuWwQL/UhvTRDzw8maJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTO-0000000Cz08-1Gkl;
	Thu, 17 Apr 2025 12:36:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OHp-0000000CvJz-3Txy
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224171d6826so10597815ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892649; x=1745497449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=cI6MhCBi5g9l/u7ScbBLWJb7Y67fVFlaiAsDYEwAmur8j2PKjOISSCop1/K2Gbv87n
         M0JR3fEy/E5lBOepw/VcIoTSoBpkxcMvUbX3cRh7AIJWsWXboCGGhv9l2ICHFnW2azOY
         J3yNGnz7IE8wo4FK9Dyyi0Rk7ncKQ0C3PuZjCoo8dnn3yALBJ+VD/Cgm/qGTMVgvPQfV
         myrSPdDWs6OPWmgUZKMZXDHyiYqfsXMwPbGYmyKD9xMi5LCCIwhyq3/UyS52kf6zyKje
         xtfi1qYHE46GgflmFI6qxndzANqG8Fi1jnojt69OQgSfY8GcioH46FpAcS3ar94vxIOx
         tyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892649; x=1745497449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=LMBACDS/DWxi5eicuCNHCAg3/TY5Jx7xXmbR9uDvE7cCfPAHXdXEHr7gFjepzqdp92
         C5chmg0vlCw9Er6hFmUYAnQm8OdgM1b9Y95TqHFSG6vdGGu77OrPA0AC5R2Pv+n7fMFG
         XvYFV0XqDUnnHMj82DVVuJGUnOV8thiWEMlSYg/L0EfIWwKDEXADDQXJzU7sSlAoT8vG
         4T4hH8+l/dVqNodaXmfawVKQb9/6lOGOozc3uCT229S69jAPzd7Whxxw9PEYdGUbmPdv
         fustdtw5obzyYvZLEIObHV3ent3ts9FqZHXTj6H4MkEuC7A8XMonpaVZnn3MA+iGOQDB
         +ZIA==
X-Forwarded-Encrypted: i=1; AJvYcCWCv3ekNsVkJo4LgirJLTyRdMLj+r/HtSuAG03uvbYydpIkzMAgDesHK6H/kxmz6XB+m3JVdNuroL1haA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrpc/f30QGLRsYVOVK8jCrM2c6RqBnADevGVwWUJgLSdr6p+b9
	ztr4Jj2cusHWq8Y9blqibElLB9dyGk2rXdKhhKvlbJXFrKKQ9LZH0cdURBrIC70=
X-Gm-Gg: ASbGncvZve7pR2YJu4j417OF0NT95LNzPGLS7rBSFpBc4MhO6cmtY923h06C2Hpw9Ja
	YBFJqeZ5s5Gdl93SQKKdo/Ohq5SzWSMy54mX/Yn4ztOEVHDOAG/sodj0EXWO/mD/Zu8RIlc8eFb
	2Q4XxU3bVfVsT615RptTMwPIFCBiYZ60cbusEPJA1kc6e/Iml4lYAY+GTHuQwTBREo3RZLrTtI/
	ziYpEa1bOWiDWJ4mzaLufdfCM7KNwBelcph77CXh2mzEvAUHwZ+J6+Lb3lZijs5C9n5xCFuL4cs
	ulEmQgwXJuPhPaKQxLEHmC9kAlfzM1g2/9dv1umCoQ==
X-Google-Smtp-Source: AGHT+IFVHOWJJRAXEzH6mdZNYusO/nzJmHfPymZgz+gveEEgUfllUOzI6Ji7vwcW5uJ8Q3EqmqJGfw==
X-Received: by 2002:a17:902:e542:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22c358c542fmr78901385ad.2.1744892648939;
        Thu, 17 Apr 2025 05:24:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 01/13] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 17 Apr 2025 14:19:48 +0200
Message-ID: <20250417122337.547969-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052409_866066_BEEE5B3C 
X-CRM114-Status: UNSURE (   8.72  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCmluZGV4IDNkMjUwODI0MTc4Yi4uYmIwNzdkMGM5MTJmIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
QEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX0RCQ04gPSAweDQ0
NDI0MzRFLAogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEsCiAJU0JJX0VYVF9OQUNMID0gMHg0RTQx
NDM0QywKKwlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCiAJLyogRXhwZXJpbWVudGFscyBl
eHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklN
RU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNDAyLDYgKzQwMywzMyBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9YKF9faSkJCSgo
X19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1fU1JFVF9Y
X0xBU1QJCTMxCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5zaW9u
ICovCisjZGVmaW5lIFNCSV9FWFRfRldGVF9TRVQJCTB4MAorI2RlZmluZSBTQklfRVhUX0ZXRlRf
R0VUCQkweDEKKworZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgeworCVNCSV9GV0ZUX01JU0FMSUdO
RURfRVhDX0RFTEVHCQk9IDB4MCwKKwlTQklfRldGVF9MQU5ESU5HX1BBRAkJCT0gMHgxLAorCVNC
SV9GV0ZUX1NIQURPV19TVEFDSwkJCT0gMHgyLAorCVNCSV9GV0ZUX0RPVUJMRV9UUkFQCQkJPSAw
eDMsCisJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9IDB4NCwKKwlTQklfRldGVF9QT0lO
VEVSX01BU0tJTkdfUE1MRU4JCT0gMHg1LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX1NUQVJU
CQk9IDB4NiwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKKwlT
QklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAwLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VS
VkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORAkJ
PSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAw
MDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhmZmZmZmZmZiwKK307CisK
KyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCUJJVCgzMCkKKyNkZWZpbmUg
U0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUCQlCSVQoMzEpCisKKyNkZWZpbmUgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSwkJCUJJVCgwKQorCiAvKiBTQkkgc3BlYyB2ZXJzaW9uIGZpZWxkcyAqLwog
I2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAjZGVmaW5lIFNCSV9TUEVDX1ZF
UlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBzYmlfZXh0X25h
Y2xfZmVhdHVyZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVEIC03CiAjZGVmaW5l
IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04CiAjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU0JLTkK
KyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAorI2RlZmluZSBTQklfRVJSX0JBRF9S
QU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQktMTIKKyNkZWZpbmUgU0JJX0VSUl9J
TwkJLTEzCisjZGVmaW5lIFNCSV9FUlJfREVOSUVEX0xPQ0tFRAktMTQKIAogZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBzYmlyZXQgewotLSAKMi40OS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
