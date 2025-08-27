Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159DFCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uDtikHu9HnCsL8eWpZ2J4mPcAG3E816SMinhiucaQJc=; b=eg1dq28fPqWCcm
	fxFUAtYEKxMnswgEcZFarC4Cfg7NF+ai10edATVX7UW23aJvldM27KPOcL41AkVmK7oeXgFFQzWzs
	7Kpl8WISVwMgEafsdRu0pqKeC1HGZ9n25SFELFaru6cnHo1D2bYLBaQssefIq7fl6b4UedERpcoAn
	42u/6n8cPk5m8Ck/3w0fl5f8neQXrdfz6lz/ZIWRRBHn3PaULw9Sl+/v7tF5rhkAbdAu2hpEUgTCY
	N8R8i4YXXbhdr9gBu78ujEsIyGfB+EzE/MShWYLIakR1y2vijGLhMJ8kAn4+EkTAOJcL0162PH9ET
	Hr8WPQlZdyMupXVomPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITV-0000000G3nK-1zDc;
	Wed, 27 Aug 2025 15:54:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFzK-0000000FXam-2bxH
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 13:14:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-770593ba164so3134658b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756300493; x=1756905293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCxRte1NKL129p1JRrceqHgF7Qvqda0vWRAw+nicxSk=;
        b=Ix0vutQ0sqD79KeoEp/oh/LiqEF1nqY6yaR6wff40rNzX5osYbjR3ngc8s2Gxx/l2w
         aiIImn04iJmN8BJ7Lf0DbHy5MIscmds0HCv+1bQo3SU1FuL8+o6vT3KdE8jr56gjj6qx
         eo9hbz/y937JbzsdXzDWUOVO73WwHKWZK7O+yWtNN8OLppzfq+veKwhX0zeXyXX1wECY
         n72cv57pSznqAhc9TeF1tMyFe1QZXyP/kFVYCJ5Ja3XLRuwdvZmXVTX9xwIxAGm4KjlO
         2+9QHMzoo2nEHtl72jtIv45A7fdZidaZnIBokiJAgdxa+S8q47MxQtVg9C5mXHOxKUub
         +jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300493; x=1756905293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCxRte1NKL129p1JRrceqHgF7Qvqda0vWRAw+nicxSk=;
        b=b/3e53Squ1dp/YIrtOH4/2Rq5P0RoRWjOpqcWAt7NV1nadpcCW52/GuAs+cq6JZoxc
         E1JEPks9rrlVAVuSOxZRHWPSJV/zRQkbQJp0zWR/hEEL+eDMOuyj+ecMtKlN/rF1/BDp
         YQHiEmxqVUDhfb+ON2i37yXuAxkEc9UCGVpBUvK7kuiBpe2gNTVzHwlJ4jbEAjEAKL59
         qYnrb43/nLhDIN3MqdpeNHWUy02Xhlk2b0QRkKS6vzEPAianvgDWtvy4B2ATpRLuM1G/
         aRy/gTShdc/Ij3SSS+mRCQhlKEfBcwzuzvqPmCbX1A+3FIVDXYitOgx8X0ctCRGXxUim
         mo1A==
X-Gm-Message-State: AOJu0YyBNy1VaOnbEHrD/pgCLQdSBhq0JK1SNpm2516YfyF/oiIqnbaD
	VhLT3P5gE/j9NeBqdLgXf7ETqAyFjbw1PBjHTf4TZik/2QUNxzuYb0U5QrUw2OVKUtg=
X-Gm-Gg: ASbGncu3L/2Mhxw/XEEeD3EjUGkioJJRBtGhwkEMVwDLZI5fIoUSJDGQypogPp5QstH
	SrpQLI/El6fx2MVtUNWyAwGjTO6VgZFG2jFrfgyg+giKEVDfj6DOBmBYFGbL9ox+XRCkJmhE3Ew
	EXYarBzN9FSpNb2SXOHGLjaWkgtMwstBvAEUuVxN0lhPcc7LDH+zl4eRhfGc1x91GxlZqeS2APu
	pekXArpTvsSUE4f6esaoe0Ug/R+qP6G7xCmyHJp49ZIYrXPFbHSGORROrqJXfRypV73QM7wXjZW
	/kYkF0mdJn/kfZHW8o8X9yDKN+snuDFSQn7aQ11SHqdnP1yccuxkgNj/rb4JZkhnP2E0VwPtFBe
	IpbHncY2PUOLKwUfCxVpZlwLaCaPQmwErsjuN7EzKdnhlHwfVcToSqQPNmzfeDO3jy1Exdl0ww3
	IBFZAl1z+Nx2Kw1NCWL41YU3Rx6Sq7stx21zFenodbccsHig1LyE057w==
X-Google-Smtp-Source: AGHT+IE9Z9uwps9teZ7+rUSweDOW5bYCtsaiBl+SAyE6ivlD/53vpBspXgu/zAQMACgkcs+vVWkSbQ==
X-Received: by 2002:a05:6a21:6d94:b0:243:7617:7fb5 with SMTP id adf61e73a8af0-243761783a4mr15224789637.12.1756300492788;
        Wed, 27 Aug 2025 06:14:52 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772017f538esm3172443b3a.21.2025.08.27.06.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 06:14:52 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 0/2] riscv: mm: Some optimizations for tlb flush
Date: Wed, 27 Aug 2025 21:14:42 +0800
Message-Id: <20250827131444.23893-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_061454_955500_2BE47F05 
X-CRM114-Status: UNSURE (   4.79  )
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

Some optimizations for tlb flush on RISC-V smp:

1. Apply Svinval in update_mmu_cache().
2. Clear bit of current cpu in mm_cpumask after
local_flush_tlb_all_asid().

Xu Lu (2):
  riscv: mm: Apply svinval in update_mmu_cache()
  riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid

 arch/riscv/include/asm/pgtable.h  | 16 +++++++-
 arch/riscv/include/asm/tlbflush.h | 23 +++++++++++
 arch/riscv/mm/tlbflush.c          | 64 ++++++++++++-------------------
 3 files changed, 63 insertions(+), 40 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
