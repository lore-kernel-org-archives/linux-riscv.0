Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D772CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0edCdM1CKmx22zorObFD9jEePy9Juv2PpAlherOKs90=; b=tL5/Ws9mZbTjP2
	gLtDxu4DPZA5PM6NS56j+nu26Bfnnl8PNMaNmc5+lPGwrQScuPcI7PcdFDgxyuhBakrY9sJRVCH8O
	vOeFJ1jze4nBPAftovHKtDkauWoGbnSI7K4ycHIPq2AICr2BNxwRyWoCuEBS0ZCj5QAaYx5FakGWt
	8EBjhMSwBmEE2wX98ssKPuOdAWElyFsltipKbCFhz+6xlAURluo8mgjozHb3o8QeZHNW/JQrS6fwX
	fSt7aqA42RJWvGP9PJdet9BiyClcxAtoIdpefJl4YF+kV6cH4voPJn3d3yiBT6VlIAKLviJF3zmTN
	WJZ7nxxPQ8oLXl+IrMAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII30-00000004X1F-1WTB;
	Thu, 30 Apr 2026 03:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2M-00000004WRp-0fsr;
	Thu, 30 Apr 2026 03:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DC240317;
	Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA274C2BCC6;
	Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519561;
	bh=S8ESDWn2FV212MQ0O36a6N64V74CpKEgoDR0Cwb1eYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RtcaGla8SJMvzp565cZWG4JA/pd6x2rokqKWLW76DsXVVSBMWfvO7M+j3tfPr4WiS
	 iYIi3LmvsvftG5YY+oM7g4PvJ9jMSl95DFA2LT7Ri+Y57wvJYObh7grdN4/wFxy9Bp
	 3dNPBrE0VUHIF5qHqtQDM1L3bZLqpe75efGu9RIosM9YKInDL4ti/opEBCchGSV7Ed
	 NJ0t/2yQEWiWU4UX0J1SMMnzWayyrY3pGrDTZxRSaZcqhSakDi4GgjEzwKf7uPPJCg
	 fYiHoJFVnaikAgVqNlokz3BThqsRnYRJYWEnZONwh0eeFUJrF4d3CMi6aMhGsxyQjO
	 srXFfj2h9HOug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F1A3809A07;
	Thu, 30 Apr 2026 03:25:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v10 0/8] ACPI: Unify CPU UID interface and fix
 ARM64
 TPH steer-tag issue
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951654.2274119.17258357457134506240.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:16 +0000
References: <20260401081640.26875-1-fengchengwen@huawei.com>
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: linux-riscv@lists.infradead.org, bhelgaas@google.com,
 catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, x86@kernel.org, liuyonglong@huawei.com,
 anshuman.khandual@arm.com, linux-doc@vger.kernel.org, kees@kernel.org,
 linux-pci@vger.kernel.org, dave.hansen@linux.intel.com,
 Eric.VanTassell@amd.com, somnath.kotur@broadcom.com, kai.huang@intel.com,
 kevinloughlin@google.com, punit.agrawal@oss.qualcomm.com, hpa@zytor.com,
 ilkka@os.amperecomputing.com, kernel@xen0n.name, thorsten.blum@linux.dev,
 linux-acpi@vger.kernel.org, corbet@lwn.net, masahiroy@kernel.org,
 si.yanteng@linux.dev, peterz@infradead.org,
 pawan.kumar.gupta@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, szy0127@sjtu.edu.cn, lenb@kernel.org,
 thomas.lendacky@amd.com, thuth@redhat.com, ryan.roberts@arm.com,
 darwi@linutronix.de, make24@iscas.ac.cn, suzuki.poulose@arm.com,
 james.clark@linaro.org, wei.huang2@amd.com, bwicaksono@nvidia.com,
 loongarch@lists.linux.dev, jonathan.cameron@huawei.com,
 sohil.mehta@intel.com, boris.ostrovsky@oracle.com, xin@zytor.com,
 andrew.gospodarek@broadcom.com, wanghuiqiang@huawei.com, jgross@suse.com,
 wangyuquan1236@phytium.com.cn, seanjc@google.com, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, tglx@kernel.org,
 heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn,
 robin.murphy@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202602_827006_69873A44 
X-CRM114-Status: UNSURE (   7.34  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Wed, 1 Apr 2026 16:16:32 +0800 you wrote:
> This patchset unifies ACPI Processor UID retrieval across
> arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
> and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:
> 
> 1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
>      respective users)
> 5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
> 6: Clean up perf/arm_cspmu
> 7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
> 8: Pass ACPI Processor UID to Cache Locality _DSM
> 
> [...]

Here is the summary with links:
  - [RESEND,v10,1/8] arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/7cd5f5659ac8
  - [RESEND,v10,2/8] LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/d78ef9d2e1f2
  - [RESEND,v10,3/8] RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/0c8231994e43
  - [RESEND,v10,4/8] x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/3cfe889f8965
  - [RESEND,v10,5/8] ACPI: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
    https://git.kernel.org/riscv/c/f652d0a4e13c
  - [RESEND,v10,6/8] perf: arm_cspmu: Switch to acpi_get_cpu_uid() from get_acpi_id_for_cpu()
    https://git.kernel.org/riscv/c/1ab03189793f
  - [RESEND,v10,7/8] ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
    https://git.kernel.org/riscv/c/a7034e9e4491
  - [RESEND,v10,8/8] PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
    https://git.kernel.org/riscv/c/abdd2a86535b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
