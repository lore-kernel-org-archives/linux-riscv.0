Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92195CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7n7Oq7PW4rG3o9D7C21nZwqMjgNR6cQXHsQJ0628Yg=; b=xUDDHlDDEnfk6Y
	h8gJYDe3Wv6oWzW/FfBej6f9fz9AKzJib+6u3CPBPBasoLwJfYhlX93vsbmBIr7e8f76PdMw0v/Dw
	Ot7G8rhiA1HLigZg3e1xtjTxeFofoOZ1HPuNQRa70FJ8UHX5YIH530JAlsXyN9Mvx9tUNFtPaZSu+
	97nOzmGfVudBi3xldUHjig0tjkC4pVQxYh1mXnKqv3J3OR/cf+U8gdA807uDtfUM6X3NmlfsPsWFO
	8ZOJ6HuE6bG2AVMxd5Znl2QW4KkdCzNBqZDtq3AKq2EvNiYQRzoLHXue+BD3CBcT1BBoIBMWf3180
	X2HZs0Eg5Pgkr3NzKTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQf-00000002C74-1EVi;
	Thu, 04 Apr 2024 10:34:45 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQb-00000002BuN-1nDP
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:43 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-516ced2f94cso84536e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226868; x=1712831668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=BruO5Go/rEfnmekZ3Nx8dhjJNvY1Aicxb8VXkPM2SXKmCLjFea7Jb9JmKUg5Nof5wx
         435Q1pOfdbDBlyzXRRCr3DIiweKzXNYEvynL6NUir/fFdWkQqLapIN788nS+/AosYHeA
         dsPoLSClMUS90rrHxMRN2VtRyoSJIGKikDT1ZE/wzXA1cPGb48rUnUkeaZ8/tFTDCcLC
         3FROf9qiFx9b2B7O3fnbWwY//L0ytfBUsZB5hqCH8OM0z1H1LBlK+MYd54GdCLe8ytsN
         UBPKPIa7rMPx9BygirmM4IBOjibZDR7yqUei6cfjduQbHZDfXOhACjiVU+D/JyNItcH9
         r3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226868; x=1712831668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=BAOLCHUdiYfu4iCh5aSFDiQXQp0Ld7JM1aW048LwSY+ylEmaglP4HKfDAzepGEwEYO
         JjF217fSDO/+3fi/iMqfpXqllvmFQxsWqnYPgrf5t61AAGpdoBWd/5EXcIw9aztrn+dC
         jMzh0afE4H9ZqOka1Gc5TKMLLbScBJYl5FuP+1HJFLMLut6FpBqRCnXfN44Iat6dutRQ
         LHYV6bLNaeseVeD/DpfhfqqSsyx1/C33jeT4rjiVqrMizlnUCZ/nszMH1J2LPsVvRsyG
         qCG705j8PuPRIyIM8aZVmcBrVn/IiW5h49iLcPUNAy0jYTFAgJF5gJcc1SXAON/fa1/J
         Tbxg==
X-Forwarded-Encrypted: i=1; AJvYcCURpgYKOOgn8iwKVaeCwEL0xH7FpUzM3fj6d1OFEo6oe/tEyHY4IRj15iIEFfhSh84RmY1tSc42yjI0ReCO3Tvf+VoaR5KuvRYNOuMctYnU
X-Gm-Message-State: AOJu0YyuwTwew8bcn7vou/LU3ZnhBHtWSQq7DRzGmu2uC1n9KEcLtg8V
	VKVpg/f16Oc8piyXF6Og3WQ9ILwPqTX6dwtUU4WgGMhYkuyPG8Idcaccsaep1R4=
X-Google-Smtp-Source: AGHT+IFMam9bMUHsyC4hhqDHYaIA0cA7zDlkrbsJGTyXcu6kj1HRLq2RIgLnRvRONkTw5gP+iloRaA==
X-Received: by 2002:a19:8c0c:0:b0:513:d0dd:95ef with SMTP id o12-20020a198c0c000000b00513d0dd95efmr1384037lfd.5.1712226868674;
        Thu, 04 Apr 2024 03:34:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Thu,  4 Apr 2024 12:32:51 +0200
Message-ID: <20240404103254.1752834-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033441_561664_31DF8571 
X-CRM114-Status: UNSURE (   9.28  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFppbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwppbmRleCBiODgyYjdiOWI3ODUuLjQwMTA3YmI2MTk3NSAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAt
NjcsNiArNjcsNyBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWklISU5UTlRMOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVND
Vl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6CiAJY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUhQTToKKwljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklT
Q1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJTU9QOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWktORDoKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNB
X1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pLTkU6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aS05I
OgpAQCAtNDMyLDYgKzQzMyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9p
ZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSElOVE5UTCksCiAJ
CUtWTV9JU0FfRVhUX0FSUihaSUhJTlRQQVVTRSksCiAJCUtWTV9JU0FfRVhUX0FSUihaSUhQTSks
CisJCUtWTV9JU0FfRVhUX0FSUihaSU1PUCksCiAJCUtWTV9JU0FfRVhUX0FSUihaS05EKSwKIAkJ
S1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAogCQlLVk1fSVNBX0VYVF9BUlIoWktOSCksCkBAIC05NTUs
NiArOTU3LDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6aWZlbmNlaSwgWklGRU5DRUkp
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6aWhpbnRudGwsIFpJSElOVE5UTCk7CiBLVk1f
SVNBX0VYVF9TSU1QTEVfQ09ORklHKHppaGludHBhdXNlLCBaSUhJTlRQQVVTRSk7CiBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHppaHBtLCBaSUhQTSk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHppbW9wLCBaSU1PUCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHprbmQsIFpLTkQp
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6a25lLCBaS05FKTsKIEtWTV9JU0FfRVhUX1NJ
TVBMRV9DT05GSUcoemtuaCwgWktOSCk7CkBAIC0xMDEwLDYgKzEwMTMsNyBAQCBzdHJ1Y3QgdmNw
dV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ196aWhpbnRudGwsCiAJJmNv
bmZpZ196aWhpbnRwYXVzZSwKIAkmY29uZmlnX3ppaHBtLAorCSZjb25maWdfemltb3AsCiAJJmNv
bmZpZ196a25kLAogCSZjb25maWdfemtuZSwKIAkmY29uZmlnX3prbmgsCi0tIAoyLjQzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
