Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4C4C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0H/paltnywrutOrwWMLgmSJCNXClezhK2+5EKqWbwb0=; b=f64WT1XXcWyphx
	IJZeFuc/C1ytO+MZCoGv9v/rBlOqQ3GmoCJ5reNjztRb54EL6XuBj9usLBA9lUO5ys79nl04u4Ruv
	Zj6jG2c16OSeuy/axFOYuYR4IU0GYih5h5Kh+W1qzZ5mbdaLO2jLtvEjMjcb7CP7nsMsBy+ilHreE
	xWlKmL/4CfRjFYIHe+J16Hdl03CRYGRpk349OIIcSmvxIRAi2+rI3SMP+3BHmk1pkr53k/IzTxus/
	AtiZC+og8ARus/gIn6a9Dk33cJ4q3B5kwtWWvjaCCSFXrh+kD26M9G9V/rM5FOJlUqFWzAbrXuks3
	gZlFEDjoLqrp7sKtX68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1L8-00CDx3-KD; Fri, 20 May 2022 12:02:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1L5-00CDvE-KR
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 12:02:41 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ED1C93F1E3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653048157;
 bh=SOKFND/5FeQvd5cQ7sqJ+/KtvRpaDx5IOMydsT+KqBo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=kxEEy8oXW1NyhCyeG7spHsnd4+JYgbqmSFFrUDe7suwOpu15ZM8mb3PHg2NvDeaZZ
 wmxcsTPd76W3Hyw9INd5hNCX/R+gzZsVQqDYkJtt8xmsksxFYfRW5b+IA4RnstXU77
 6qEpRm/drDOebGB8WCzFSf1gS7AhwQ1rX33kJj+NRy8yRDxTDrwhrzaZCE/VwxKEod
 NAmlhHWSRYZOlG5gND7fbfgGp4MMMWtYszpudyqufK8F8oSBltWNQT7RZ4Q54XgyNG
 yuEAHrN4bkVof/ikWPAHYrcZa1fXZ3r7lviPTS3tiYLCphIKsDheQYnHdwJ3o5WPqf
 7j/LZqMbTX2EQ==
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020aa7d952000000b0042ab7be9adaso5509286eds.21
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 05:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOKFND/5FeQvd5cQ7sqJ+/KtvRpaDx5IOMydsT+KqBo=;
 b=GyVB59/ZRebJKuz6X6v/EE0M+0mmfipn90fJWEAsSgh5Cvy1lDWwkVPWLLyXsQ2wRR
 ff6mR3rWK3T0eu4M8ZH04Bb1Wu5YbEOL4sP+YxQFZGvoKalT/VCXQO8XXmBhWN6eg1vY
 1R6vfn4pbvr/uEs+rdKkbjxVZun/Q2+P5pXzs6tbr2yA79EDgo5ZioBI4l8FDuqraYeV
 kC7UoCJcQle5BBqWrdmAvf3lnsTEWPKCuFrw/eZCiGa5Ay3HySNbLzFLBsO9/KQ5Mamx
 K9jP6AxfXXsAtZDQH1ZiiglwE4CNhrCdFwY0qOmmpbu97HQDUKPSLyRT3qgiIZ79mjgF
 AaVQ==
X-Gm-Message-State: AOAM532eWfHKEuExhgdp2IrVNdANLhGmhDp5OisQUS4DcYAFhpyKxWB+
 PvotK84VeEpHvdtFUIBX/Jxf1m3EbBDQ+ZKfmkOwWSVtrOilonXAjyUpi3wlrdLIASU8YTugaX4
 cAmb5f/YMlyl3oYRhVOxQ+T4PHNccTU9o7K2WRsnqZoISeA==
X-Received: by 2002:a17:906:6a1b:b0:6f4:a9b8:e027 with SMTP id
 qw27-20020a1709066a1b00b006f4a9b8e027mr8471002ejc.222.1653048157585; 
 Fri, 20 May 2022 05:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLBhZtS2l7rKcQpRTvVrgQN0WEu69u4UF18Vcfyzmc60qHzg6vYZFA3fGd9KrMJqNRMGXu3Q==
X-Received: by 2002:a17:906:6a1b:b0:6f4:a9b8:e027 with SMTP id
 qw27-20020a1709066a1b00b006f4a9b8e027mr8470909ejc.222.1653048156437; 
 Fri, 20 May 2022 05:02:36 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 fg22-20020a1709069c5600b006feb002a620sm560042ejc.1.2022.05.20.05.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 05:02:35 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 0/3] riscv: Kconfig: Style cleanups
Date: Fri, 20 May 2022 14:02:29 +0200
Message-Id: <20220520120232.148310-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_050239_860957_F85E5F66 
X-CRM114-Status: UNSURE (   7.81  )
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

The majority of the Kconfig files use a single tab for basic indentation
and a single tab followed by two whitespaces for help text indentation.
Fix the lines that don't follow this convention.

While at it:
  - Add trailing comments to endif/endmenu statements for better
    readability.

Juerg Haefliger (3):
  riscv: Kconfig: Fix indentation and add comments
  riscv: Kconfig.erratas: Add comments
  riscv: Kconfig.socs: Add comments

 arch/riscv/Kconfig         | 19 +++++++++----------
 arch/riscv/Kconfig.erratas |  2 +-
 arch/riscv/Kconfig.socs    |  4 ++--
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
