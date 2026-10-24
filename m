Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83C606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 02:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMFvKSAS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ks3044wK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kSbOEONf4bJtIdG0JrjmXnqlahDIS9eMHszHPL1HmDE=; b=hMFvKSASG84SeDcxmmZiGTiaW8
	IY/izT/NSOgx3WeI5NprCKkYNEsp27tpcO7LnuDr0GpyJT9Ioe2A9IydI2RvhbY4TLT5uS2L853cD
	CHEUYwKInspiWYth8BrCiuHbWh5wM/1Y5Q42rOt4gDjLWRjyZntWIqKqR9WLTz+HKFu/tl8Vl5Pyj
	JeZdWg6SkSaAXeiwsV+CvTp6shCsoEjyhesiq3ZHXJcpMX6ZqSiNvEZ61g+gksDIaZwbpr3rRt3YX
	1rpzklSYQEDKBcogo18wjEuTrpn4Tdztbvdv8s/rbpswbxuGLEkHawMyFfHD69+6TQmVlFmy8lrZB
	Hfx8Q/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRbe-0000000HLxP-30Kb;
	Sat, 24 Oct 2026 02:35:38 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRba-0000000HLwM-3O4V
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 02:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=T7cJbpg0mZrBdKFY2KdKIefURH8yPh7R0JwZrrE54Sw=;
	b=Ks3044wK0/rr6NVpTbwaj/1wyi1rm/2lWBjuL+ofS+XUWA7jPZSzhUlUSpkvF0
	GxZn7BXAeF0Mx2t9YOjrupisQa9pB25lcu2Vu1AKy1EWEE7p1DKs6VGuASWt+Pll
	5K4/DlAt+pKWdYLw/70rfQulueieC2v2TA9TQVhceuaFE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLzJZGdxqA9VzCQ--.54169S2;
	Sat, 24 Oct 2026 10:35:06 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: rahul@summations.net,
	anup@brainfault.org
Cc: tglx@kernel.org,
	radu@rendec.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Validate system MSI indices
Date: Sat, 24 Oct 2026 10:35:05 +0800
Message-ID: <caplitmus-rv.reply.20261024.sysmsi.405bf889a4ab4be898f95a2cbeb6f0f2@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
References: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnLzJZGdxqA9VzCQ--.54169S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUnhL0UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Rou9mrcGVq-4gAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_193535_153348_04B83D8A 
X-CRM114-Status: UNSURE (   4.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rahul, Anup,

A brief follow-up on this patch.

I rechecked mainline at 17bb0e2f6c80. The DT translation still does not
reject system MSI IDs at or above nr_irqs. Wired-MSI allocation uses
MSI_ANY_INDEX for the descriptor and stores the hardware ID in its cookie,
so the descriptor limit does not validate that hardware ID.

Would it be appropriate to reject out-of-range firmware IDs here? Please
let me know if any changes are needed to the patch.

Thanks,
Pengpeng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
