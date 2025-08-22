Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049FACA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcjO0CUfPc0F6ppSatc4ILKUjZen0d8lp4qOdUuDyUg=; b=yAoNTxw7qiNKQT
	E+VYoL4GlRPoggcPi/J2MuFo+sRpjHI+mIdv72GIRpYl1nFWSvlwvAPWRuQdZigVzczN2gJOZa+oK
	/wUweD2hG+J2/BsaEDe9a54SAHBsMEV9JZTAEEALOSpyCyaFU32ftfWvNWAN59AB+znU5439QiyXz
	pKLzkxDNqbqJutSaLwIQ5IzonMTbxAB4Wq849tan1WGgx0DR1xKn0/ufwBe28UakAkzxXWVdutuWV
	70Knb9wElrpuWm5hM1igj9VSipubsIF2j7Ep0y7dWIGV1D9//j0f5Tu65Hi6CCbWAPGehvup+FPXw
	tZuCCHp4D0ndqj0QAw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUO-00000004MWh-1vL7;
	Sat, 23 Aug 2025 08:20:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0i-00000003CaZ-3RgR
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Aq5Z14P5MFvs+VZeTZMq9mW4xktEQubx8JId68QW7h8=; b=J+CUcvxaHIDI2S9IocPt72vI9G
	yEvPJj1l8UU+K6z9HOcilKGR6dhrcdKytMKwTY+z0vxpVoxZUr7fDYpJgk0npXFfEBO8lw3PbA2Pr
	gTTwRpbgt8VcWJo4/9Drwlt6ZvpNOxduGXdkMbsaX6zaLOalWM8b8noOju0ywFcr0oW130c4N3eyd
	dvNdM8iemtCs/mPHlQWr8zEh+CM3ikyEJNzs5PeFjfDbTSDXzSHQZKw+aHQKiWxR2SKu8TrEypw0l
	O9mqiGTbgIg+1eL4AjlnkRQswlWIBmb8t1oOT4Hm1efgKGmKDfIncDvo8MynmevYoLUGWIZW8GzGT
	RjvRhEig==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011ry-0eCO
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Aq5Z14P5MFvs+VZeTZMq9mW4xktEQubx8JId68QW7h8=; b=eHZxL9Ka5lL7iBGm+dj7tOxcio
	4N9USDbZoDbxtXouEcPIZhH7kuDM/2q3q4ILuaWUII9HXlr7Aj/Aq1WBiL2xK2Vsw6KyJImILDN+t
	l1z3egJpK2yJg3LimY7Kd85ys51wF/8OXRgfHd11572zb3bgo3QG3rRFoLm8ATLkYq0e1AlPKopES
	Ni87iYDABdraT8RwNF8agoF+YXNTnG3yauRBXsJLiScSkvVY98lloQeUSIoM7qt7ZfGsL4L8kRVv7
	zidTQK2irs1D5tg5XHy9nGN50PU4zP0zvRu+EymLJcXjA3OvNVnx3dTtK1yqPHjGxOLl5XSGYXkDK
	vt1B2yAQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NH2-K4; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPs-3AZK;
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
Subject: [PATCH 15/18] KVM: riscv: set HSTATUS big endian same as build
Date: Fri, 22 Aug 2025 17:52:45 +0100
Message-Id: <20250822165248.289802-16-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_528541_02879011 
X-CRM114-Status: UNSURE (   8.68  )
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

Start the guest in the same endian as the host.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kvm/vcpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..b47f12792f9d 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -75,6 +75,10 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
+
+	/* If configured big-endian, start guest in big endian */
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		cntx->hstatus |= HSTATUS_VSBE;
 }
 
 static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu, bool kvm_sbi_reset)
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
