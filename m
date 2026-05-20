Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023FACD5BA4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDDjfzcNDLj3cfT0bnp3OOi/rKg82NAU3Mov5HWubBc=; b=q9uNeRIxhsfm8G
	nHuMZFS6PuxAX2V+K+NIlYnrqaRmAyN/t8JWspHTfLyB96ar7ekt02OtUqPpu/uKiZMNGt1LIT3F2
	t9KhrayZqvdb6Cc9HH+Nmuv15v7PYnpuc8eNp60+SUwiWBBX1YRp0608ei+1uXPAijUF1K431bq2R
	H/hzlnF9FBpfd9LVg6CoM6PL/tCs8IkfcCHWCKBwOC5CNDURJhjucJjt5MJ0LFDv56WVr0NyE9X6Y
	2VMu7oHdhNETMKHvTGXICU9l55wLqCp86O5OmO3o2+VvW79lshFLXKF1CzNRrRajTiT0dD3y2bKx3
	fp82QMcXovZdQoiO1mPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd58-000000046Eu-2Xfm;
	Wed, 20 May 2026 09:19:14 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd55-000000046CB-2uug
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:19:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c70c112cb61so3819279a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268751; x=1779873551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=E/56IJnWJBxHQu872REyMYghclNbpooTl0ABm8iRv+ASC/2dGWn8nztpZCrmEQd4/F
         D67huKi4ytU9P/jslK8j9EvX4M2IzX2w3uk8iXPvkS/tdrjL4GSA1q4LjAvDmE8JnFH5
         usvLNgfhgP645BEwO/l6PfJ2rwxxEIuLlQ7CZ/oJyOCk4owDfitDiLdni/uswdR19vGt
         5xRJD5k/XnP2/rExtr0NpYgCnuV2TWaJkcMkjHKVNPpnxjC4XROb1emJb5ZGRIVEZk8J
         o+Qc8IeQRIWVs42QyPzooF/pc8DIm1tylfN9MbtHMMdrkHItRugH43c75GZ50xTyuhI7
         DHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268751; x=1779873551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=bRJip7/3DUdd5hAaAIIQdkJUyMEMK5qKsZbPyhgK/c/T/0SRA6F0v2pyuAaD/pSiw+
         VOLUYj/QDZxDBTZNmEtfh+tc0xI8k95UkqDfksRziF1kYyKlJzCgYUJ+TkZ+lpAVPj5z
         D67A9w1Sdrixcm4rc0QFuCYOyWPaEx5D8+WPv2fK6cpeRm4mS33eq/Rh/RfCRasvspve
         zX04VRIg7Amnm3XAE/wl2Akd6DZ/QmWSA5PQDU7EsdyHf8PzancCXCg3zZ/v0MyynOKU
         9IUbvdokD6iPoRRTf/5/rzGp9JHwGZXH8OFjd0O1noKdwuaYCsqonUfYNXt1WZ+zg1pX
         YWtw==
X-Forwarded-Encrypted: i=1; AFNElJ9lc6a6cji5sztscdftqNYaJojXQN+0lROyrTIyNTnhFr14b3Jkyq7fvmTIPIIM3GEZlyXu3ujFXRvPEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUd1E4b1UuXUwcWGnOKQGHnqrUoOBW7SSZaWyxZ2tZffZttuNR
	fGhJ1MaVZlWCJImiRtGTX/eUv9MS5Mg2st+YgfIiN6n6WJmKZcBtNg2G
X-Gm-Gg: Acq92OHl1DbY0q1XwcFTA0PCCyduT4KmdYi9D+4IOyx2Et2fjD2Ai4dvvLeBenk4ZKA
	aDc6WqumdQif/K0l3AV4KaxGTFywrBgUNjKzKbyDluOpL8f1d80NOrmO127AsnNRxzFXI2gU8QJ
	ldeb96zdxGemLq49tJ2Ig+E/6SNCHT1UgTBOsYUqr+uG0Ka0rZdnS7RdsBCGaqhzmU43Ehuo58F
	MEmRNIUXgtCuS/ZVLovG+nxpulw2TRSEQtpIPoJReNHpRRVbPeKZkkAojeY/WOwetyzGKkoArGq
	HFrYSb6CBCgt2/CEGijLk8ejqbeUHJk9H+ehc5uqpDHsU2UvKkgUTEF6JC+svJaoQGvKJY3ZpAB
	1T2TlmyOOVo+UJ8D8ELxcvXIm+b7Yt2VOjq3wbdNQ1Dfi3/temG+cgfqUB76t5N09KFO/Hxp/0j
	WT3HNmX/10CDboCINi6ysV6aTMEVH55eiUvT4Q8w==
X-Received: by 2002:a05:6a20:2454:b0:3aa:ec28:edc6 with SMTP id adf61e73a8af0-3b22ec63eaamr26158763637.39.1779268750848;
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 1/8] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 20 May 2026 17:18:37 +0800
Message-ID: <20260520091844.592753-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021911_738486_581900D0 
X-CRM114-Status: GOOD (  10.30  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that appends /memreserve/ entries to
reserved_mem[]; such entries have no name.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..313cbc57aa45 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -788,7 +788,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (reserved_mem[i].name &&
+		    !strcmp(reserved_mem[i].name, name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
