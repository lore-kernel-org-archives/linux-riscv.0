Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D267C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rUHbLlPvpEWuJ1aMDgX2G9xf01QRRYrzFMbdNL3EIwE=; b=Pqq5uB5swaLJ1u
	h53gbWtoTCoQNGnF5sf3V1wLJyZhWLuPWacb4jjSk4bM9+fowK1zIYqs4bOPYFTixhsBR88BBO3E9
	3QAke6ISAt2kZ3zgUFHnEPXUVN+I6rc/acmJslOtZra+EiO1amQ3nJ2pEWO+/yHBakZK1E5Gq1IQN
	6jd2yZzoVRkNn6AlefP6EMkucGvLPN5snEnm1I/UUnjZ8FOcrXM8w03Kb2NOQCHIOXAOSeM4qylld
	S2XHLmOg1C6Fa7jEMU9lKZnqzoYyaigieqkBlLC4P1rM9w0hbutvDHa0Rmcrv+RFSgv1ogSil606x
	TbtehSLoT7McTQxK0uPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZMp-00C9QC-Gr; Thu, 20 Jan 2022 15:28:51 +0000
Received: from mail-108-mta192.mxroute.com ([136.175.108.192])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZMk-00C9NU-Fo
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:28:48 +0000
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta192.mxroute.com (ZoneMTA) with ESMTPSA id
 17e781a9fcb000bdf2.002 for <linux-riscv@lists.infradead.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 20 Jan 2022 15:28:37 +0000
X-Zone-Loop: bb9e3ecbe7c31cfb7cbfe52bc6acf91d704e673fdf63
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d4rlcBSsDMSlADxswOGFTDUxcitWqo4M6bUPgSom6w0=; b=Y
 cBI97RpG7pM4ucvHjBwkZMoxkSbQEsL/zRDaAqKe8oCW+Xjm+WeWmZPxE6+dojhEap9vQkDPhmlug
 IipZOJ5XutXwm2Y4Plz6ZZHD6oHxwrmva0CqGNz6S/1Yv/X2x9LAR+kDpXoz6KLbEESIP9X090zb/
 HZH6cHmNYSnExDT2fi8uv4m/fNYHNij6fNQc06E031lSjSgpPG8S8TvVbiZ7Ny+jDRqzAYYaiPQw0
 f//4DRDFnwqx5jII50eEtWrQru4lCrI5PK/4rozq5nk9CsDU71ZBwqiGz2Pb7phd1Y3cTjgvf8ChM
 Ws/+MZE9TJdI5ecpWoLa8rK/EWAbpcJtQ==;
From: Myrtle Shah <gatecat@ds0.me>
To: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org
Subject: 
Date: Thu, 20 Jan 2022 15:28:26 +0000
Message-Id: <20220120152828.4089364-1-gatecat@ds0.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-AuthUser: dave@ds0.me
X-Spam: Yes
X-Zone-Spam-Resolution: add header
X-Zone-Spam-Status: Yes, score=11, required=15, tests=[ARC_NA=0,
 SPAM_FLAG=5, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, R_MISSING_CHARSET=2.5,
 TO_DN_NONE=0, BROKEN_CONTENT_TYPE=1.5, NEURAL_SPAM=0, MID_CONTAINS_FROM=1,
 RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, EMPTY_SUBJECT=1, MIME_TRACE=0]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_072846_827556_DAB73DC3 
X-CRM114-Status: UNSURE (   4.60  )
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

These are some initial patches to bugs I found attempting to
get a XIP kernel working on hardware:
 - 32-bit VexRiscv processor
 - kernel in SPI flash, at 0x00200000
 - 16MB of RAM at 0x10000000
 - MMU enabled
 
I still have some more debugging to do, but these at least
get the kernel as far as initialising the MMU, and I would
appreciate feedback if anyone else is working on RISC-V XIP.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
