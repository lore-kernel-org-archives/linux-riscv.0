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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7B2C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794D420878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pT4uBgkm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llJyOIKc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794D420878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WNK8D9tMqAx1dBLTh1oxH1oNt6ABU8mXFXG3AiZf7Ww=; b=pT4uBgkmPfSnKo86jj3aLaiKGL
	NtmU5E4TMMzx6x+5Urz9KX2eEG5bH0QNVkqoRHA6bnigGAV6q/YItpHL4Xcf2Qr39vqzCXPO4gHJ9
	ZyDEsI89mH+gyFJOhsJYEa1uZcbsc7Tm8Q0FmnhsqhDeoIN1/EMqzkZ8wBbmVhm0glE5IuLPCWjDt
	h3FljwU0Dttqrd2s/r6RoZrobWkXVDjjRfn9TXvL9bFO4xHZQkGReqGvVjg7jlVyS0QyY0XP4uwWB
	RzEyL8FUhB4xlR8eGb1itngy0KAhCbx1iZOHU7I+5Wtcpxu0EtFFdlr8ZRqKVzEieMHeMHIAm7cXZ
	OSXYsqlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xb5-0005IE-Ul; Wed, 03 Oct 2018 03:13:12 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xat-00058k-Mb
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:13:06 +0000
Received: by mail-pg1-x544.google.com with SMTP id g2-v6so856741pgu.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=llJyOIKcGT/3qJR9GzkclSLGh2c3cN4qwf+z2v31BO4vntlAGTBeojgVAUS6o8eIDm
 b4EIanPvZAB6xVNlJPmMFdICb9zRQqF23MM4otJ9jvdk6AcbOJemtwevF1X3UGPkkuvq
 wwFqegteig4g2rFsbbLaBOWzTeaJtIui8AoH7tn56H0YAU4LaWXtDb8J8heE6j9mTO7B
 ZFR9XZuphFa4dO3YhAPAAJqT5w9fUvW6gJZGkS4A/E5YmFBuk4hNCDzkidp68NMwcB3e
 iE7hxRzObyQo1jQtbLGsQPAvdEjv4d0V8lBuaUdqA4sVxOtM8H2p7U/28q0D4Pcvr1cv
 zLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=ieVg5CHhvGNuXJ9XyrylcFWwOw8qvk7U0wZ94Qj6jM6mA8ZdN/+CauuaXinJrBqUdG
 QPj7WgQR3uadkIg7ETCatiyvQD/YiAUY8y8KD4AEbFG+Zpwes5/pxHC9iBBUZQGoRu4i
 GNIq4+WEayL4UC5pS8u+0VgvbIGoZdXrO1Isjz8u3RICWivslhZ9StHgAcoYI53Qy7if
 zPYeY8nq3jGAyDPiRtSpCUdak7JpxbOQypwe+NqR5BRnFRzMDSH5Jk2pWo4BzgeiaE3H
 ke9Qzhs+kDuNFhoktbrHDYC5a+6lZzRqNaZbuSETWGE8qGdDqIKr99/lgtA3RyBE/Kz+
 FGmQ==
X-Gm-Message-State: ABuFfogImtO57vjt7t8aKcr4A1NncFr3xHrHm9OC6BoLfjgq1qwB4ew6
 6XzMIi3b5DB+OLEQP5yNtA4=
X-Google-Smtp-Source: ACcGV62/6tCgPPAKhKgQ/LLOd/bTYYaJLObPXOTkiO87jcJNyWzO5iiZ+VQsARaUG8CSmzrXXJ7a+w==
X-Received: by 2002:a63:1411:: with SMTP id
 u17-v6mr16880911pgl.247.1538536368856; 
 Tue, 02 Oct 2018 20:12:48 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:48 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
Date: Wed,  3 Oct 2018 11:10:02 +0800
Message-Id:
 <d851bbf26416d6fe5e55a2bec3121890cc95babd.1538535528.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201259_763441_254B4E11 
X-CRM114-Status: GOOD (  11.71  )
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
Message-ID: <20181003031002.zs8zsfjIjc6F7oMGVah8jYbosjZO9nMhWqso2-Gn538@z>

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
