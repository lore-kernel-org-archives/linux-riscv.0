Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59274C04A94
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/Jzjw8SSe18rpuaYQhKMXwSp3v7ZaVZA2QqFL1HtJg=; b=SrUEmZwuTNPax6
	MHfnh0zopLdqzRwa8Zmrv3up9v3lkqt7k0b8VQ4bFw/lDNqS/8GKeR74VGuD5jJYx0SnRrCu71byv
	YWGr6o5Q+LjS+ZI8qwVaMQQABO+qceYxI0k5KIlnEnGyz1hzZZV0ldBqo7IisMfaui5CtLB2i6fxj
	rVdfYhLHYlnVC3sUowO+HkUY4nVqZEoVWoBgRD6ENiVuLPr25+Hx0BlGzJ0FppZtUTVpd0zPUMlkE
	3jFUb2pjYUFr0YREYIf9qFoJwlZE7BgkuiUgIc8iXNSWDmITg45jb9RfFHZCwoiNNzuK0qPNN2JSL
	x1Fj59jElfvSxlN1wKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwV-008h82-0c;
	Wed, 19 Jul 2023 19:34:35 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwQ-008h4J-0h
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:34:32 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-563439ea4a2so67794eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689795266; x=1690400066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKs32IhtjLCxiTXuNk8Uk4pJZW2VlUAJQXvCnEO8tTw=;
        b=ttEo92CKB+yR7JU7SvNGV8Atfkln1N918fvtYmF+Wgf2jy4/UvkxLvZRx27dLz5xpa
         MK28QZNyj3okLeYSDgB53bNVDZxBUGsJIzl7b0oHpt1mjYQlvG742DV2OfZqfp/toq6S
         cqv66fUUijUqZgzvJveQtk6qJyo4+Its4OkrqFa3ow6PzmvaLPj3RDllFbjds40oEybI
         2GhbBCEJRA/5XrGCEgfKz/bCXBbANcUZY6dwuHG8oPTtVgjEK2yl85TLej5y5liOEynz
         +B83Dx+fGKsqspEcpyTw+uOBVovf/8uysb74AEM26+yzu0N1vlrrsUTsxZJlKdR5cWqB
         AE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795266; x=1690400066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKs32IhtjLCxiTXuNk8Uk4pJZW2VlUAJQXvCnEO8tTw=;
        b=W5mw/W/vxE3MGaCaUif2em8Mv4ZowLbugsYM+tFvcGXG3fYfYP1KFIx0o9uf/co8am
         B7VfWxuruqv3NihQiNmvey2tH1K+Gm1WgWMxTDI+Y13gVeVCyKQjzV5A6CSsY5w/zB6J
         hkhsXuLHULjbpFcoSZKBLdMRyjFYv5u4AwfASJUgd9Oi6vGjxrBtYY3ntftvQjHX/jrx
         msXhbDvg3gUoQthkWuJjuQ1dN3TNCGeDVz1YnQ0IscUvG3rsQzcU05lWsPNbyCWEUANx
         jiSWCVtsD7Rq20Py0ujCzNMOCtsbQi3Rlv/S01jZclSRJ5AgLxQYy5o8e+OMaXm9b/AB
         xKZQ==
X-Gm-Message-State: ABy/qLZQDe/8a3omVdKE2jhvSwJcKd5yWiLKI+gWvppYDMKkRBC7BhXQ
	Lwc+ONAKfqZGBE6KxSblU5Hmiw==
X-Google-Smtp-Source: APBJJlF46NxrjlcdpKJudq/OXjPgbmDMiFkMVyFxOnpopja4waUL727ujepZ1ywnk72M22OszAadog==
X-Received: by 2002:a05:6808:30a4:b0:3a4:f7b:4490 with SMTP id bl36-20020a05680830a400b003a40f7b4490mr21501434oib.57.1689795266359;
        Wed, 19 Jul 2023 12:34:26 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b00264040322desm1591053pje.40.2023.07.19.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:34:26 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 02/11] RISC-V: arch/riscv/config: enable RISC-V IOMMU support
Date: Wed, 19 Jul 2023 12:33:46 -0700
Message-Id: <961d125558137f7cb960de65e5f71da5d299d3bc.1689792825.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689792825.git.tjeznach@rivosinc.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123430_300555_0E7C6AE1 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0a0107460a5c..1a0c3b24329f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -178,6 +178,7 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_RISCV_IOMMU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
