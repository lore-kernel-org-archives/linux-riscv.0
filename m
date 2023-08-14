Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E957C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RPvxiDdWy6apXx1YjsEiuZsK9Ifm+7lcYtu8AQvMHXQ=; b=oCCxITv1WyhyZM
	EFKggfOUgmVwik/+AGcMlKJlrj1cDriMyEMdkG/RrZiPFQ2VQWH6aJYTETgPWbj+65Mv9suJYGK6c
	ECiutK2JcYBeC+kA7/z9/Ru4sg+9flZyf/rifh6EowwpcdfQDK+HnC8XWhkPfMErplvaa10KgRL2K
	svrD0z7JAf0364qVqXyvgsMiwpD7x+JD8fwA4WI+dVEsJSzaVT/8MaNQMnd4XWoIOE/DsVTaJFoVU
	1VYLNm8Om5hG0SZxLmDvBNCXs4xKk2whzQx/aiRBkHzxSQFJl9IjVlZxDf/60djGxnC4yZxPNcMWK
	6EUG+mPIYBzVD1aMDNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUPS-00GfXO-2a;
	Mon, 14 Aug 2023 10:02:50 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUPP-00GfWD-1P;
	Mon, 14 Aug 2023 10:02:48 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5E0C81FD5F;
	Mon, 14 Aug 2023 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692007363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IyKh5jauTYrhx4587vKnoX3MH5O7mJ8qY3Jx2CEtlAY=;
	b=LBi4WPhTJEUgWt3frmet2IQi5mawNGqzLrFq0pNFhUTyREGho0NX1Bm0aWeF3kyRSBrlJU
	+1LMjKZ9rr8NcmXs/XWIGxXkQZ1Wi/GA5NEmbyVTKzVtbOSIy/FsdcoWgyKtNHJOgYObPL
	+Y6IOJneFshthL7a55kWN7K3R4AKQ18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692007363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=IyKh5jauTYrhx4587vKnoX3MH5O7mJ8qY3Jx2CEtlAY=;
	b=9rxNXdttJwvs9OpKw1bcLCb3ybe4RAZlSCd9SekIT8srjzIr2+VR4Ir3VieOXKFMuUMHO6
	jgzb8eFNBDr9jWDA==
Received: from hawking.nue2.suse.org (unknown [10.168.4.181])
	by relay2.suse.de (Postfix) with ESMTP id 4F3BE2C143;
	Mon, 14 Aug 2023 10:02:43 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 41F824AB2CC; Mon, 14 Aug 2023 12:02:43 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: kvm-riscv@lists.infradead.org
Subject: [PATCH] tools/kvm_stat: add support for riscv
CC: linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
X-Yow: We are now enjoying total mutual interaction in an imaginary hot tub...
Date: Mon, 14 Aug 2023 12:02:43 +0200
Message-ID: <mvmbkfadjr0.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_030247_618539_2ACBAE3E 
X-CRM114-Status: UNSURE (   7.43  )
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

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 tools/kvm/kvm_stat/kvm_stat | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/kvm/kvm_stat/kvm_stat b/tools/kvm/kvm_stat/kvm_stat
index 15bf00e79e3f..05220b9d07dc 100755
--- a/tools/kvm/kvm_stat/kvm_stat
+++ b/tools/kvm/kvm_stat/kvm_stat
@@ -320,6 +320,8 @@ class Arch(object):
             return ArchA64()
         elif machine.startswith('s390'):
             return ArchS390()
+        elif machine.startswith('riscv'):
+            return ArchRISCV()
         else:
             # X86_64
             for line in open('/proc/cpuinfo'):
@@ -396,6 +398,18 @@ class ArchS390(Arch):
             return 'exit_instruction'
 
 
+class ArchRISCV(Arch):
+    def __init__(self):
+        self.sc_perf_evt_open = 241
+        self.ioctl_numbers = IOCTL_NUMBERS
+        self.exit_reason_field = None
+        self.exit_reasons = None
+
+    def debugfs_is_child(self, field):
+        """ Returns name of parent if 'field' is a child, None otherwise """
+        return None
+
+
 ARCH = Arch.get_arch()
 
 
-- 
2.41.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
