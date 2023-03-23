Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3CEC77B60
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HyQzUgmLJXdeBR0PXMfzha3D+6n8faJfIOKitITXfFQ=; b=OBXQ56uZRZ3N/U
	guI1AtIIMqp0G32SONJQznAqE6LuEd124V0+p4ANtOoP4boSvnYjdugg2063hZU6whmdTWs+Mt5vE
	PMIw75jpkMheOOiEbxp5WdfKedmV/pNgMlS4x7LkakhZZcGimDD9pPxS/lviUa7BYxZIPwR5QHIl0
	QMibgnmDJw26o5TUKPr/+NXsT1q4A3XBkUM0sZqxmBYcoz+xJ9x/tOGpEccDbtTxq0cZMGmRDWhT9
	9GfckuVhgqCnualbOjporvlgzD9H2q4eYg57s9ja4VZ4jYfk1o/kI8wTt4aqnMMDfug8xUPjWBa7Q
	EPPpJMAgXwxnEPbH9gMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNt7-002UKz-2f;
	Thu, 23 Mar 2023 16:34:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNt4-002UK6-21
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 16:34:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso1521844wmq.5
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679589238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T02CoPQSjHJPYyXwCzD6p0CGnIKFhz0kSb8bJB6ht4Y=;
        b=EUVRSjxbLKVq8hDCxjrO+6jyd+BmL2kHZodwrBzrSopYstJqfGNjdbsvfTB3pLT1mh
         0s/EBYsmGU7UR8u/QAmRPbRZ/TyjvS1nigC+yHT23S1G4PW83MoLc3GPDkiiozO4jAqD
         xQHlG/ubsdOA92CkNvn8QVIpVgwWZJuLsif2ynfXI8532m2W7/tuMJaf/kEm+uysZTcL
         5BMB36hsZQ+Eoiy08zwZgkKsoPwVqUdWs2mNmdVesyjBqx9xdUThaS87VTdwdtkZtXF9
         z2GVeNjd8QlQufpj7rP0/zEqZ1v01nCy0GxdRayI5Gr8Txk8tMrh41ci/YHrrW0XNB5/
         ccOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T02CoPQSjHJPYyXwCzD6p0CGnIKFhz0kSb8bJB6ht4Y=;
        b=apCOnc2nleRLAB6LD+nibwxExjAwQPssppKy4u4OcmP5buw2WXOHhaEBqvUtZXI8kU
         6XS6XEIPMX1cm6QmBFJY8VnrD+4DMqPnndP85KuPjq2QYRUXpIb4BAFsnvMudlT9NoyN
         7uPr0jK9FNgV4xn/DEgXr5ZWDLG4zqsQgE6Mep6GXbmitlApMM+S7mCi/7WBsyQZA0Wf
         mfoq3wlWoEpjP6c/nrY5PzKZpYHbQZiR92bwYzwOhz6+abw2UDzaT2XI0JZ64sv+n3n2
         2eTijYyoY3t2I0NMpvc7RNn68lJh0+Fy24HY58u7jLJPAtmBPKN02GeJzXbnS4Y7FumF
         KteA==
X-Gm-Message-State: AO0yUKUy+aJ3SjN1aQuj+vgzw+bhB2DBoI0pgqr+73C8y/nWDWBRQIuy
	2+me97EJ9kubEM8fUbWLeVi/1A==
X-Google-Smtp-Source: AK7set8Aj3DqH142gpbpe2Stg7uZNFfdNostTY7WbhAwUM7bAKFCiIArytMk9L+BB1rZ2e67txdRnQ==
X-Received: by 2002:a7b:cd0d:0:b0:3ed:df74:bac7 with SMTP id f13-20020a7bcd0d000000b003eddf74bac7mr171034wmj.21.1679589237974;
        Thu, 23 Mar 2023 09:33:57 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c1c0900b003ee6aa4e6a9sm2550735wms.5.2023.03.23.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:33:57 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] Fixes for dtb mapping
Date: Thu, 23 Mar 2023 17:33:45 +0100
Message-Id: <20230323163347.182895-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_093402_882288_BA359BD8 
X-CRM114-Status: UNSURE (   7.18  )
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

We used to map the dtb differently between early_pg_dir and
swapper_pg_dir which caused issues when we referenced addresses from
the early mapping with swapper_pg_dir (reserved_mem): move the dtb mapping
to the fixmap region in patch 1, which allows to simplify dtb handling in
patch 2.

base-commit-tag: v6.3-rc3

Alexandre Ghiti (2):
  riscv: Move early dtb mapping into the fixmap region
  riscv: Do not set initial_boot_params to the linear address of the dtb

 Documentation/riscv/vm-layout.rst |  6 +--
 arch/riscv/include/asm/fixmap.h   |  8 +++
 arch/riscv/include/asm/pgtable.h  |  8 ++-
 arch/riscv/kernel/setup.c         |  6 +--
 arch/riscv/mm/init.c              | 82 ++++++++++++++-----------------
 5 files changed, 54 insertions(+), 56 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
