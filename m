Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6652CC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnSxbWfoyAUa4wcnD/WWpBY4X+4pAABOX3n8HpWwEPg=; b=xkhQla3BC4jSgU
	iCq2p9aw1GeeZG2bwbTqXSqktF2pYKowwErXVgEUuJkov9d4hJO24K0lCCyKvxOg371hHapSO6cUA
	77BnRDx1WkPCIph/9LYZKnB5AQXuwEC+tAh0fSXp7yptHfzfZ4GJWtvId3cL/3jU/juBmBQmLrdCd
	Dm/90EiJ1UmaUtGudk01+5TbAVMozDYZU8201ifdutPGlFtI0bI1E4wVhu+KRGdCYAOE8Gc5Cpw98
	12J0GHWgOOerQBzcn9ZuIwtYrpQxh1n4wZ213cmX2AYU995IkrOFSnBISvD/Tj1qIDB7hTy6t1+QA
	Xixb6e2Ed+zEI/Phfnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1w3-00BBDs-TY; Mon, 21 Nov 2022 08:13:47 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1w1-00BB6G-5V
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:13:46 +0000
Received: from [167.98.27.226] (helo=[10.35.6.112])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ox1vs-00Bn5c-GT; Mon, 21 Nov 2022 08:13:36 +0000
Message-ID: <7cd41722-16a8-1571-57ca-b11a15279517@codethink.co.uk>
Date: Mon, 21 Nov 2022 08:13:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] riscv: defconfig: add SERIAL_8250_DW
Content-Language: en-GB
To: Corentin Labbe <clabbe@baylibre.com>, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221119121953.3897171-1-clabbe@baylibre.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20221119121953.3897171-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_001345_232856_B3078BFB 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 19/11/2022 12:19, Corentin Labbe wrote:
> jh7100-starfive-visionfive-v1 DTB was recently added, but all my try to
> boot it in kernelCI failed.
> This is due to a missing serial driver in defconfig.
> So let's add CONFIG_SERIAL_8250_DW which is needed.

This block is an extended 16550, so not sure why the 16550/8250
driver isn't being used as a backup in case the DesingWare variant
isn't there.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
