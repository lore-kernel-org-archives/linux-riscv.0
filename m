Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BBDC04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcWzbko5etKI/gj6JSy/DihJjl91r5gUiHLnbmnLo1E=; b=sFM/9vspbrp8PN
	HSFPICtpe4j8yC8kJ6xinw6rlQMHEWv5RB0yV4ImFDp4QWDmWQRUEFPNsXKaqFvHfUMWknmNv5c2g
	D4EhfccQGnB7k7CvHXoDTV7WsFazeMtKegIw9ar5bJUDO7/WYkY3yu+4eGiI8vqFYQ6ftn0E63Mes
	DwObz7fWAqvdkVpFm0DO5i1Zt4/17BH4U1OySTUB1d2+J1nr10OOVtoaPLZ0b/losRxn8oMYK1byC
	/iyDCZzaaClfxgCasUD9d7vXtAFsb6HIT/lviQTql1ACobnYGqhxfHiigTsR/aKmR/tYWcOMwFxsM
	qmU7H1g7c1BGdWPIT+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwoke-0000000Daeg-15Jo;
	Tue, 16 Apr 2024 19:45:56 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnP-0000000DMBn-3cxP
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ed2170d89fso32288b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293083; x=1713897883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1oS0ksNazYXtVOBgFTjTYlhVVLdg1h0owq7BrHVbdc=;
        b=C8kDdGE05ZqTaZGqoNdw7k9065ai7DSfMuLwVqQkdJq8I0Am0yY6PJYYBj8RcoBTR7
         o/sQEKXn9NB6BYaZxwxXzAqUOeWxKVGwgsitlYvtxXICiv2umnIEpgZTQS96j+v3j6Q7
         PuqI3qoZp5/i4T8ReI4wTmOoV/igww943KBNH8OsUb3f9Kax14N+tidvOz87Q0UyEB11
         Sv4uCIN9cLeHwHjai2RRjd8rN8IE0i18cgs7agQkKUwJhTxWAkNDy/qjNgNSCQZw8ZhF
         5Zxh0723eLxihNZoNtPG27q0+T0vQp0UBH7hGK+KHgm/QjaDfXT9gEn6Ml70yvXSssfZ
         XCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293083; x=1713897883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1oS0ksNazYXtVOBgFTjTYlhVVLdg1h0owq7BrHVbdc=;
        b=hZ2IkUYYe2AfTZwcjMX8ZftwDguM7vTInaqsTG2q+wjWiWK3F7l6t1S02/NMhYxiS6
         f941U2nk9Jid0NPvQcA32pzxsnCBu+1MXmQWzeOMdoGBrm6+JsOenkzYhlwmcyMC/aR3
         5mOKko7gxgWwiKf5wZ2MPdfqIX11JErSaQbfLvEIwHZ2VsQTduQg+hZga5bhvQuy2LaX
         ifJoNJUyYz7PvrAWQBK+Xr0AxCi8bXSB9xDlGeOj7AnXdqQ0abKH4v9jHZSBTzhs4G+W
         x+UhVCRfC42KGncUd649eIInb6X7njimaC6DYXZ1chy/TTJFRqrcI5gttCqJjvciBakl
         wfiw==
X-Forwarded-Encrypted: i=1; AJvYcCXKuEouWlR4XE3201KC4x8pQ79AbuAeyJLgyA+JnS1sGqvin6eKhR4PQbnBhP9GZIELFsZiVcM/pADjWLjuUg93arAhU6aJm/ORdgR1yHD2
X-Gm-Message-State: AOJu0YxJ1T9Q2zfGuigs5X0Mvem0f9ZD4AGoIbgUgIrYTH5xdii21qUQ
	ZF2DQ8L5Zs4z5ySgEOQ/VmfnXWsgqkx8q2BQSHncN88f2x+vQ9uDyC94lvqta4o=
X-Google-Smtp-Source: AGHT+IFCEO++RSNi2s4BPgY/cFtIWMTnHZE2PMfQmZHO7SJaFE1gAV8eT+53+kwpYpGgaU41aAh/DA==
X-Received: by 2002:a17:90a:7c06:b0:2a2:7494:15df with SMTP id v6-20020a17090a7c0600b002a2749415dfmr4080891pjf.9.1713293082701;
        Tue, 16 Apr 2024 11:44:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 01/24] RISC-V: Fix the typo in Scountovf CSR name
Date: Tue, 16 Apr 2024 11:43:58 -0700
Message-Id: <20240416184421.3693802-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114444_201368_F7C86727 
X-CRM114-Status: GOOD (  10.98  )
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

VGhlIGNvdW50ZXIgb3ZlcmZsb3cgQ1NSIG5hbWUgaXMgInNjb3VudG92ZiIgbm90ICJzc2NvdW50
b3ZmIi4KCkZpeCB0aGUgY3NyIG5hbWUuCgpGaXhlczogNDkwNWVjMmZiN2U2ICgiUklTQy1WOiBB
ZGQgc3Njb2ZwbWYgZXh0ZW5zaW9uIHN1cHBvcnQiKQpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+ClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgpTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgMiArLQogZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IDI0NjhjNTU5MzNjZC4uOWQxYjA3
OTMyNzk0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTI4MSw3ICsyODEsNyBAQAogI2RlZmluZSBD
U1JfSFBNQ09VTlRFUjMwSAkweGM5ZQogI2RlZmluZSBDU1JfSFBNQ09VTlRFUjMxSAkweGM5Zgog
Ci0jZGVmaW5lIENTUl9TU0NPVU5UT1ZGCQkweGRhMAorI2RlZmluZSBDU1JfU0NPVU5UT1ZGCQkw
eGRhMAogCiAjZGVmaW5lIENTUl9TU1RBVFVTCQkweDEwMAogI2RlZmluZSBDU1JfU0lFCQkJMHgx
MDQKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jCmluZGV4IDhjYmU2ZTVmOWMzOS4uM2U0NGQyZmI4YmY4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCisrKyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKQEAgLTI3LDcgKzI3LDcgQEAKIAogI2RlZmluZSBBTFRfU0JJX1BNVV9P
VkVSRkxPVyhfX292bCkJCQkJCVwKIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRV8yKAkJCQkJCVwK
LQkiY3NyciAlMCwgIiBfX3N0cmluZ2lmeShDU1JfU1NDT1VOVE9WRiksCQkJXAorCSJjc3JyICUw
LCAiIF9fc3RyaW5naWZ5KENTUl9TQ09VTlRPVkYpLAkJCQlcCiAJImNzcnIgJTAsICIgX19zdHJp
bmdpZnkoVEhFQURfQzlYWF9DU1JfU0NPVU5URVJPRiksCQlcCiAJCVRIRUFEX1ZFTkRPUl9JRCwg
RVJSQVRBX1RIRUFEX1BNVSwJCQlcCiAJCUNPTkZJR19FUlJBVEFfVEhFQURfUE1VLAkJCQlcCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
