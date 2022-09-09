Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF70ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=opNfvMDinCeVr9VvghSVqj6gAyolMQtGlLu6xbk5ntI=; b=Ur1HyiHz+Hlq/Y
	CFzKZr2d6/2GlosKmIP1x9OJMmi02uet8+isxLb8URc78dXBt4Cg5tLRiY0NmzA2Xa00lzr4jRTqi
	VgJHEdFs02bC6N5htCXPp1x64PKnI1FJK65u/w79oIBuM/i2NTEbUqIPMIuxOKQZS5EP9kkoA6qtc
	hb9xxAhTezeSbUfoUY2Q6GxiNPv1/Ho81R3A8p0lF4wu55g/ADPvJg9LL43IE5FT8lAcYUAj2xtrY
	VHKrzr6cC4ahY7Sp5CFGaqAbstrJn8YYGVVymHHw3Mw6TSA4CQHwxHJCSb7t0Jip2tDFDKIU2sgOP
	AEtZ5wi0uE3KnU041s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEo-00GpBf-H1; Fri, 09 Sep 2022 14:44:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEl-00Gp8m-9W
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 14:44:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id y3so4551659ejc.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=k3ciMSyFCuOA6zWZQpIsssZHC6Pb6ZdU0FLeRzQshqo=;
        b=JCbmmxPKtO5uEXG2+lr1jBwF3tVA2ZE1UK2sKj2KPQ2dVJ4R9a99B2kNDRZBe02PDz
         f+ZJtKKGy5iWO3iU+eb5aYAUyfmgSXX/fytnuRPPgGqtvUncLqk89ZNQt84GXij5GFMS
         4pNC1IInfVDto7ZQQ/6KxgUVcsoLZGV1iBwbQ+Wy5UDV+oLCnaftYiLvaLBum5B31UcA
         RhJvJp0g2zm9X32wOK4jU9L7Pz9xnp0BSL/yrpm9hw7F/4HVNuJ4CfXo+NTuiQEr+IHy
         fBHgUdSJovE6uq+/tcQeNgsJS1hyK4m37nv7l5Afrk7vjeTwvLt4KjHQnz5NbIEgnU+n
         6hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=k3ciMSyFCuOA6zWZQpIsssZHC6Pb6ZdU0FLeRzQshqo=;
        b=L2Bjj0EFuZ2tNvAKuYNGQSYaOjUr/zryz/XKsKH+tPK+1AdcyghDdvNT1z+3DjCHeE
         hPfq5sEapHXvYTJ6i9HSip6ogxNECiGrsE9Y7lBaLnAbn3QSC9KGEsl7LNITuctKLkVx
         vuhVyco4uW/+qISNRppeWo8dxpifLoookZhFfFbXQxNjVgYbDQR6HmsSZ6+AQfsBTuRV
         cMKYDM2+F0jvT+Ge/ggUWaurjqxV/F8Bci/3T/7fgC6DFj9DAKBbDgrHAOdKUSHJoFNe
         +nsYZJT05q9Rg/+ztEbdG1rVCmhBKHk2SHlz/Iixj8XqEzIsXCQ7LZycsLXzIqVWxtEY
         EOQQ==
X-Gm-Message-State: ACgBeo1ddsCmVC0AJfEXzMS8zI+xNTkPRIvp+W+9vkPCkDTVJ52ti7mc
	SAQ6ky5Xt9b9kaH0Tr7jxDk9qw==
X-Google-Smtp-Source: AA6agR7h2Xnfj7q8gtThyYuFwg3lD6LhHNl1ilWuQQojsRx7wb6h8WWesz1IDcElFLT5rEaKC4s+jg==
X-Received: by 2002:a17:907:2723:b0:741:4fbf:4658 with SMTP id d3-20020a170907272300b007414fbf4658mr9732854ejl.424.1662734642197;
        Fri, 09 Sep 2022 07:44:02 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z25-20020aa7d419000000b0044efc3d4c4csm490048edq.33.2022.09.09.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:44:01 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 0/2] riscv: KVM: Expose Zicbom to the guest
Date: Fri,  9 Sep 2022 16:43:58 +0200
Message-Id: <20220909144400.1114485-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_074407_353024_0CC34864 
X-CRM114-Status: GOOD (  11.33  )
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

Add support for exposing the Zicbom extension to guests. This has been
tested over a QEMU including the Zicbom support [1] ([1] was rebased and
the Zicboz support from it was dropped.) QEMU was further modified to
ensure the cache block size was provided in the DT. kvmtool was also
modified [2] to test the new KVM API and provide the guest the cache
block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
cleanup patch from Palmer and the move and expose riscv_cbom_block_size
patch from Anup which was reposted [4]. This series is also available here
[5].

[1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
[2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
[3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
[4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones@ventanamicro.com/T/#u
[5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom-v3

Thanks,
drew

v3:
 - Added check to ensure the extension is enabled for
   config.get(blocksz) [Atish and Anup]
 - Opportunistically switched all extension checks in
   kvm_riscv_vcpu_update_config() to riscv_isa_extension_available()
   from its __ counterpart
 - Picked up some r-b's

v2:
 - Dropped a patch that output the cache block size to dmesg

Andrew Jones (2):
  RISC-V: KVM: Provide UAPI for Zicbom block size
  RISC-V: KVM: Expose Zicbom to the guest

 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             | 17 +++++++++++++++--
 arch/riscv/mm/cacheflush.c        |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
