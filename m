Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D957105A56D
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DybwGBd0PQYPH6y98nHtFURaQqtwbdTskzB67yMynM=; b=MzY5xGFfmuLN85
	UPIeY5xJx/8ilR5z1pVI0U6VSiN9kos7+BoSolFoLvys3zR2qK4Lb3GFNxUDi82Z5gDTZp3PXwcjs
	lz2CnQyW2u1HTp09RnvydyEXT55EZMNPcY6rs8cAgNXa0XpCuXZrbNuk00JlOJM7UudqDyrAw4UiH
	8/yyR9TP4qCorqHW7x2oIGwtqcVQoRSGOqwFOWg4Zo5SMcWJBgcYBL1t+/IIXQtQGgplxn3aF17Qw
	iutN2ahS15MOnnycpdFt1safVnue6QlGkV2e/42+u/g328yxl7gh/u0zlnHObRwRs4kl1iJ2n4ciu
	/PGGzdSHa4rH8S3qBzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dhC-0000000DtsT-1HA0;
	Thu, 12 Mar 2026 10:55:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dh9-0000000Dtry-1j2s;
	Thu, 12 Mar 2026 10:55:13 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fWkyK3T4pzJ46kW;
	Thu, 12 Mar 2026 18:54:17 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 32AB64056B;
	Thu, 12 Mar 2026 18:55:05 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Mar
 2026 10:55:02 +0000
Date: Thu, 12 Mar 2026 10:55:00 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <20260312105500.00005d7c@huawei.com>
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
	<20260312072316.4806-3-fengchengwen@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_035511_775152_CEC040D7 
X-CRM114-Status: UNSURE (   6.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG
 Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S .
 Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2026 15:23:15 +0800
Chengwen Feng <fengchengwen@huawei.com> wrote:

> Add acpi_get_cpu_uid() implementation for x86, replacing the existing
> cpu_acpi_id() function. This completes the unified ACPI Processor UID
> retrieval interface across all ACPI-enabled architectures.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
