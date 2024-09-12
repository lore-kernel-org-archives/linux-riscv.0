Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0338EEE26C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIQnbLo3ZLCUr2tHD4VdLAMz6Zk07MpUyYzC94J9WeQ=; b=nsVWAVWw8CXSrP
	Hd3wdRg/lcLMPtNMpPt4I6bA2UKbbAb6sXVCeWxkcGtbVMO18QIo2VGYGWNQr+2eZf8hYMi8BMQSw
	AHT60jS4wvjOzUy2tvm+4pwE3w5ZvxmJXvhv35x4A17Orzp+PLP9bWtcN9t29m9boW7yx4MnDnyHx
	UXQKbWagoYvJu/lfszjXF1eGOGKr46d9amm939XJrXkxf3rioBREvyXeAIJzFq6th/6AN7jmxmdJp
	I4HRW9WcPSU6CnsH4sEEaXhBtlXiqGvNDemPkJ3d5CtSGXI2kuITIdZn3Lps08B/QXCWld0diT+BR
	e9wviynAyRZsqN7pVzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sos3Y-0000000EKuy-2Hn4;
	Thu, 12 Sep 2024 22:12:52 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sos3U-0000000EKtX-2KE7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 22:12:50 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0360D92009C; Fri, 13 Sep 2024 00:12:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id F13E792009B;
	Thu, 12 Sep 2024 23:12:44 +0100 (BST)
Date: Thu, 12 Sep 2024 23:12:44 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: paul.walmsley@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
    aou@eecs.berkeley.edu, samuel.holland@sifive.com, 
    conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, atish.patra@wdc.com, anup@brainfault.org, 
    guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
In-Reply-To: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk>
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_151248_769028_CC73D78F 
X-CRM114-Status: UNSURE (   6.36  )
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

On Thu, 12 Sep 2024, WangYuli wrote:

> 'cpu' is an unsigned integer, so its placeholder should be %u, not %d.

 NB the proper ISO C and POSIX term for `%u', `%d', etc. is "conversion 
specifier" rather than "placeholder".

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
