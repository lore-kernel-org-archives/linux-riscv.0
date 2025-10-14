Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FDACCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rM+lZ8aiZ8kOCO+06BvRbIZBGbdvcV/u+OLnxjPUiRw=; b=EH1gwCsMb/gCG1
	xQluqOUyAAKHBOfvZVKFT6d/oYz3f1+EAkfh7Q3SGq3elwt9ibkaeHYPcOQWUl9TTTTAe1taa/3sn
	2pzwDLKMd4KnIByblxF5vhRbvoyqW3NeafwjKpcI3szrfO/RdiWP8sRdJuSdgOvCwmiEDeb55OSSF
	z04JevOIinaPgmM+IGKJYaby0/PqpsZwLDRR4bE4bJGPZyLpRXEwxpMV/ctLGh/eEGLmJBD5IPGV2
	4vCiulFbJUhZu1IBSWbQFJVHfpePUAYHp1f4IOna4l7YK7DTJ1b8zEi3k3LrzYnav9bZ5tCh/bR07
	xStMfFS5eKbI3pWrKGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UAC-0000000Ev97-1khO;
	Tue, 14 Oct 2025 01:49:20 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UAA-0000000Ev8l-2mxv
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 01:49:19 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b593def09e3so3183207a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 18:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760406558; x=1761011358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9mB3m7QAB7n5Q++JS2mU6ur8NcHYw+2duPedcCjz88=;
        b=VEeiLe403miyOaStnrH/vtDtjo6YF+/bd2O1Q8qmUgrP/isuLWfJOzEKkNkZ/OViij
         /lMDAuC/QKO6wkbKcOGFqzeoHJLbOumV9GEXwSWMuVaZ8DREhlJta8RT0iDiyg+7K/Ap
         B9iWLsuYkypgrULGC6nh3Lb1KbrjcvXCR6OruAL8kKDWWX4Q255yFRUJYIl78H8/4gz0
         72lT3oetS13/zJcEJRXA/SrwPdeH4XgijvsqNs9kXQOF0pTWppysMY8UZpNvLDxQcxDm
         gLPRURJcvUswGiEgXGqwnhg0w/S2UA7ySg0D4HNBflV/Ez3ZzWN6Hh88qp0j9AfS05WH
         ZBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760406558; x=1761011358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9mB3m7QAB7n5Q++JS2mU6ur8NcHYw+2duPedcCjz88=;
        b=wpLMI9ICIVNmkLFmtFpMd3bbchREm3hgBY5FNONmFuja/7untJ4v4vWXOU7P+de2Bn
         DUk+ItxJHgdkaIVQLVRSM6tsUxjlSfVkNnt4dyHBNmjsTCRDn/Xx3KnV0s+hWoX+bUgM
         tC8yn82XI1OQ74QfzUdcklN+l+LqGDOehk8usyQOHs4u1kQc6ZD6Ohe+5aqR0DT+Zfr6
         U9dHcm5i84HI4pFKl1F5jUExzN/U/Diknc0CPzCiynzwosws25pigIUZ+QpveOISQfGg
         iSnb2xRwlHAvWLlWyNSmiE/LKsSXhMN0Ak5g8Oq3+9G+QKdt4UPllYMnytY6RK4yzqRb
         atbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQH/QPKMZDWMtCW8X5ukKzlTI29NINvZOOoRcd9RTdBj48DNQHoxaHM3v19/jS7TYYgsfmUyuaG4KPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIZRxi79cQnTUrMuQ1VrVfvjF8zwmGvM4oAwoIOBE7bBnZmrrb
	TX1ssNHDyJV7U735EIHL9moHsZPJR2/qkSwKZ50reD238yhuJA/iDqaY
X-Gm-Gg: ASbGncs6FM/sKtLU1g3xkvCuWsznwOPILb0n55taOSip13MPi4B+pg4OtmJmXkL9NA5
	/5Rx3Ft1YWCsmV2Mz4mngb8cyXUqLLH7/nPTpKezN1T/1mcN9UHm0MLYBKa6gQU2+Hn9c2hO79+
	YwUeHG+oVL8ATRBkc7KCA1A/5dMYBd5+yhEs8sG08CRdwB9pe35iYkFINYUf4L/KDFctqVwNHIZ
	CiPX8DRPlHFOYXfGXQfVYXsKcC2l2pFPPbVo4okfgnvcjgLMmwsl7FLxc8ox3+Yaszk/rzeIue5
	rKH97LZ6JQCwf92MWJCUc3UDvUwqx1t5WAgZInS6fVQBowlgVJBndhYIKKkybfBI36bSC64S0KL
	7HF3SvEtYdXyXnVCXFmVxRRvmvapFJw+qaODZnzwEXM20mRh5Ymy2xpPJpuNS6A==
X-Google-Smtp-Source: AGHT+IE8pZcQRgUaWvehyNj++AfZMd8qovR+xA7bP6PF5yqBYWdrBtBT+erT3EcXL6EsvnVpwit0kg==
X-Received: by 2002:a17:902:ce81:b0:250:b622:c750 with SMTP id d9443c01a7336-290272d7330mr316171655ad.27.1760406557845;
        Mon, 13 Oct 2025 18:49:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f082b7sm145291085ad.59.2025.10.13.18.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 18:49:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Lin <eric.lin@sifive.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2] perf vendor events riscv: add T-HEAD C920V2 JSON support
Date: Tue, 14 Oct 2025 09:48:29 +0800
Message-ID: <20251014014830.613399-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_184918_703922_FAAFE16C 
X-CRM114-Status: UNSURE (   9.56  )
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

T-HEAD C920 has a V2 iteration, which supports Sscompmf. The V2
iteration supports the same perf events as V1.

Reuse T-HEAD c900-legacy JSON file for T-HEAD C920V2.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
Changes from v1:
1. Update comment and add missing CPU version.
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 0a7e7dcc81be..d5eea7f9aa9a 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -20,5 +20,6 @@
 0x489-0x8000000000000008-0x[[:xdigit:]]+,v1,sifive/p550,core
 0x489-0x8000000000000[1-6]08-0x[9b][[:xdigit:]]+,v1,sifive/p650,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
+0x5b7-0x80000000090c0d00-0x2047000,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
