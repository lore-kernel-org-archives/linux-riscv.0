Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A31EC282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uYH4N78Nt63hEQ3uxc+KtaXECpDxUGJIptyB0SjwnC0=; b=Gv54x5xqwpnU+e
	JfjI3ongteDTom/3oJpQADKWL5L5Avhi4iffVS6m2Fh8n7LiGm1c6aUodX1nDyrc6jxzFVD0/zilo
	8B6iOvQ+7q8PMu0X7aOnOxE4uoCfO1mx3A1KQn+gyVwLcLLw5OrPa49q/NOXE0Xs/glRwRTpy8S/U
	0TMRU/5WNAxvmMj0duPIJTURVxtbIfcdsD499sMzuET5W2i6jP5IQZJ+7u1dYTW08CHP7gqKSwoGo
	YzXMOsuvevyIAIYJjrITl1wOtL0XDXaaaGdKG1lAafNnco4auxQC0wCK4UBM38ivh8Zs1g9zjrSYd
	38Vc6POQ7PwCWe8yJrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trePd-0000000302v-0qpE;
	Mon, 10 Mar 2025 14:47:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trd5W-00000002mNe-3Hdh
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 13:22:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-225477548e1so28396635ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 06:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1741612950; x=1742217750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecoegn4fA/qWcBRqZDVU7bAJEZ7InNjeS9MhK8OnR7I=;
        b=DNRoBj5F3rzFYRd5W37zPTEJZhvpphh43oLUvupo8vTs1qFugnUW2Tvnttsa0UhvlS
         t+phRIG0qve0G89DUm95+B1/gI6jBfQwirA0dLr/YSrEAi65B2GNEazAK6UnA6FT1Q8U
         C60GcGP4KceNVqRu9z309jJO5Fw5Gq1qO5qNwK2UYRwovJeLxwA+16/wa2IL38k7EIRf
         Q56kcFolZ+yk82hxGyFvUZmPPmmecUNECFXyZxnU7FM9p2omtqPkiQE9qI46H/4n1YA9
         hTI+nQPG+xg6W+DHqu6BMGASwYikJUW3YYal0w35SBNDQ+Nq8WOe9FCI/BodDFipjF/K
         d/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612950; x=1742217750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecoegn4fA/qWcBRqZDVU7bAJEZ7InNjeS9MhK8OnR7I=;
        b=ohDBpb7GYHLATDu4gkG7NfZGGZBWZ+yVF9+0LO3rXcDwFn72gxRw2Q8ADnRLyQmAGc
         vD8WyRRMHtWgZWtEX3umhivOnox6aIp+MPAYs1zHfKKSlIGwXKfZT0dHNxkRKhflwwmd
         NbVLPrwyruNBdNjVNVDuKtT0tOc87Ql0F8gmEf5S5LXkLYSXuEaVojCOzIwh0/qQzpEw
         HszcjbaOvIy6RIbnQkFKu5Jiy8WHJp0Hc1yQnd8dBtocGofAaBFOHT18cCK/XP4lsbmS
         zEmpa6Z2YpXnoAUJFHlkYdGFW6gtFurPRzYoHxv5kjyI35WUwaF3HvEoMhY3jXZA6Dkq
         qzew==
X-Forwarded-Encrypted: i=1; AJvYcCXgCHjSyuD0joUB8lJs80dM16XslCeSIkqMstq49YPIy6E6/mu8viKdO2IByRKYIBDTkX1XlzUKvS325A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOer8ulWrYqAWFMA/fLk4z/ZR5UVVrU9sNxEV5dDBGY90ZPDtO
	nKl3JwPK0+edAzhJYis5r1dHIFXOC40nse0eK8h9/Gvt7qcvF6rxn5KbQbOYl8c=
X-Gm-Gg: ASbGncteTEgS/0cfujz+DWz5aGaqPQDr3hU2tncttFP8FAMgrWOtkkNF/G4+lzqkCWu
	AL+1OB3jede+oML9P9/UG1yUCK6MhAmO3ZtfeI8iiqSP/S30Ic3njeUnNO/B5wcR+XbCWHwFOPE
	INs8QPKnfrm1rExse44G27KCBsEI6u1NlyQNsH20YkYwyfZ9FtFF60ghfZ3SvPkE6D+aQy/EBnu
	c94dgWibpOCHrIcVfud97ZUK0353okpV16ro03I4mHnCZcXfkbDEnWeJTe7Z6oxuzOfpYC8M4ko
	4WhGu+533tVzTvkXEXDLfwM3fk8xeR1GoNC/LYplecFHZdaLnC3F7KTX7MdSWdE22QdVuvL5PHQ
	wgi1fGBRgEV190xQpSwSx3vF1ziI=
X-Google-Smtp-Source: AGHT+IFu2n0g4sZs2+O2XTkLIhRuYqBot67+5l/Sfz9z48bWpPobUYWSXXb5rmxQvy1FzPZ4GNzqWA==
X-Received: by 2002:a17:902:ce0a:b0:220:df73:b639 with SMTP id d9443c01a7336-22428c07542mr213599585ad.36.1741612949902;
        Mon, 10 Mar 2025 06:22:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8617sm77318785ad.61.2025.03.10.06.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Mar 2025 06:22:29 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: akpm@linux-foundation.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v1 0/4] riscv: iommu: Support Svnapot
Date: Mon, 10 Mar 2025 21:22:18 +0800
Message-Id: <20250310132222.58378-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062235_000924_0F9DF091 
X-CRM114-Status: UNSURE (   6.73  )
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

According to the RISC-V IOMMU hardware spec, the IOMMU implementation
has the same translation process as MMU and supports Svnapot standard
extension as well. These patches add support for Svnapot in the IOMMU
driver to make 64K also an available page size during DMA mapping.

Xu Lu (4):
  mm/gup: Handle huge pte for follow_page_pte()
  iommu/riscv: Use pte_t to represent page table entry
  iommu/riscv: Introduce IOMMU page table lock
  iommu/riscv: Add support for Svnapot

 arch/riscv/include/asm/pgtable.h |   6 +
 drivers/iommu/riscv/iommu.c      | 253 +++++++++++++++++++++++++------
 include/linux/pgtable.h          |   8 +
 mm/gup.c                         |  22 ++-
 4 files changed, 235 insertions(+), 54 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
