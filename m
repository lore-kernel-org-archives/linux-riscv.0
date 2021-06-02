Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E91EC47083
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 06:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1AC61359
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 06:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1AC61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Owb7RECdfF0EaI1nMbRcVmGLxdMeOc0i+5DvLJb+vc=; b=rKexd5mcnfsRb+
	mCAwbBGcZiFo9p13V/mj4w4DfcBMiEtKRYoZ9Kxljg+43VESin4fc3CFem1EkTWuuqz+Vwc7VLcA5
	g9AGFon8ps22uzIdpB8c3Hl6u/GDoMoOxiKBxIpYAY8O7EkxhuhBSV1yqNJwB5Lg+F/oBrSARKdpy
	IeF9tB1drwgTPisLY5J3BZLHtaH7R74gpECaULVciWgkD8msUDj5iMMCvAhi0wOBY1tIsyl9ZlKFX
	Ls2WlHyhS84ZDzPW4K0+4/gxf+ad+eMgcBAfm/cIlWXg7OfeO1MvaG5MNUcPslgdOUUqIsle45U+q
	WOHfMUxEAcmM5VQfb0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKXI-0023NI-1x; Wed, 02 Jun 2021 06:39:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKXF-0023MY-JU
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 06:39:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2DE460C40;
 Wed,  2 Jun 2021 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622615964;
 bh=MYiHs0FZ4Dw7IMtBNoNMARh1n5xi8g6LSU/cAJoQvsk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hmNsSP9y7DcJ6spdECBthW7t5m/H2lcN6IbqWMuqRjpqFcjxkyzWVQKZ3d9bBF4mU
 U189QlTuyyktK8hOt7G8FHHtvnd83Ab8xIiUNQURvbu3fDUDhlUP+JnsH8xMnLNrNQ
 mOll0EX9+FdotwqaZq0UQaZuy6h0gj6N853xj0fiXxrAsYqPdzpl9CbZapR3yvUuZU
 Za1x72QUL+NvpXTDrNMPWPiRSfIpSGdsCtCY2A6TRZNY8QnmjVP7Twcgnh0zbaIVgP
 j3Buuou66Q1VQX0VPQF9kKmJlQR3xD5yOifbFbMSsF32PnRAIeTPaY/ptn+dkmXMsD
 Lqlunzw7bQVyw==
MIME-Version: 1.0
In-Reply-To: <1621851730-32287-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1621851730-32287-1-git-send-email-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] clk: sifive: Fix kernel-doc
From: Stephen Boyd <sboyd@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Date: Tue, 01 Jun 2021 23:39:23 -0700
Message-ID: <162261596346.4130789.2119773948104582418@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_233925_671390_27AC50D4 
X-CRM114-Status: UNSURE (   4.82  )
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

Quoting Yang Li (2021-05-24 03:22:10)
> Fix function name in sifive-prci.c kernel-doc comment
> to remove a warning.
> 
> drivers/clk/sifive/sifive-prci.c:573: warning: expecting prototype for
> sifive_prci_init(). Prototype was for sifive_prci_probe() instead
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
