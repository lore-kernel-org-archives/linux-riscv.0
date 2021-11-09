Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AA1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:53:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A02661055
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A02661055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OKi1kzAuNzZjr85+OARF0WnYznN57PIiB4s6pyzUPI=; b=uFjiHk+rFE3XtE
	4AB8guF5puE7r1j/Kk5rA4X3Cuyf99W1HBXX0akDxpL8XTrTVhjATKEWSeCjkv5Iyu8g1W4APhPqt
	yGODjYZbU+lM6fvU1u2qMUn/b9xFcUEYHMmLGmoeHdgv1KMl/hXhhoVdoDSxr3n2HYwOKXQDcTD/P
	8FQN7LOWMXeNrQoMVpWQqRDStjdVVTwKt94bXktuGz/xNpan4g+21eVRNPo71weta6T68OezijE6T
	F4ebU/sMT2i5cwzeTarDh1w0h2zTtfVWfTIH5PvniX1luWkdFJdethZcPJWnF799/wLLjkFm4ln1Y
	lb5VcCzQcoUo5yzBTC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNp3-001LWZ-Th; Tue, 09 Nov 2021 09:53:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkM-001JaC-00
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id r5so19960954pls.1
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=P9b3tDY+655xD0tPu9SBTJCGpaBZsqsfT1tLH+eh9ss=;
 b=lH+Zi+btz0Y3PlO5Le6vD8gIS2gNoRc+CDGfvwK17wjnrtv9A40qM8mlBQvpTgMzfv
 eiKZw0ZQTiDbMwH/xUeRYTyag0FYNP1oWYpOmMyM2yiXFnw4/HcDC7w1AGojiPJ3Fn5y
 Fuw3/MPUiXHruI1mYFcflj+FDpE4U7yI4DIoQmV/hMk7+y/+ZKTCMkV8eJh1AuYi0Tmm
 i12FqNhrilpzfcYiwyAt39z+QKkiVw6/n0bdhmBtJwQ+rYaOvvQZaPrlitURm795ecsU
 740yWzE/PYiFOuRFFyFCCRRZaNekgfQQWfkm+t8fLYq+tL2U1mau/YYPW3T1DID2M/XP
 UGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9b3tDY+655xD0tPu9SBTJCGpaBZsqsfT1tLH+eh9ss=;
 b=BfD1LZke87OAsfUHJ4x7NDy1HvcuiCF0dyyKP+k4yyz0f7vyV0hF7fTAbQNAgYC71m
 4Jcqrdjsmhw1vpF0E37vwzkJeju92IJd1jy7udAcsn6PyQHvHulf2nfSaUVNYk7KMTbn
 6iMJFkarqLk2hhS6yngTTGQ7qWqu7tjymBgixbRzF8aKttHK4afJkGZ9WcvNBnQNVi+O
 iM+BwvgOT0E3IoUJ9tzzkrHtczTVLpIHhaQNBNstj3SpqdKRGwXV/IChFIp5OtMGT9CN
 jYbvhIp6mr3Osq4xzbCubulkOajXYfcx5fbWCHONxu75/p1nChKiZdjiCux/07io7Vuo
 hpGQ==
X-Gm-Message-State: AOAM530OCwRds8kEpmT+FKJYqGpj/ccV3p0oIsTYqiqd4arMfwsYXQdf
 FTKEvVYDwv9GKt5z4DTbewvhDg==
X-Google-Smtp-Source: ABdhPJyE89/bOjt3ujPXxTBFVPDjVmC+oQVF+9ESGIp8HQlLll/3ZSvGbSTYp6vIWSHhcnEsAw8slQ==
X-Received: by 2002:a17:90a:9291:: with SMTP id
 n17mr5695519pjo.243.1636451333257; 
 Tue, 09 Nov 2021 01:48:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:53 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 14/17] riscv: Use CSR_STATUS to replace sstatus in vector.S
Date: Tue,  9 Nov 2021 17:48:26 +0800
Message-Id: <7204695c80a13a634381fed94ea1598ffd70c78f.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014854_084413_D5CE9467 
X-CRM114-Status: UNSURE (   7.50  )
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

It should use the same logic here in both m-mode and s-mode.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/vector.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
index a973532d2e7f..1a79e2485bfa 100644
--- a/arch/riscv/kernel/vector.S
+++ b/arch/riscv/kernel/vector.S
@@ -31,7 +31,7 @@
 
 ENTRY(__vstate_save)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	csrr    x_vstart, CSR_VSTART
 	csrr    x_vtype, CSR_VTYPE
@@ -51,13 +51,13 @@ ENTRY(__vstate_save)
 	REG_S   x_vl, RISCV_V_STATE_VL(vstatep)
 	REG_S   x_vcsr, RISCV_V_STATE_VCSR(vstatep)
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_save)
 
 ENTRY(__vstate_restore)
 	li      status, SR_VS
-	csrs    sstatus, status
+	csrs    CSR_STATUS, status
 
 	vsetvli incr, x0, e8, m8
 	vle8.v   v0, (datap)
@@ -76,7 +76,7 @@ ENTRY(__vstate_restore)
 	csrw    CSR_VSTART, x_vstart
 	csrw    CSR_VCSR, x_vcsr
 
-	csrc	sstatus, status
+	csrc	CSR_STATUS, status
 	ret
 ENDPROC(__vstate_restore)
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
