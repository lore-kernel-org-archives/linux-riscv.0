Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E8A10AB82A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kv0cYB1D6cev46vxA+kplQeOJozek+2Gaou22Qw4Kk=; b=BLZ0RlkiGvScUa
	ofapOLjQjG2TNSeBYoeoTPUQ7DT6KRX3weZYOZuOgErZeBPbfQzjl0jC/hvrhLSlIHMcID0bM0CEk
	IRHxJ7bimq3xMso5XZIZ+Tx3C/YHIu6QSg2HmaoDLGO1mpobS3ROSfNUFcl4SlTkDRxvSwAHtVKNn
	fr+K2DRTvP/unGrGddortJ5kNEG3DBjwoCCRj2yoN//4m58WMbaKzfLND0U2ZO1E2QUQK5naptIwS
	zDNvoQzg6b6od4iIzOVqxCfP9oFP7q7+Vwi9PliQqWnmMtAk6GqG+RmXb4of5VZ2I8FA6Wf1epGRo
	pzpOg9LA6O+VKbEKR81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t8O-00000006Juo-0GBJ;
	Thu, 26 Mar 2026 22:25:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5t8L-00000006Jta-3ZPR
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 22:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71D8944593;
	Thu, 26 Mar 2026 22:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5274FC4AF11;
	Thu, 26 Mar 2026 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774563890;
	bh=vXuZILi71R68LcfYH5ZVtFEJI1fOBMAeL2azpItnV38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2iLVf4Tpjd7p1ZSPkG5AUk1EyB0jDrUVuaqqZhpeym2Eh5ODVnN46NA2Iw0BGcwq
	 /Y9KXrhYIqTwBGYWpEbhoMkaa8B0HY1VEOxGn8cvMDn5vNlLNO1N0z4O8bp3Uo0MZo
	 rh/1YukX9BqVYG7qDCW9qm9ng0XIikbZxtzhdddm8sW8emc6ELg4jYegR9mXG9bPz6
	 qjESwrjhBkXCG7yV+0YucrABtn4kJLKLP6krPJCXofasuixxaqRI4RN4evTnuOhnp2
	 lF+c87aVcSaBq2w/8z1sgPTSBDuBKl9tOCtC+2ljFevbkUUMJOCHkSg3nVVpghgpuT
	 lO7vu3LtSX4qg==
Date: Thu, 26 Mar 2026 23:24:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <acWx_31uT2ffcaSN@zenone.zhora.eu>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
 <acWxJNK_vZca_xCZ@zenone.zhora.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acWxJNK_vZca_xCZ@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_152457_930625_559E2FA7 
X-CRM114-Status: GOOD (  12.86  )
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

Hi agagin,

On Thu, Mar 26, 2026 at 11:22:31PM +0100, Andi Shyti wrote:
> On Wed, Mar 25, 2026 at 09:49:25AM +0000, Yixun Lan wrote:
> > Populate all I2C devicetree nodes for SpacemiT K3 SoC.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> 
> this second patch does not apply on my i2c branch. I'm missing
> some other patches on k3.
> 
> Can you please rebase it on top of my i2c/i2c-host branch,
> otherwise I will need to wait for the merge window to open in
> order to take this.

sorry, this has to go through some other path, I'm going to take
patch 1.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
