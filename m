Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AAECAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:
	Subject:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11IcY6j105REAOsod+ee1dpth0IkIGau9XozfTltgfo=; b=Cn49m6CdoQZWuB
	uC5LIcv6hVZUGuIQiEGHDwQqPz1+vli1Rtw/A2/h1BA7k0aIABWJ9+VLOgb0ZSmFJzPJiu/Xddbzy
	WKbHw5o9Z6O6uYgeU0dCIifvJ2q6se5Jfou/mPJpUced1DU3Hcv4cqszHZRBSmC97vfy+ZraXa+7M
	vcrdsFS8hOLHigOXH4+Zo57gkm0J1LD0SPEupTGeP2t6yrY6/HyPBr7wie2p8TZFL3E4HOUXQVgG/
	nIRhYEkZepTZrtqP5NUoXwK6a6wkdOQB3leKDj0vR3Z9KWfv2DFECmu33aIYy9Cn6KhtiyUUIJ2TI
	9xueWlZynoZuZIc+uJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZp-00000003Elt-28ua;
	Fri, 19 Sep 2025 14:59:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZn-00000003EkV-2he6
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 14:59:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-268107d8662so20907765ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758293947; x=1758898747; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+1oaj913MKNqaBevOphiHNrDtxzxcnVJ845ccXPHec=;
        b=JiPOg4abuySephy4Z9a0mBKX4yldLriONMhA1ZS/JHOix1MaINFNDj7zpDHbcwOfSA
         OKiqUMvzQxQWRKruKAlsTT6QvzfWBIt7SMpa9z3d2PdOWmZIElkCeeCObIQ6qQJMkB70
         8MSnPE56/IQH5fuKmwniCNMFFxFrYKZY0d18FE4MG+XEvf3g0UBhlFE85+OVXqKK8FHO
         /ZlCRLarwqCuimolm6aaFh90PIP9I7n8jfVwLK6/Ygd5GQuZ8c0UXmg3CI3zuKb0mOvR
         niOEY67gEL/K/vg2MyMkZbaPDqNK0/6lJtJnKvDSVH+o7v57V+HVzyzbAFn9iWWtZczW
         f9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758293947; x=1758898747;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+1oaj913MKNqaBevOphiHNrDtxzxcnVJ845ccXPHec=;
        b=B8ZM3R9duPZHzWJ8jX1omCPD05IaMZSYar/sXKYpEKLXTeXX9q+HZdLwZTC95lsKMb
         7oqtarcLHF4zw6wkJ24pQH7b+iskqr4olFhyBT5P/Z+o+csQOazc4eaQEmsYCzcqoBcS
         5vrAFpwXXu2ItOE4KyEqmNFyfW5TyOab6fZOsFRSs15lFNk34PgaBv/o4vherqDt3DNc
         AwjhMb1ZX1q8gC9Pw/SE3WgAznPL6IaOG3jldC56/ONvmVb+qWr+2FKzXFcl4UAcoIrq
         kSmP3wHEnQgNig9y3OnB0Ic/7DPlzWKSin7g7Qj9uDDIIqmBJCYa2mOuS0DeVioWL9oQ
         c5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1SaE0g5qGZ+QRcuyw6vsPAFiw58T9/iIvGvDMEu3LGPSm6K2Rs/BL0E4ZV4ukEbX+4gJqgYM5x5nrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx20Cc0K9xXi0XPbAP1sYNXDkDJK9b0jIFR7rlnT8d8XJn9E6Tr
	00Gml6brzT0bVEX4w3U8pFolOe2MyCUa7lldEhqkP5Ci2COgcNOLcl88CayqidIeudQqfAQBMdP
	9JzrILFg=
X-Gm-Gg: ASbGncs8u4Arjcdu+4KCHCRiRHAVLeBTmr/gstpXlwuMTXLDL0nBWdrPpi8GLKkjfPr
	3Mty/HWfv6NvcQtM1W+G/1325Llxm+OwvZ5y1jmUh/a4rYLBMkTnCd7tgdYUN1t2k3A2YnP+N8B
	uEZq6JBpE9s0ICt1w/dYEQt23zIEx9Z4EEJagGqMQM8u9JI+bLsJ/J6qyWl7j+10Zoe8GT8w/zt
	fa2qhmaw87Y9u28Czz8Rs9zBaQdJwzzIkByjacutAKKZEMMSgg+4C5r4pjEQy4pL6nfdWMfbcML
	csNX94bGen+WHh5v8dzRbLYqjqtQT6w0FA2ezPSYlnL1WY0xm/vdb+ma+s6eXl0aE19dk2p5ALX
	q2gOBLBIoakpdsMGt
X-Google-Smtp-Source: AGHT+IFH2XNQ0Gb+68hBQZkd7tDCH3mrvWozoNT9e0pDKjavSLeSa9H6Mil3NCB/34un7RaSmMecyA==
X-Received: by 2002:a17:903:1b27:b0:25c:d4b6:f117 with SMTP id d9443c01a7336-269ba516ebcmr55120545ad.35.1758293946805;
        Fri, 19 Sep 2025 07:59:06 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035d6f4sm57419645ad.140.2025.09.19.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:59:06 -0700 (PDT)
MIME-Version: 1.0
Subject: [REGRESSION] riscv/for-next: (build) in arch/riscv/kernel/entry.o
 (arch/riscv/kernel/entry.S) [logspec:...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-riscv@lists.infradead.org
Date: Fri, 19 Sep 2025 14:59:04 -0000
Message-ID: <175829394418.360.3276606458893597704@1dfac204f25d>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_075907_747577_7D06D153 
X-CRM114-Status: UNSURE (   5.38  )
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
Reply-To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org





Hello,

New build issue found on riscv/for-next:

---
 in arch/riscv/kernel/entry.o (arch/riscv/kernel/entry.S) [logspec:kbuild,kbuild.compiler]
---

- dashboard: https://d.kernelci.org/i/maestro:b5288fe5157b1f4b4c95bb5102588c7874794ba5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
- commit HEAD:  a054965b36af884083add1a286cabf98caca549e



Log excerpt:
=====================================================
arch/riscv/kernel/entry.S:458: Error: unrecognized opcode `alternative(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp",0x489,0,1)'

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68cd6d0c75b320799d2ffc60

## defconfig+CONFIG_SMP=n on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68cd6d1075b320799d2ffc63


#kernelci issue maestro:b5288fe5157b1f4b4c95bb5102588c7874794ba5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
