Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE8CCF9EE
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDk8AWl/LUYH02JSMtnr9I2OoJOC4Kk6UuNQZc9JHtE=; b=0QX7OAfqAb5s2o
	lftW0wfhlemydW0EaNFdvlNL0k6MIYwGGMbfZlCB5ZOm9bFn6RMWeUCMmJiEh+lMouLuyIavu8G9N
	egDJHn8IpQZ+35np/obQj6EAgightogjH8oZK6nclrixqIFn2EKFEXSjAU9xcTorCK2ilOcoVxM4S
	9A9sWrEsVMoWP6/OWCph0s6ONZklLt42WPQd91ldS11uVUNKe7gZKky7Yhuded6Iy3kCjm07F/ZBb
	OBYzKKDrw6FIhEfwcbJsWsjOCoK41tMLvu4jnvnRtK2Sj8ZNCEH0zsBqkdXov5YSk3Mv+pjKV7zeT
	1SRqLrHYOYRsyA3o5trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTx-0000000BlBZ-1YiN;
	Sat, 25 Oct 2025 21:07:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTu-0000000Bl9k-2ZVw
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so3635874e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426440; x=1762031240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr/0QMDYvE37cYblYgLUhzeK18fGuMqZbjJmBm3dTtg=;
        b=l4vlBZGp3WDbpHhSnZxsZq/R1I07eK48WN0xFcZ0VwcO7F1oKIRFW9Cv+IWs8daj86
         nEHFETwNbTj8eWVbZduAdDE5xmnA3TiQp3I5pz5riiwgLNBX5tg6aeDZiwZbTHYqNDIk
         axtoXoDb0xnHX3i4fN2UGhXVf2x+2TePz1RJBrXv2krWzlEbNFk9cepAKbE4ZlKSYVZP
         J8V71E8jP55ztZvoHf1W0DzkSnBKvz0LhEESZEeKljXcqYCti+PcuAm7eJwjTqm3ZNCL
         bRaORjjptQSv5f9r91n0ttgmFbvzMv8bL/wFhxherm5JG39nn8haRG+o4SEm4Gry3oxP
         Zf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426440; x=1762031240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr/0QMDYvE37cYblYgLUhzeK18fGuMqZbjJmBm3dTtg=;
        b=dKbJFEYcD4snc2rVE+DGUhUSoBld1W1ezayAtPXkwqsLGSvRax4oXn2VnmGrWm9xZL
         dK2OTzNAieF4uL5x3fTLQ8TYRwuK7sOYSNcXBIkDsfjWrhuArWALKlDBiqoRvcZdfYlu
         3MHPZHkstuooSQAJ2/NIrgE53Z4XHG2CiizLNl1o3xIKRGkCIbkgFeuHxzIZ3MM8kpNX
         ouom/427ov+4eTN1k2ysGA/zEjkYE2reRsSPW8xK6v3CjlkMBOKcCQFl6biJg9mfqPwz
         k2GvMvQxSuIn/DAt6o5TQscn2FhLgebEqleUZYo0W0+RLyuOig77UwJBWEaB7FJUjj9W
         PQrA==
X-Gm-Message-State: AOJu0Yyd5TUy9J1qDFwp1ajlgvMzimT9mLvR+F1jIieFZN1z/I+yFaiK
	EasroOy/foa8AY0FvuFpEhOyNuaBLeg9FrvXCa2OEM9sv7ZzYxDvhiIph7M0RHIMdx8=
X-Gm-Gg: ASbGncscFDUV+DAYrEXTsYXsV+Vp9Ld2vPUcfRZ64WKgH5QcAdIaz31Ln33G6di0S9S
	6sSD8f/pSkLI/fCvvfcju/lP6yogYvjATVG93wvvPbooDFX/iA8BMX+t36W/et4cWS5RMWOPmEP
	r5jNQSGIKGgp1bUPhsbnT+dWhWekb937OqkDGKIhYRjfx/OpWKGzK5O4SIEjrX5kKI4J3ok2xVE
	oND2qXo/8jtMZKbJmdDIAlSLJsbrxtNaglFFV88CXQOMx/CIL4T0q/2W1ATCRqLLa9uVK/bU0HY
	jbo0yNpiZplzPE3tER07wTE8MILKfSnjhE+YvmIUpWn+3yZt5wFp1gFpnNdBwsjbQDmMt/bH4nn
	MyiE+j4CZ95miRP5qT7cxhMDgUI8VN9hXsjdQ0QpLsrhDHfVYvyNClMrq/o8IL+CKMvdzeydX/x
	YWO4LYB8JU+KVQ
X-Google-Smtp-Source: AGHT+IFkPXpISal+SMJSZTatfdL2HnDeo/R8Opajfidd3Uztyq4QO9Zc4xlbr5bSdzNAFjn8IbTUKw==
X-Received: by 2002:a05:6512:3405:b0:591:c898:e82b with SMTP id 2adb3069b0e04-591d84cf8d6mr11261129e87.8.1761426439955;
        Sat, 25 Oct 2025 14:07:19 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:19 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 5/9] riscv: csr: define vector registers elements
Date: Sun, 26 Oct 2025 00:06:38 +0300
Message-ID: <20251025210655.43099-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140722_663051_64CA2E22 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define masks and shifts for vector csr registers according
to the RVV spec 1.0.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/include/asm/csr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a98398ad..4f55dcf86627 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -444,6 +444,17 @@
 #define CSR_VTYPE		0xc21
 #define CSR_VLENB		0xc22
 
+#define VTYPE_VLMUL		_AC(7, UL)
+#define VTYPE_VLMUL_FRAC	_AC(4, UL)
+#define VTYPE_VSEW_SHIFT	3
+#define VTYPE_VSEW		(_AC(7, UL) << VTYPE_VSEW_SHIFT)
+#define VTYPE_VTA_SHIFT		6
+#define VTYPE_VTA		(_AC(1, UL) << VTYPE_VTA_SHIFT)
+#define VTYPE_VMA_SHIFT		7
+#define VTYPE_VMA		(_AC(1, UL) << VTYPE_VMA_SHIFT)
+#define VTYPE_VILL_SHIFT	(__riscv_xlen - 1)
+#define VTYPE_VILL		(_AC(1, UL) << VTYPE_VILL_SHIFT)
+
 /* Scalar Crypto Extension - Entropy */
 #define CSR_SEED		0x015
 #define SEED_OPST_MASK		_AC(0xC0000000, UL)
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
