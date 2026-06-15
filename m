Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F178DCD98DE
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdDGQYV3YPg2beVR07hbc8ReJWR2FBkh6h5e1J5ox6w=; b=W3pv+5wGQtKywt
	JIfG1gyX3imYNBCpB24Ky0VepXVuos5mJFrSXLbZJoeHDvoaQYE2dWqBF+2bfXhKHyt9yBKvqNbaz
	jm3/Uo0k+aGU4K3HrAdG4GJG9K0nIGeATZbIzfuFl9g+hGsJwvp0v6JZ6ciwVSfq1jDDf3zJLrnHo
	57Q9Tj4tOD4dfQwsEcSaeOxW1nMKcQ1g+dQE6GQigZlKnsdRBb7/ulzG0+1uy0qxVG7Mq6Rg0wTm4
	RX7VaOBM80313HIWWMVH1Cv8y/H6dp6muNI8965jSWVHUFj2JwxSLaFZKrmNHSLxwElwWWoB48xf9
	LPlsxKkj6Y6aieiGvhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2ZM-0000000Dr54-1ULY;
	Mon, 15 Jun 2026 08:21:20 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2ZJ-0000000Dr4A-3ebh
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 08:21:19 +0000
Received: from hawking.suse.de (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 7C99475B27;
	Mon, 15 Jun 2026 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781511673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEMFmt8TpTChnVBW1oINDFeDbvwK5qg/ts+tVGLgFE4=;
	b=00SmjGQekfRMI2a4nPcidhWzQO4m7IPrhZVXXZ0pHvCBq6N+LYKe+xTzr6SqlGjjBSxsKY
	piMJRE7l+TfaiHmiLnJzWeNmoQ01935RbFgf1Dxiwf89ZGkVNdHrPuG33qPFgDl/rzIpHT
	t5PLj79/U0jmo9OBm7kkSZvzf0sWzZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781511673;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEMFmt8TpTChnVBW1oINDFeDbvwK5qg/ts+tVGLgFE4=;
	b=IGSmQ3dHMCSQ8Bt17qqsNwVWBKpei51aqPvK5cvI2gH0E69XOCIL7uqt+waacWYJ+Pwlmo
	zGOao01C0axraCBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781511672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEMFmt8TpTChnVBW1oINDFeDbvwK5qg/ts+tVGLgFE4=;
	b=O+0Zf1Kede23tZObEsMJ500IJAklAJhZ+rH6jDgDQ4dByMfbiL+1pzWP+jhl5Jku6rSNct
	9FCDpgX/Ke/Q7KDHXQ1aD4L+BjHTC76BOzI6nXd7vXQyBfVcXvka7uuApKclSKfaw9RZ44
	tjjo9EssNNiP+RJ10KsRg6z6VpVOe8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781511672;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEMFmt8TpTChnVBW1oINDFeDbvwK5qg/ts+tVGLgFE4=;
	b=5uKPv/xxuYQO7zwWyAaQ6rr3x7B1IywxUSWbY2LfgbvIx9vVzIzJMmYGh7Swr7O/3sIpOv
	Np6H4wb7ewmD24Cw==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 6B1124A056F; Mon, 15 Jun 2026 10:21:12 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>,  Joerg Roedel <joro@8bytes.org>,
  Will Deacon <will@kernel.org>,  Robin Murphy <robin.murphy@arm.com>,
  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  iommu@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Xu Lu <luxu.kernel@bytedance.com>,
  cuiyunhui@bytedance.com,  yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
In-Reply-To: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	(Zhanpeng Zhang's message of "Mon, 15 Jun 2026 14:48:55 +0800")
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
Date: Mon, 15 Jun 2026 10:21:12 +0200
Message-ID: <mvmik7kz01z.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.18 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.18)[-0.910];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[from(RLajr16mudzow8bnf6sy)];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,hawking.suse.de:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_012118_061467_D4490B3D 
X-CRM114-Status: UNSURE (   7.65  )
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

On Jun 15 2026, Zhanpeng Zhang wrote:

> +config RISCV_IOMMU_32BIT_ACCESS
> +	bool "Use 32-bit accesses for RISC-V IOMMU registers"
> +	depends on RISCV_IOMMU
> +	help
> +	  Say Y when the RISC-V IOMMU MMIO window cannot be accessed
> +	  using naturally aligned 64-bit loads and stores.
> +
> +	  When enabled, 64-bit IOMMU registers are accessed as paired
> +	  32-bit MMIO operations. This option does not describe an RV32
> +	  kernel or a 32-bit IOMMU architecture.

What is the expected setting in a generic kernel?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
