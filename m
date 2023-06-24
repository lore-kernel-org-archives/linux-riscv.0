Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A7EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yb+8S3tuVCYB+xcJ50ok7KstcG8U92s6MYs9huScAkc=; b=wkiBIsuCDHPO4m
	zQqsphDdqAky+GOeubMEv/0W8Wo/PohOWuRbXJUYKokLHvrDRL8O3V/ecFcd9x2eWNfR7Hv5Y3DFH
	+PakHtG9rnkiKTVNM/i4tVoYC/VkYTyspKsKW+B7sSST2ymVTDufLbzYaNGSzpdUXDuqxeO7SdprK
	OQ0RjGv7wS9Vk1Q8NYBKFS+qA3drCS5/LR4syZjCkechtB9z2pgLf9IqB/QdXg2nz8xk/ctQeRo1k
	GFIliXEtZ7LrshqTJMVZw3oz8fVaFzwjVdImhl96crSqwDs20akG/5wY1LjeG5BGIWlYWU+Cp6JBP
	bRQg7H8kAefSid2gY1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GG-005wpd-32;
	Sat, 24 Jun 2023 12:21:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GC-005wmK-30
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:21:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa86b08efcso590745e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609259; x=1690201259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep2XsA9j2LD9YyooNd5WW+/YowFL7q+DOAVN9RNvwtM=;
        b=HqVG27IW75eotRBvjQJoz9xZyhDt145raK7ooTKnqu1gvdfvCTqjpUDRkjfALOWDC0
         mD4PWhAlcqJI/GE4WBdRaig1Nz8ol5rOsAd1cbvTM2oyWEp7MKJVmPD5p3RVYsNRacUG
         sSx6dGcqzbcvueBBPiznmCyGLZPSjkqnwnArEjLJjlVEsOUNt0jqnQMYHN1cbCbjreWN
         9Dv/hx7mxiAdn1EYlTNvcONsABk7uWEp4Illmj3F/P02ehGh4ZDXsTIenjMWEoDbCzVv
         zi2pv57FNYPvzvif4UrJc9KZEoR4YszV5m2YdtNmQuKZc3J4J9ZgfMyzfWnjkuUIqH81
         SX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609259; x=1690201259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep2XsA9j2LD9YyooNd5WW+/YowFL7q+DOAVN9RNvwtM=;
        b=cNH1OfigQWYGHC+82jKWvVXmTVecmNW56F+XbXODzhlKK4zntwkISlMH9PqqGF0Btf
         IM2SgpHp5D1OJkHztXS4ixUkNBsTNupB6oIn7JS8w4tySdg6eptpyQkxtM6+EN9Yqn3n
         +HJZ+nndN+aH8vgEz7uo7oaV7Az1NkjCKDl5e7NId96UjchNlySrxzbFNrO3UvnfdqP8
         mZu3pl88NYFyfc1GODlHDd9HrY8sXhYquxT06La5WbD+oZ2kiRQgoY7FRrjKpcJan1pw
         VRZ68x8AtDSbuzMFxXpV/c1LKW9B/wneXZE5QOoadGfRPmbDeH7/rVWf9/pxeqTWdg38
         dG2g==
X-Gm-Message-State: AC+VfDyMK67p4TBu3F1+ihekHOKC/mZ4KwOmNafcPUOHGMCyeep7WvLA
	I2TXglVmPoQJhWdNuNrNMGlJ5w==
X-Google-Smtp-Source: ACHHUZ7YN3i+JPKbbojGoxNDyVgRp5DPwz5gJYk2TtRpMCkPHy0uZUm4weZNeKjABF/uBJNYciMH5g==
X-Received: by 2002:a05:600c:3d93:b0:3f9:7c2:175c with SMTP id bi19-20020a05600c3d9300b003f907c2175cmr20595520wmb.2.1687609259522;
        Sat, 24 Jun 2023 05:20:59 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:20:59 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/6] riscv: allow S-mode to handle misaligned traps
Date: Sat, 24 Jun 2023 14:20:46 +0200
Message-Id: <20230624122049.7886-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624122049.7886-1-cleger@rivosinc.com>
References: <20230624122049.7886-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052100_973719_7E40C023 
X-CRM114-Status: UNSURE (   8.80  )
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

Tm93IHRoYXQgd2Ugd2lsbCBiZSBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUgU0JJIHRvIGxldCB1cyBo
YW5kbGUgdGhlCnRyYXBzLCBsZXQgdGhpcyBtaXNhbGlnbm1lbnQgaGFuZGxpbmcgYmUgYXZhaWxh
YmxlIGZvciBTLW1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDcgLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggOGMyNThiNzhj
OTI1Li5iNTQ0Y2RkNTJkZDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMTQ5LDEyICsxNDksNiBAQCBET19F
UlJPUl9JTkZPKGRvX3RyYXBfaW5zbl9pbGxlZ2FsLAogCVNJR0lMTCwgSUxMX0lMTE9QQywgImls
bGVnYWwgaW5zdHJ1Y3Rpb24iKTsKIERPX0VSUk9SX0lORk8oZG9fdHJhcF9sb2FkX2ZhdWx0LAog
CVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAibG9hZCBhY2Nlc3MgZmF1bHQiKTsKLSNpZm5kZWYgQ09O
RklHX1JJU0NWX01fTU9ERQotRE9fRVJST1JfSU5GTyhkb190cmFwX2xvYWRfbWlzYWxpZ25lZCwK
LQlTSUdCVVMsIEJVU19BRFJBTE4sICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsK
LURPX0VSUk9SX0lORk8oZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkLAotCVNJR0JVUywgQlVTX0FE
UkFMTiwgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRyZXNzIG1pc2FsaWduZWQiKTsKLSNlbHNl
CiBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CiBpbnQg
aGFuZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwogCkBAIC0xOTks
NyArMTkzLDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190
cmFwX3N0b3JlX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MKIAkJaXJxZW50cnlfbm1pX2V4aXQo
cmVncywgc3RhdGUpOwogCX0KIH0KLSNlbmRpZgogRE9fRVJST1JfSU5GTyhkb190cmFwX3N0b3Jl
X2ZhdWx0LAogCVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAic3RvcmUgKG9yIEFNTykgYWNjZXNzIGZh
dWx0Iik7CiBET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcywKLS0gCjIuNDAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
