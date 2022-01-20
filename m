Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1843EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQ+3Ib1xUGDC3pW73aU+FdyVknsqjr52AXwnWOGu0Jw=; b=qA7KXIzhgwWZqF
	kPeT3xq3E/90kkF2RG5BI4JrxBn+2e/JC31Wbwbpz+ANuv7bDdX2Ughvoexc8pQr17IeW5ZMFxSZr
	vQ2hu82/NQ1t8pblIONZSozQ+1BzF6lYHwN5Q56DrARzFKRcJvI6D0aXkHGRhzNIeIs1fJIIEehvD
	9cYtsVKq8NIWChG9WCmwUNGoJNeS52fBoDu6NypqagIEIzXJElnKgJ78HTxLHuMsqxSslighASR4/
	r+jj0a9ul++UXt8Mj0lLZuq487RYmkaKRpzZvHwpA29jPUZSUh4jB8TzJc5aXeAwPSrRacuLBoGUK
	7HVphZQW6oynpvNwvruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZRh-00CAeM-ES; Thu, 20 Jan 2022 15:33:53 +0000
Received: from mail-108-mta198.mxroute.com ([136.175.108.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZRb-00CAav-7D
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:33:49 +0000
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta198.mxroute.com (ZoneMTA) with ESMTPSA id
 17e781f463c000bdf2.002 for <linux-riscv@lists.infradead.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 20 Jan 2022 15:33:42 +0000
X-Zone-Loop: 672ae8f6019713fcea94096f8e005a0b02da81e98225
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2v4DZOWcBj4ZyoLreQSqIsp5ilmMxSdh4/YlkMV5FoQ=; b=x
 AXMsNMrtSd3uKUlB/opiUwvz4n//3saEcZ/iYeXr47XtWPaRq4sZiwSvVP/AEAOJylcasNojwevD+
 xOjwFxSVMEwttzNPYQwFe/MkLMg5UcqLjPhcY7dfpOOzfOrn8oFrGgwWLVVGo3ZGvTUWwcFZUjzpQ
 TIjaZ3toucw+I1MxV1U3q6H0E0gyhs+NN4xCKvAE/rlUafDtGIrhZlpFPrOAavAXomVJ7MW032pRw
 35cOEKekW6TBZwjQzOpj9IZqANpbaC9hoKODoJmrqWAomhW05S/4elUDGNXdplam1xHQU6R3tCoJ4
 RCzxr+GL56zU4SaN5xEQDCE+0nPhTpKWg==;
From: Myrtle Shah <gatecat@ds0.me>
To: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: Fixes for XIP support
Date: Thu, 20 Jan 2022 15:33:36 +0000
Message-Id: <20220120153338.4093003-1-gatecat@ds0.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-AuthUser: dave@ds0.me
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=5, required=15, tests=[ARC_NA=0,
 MID_CONTAINS_FROM=1, FROM_HAS_DN=0, RCPT_COUNT_THREE=0,
 R_MISSING_CHARSET=2.5, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, MIME_TRACE=0,
 BROKEN_CONTENT_TYPE=1.5, TO_DN_NONE=0, NEURAL_SPAM=0]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_073347_417222_073F3D6F 
X-CRM114-Status: UNSURE (   5.23  )
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

Apologies for the spam, resending as this appeared to break
the first time.

These are some initial patches to bugs I found attempting to
get a XIP kernel working on hardware:
 - 32-bit VexRiscv processor
 - kernel in SPI flash, at 0x00200000
 - 16MB of RAM at 0x10000000
 - MMU enabled
 
The system isn't actually booting yet; but at least the
initial memory management setup completes with these
patches as opposed to crashing almost straight away.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
