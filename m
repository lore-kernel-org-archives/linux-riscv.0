Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14478F8E4B7
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLkiHwW97qVGOJSS0jEpJz4PgNxAksv046iybWeKPy8=; b=HhJe69GhC74+I+
	Bet4sXFzfjXEXLW2Ppg43/17TtqrVbRfas0CgTICQkS1zRUyJ+AmCkBAltR5yi77s99dY3YEzFE9p
	2HegdbUhwQICI2wzHCYU5x1wkAjrcEctmHe2srI54ITxEYPP1daDISumo1kFiVsePH2Mf7MTkyqIq
	c8gcMIrn4pLRS2eaVg8hfj9VCb061ugXAc76EPY+vpVWF4nKnj8a34IFt/GO4o60eO93glwJ1NQGC
	WRZdf1Aq3RHnRCraDTPp0BCiUebsvqWK7NlDj6jbbNE3zia1gsHPS+b0zqwLmuM5P6kaF+041k/iJ
	ePK6vC1rzigRZ5vAhZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdgz-00000003aax-42Ig;
	Fri, 17 Apr 2026 07:32:45 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdgw-00000003aaQ-2KIA
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 07:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=gmUV+DodizzV2u9yaPhetrXhfBThW2qF7
	dbOjOhNN/U=; b=moc7a95jcKXvNdMeqN/HsxkRWZtNpFZbfATEPuOKBEruWTJnv
	fvaJ9Se+9HUY5FVHtTWziySwri9zQLywhPTPYsoWw9vmY2OJTSuZ1t2vgYEsGF1T
	6LmGWBNRtvRh95NJbAmGaazMLKWpR1NCam/8nxFR6PQJSu2JCkQxIqCfnw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEIv4uFpAk0CAA--.1242S2;
	Fri, 17 Apr 2026 15:33:03 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: wangjia@ultrarisc.com, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Zhang Xincheng <zhangxincheng@ultrarisc.com>
In-Reply-To: <abfrDBeJrValJR9a@ashevche-desk.local>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
 <abfrDBeJrValJR9a@ashevche-desk.local>
Date: Fri, 17 Apr 2026 15:32:17 +0800
Message-Id: <177641113786.3193169.8990532982066985425.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776411138; l=1182;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=aN0rsJ4q1zoaahR2+BdQHCBQHbLtaeNxlxoCu0kF838=;
 b=B4bHvKk8PNqvwjIq+0ZMbJsa8wFgeiPY8fRDGOjEiLRPApBTQxvvWTiA6uBlHe7boCo8uJkh0
 rhTDJoGZtWkB2gbU/A0VozITHxqPCRt4MmUBSfMmSvnTzGHwhmro4MQ
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEEIv4uFpAk0CAA--.1242S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy5Ary5CF1rKryfXrykAFb_yoWkGwb_ur
	yFkryqvaykWrsxtw45CFW3JrWYka10qryDGrW8Xr9rK348AayDGw1q9ryav3WfX347tF9F
	vr98uFy3Gana9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWnhrj0AGQAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003243_159032_3F8F0C50 
X-CRM114-Status: GOOD (  13.77  )
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

On 2026-03-16 13:35 +0200, Andy Shevchenko wrote:
> On Mon, Mar 16, 2026 at 02:33:23PM +0800, Jia Wang via B4 Relay wrote:
> 
> > The UART of DP1000 does not support automatic detection of
> > buffer size. skip_autocfg needs to be set to true
> 
> Missed period at the end.
> 

Thanks, I will fix the missing period.

> 
> ...
> 
> > +#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)
> 
> Seems unrequired.
> 
> But to make sure, can you elaborate what's going on here?
> What is the reads from UCV and CPR registers?
>

Apologies for the delayed response.

Our DW UART implementation on DP1000 does not provide the CPR/UCV capability
registers, and reads from both registers always return 0. As a result, the
autodetection logic in 8250_dw cannot obtain meaningful capability
information.

To handle this, the current approach is to skip autodetection and rely on
fixed configuration via a quirk.

If there is a preferred or more appropriate way to support DW UART instances
without CPR/UCV, I would be happy to adjust the implementation based on your
suggestions.
 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
>

Best Regards,
Jia Wang 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
