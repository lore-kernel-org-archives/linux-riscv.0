Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DC7CF042B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 01:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgZiQ0Gv1ZjFGDY3dpaeQ8id4HcRuoIhXJQhDPK2jLo=; b=A6g4tHwKejAVG6
	CH+MyFLNwURyFsfOoEPBRIyupQpGIFXWrO2G0RqOtRv9Bv7W9xaJYPMgNG2jEfoVRxC4hMYr7IUxT
	8gjqRlkZsBbbkT+9oNpfjE2G1sBndO98pRkd/8d+nAkNxfoiMIk6CMaxGqREi61W32DzJpSvlN2HX
	KCpE0C5TNe8HSBSE9zMKCl+Y9i0qdLBMxLpBsOefV8qVXpOUPZ4x9J8VKLiE1qVq3NF3tjtyATByz
	d0/Hr3MvOSnhZuifvEzp/qf2yNN+AaYIfUbxoLz3KRS9fA4JvmvxnJdgvNxQXkNg0eeEMIQ5sGFYi
	ELlOrduwJ0eG0dE5gSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKk-00000007a7a-0dh8;
	Wed, 09 Oct 2024 01:17:46 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKg-00000007a6G-1r6N
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 01:17:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7c1324be8easo267819a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436662; x=1729041462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=I/4vOC5OnUSKQO4WtD8HvLpSJ130KIFjXgTciAhHBqEsDqM+7XB8F4tSaAAgbCU8E4
         buFZ1Td5AKrA6zV6Rr4Ro5AfjFoV4g8DZAcu9Cejx7K8Dv2s6iklyAvZKyWeeuczg3S6
         YZE5hF0P09iM2FqEoKgqE9c64n2XiBXomCwT8rKyOnasAN+zBj8ciQ18o8z8OuSnQhGy
         6yQYdP+IFEr0uUE/KBAUJjbaEShktlYei2VdeLfDJ889T01y8dz0jpVZeF7ySbchMtfZ
         OM2q+QEDWgT3IusLf1ZY9oM+KHwuO3HLmYgUf1w5gBYD886N/Jr7x6qOahr8bZdwks/q
         Iywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436662; x=1729041462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=D9cCvuflMRhh5rAPDTockP+NzIcwnuhAQdO5CYZ11kUTezQy595JGB3pCh97eVKRJf
         tCg4KpIretpXW33/d8qNl80TyaBpLQlFTZn2Gdnt5yPCiSZueaVMhHuUfPmFQEqpS90i
         QwhOvy9Jl2jbdiVkQ90ZTbUhAgNkneVg4FzQnisv5mURwGDZ3QU0+U4+SWibIRiDxqZp
         Zd/DSFOUvm8m8Edznj7y8HGi098BLJ7VbtcP+3tnpDPSiT/zyKsSyaZ24D3aQI7yepqy
         p0FDUxsJRwcTRuyzzpqXTSSU9IMYhz6AIcMCiUmwaKn/WHr9Q6vpOUqBSiQwysQY5WZ2
         G0ww==
X-Gm-Message-State: AOJu0Yy7+IUGeSzKN6t3HW/UoDQH7NDEwQ3J7wQ5jxzVYua+iDvRna0l
	l4v1LhWol9yiump9vXD+MHjlXIy4h5xpWgsZOiHCCTn0xhExTyyiO3N2c34mWq4=
X-Google-Smtp-Source: AGHT+IG9ZtD9Zd3q75GN23Imw0rYHgFKjP1aIT3fz+CqmO5yL/j7FoVtSH5hft4DRnXSIhe/CGKLbg==
X-Received: by 2002:a17:90b:503:b0:2d8:7a63:f9c8 with SMTP id 98e67ed59e1d1-2e27df3a73cmr8151836a91.14.1728436661766;
        Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:46 -0700
Subject: [PATCH v3 1/3] pinctrl: th1520: Fix return value for unknown pin
 error
MIME-Version: 1.0
Message-Id: <20241008-th1520-pinctrl-fixes-v3-1-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_181742_507927_FB832CC8 
X-CRM114-Status: UNSURE (   8.86  )
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

Fix th1520_pinctrl_dt_node_to_map() to set the return value before
jumping to free_configs when an unknown pin error occurs.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 9331f4462480..265a75a78d5a 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -499,6 +499,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				nmaps = rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
+				ret = -EINVAL;
 				goto free_configs;
 			}
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
