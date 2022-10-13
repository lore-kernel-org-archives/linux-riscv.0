Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F436C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOnMxWms1WRH6gCkjnIeiYl1qTyL6uz0KmC3UpeSqBc=; b=4QPrmnCa++8mXN
	jBOKZc3MjuhIwJ5+M8+6fT6+jSRCZSh7vEPwDac0t9Mpl1lvNZWOzPn0AVzpDsAwm7mWly05RVQGW
	SrM8RVRZHxa2Po55+gM5cs5PTjTbBtcZq50wi8M0Gp+jvFDa9yxCY9LpvSGbylT2fnK1Rds9X1yT8
	FZgKI82fK0TFICsdUNDrTh7Yi9SsKvqcTWAgt5WT8TtJhkD4ttnuznrMF5jTPA3qEh4lEliLJO7XO
	oRNajx3pribSiHnGI4ZjGjQeFy3Nhq3XdZwwKJtzw5ZWyfViuKBKH3fs7dT4MvolE/+0/Jq1fVz6Y
	uMyNOelR1b4y3PFQhHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGm-00AdAO-Ar; Thu, 13 Oct 2022 04:56:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGc-00Ad4G-WB
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:24 +0000
Received: by mail-pj1-x1032.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso4820524pjq.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JdZXonRGX8Hfi2tA5W8xbQxDC6wNyFwR/Pij279WU4=;
        b=5sr/GMYQpyzqszchYrjFbOSV1TLylIpkH1N3EmYlvQUd4smNELnzPqJKIFStcIhXam
         rZflGCl09879gMzwL19EzqrAQ6FZ/XqixD+9QCL7WfuDdurYuikpjh4dLuN9F2iDcS65
         uTgI7p+Al0UMieVL0WEzIZGokWjqqpUQub0MRgyRVwKNv7aUEiHqOmDPpW3tyqOoDkf9
         pG856gTbdev0qRRZhdPFkGEvz8hFS+g7ij4Yjyf9RIx8AAT4IkuGsuTqHcNnFgXYx5Dw
         3ND+3/XU2wM3f8MojuJpfeOj8xySRV3PhVF8mVFCSGB94SLd6DZCUAR9b2uJnviK089f
         LcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JdZXonRGX8Hfi2tA5W8xbQxDC6wNyFwR/Pij279WU4=;
        b=vUeoZex4FR99ZKnERUkW2hjOiuZJeuBXGzIZ+a3BFVWYpfZWMF/uwfx12gXceb0/Lj
         PH56oeotjY/UsPLfQCab0Hkg4xZXUbSt22WO6MXUw8QzY/K4S2QO4pybLHU3drTjBk0V
         sxpPoVpyqVpUxhW1Up9RW8xNBDHaNNiojZnoi1sGJh7V8M8O9MV8A/ltWnmBfIhIHX71
         RefvG6Kh4pqX5IZgT02uRC+dRg6BsaQ+4vTEtjMLgXs/o6qRLWJP+dyA89dPYXkEEhiS
         HrKrL+5C5VIbciu56NZYdSZbl8KTwv6MBCPm19J9tk/Q1PIKRvvBouM40IecsFd3hLdT
         kbaQ==
X-Gm-Message-State: ACrzQf2OhoPWOlILtAxtj3lPLT/1dh9duexMwo0/wPUvxfuibxh4G7XP
	EZne3KQ3wA5gU0i1MhWq5uLSGw==
X-Google-Smtp-Source: AMsMyM41jgEKKfgOWeqLGdNsraNVlcTIzlNFWYcPyZMeo+1TAJoaFl3FK32Y8DyfJ5HhRRQgcTfphw==
X-Received: by 2002:a17:90b:1d8a:b0:20c:a6db:5713 with SMTP id pf10-20020a17090b1d8a00b0020ca6db5713mr9130520pjb.135.1665636981571;
        Wed, 12 Oct 2022 21:56:21 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c12-20020a6566cc000000b0046ae5cfc3d5sm1519896pgw.61.2022.10.12.21.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:21 -0700 (PDT)
Subject: [PATCH 1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
Date: Wed, 12 Oct 2022 21:56:16 -0700
Message-Id: <20221013045619.18906-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013045619.18906-1-palmer@rivosinc.com>
References: <20221013045619.18906-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
  Atish Patra <atishp@rivosinc.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215623_053682_F08D50CC 
X-CRM114-Status: GOOD (  12.18  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I just stumbled on this when modifying the docs.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index dfe0ac5624fb..5da6f9b273d6 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
-RISC-V extensions, we'll only to accept patches for extensions that
+RISC-V extensions, we'll only accept patches for extensions that
 have been officially frozen or ratified by the RISC-V Foundation.
 (Implementors, may, of course, maintain their own Linux kernel trees
 containing code for any custom extensions that they wish.)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
