Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB46CC6B00
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 04:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5xKckAPU0VncO6pdHAo0dJCzhs3am2AUJlve1TfKz4=; b=BpIKPIq9W0If8x
	DGbuREBpipnvczdcLAd1V0OdzSelqpvvLDQeYeSw0XlItkoG79mXn4xXV30ApjPkHKIo5yLHFehEe
	qgcbmNg77kY3aBJuge5hbv9+y4NwPE6qBl+w5AoPz0so9qVJATTU/guPkS07/anDvEK1rZHm8CuSr
	9kkBo7mzDpQwaHD4mMVuVccEcQA7sQ1+qqra/V6TMvG6CNDSZuOacghWvMzuFl6AeLVlaYGcxdoNt
	7c8kTOiBwBcRDmenfIG+P7FGU9/qvK/PeO0aD+ijWN0pIR42dpb0bkGmAAONxr1th9jJU/P/i/Jnl
	iSKCp/DX7umNcC6ur/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89lL-0000000Gldm-0k9f;
	Thu, 02 Apr 2026 04:34:35 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89lJ-0000000GldS-09Jj
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 04:34:34 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d91f82d819so528126a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775104471; x=1775709271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbDocc+3/G5Wqqwpdv49SPo6/d2rZ8VUYX/GN5MdH4c=;
        b=oL4u7YQVOkLLf1JCEEjwHm4TOkR/9ScTPBhA9sWKDSLuAGyJqdhmwMx6gTtaXCrR2m
         pohOkkMF0gK0mpL+jm9AuAppaApBQJtwBCnskh9l8ASemklkJfzCJcZHY0AjW9rmck9h
         TZhPI1JTZrIleBMXkJGNeP8/+5uL/sRnhpQggZ1a7lWqzFlejlCqAh8Xh2qw8qkPG1Mf
         pQVUEqQOrJsGQRIyXrL/nJgXQjEw4nUIwgW8F/OIMg2mgJSGIJicQFU+p+kaJU8WND6s
         Zklfzs8Z293xdDh6fBPtOJEbJ8/JGv21D6D/zhl2yPxnkbe6hJhsRMTqK2G0QgJawGt2
         JI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775104471; x=1775709271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbDocc+3/G5Wqqwpdv49SPo6/d2rZ8VUYX/GN5MdH4c=;
        b=DV+Py/uTYfa0mDxcYbPPXoazDOBXymritjbj3+r40qTS3U/nzhIbDG4FxbcZ6ADW5l
         RsLFPoaDHyUn34nhcKYJKYoxMaz5JKldfN3oWMX10FH6uwdng8qalQ5znfeCHIAYqj4v
         tzqzT3U2UwEe540YAZfpKxfPo+1erkOvt/PJxcS5A1NV3uPa4DlKvmUqEyylCalFi40C
         Cug74ldaXlEscPkZ4MHNmdqq2gl5XGBTgjA5WBHeVy7GWKt2qjsrDWFO4JAn2bX/Wuwp
         n6TNrpANXJbybMw4nfvzQ2fdPyPDCkO/enVcaid3NgVNTyxjaQJ8PYWGBabd/+9PRvuN
         SEQg==
X-Gm-Message-State: AOJu0YzL1uMkh/dxjgffYcKpgogSU4qSfngkPlp3jHr1W9jc7qjbRrXl
	+lRrSl1gW3I2vuaMVQQ0Pq3CSwnAAqZvdjw3gppLbvNoicwB2nxaIG6EcZuG6yL2O2vwNw==
X-Gm-Gg: ATEYQzwdKc/fzU5rSWh0rBeK5PNAqvEnqoEmxrjT88V7wcmA512SBNOn8p+KG105DSJ
	GxejUJBp/iGXqOqUPKMJ+A7hsmRhBVRbefN3O3ccP0kbSTG2/SKOEJBKDO+4RSlS0HGCq22t5Ba
	YKVh7TzjFrc8h57cr/Cam/stIsdFZgYLvGlDsiKMvEVqyRegIPkDMPKtB5NpVe7mTQWNGcEhFny
	98awUCj4ha5bEB6z5cCjIqijRht/bHYQnOeNfuNxO9il6dTZj4inABId5zRQDQbkHdOaWYy7xKg
	J/A2DIZUBmLg38w5XTrVRNXL9TfhFwzaEpsBMBRz9XxrJoSoVSPmlKhE835ZV9HwdDfiFdZ1s4N
	0gpVIRc2ZAMro3Uozl0sY3BjzHLV5tGtUp4MgKrCgFBiDWYqzssxmvkm/+5iLu4ZYvlP5BcHnZg
	T9I2C5yfnM+vO1b7Cf
X-Received: by 2002:a05:6820:4dcb:b0:67e:367c:998b with SMTP id 006d021491bc7-67fabd207eemr3541049eaf.59.1775104471216;
        Wed, 01 Apr 2026 21:34:31 -0700 (PDT)
Received: from hinoki ([185.255.130.248])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm1139558eaf.8.2026.04.01.21.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:34:29 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@kernel.org,
	alexghiti@rivosinc.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 0/1] Optimize Vector context restore on syscall
Date: Wed,  1 Apr 2026 23:34:13 -0500
Message-ID: <20260402043414.2421916-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_213433_131731_89588B36 
X-CRM114-Status: UNSURE (   8.72  )
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

Accroding to the ABI, Vector registers are not preserved across a
syscall. Therefore, the kernel invalidates all V-reg at the entry of the
trap handler and marks the state dirty. This patch provide an
optimization such that the invalidation is performed only once before
returning back to the user space. Also by tracking this state,
specifically reserving VS_INITIAL for this optimized restore, we cut the
cost of saving and restoring V-reg at context switch for processes
calling syscalls.

---
Changelog v2: rebase on top of for-next

Andy Chiu (1):
  riscv: vector: treat VS_INITIAL as discard

 arch/riscv/include/asm/vector.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
