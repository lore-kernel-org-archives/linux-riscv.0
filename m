Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F09C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1JYjQoTAHcJBNnMvbkX+ymsu729pmrJyht6XahSdZo=; b=jbLLQyx10dTjFB
	jvDeaaUbEMaTAKRFGkg7csW1pPY2X9o+ewq5tl1xbAvJSaBrIMc3l+NYepkeOQNNFkAS7YsBXN97B
	lWeBbuXLwwpspLGp8Q1dR79wkDgvVfgIyUnwRcReeWpIPJqf8sUGmAHO+8xsFDYFC4Wq1PqJmyydd
	YzMp4qi1FMacO1EyiDOh095sHWc+Vm5EmLnNmKvG6OWx9kmph4HLdW678JnXSqI1WxXM56aHQvt/B
	ctIMcILPgW9jeZtBkHF8YCM0Gk97n+P2wCzucWfXHf8yO3ssuuZjcmE6y8p/RkkS1PnkvnQ8uwqHB
	Ck19+iCqjDIRNNGDTJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEv2C-00CeyC-Dp; Tue, 01 Feb 2022 15:25:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEulJ-00CWoG-VG; Tue, 01 Feb 2022 15:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F45D61695;
 Tue,  1 Feb 2022 15:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624A5C340F3;
 Tue,  1 Feb 2022 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643728084;
 bh=Si9E3r6pYgLyZE78Wh6CEM9V0J4HBM/qUu4KIFvH+oc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eEuBg74CDZ3f6e40uvnJ5RT+SSwK1btZFI7S/uL/U8kEQKFmaRhBsDqnLCSARwUZ3
 KNytW4sxdwomRz6uGtcIYBx5R1X/EtERVDp2SRYHEuDWMlN3gt5nt1U9B+R/mAagrj
 lBQAywSJoO832oF0w0SFIIsC3dtJb9ybRVuwkRAbau7d3Y+4ITMf+j3Y8lPLHnzFZQ
 g2XQSyewZOa2P5q0uosp1gznuC1qPs/vrzHrIjA5TrHE5af3auUXxeOjawqNSFn1jp
 gED0x9TRgUjeg9doS6jwQ+ATkoPG6AeEbYS6+hXrOxYNVImxP3ZQYMqu+qKHmQcDop
 k7rgXY9AMpikQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from being
 selected
Date: Tue,  1 Feb 2022 23:05:45 +0800
Message-Id: <20220201150545.1512822-22-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_070806_092683_EC66D110 
X-CRM114-Status: GOOD (  11.05  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv doesn't support the 32bit KVM API. Let's make it
clear by not selecting KVM_COMPAT.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Anup Patel <anup@brainfault.org>
---
 virt/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index f4834c20e4a6..a8c5c9f06b3c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
 
 config KVM_COMPAT
        def_bool y
-       depends on KVM && COMPAT && !(S390 || ARM64)
+       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
 
 config HAVE_KVM_IRQ_BYPASS
        bool
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
