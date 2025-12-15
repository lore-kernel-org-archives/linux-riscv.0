Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8747D5B16E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 02:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lIJt6UicOwodIlwZVMifSR8wGqlsAVaFVk36dNAPBc=; b=S4ELmEFp0pva9e
	DarDuv9Gjl94LpNnZgViDvhEZmpjuPyCvGiol/h5exnsSMa9OI/30DwwQBaI5O3TRCn8rJDw+bCOb
	Etv/A0ZWMcceGw/UOXstFIOZL+1N2E4NyHVwfyAwYAjZXgzQyeg7axurNmFzaOLbn8tmQ5yJ0MrzL
	ay+ujbJd47WhbcksQMw5qbGR9up4BeSKZovbN8KYDQQMDrnp1DEW3pIExhCsOnrGqDqMbmDw7lUUi
	X3oATvfOdFZLCGBIHv0ks/w+g3hCER43yMMeeIZqXaBo516sKEEwcz+7HDrWZu4VDPNySft+W85oF
	htEE2uo9zvfdst/WLvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyjQ-00000002xbp-2Tf2;
	Mon, 15 Dec 2025 02:54:40 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyjM-00000002xah-0S98
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 02:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1765767183;
	bh=LiOFsrrj0KtqzqIbiahsWzPZsSJKwCxlNGMnrbqjcQ4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Cu11vrnwNr/eb++/XHQSyjkXNZMtfNEfU7a3ZX8ebT8q+E+nqsPIUqyhcWlbi4XyS
	 sfbuZpqWNLr7H6+HsFPomN8jj1UuAS0JchK1NhpbsIXXSKG/KIMFiWCwUTTfswJOGE
	 71bbJ4sDfd2sUpw8M1kVIZMYe4SOsVjsd8TtuK/E=
X-QQ-mid: esmtpsz11t1765767175t5383ce71
X-QQ-Originating-IP: XeUGLSypuNGU5v41rnfBMyEYp+WgNaRHp+98uR4Tggo=
Received: from = ( [183.48.246.103])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Dec 2025 10:52:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8115786445991593814
EX-QQ-RecipientCnt: 9
Date: Mon, 15 Dec 2025 10:52:54 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <7F2C864E2E9B876A+aT94BuAAOW_mzY3x@kernel.org>
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
 <aTs3eNLCKTR5boro@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTs3eNLCKTR5boro@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEbuyMJPIbYUrnFWuxHepkyOQxrEmHTrZknwel+/p4ifa7IGR4PPyMCk
	ntomL9JUBTuo8k9VhnI1Zg/wlAVoE96DGpwRwVsW7TefULgMnoRFd9mqhTKdq6y3DcJlmvA
	xDc4rp0kmAPIu8LD1O0HsldV0A/NNfqusFchmWTtVIuu7/G8jttxgfO2uUuh1MPeU5zzoVS
	l+Aj+N1PxtTUCp2Q7H/mWHvYl6HZxdl4aGMxwhrdX78zRooTeYllwwD/n3hOGufV7e9qkwf
	NCuxSFTQaoa93SZswOMx2VK2fA+maQt99NDFxNRZwTpqwDHR0hEFR6ey8AznZYIBN/nMVql
	C3DFqJqA4N33TetGxO7emkoKMfF5+JUNv23Ue5Q0JX+TwOAD4uDzsxgUha7eOv3Z0YJdbDU
	/w21/IviPrtFbOYM+TKB12ziBeYCxkGCXSUKVYiNKq4GwBli593+SnNMIyKM62lYhX0iAh7
	LExrjgQSwyyfCFOxNxjlFW1Akhffe4LSymQbp13/4jqfqOJ0BxC3T9GmdmP+7ltgZ7iExJi
	u3IbAuIClstZHjZg4IHlhDt7ddAaxJSSE3hGdhKJvrQpLkohkULeaMBVBe9yS5L4GtrCS8X
	zHTZe8Vii7xSY8YclAgBEsErvP9CFeULmPlsWDhwKmwZB8JVZcUjtF8I8Er9/Gy34I/Uk3T
	KrpGd8qH941SIZWskqUOxj23EsQoDmoNyQZ0x3lZKWxH1NQVBT2LmLYfea43tdRImjW8Plv
	BfF13Pb1TQAZgU640eqrU6SQ1gaz241Ra20dt6DpQf0Hj+ksMnCcGsidl3vV37X0II6QoAy
	ySrUXmZJ68linFfrMwC/wdRv1AiOknPSHwmOgY/Tdt6qPsRs3HeYocyHM8RGKgR8hNx5brx
	M9Z+Gxiz/vSsa9RoPN6rmJkT/VtAyePj4OxsjGohkVymcUPUpcx3O8nN50cSy9zMLbtKncj
	woVRLpRSOEhbwSbkL+WM9+lf+LNCyegh9N91+9XttBEiX+oypiEjfwkUkSZuGWSXt1M9C10
	+FVxXTmAtHkdoP4Mh3Q1B8mOUSJ6kePTV3a0bb8bzPMBDRA/Ve/jvytstuoT7Jk2C8xSPqr
	qO2Euo2NXoHKfVqaS4d+C93bSFECDD3P2nJ4waDaIei
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_185437_090818_89DA8778 
X-CRM114-Status: GOOD (  19.30  )
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

On Thu, Dec 11, 2025 at 10:28:24PM +0100, Aurelien Jarno wrote:
> Hi Troy,
> 
> On 2025-11-07 09:50, Alex Elder wrote:
> > On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > > enabling the use of I2C in atomic context.
> > 
> > (Sorry I haven't commented on your earlier versions.  They
> > included other changes to prepare for this; I'm looking at
> > this patch in isolation and haven't reviewed the others.)
> > 
> > An aside:  I notice the #includes are indented an additional
> > space in this source file;  perhaps you can get rid of those
> > (in a separate patch) at some point.
> > 
> > You really need to provide more information about how this
> > is implemented.  This patch makes non-trivial changes to
> > the logic.
> 
> What is the status on implementing the changes asked by Alex? Do you 
> need some help with that?
I've been a bit busy recently, but I expect the next version can be
posted later this week or next week.

                              - Troy
> 
> Thanks
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
