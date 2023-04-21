Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A130C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1WfUU2I/xWQ6klGlStOvFM31MooutLyhNWPC3oqf88=; b=zpmyhIfZidayNR
	0v2jab2jo8zEzVmL2NKPqUrxrwp2mcCikdzpTKe+iJS787ac9pM4tGNwONG5ULnUO0vreMbFEj97X
	WIU+pUXepiETQiWgBzBs0oCx15jm2VJm/rOPSiQBQzSKyI1k/rIsLdTpuc99czTy5RnxLrCnZlgY0
	0GWHRJpO28CAhS5PdJkQASYIN2c8fKZNtSjSliyhmkgpBRH83GB/9yC50YpjdGDHUPVfm04L6UOEB
	tK4NjU650ejGisJyJCumsN6J4dWnAGQgrgqUzAPTOm5NWvSteVpL4N8KNjOidXME2zTgi1nDa+pu/
	ncurBUHObyp9vE2Bo6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppspR-00BINt-33;
	Fri, 21 Apr 2023 15:37:42 +0000
Received: from mail-mw2nam12on20604.outbound.protection.outlook.com ([2a01:111:f400:fe5a::604] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppspM-00BILd-0A;
	Fri, 21 Apr 2023 15:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epunw6JjPghDxoPv/QLAqqf3oWlVydNOPHaGDYKsmwOna53vaVLx83M46yd5rYlFJCYk8a7yXA3qfaBkscZ6jGapPwQNIjz/j+Rq44qTNPTxhMJSbz70N6dByjMWddXacbhLupihCprROG/CJwDY9vT2IwH8+a9a2Psyk77P36kgjKTZg3vDQEKdKjNjR2DJmcmQ+POcM5C0hdW27MIeESmNIgXYCMMSBc2pLTWUlyUGe2rl8s7btW88Zpm+debxTZB4FS0NmOF/ZKdX6bBooYnyMoxbktz1CYC5PNOSbw8zY8orECEyHieyyX+arT+1Xg3LpdJ72aAs613HdHkZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prDgoKRe+Ymt/phsKxNzECnbnsDP2IrLEcg0ZELRgMQ=;
 b=JH2QJAPBL7NTHxPe6FG98hS8LGbLEgr2sRSxq1+xLJSmdSmnV/iHnU6CcmDCa5IwWGyL64urhl7nTZQNQ9hQZjhVkmFL1wx0i/yj+OGw8pEvpI/Tam7O4iB7yg/1YFJN9ll60u+oawAO7PhvDe8a5R0NEtZUuBojWedIRFBj6n23t84wHN4zWxvblF5u9gBMr++e7MpUp8tXK+821ZoWkzK7rfyXIDiYtSaJZ1Ku/bBGZ8Fa4yTeVu223NdGjFg4ve8UgdgUGP4gOdeiU5KOB27Nzy0ixPKGsBGHuQ6wQACDueEkQrs0Q7ecVMjsDCfcSS4mbq1jEsHtSGrlbcuu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prDgoKRe+Ymt/phsKxNzECnbnsDP2IrLEcg0ZELRgMQ=;
 b=AEeDcuGCVzh2KDotHSCDuJdRlPfzNcO5DYnVDs6XK3CMeA+PNjXEtQ1XPAQqrHRj9gvB7YPhFQdle5JbdjGa8hYBrAwWtBexD1tcG+iEkWqdaeOlyiDlSKfR3daCNpPsdH0NQxJKpKtVTn2UpdTbVq69EEYKvdmNLMNFGCahKPw=
Received: from MW4PR03CA0278.namprd03.prod.outlook.com (2603:10b6:303:b5::13)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 15:37:31 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::ea) by MW4PR03CA0278.outlook.office365.com
 (2603:10b6:303:b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.23 via Frontend
 Transport; Fri, 21 Apr 2023 15:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.27 via Frontend Transport; Fri, 21 Apr 2023 15:37:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 10:37:30 -0500
Date: Fri, 21 Apr 2023 10:35:14 -0500
From: Michael Roth <michael.roth@amd.com>
To: Sean Christopherson <seanjc@google.com>
CC: Atish Patra <atishp@rivosinc.com>, <linux-kernel@vger.kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon
	<will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	<linux-coco@lists.linux.dev>, Dylan Reid <dylan@rivosinc.com>,
	<abrestic@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig
	<hch@infradead.org>, Conor Dooley <conor.dooley@microchip.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, Mayuresh Chitale
	<mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>, Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [RFC 00/48] RISC-V CoVE support
Message-ID: <20230421153514.tpqzvdu7zt7pe7hs@amd.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <ZEFopfs5Ij/AIkee@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEFopfs5Ij/AIkee@google.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT066:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: a66fb1eb-af32-4c61-03c0-08db427e5232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r11ADHa80zMcQTwUxC0vl5FOpEpV0SOh5toa12Ikx5z+8+jJrV50Lne7ziQYaldm0VuasfOqD3hIWVhaFobKdU2QUkYF54X02Ru+CR0BaE+6IOiHIWWeuOIAq1n243J/a2W21cvyuJl8MPJaaskh3XTsWn4t1ZGHiukX38omNCrnCXqE/khFCu9Ef+/WWi0AzUQ/FFcw6YoFg98uN7l/nQ8O8ttzGkepQzQoRvNbA5j+iDQ0/OklIfj3kqcBci3IK/27KgiQlWHTENS+eO4DGaShhPtlCconsYhWGF1cpgHHfsoLbg3tviz+I/oe1/+/buSmuqhMg3AfgA9sSiASe8QblfhGiidHw5mv4nF//t0clGws7hDaW2zkJzfRYA/7kTB5M8EUZpn6+5o1J5Ggvarng+8q0/CNe5PgyuzKfViF77kydqKeRqddkObeB+eIrZixKnaK1e5GEOZr286r+QPQ2pnYqnfVY0TplvAXYzm9sJ4CPKgBUpXLdCNOlbV4Qc6lXLcRlX5M3Fsu4FVCxPjhwQ/AyyBqoRvvVTVO1v7luX0jWtf646wNYFQxGNzo8h917/7feTjzCUI481eWvLaR0o/8utN4t2MjiqGk8BMvvKMFhbA0xHooVBPtGvTDiLYRAxP0j0z+DmJIQD+UQlUt4Bj2kGpSQMZLfUdvDSHjo54NBpLRyG7/oSOifVNoBOjN63uTudYHdm1lShdnfZg6esrKUkxgj8y7G8A2+kg=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(4326008)(54906003)(966005)(70206006)(70586007)(6916009)(316002)(36756003)(1076003)(26005)(16526019)(40460700003)(36860700001)(356005)(81166007)(2616005)(47076005)(426003)(336012)(186003)(83380400001)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6666004)(82310400005)(82740400003)(7416002)(7406005)(2906002)(86362001)(40480700001)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 15:37:31.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a66fb1eb-af32-4c61-03c0-08db427e5232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_083736_257513_E44D0F73 
X-CRM114-Status: GOOD (  19.43  )
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

On Thu, Apr 20, 2023 at 09:30:29AM -0700, Sean Christopherson wrote:
> Please, go look at restrictedmem[2] and work on building CoVE support on top of
> that.  If the current proposal doesn't fit CoVE's needs, then we need to know _before_
> all of that code gets merged.

I agree it's preferable to know beforehand to avoid potential
maintainability quagmires bringing additional architectures onboard, and
that it probably makes sense here to get that early input. But as a
general statement, it's not necessarily a *requirement*.

I worry that if we commit to such a policy that by the time restrictedmem
gets close to merge, yet another architecture/use-case will come along that
delays things further for architectures that already have hardware in the
field.

Not saying that's the case here, but just in general I think it's worth
keeping the option open on iterating on a partial solution vs. trying to
address everything on the first shot, depending on how the timing works
out.

Thanks,

Mike

> 
> [1] https://lore.kernel.org/linux-mm/20200522125214.31348-1-kirill.shutemov@linux.intel.com
> [2] https://lkml.kernel.org/r/20221202061347.1070246-1-chao.p.peng%40linux.intel.com
> 
> > arch/riscv/Kbuild                       |    2 +
> > arch/riscv/Kconfig                      |   27 +
> > arch/riscv/cove/Makefile                |    2 +
> > arch/riscv/cove/core.c                  |   40 +
> > arch/riscv/cove/cove_guest_sbi.c        |  109 +++
> > arch/riscv/include/asm/cove.h           |   27 +
> > arch/riscv/include/asm/covg_sbi.h       |   38 +
> > arch/riscv/include/asm/csr.h            |    2 +
> > arch/riscv/include/asm/kvm_cove.h       |  206 +++++
> > arch/riscv/include/asm/kvm_cove_sbi.h   |  101 +++
> > arch/riscv/include/asm/kvm_host.h       |   10 +-
> > arch/riscv/include/asm/kvm_vcpu_sbi.h   |    3 +
> > arch/riscv/include/asm/mem_encrypt.h    |   26 +
> > arch/riscv/include/asm/sbi.h            |  107 +++
> > arch/riscv/include/uapi/asm/kvm.h       |   17 +
> > arch/riscv/kernel/irq.c                 |   12 +
> > arch/riscv/kernel/setup.c               |    2 +
> > arch/riscv/kvm/Makefile                 |    1 +
> > arch/riscv/kvm/aia.c                    |  101 ++-
> > arch/riscv/kvm/aia_device.c             |   41 +-
> > arch/riscv/kvm/aia_imsic.c              |  127 ++-
> > arch/riscv/kvm/cove.c                   | 1005 +++++++++++++++++++++++
> > arch/riscv/kvm/cove_sbi.c               |  490 +++++++++++
> > arch/riscv/kvm/main.c                   |   30 +-
> > arch/riscv/kvm/mmu.c                    |   45 +-
> > arch/riscv/kvm/tlb.c                    |   11 +-
> > arch/riscv/kvm/vcpu.c                   |   69 +-
> > arch/riscv/kvm/vcpu_exit.c              |   34 +-
> > arch/riscv/kvm/vcpu_insn.c              |  115 ++-
> > arch/riscv/kvm/vcpu_sbi.c               |   16 +
> > arch/riscv/kvm/vcpu_sbi_covg.c          |  232 ++++++
> > arch/riscv/kvm/vcpu_timer.c             |   26 +-
> > arch/riscv/kvm/vm.c                     |   34 +-
> > arch/riscv/kvm/vmid.c                   |   17 +-
> > arch/riscv/mm/Makefile                  |    3 +
> > arch/riscv/mm/init.c                    |   17 +-
> > arch/riscv/mm/ioremap.c                 |   45 +
> > arch/riscv/mm/mem_encrypt.c             |   61 ++
> > drivers/tty/hvc/hvc_riscv_sbi.c         |    5 +
> > drivers/tty/serial/earlycon-riscv-sbi.c |   51 +-
> > include/uapi/linux/kvm.h                |    8 +
> > mm/vmalloc.c                            |   16 +
> > 42 files changed, 3222 insertions(+), 109 deletions(-)
> > create mode 100644 arch/riscv/cove/Makefile
> > create mode 100644 arch/riscv/cove/core.c
> > create mode 100644 arch/riscv/cove/cove_guest_sbi.c
> > create mode 100644 arch/riscv/include/asm/cove.h
> > create mode 100644 arch/riscv/include/asm/covg_sbi.h
> > create mode 100644 arch/riscv/include/asm/kvm_cove.h
> > create mode 100644 arch/riscv/include/asm/kvm_cove_sbi.h
> > create mode 100644 arch/riscv/include/asm/mem_encrypt.h
> > create mode 100644 arch/riscv/kvm/cove.c
> > create mode 100644 arch/riscv/kvm/cove_sbi.c
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_covg.c
> > create mode 100644 arch/riscv/mm/ioremap.c
> > create mode 100644 arch/riscv/mm/mem_encrypt.c
> > 
> > --
> > 2.25.1
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
