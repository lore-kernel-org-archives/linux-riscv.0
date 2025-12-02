Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C5CFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 07:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8BgzreH/PzyDuC/iFhxPl0OFwrZQ0HxbAp4ovwMgWlk=; b=BPaEsXomF2jcWv
	+Q3a47tdXfSYIAGtPJKh1Fvspj/LVeHorQ89UOdAqQW0KiJS2WA7pgUgtanh8NRgn7/GhzWzmePhL
	izLCqmqvOslWBNCJMvCz/L4t0VNlJOsYeo11Wq4lELS0KqySVs6DVEj5kaajkuJvm7UdDMpbi+GiR
	GO2PTCAeZvN9YOa17FqvxPTEmPFX8XPP6cyogVYwm0Ze3RWoalbFdsYksONy4F95heRfxi40q4TI0
	KXax13SbwiQ9Cc72jwagXNg1hM1LkcDi6np49tFPhgbt83Px0qkj/EcWpFFC/1jfNq3brzCQNw17a
	9mchrK5LCPA7KZg12TRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL2Z-00000004zHs-3F81;
	Tue, 02 Dec 2025 07:43:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL2X-00000004zHE-24pd
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 07:43:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3438231df5fso5945383a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764661392; x=1765266192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8G9pjf5bogZRMXI454p/BxPruKC8VaqfMjWG47FH+4=;
        b=bEZUQIrJ/fERWFSZR1uy0qU3UCw3TbgzTqMk73M+zL9qW4IAMVVRcXMD/Waz76f/AD
         Rn+y9UcmEQL5EEk+cC91Gqoc25HH1sp3FbIyYiz+ULIFdZ+B9UWp4pbH9/Va+0jAZ3I1
         zDdTtYsiZsuarNlp6mCd+GgRNK3czSFLg5yH5Lm6lWVcbsq7+hVHh709umXIo1VUfGtW
         IBue3p5YSaiBf4eivTlTMaoMNYZ5wgenPr4OaTW6AATE1JsVJ/mM8jyK2A8Sk63ixY6A
         2rYb0x/FUnreu6kklrywTj6PFFaaccPvqUD4IWA/3skj5fSvyE6FLcENFTqJpwMNK6aX
         jxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764661392; x=1765266192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8G9pjf5bogZRMXI454p/BxPruKC8VaqfMjWG47FH+4=;
        b=ojiMaXKXZx08EHdYr7gFki2FfYy5smDT3SMKg7HBkvSmhSPAtHQyfkvyehXrmfYjIk
         P7MGRgdfisPWURPHs651cKy/A6ts34GEnI7bP4NXrONF3hFyfrW8iv0k0cYe46U6wnxd
         t1O/kqA7jOgY3dCo1C95+Cayf8EY1UWZnDQrgUzEA6U9wx7F5uENoL/7et/vo/iYxFcw
         oSlkVFhL9l52TBAfZe/XXrhJuC/MhJu8A/GYCH07PncyYMVh4lPQdAaqFXFBAvIj9LuY
         DggYv2ldPRqTs8BciOQEEAm8aeMy7j5Q1FCgTABCby9/XHf777wZZ1CNVU9ZQeLG4+1J
         bCHA==
X-Forwarded-Encrypted: i=1; AJvYcCUJN9t8oYeZqcgTNVAAa/r6GBb7ZngWOOXa5sRBqAMe0Mcj+Cr/W6lF5rWA1WLF8vI1BJvjdrb0OmU3FA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSqw644RIV1pfV28qhVQob7Lna7Itd1RlW0PCsiD+QLOuhrG58
	FgpThN32erlw8Vk/cpOqO0OYzGEOQqC8kSnfi1VCYeSC5LhHrouPuUqNYezXZQ==
