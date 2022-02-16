Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC21C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=antZ2xGd20a41utTSDlsYS1yjbndw6BC8KXqi/tU+Y8=; b=2pBQKSD0fRgOTZ
	205ZUVB8N/zeKJWalasYO/mZin7DtB8YJTBPGSt5jlznRf3ldsvmm+SImjobUeTHDzb5E9ZSABnTQ
	T/YXN4i5SKi38j3ditDdkEOoS0XMn/2/4H84P6So4WQKG+rVChUSUrF0V9hSLEAdOF3+iUVbw6dnf
	5gE3yeNnma9NUxgbSMmaugmufV4n2gf1TAdd3zi8kc8JZzcOHkayNlGi4S9EICsFekIF6LWsvqa2v
	K5XDyPFwA0o37/qHzT/PMHow5elCC9jyRJPKHrCUxSK1JGZN+saKU8OsKjoVwqy+bgeMIfgV8I0xi
	jZN2bWraYZ+2y33S6hww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CJ-0053zY-J2; Wed, 16 Feb 2022 00:29:31 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CE-0053wU-Eu
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:27 +0000
Received: by mail-qv1-xf29.google.com with SMTP id o5so732971qvm.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y7Lls7PJkZJYc7kZbxcHxB4Pg3B3kBBxHG3i/9qK9T8=;
 b=iVxQeG9XRXiX+NHnAAPdnfqRFudo+DhuKRYlg3KNjR+r63PyTERvyXTSOhQiHUjPal
 yadjBGjUpj+SU5JczUAHkrnSTIw7IND+TXvYERHyHEAItPHKufBA2yq2ylTr6eaZQGwq
 tsHuNeJxApsVwCBvvtWRgYrR9XZqj4fqJeQXkXPKLdWnVEzkad9+676Bf8dy9ySkrc0d
 rqqAlg48l4rGOKse0SeFEFDc4vt7tJZpMId1OD/FFcwtcgIs504aCf0a0cNhPPV/Oc2v
 P+2FAewm5fGeh3l0USDUSU2WJ4p0yiBdT1S/ZcPqqimZaI57ZIXFddkPc1ogAIUl1Qu0
 rsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y7Lls7PJkZJYc7kZbxcHxB4Pg3B3kBBxHG3i/9qK9T8=;
 b=qgPDwJY+jNSOULOhbqcLVdXKaxR220ZoXYko6RXu28lz1z6/Pu/rqr1pItt8bl40xX
 LfEQmXc51PnC9Ov/TVnVVz6YJ9vlkD8fCBKFlI07uJLF/vwDNNpdRVd3jh12xHedJmX1
 zEzK5iz77NgzWlyP6sG6Yf5yC31qkPp4QhPnu+xnaPbMldla+JXbx3sPGYOsQgdTx1kh
 /XqK26Q0dECiqh5X5yKGrSOYbu76Jhd0BsbCCRyAL5nkQ9s/yO/P3ykeoT5PIsXFnlAg
 RB4tDimMTrjuCnl0Fcw7nVKDMsqlYpsPEU6ZjkkXdh58+fCp0blVCyBRvY5oPpqamFn6
 7FeQ==
X-Gm-Message-State: AOAM530S974aLADMiGUdQ5l0ppk05oeuyleLB8Vwy4SqaLY6byq++v7t
 o7kHRhiIyez9FdocZmP7SkKSQuK7JjLLKH5I
X-Google-Smtp-Source: ABdhPJxGailfSncIp2wrP5MaMjwC6ViL8hwSFjA+/hbO4qkDXM1lwd4PXEQLXo9gcOR7Hb73XLE29g==
X-Received: by 2002:a05:6214:5003:b0:42f:bc42:6ce4 with SMTP id
 jo3-20020a056214500300b0042fbc426ce4mr344258qvb.63.1644971365295; 
 Tue, 15 Feb 2022 16:29:25 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:24 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Tue, 15 Feb 2022 16:29:08 -0800
Message-Id: <20220216002911.1219593-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162926_549099_E0E4466F 
X-CRM114-Status: GOOD (  12.05  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Currently, there is no usage for version numbers in extensions as
any ratified non base ISA extension will always at v1.0.

Extract the extension names in place for future parsing.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
[Improved commit text and comments]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 35 ++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 65664422b04d..cd9eb34f8d11 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -119,8 +119,28 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
+				/* Parse backwards */
+				ext_end = isa;
+				if (unlikely(ext_err))
+					break;
+				if (!isdigit(ext_end[-1]))
+					break;
+				/* Skip the minor version */
+				while (isdigit(*--ext_end))
+					;
+				if (ext_end[0] != 'p'
+				    || !isdigit(ext_end[-1])) {
+					/* Advance it to offset the pre-decrement */
+					++ext_end;
+					break;
+				}
+				/* Skip the major version */
+				while (isdigit(*--ext_end))
+					;
+				++ext_end;
 				break;
 			default:
 				if (unlikely(!islower(*ext))) {
@@ -146,14 +166,13 @@ void __init riscv_fill_hwcap(void)
 			}
 			if (*isa != '_')
 				--isa;
-			/*
-			 * TODO: Full version-aware handling including
-			 * multi-letter extensions will be added in-future.
-			 */
-			if (ext_err || ext_long)
+
+			if (unlikely(ext_err))
 				continue;
-			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-			this_isa |= (1UL << (*ext - 'a'));
+			if (!ext_long) {
+				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
+				this_isa |= (1UL << (*ext - 'a'));
+			}
 		}
 
 		/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
