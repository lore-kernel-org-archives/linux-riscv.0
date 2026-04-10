Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72928F44873
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwRoW5LChDhdhjiZEA4BNVLNtuoNqI49CchuuiumdIc=; b=mEOAjMff5p5ZKL
	sUlWIW9/3wnaXwcAURUZymg8VPoPr7aMVIksOIwkT4IJ8TyYPTcfPELzvPmHKg8xV9fMSufmRyfRM
	8Juqr4pSmCH7DR8IA7++6ovf0vH+nVtpxLaDW9Y8Lg4AE5p//a2skVsegcr3fK24B7gxRePKxzqHp
	R42dHQyA0WOouYhu0cBANLNIAXEUy1p4+e+oje+z5WJIdLgnZNrO2D361uStKOg66NoNCfeg12NuN
	9bfGoWWXtDz0lK9kfv2vmgKJhrxus9s64124Zfdy0SUgZhdf1Ky3N/0LCPIfi5MalPjP3hYjMhT1D
	aEWZe2hxzJaCIEhy9fHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCod-0000000CNsu-10tv;
	Fri, 10 Apr 2026 14:26:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCoa-0000000CNsc-1gw9
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 14:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 834AA40B9B;
	Fri, 10 Apr 2026 14:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD43C19421;
	Fri, 10 Apr 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831191;
	bh=mgU7ufWgyq5CVWYMIYcZpQp/Lw4+Kvxg3axiC7VuNX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q10meThxM8vviyNV//BrdxCA3+xM9EXbqlFRxU0K16YF6ej1U0t9gUx+COufYLryh
	 J5RaA/8yVfIkNfCgU11eVkWrSlGZP2T/RpYMcHjH7wPPxwzITAQr3fS4DZoZqG0BjQ
	 cjfBlb3daqmOS0vwxWaTx6NjlTZ3KiUKnuRSpeBGeQ0wV7JQNrF0k4jRyvKjX9b9jq
	 FtzbNehub4MY9XUm+RmipXJmEaKVgUveT3Rc08w3Vnl+nuzNP6c7MaO6n14jcauig0
	 U5dL+Fdi59XCC9QwFrUQ7vJXStfoF6KLQt/Ciljv3f23XVz+87A8zijH+Rtnl63vQO
	 3AQ7cwqjLBuIg==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 2/5] irqchip: starfive: Convert the word "jh8100" to
 "jhb100"
In-Reply-To: <20260410090106.622781-3-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-3-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:26:28 +0200
Message-ID: <87cy0628ob.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_072632_462765_DF650C74 
X-CRM114-Status: UNSURE (   4.13  )
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

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:

Please use the documented prefix scheme, i.e. irqchip/....:

Your subject line might be more descriptive when it says:

     Rename jh8100 to jhb100

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
