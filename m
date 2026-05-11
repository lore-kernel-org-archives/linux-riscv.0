Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F7CD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/JZZC20+9BST0QLQfK15cyuqeZ4GBDvP+HuwN1DS8c=; b=Sbx0bJvIcmGV33
	cSLBc8z8Z0bajeyhaoeYr/plIQIeM+R4s2SP96JcGUHn4JwjCyjVLMjvJMZXf51OOnf71ChmB8nnF
	aPrg05Cr/Kx/2hRN6ixjcYSqw9h8gMzVbPu7aFsnc+yQzSd70Efze+cG+FeXsKrilLYbIK0aG+XD8
	A7an7/fCSxrA0DYNuLTeN3DFpdP7qb0ijmtiq0sjkUvdywUpU8oi5uOViKdf7mK79HhPaMzju7V76
	xPGA/RAXbN3GgKnfKR4uV6Qe8ItWbV2+kfcC7+JwVGIAbZ4CQ39avhWqUQqJeR0y3JCy3QlcZZj63
	2byJcP+ueD6lfPuEvPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvK-0000000CL8s-2hwd;
	Mon, 11 May 2026 05:11:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvC-0000000CL7W-2bnQ
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79B5260120;
	Mon, 11 May 2026 05:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9325EC2BCFF;
	Mon, 11 May 2026 05:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476273;
	bh=umPX9KI/Gk5be4QxBnpv0rW9Oy0Ozoiycv8rX5MjK6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuqHuMmO6BS+s8J7NIUJRMz4tJqtWH29tLGqz6pknrLlEWxs25PoBQI1KrJpAuZYk
	 +239J/fYHKLn/aEsllQKDJpWhUR5KQXWkjlSdhHd099/LIFOuslqwARooYbekXMBqx
	 5/bdub1dqHOMNih+LszkTE6VdfJES4jjEziyJ93htayGikz4EGArIgfc1hYciKF5zJ
	 XAWmXKTo/1qv8naxMZFUlIqCdVEyzf32ZMqpXUqnzZTZ+jvw4kMpUVWcLziyIwNTJa
	 c7dM0dlsHg2xUwXG6zjmeGP5xzeneim2x/pld+6m6BjotjokuG6oth+KUdx3IEijmX
	 DNq2hV+WoWuwQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:11:02 -0700
Subject: [PATCH RFC v4 06/18] fs/resctrl: Let bandwidth resources default
 to min_bw at reset
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-6-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=fustini@kernel.org;
 h=from:subject:message-id; bh=umPX9KI/Gk5be4QxBnpv0rW9Oy0Ozoiycv8rX5MjK6Y=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprz+7uE4+U+IjFP0pgsJnwo3mfH1HP7Tzr9d7q+nf
 +B1G6MHHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJnHzG8L+YbX7xpNb2ZO/3
 L1nzv2vmLNyZ9s+u2rI6N/3Jw0UP8oIY/runfTy2rWzFIYvfwWKW8xJXJf0M925UTv+g1p3OJmC
 6kA0A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Bandwidth resources reset to max_bw on group creation today, which is
the right default for MBA and SMBA. However, it is the wrong default for
hardware whose registers form a sum-constrained reservation: defaulting
every new group to max_bw would immediately violate the sum on the first
mkdir.

When default_to_min is set, resctrl_get_default_ctrl() returns min_bw
for the resource. The existing MBA and SMBA behavior is not changed.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 include/linux/resctrl.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 9529ed0d1fdf..bcbc166412ef 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -247,7 +247,13 @@ enum membw_throttle_mode {
 /**
  * struct resctrl_membw - Memory bandwidth allocation related data
  * @min_bw:		Minimum memory bandwidth percentage user can request
- * @max_bw:		Maximum memory bandwidth value, used as the reset value
+ * @max_bw:		Maximum memory bandwidth value a group can be
+ *			configured with
+ * @default_to_min:	When true, the default control value for new
+ *			groups and reset is @min_bw instead of @max_bw.
+ *			Drivers whose hardware enforces a sum constraint
+ *			across groups (e.g. CBQRI MB_MIN) set this so
+ *			mkdir does not overflow the sum.
  * @bw_gran:		Granularity at which the memory bandwidth is allocated
  * @delay_linear:	True if memory B/W delay is in linear scale
  * @arch_needs_linear:	True if we can't configure non-linear resources
@@ -259,6 +265,7 @@ enum membw_throttle_mode {
 struct resctrl_membw {
 	u32				min_bw;
 	u32				max_bw;
+	bool				default_to_min;
 	u32				bw_gran;
 	u32				delay_linear;
 	bool				arch_needs_linear;
@@ -405,7 +412,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
 	case RESCTRL_SCHEMA_BITMAP:
 		return BIT_MASK(r->cache.cbm_len) - 1;
 	case RESCTRL_SCHEMA_RANGE:
-		return r->membw.max_bw;
+		return r->membw.default_to_min ? r->membw.min_bw : r->membw.max_bw;
 	}
 
 	return WARN_ON_ONCE(1);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
