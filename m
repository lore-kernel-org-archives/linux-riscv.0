Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F0FCE08D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6BrExzH0tsQ/mXBjIQ+t0QaYLSaiN7sUHYSxI8rHucU=; b=J9wCBKcIuYtAYo
	uvw5Tk7ON087S3YJjJwKkVbpStRtHqq2u7qZ5i2zlK0yBahttZyL6anB68nbyCW6PjYbyunAjJTk7
	Y9dNX4z2AR4UWt68SrpJq6ShzMuh7qYNMfpGa3xqEMGjOrptVfI3zPEgIsTv2OHP5TOs79p8hpazw
	me0jaL2H3892mLetEyoBOYmPOAf1mOMk0xiEVYPDEekBxB1WDdHD9zinXt2RGSbdN8zuz6VToEkyf
	KboBAcsQuoiL8lfe+MsKLHWSjW+uaBqfdHhkQXLSTAh0gFbW4NpD6RWsMBrzcOuZCIZ/qkH0altZr
	nfwkpQ0yAWJyw35MUv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDU-00000006Jmz-3PTC;
	Thu, 26 Feb 2026 14:19:48 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDP-00000006JOz-0tJj;
	Thu, 26 Feb 2026 14:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yfLVFM+oU/NWcIIH45tixxiV4mTmdtkw+rbkH4ApJwE=; b=escqfQNJFPMIlXL3vrUb8dEfo5
	X+GRTkPUpTHVk8PD/UbNdrYubrjlEeBHtbWGGRjRHcLK8QkYw5fTMVlWHWBR4p6y5tDvigyxhOahN
	x4rPH1zTXxmwfuVx9j6S1q+AsKukd1XRJO5R8wbLCd3lV+e5urIk4IO/Mp4xivjf2ChMiUl5ZRI60
	WZSdkj5ussdfy7woOwm7j8q1d57zLH6yQ7fTz1QsaIssYt9RNN2KxbayVYexfRhzBrw/bCYun8hlP
	5OTYp5uE0puOOlxVRa4W1+Z1ZFiCcO3qrqLTy4HohDxYaAdx/mgOgt6QaO++e/ryhxO33ymCc8cXD
	s5saVNww==;
Received: from mailer.gwdg.de ([134.76.10.26]:38446)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcD5-006EFl-0Q;
	Thu, 26 Feb 2026 15:19:23 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcD5-0009uO-28;
	Thu, 26 Feb 2026 15:19:23 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 15:19:12 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH 0/4] KVM: riscv: Fix Spectre-v1 vulnerabilities in register
 access
Date: Thu, 26 Feb 2026 15:18:57 +0100
Message-ID: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G6hFivgV8SBp1CAuJFIE6d8tH
 gdm5gVjFTboqxeUk5icR4GmroDW6VgYJRYG73xw3gfc0o4qRgntYrqVMTXYRtdGCh0VA0p6Kc/
 y/NthzPkDOosoY2YAAAA=
X-Change-ID: 20260226-kvm-riscv-spectre-v1-4d04dc68c226
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
	<ajones@ventanamicro.com>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Daniel
 Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=lukas.gerlach@cispa.de;
 h=from:subject:message-id; bh=Vz58WHttVcNQG/3Jcd9G0PXWP0L7ogtzIBHgWQI8H8k=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLwuLbsoSz4hZar4j8WX7Uckm50Llp622yPnpOm6Q21
 3rF0tmdHaUsDGIcDLJiiixTBV8z9u1x4EnKPHwOZg4rE8gQBi5OAZjInwKGv/KG3F0zchdXaFpG
 6cyt4DS9nLYjjft8cdvZewWCZd3J/gz/a7qUey7kaMbKHH3G4jOjIfy6RdZL9TVGCwQKnNhVOk1
 YAA==
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-02.um.gwdg.de (10.108.142.55) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061943_273541_38732C09 
X-CRM114-Status: UNSURE (   4.92  )
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

This series adds array_index_nospec() to RISC-V KVM to prevent
speculative out-of-bounds access to kernel memory.

Similar fixes exist for x86 (ioapic, lapic, PMU) and arm64 (vgic).

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
Lukas Gerlach (4):
      KVM: riscv: Fix Spectre-v1 in ONE_REG register access
      KVM: riscv: Fix Spectre-v1 in AIA CSR access
      KVM: riscv: Fix Spectre-v1 in floating-point register access
      KVM: riscv: Fix Spectre-v1 in PMU counter access

 arch/riscv/kvm/aia.c         | 11 +++++++++--
 arch/riscv/kvm/vcpu_fp.c     | 17 +++++++++++++----
 arch/riscv/kvm/vcpu_onereg.c | 36 ++++++++++++++++++++++++++++--------
 arch/riscv/kvm/vcpu_pmu.c    |  4 ++++
 4 files changed, 54 insertions(+), 14 deletions(-)
---
base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
change-id: 20260226-kvm-riscv-spectre-v1-4d04dc68c226

Best regards,
-- 
Lukas Gerlach <lukas.gerlach@cispa.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
