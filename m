Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70FCD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/JZZC20+9BST0QLQfK15cyuqeZ4GBDvP+HuwN1DS8c=; b=ueb9LNfDGqiZrO
	ywF9pGauCOmMH8OJDiV1Q6VNZprkDiKBnVzPinXB9ki0VqvbFw5srjbNGQOkwJ8xPzs6bBn8PzjFU
	aap537KNJVdrYBImMSbXkjY/qiYMCvaD8QDd23HTQ4GSp7bCMXSxAAIvdJ4DiVyVuPKUzvSFKtAPn
	ZXCec7EnLx6CzrYUk/V6McFfhsl8ZrCOqpnoQOGsc28SXTrJneGzPd4+MHlfdWUu/Or6ZouAXUGC0
	eUNukhO4JABP80HptczV4hJXbvX/gwvLMZ8iZBrVtyHCaZz0vK/AacmG8LBqPlz1tcHvlDImhr5om
	M3st6eVnjco53uZxJB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9NB-0000000Bmu5-1TUf;
	Mon, 01 Jun 2026 20:36:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9N6-0000000Bmqk-1IO1
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 20:36:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC2A044617;
	Mon,  1 Jun 2026 20:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EC71F008A5;
	Mon,  1 Jun 2026 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346187;
	bh=bMpLloap6PiHKBmR2q+lkFW8XbOS+M/R8KIqzK/QRe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IdM9AEMz5E5ImmoO2m5gDZ4DU4xHBhRRkMCrCSOBVEt/9OjvRP5aD4zTy/1kvNBgu
	 AuN7tEt7FHvcksMKxRaNnZz2dYOBaTR95HeuXfQU6yK6ZT3MuMUhHGDIxH/tHWAgah
	 KZd8AXXoZNQs4z+pkHiFeLZvv30gwHA2MfCrv3OLD0nIFyq9atgPgLeRF0MF628hbm
	 nq71w5h6686v9pNmOTYTcCWeP7nl9RyELQ2WW5FRHhocacyObGfL/dsiivDGd+Zj5U
	 da17UP5VWp/0j4GTunnmV8RszPCSQ+foGaot3B5F3KhISze6JmSUXb6Cw7Bsuuo/+4
	 TM3/m4u/4uVvQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 01 Jun 2026 13:36:00 -0700
Subject: [PATCH RFC v6 06/18] fs/resctrl: Let bandwidth resources default
 to min_bw at reset
MIME-Version: 1.0
Message-Id: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-6-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org>
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org>
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
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=fustini@kernel.org;
 h=from:subject:message-id; bh=umPX9KI/Gk5be4QxBnpv0rW9Oy0Ozoiycv8rX5MjK6Y=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTJvnWSlbogxnP79dej/1bd9WIR37Ty8sHVDk2yYYd9N
 i++trzVsKOUhUGMi0FWTJFl04e8C0u8Qr8umP9iG8wcViaQIQxcnAIwkYOaDP9Us8xffjt+JEPb
 Izaz3MwuYWe1ApeG9f+LGWEl73y37/FkZFh1JvmK7ZXIpEXLNsdP3xXJ8czT1smrcse0ZI+Pctd
 ehbMDAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_133628_395893_89020E99 
X-CRM114-Status: GOOD (  13.53  )
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
