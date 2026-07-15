Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DD1C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOBAohNWAS1lInfzZ6PC/sr3N1sz0KfM6ez83URHgaI=; b=K18xp/aCrXaZyCFEVc7cBquJyQ
	2vv0kS5VaLYXDHLOFRy2PKcsgFT9Ks6TXPakmhnGM4SR1plEkyu26AmXre9IgFSEkEpNJk5UUvdzL
	xLhaUHlKX/RTv0jDu1oEn+l+aks0lz+OOo5+oedd7gGxWHMpJFOs0IePFGT+U4HPN8RJnRmXB8N6r
	uBeXL/TeuAsze6hyD4Pp9HikCNhbycgHgCjaXUjk6lWRInmlkDM3r6DPtIjp+GZQZqTmPaNZk4dsm
	BsRuZ30RGGSL9ICnqtGfsZdkEeGm8f5ZS17Lceb3xxtlyyqAhwKK6/6l+vqw9oAGZ/k/deQRfuJar
	5VwQQ+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw94-0000000ELzP-2ZW6;
	Wed, 15 Jul 2026 09:43:14 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw8z-0000000ELxo-49mc
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 09:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784108588; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=R2HmU9UJ2IBaGQSpvN6c/A3uULuxNh34EiIl7381Gmo=;
	b=blsm8iUxbUrUWPFekEikTYZv/lIrKQXKVbxOUlmTzV+nDK4MV+EEhPgdXBz0pFQik2jW2nvFudBhkpS1fVW8/5nGcJ/X5Ce0i0aY2o25fITgHR37RpHGtVVNsyX3KPbIT1bqp9hPVD8Mckc9/lbjO7Cblza1T7yhhePIuJMwPzU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X78miZk_1784108582;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X78miZk_1784108582 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Jul 2026 17:43:06 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Guo Ren <guoren@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Laight <david.laight.linux@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
Date: Wed, 15 Jul 2026 17:43:00 +0800
Message-ID: <20260715094305.2783-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTT7TPA+K+JgkvvUtb0x5BSzfox+s5rG8OtrP0QzPetHFw@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
  <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
  <3591a185-d0b5-4cb0-a0d5-ae9608a4e244@arm.com>
  <CAJF2gTT7TPA+K+JgkvvUtb0x5BSzfox+s5rG8OtrP0QzPetHFw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_024310_337353_39062AB3 
X-CRM114-Status: UNSURE (   6.59  )
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
Content-Type: multipart/mixed; boundary="===============8970774816914846444=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8970774816914846444==
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 09:55:19PM +0800, Guo Ren wrote:=0D
> The specification is deliberately precise. It uses "may", not "shall"=0D
> or "must". We should not introduce speculative implications that break=0D
> the spec's consistency on RV32. The safe and portable interpretation=0D
> is that software is explicitly allowed to use 32-bit accesses for=0D
> these registers on any system, which is exactly what this patch does.=0D
=0D
The RV32 argument is quite compelling. The RISC-V IOMMU is a=0D
platform-level IP that must serve both RV32 and RV64 software stacks.=0D
Mandating 64-bit MMIO accesses would directly conflict with RV32, where=0D
such accesses are impossible =E2=80=94 so any interpretation that turns "ma=
y be=0D
accessed using either a 32-bit or a 64-bit access" into an implicit=0D
hardware requirement for 64-bit accesses breaks the spec's own=0D
consistency on RV32.=0D
=0D
The RFC 2119 argument is equally strong. In RFC 2119 terms, "MAY" means=0D
an item is truly optional =E2=80=94 a specification should express obligati=
ons=0D
through these well-defined normative keywords, not leave them to be=0D
inferred from everyday-language intuition. If the spec authors had=0D
intended to require hardware to support 64-bit accesses, they would have=0D
said "must" or "shall".=0D
=0D
Given both points, treating 32-bit MMIO accesses as the default for the=0D
RISC-V IOMMU driver is the safe, portable, and more inclusive choice: it=0D
is explicitly permitted on every conformant implementation, whereas=0D
64-bit access atomicity is left unspecified.=0D
=0D
Acked-by: Chen Pei <cp0613@linux.alibaba.com>=0D
=0D
Thanks,=0D
Pei=0D
=0D


--===============8970774816914846444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8970774816914846444==--
