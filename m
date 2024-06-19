Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00BCC2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxnTq9QYbW68rXv0l+ILbdEOukZn+aFW5QMo+jtz0s4=; b=ye33L67ATZ98Dn
	vQp6fGRYew07S7G5g7V7m1B1jMGumJLeGvj5MoEcvUGKTk/+KXBn0mptwOWA1stPgvhmuPco/F05L
	KJDagote9qu2BjwGYWFyN8BWgYlMUugFIMU0m3qcd/EU83fnV0e9iT5xz7Z+gPBCDdaXyDteF/OKI
	k4S5ynBF1EFS5bjuuJryV7WCg246bpDFEZCHRU/Y+6QJ56NEl6P8ViazPH9JG0K6RX7fRG/WzWyoV
	Cpz/0y/ht63TKRxePxGrY6PdjXVABSOkebKt2M96Mkac0ibiz2LP5RTXthLI2YhCwS9XBIJ4MYWFC
	Xu9tynvC9lhg8XzUCFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtcR-000000010fr-0Wqr;
	Wed, 19 Jun 2024 11:36:51 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtba-00000000zsx-2eBR
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:36:03 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f0d49a9ebso404614f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796956; x=1719401756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSqXY8NQ+r1tvQyzaHIZAo9j3jx7qiAIRPgNfgAmyNo=;
        b=OG8ajUhS2ASqKvvT+ps2tPNbWRba6FLwelbmVJ/rY6o0ut4b5Ruvm8at+yN2LfqT10
         K4Yi614jonJCf4H8/MtsdpUoqSjF9Q41Px1PJh4pA/0xKYuJTgJ4C8R4MzuB19UhhkIU
         OHHjFcFgvKmMFIRefavl4V0DR2XfwuaJA48e8sNSL/ybOne8eygE8EEI0W51mYPC3Qst
         IJg9wXmhtlSC9OJCrE+STy8jwHwBLnGvNXsS2A9uSaEV2sOAKZwdoBzWiAbLTqetk6Wr
         u4gk1FW0kko9GgUht0RdQOFvXeLHv4cj7vu/8CDebljdlwo4Cj8xNAC/EKtFFsMw7GkM
         V3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796956; x=1719401756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSqXY8NQ+r1tvQyzaHIZAo9j3jx7qiAIRPgNfgAmyNo=;
        b=VNTO/3uCA6O63lUltB+GWBkHRocjaGgqKV0w433ypVcvveJ/oZvFRqGDxqPMlAHvsM
         jaZwrkWmTT3Ay4K953nQzMbaQDeZVFvwVgnXB56+wJ6yi2Rv4cD5p5pqvCXxOVIRisMW
         Liiho6WUhYggVFmNkCnaJ21tKaBsgLq9yrCHPBtT+/h6OZVZ8WJtJc6aQaF+CSCvaUH9
         8H9marD7yz+ry40EfldZ4vNcsrAvwUQ/JqNpuI2ZbcwYqgFHiCQKF6eFdUyI5HxjFPOM
         6Y3awGmA+YuaEGlDhH1YueXjv49FnzaS+HRybNYa5cQDSK6P6QYGs7zMRZPdoYZgJmG4
         sucA==
X-Forwarded-Encrypted: i=1; AJvYcCUh0Uqgm08fdo8amlU/M8hdZOu4Od/KFdZ2HSVLnCjn/XOFh3KKpvbmVRu392ZjXClGlC5RQC+eGTpD7hpHj+VzScUoC22vWNDEMJnDx/wz
X-Gm-Message-State: AOJu0YxQSmipeU8jnAFql7jTaDRXO9PhanuB50Le3Aj/oTvAJuoNool/
	9CDhKM2TBLYBX1brZePVEpeCzdc7DBiuSW/EGtMywzHlb8ADQ1pUnw11iS131S0=
X-Google-Smtp-Source: AGHT+IFlfP3NiyvXQKFOTNdljGuXnZt3spfJFUH69VuncHuc4xx9gjHsoS5MasjNknxMee/w3CiUxQ==
X-Received: by 2002:a05:600c:4fc9:b0:421:bb51:d630 with SMTP id 5b1f17b1804b1-424752981b8mr15706485e9.2.1718796955960;
        Wed, 19 Jun 2024 04:35:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:54 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 13/16] riscv: add ISA extension parsing for Zcmop
Date: Wed, 19 Jun 2024 13:35:23 +0200
Message-ID: <20240619113529.676940-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043559_264176_B78B5A55 
X-CRM114-Status: UNSURE (   9.59  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApjNzMyYTRmMzlhNGMgKCJaY21vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlz
Y3YtaXNhLW1hbnVhbC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBiMTJhZTNmMjE0MWMuLjQ4ODAzMjRhMWIy
OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtOTEsNiArOTEsNyBAQAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pDQgkJODIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTgzCiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWkNGCQk4NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9QCQk4NQog
CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKaW5kZXggYWE2MzFmZTQ5YjdjLi5lYzRiZmY3YTgyN2MgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKQEAgLTM1NCw2ICszNTQsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRh
IHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURSh6Y2Is
IFJJU0NWX0lTQV9FWFRfWkNCLCByaXNjdl9leHRfemNhX2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBX1ZBTElEQVRFKHpjZCwgUklTQ1ZfSVNBX0VYVF9aQ0QsIHJpc2N2X2V4dF96Y2Rf
dmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZiwgUklTQ1ZfSVNB
X0VYVF9aQ0YsIHJpc2N2X2V4dF96Y2ZfdmFsaWRhdGUpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
X1ZBTElEQVRFKHpjbW9wLCBSSVNDVl9JU0FfRVhUX1pDTU9QLCByaXNjdl9leHRfemNhX2RlcGVu
ZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aQkIpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHpiYywgUklTQ1ZfSVNBX0VYVF9aQkMpLAotLSAKMi40NS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
