Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61435606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hi/uNIc3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R8uGqCm8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cP7Di6MFKSjZIGWh30S8e6spuF99+9XFApPMGXobjI=; b=hi/uNIc3Dvkqtd
	f7tQSk2WUg3Z9bozY4roBiANbk0GdSXv/haQgqQmJxIA+Ob9h6r3Cmgs2CHOu5hqvZprbwfzkLoeK
	sbnFQMupNWMSWegwgljIFC+kyq12LU8Wx22lDd2pL7LnWcJzRcsy73lNI42H59dAsfsyz2YZXMbOp
	G2LkCWIiYCXCtC10nyHqpgZa1axnnqGZrr5u3UO6EVCC6QVSjopeerSkZGd1uf1y1XlfjNHOM6h3/
	auJc+itSKwmpJ6U8Ft60bH5pX3x0yWBrfgDd2sjfHYm4iq/pUAJtYYq2y4kDy5na3STz6ZLsSZ2e1
	F+mQzA0vjqatijQ4xEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW40-0000000Brv7-0wOa;
	Wed, 21 Oct 2026 13:09:04 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW3y-0000000BruC-0Bk2
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 13:09:03 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 543852017C1;
	Wed, 21 Oct 2026 15:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792588138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NACHf3MpA2Z29v6RpiB327pgryw33carefl3Um/1JYc=;
	b=R8uGqCm8/MGbuHjf7MIF9PQsjey3ZRTC+XBg48O8PIjxIHqJ1yTYne6gDmeiK0bzsSc8Ep
	nQ27t/ShYxl+mJXok76eLztPt7FmTPpem96nxSFVRQ9x5YLkTu1TtMOMG0H7evWEjyBSDa
	iIXP2GA/MzycPxckYuNqhZP77r9hP6095sKGVMXonKP3yIORX//xs17GdpBBmr99aSvXxh
	DGC+qZfRsN0S52/Mv0t+VTEOT7qgZzVgelPl7Um4OW2pmJl1QnDhCF9nH7os7L7Sb0Xv7Z
	PHapo4kEf9CMUsu/xf/j91kRIqbkdiv2vnhRU2NpqpDn4jeAaaI687oM5PwiEQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792588138; a=rsa-sha256;
	cv=none;
	b=S9IQz4z8979vZ6MEZIPMXQIOlMi8oGhu9HcjMk1PQdxKsnXNt9PavqnItUZRKwc5bxRKWi
	pPQkCSCGm9pv1HkymuqwxJQiggWjS+BCicB6X/j0ngpAYbArY2cjbBIwOvfBiYHAxeyEXp
	MI+QmLgtrcAJDnuZ5IFmHXuAMg2iILFRXT2zZhFVujVRdFo7k223jJsU2YGvS7otG5adnw
	Yk23AWn9ZKh7iR9nXT+Sl8cTKqKChXPDNirPNQXJdM1jSfDPpP26/Uf17JPB8bs68taqLz
	iyFFTYzq+jZ2AZ972Sdw2MYUDA+Ijp0FUHcOUIFqy12dO5K/lT3U7AZgsDWnUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792588138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NACHf3MpA2Z29v6RpiB327pgryw33carefl3Um/1JYc=;
	b=MbUI2xy/T2JvUfljrMMoGD+NaxevJ5ArDj3fnSudjSm1Zzp2mpAh9/7/XKc/07JIQXBwhQ
	ple4g8cTZ6BIbTmtvKUE79INCYUa1o/Rga1HDlbLYV16hBBNxMNdSnBzrrTxvkCXK/xLtV
	l4Kv4qDgaD4Itzug/Po7SngurSI5Hb28jtODZjSmV8s5OXG6QzTXGLSf9gTZEKEbaFMA+x
	7S0+rLktSUDSmgY/6yDNRKwtss9alTDYcmQOOAzxzcPyL5bAmMlGlWa56npUyp59lX/wh2
	IYsz4cn9E311q5/KauA8AHkm2WK9E2c1AG5RAURyeZrgbTeirci7hKTXa315AQ==
Message-ID: <5bf7f29d89ecc415ac5d7a3d62d0eac4c46e3a1f.camel@pengutronix.de>
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Guodong Xu
 <docular.xu@gmail.com>,  Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder	
 <elder@riscstar.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 15:08:58 +0200
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_060902_237852_ABC313C7 
X-CRM114-Status: UNSURE (   9.03  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sa, 2026-10-17 at 22:08 +0800, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
> 
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
> 
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
> 
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
> 
> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
> 
> Build-tested only (riscv defconfig, W=1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
> 
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
> Assisted-by: claude-opus-5-5

Drop, see 1e035297ffda ("docs: remove Assisted-by references").
Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
