Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E52DC35FF8
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I24bF1jBZK4gL0Icp3TIA+AN7RxjcJNAq7eE5nUEHjI=; b=gdXxSPwTOJd/Rd
	H/E4Hi14hY6j+P0ZYyVzdAn1yEb4Vm+Mo4x8uTPFv+u0JXRUr1j0Ooyv3QgErpNTApDcctG4mEXt6
	pdcZec1b3NoM2WA+IWwexb4bT2PIovRk4KFrqiUS+fAnKMcsRC6fnH1g2K4cb1pjfcsFKNZeKa7gw
	Oo2VQY7KKefvBZacGHJpnePnOmfKmopkfDetP1be8902H0oPP24L9j+z/+rkmwA+g9PHETeLVoVZR
	Bz4R6yIixsk4J7Dx8BKUUY+Qh+r0KRa6xRq3oQGHAh4BA8PJEobeqi9xc6LAMOB9Y9UQNSEOk5V0P
	3iLDuprJWqsYNebftUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1M-00000003Usf-15ky;
	Mon, 17 Mar 2025 17:13:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwg-00000003TMO-1qSf
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso26598325e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231289; x=1742836089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMypehTPr85TSV6ycxYis0bFMGhRtQvpG8E21HWF2pk=;
        b=cDr8GA6MnokNOSmtjVhMo5htLQa8VBItcbETp512FWT985DjIdMcanjr1rZ9bHVYtQ
         TPq4QnSYloQuSpLimHrnGEzFxM8PKB6iAH69j5sjqNEEV/CTUF/mWbpAPJT5xVA6YjKb
         l9lWUDaKeVr73M8n3iG+jxYaazVxZF4DM3zRhY9eTEIZGqHT52oc+T834JqKcif++zCP
         lxkgud/h/9oEBGXVIWSan6U77CDM9Ybq5f6y3MWGBVvjGL/QRu7EWp+zh3IgKBGI592N
         KpsU7ahSRYdrKGx2iML5dK5mhkB9lW0FXcEgPkLa6ttdIBzmEg3CL2gPy5/a+QikZX+0
         ddEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231289; x=1742836089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMypehTPr85TSV6ycxYis0bFMGhRtQvpG8E21HWF2pk=;
        b=unPx6Lkbv54sDl5FatbOWPECbXGJr3Km9Q7/bjE/M/wr+u0Uq/2QjfTZdbSfSWlCZy
         QEm+ytvD6frcYtevgWTgm6dSgFuFkfK55Dxybp0EYTWCmdcAioqenA34jdca8tRGlwho
         NYWcVPGn8ZgYMOMPy5Oo9gm40oQg5/lK1jZhmHU7FuYp10Pzez6y+6B6KtFMxgaZS0EO
         djouxKRumbHbIO69ycqqw2iomNylLvrRx1PD76JZyJGEhsktxPqmM7dNtlZILJWHivyY
         7MAbZixHXROsEjIuJsTvVrb9HKnMwqL3AtetXioP/oaECPU3LvdXMWpQjcFmVich4cSr
         wwrA==
X-Forwarded-Encrypted: i=1; AJvYcCWoKArVdta9Muw5n8/rPc5JN3e6YPOHdPN30xDQgLgb/1SyOMax7DlzDQ30C73xYKOAP8t0dM4v7xxhYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbCIdRNs5D1l/M3isNfMPAEMORK5ODjg6XUjXop27ie57r0K6J
	sLqVlffWrH86TBcaqx5hq+ZAd8lmX/eFju/JbVLZIEcxHHNbAvuKCwxzwxe/xRg=
X-Gm-Gg: ASbGncsiz2ysWn3cQHnWeovQpp/36BbH/fMwnjDDqdhYR+D7AW/EyqVAKe1Z2Jr5or/
	cNjWVXdI3mdIklztJgmShScqcssNcaxgqCRErqAr/8yOJT54sLE1ZjZc+CYuyZQGUBjjX7UkqHO
	TFXroC5RcwrrQ3oehSXHlTFpSvx/ZQMA3hzGrMA/Orw4GJBaSvTxD1FAvuf4Roi7Rlif62ftDhu
	oIYIktCg+HsTUGFsQKU6GrdPkAs8C6x7F3YRWpMRNH7bu0tVewZibTNE0opLta4HcrXQvJxJf5p
	R85/vWJZHfJCMgp/iAiImwLxqiPyerMekbnToqCXyyAo7w==
X-Google-Smtp-Source: AGHT+IHUEfWy8vRElctY1RJYRY/dHWRIdTIpUq+PBDo9gX+Yv3PK1rGyecjDgc1lfv0PGC4CYGx5Ng==
X-Received: by 2002:a05:600c:1392:b0:43c:f4b3:b0ad with SMTP id 5b1f17b1804b1-43d389d441dmr5431565e9.19.1742231288764;
        Mon, 17 Mar 2025 10:08:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:08 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
Date: Mon, 17 Mar 2025 18:06:08 +0100
Message-ID: <20250317170625.1142870-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100810_480354_7B8CBEC5 
X-CRM114-Status: UNSURE (   7.36  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaAppbmRleCBiYjA3N2QwYzkxMmYuLmQxMWQyMjcxN2I0OSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCkBAIC01MzYsMTEgKzUzNiwyMCBAQCBzdGF0aWMgaW5saW5lIGludCBz
YmlfZXJyX21hcF9saW51eF9lcnJubyhpbnQgZXJyKQogCWNhc2UgU0JJX1NVQ0NFU1M6CiAJCXJl
dHVybiAwOwogCWNhc2UgU0JJX0VSUl9ERU5JRUQ6CisJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NL
RUQ6CiAJCXJldHVybiAtRVBFUk07CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06CisJY2Fz
ZSBTQklfRVJSX0lOVkFMSURfU1RBVEU6CisJY2FzZSBTQklfRVJSX0JBRF9SQU5HRToKIAkJcmV0
dXJuIC1FSU5WQUw7CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzoKIAkJcmV0dXJuIC1F
RkFVTFQ7CisJY2FzZSBTQklfRVJSX05PX1NITUVNOgorCQlyZXR1cm4gLUVOT01FTTsKKwljYXNl
IFNCSV9FUlJfVElNRU9VVDoKKwkJcmV0dXJuIC1FVElNRTsKKwljYXNlIFNCSV9FUlJfSU86CisJ
CXJldHVybiAtRUlPOwogCWNhc2UgU0JJX0VSUl9OT1RfU1VQUE9SVEVEOgogCWNhc2UgU0JJX0VS
Ul9GQUlMVVJFOgogCWRlZmF1bHQ6Ci0tIAoyLjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
