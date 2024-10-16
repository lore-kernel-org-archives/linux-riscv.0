Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92541D1AD2E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amZncS/LSZeWMHznNIh2bpgfo0CMYZA45BX3wBg0wqI=; b=20V4/MPvrAixHB
	J0UMF418mzMeu32xCbShah9vyB/WJ8YxhDpO3f2zcI7KGbJl9pBKqo/WiE9lIfYEpl0X1I6UjAObq
	ccYFSARdt+0eVbcJ8P9mbSjCX6duAvV5dO/7SbvLg+HuYL5OeKQpsNxI2U2AfntDj+j0WHgW97QeJ
	35u5O214rhygQffL7W5biDKnhWDfzbYb8t9om4Q4T1p3xq/KfC2np0IwC/5lX6sueROAmcEGQDWlh
	BPlRjTay3+0RpXxpEk3twmzRnxOS9F4AVwo8RCkvsXj4KExIqaKx5QNPo8dDwMFG/GN0APaARpnlO
	9Jl0DE7wK6UIhwcvnISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zez-0000000B5M4-0E4I;
	Wed, 16 Oct 2024 08:45:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zY8-0000000B42S-0TQH
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 08:38:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so60731555e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729067910; x=1729672710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmChZIcn3ram5DrPXLsJi2oFdsO/Sp5E7s6oakOpriw=;
        b=yzTf3DogRLzDKx8VUSSESIiV0qnecr0VZXpk3oH3LY5BWw7+fwBXD6uNqZ145oQNnU
         OFOm0pPj5hKjMuZitAUsleuw4WJfDgR2iKE5i+XiDd8iintihy6dgfHHnAPRIm1awUZh
         lWU81mhqkfsHdyzud2r6FwzwbxKwXOHJRif530oESq0SnFiN3fZQmFKl4lTg/xviI0bl
         oQRhmGsVBxsAiQCveGEow4OaRf3JZUaQ4pUk25YvHuXz1JPCwl6eFh19W5/DjKRhXDg4
         ItqX2v1AWh04fCDIuXHIa2Y7eX39BouO3ruDzAVyelgRTG1lkGOOtNhr7+sIFK80mXg1
         qJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067910; x=1729672710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmChZIcn3ram5DrPXLsJi2oFdsO/Sp5E7s6oakOpriw=;
        b=wL2oPVNnZM3WFlhZbpHUelE0m96jJX+0GPEimTkIbtOFBizRt69TSWSHKD+j+eWeES
         K0oCD8FyUbf5pI+OYEuE7OlK8okGAkd6j6cFGYENgiRlImX4hCI8j+01ORnOB683JwHb
         JOIRWhgbBWOnUGKaRsTcEQveQifYNn0PTU99mryAQFSpvEaaO3CgqWlTtGhI+49wbt83
         hm82dRU3ek7Gqr6X0Y3t7Vho7bv9hAqg378zHM0ZQE9p7HY95NWkKPn1GYYeJKitoBav
         x7WmiqHjA7MBAhuv5SgwtVe1eo+wVqoU4IuRnOPImbrxoKG5gc3msXHN1CSmuchPba7j
         I/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVfISPkBOCv2Fd+yOD5a/Am+t0hSdKWJ9FmHnkB0nrJ0Ihogh6xSwtlqtOoj0dhOaSepMB9dg0y38nRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmjeLEnlrMNXB98OCRFp+w6/DoTwIjgALGF74cFT8DCwdFKZZg
	OFfYa0L4oRb23KQTF1GcoGF33vbXBDDpaKeWVMDfYQzTilewT7Et/Z4FHQdVJYY=
X-Google-Smtp-Source: AGHT+IGR0n+c7XSqnCHxTJU2G9C304U+ZAi49P3/9N45hFLnwx6sLPhF+8rNeg2KuWiIJB7D9B4i+g==
X-Received: by 2002:a05:600c:1906:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-4314a37bb99mr28526255e9.25.1729067910135;
        Wed, 16 Oct 2024 01:38:30 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6b3c72sm42449965e9.35.2024.10.16.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:38:29 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>,
	Roman Artemev <roman.artemev@syntacore.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v3 2/2] riscv: Check that vdso does not contain any dynamic relocations
