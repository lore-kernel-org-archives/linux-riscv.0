Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB1CAC5B0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1NOI6HmZ/6FpFAKb+ux8WbXwas87ijAs7fpbZ0G/cs=; b=Dgh26Vv51XP6dH
	p6EFdJ1Rilc9uOnlA+1XOjgI5gQADEOhZ97QcY30z2H5v/yCPX7BSXEAG/8Eom1rM/k3VgrlduNaW
	1QA39w+oA/87kI1mPYk5SXRe4vvh2whSSWJs/GiSFTExnEzHOUCWY/UZ0THsZkWgJ7aqalAXid/QO
	yy68Du9tHzn8U3LUMIfnUesdivxATYTLceCV40B8f04IUVuhYEWpMT7QdvwLKc7hcZpLeSwr6Q239
	aQwN9AL8xRP0PZqQxET7+wOL+qwNFNI1duF/MCEmX2jAnzj4H6UMDUfT8vC6dzuITxOThCQGMgT5y
	kLSuwmt4n1wllvPJHcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37VJ-00000001VC0-2sox;
	Mon, 29 Sep 2025 06:36:57 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37VD-00000001V8T-2Mwx
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 06:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759127722;
	bh=ejimwnI9aX/m1BdqmcNn5j7nwrGn30aTITlrZgI0KGk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FW/yx/jNgaiXTemr8O5pO5W/myGrdSFMcP0NQvmn5z3X5CzN+9xvbXW9rPVD516w0
	 pnDVbuCnhpLoddXflwyXEdQKSDeNJAGwPzJRCmO5stL8peulZk5eXjxh795f3rU9M7
	 BWoqus3AahQ+zjT+jtSqL0BI3pSE5+LcnNxWboSI=
X-QQ-mid: zesmtpgz8t1759127713tc7836ab9
X-QQ-Originating-IP: NwVyzrEDCHyZaDavr4gvamMM7hZdIJSffBPvgKhI67s=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 14:35:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9334752308087901994
EX-QQ-RecipientCnt: 13
Date: Mon, 29 Sep 2025 14:35:11 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <BC3683F224622068+aNoon0so2erXE5I2@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-2-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927220824.1267318-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MfQnJH+7WKv6uJLCgeaendjzz7VpCXsS45ED/NVsqpSU1+JZ5K9SZQfL
	dHYzeRrZoK6Ub9GteZgPVgwiHaSjTIX091I5btsTAG7BHqpPTJdBUbfrsj2B5YvA+1HzstH
	AezOcJnA4Otk8scdjfQU5krbmW6Xl5Or8hP/gGuOefEKaasb6mE7jZ/RdLS4E9JywhmGn3d
	q3mCv+X9TOQFSdQurIfizGa+jPsqgmr7J4CQCsD+RkQNzr6vsWb2a4TKjCL5qoe4fYog0i3
	kUGTwdfMIFaFLc7et/KQxoVnqvYo1OboCmQCD2F1LLLLXsxlmDLi/xM+pbeL4hE42pN+EJE
	F+B7xUosduilGO486ycCH13vo3+aZnHK0yDtVmztxDyoqWXTBjo2wKGvYC7UZakYp36V4ro
	2/e4c/p8Cx6V0yzx+G0U2WEojkKi6v0f3QN6O537SCCe2d91RcsGh71yWFkdDqkAZD3D5Qy
	UuZ9FWqQC2+s5FLXYJkgjDlgOMHWrF2tiLa6YT9RISiDKxheFsqHDsmhBHE5vBwyFokgJkM
	hgzt6xp4wOeYK5nXPjKHrDouBOTKxtF26aNpfOZJCPGT/5aOGH4pqqqe2kXC/D04S4hFo9Q
	7TU3TApNacK6lEvOP97Q6AEbopxe/p7F3/q+5RbDsZEiL9ok93Dxftd4YwKmVRIzJtZXDYG
	b6Eeo3t04nqhu5YxBueEHtQ4DKFY7UfM3tfJJg6et60UV7Z15rqJle/phYsy9QIwEDw7J8I
	4El5lh64lighP8eqBVMseRM9NAtoJcN+58VYuqOvO90aicURNd1bMAXra1jsizx00bQHxCz
	hcoZUmwwj8Jzr8HnDWv+ouVm2ieoH9f9wNxWkj801dQkNSUmMtX6EMdCc0/LipyV9bB/GST
	WEXM5w5IZcVG7/nwUQl80/5SsoIWa2/g6H/W7rPv8mMWi4195iWCndj3WO9/IWYxx1tAt3W
	BKP9MAH6PnPk93fFeNb9vrydsk8AjmFwyDn+O7In65zaC/hSOBE8NjGmjulYbg76ohM1rwC
	MO8Py4VGtr2IAUulKty4mQuYWWa7eHLRb8blpNQ3DsTONxRlDI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_233652_118996_E8162928 
X-CRM114-Status: GOOD (  10.56  )
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

On Sun, Sep 28, 2025 at 12:07:40AM +0200, Aurelien Jarno wrote:
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
> 
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks.

Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
