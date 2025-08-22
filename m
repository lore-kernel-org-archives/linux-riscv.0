Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B68CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3oWxS3ioP3BraQ1TfujNF7BWohVsIEqBW5xcCw92DY=; b=nKlc5duMM4/wrQ
	iDVFMPGYmPB85eSC5V5pZ77cGnevtftJrhkqsCQy0xsFQKZTVjOx1bqBsv9JB9arqiw6GvgQxkZrx
	V/79kP8WUnzysdr20iFVF759PQKQcfjcSYafzJR44PyeXXByEQqK70QmythiujDXyqNrRQMv6B1u9
	IbxzWKuEkDczRqelt99a0FvnxtdJ+zCvMH8AGxKf1sV4adAjSxfQHX+Q2y32hdObpNFyNM8FmDEsS
	PUtqotslHIm93FemO0NhH8Itr5gArtFnyZAxaAX2bod7ralf8OIVhqw2cdcVlcu+PtEz6ZgZPkGSX
	k6o3qTj53lz+LZ67UZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvO-00000004BtV-2GJz;
	Sat, 23 Aug 2025 06:40:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0h-00000003CZP-1M4z
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YwWJ3t2iqhIM1PWbKboTWosd9nKo+IGtfFahdfda79U=; b=I7tKDqhi4wQS74uZP6pFc/LnIg
	kXsvGToqjBsVpnL+IY36lEI2LvxbC2o5mxZBi9cjXE2SVmgIiwOeSjyThafJBbVnmtBkAWGgp2Ads
	2vS9QpXZ4oE0cRaf7jKIgyHeQpJRJQaIIElsPFm2VrVQ60I/tbQFCOJnafOELtP/DRariFkrmVrHI
	8+WE7nDrnBYIbk0kdL/1xf5hror9J8qLrm/YZ6KClT0iDjnZjOaeSiHMA9VVKoPAI3mkl+3suQ2S3
	oDkhXwE31b9ywy6QfJ545yl+mQSZJef8pZ/J9BjxYRM803HA3rg9VhRVb1Dabf787xzbUMZM+SJ8m
	88yiR1kQ==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011rz-01z4
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YwWJ3t2iqhIM1PWbKboTWosd9nKo+IGtfFahdfda79U=; b=u2V5F7I8ahpRRZJZcDat1iTt7z
	lNr4rpcPq0fJT4xlK5u1IYZvyNUW24odt2BJAf/J5ZmvpwZgCBRNtiPQdMxg0DXFyJWXOorfsPWuV
	Fx8Vj1p4XuOyZBPQUzvI4IjxRx8oIQ/k7Opimn0Xb1YbQPU/5h6P1Gj24hxWYHfjRP6uF3YHgpXA1
	c8Ia3ciFpQLkJjvQ/NyYZwXgd5HHG89q+vkkRFIPDpArvi2HhMs8PvXObJQnmd4wN8kOchizRtFPJ
	r0QFVUX/mlbJAvy49T3DrJJBlfYarHhbbYfIQcYt3fs6FkYo2bwcSDoYiH6F6Fbirn3n8ymM/lp3q
	5HQuTc6A==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGq-By; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DP4-206J;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 03/18] riscv: disable vector if big-endian, gcc unsupported option
Date: Fri, 22 Aug 2025 17:52:33 +0100
Message-Id: <20250822165248.289802-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_262253_135DBB68 
X-CRM114-Status: UNSURE (   7.83  )
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

You can't build with vector enabled at the moment so remove
this until gcc is changed.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f1c0a655cd47..ca5cd4cf6e15 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -656,6 +656,7 @@ config RISCV_ISA_V
 	bool "Vector extension support"
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
+	depends on CPU_LITTLE_ENDIAN
 	select DYNAMIC_SIGFRAME
 	default y
 	help
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
