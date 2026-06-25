Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB2ACDB479
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 10:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAFM7GkD7TYHCwplKu1DVpFqvTVjWSwu8x4ssX/CJuI=; b=RU08qQaJtFUnD1
	u+1GfgGAmah66E2mJW9O/VRJU7XCX8YR7bTvdPMfU2XzyvBBP3PMI9XrypK55kcsBAD24yKQ2V9l1
	SxJhbXF1iFxGYPF13t3pGJViKUKCU6+uh+yFsdIgbCNsuqPRKA5vdTgpykIgMQ/1ljfa+4+HSe7nr
	pOBMK+Feq5tNVSiR5wnIt3/xGcLIIhFgPbhcDFjmkM57PZjdsHiUb4tmPzp4I19v0XJ3zErC05RpN
	saKltQXiCf7UBvbpeVZm45me3yFFZLj65K3gmfOPiXeTnMpr3STvyBHSqERQ10dD+QmAMtUiZSO68
	HRurqc3P7nSqYrwl9evA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchXC-000000090E4-1VhS;
	Thu, 25 Jun 2026 10:42:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchXA-000000090Dn-2iJk
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 10:42:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C97060139;
	Thu, 25 Jun 2026 10:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D621F00A3F;
	Thu, 25 Jun 2026 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782384131;
	bh=xYiaKsbHa4PJszD1tJWqPxsEZKpm9szbZV9x5R3aK6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZX503ZcAO4QSK+tX/zaQ3UaiwBmBcnpJFnTnGGhZihwJZNcyJY+14k7w5MfMhWktn
	 43gNGELYh5RdMLzQqHBRQqLNQVMLGVBUmPQ7nVUSE+nOnp3nAWCpV/xyWr6N3IWBVN
	 R1JeXmvciZ9XgM5X+UD56iQa/lvpVcEoWagW7OMroRWvyQtX7uS01OflX1HwoZgEop
	 MbQBIklDm5xDmCexg6Y06pDhxRsIc/u1hKhfwiKkrRN2g3p0D+XAnFNWZD5QFnO9Y8
	 xf/8h0/9fWwbyKzRuZ5ynVmb+WoRxHYRvpvh9Y5mHLWs8YV0j62F6ynW3YsJvyRwDp
	 nd7tdVnPMJBtQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yicong Yang <yang.yicong@picoheart.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH 6.12.y/6.18.y] ACPI: scan: Use async schedule function in acpi_scan_clear_dep_fn()
Date: Thu, 25 Jun 2026 06:41:53 -0400
Message-ID: <20260625054005.0006.acpi-scan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624-acpi-dependency-thing-v1-1-ec0d99e5bf0f@iscas.ac.cn>
References: <20260624-acpi-dependency-thing-v1-1-ec0d99e5bf0f@iscas.ac.cn>
MIME-Version: 1.0
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

> [PATCH 6.12.y/6.18.y] ACPI: scan: Use async schedule function in
> acpi_scan_clear_dep_fn()
>
> [ Vivian: Adjust system_dfl_wq -> system_unbound_wq in removed lines ]

Queued for both 6.18 and 6.12, thanks.

--
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
