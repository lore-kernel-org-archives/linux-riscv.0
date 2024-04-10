Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3448CD129D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BescdeyOKIZu18NIGjT5twdWffeYmPLU1P/nMTkoto=; b=UmKjXm4w4/SiQ4
	Ig/v4mWTfpnbKpe4P6LaujeNHAEZAVev+sjuMoIKX4G3A6T0A5424N2FnUtNBl8czyb8gPIoAzoEZ
	2OmR7VO69p4Pzn60GLHz7JLzzZVI26nJfbu2foHhzh0woRvIPZj8BePQE/cMOeU3Dmw4tPvl/UWIr
	IJ4h5QxSTF/YtaxDKZfsLYFypvAGPqSc5C6PPUKiADRo/JbbP7B4MPfGE5EHw+BRkhTfPwmdVLpQn
	A1ixpKsueoxmgYvGRCiU6I/MxCo8iQcC64myrgV323rmtZqeuIQCyRXPsXFxc1sCsOLB4L+JrCAK3
	rZyHQWds2KXiFjPyRhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGl-00000009QXl-1iMT;
	Wed, 10 Apr 2024 23:22:19 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGh-00000009QV3-0aMt
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 23:22:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso5592541a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712791334; x=1713396134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGK4SWuPfM0vV+la96MhcpZ8ztiKT+W2nuURhMgNDV8=;
        b=ZbejQXLs55fvoyIDvsSn9vKW7j23sdyWrQK4lOldnRNENpOVP9hVTWkeFky4alZChs
         4wrv6vNdWNwZOmz8dHB6F11GKXJpasCTsijtIUCI0rPs3zDxxdSGcJ+RTg5nJTrdwYVF
         MFm/d+Ndy3fjjIksyS2A34T0A+Z9mKv4Tfy3GArBB2vWQDpW6sQr0K10BVpUPkf9F29+
         UGQOTZwOzn+bIWWpc8eCmYvSVhrRfOLKBcyNitos0pao+5pue+Bs1VyQmttA5KXd/hEu
         KCdEZ69qhkT+EgmOelidhdVESULTwe/oLBcdirrA75ZqG/mJ1oRwFIbVnCifwijzqRUw
         YS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712791334; x=1713396134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGK4SWuPfM0vV+la96MhcpZ8ztiKT+W2nuURhMgNDV8=;
        b=s4jZ6XXN9ZWCCU5d1+RHrYz7Nwv3epHO/2BUxI2heFnNjGAteBi7sH1M63456O5Ri+
         js7971PZkuiXXSpFkx6/3TuyeyWQvTSXHuXLZyuxh4FlJ4AsPLu83flxibgfciVtzsFP
         rE8VTHOz+jxEtYzw3aBotq90rRM7l7hsNBqxnL02qofUiW2Ik9WyZKkj4tvogxbXKdnQ
         avohThpowdVl3TT1SQqG8ZzR7IirWMEnDIIw7+XzlcM+aRx6iCkk6GCP0bQGuyvQl5IF
         drEfW67lfRT0wO7pT9I7pOc9yOXCtnh7khWZOrkau7ZRFmxPGVtWv9KYP/8DyB/iikey
         ZqPg==
X-Forwarded-Encrypted: i=1; AJvYcCWACWsRin3i+2l0eS0nBWwLereYzkn9QmkAWuQrMf3YDmxYvLHuYHYoHwBBY49B8FqtcyjU7SyiHnlpPElpeQxklENanG4vROSSxQocOsnE
X-Gm-Message-State: AOJu0Yx+yvrACfJOY9yMhP3sD639HPdQ2qXSZyfOskCsDHefdfGrKrPb
	ysl1VzKGOy3ApHdze8gT6gtxr1btyqBXHEXp/d0H3tG6VEEg4zodG0Z7YNMkirI=
X-Google-Smtp-Source: AGHT+IGTfMmH9J6bgqBOBzgLbzpJrhS/cLoXAl3L6QF3WCUCaGsZwjRjRVxiKnm08Pxdo9H0G41t7Q==
X-Received: by 2002:a05:6a20:3943:b0:1a8:672a:3fb2 with SMTP id r3-20020a056a20394300b001a8672a3fb2mr4887983pzg.43.1712791334017;
        Wed, 10 Apr 2024 16:22:14 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm161865pjq.40.2024.04.10.16.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:22:13 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	kernel test robot <lkp@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] cache: sifive_ccache: Silence unused variable warning
Date: Wed, 10 Apr 2024 16:22:03 -0700
Message-ID: <20240410232211.438277-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_162215_199713_BCA18375 
X-CRM114-Status: GOOD (  12.12  )
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

With W=1 and CONFIG_RISCV_NONSTANDARD_CACHE_OPS=n, GCC warns:

drivers/cache/sifive_ccache.c: In function 'sifive_ccache_init':
drivers/cache/sifive_ccache.c:293:23: warning: variable 'quirks' set but not used [-Wunused-but-set-variable]
  293 |         unsigned long quirks;
      |                       ^~~~~~

This is expected, since QUIRK_NONSTANDARD_CACHE_OPS is the only quirk
still handled in this function.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403311253.Z4NvIBxI-lkp@intel.com/
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/sifive_ccache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index e9cc8b4786fb..6874b72ec59d 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -290,7 +290,7 @@ static int __init sifive_ccache_init(void)
 	struct device_node *np;
 	struct resource res;
 	const struct of_device_id *match;
-	unsigned long quirks;
+	unsigned long quirks __maybe_unused;
 	int rc;
 
 	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