X-Gm-Gg: ASbGncu8QaanzL2UJTwcAs9OibLqOLYl7gvfWikrvYTNTh4k82LPJroj1VkVPnGpQXK
	8gYxHbPjCwlaBe7wAVLgFT2XFIKjcd+Xq4ri+KBiUgLn66Ndbrt0jbGfIpswff/di2hh7Mfpf67
	XG6MyzXUVHBDHcVO0oUQpjPnvLrY7wglD0AhbVBvu8FDGGMtre1op6XePI5H1GFjeh+4sA8cqAE
	Q5MUIs8esqpQabc+biVqFKHB/Dipy0Z2DcV1jh7kJDx9d9gjKEqmdHeTiT1lI9uqT3EUixZw4YC
	8xpd/uGrrEFy+bDthJEx9qvQ0DqYb3ixUaLvpct2PcLLU7zSBDHZUwYW78UVWqZs6SgqTYL1qHy
	ZbQazOchhLg2/DHORrWSfe0iC8A0H1oeO97CjdWXfQzbL7kIcociWzebjB2F4inZXOMCxQifghV
	Sdx/Uyk1158g+ObMR8Gh6yTgsG4XmgeD+pOA==
X-Google-Smtp-Source: AGHT+IHy0IHWMNMcVVl7RYL1kWw8HNO3RGsrxL5xXTCokFcTdZ1HWh/lY16u/9TtGnVUj+ogZnplhA==
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr27470696a91.0.1764661392408;
        Mon, 01 Dec 2025 23:43:12 -0800 (PST)
Received: from mao-OptiPlex-3050.hz.ali.com ([47.246.101.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c2ce5sm18970545a91.14.2025.12.01.23.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 23:43:11 -0800 (PST)
From: maohan4761@gmail.com
To: pjw@kernel.org,
	palmer@dabbelt.com
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mao Han <han_mao@linux.alibaba.com>
Subject: [PATCH 0/1] riscv: Optimize signal handling with sum enabled accesses
Date: Tue,  2 Dec 2025 15:43:02 +0800
Message-Id: <20251202074303.81485-1-maohan4761@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234313_536436_756097FE 
X-CRM114-Status: UNSURE (   6.09  )
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

From: Mao Han <han_mao@linux.alibaba.com>

Currently, the signal function frequently toggles the SUM bit to control
user-space access within __get_user/__put_user.

        void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
ffffffff80005904:       44898a13                addi    s4,s3,1096
                err |= __get_user(magic, &head->magic);
ffffffff80005908:       8752                    mv      a4,s4
ffffffff8000590a:       00000013                nop
ffffffff8000590e:       1004a073                csrs    sstatus,s1
ffffffff80005912:       4781                    li      a5,0
ffffffff80005914:       4310                    lw      a2,0(a4)
ffffffff80005916:       2601                    sext.w  a2,a2
ffffffff80005918:       1004b073                csrc    sstatus,s1
                err |= __get_user(size, &head->size);
ffffffff8000591c:       004a0693                addi    a3,s4,4
ffffffff80005920:       00000013                nop
ffffffff80005924:       1004a073                csrs    sstatus,s1
ffffffff80005928:       4701                    li      a4,0
ffffffff8000592a:       428c                    lw      a1,0(a3)
ffffffff8000592c:       86ae                    mv      a3,a1
ffffffff8000592e:       2581                    sext.w  a1,a1
ffffffff80005930:       1004b073                csrc    sstatus,s1
ffffffff80005934:       8fd9                    or      a5,a5,a4

On modern out-of-order processors, frequent CSR (Control and Status Register)
operations introduce pipeline stalls, significantly degrading performance.

This patch attempts to enable the SUM bit only once at the beginning of
rt_sigreturn and setup_rt_frame, keep it enabled throughout frame handling,
and directly access user-space memory without repeatedly toggling the SUM bit.
This reduces the overhead caused by frequent CSR state changes.

Lmbench signal-related benchmarks show approximately a 20% performance improvement.

Mao Han (1):
  riscv: Optimize signal handling with sum enabled accesses

 arch/riscv/include/asm/uaccess.h | 75 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/signal.c       | 74 +++++++++++++++++++------------
 2 files changed, 121 insertions(+), 28 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
