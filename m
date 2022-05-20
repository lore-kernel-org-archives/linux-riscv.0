Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47446C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLw4N9GHA4ZXFVdzx3PMuUPJjvCuc1UAodFdjv7tCsY=; b=y1ZLZuU+MWgQP2
	vxGMqDloupz+fPwpTrjYNhWMClEdONMfkUjhGY74+G4cHngeHaRs/auW2dKgKTqRHXOR+dVVa+VUT
	Kx+zSUCp0btg9/AmJQ1O5toF5DIG/C0rf6D3YljVt+TF4W6REBvJIrrsR+6UrtDR+Qja4/9iTv7OX
	YqK5QmkshByllEF6dYSy6OhTu8J89ZjndNqHbxcFhRyyMUsvXRqEk+8ENt+nTrU0FRGkNfrldHAo2
	HIU+ohHQvr1Y++QuVTG3cqF3VedoaiO/9zgJcrn+h8F3pDnOWvAvip7YcCafEINKYFF2YD3lf5337
	RVqAJFizt8FCN5ZurgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4p3-00DJy0-UC; Fri, 20 May 2022 15:45:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oh-00DJj7-FL
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:29 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so8199262pjq.2
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=5TWBcQL6wNB9LxLHrCP8/TqxtjURhSYJy0/t361wYQU=;
 b=c4yOuQVg7fx9koZWMZRlxpoboAwjwiDzPiwKBiWegfHXXsuU2piqdAdZvKOlVL3wY3
 UyMVdqIEVjbV1MmgqqqPhWFWRYk+bwhWi3TkpDv7o5K0YMkwc2c02fWRsbHrFdFzgmc/
 DLCeupy+iNJUpjyqYR4JeQBFPDjmxJXZ6WuV96Z/KK2rf4fz8KRM7VUPEfZqSILfpstt
 Q93Pbbx+e/CkwcfH5kHA9LYQWUOunWsskcKvraNycowPS7MwBNFLKoTqCaCh2XphgH0+
 vJzeQDisWHO7I9qWBsQtNc8D/rVzeLhSaBVt5S0CGzQ2juEt6+b5bBLTQFftgGxZVBOb
 xF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=5TWBcQL6wNB9LxLHrCP8/TqxtjURhSYJy0/t361wYQU=;
 b=bCYyO9sRukWAbmbU4MBhMsCQg55OwlQX3o5V+1YKNahiwVFHbHSpHKVZ8HMIUa9z+8
 INOInY+vBcSoOte/2RP5RtjgqFbVXw3WjklFT/ld3xw1JeyrPiOWL4dTVGBXdFPzRoYl
 9uXsO87JZbVv29pGqba5YaYHUeYrz4hJvmXmPEkKmxC/YRzz9c0XXF4shKX7ar/iMePZ
 KhhU/IGLc4wi0p3uRXbrW3YVWfnp2ycN1+a8jl7iVyvD8gGDPVl832h2DkFLtnJGeAos
 MJA2zPEgMj5C/rWNCRVPdZVW1DNN3FXtuUPAwwYT+qJJl9u1vnbWCNVx+mocl/14WXPa
 ILCw==
X-Gm-Message-State: AOAM532N7mXx7VacWX55SR1UzZRq6ulAf7kjxkJM79tGbqdPCnk2cL00
 ot0cFXZO7AGD6++E1o6ABGjEvA==
X-Google-Smtp-Source: ABdhPJyPOaFhKw7lv1sn4i4AHPP0QtokVuzUJUfKGEWZJSnPqbVu1QCImrf5yMwt/D4DDEzAf6OhTw==
X-Received: by 2002:a17:903:108c:b0:161:e5a5:e387 with SMTP id
 u12-20020a170903108c00b00161e5a5e387mr6866867pld.108.1653061525601; 
 Fri, 20 May 2022 08:45:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 l17-20020a170902eb1100b0015e8d4eb239sm5936919plb.131.2022.05.20.08.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:25 -0700 (PDT)
Subject: [PATCH v1 2/5] ima: Fix a build issue on 32-bit platforms
Date: Fri, 20 May 2022 08:44:28 -0700
Message-Id: <20220520154430.18593-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154430.18593-1-palmer@rivosinc.com>
References: <20220520154430.18593-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084527_592858_827A9114 
X-CRM114-Status: GOOD (  11.08  )
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

ima_dump_measurement_list() took an "unsigned long *", but was passed a
size_t.  This triggers build warnings on 32-bit RISC-V.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 security/integrity/ima/ima_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 13753136f03f..f2a94ec3002a 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -15,7 +15,7 @@
 #include "ima.h"
 
 #ifdef CONFIG_IMA_KEXEC
-static int ima_dump_measurement_list(unsigned long *buffer_size, void **buffer,
+static int ima_dump_measurement_list(size_t *buffer_size, void **buffer,
 				     unsigned long segment_size)
 {
 	struct ima_queue_entry *qe;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
