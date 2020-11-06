Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75AEC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:08:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3A4208B3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFsjpmsb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnOhTeDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3A4208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P9K5OVOrH/UE3W4mPSXwcCtOBA7vlyzXPbO64mBMxRs=; b=lFsjpmsbQzvpS4PhcP3XM1gwk
	kKvvk8VbeSjBx9porkOi5W4dW3Q7Z/7dBo/fNRKKmzlCznjuW7R6OU9yXlHWGOzKZhgiapszssgJv
	ezflNvW1PSPsJ1V9uu7xXdBCKaolpTu1v4KYjXF2Al8oL4MGOsj/QsF0YN3qc17Jr/qMzsr2Rmh6r
	OQif/afp0wBGmAhSwz6JMDv7dz8b8vQvQHcQ3PPjHQOi+uCAgfz3GOtMVmJPAgtHetDuSfqWJdpWF
	uBN64UXB6wkXKEzVo80i6IrfjPxaaALg8zuwOBZZqa9AhsfD0QDvzuyUxgdqfvH+o/Xa0rVL2CIKf
	nGxgFklCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaxio-0005DC-6O; Fri, 06 Nov 2020 09:07:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaxij-0005C2-UC; Fri, 06 Nov 2020 09:07:46 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F177A20936;
 Fri,  6 Nov 2020 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604653663;
 bh=/WyFgfLiGBaivhLHjIz34mnY1A6swv5xaVPIuWmwMgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnOhTeDRPNs0Thwdi2AySf3T1uexugRszfvWjTL6d9s7t8NaLOaMvcWnq9sQYeJUc
 GbacubcrP0u+B7mW9YZ5SSiBCSKuabvXr3h71sH3dJLaHkvvV+JpmBESXmXrb5rVte
 /PVOJcyd5irAOomsEe/Wr/aFsSvgpxQ1Brbh0h18=
Date: Fri, 6 Nov 2020 09:07:38 +0000
From: Will Deacon <will@kernel.org>
To: tangyouling <tangyouling@loongson.cn>
Subject: Re: [PATCH] arm64: Change the location of DISCARDS
Message-ID: <20201106090737.GA9496@willie-the-truck>
References: <1604486932-18889-1-git-send-email-tangyouling@loongson.cn>
 <20201105214738.GB8600@willie-the-truck>
 <759a51ad-8b2e-24bd-52f5-99769ff5557c@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <759a51ad-8b2e-24bd-52f5-99769ff5557c@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_040746_077535_2CC14291 
X-CRM114-Status: GOOD (  12.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 06, 2020 at 09:06:42AM +0800, tangyouling wrote:
> In the include/asm-generic/vmlinux.lds.h:978, the description is as follows:
> DISCARDS must be the last of output section definitions so that such archs
> put those in earlier section definitions.

Sure, I see that text, but I don't get why it matters. It would be nice to
have some rationale as to what could go wrong if they aren't at the end,
so we can improve that comment and avoid the inevitable regression in the
future when things get shuffled around.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
