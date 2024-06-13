Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB9EC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dtw3VJw34FAro7HDkJl3LJ/EhaBVeXwQ8ixIUq78L+Q=; b=CuA+AzxvnNZ1w3
	Pne7fOkExv+Bu3qpVdtXa/muFR+uy6eVJuCH+407oCiNIjCgORev5XtsdW/r/rylW15LWEvheZavn
	SkiM4NB5TUi7cYVsYpc59mHTI9VvaWGSINvkohRH+swyJPDHWmlipLmZ6XTCJJj0CwUViRSJSIKGJ
	uCXYMJ6dibkymY70poDDMos8/NjDQv6U1ybXM/7TRktPf3hq5QFQUhBFS6QKFg/Ex5PCUfEWEHRzp
	XH33cmR5V5RMdh0VcZKGw+3kxyIgA/vyZruuDlmu1W51wrV2iQobHEy9sh3FJSxcXSP+iz1MdoPmm
	wKHXywIIWg6qvb/pbhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2I-0000000HTv2-3862;
	Thu, 13 Jun 2024 17:14:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2F-0000000HTu3-0IfZ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:14:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f6f1677b26so9711925ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718298890; x=1718903690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2wDR/+ZeAebK5DODzchlpSntyjHtjLusR3FVcp8fSQ=;
        b=fOsRS330hGPoN9EnInmktHEO5MvPztXMUajJJU02l7JMQtVjQAT8Mc2aWhiNvnRBsH
         p1RyQVyilVEx2ou1pCYc+sjJIdqUq0Vh3ZWuOQOgFRdXjoM/EgUu2xXcId+o/5rExY5/
         9pTdxu3RWlh/bqcadAEvAIZDcKlVbZ2e2bxNbypOleB0bFFGUx0b+wKluimfFDkJyQXo
         jTba6xJwPNdjKUkaicrIU11c30ra7TTcuCWt7cB1zXp7zfqKZK3YsAmJ32Ybrk98efal
         iOYMxH51b09XdIEhtunMKisbSjaUNnxp9nTepL7ZUuhVr9GmKpi9zyOGWgDxvByXknNc
         cXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298890; x=1718903690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2wDR/+ZeAebK5DODzchlpSntyjHtjLusR3FVcp8fSQ=;
        b=jw5SSoK1kEvBm6uUUAM88oCPL5h3dTFqt0urv18Xr0H79nrVVX4MKZG9ilqQYmcfF0
         d8Bsv5MD0aPlv7oK+GHgcTnttR3bqp7gZBWwXTdq2BWBeD7XA3fF6/0vAMWFc29QTEJC
         aEbzVqIZtfzW/5sbsnahk5jIu3JTMwdkcUzDzXgl/8Q8hk5o1axVyewFB7qVNfE0rETp
         LppBiguw6mbrm/a1kcbE0//s4adxEfSqqxepvmWRtvGJnQTDcFqgKH0CmeHTAwToG2H5
         quUeEEpRDL9wpCNZxE/mcNqGFygwxrk7TQ0hLfZCHEP3yJObICIGS6Myi4NW6JApEzmm
         cZXg==
X-Gm-Message-State: AOJu0YxlOvlmn0R4q6/I9fZhPdjpYM1i2Sgle/yqbjq/HtLazGzYUgzn
	v4bjsVeUn0tKsRORDpvkkMCIm68sgsigtyLdaUR41AOxXM+CSJntxAf5B+M1h5ubypXjy/Ub7BS
	p6Oaplbe4/IZpVTGjco8db0wNzGVvHU8kZ+dzn0LsqpMVgc4nMnA/slFh1/jRMZ3lr6RfU0lYKS
	b7ANC3+1m0lKu+b7a6/dR2mj3lZ8Ahhb+4XE0N4OEYxaEJhFJODRXlmR6R
X-Google-Smtp-Source: AGHT+IG37+Td9DpTmKs5rXmk9tbMejKMmjWuqEkRqpWcHWftONKXSPsxc0L3z6Ewm5r4pqA+GEmWrw==
X-Received: by 2002:a17:902:ab8c:b0:1f6:dccd:c6db with SMTP id d9443c01a7336-1f84e532b17mr35415865ad.30.1718298889625;
        Thu, 13 Jun 2024 10:14:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55eb0sm16445035ad.18.2024.06.13.10.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:14:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/3] riscv: Per-thread envcfg CSR support
Date: Thu, 13 Jun 2024 10:14:38 -0700
Message-ID: <20240613171447.3176616-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_101451_206021_DB05FAE2 
X-CRM114-Status: UNSURE (   9.37  )
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

This series (or equivalent) is a prerequisite for both user-mode pointer
masking and CFI support, as those are per-thread features are controlled
by fields in the envcfg CSR. These patches are based on v1 of the
pointer masking series[1], with significant input from both Deepak and
Andrew. By sending this as a separate series, hopefully we can converge
on a single implementation of this functionality.

[1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/

Changes in v2:
 - Rebase on riscv/linux.git for-next

Samuel Holland (3):
  riscv: Enable cbo.zero only when all harts support Zicboz
  riscv: Add support for per-thread envcfg CSR values
  riscv: Call riscv_user_isa_enable() only on the boot hart

 arch/riscv/include/asm/cpufeature.h |  2 +-
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/include/asm/switch_to.h  |  8 ++++++++
 arch/riscv/kernel/cpufeature.c      | 13 +++++++++----
 arch/riscv/kernel/smpboot.c         |  2 --
 arch/riscv/kernel/suspend.c         |  4 ++--
 6 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
