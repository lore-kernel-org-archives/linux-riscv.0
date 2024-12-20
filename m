Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24054E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7m2kj7zrx1KP4gbuauG7JWs8tSY0HXMTAvC6/mvEaw=; b=HodKIfahu9+Q5V
	hW9ch1mM+fg94zq+MK3PclhOZfXkOAq81KM37UzsWIbwOh0NERXxm1bpKnuLKHS4AOnr+zu66NCtn
	XT2jT4PAvsQ02QaO0XMplAAopdAK+Z3SHlHg8y7pEr8Bdz1AXfZZVM2IIr4WSiuBm31TQ7R2vAuta
	CkBhMRWoLqa8+0egjUUbzYPl1ZQub0PZtzaTVV2Pgqf4tRtiP3PwZgY9Vkj+s/85+A5/2xBmKB/Te
	Pi/MqR4Y/xj5T1zbYntSaTt0WRzwsSfCRP884wKxoou3MVmSY7zKJgwRTCTvVQ6+GDDKVIcl2vKRf
	FtYtXGQu/dfPQuhQKNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8g-00000004OgP-38N6;
	Fri, 20 Dec 2024 09:17:42 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZ8e-00000004Og5-3Ohs
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 09:17:41 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-820b825cbfcso2313082a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 01:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734686260; x=1735291060; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3/pQg0zm2SguUnaI+KvC8TUPNnGrAf3nJLy+WwujVE=;
        b=lmY7uDXCyfLvNR00xR5VF6yl499M697HEGD9uOUH9EzSlvFeGKkwQzICx+cGxV1DKk
         cy6ZGDpiYWKdOrkghkj4tcaXMr8FOr9+FGYu+G3ZCTHxaYqS8gDr0FQ6Mf7LATD2yDLJ
         y8yw/2UTTYyqVPKRpM/2vaRF86T49rhw13h6CnsPB5JR/FstFy42IQFKot4Kq31NBaDy
         Xotxa7Wjngv5yku3tbVZSJFcbYMY1umWsA5BcdDh5qhpjQYdqjr7g3MyPnXASyPX6Mn4
         RA2d+6LVILbS3oU4ZwzA/ERmZLGLI+MsupNfMRQ/xviWCHdPSQWZYahMZgPjEZUZ6t8g
         Acdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686260; x=1735291060;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3/pQg0zm2SguUnaI+KvC8TUPNnGrAf3nJLy+WwujVE=;
        b=g3Ncs8i7VhWyHETxnKXWf5XWBu1MTLBQMYnv7KXu8SBG4aag9p2qcwbepkanf4+HQw
         y2SoBGqlCasQat3l3z1+1LsAorTgnD1dmlAQy7YFcLPsyiuPJxAN3G7H913QoyUseaex
         tCVDkFYk4bD8Pl0cx0ur7HXs8TcRpoAUtiAmIm26DzbcJsVJwp4OwNoMcVuGsY0uvB+t
         AKywoygjjYxI4bGsvcM5nIkT3B1dFxZwULvnRGBsYxG59VbvgycIYydphK168azRL8wd
         eBs0hVRNyGDddR/aIPIPNTBlYflXXprQUGCFDecLwQEjMxNSO3TBe+oqtExh10z51ZPg
         gAHg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ONL7ocW1oSpnnFiNOBoVfA8WebhtPHV6ApROnuEcuJsmGid7AFvKnarVYaxKlI4Y5tK7fGTcWpkZNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+pTtKyWG0f8pbxvavoGr1qqHgyGRmgAj6UZ+u+rwUMWbZVHfu
	q3mx5Vndqzwaoo+UCHu1xLolanmN028Lc20b9+7OpgqqRFcdBXJI2oqbnq9CS7Y=
X-Gm-Gg: ASbGncuymlore+su6Ee1Ztn8ENUw2/PTAkrTGQ0MbL/Yncu+tBZeBi4e8x0BEiC2uI8
	YDSutazJp7inp4QUvRFc4lkf80NjTIF3okcUzk5uVCbWAZXV9K8xykvbPm7QvVtFUzVD7HV8s+1
	kj6pq6ZOFFawRkfMDygcNZuX9oILvTy80tIUBD1hJegwjatr1T1qR58j4vfmCvUPfD+nYLREZky
	UD/WQKZcNygcugWqjw/AafFORryfA3KL8uousm5oe+7JEdQHA4VafZKz7WyyKNV5EQ24IOxQvgG
	CdgU+xQf7Xo=
X-Google-Smtp-Source: AGHT+IEpWrI68w5QRrLBoY3vfRKd52xvFFKYthd/wAZMcbSGE0+mpNFqrjN4EfZqZx+jg34DnfmINw==
X-Received: by 2002:a17:90b:1f84:b0:2ef:ad27:7c1a with SMTP id 98e67ed59e1d1-2f44353f193mr9310703a91.2.1734686260013;
        Fri, 20 Dec 2024 01:17:40 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478accb3sm2806715a91.51.2024.12.20.01.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:17:39 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andybnac@gmail.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] selftest: fix riscv/vector tests
Date: Fri, 20 Dec 2024 17:17:25 +0800
Message-Id: <20241220091730.28006-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_011740_860859_3FC12A72 
X-CRM114-Status: UNSURE (   5.18  )
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

Add test counts and pass message to remove warning of riscv/vector tests.

Yong-Xuan Wang (2):
  tools: selftests: riscv: Add pass message for v_initval_nolibc
  tools: selftests: riscv: Add test count for vstate_prctl

 tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++++
 tools/testing/selftests/riscv/vector/vstate_prctl.c     | 2 ++
 2 files changed, 6 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
