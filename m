Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34DDC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/kdC2v5QVlXJsue2KhUeSnV51tTXwx1wCJpC/bByiE=; b=Mz71GL7Y/lTshL
	tB9nEYttEkoAe6tWorPgv8TBzwGTWjueRRY30Ms0IBuw2zqxs7PYaPrnDAYeYzJMe1XZT+QPXVe4H
	hhOOwXTTxCt46tzTgnQ7ni+Yf3JKuJ0yN8XNObJ/X8DAV/9w1Uc0ooJV3jVYeGqJYF/EP0L4SKib+
	wt/uRBUPde1KmeNIYFwhCsICvuI4F9IROr2LxdkociCtM9WYH4Jqvjv/SOUiM25wkHx8nlHNsDqs6
	ttivo84eseM+3/zwP8YVH7HHt06VF6xhhcsl+/Vlfukj4xXAh6yWZTjcc1coxHHz/2xC0lKoblfQ0
	CcaVLwqUUccNoqisSNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkDR-0000000GnO2-3Zm8;
	Tue, 29 Jul 2025 13:18:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkBH-0000000GnCZ-3382
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 13:15:49 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 14AF63FCD3
	for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753794942;
	bh=uny/SuoHIBoMNtC0T+beSanQb5XxCkus1H23LWxlO6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JtyBQUBve6/zA/lxWvnmmg9sVLogUnQOTy5WKsx499FkEUvRtlxXV2IO4G/9xrz9t
	 /k+u0MlqzDi7O1WHhqhA6UrgZYhikbfSx5Fb9VKj3GUDsn+IiVbkuGMMTB88fIkww3
	 1vSob80R4mmUXGcW4Nvy1cOhBMk++Fh4P8CqfjMHSxqYFPwixjjF1R03vnB+E+Zhkh
	 UtZy3Bz3nvv8MtNeEzPzucZxilf1lURSNdYVWKl2DhEUgPVu6nxL5l+9xE2M+zymLp
	 EQCwLniF3Fy7PkrNDlpYYAtSw4JS/P6go2XFknNJcjagK6RIxNCtObSFfYffA0e/5J
	 NIMEaGySBED5w==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so7518235e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 06:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794940; x=1754399740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uny/SuoHIBoMNtC0T+beSanQb5XxCkus1H23LWxlO6U=;
        b=Nnz+20sPrR5KKIMcM9ofRkz5/bitH8MBZYch5wKBb0F/BvokGfFi3pipEyv+QJicEm
         OsjMb6OgrvVI3kZinOfrKgNILLqP/wyVQgIAgLxzGB+PuContHpLcQENfn1qKuOlnYZo
         vFJPEjRsd0uMgPMi8tbdZmH7+TVgBLF+/ddVgU1Y3qWlHo/mh+fHY4lqGPxKv7b14DQK
         MdVNbONdpBKAbYFS9gkOXwPb5lkrm3eTpnZ3pkoA8CqRlUibZp1gSGI0mr6++Go49ekQ
         OnHvbKxjZrtdGZ1gcylifEWiBCM9WrY0ttkIQmOnJb6dvmLk4A0Le/qdewCuOSEcHYmy
         /RBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj+clyWs5JcOaYS9CZPH7k7jnYkNA8LhuErydd6Vzq8FPx9vC88g81AAgRYlz0GwrTGMzH8wk4vSTLEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxob+LG+8KqiOq7iA+8LjM8QRPmXCmK4ZoRcWUGY6aPqnl2GEmS
	gTjhUhjCTF6/t0vGufyy32UJ/NymW3NKkDwTI+t3DnbqUdTRz+hYlg9e+joejTCT1pfmDizxDIL
	ndlqzma77cvS7K8c1GYKyakfPznfIoT94gJ1FzjKECDSilo+sFG+Ai8rZRmMk6Y0zjtM06WKYj+
	dMZSpt2zM59Q==
X-Gm-Gg: ASbGnct32gBlPo9R473k/jiXTt7Gzrzl42Y8fXOS/q7ghxdc2ZSXtbIU41oCBGSxb7f
	Q4dCAkqrun7JzeoqpomCJ/CfK4dDOmjrTIPC7N8DimQgBHXBBhYkm19M2pnCA4fCzZiZSZeqaWh
	LxLCTWcqGBnl6c3nNwRJURn6L483+9GOfXWzYhqcaRAbCdwMWfTP8Gb0ix6jxmbOPDsuOwqK8JZ
	U1mQJKbJtYOQFu6dLTxsXA5j/8ClvNSGJ3bHk6ZkwMyi1QPV1qnpuYCgRpNoktpAYuG1wvaeA+O
	5rcYcbwoAoX1e/iJ94j/zO02tRcfcMuZwF0AbHB4qjpmzjHMZiXWDhEwRv2rcGX2G/N3fEEZwSX
	XTn67wbWEY8ptO5wvReocMm6XHLOQbw==
X-Received: by 2002:a05:600c:1d1e:b0:456:11a6:a511 with SMTP id 5b1f17b1804b1-4587643e9a5mr124000365e9.20.1753794940671;
        Tue, 29 Jul 2025 06:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFGFwVBVYLuvqEixHBxqvK7UIN3R4LE5ewPV8saNCAcqdz9QJsAsp8Vk+uifuz7LBLpE6WuA==
X-Received: by 2002:a05:600c:1d1e:b0:456:11a6:a511 with SMTP id 5b1f17b1804b1-4587643e9a5mr124000125e9.20.1753794940339;
        Tue, 29 Jul 2025 06:15:40 -0700 (PDT)
Received: from workstation5 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb9bdfsm12024338f8f.20.2025.07.29.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 06:15:39 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] ACPI: support BGRT table on RISC-V
Date: Tue, 29 Jul 2025 15:15:33 +0200
Message-ID: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_061548_023227_A5515D70 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The BGRT table is used to display a vendor logo in the boot process.
There is no good reason why RISC-V should not support it.

Remove the architecture constraint.

Heinrich Schuchardt (2):
  RISC-V: ACPI: enable parsing the BGRT table
  ACPI: support BGRT table on RISC-V

 arch/riscv/kernel/acpi.c | 3 +++
 drivers/acpi/Kconfig     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
