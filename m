Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6CE77182
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/WjvBFd0/ZaDglrYGkjLlrh0G4zJULjRfeOv+/KJvdw=; b=ULAGRxfcrYWN7p
	of2CiYzdeRKhFuAX17/m1wu8zFfttSboWkLTERkgKBEuluZpLjHmgthI03llH8TVVBvze6votX85s
	Ss6S5sE2cPLFuNzFeKv1Ub6fzOCzXPo92tUgC/Tfz4hqRzjiIfLFkebyYzYjMrhA819bzKcVh2Kxr
	CbvABz2BJL0cEdxwUD9fRY62b56i3piMvHvhx7eIxNMcThjohwBWEY74A4xqqc8Mc4u8Fcj9NGo5N
	s9kF0uOr8evf+DOoG8JXO+TT0ofP+YE9CwI0X5WaNeOMtws14PqUhS+sFntqBA31j4lbyxyzuoOlL
	bAPGYpuedfa4JeC/a+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Pz-0000000BoBc-3FCm;
	Tue, 10 Dec 2024 14:40:55 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL19h-0000000Bk8Z-1REm
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 14:24:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-8019338c2b2so437186a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 06:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733840644; x=1734445444; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfNaO8Mq3fUpMH7rj4C1ZxDplvSUEAGODha6BIuTIq4=;
        b=WOFtfaJohp+58XvWfcOvZE4lc7pAKbqRo4AWJRsK7asiMHMbskERMejoMFBliv4V93
         skidQmwHOp/V3e9DIby3S4zhfUjHMbvd8wjAvZ+UPVN0kqW+oVXaNuZKRAC60plZfIeB
         yUzy+eU5kBJba+Xs7nSSJIYixTFeZFeLR9g7uDI7nE/E5FFE7kVE//PVeqCwjdc+R1co
         dMLgJL7KEFMzoGvZknN5KnE5Ex4FWTkI8l35NoP8tk9L2lKlW3AcR4MOXkEekUBgdDMw
         vZyGG4Adf2v3w02rwg3oEeb2A9DwZTnm7JiaKuJH+RvFa3q3eAf4vKroO/jMU7qFOyHM
         LSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840644; x=1734445444;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfNaO8Mq3fUpMH7rj4C1ZxDplvSUEAGODha6BIuTIq4=;
        b=aFuAZkKlIlDRNlOVH6AaNWFYBbcMyLlbe7du0QAIOTWjvNtCf0rvBREOx8DjrIfL1t
         oyScTgBmBkt2ucxl1jl77du2dkcJKFdSwYsFdVlj1wM38dfK8gZ/totkCVcFiQZM7UZK
         15LNDLE5mMudLRtdqoOhNgyPiWMJJiPRTTKiRdaN2P5j/7ZgQnGO/byruzTNsEmB3IX5
         IuD+aZA4YkypUONwGhLB+ppsPxlRvEfT/l6hdBWM3pcn45AH6Qrh5jjnAEPwagimGH+C
         UVncGoaU8sOqNfuk+geDCmpHrCQPDQ319/zpgVPI29xbZe1vwxZRGZUTYAT7jQGL7rHI
         WbrA==
X-Forwarded-Encrypted: i=1; AJvYcCVEJJ+wbUl9ceTT9AoeWnmaJBI2fZYpFdTFOwS+5r7ErhkKI9CTXBKLY7I5htpf91/tl54VWz8hAndsMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqAf6Hqbn+gJo1NM7UFgEN1aUX+na219t0gVcphj37eF0zYP+
	5yZ4QQ04WNOhaUyyq39e5kPMKZbt8OTwdB6l4NpPLHC4hASHIO+Aa0YsqbN0eQDnyrHVcN3Rd17
	hIzo=
X-Gm-Gg: ASbGncucH6ZADhjR2S3AVxQdktRFgmpCDoTNTJTn9qU7gHt4tEWmRw4u8tndYEgiiy0
	IMNHQwfut52DbSlcfGkLIcQ93VOqPvrhjJVzUkWhkodbdx+og+3k3sv7QiN4I+qgfgmQZLRAyXC
	cjDkBp0shUmqXTgKxEgmRMrxuwMzuAmZGparVf7y5hWF2MjM+JwW6LTBOMkeMLrT/eT2zyVngnh
	6GKMeeD3YzRjoHCma+WgxXcNaYY8JKJ3InFjlJ+H5dgHkTXZ5f/X8gwTDjpNImTmQpSMPV11nox
	Fne1pFRY
X-Google-Smtp-Source: AGHT+IFnc/zixc/JgDTcHtzlQVoMukDdzG1nRXyNA0lRBdlSoY0qXoGZ/QEbwpUGsoPatPxmJpVdEQ==
X-Received: by 2002:a17:90b:4d0d:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2efcf222499mr7432347a91.24.1733840643779;
        Tue, 10 Dec 2024 06:24:03 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7315fd3asm7538444a91.44.2024.12.10.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:24:03 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] riscv: signal: fix the size of signal frame
Date: Tue, 10 Dec 2024 22:23:48 +0800
Message-Id: <20241210142353.6457-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_062406_202745_8A71F580 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series addresses two issues about the RISC-V signal frame size
calculation. PATCH1 removes the unnecessary header preservation for the END
header. PATCH2 refactors the estimation of the signal_minsigstksz.

Yong-Xuan Wang (2):
  riscv: signal: fix signal frame size
  riscv: signal: fix signal_minsigstksz

 arch/riscv/kernel/signal.c | 46 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
