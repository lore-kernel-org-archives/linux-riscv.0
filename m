Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EBED4A613
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSS25y36HMEBGMOvaFYfa0GBWtpPt/koerlwpQZvTqg=; b=jtZLQS2Sxa1Fqt
	W9DPXl8wRnPhbe/kpObl3jDKi6ffmacYNBuS1OQC4hm8JIDVEBLvzjvxBqEMEeJGa3kvJIwv5nlw4
	MwXhra16cvY+QgIHbhKGBQ12c+vR49t3xQlstNrDXXmr7ed6NZRf2b7r+IsOgzfe2JWbymLGQjsMu
	JQDmozyaPDvkFrKggmuDLWLe5x7n/82thWZNWxpi5lieRnw2G/BL2HlsonuAqaLaC150DaHOdrQOV
	p5Gq/WKLI4viH1A39+AhHgfhNC3SrE37laEJQ5172+8Bk4WWsfuyUisM0n6wtDRKDpHXDByPWyQcd
	xP0jqx06n9SYMERCLZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfeR-0000000Dno7-3ZVc;
	Fri, 16 Jan 2026 08:57:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfeP-0000000DnnR-1zet
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 08:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 004D643A91;
	Fri, 16 Jan 2026 08:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50416C116C6;
	Fri, 16 Jan 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553865;
	bh=SU7O53fPWYM/qNmPt62STp0V4+s6nU3fxzQ54kz6G1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo8xwiCHVDVcfkaaPap6ijvI1/ChdglBkwg+iu80MsuSyz1XTRw0BICO0oTOJWQHw
	 QmXQ6FNfTp/BDXLF8fahwfas26cyFgxvO7E8VT1OLwpSyohwlDpwn48Ftm1vvrTxFb
	 nOD50SFGixOjpNgBBkKctH9UvhQ7c8townTt/TdfHvXZwuvKgZqMwidHpqF7ph2eKn
	 2DyCOHkgOPr9nXG2AHuVoDVM7Jq3guRkMEYZ/jfqebzcuZCpBbuhnryR13AWRQQIfK
	 39yNhcbuh5lMswuPUHUFJh6LbSyaRYpmD+8n0ml98fqPv1Ss3HdbTeubSZbwXUoLnn
	 TkrrnCfzcbGqg==
Date: Fri, 16 Jan 2026 09:57:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] drivers: i2c: add the driver for Andes I2C controller
Message-ID: <20260116-spectacular-woodoo-octopus-f7a4b7@quoll>
References: <20260115145244.435890-1-ben717@andestech.com>
 <20260115145244.435890-3-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-3-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_005749_532191_4EB6FC5E 
X-CRM114-Status: UNSURE (   5.62  )
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

On Thu, Jan 15, 2026 at 10:52:42PM +0800, Ben Zong-You Xie wrote:
> Add the driver for Andes I2C controller.

Why even subject differs from v1?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
