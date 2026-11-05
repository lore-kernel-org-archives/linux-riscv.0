Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E9606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkD0uyfs;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=XI96ZbJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Wh/MBjAJMu5H3dbCyYfNraed6XMO3xMEu0+WtZm5xg=; b=tkD0uyfsnIYwhtxtP8giKpKhKw
	UeBN5ce0FAx+d4cMozybtEalla8sg5Gg7MNBnywWlVwhi4M/OOMFGxdRMuO2qwLKPN7Z4P1vqt8Gz
	Li1NhnyfglMAZvZfsOvfMHgICqXJXPBmJ1QVV7WbV7KDt5RX0IElruwSnGsHg9HgCpZ/ERsVuTmYy
	i4ahxs7G8Ktq86mEWEYo0Wsorb1d7L5XfyMBm8f4wReZuDUPsvmqvG6Web25m//kvyfnedTZW45IU
	LwD79eDnx26M7TFDydXCxlalCKAxjHMeXW9n42NXIrpFZpXJqiAK5EtnlFdJJA/N9N3+XEUf5z9/s
	V3Au0FOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxvd-00000009BAF-2kDL;
	Thu, 05 Nov 2026 13:54:57 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxvY-00000009B9a-2Hrc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 13:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793886885; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=b6QPA+yKpjH2CrVxlAy0E3CtCT2/3EUZFS8yt7Hepkk=;
	b=XI96ZbJcHL0C0g14KlbL0xND5LQF983hvTvbGHVXr6jF7IfUSEHD6tCIqvYmKFt0TIORoio3mFsl9WEuruY6+3D1zcc7Sa2qxCSOnYWO2al6bYDH7KuspXc/OJjEz+XKO8b99N3QadjR29jB2MbyCveW6EKSBpUVF85FbCw+mDQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XE8slaV_1793886882;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE8slaV_1793886882 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 21:54:44 +0800
From: fangyu.yu@linux.alibaba.com
To: guoren@kernel.org
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	cp0613@linux.alibaba.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	krzk@kernel.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	mingo@redhat.com,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: Re: [PATCH v3] perf vendor events riscv: Add C-SKY C930 JSON file
Date: Thu,  5 Nov 2026 21:54:35 +0800
Message-Id: <20261105135435.16251-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
References: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055453_373769_C51C2249 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>From: Chen Pei <cp0613@linux.alibaba.com>
>
>Add PMU event descriptions for the C-SKY C930 core so perf can list and
>select its hardware events by name instead of requiring raw event codes.
>The events cover core counters, branch prediction, instruction fetch,
>integer execution, load/store operations, vector and floating-point
>execution, caches and TLBs.
>
>Add a mapfile.csv entry matching mvendorid 0x5b7 and marchid
>0x8000000009201600, allowing any mimpid, to select the C930 event table.
>
>For example:
>
>perf stat -e cache.l1d.rd.miss,tlb.l1d.miss ./workload
>

Tested on C930 core. `perf list` shows the C930 events, and
`perf stat -e <event list>` works as expected on C930.

Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

>Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
>---
>XuanTie is the RISC-V processor brand of C-SKY Microsystems Co., Ltd.
>[2]. JEDEC JEP106AB lists C-SKY Microsystems Co., Ltd. as the manufacturer
>associated with ID 0x5b7 [3]. Accordingly, use C-SKY in the patch title
>and csky/ as the vendor directory.
>
>This revision is limited to the PMU event descriptions from v2 3/4.
>perf selects the event table by matching mvendorid, marchid and mimpid,
>so the DT binding additions are not required for this patch. The
>derived metrics patch is also omitted from this revision.
>
>Changes in v3:
> - Repost only the PMU event patch. Omit the DT binding patches
>   (v2 1/4 and 2/4) and the derived metrics patch (v2 4/4).
> - Rename the vendor directory from xuantie/ to csky/ and update the
>   mapfile.csv entry accordingly.
> - Change the patch title to "Add C-SKY C930 PMU events".
> - Drop the topdown.* events, uop.spec, uop.ret, ieu.de.inst_cnt,
>   ieu.rn.inst_cnt and vfpu_ex1_rep.
>
>Changes in v2:
>v2: https://lore.kernel.org/linux-riscv/20251121063439.2545-1-cp0613@linux.alibaba.com/
> - Vendor name update.
>
>Previous versions:
>v1: https://lore.kernel.org/linux-riscv/20250910121121.7203-1-cp0613@linux.alibaba.com/
>
>References:
>[1] https://www.xrvm.com/product/xuantie/C930
>[2] https://www.xrvm.com/declaration
>[3] https://www.jedec.org/standards-documents/docs/jep-106ab

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
