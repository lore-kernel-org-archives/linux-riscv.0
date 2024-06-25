Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A0C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 04:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3EHZPR/7+qm9eX24Gm28dM+7ZtQK55vlICOUsfWScps=; b=RUsL+nu4AB3MTF
	Gwlc2HDB2Bvev/N2pfHiT9S5Su8cSouJrrqlEIc4dSk8tmpWsGMqRxAfbKlkBjHuBW6NvAcnf7SWc
	gIBSFAklOwV0hmhTrXOnMP7Sxn++lzZtMk4fVOLdtKieobrzmB/Uij7i7lXqzsm/rlNnBaidQJuoz
	rwmNR37ZIEEaV4ORUA9R8fzjiOCVDIqNKYTdXrLiquDO0sbjNaoB71fCoGZo0XInyfUsyJGK50JvU
	8+Syw7fMiwXAHUYxf+vA9EjX8VOYd3R0wudIJt8NUBMzA6HgGwYeOALJfrZsmS5y/Ba41lm53p2im
	RhDgoZLJOP5fYQSG+VUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxe9-00000001XNq-2uZM;
	Tue, 25 Jun 2024 04:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxe6-00000001XMh-1ylr
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 04:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 260636110F;
	Tue, 25 Jun 2024 04:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF558C32782;
	Tue, 25 Jun 2024 04:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719289144;
	bh=GrEKh3PyvywkkJCCh0CV+o3/R9l1xc2hMRsBib/V7hc=;
	h=From:To:Cc:Subject:Date:From;
	b=PfWDKXZ19DFkqKQAgl0JsO0UW8gw1L/cwoYdGwWjnSkaxuc668olCccWsqbQ3K7Db
	 /HCua12lXUZtN50DKmm43lplZ0vISoBLbxM514jSz7KhC0mV6Vj5+D4mpoKMoOrs5R
	 Tp8/JCHcqNNu95S7A+rVzGwc22AP5K1Rp9Aob82hqOAiH26A4DaSpPW5Xnc3Gqz0NB
	 u/7IgJbcdhY7ZT+DB8W7Spv3KVkBi6JKw3dtcnjpIMgQ0P2X44wWXkjjoMUNHvQ6xR
	 PQKa7fOZn7+QWY2Hp3sg4rMzH/GAJx4XE2YD1Jul4YtgAmA5BxfeyNPlJHQAhJypQt
	 LIuEp+c2Gi6Iw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] riscv: uaccess: optimizations
Date: Tue, 25 Jun 2024 12:04:56 +0800
Message-ID: <20240625040500.1788-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_211906_621557_2E22C1FD 
X-CRM114-Status: UNSURE (   7.86  )
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

This series tries to optimize riscv uaccess in the following way:

patch1 implement the user_access_begin and families, I.E the unsafe
accessors. when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled for every
word read. After patch1, the protection is disabled at the beginning
of the copy and enabled at the end.

patch2 is a simple clean up

patch3 uses 'asm goto' for put_user()
patch4 uses 'asm goto output' for get_user()

Both patch3 and patch4 are based on the fact -- 'asm goto' and
'asm goto output'generates noticeably better code since we don't need
to test the error etc, the exception just jumps to the error handling
directly.


Jisheng Zhang (4):
  riscv: implement user_access_begin and families
  riscv: uaccess: use input constraints for ptr of __put_user
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm goto output' for get_user

 arch/riscv/include/asm/uaccess.h | 201 +++++++++++++++++++++++--------
 1 file changed, 149 insertions(+), 52 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
