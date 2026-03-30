Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3978FFB3CED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbU43yt7sYpkWsuOJ3aFfxGKNqFYWXu0Vnu2TeGiT+c=; b=x/GfVoubFxwVZn
	tGgH/tMh4f9saubOroRcqw555KCmM5SM2ayBiHMq0UGsnU3NeiYh7sQCEE/SSRW9MaBswP18opW+H
	4XNiQ+qVhI36y87q7rLbpLxwtT+8FyIjKo8S98EX+kIRzu3Hky8DRKulDartf1YPmn4A0mmsxX5wr
	k5Xn6ahhoPnal09rxrtGYQgktD54SzKj9tvfXlsMFcZxwNl0nIYPNrlRBzZF/7yXII9D9QChrQsvV
	zXWL4rchNXi1zATm+kbC+sHV87nwIWNYhJ+Wiv6uU9FJCxCzU8AiYjpOafN2SfF7FF8hF3cf+IM2y
	SJmwQsD3mPpjYK05fLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79A5-0000000AzCo-1Spb;
	Mon, 30 Mar 2026 09:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79A3-0000000AzCh-1Udj
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 09:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mTpQwvg5Mz9FjX0WddBd0PpBVlFM1npPuFntNiLEgxA=; b=h6bFyh8yKzbs/3Lc8pP52GXDS4
	YZO3CEexzy/P8FM/khHj5HwUAZ9Fjq3PiIkQciL1Obem0skI8wNYb8zK77v3Pq/MTM6EsU+aPcyYE
	/kbZKcnjHxcXoyhGuQHJD3QZzr2ndlXtXcRx+wge+iOarjSYWR1NGYsew8iOrxkC5YWsGMCj02VC4
	Hw7uyk6lBuRdXVXl/xRgarH7NoEKmxQTd1m6obD2AOPA2dsS8EpUUCZL9YSerX8YWHPWNQlX83rqk
	KlQ0hoFwCoKmOu4CKZLREQAWX6h9fFNFkWAhaXSKBTCCUY7YzPip/dryBNG8X5v3qIDfaByS3Siqw
	XqxzAh+w==;
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w799s-0000000DT3E-3pCh
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774863763;
	bh=mTpQwvg5Mz9FjX0WddBd0PpBVlFM1npPuFntNiLEgxA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OHTh3sQYXm+rK3EPV3AyeF22RqnCrg94S6xu8CfhCh8ZijApaWkB/gUET0yCk4t/Z
	 CvtXfjSvcfliYuuQ7izJdYFUznlbKoAun/vP5FDuErT1QoPzw3E+cYIxH1105iC6me
	 9QM6M/xNfEwJrh8ZpH29814IdwIzoBH4rDzLyB3A=
X-QQ-mid: esmtpgz16t1774863753te80528ff
X-QQ-Originating-IP: R17bfHIhJDpspnCPy1NFP2dyutidDbHlsa0JPjeHPGk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:42:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17267774757820905902
EX-QQ-RecipientCnt: 20
Date: Mon, 30 Mar 2026 17:42:29 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
Message-ID: <DF4450E7F5A1BB56+acpFhalHxjbA3d1v@kernel.org>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
 <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MlFTQbf74c0X8ovUWACn7Iogmr2oHDUhdSQLmQ5YLl1VxtGvXD3XGnU8
	3+2iI4SwvsXwB2uBfjgh8YCGE1Lp5XWrAxOe1uwUJj49KseKyARv90LsGskj/lW9N2bVnjz
	kq5AFyPeo7lMqwMPYOlD493y5X0GhTiY9pwLhjTBuph1KywbsDInuEY+2Nq5MSZXcTbFRGu
	0YxOSCNtX8ee56nrbubOHA6U0QjhgAazr6MA/Ji6WMUTuspUhnXs3n4/JLetnA+ZHPTuYdX
	L0mITTQzDArtwQDFPtBCUOC2gIxVgKimrCUlbO3J7eSrmNUlEN8CH9rJ5qKOdjVyEnMG7zD
	ZGDWR7i1G2RTf5fYUHV8B6DYbdnEdP78NBX4aL8ragIh3wOu8T7dGGT0p5iBpRzFZRgSuNg
	oWuCbarZjlq6f6laGhW66zmabJ4OM+4GpBOdit4w6feGzhzRyUmp4+dNbHARZ8oiv0gDk4l
	5a0E3z/5pd7QGrRbLuY7x1nhmVnz8lUUFJvYtD0Ri4/KdE80VaDzVqzhfWYqKCag7dswXJ8
	ZQWI3+pJvhUKdaqzj8XqBmxPXj+wnTR/Z7he7q2Lo42JWEkc/e/kZWfBZRaWr0k6wltNwO3
	5s/hAXSBqTdKHDyeNpnAexOoFhsYkI6B8JFSDKhG3T2VIfnYVfWenIDUz1rR0qSij/nAk7B
	5fjZ/sHgrbap98qI4GdXmtkPvsg+NjBqurQ7V5RvOu2Veg92MkH/qI4T849LAeMd6GP1hpQ
	3FsNJqDVpOeXf3Ct2JXTfL72OSrUFeu6k3/fQuKMj9HAYtA+UlazORbWXahGr5J+yVv9Y10
	n2pjCGiUzoFLP6DhT1Yff60kN15I9ZAerBJlRwBxB5yC9A+ntxneg6nsXdozC6uOTj27RPj
	BXjnqnpbnwT9usC9dmzaZIvb1Leb3KVn01NTcVDoDKEe6X+KSa2EjHjAtacv2dGaHfpXoiF
	hIdwMpK4OUl4saukKVGVRGMPq+rsyJ2TUC6VS5CVxXvEfYXbPxFkt/j9YLb4oaZkiRDAXhW
	ezwZVk8/eeiSgjcUTIUakpbTh6kHOWj7gJi8KPhgleuCufvqNh1Tkod54ZfArxG+3Mangwi
	4F5jb4u14uL+VZwCRsSxlzSOKkUK0qOyLHbIWsWbGoG/8OShA6wDg4=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_104347_610627_84CD701F 
X-CRM114-Status: UNSURE (   6.56  )
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

On Mon, Jan 19, 2026 at 10:41:22 CST, Shuwei Wu wrote:
> The thermal sensor on K1 supports monitoring five temperature zones.
> The driver registers these sensors with the thermal framework
> and supports standard operations:
> - Reading temperature (millidegree Celsius)
> - Setting high/low thresholds for interrupts
> 
> Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
Thanks for your patch.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
