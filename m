Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B02C282D6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpVytkROoQ8KLEo5D8s+IvnezSvzbcCbkVQipzKtc1E=; b=DXifLunf29yThE
	uIhxEz2aNslydUcg+V3Z2ZQaFzLZvg53urDkFuZoTUEtSrFPgMtB2/izf9X9/tpMSpwtXcg+xYr3y
	oqMZNExZJiPDVWxQASOFykZH4bup1mchVbXPIDp4whsv2ZUdYa00R0UNvQYaSeBCgmWdMi+FVf1mf
	Ss1nIBKxBReoW7lpMVNtZ9JIYpXsx96nnDwxhpYDMfiCtzBr6XpLGZVzh7NVOTUmGoEvsE1DxnA1f
	pVEfWH9knWChm0vY5EKNMyBLkepdIMbi69suS9Oj7WJuJ11L1bCw3Kr2kD0JwnbfTXfag1y04l0nH
	4gnNaPFLLc1uu7BtM3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6o-00000004ZpE-2MD2;
	Tue, 04 Mar 2025 12:10:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwl-00000004V9z-0MKy
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43690d4605dso35696815e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089626; x=1741694426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=WptdLqCbjnvTOIRtYxAsKIo8k5oO7NXNRM1VRgEdyHXOwdGn4ZejbWEytuW0zkCNhM
         uVYha8T5/epgYK2ArwTq3YQ1Zye4WGbv5NocfxtJ5HuT40fJ/n9FsHFl0iNrJBEqHPbP
         RCMXiozaXpPijsAfOgSWezfWOybgtfXBWyxUFzASz71PSQFlm/be8seAGn8OyP6jI69/
         68nPI7QzB7a50Yu0tpbIWAHXs/UC0+ltbZCWtfNx3GvOxzmON05lQe+LJmQhmJ3dCwnD
         lZ9E54vJSTolLQ/2aQOFZ/8Cxb5juZ2avsAx27O9NpXoTkDR4iaO7FRrSROSG1ex3uQ+
         8Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089626; x=1741694426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=ctXyZbDHWDcRPTZH0Pmsw0N3RDBztJ8j649hy3QK9aPJ0erVEeO0/QWvG+3Fa5yN4w
         nmshrA2ahzkU6pWRoEEihMUrF/qbey8xlsTz0+m5Ruipd7w8cJZVEypCaOQ/lCRBTxdF
         9EXbJk++Lm6vhOG07FxhRA10NcQHFNFbRWeYpyBsN00WKHX1FBvKGo5ewze7YN/XYPHt
         PBwUWUlFj0379A9uHZMoulAJmpw+j1L47azI62WtEe3cBE61UtTVKb2TuI+Gn6uNN3vD
         N5fPIWXGOvsr0vE8GOnO3YCDtQYkZcSZKWaslYmzdTa1sd5Am6iew9FGw0EGeg8zyg7k
         Yzuw==
X-Gm-Message-State: AOJu0YxoynvsvV7SpdyZZZOyDPUsN8xGacUaSXV/kmMhoRREjQ1PuSW8
	pjfXIdBNKYcyC3ZwO+CwfItsM1IP2Q09UEWYLB6D/hkygcV6u/MKsWluLXQ212+9fjRJlQ5IHBm
	q
X-Gm-Gg: ASbGncu9u+2KyV2owhsl+9yc2aO0+hvzNrFx7pnWMPJ73zXFh7dhiYngHNCPCGuci22
	u3aiaUdvu2Qv7Qy+9V74vX/r4wrjycZqScyP+bymBGqFt1GaBOVOYTAjCPOucr5jlxqoRK1WiQx
	iqE5IFedLjkRUEqoZejycv+H5HgrpspQqROGnAVQmODIIsZUZABZnptpOcxUdxINbRHzrHQ+3iR
	4dDuN2iEDBgT9DvWvyc3Jm6cUDXpzJSC4Ed5I5vDwC65GtxCiPtN4JDJw2TG5eI4hFhDPcZegHG
	WoPf9oPrkb+tUFD+XSgVaoMwnpY4DQPD
X-Google-Smtp-Source: AGHT+IELzkVFh9RITGThHEwxgYy+2Ld8GAacL3JsxhdPQ1ZeOzGuZugE0nk+z2RxPZrajYXuj5Csrw==
X-Received: by 2002:a05:6000:2101:b0:390:f750:40df with SMTP id ffacd0b85a97d-390f750412amr7616475f8f.34.1741089625766;
        Tue, 04 Mar 2025 04:00:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm17247748f8f.5.2025.03.04.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
Date: Tue,  4 Mar 2025 13:00:23 +0100
Message-ID: <20250304120014.143628-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040027_124018_5FB55F67 
X-CRM114-Status: UNSURE (   9.02  )
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

Document riscv parameters used to select scalar and vector unaligned
access speeds.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..9e3c5fecfa52 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7477,6 +7477,22 @@
 			Note that genuine overcurrent events won't be
 			reported either.
 
+	unaligned_scalar_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping scalar unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same scalar unaligned access speed.
+
+	unaligned_vector_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping vector unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same vector unaligned access speed.
+
 	unknown_nmi_panic
 			[X86] Cause panic on unknown NMI.
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