Date: Wed, 16 Oct 2024 10:36:25 +0200
Message-Id: <20241016083625.136311-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016083625.136311-1-alexghiti@rivosinc.com>
References: <20241016083625.136311-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_013832_175355_79CB5652 
X-CRM114-Status: UNSURE (   8.96  )
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

TGlrZSBvdGhlciBhcmNoaXRlY3R1cmVzLCB1c2UgdGhlIGNvbW1vbiBjbWRfdmRzb19jaGVjayB0
byBtYWtlIHN1cmUgb2YKdGhhdC4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+ClRlc3RlZC1ieTogVmxhZGltaXIgSXNhZXYgPHZsYWRpbWlyLmlzYWV2QHN5
bnRhY29yZS5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgOSArKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vTWFrZWZpbGUKaW5kZXggM2YxYzRiMmQwYjA2Li45YTFiNTU1ZTg3MzMgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9NYWtlZmlsZQpAQCAtNDUsNyArNDUsNyBAQCAkKG9iaikvdmRzby5vOiAk
KG9iaikvdmRzby5zbwogCiAjIGxpbmsgcnVsZSBmb3IgdGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0
byBiZSBmaXJzdAogJChvYmopL3Zkc28uc28uZGJnOiAkKG9iaikvdmRzby5sZHMgJChvYmotdmRz
bykgRk9SQ0UKLQkkKGNhbGwgaWZfY2hhbmdlZCx2ZHNvbGQpCisJJChjYWxsIGlmX2NoYW5nZWQs
dmRzb2xkX2FuZF9jaGVjaykKIExERkxBR1NfdmRzby5zby5kYmcgPSAtc2hhcmVkIC1zb25hbWU9
bGludXgtdmRzby5zby4xIFwKIAktLWJ1aWxkLWlkPXNoYTEgLS1oYXNoLXN0eWxlPWJvdGggLS1l
aC1mcmFtZS1oZHIKIApAQCAtNjUsNyArNjUsOCBAQCBpbmNsdWRlL2dlbmVyYXRlZC92ZHNvLW9m
ZnNldHMuaDogJChvYmopL3Zkc28uc28uZGJnIEZPUkNFCiAjIGFjdHVhbCBidWlsZCBjb21tYW5k
cwogIyBUaGUgRFNPIGltYWdlcyBhcmUgYnVpbHQgdXNpbmcgYSBzcGVjaWFsIGxpbmtlciBzY3Jp
cHQKICMgTWFrZSBzdXJlIG9ubHkgdG8gZXhwb3J0IHRoZSBpbnRlbmRlZCBfX3Zkc29feHh4IHN5
bWJvbCBvZmZzZXRzLgotcXVpZXRfY21kX3Zkc29sZCA9IFZEU09MRCAgJEAKLSAgICAgIGNtZF92
ZHNvbGQgPSAkKExEKSAkKGxkX2ZsYWdzKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pIC1vICRA
LnRtcCAmJiBcCitxdWlldF9jbWRfdmRzb2xkX2FuZF9jaGVjayA9IFZEU09MRCAgJEAKKyAgICAg
IGNtZF92ZHNvbGRfYW5kX2NoZWNrID0gJChMRCkgJChsZF9mbGFncykgLVQgJChmaWx0ZXItb3V0
IEZPUkNFLCReKSAtbyAkQC50bXAgJiYgXAogICAgICAgICAgICAgICAgICAgICQoT0JKQ09QWSkg
JChwYXRzdWJzdCAlLCAtRyBfX3Zkc29fJSwgJCh2ZHNvLXN5bXMpKSAkQC50bXAgJEAgJiYgXAot
ICAgICAgICAgICAgICAgICAgIHJtICRALnRtcAorICAgICAgICAgICAgICAgICAgIHJtICRALnRt
cCAmJiBcCisgICAgICAgICAgICAgICAgICAgJChjbWRfdmRzb19jaGVjaykKLS0gCjIuMzkuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
