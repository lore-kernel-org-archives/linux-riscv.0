Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F62E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8H8yKkUp+1hR0HkQU/Ky0EmZfPOvYCJaoidii4BmqZ4=; b=mCOlOFxVPD7kVy
	A07rW6mk7lLfVoRpuM8/a+1HlsK6ek4KPXMRPXHkpztWOlKzGKxy5vD/fTUxhHaAPx35fRqGqzSid
	ZD6OGNXko0QoPsWvFBdRg++s0iWonqc/lFe4R+IubIyI45SaKLgWGQtDL+GeWIrUvye6ry+d962Id
	eADpVhnfnZm60/uO+l7RJuf+V8p5z8D8XBIUwSGm7utpEh7+27hHDjLfgCDsQR7FwXxh7DwZsWYnu
	gmvwqKmiaYdyMLtb+6UXNmrjZVHVJeWMDNYJuQbYxs0lEM16mFz4S63FwZ1UouXBk96p1K7usF/qr
	7e1S/Ed9JurgTf6J52vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOH0D-0000000202Y-3Wvs;
	Thu, 19 Dec 2024 13:55:45 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOH0B-00000002029-3IVd
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 13:55:45 +0000
Date: Thu, 19 Dec 2024 21:55:34 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241219135534-GYC3697974@gentoo>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
 <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
 <20241219-lumpish-reach-00c29cf962fa@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241219-lumpish-reach-00c29cf962fa@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_055543_843266_218243A6 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12:52 Thu 19 Dec     , Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 08:50:41PM +0800, Yixun Lan wrote:
> > 
> > On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> > > Add myself as maintainer of SpacemiT's SoC tree, which
> > > suggested by Conor [1].
> > > 
> > > 
> > 
> > Thanks, Applied to SpacemiT's SoC tree:
> >  https://github.com/spacemit-com/linux/ (for-next)
> > 
> > [1/1] MAINTAINERS: setup support for SpacemiT SoC tree
> >       commit: f187e72262c3245bc032a1a0f106784fb8562a0b
> > 
> > The for-next branch will be sent via a formal Pull Request to
> > the Linux SoC maintainers for inclusion in next merge window.
> 
> BTW, did you get your branches into linux-next yet? I forget if we
> talked about this before (sorry).
yes, I've sent request to Stephen and he handled it already
https://lore.kernel.org/all/20241029173322.4d879601@canb.auug.org.au/

also, I've requested to join LKP project
https://github.com/intel/lkp-tests/pull/386

> 
> Conor.



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
