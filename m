Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ACEC64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F72820878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p89+fR0H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozkGzWC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F72820878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qIEL7YPh5eR4bbRh9I90cUius8RG7V9sP933YLZLDDw=; b=p89+fR0HaWAl2ySZSLHNY88J1u
	zslygsG/SPNkcb9M6T+esfHwOGR7KqE0aT4ukyEjJNlLvTsv7UDDwcQHaSNXwWzicuPVOIf/8mMdz
	le85O9sUxqbglM/PiHp7k8uv9TY1Ia3TRk7W2OLThEFOvzr3SF+t+2pTtWAoSfU5pYE9RWGqH+TW3
	E4Ld7JHlrhN3QnWDx+LiijMKtrjkfXgFTmG/r9JhwFBIrcr0Rmp1QUgRsYlA8zG7/006/SGdL0gJ6
	WOkOPJgp0QIshyRA4gf9g/oRAkCyylkcSDyiyO4MjpLPZ2ZVL0U8Gkg+wZeR2Sg9hhq8sXK75MWhZ
	2LwglHtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xar-0005An-CU; Wed, 03 Oct 2018 03:12:57 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xam-00057M-9j
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:12:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id v5-v6so2702472plz.13
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=ozkGzWC1BS/YfjLwcS6q3JARNRWaHL6yjlm4R3ayBowh6ZlDwa1ZBvqq6jXSGo79CO
 0eOOUIcz2M8LnamirEJORIag5ip8ElyW3/6fpmQa6D5q1wx9DS8VpFQ+tgrI/7w1mdtn
 3zwyu3yEk7JldyPEMu/d1c2Fx/D25CEPQ1eBpklu58o7hQUZL6GjH0RSr/t131djvtTY
 N8q7wbs6MwJxlgSbS4C0Vx5hK0fKd0yxbe+tIY6zPMOMcb0EsqHFCDnjLya8RrlnVWZr
 Ln/g3teDqx7ZPgHvZEMGDf683wIRwJgdfGE1Cfi5XB+UMnSa8VSOW4IMIG3K3+RJFlip
 9acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=en1c7AIahnCX/xB8N3CiF8xQ15fwb6OxC1PRGiFnF98GG3iqYtd3X/MNJu7dxbyXOs
 8Is+SfQODJuaZM/uc0v1v+i0fiXYHUyZ6JohpmKMdoRARkzmHG6vvaOyUrcpkAMC0o1H
 fkZtXw3wy3mltN1VrEzPcvR9SY3FAtdB5TLMH21RhdMGsURZALMYAHgklDvPhMFPgMN2
 w842nqRVhoXFkgUDlwZzcJDhq88RbmMFjTzhTiPFclTGjwOPKRCbTpYhvMYxVlAAKMiG
 ZuMU2n0rfsg2AqFfFZK6P8FjeZtSt6pULxo3njlWfnsDWwbnlKy5Aifh4X8LxO/NEETl
 eniQ==
X-Gm-Message-State: ABuFfohIMZ0GXdpnp6k2OnEMKa2CSTWcLaGwcmtPH5hWQ7n3EwjTNAUh
 EJXhwbgwboKA00PPJAq7GOA=
X-Google-Smtp-Source: ACcGV63IdAyq+FT0Bm8b1xU4VCTVmILjCPLP0XzQ6AUKiVnXv9KTKwfkDXoXHJeO49FnOiHiR5LriQ==
X-Received: by 2002:a17:902:209:: with SMTP id
 9-v6mr19472163plc.270.1538536361445; 
 Tue, 02 Oct 2018 20:12:41 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:40 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 1/5] RISC-V: Build tishift only on 64-bit
Date: Wed,  3 Oct 2018 11:09:58 +0800
Message-Id:
 <bedaad30d6ab1102e195c50d8c919bcef70b3b24.1538535528.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201252_348792_8A32D95F 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003030958.shXXb7xkc8P-ZV6vhW0brEwu5oy4iAZE7Zev7tHQ4YQ@z>

Only RV64 supports 128 integer size.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/lib/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 445ec84..5739bd0 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -2,6 +2,7 @@ lib-y	+= delay.o
 lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
-lib-y	+= tishift.o
+
+lib-(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
