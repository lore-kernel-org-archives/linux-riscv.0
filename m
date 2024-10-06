Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF1BCFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LpkNEAn88oMBnwOiX0xru4bnlW8AB807gwFds3XleJ8=; b=Qp0fohn7j8k/1q
	L3Jp858BT26DGRkl4SCtm2E+DAhmXJyl+ph1ruYKuQFeRviFS40a66YTFjuG4P4mMKJLR89lrhJVB
	nt2hNwe4jybFP7lAys4mttJvJFSJ/dHyTFePYTC/iBr3Jt5xLYy+KIha86uckrU0RMX9uItlMZxpV
	hKDN5aeVvczcyivdkHXAgqWkhcyZSzfdKFsWz+CGY5fqvAiaNowbSG4nFcQev8sfnIDw//0uPfZUO
	lGxU98yKdpk1GF9EP+Hf+TurUdIjRzH1aFBfqxgmZSBntsyWqm2806VIVpMSQVzlOBGdKlPFuw9IK
	3EsUPFxPzMPjTii1usoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVI1-00000000Lmb-13n9;
	Sun, 06 Oct 2024 17:43:29 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxVHx-00000000Lkx-0Xwo
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 17:43:27 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so995159a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236603; x=1728841403; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spALRDUsYOwVLjrj+itG5SK1W6mJ4BemNUJT/dXw+2w=;
        b=YhhM8wd865jZNiFdF2aje9tzLHBqKR/hyCB56gFMcunwemJfIyBs7A56WR3XIB91rx
         G/Mh2FRI5qKDq5IyOU1n/PSHjVMN3Zil9UaqUHYAavgp6PsR8Eoq/duSl/JS2G4fHCtm
         jEEpbMgm1mFP5cx9urYzVD+4k+jrL5wjU+OKY2NTYAgXN8KxeGsj1qp+6r9jnnRzlXcx
         kX68U9Dg2urMUTjBCYOPK+wn6bC1ZD0LCfOm0wp/BxXNU8wbiUt39vBi6fu5PwFnX67G
         wUaK6Y9Fl9iPp7kMndXI9trOO4TQTGWzdGKR2fYkdSnvfKrexlsnG04/RMx8gic+vQC3
         XKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236603; x=1728841403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spALRDUsYOwVLjrj+itG5SK1W6mJ4BemNUJT/dXw+2w=;
        b=aL1sCjve/IuO9LZKuAyaViLew84ssheqYtzgD//a7M1Jqo807gDIHeb2hpfsQN3mCh
         SSRaI0oblqiJfqQJTDs9Q/j4pBKxgmZhZtTEAwQ2u1BMDIJ7omCqVEpbCLPw01g5uLsj
         D8IazzRlK7hspLNyDSeRoMxBueODPJZegYHoUTC8EcTb0iVxhdc/5kpKATuu38yady29
         z740HeSskvAWvrbwr6kj6FQYShmh0fW4XjBDI0mjY/SX/Uic8N7R8lLhNUVIkVyuz8+J
         vhZNY9YNiMrfbp0Ajz21qkf+GNKqjaqwbkkFfDHCJLRGfS+YQWPTAyafyYeTsn6Q2vMM
         E9ZQ==
X-Gm-Message-State: AOJu0YyAoXOfY5x0Pho7hd+E3KW1MoGpPlcr1qZgcX1jgHlKiSqeo1Pg
	IOjp/rNFELtCQacYWyWgg4ZUI4H4tO1UJ9Tz2uHvCnN4eDbHh99cELP7Dj5AeF0=
X-Google-Smtp-Source: AGHT+IGMq3wabIJdCjVaKWXN4FS9fMNNTljNtGBedaNmcPo1nYMUBIfKrJpWTH3HdQf2za7dBdMOLQ==
X-Received: by 2002:a05:6a20:6f91:b0:1d2:f00e:47bb with SMTP id adf61e73a8af0-1d6dfa417a1mr13006921637.21.1728236602914;
        Sun, 06 Oct 2024 10:43:22 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:22 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v2 0/3] pinctrl: th1520: Improve code quality
Date: Sun, 06 Oct 2024 10:43:20 -0700
Message-Id: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjMAmcC/4WNQQrCMBBFr1Jm7cgkmlhceQ/poiYTO6BpSUJRS
 u9u2gu4fP/z/l8gcxLOcG0WSDxLljFW0IcG3NDHJ6P4yqBJnxWRwTIoowknia6kFwb5cEavyT9
 se2ovbKGqU+K9qOa9qzxILmP67i+z2tI/g7NCQuOs8SH05IluheO2kTiWoxvf0K3r+gPvOrexv
 gAAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_104325_205983_54A1197E 
X-CRM114-Status: UNSURE (   8.74  )
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

This series contains code quality improvements for the new TH1520
pinctrl driver [1]:

 - Fix smatch warning that the return value is not correctly set when an
   unknown pin error occurs
 - Linus suggested using guarded mutexs so I've converted the thp->mutex
   lock to that usage.
 - Linus also suggested using a scoped iterator for the DT for-each
   child node loop: for_each_available_child_of_node_scoped.

The series is based on the linusw devel branch [2].

[1] https://lore.kernel.org/lkml/CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Changes since v1:
- Move the scoped iterator conversion to a separate patch and remove the
  child put operations as they are no longer needed
- Link: https://lore.kernel.org/lkml/20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com/

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (3):
      pinctrl: th1520: Fix return value for unknown pin error
      pinctrl: th1520: Convert thp->mutex to guarded mutex
      pinctrl: th1520: Convert dt child node loop to scoped iterator

 drivers/pinctrl/pinctrl-th1520.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 2694868880705e8f6bb61b24b1b25adc42a4a217
change-id: 20241005-th1520-pinctrl-fixes-d20db68387e6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
