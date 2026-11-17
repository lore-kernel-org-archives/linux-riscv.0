Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED623606A8A3
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fwp7zUzH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fxs633Fv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E0In3oPsei94N0zVLKuvdj2arB6E+x4duiH/YUg1X/s=; b=Fwp7zUzHU/WhXKRp15w19atL1s
	+U7vQHx194vc7qem132a5Ceg1MF0kZwuPoXOoOp1E1D/eYJ5cPN8Xp97TLpEV4kKRq0CoX87/aMrp
	Bch2JpyKseAQ4D6VXhjmivNZOsJsOvB3huifng+VEwyHSGh9D4BHL/QyPOa7NstwBGiEmi3n/3dZZ
	RcDU/jMSW4zaEAeQzxqPq9uIDCoIbYPM07CdrQGNL8Ez+BCP4fS6DTudVambVe+MvwvvVm8Vnv4Jd
	Xs/PG1LPhUh4s7tMioDLlgS7u1Q8wEPPYDwYjjNZIH2CGfM6QTHvREzf5DtZNBi43ilqYvhxgVjfA
	zAnH5jaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5r-000000066qH-2jyx;
	Tue, 17 Nov 2026 14:23:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5k-000000066fR-3DOV
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so303850f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 06:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925402; x=1795530202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gu6e45ESjZegd8J7v8Vs4ndLsJawc0EC2FemgxWZCFU=;
        b=fxs633FvVcn1/yZqX2+SlJMlXcJjc7WmvioFNG/tLl40e1iZ3TGAFuJDPof8hEYDWS
         sqUdGHa6Awu6z9hMyDub0cunZyAOXFBCPUjYXyaITnONzmOIY8Ag0bZ8hkyZGvXMsciB
         2F4sSYWfo8FIBGSm/Fo04oP8zx0dGdBU27WTFB61dj5u96v7+dXcoMV1U3AqUjXK9qft
         SwiHVCCC1yfIxz9l3/iUJMtTIV6IDyV72SLbVrKKcCNcSKfGVEK9UEBmtR+3Cx4vJJSJ
         u2IGFXIQTpI+HKoW5RByvvFEp4mCyylColucYVth5AlGXH+RxnXi+nCTvMOaVVwdwnta
         aqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925402; x=1795530202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gu6e45ESjZegd8J7v8Vs4ndLsJawc0EC2FemgxWZCFU=;
        b=ryTJwXLqDnGTRi6TYLQ8mSyHQ5kQKG+dXUqu9fNvb8N5oImvZFfedJPbhOiTcWOfz4
         an6TTy4ECqf3pNZhP4jtGCpSN2REequeRpUJaN0vu2GHgfkRw3eyuoypMWX35vJlZ3Zv
         ZlhOh2gQsCaQ/63x9IfL+xHjzys3PT3eYPAcBg7/34boz+gv122J09kq+R5xSjvs6raJ
         TGNZgIKS2/fHKoWzO8vN+jQLHUxqxejKDf/LgQHkytoZ5twHUNwO6OH68+eTBAAotnck
         nB2fixL+oe5l6pYZZ1kIovI/3tSaHJ5BhblMZTtH3HQ9hZouP/b6P2PfhTX4DU8LhGmr
         oMmg==
X-Forwarded-Encrypted: i=1; AL+hErFRbNQRe5WTDWQ3jBYPQBDeangB9dEHHkhHeN+G3X7DtmMTHy8nNDmLaNPBT+LyM241zs4OPC4POIVrLA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tHtcugR/t/p7BF+Sql6TEfBkuxy3nyyH7AmCU7/0GzwmfnlTL
	8adKDIXOrxr0MV9IFpXZ+BX+BJ/433/Nia8Z9NyVsk6kiLD2SuThXCZ5M9Nx42uz
X-Gm-Gg: AZFdTZc5S1jH4tz0TRi6SWHhSKrnuwCDyfEw3BqLqW+eNXujedfOYNz8857rIYJZSGE
	/0uJpnKogq2iTdZ+Pq7zyHyNn8eiSSh9FcvIcKAgns+9SSi33ZEL8FUtg72NWuATA+3O1Vp1/3n
	LfENCo0w9kmuoAm4YOyjnUTev+axRpVBIy9AkIWMuMEvLZgNDFCF72+DOhejp4ZppX7pLLLbcIi
	x/hxUNz3f7vVHLUvvFzrPAsJea50H5j94+p1loTEKRRnzsLS/tDuiojuQOwar7eGH0iQCmTqYcN
	SgYUxv/2Y9PDO3R1ZnoSV75lnJvldpb91LXzA2loHwFGIHBtL5F2y8Tz3Msc0rwvPQXa2wOmdl4
	mHJuILNulXsNUW6NM5fFXHMaYKWd3zGZQIhblA9K9uhl2tfHV7AIPYg/gfd1MlbVXsPvSAchTUN
	8Cw2IwBEWa6JbGXcfLkmUUqWl2o+UQl1SQN3Lz0QaKrPOGQYUZbJ5eW0atGG6Wco0lxwXCn+b1S
	JZkph37FmsaY9NSe5lZL687EqokAHFnp0X9Qh6ls+w1NhMcO0ERboqC5FJBnu2KlmmcSFKILnhg
	k37Tr9z7fPTMOYgof54zWWMO678gEgi6TjpWN0sdnhnv8A==
X-Received: by 2002:a05:6000:460d:b0:492:9c9:65de with SMTP id ffacd0b85a97d-4a36bd51e25mr6484255f8f.5.1794925401954;
        Tue, 17 Nov 2026 06:23:21 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:1234:6c4c:cfc6:45ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm28417851f8f.9.2026.11.17.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:23:21 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: conor@kernel.org
Cc: jic23@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] cache: sifive_ccache: skip disabled device tree nodes
Date: Tue, 17 Nov 2026 16:23:17 +0200
Message-ID: <20261117142317.1679285-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028131939.1014720-2-thnkslprpt@gmail.com>
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062324_862039_55D054DB 
X-CRM114-Status: GOOD (  12.24  )
X-Spam-Score: 0.4 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sifive_ccache_init() uses of_find_matching_node_and_match(), which may
return a device tree node marked disabled. The driver can then map and
access registers of a cache controller that the device tree marks
unavailable.

Check the selected node's availability before accessing its registers.
Return -ENODEV for a disabled node, releasing the reference through the
existing error path.

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 v2:
- retain the single-node lookup instead of iterating over matches - as
  suggested by Conor Dooley
- use the existing error path to release a disabled node

Link to v1: https://lore.kernel.org/r/20261028131939.1014720-2-thnkslprpt@gmail.com

 drivers/cache/sifive_ccache.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -301,6 +301,11 @@ static int __init sifive_ccache_init(void)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np)) {
+		rc = -ENODEV;
+		goto err_node_put;
+	}
+
 	quirks = (uintptr_t)match->data;
 
 	if (of_address_to_resource(np, 0, &res)) {
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
