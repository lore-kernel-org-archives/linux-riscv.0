Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662BCC004D2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020B420878
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jqni0PRN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbFrjbMm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020B420878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WNK8D9tMqAx1dBLTh1oxH1oNt6ABU8mXFXG3AiZf7Ww=; b=Jqni0PRNHUHNuifA4dATW7CPqo
	tO7Fvb0sNjPPeXgN0Zbsi20dl/I2kbCcv7oRw3qawHKjVOTLW7LuzB9OJPSXoXuVGxJ2PnqSJ95Y1
	3x080UW6rVauUQg8LnWOaScOgYSvL2eFNIFxzx9TRCa8/dggt7sVPBHRh14vsAeB5Z6V475uncHMr
	KxaebGH0CO6OAOLcuxPGBjNQ549oq9MSbOVr9lXBxOBXaLNWyR5bN+LrieLjqR81EoB8IiUxSoHRS
	wk8CNjRrXCPhtD0BGNMrFIcl9w64KA+jYk0NMImRDung8uBooETDMtQe/88S+7DYEuLZd/vRrpH/P
	rLQn+zAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7GXF-000476-J7; Tue, 02 Oct 2018 09:00:05 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GWj-0003p8-B0
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 08:59:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id f18-v6so656670plr.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=DbFrjbMmT4p0bJUM3+yKMpB1AeTWcf1ftcYv0Uuc06JmbhA3RekiXD2VLDFJiIXp/M
 OncOHk6jrhOSoprYufsQt0DnfcVOYzbKDDbl7Z+LTNYS8QBTTsaCzzBtAXgMEtu2p0rw
 2/llz50TH7rKF58z0jjXR5kgZPJVQWzRhVtEZUlGC4ZZP/3BkFJEVg8xitwOoo55RXbL
 tj/3RXzmm0yO79n5Ighwn/2/yOvjNm2uHMK3sKhBX35T9wSdB0AfLFQCrpAAJTtmWQxO
 P7kIR+KApXgiAfeXl6YsXFB3rmHH9VV2Stxm9sYFfQCPsga9XpldN0xVTLqQDlN8VAFJ
 YSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=H8F3Wzh3UDMZbKSPHivo2O0nQ/zy7Sc4ZzaKukh2cD+o2inHQ9ac6fYdBCtAMMTue9
 PcJhwVtOBARK3vsi140VyVaOMWcIyIvBrYRyWH3M8zW+jDQyXp8JgOjSQiBiSMY5oIa+
 n52rYdOdCh5fzzLDYuW1oX8oWjmOlLzullPGN4pFnZ+vynEw72fS80lc1zPto6as7fHA
 GMVVWfzZY3dezZwgDBRZ0Z5a5sWVpKMbavg8WMeL/CuncdB5EcJbik/yutuPSrqQQ5vP
 twFzwLldG04epzyWPsIACP2QMDOf8DvTkSlwZjljm+E0/62KMRzrYPvVUKGGwY7D/agO
 Ok+g==
X-Gm-Message-State: ABuFfogkjFhwv75pre71734gWdZq2f7krDEmddA0xN7+tTAPeK84HUbH
 pfXOqVuBt3M/KfnpLnGkvbk=
X-Google-Smtp-Source: ACcGV62Ln85E8wMJh2z/oNxDusx/VwUAp7LFhBLjE/EZFzBcVXFZ3YhbbD2U2lyMrng2SCs7qRKYJQ==
X-Received: by 2002:a17:902:b611:: with SMTP id
 b17-v6mr15707352pls.217.1538470771131; 
 Tue, 02 Oct 2018 01:59:31 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id 62-v6sm5057927pgc.58.2018.10.02.01.59.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 01:59:30 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v3 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
Date: Tue,  2 Oct 2018 16:52:31 +0800
Message-Id:
 <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_015933_480424_F42355E1 
X-CRM114-Status: GOOD (  11.62  )
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
 Vincent Chen <vincentc@andestech.com>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002085231.2mTR7iTw_Hst7FRHa4VNCcFdHUviLlN8lar-aL2iBPY@z>

From: Vincent Chen <vincentc@andestech.com>

For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
after AND with PAGE_MASK because the data type of PAGE_MASK is
unsigned long. To fix this problem, the page alignment is done by
subtracting the page offset instead of AND with PAGE_MASK.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
index 70ef272..bd2f2db 100644
--- a/arch/riscv/mm/ioremap.c
+++ b/arch/riscv/mm/ioremap.c
@@ -42,7 +42,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
 
 	/* Page-align mappings */
 	offset = addr & (~PAGE_MASK);
-	addr &= PAGE_MASK;
+	addr -= offset;
 	size = PAGE_ALIGN(size + offset);
 
 	area = get_vm_area_caller(size, VM_IOREMAP, caller);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
