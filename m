Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD01E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=insnG4qk6US4Qcv4p5dXF3BVkQbdgfZhSFshNLqyf78=; b=cMiFn1hM0zZ5YZ
	cNzaa+UkuCBXpOfmE6npH8kH/HwnqikqwDR2Pqd2Si/f57Tuuu8eD4ySxHMpUTT1GAhWf0Dlom/jS
	jJkmqpTmpIkZVgEwzsj1+HEOsIampfsUXw1sy7ulyf07mQaaaN3j7RS9KifVKGfjBIiCLtviDCwG4
	fct/5YlGucNNlvT42WheaeN0LC8Xu8TNVDIZjgpLSNNYd0lR8EmNkVj4KgYfqJzYTXjmXcBTEOZqi
	0nc0elGSkhI4KarXvTN7FRndfNU7rSFE1BYouGoXU6NKwNukyYdZ7ZKRl4LJrzFxgfWeggQAKTdR4
	be5EzeOWj3ah2kpSekyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFzn-00000001s44-0i4l;
	Thu, 19 Dec 2024 12:51:15 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFzg-00000001s3V-24rL
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 12:51:13 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Date: Thu, 19 Dec 2024 20:50:41 +0800
Message-ID: <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_045108_566521_A8CD9C20 
X-CRM114-Status: UNSURE (   5.95  )
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
Cc: Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> Add myself as maintainer of SpacemiT's SoC tree, which
> suggested by Conor [1].
> 
> 

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[1/1] MAINTAINERS: setup support for SpacemiT SoC tree
      commit: f187e72262c3245bc032a1a0f106784fb8562a0b

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
