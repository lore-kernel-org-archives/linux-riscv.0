Return-Path: <SRS0=tGDq=36=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA8C352A1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 05:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4CF20661
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 05:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cc6BHjRC";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f4x8c13M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4CF20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E/VM1VIJNzEuuZ+My2G7oPqQnJ6XIahBlQ6fOgNUJgk=; b=cc6BHjRCzYxaJG
	aT8/3m2aWI5Gzrn/oT/CcepwXCROa55RfAwgWWccDp4icKcW39oMuKfX90Hr6D5X7eL1c6TcaN2gX
	qeSnimthUhj1EAeEIN43cR8LjRi6ZLmMlK7DqJqu80vNa3Gt/XphWDlThx6y5cjePosXbFnqNkjL4
	aCBkpsJEiWh3OEEHv7jDGtljKaW1xGpE/f2SM/WiPVNK9WlD/RKLrT7zMkRh06s78uinse3ohzCBQ
	SmW8nl/6NKzEr+IFbaX2JfZyzL0RgkB/g49IDpipjxcIBNQ89OUG/vGKNQfEFAIDxpzCnh7ECS25k
	Dtpsyk3Zr8dTiMff9gbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1249-0004WP-MG; Mon, 10 Feb 2020 05:57:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1247-0004Ul-0R
 for linux-riscv@lists.infradead.org; Mon, 10 Feb 2020 05:57:05 +0000
Received: by mail-pg1-x52d.google.com with SMTP id z7so3310478pgk.7
 for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2020 21:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/VM1VIJNzEuuZ+My2G7oPqQnJ6XIahBlQ6fOgNUJgk=;
 b=f4x8c13MAeeRWRE4cESjejgYpW8BMy89yubG0jl3pkGqZ1l3BpMaqE2eN0COkIjZXQ
 L2odcUesg5+HQEcK78+wSYQmtp8z8Gy4oXXGH6ZhnK21aX38Mvmu8hXCenb8tcz0xIBb
 EUcNz5ka3UfRLEwSpCXWCHcdZ8xpQRRRqzHwt4eUaUgq45T0ER6LNXqwaH/CSvlxohVe
 ija1t9Ak+H6jDWHFHZMDKzS9OJBaAtL5StlXtAod9aBIB51y9XxMhoI5D58KD/wIVV0o
 Jggs4xxJCmlQI+qMRdM5IpDaqk0NIjpW2HqHBpjPAzL20Dnp5nHt41LCCeJPnmJcCcH+
 J7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/VM1VIJNzEuuZ+My2G7oPqQnJ6XIahBlQ6fOgNUJgk=;
 b=Yyzhy8egVHcUa+RcoR7+LVhb8yAHUaTSTEkJzr30nPqybR/qbkxrpEmySkdsNZozN4
 lqqs0hU9OLsWkWWnwW8DvhLUF4TaC90TENTSTHqMz+Kw3OL942d/yp4hoYeE7UPQdTuH
 shs8gncxHeFsSNIKQ0F197HeodXi1JjB8rsGQywujFXWHaE6HPTPas3XMKx92BwpJRue
 7jbeNjUbpy4SoGPIbSwMUz86V9LacXUKN1s/8wZy4Fl0PUN+N08L9LgQgg1rtK0AJziR
 MhGkQ0Phmn8Gtix95YGb+CrLAfJ/fkqaKX1XEZlboFwORsNFwxbQioeyWu4pRXOTGdFE
 A5MQ==
X-Gm-Message-State: APjAAAV1SQnQ9evoHoAcK8UOz/eOaJGXmJn1n/ehO4ROV6/J6dGaGYZ/
 1p0DjN2Bq86Z+rxjYFmAdWkmrw==
X-Google-Smtp-Source: APXvYqzKCQtqeLg0NVznbLD0s02+5OHmTAlMqG17cDflWCMm42vMxyWJChROG2vETZe5m4r1mKU/rQ==
X-Received: by 2002:a63:d705:: with SMTP id d5mr12507113pgg.24.1581314221556; 
 Sun, 09 Feb 2020 21:57:01 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id s206sm11140234pfs.100.2020.02.09.21.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 21:57:01 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 joe@perches.com, nickhu@andestech.com
Subject: [PATCH v2 0/2] Fix the page table size of KASAN use.
Date: Mon, 10 Feb 2020 13:56:52 +0800
Message-Id: <20200210055654.96725-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_215703_109140_17B3FBED 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Each page table should be created by allocating a complete page size
for it. Otherwise, the content of the page table would be corrupted
somewhere through memory allocation which allocates the memory at the
middle of the page table for other use. For example, if it only
allocates 200 pmd entries memory size for pmd page table, then the
original 201 entry will be used to other purpose, and cause the
unexpected fault when accessing the page table.

Zong Li (2):
  riscv: allocate a complete page size for each page table
  riscv: adjust the indent

 arch/riscv/mm/kasan_init.c | 52 ++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 22 deletions(-)

-- 
2.25.0


