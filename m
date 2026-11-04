Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A5606D819
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdH+3QBU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhvWsSxV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XEqBCFityfBiujPingAGrtnPNwZpKY+W1HAaZNT6S+8=; b=pdH+3QBUsaXvwzwXfbz9XnUmSd
	dklMOpeJ7sDA42gxnZv/5ZdAfizMMNMUQkRkZQyBwf8TTmooJ+Tgr24CFAppGTV/RVc/vUgQsNNk5
	BDkTfqVYa0EewBR7QY3sRMYeXETg9+of+25srrEZemaCyrONCo1ID5QKYR1Ob/f2bhMZKEiBRSpsZ
	M4iCCoVMIIRh1zJ4GGyi7U7VN3bJ20br+GvoK2ClM8MWnfxR7kT5PneOEp4uNZS5yGBvPSrXuO/Dz
	2f6Oq5Jd5ZHRWhzGOvaOR3e2Z7gOOvA0vQDaBm3cWIUrRW8m7K45rnYGG3+v/qvDiTbOoM7zF5sjf
	Y3HS6ntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeAl-000000065Nf-3WVQ;
	Wed, 04 Nov 2026 16:49:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeAj-000000065Lp-2wXl
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 16:49:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 752C04097D;
	Wed,  4 Nov 2026 16:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E352E1F00A2C;
	Wed,  4 Nov 2026 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810953;
	bh=tEKKYrXNj6XgAhGCoGYV4RqZc7pwG0hhr+FNinyDBHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KhvWsSxV8wgO6j8+evSeL8TkbxH0SzNHJ5oH2SmIoc9NDYD+PDOy2A4IxnrAe08XS
	 1xyuipGuoMYH7V64zhL+vqJP7S5vUrUsj88pvb9qLqGv6Sa5QdO2KKYoHhec4HvscL
	 FxlQeJnTco2wSGBjZ2LZoPTM3r7vUgk/OTonUhvRgwt5oMhc4Win0O/B9fYbE8KfWV
	 W6Rj48qbPwoRhYtQLXEZL2/Rpyz1vr1jBpHVKN1Q8kKwRjNVcNm5OSzyRNFwZ+FsUL
	 3Balzi1b85kMpVp3fPRYnCu1mzppY4VseMnNj5EXiBaMMI3zkiYOZMTguFdegybkk9
	 lZh5j/EmUZxWw==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:23 -0800
Subject: [PATCH v10 6/6] MAINTAINERS: resctrl: Add myself as reviewer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=739; i=fustini@kernel.org;
 h=from:subject:message-id; bh=XUHkgMfDTiHQfhcpXAJzPajKkk2ZY54UiaPZ41kdAiA=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmJ9sz/PP1bkK++ifb13zk08X6t28o1XaU7izMfSq
 7sKd99z6ShlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMpHQKI8M+jSUahSs0XfZK
 6xY8vGxjlce5NN73nG/FoVkG4rMUdH8xMrzyaWOwV+IOct97bMXBHQEOLRIJXg564q0tkR2zNOx
 FGAA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RISC-V CBQRI support builds on the common resctrl code, so changes
there affect RISC-V. Add myself as a reviewer to stay aware of them.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df051086b5dd..e5731902d318 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23463,6 +23463,7 @@ M:	x86@kernel.org
 R:	Dave Martin <Dave.Martin@arm.com>
 R:	James Morse <james.morse@arm.com>
 R:	Babu Moger <babu.moger@amd.com>
+R:	Drew Fustini <fustini@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 P:	Documentation/process/maintainer-tip.rst

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
