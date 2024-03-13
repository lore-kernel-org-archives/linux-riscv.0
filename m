Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BDAC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XD7Z+hx+yobP3v+K7PZiq+piMLjUKlmez7lgDpREC3M=; b=img0T7eK5l50Po
	faFzB+hAK9WOwromSjdYwFIivupAmcB/lAvhbJPrc0FWiHoi4v5RBA+k6v1y+gYnao0lDqnppFyQo
	F/eiOT4DlxkgPLcyVMKuEN3ELh2yh/dhHnYO82Bjh2R2V7IhZ34u+qrYOWxqTBvTvIpnnJ0rmQ8Dm
	L97UFUcMW4eQpBO8lw9YJWWlEqLcy24/Q62CMNW1VD1Zlq4ObcscHUguUnjKHzvt5NPqbmEz0fate
	hMfkQxnG8Fvq40yziivV/kDrQhxsIhWAfcV+1D/V6136jMfT3UzvluYHJcsZRe39DWw698tX7EPg0
	PEtnQddB0R8BiKHXHbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKYb-00000009QRA-0jmi;
	Wed, 13 Mar 2024 09:05:53 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKYX-00000009QOR-2hyT
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 09:05:51 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 83FCFC0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1710320742;
	bh=hzex8GVy1A6DhuERVgut3DhHXnR8ynA/aRj+HZfrGmI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=i8YBiMSSWB1gKyBsNgx996JhaURZDLnrGhmAj+E0n1uG9gB2BKDYVRvY8lw5iP9ad
	 0NEiMLcZUS5bbZqMcXgNrzHoJfxSSMzWtKR4LYNx+enblE/wgFBjgHgJc+aYmmgWrk
	 0MKAAeHuJKZdfQsb17U76NtGelm+ydqAb4AbJyJyMF8Lq1fxMfMAL8w19gO6SJShrj
	 OgYuwiEjc3yqETaQJIdlT6Ec7ol7b+JsA7MOVWm/3Wl8nrz/eqQlEFYlkCfEH6IUSd
	 wSEUQoHrEVMO5hLl4/Dt/fxZrr+DpMnFauQz870aAT7aXt/y9STWuyvePSSjtmyi+R
	 21PTIwnrOSBjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1710320742;
	bh=hzex8GVy1A6DhuERVgut3DhHXnR8ynA/aRj+HZfrGmI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Hef1er5h30zUfWFAow6aUvTmO9ZGDnXJ3MG7GtFkpLGLAjGbz+p1HSHBkokeZRRdD
	 K4QfOxNQTXtsLhRfc2NbWPVL1RAo4pw260p+nmJx50N0PJAmHNYgi/EuDgUkXvWc3m
	 jhgzOGAlZmfUvrrcVkGngCCv8X7o84THxeiQPenJ982Ab0rYn6nLanxhLGR15CCxwE
	 PdNwaC7VMVH8uCjEMwYrxhrOcBPEMo8hUn7s+RTHRMnXzIgMCw8zKlrrVIphZU1PdO
	 p7jn91p8MJSygbgUOt/Yh8daWQQtpBvIo8nxE+24DPi4puDSdC+yyhH2+gr2KzmYcx
	 D/QSEUi+/gvZg==
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<catalin.marinas@arm.com>, <evan@rivosinc.com>, <nicolas@fjasle.eu>,
	<tglx@linutronix.de>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<maskray@google.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <guoren@kernel.org>
CC: Vladimir Isaev <vladimir.isaev@syntacore.com>, Roman Artemev
	<roman.artemev@syntacore.com>
Subject: [PATCH] riscv: hwprobe: do not produce frtace relocation
Date: Wed, 13 Mar 2024 10:35:46 +0300
Message-ID: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_020550_190342_18FFEE72 
X-CRM114-Status: UNSURE (   6.32  )
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

Such relocation causes crash of android linker similar to one
described in commit e05d57dcb8c7
("riscv: Fixup __vdso_gettimeofday broke dynamic ftrace").

Looks like this relocation is added by CONFIG_DYNAMIC_FTRACE which is
disabled in the default android kernel.

Before:

readelf -rW arch/riscv/kernel/vdso/vdso.so:

Relocation section '.rela.dyn' at offset 0xd00 contains 1 entry:
    Offset             Info             Type
0000000000000d20  0000000000000003 R_RISCV_RELATIVE

objdump:
0000000000000c86 <__vdso_riscv_hwprobe@@LINUX_4.15>:
 c86:   0001                    nop
 c88:   0001                    nop
 c8a:   0001                    nop
 c8c:   0001                    nop
 c8e:   e211                    bnez    a2,c92 <__vdso_riscv_hwprobe...

After:
readelf -rW arch/riscv/kernel/vdso/vdso.so:

There are no relocations in this file.

objdump:
0000000000000c86 <__vdso_riscv_hwprobe@@LINUX_4.15>:
 c86:   e211                    bnez    a2,c8a <__vdso_riscv_hwprobe...
 c88:   c6b9                    beqz    a3,cd6 <__vdso_riscv_hwprobe...
 c8a:   e739                    bnez    a4,cd8 <__vdso_riscv_hwprobe...
 c8c:   ffffd797                auipc   a5,0xffffd

Also disable SCS since it also should not be available in vdso.

Fixes: aa5af0aa90ba ("RISC-V: Add hwprobe vDSO function and data")
Signed-off-by: Roman Artemev <roman.artemev@syntacore.com>
Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9b517fe1b8a8..272c431ac5b9 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -37,6 +37,7 @@ endif
 
 # Disable -pg to prevent insert call site
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
 
 # Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
