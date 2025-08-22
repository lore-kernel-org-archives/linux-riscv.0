Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90466CA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Gz6p2lywjSnvezRExMd8COWbZcqNEuqR03Cpy2qpwg=; b=bSv4CXdfNCN/u/
	rf2KZBCIo6NyKbcYT6CvMnbOoFFQDtXXvZRnnyIyWeijLc2wddkSKJehgaMZpBHEfaxMtHBc1xDEA
	aqzTI8w/82d1DBdBtPmkvujmC/+Fxy4xEJOGJWDkhFiemklUTWFRqasna8Sgdz+W2kSYbU3lAznCw
	UubI3gxD1rqOo5pENooSWy9UbprqQer4xVyo+20Nt7NtYgSaTx9nD+5rlhtFcuDhXNpgDtqufez6h
	1anrLtQ7t4V7bBYhIMSHBtKdM1tTY6gLnp5lMGtsrtR1rvLGFt8G+28FmFj3xmQFcWzXwU0xZwHsw
	kriTrGCShkDx9xdSHeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfN-00000004UgC-3KZf;
	Sat, 23 Aug 2025 09:36:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0i-00000003Cac-3uaA
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8NMlIANHqLGuXVeRU2w2SLuLvONLmQPocTyENdDBBGU=; b=YtYxT94R/yOw+qHqpat8rEYHxo
	rv5DJoiLXSbBb7Ocxc/zXavSeXIJGf9dUBf0sri8RCC0fR2GCkZ59SQpTguq7KJll7GD7lQATUdMC
	UrB93GQqTV99g8IM1Pu8/HM0P/bQ1Wa/TIP1Q6RiaP48kYRTv+eZQ/1t4PbRChBc0XJLL2gwzvQJf
	SRe1XxsCU0y9/pbSp7qb05OmWaqNeH5ThVfu3+n6jno147q1goevk+TmDg496dRXhr507t7jfp7mB
	4Ddkz1h0NfpUpLn3o9dhck7o+n0oJDk2wJAnCH7Wdz686EpY6a7KDO0IsGx2Dc6E0hwtiM1dJln4O
	8MSOwgPQ==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011sA-1PHB
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8NMlIANHqLGuXVeRU2w2SLuLvONLmQPocTyENdDBBGU=; b=t0s62jYRX7SMwVPmV5cv9xrC4j
	e/2Avjrc1Ji5GFOjJMXrav7NxNmTkol4JiiO9fs5G8/Cj3hpazDM81l9C0M0k4j57IeMNv2peQI8X
	oxI5cHpYKleQT1U9rDZDG7M1SH3zvwQQfqkjLfomlv2tmaK9WEDp3Ai4njN+lJRtx4gXby5yoNVlH
	hDsiM/3IOD2BgKJIEMYPha/Nx/ogJwOxAlGqdHH9X5Z2pLR/KTEgaXmJs957NLkbjEbcK2Oqpnxos
	gZfzgVoTsuWIY/W2PLzzovZhzxLBWw89LD0CEqW/Fu3XMm5jn7GtQjhj4ykTVkNPoys+bOr86r+L1
	tyEK5h1g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-0015cr-5l; Fri, 22 Aug 2025 17:52:51 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DQ8-3TLf;
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
Subject: [PATCH 18/18] KVM: riscv: add warning if undecoded instruction
Date: Fri, 22 Aug 2025 17:52:48 +0100
Message-Id: <20250822165248.289802-19-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_527527_AAC7DB05 
X-CRM114-Status: UNSURE (   8.70  )
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

It seems a good idea if we get an undecoded instruction here to
at-least print an error.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kvm/vcpu_insn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index b1edc7b10d7a..ce6ef358c9c2 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -557,6 +557,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
 	} else {
+		pr_err("%s: insn 0x%08lx not decoded at %lx\n",
+		       __func__, insn, vcpu->arch.guest_context.sepc);
 		return -EOPNOTSUPP;
 	}
 
@@ -674,6 +676,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		len = 4;
 		data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
 	} else {
+		pr_err("%s: insn 0x%08lx not decoded at %lx\n",
+		       __func__, insn, vcpu->arch.guest_context.sepc);
 		return -EOPNOTSUPP;
 	}
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
