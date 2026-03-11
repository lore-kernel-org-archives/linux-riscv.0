Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6D3FD88DF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 02:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GIm31nqmKGvnBgyVId2CLELPXeNfH3VzAVLPJSQ3sk=; b=dUH7rn2f3J3R8I
	dU4v655gsdDgt3WPZy+SzBOi9T6tUtXUV+wNavPt0jWxijVvKLjIqocYEECA23ky57DRmqU5a8GJp
	VfWkilLOeSLJRhW4+wGTeCs1lV5YW6F5nI8QU29xCql8ehq3Ua1EUOym385qYD8/eoCH09xhhQIGs
	eHnf2Qm5/Q16ZQu9jV0+7Dgq7nSGZoPyiqoLjnmjzJx3FGxJ3Lc3wdLCm5FH+YPgX5pSlWaPmxVfF
	WSAin92lFApDLf3q39CBMGS4MG6ZcKri9J71S9Eqyo+Kv7BgSKK/EA0Y48VshODcm0FpM7MwhIr1V
	jXUzusLRwAgd6/Ok16HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09lt-0000000AZqw-37B0;
	Wed, 11 Mar 2026 02:58:05 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09lp-0000000AZqK-3wQY;
	Wed, 11 Mar 2026 02:58:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b36C7PXQWMtROHC3akP80A02jao7I70/cN0HO+5yrzc=;
	b=OIFuDbC2xS7Rgm+I36JhjfBBuNlrExfOc4b/6nZu5Eci5l3+fQS/kU6c0nfyQEGA12kX/Y7Hm
	Q4fnrBYIxytCYBOb9gfPVNmdxJt8Tvf2GHBr2Fdo4Eecx+kEiQ1JtKfbeg5YZs6XhpMHGRf3AdS
	dsh0tpvrdex5MaKPf2KuYUQ=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fVwJc46ySz12LFG;
	Wed, 11 Mar 2026 10:52:16 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B67A2012A;
	Wed, 11 Mar 2026 10:57:52 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Mar 2026 10:57:50 +0800
Message-ID: <f2bf1055-ae5f-44bb-9bd4-8888099933fb@huawei.com>
Date: Wed, 11 Mar 2026 10:57:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20260310175305.GA730372@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260310175305.GA730372@bhelgaas>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_195802_623309_D2639D3C 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J .
 Wysocki" <rafael@kernel.org>, Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sohil Mehta <sohil.mehta@intel.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/11/2026 1:53 AM, Bjorn Helgaas wrote:
> On Tue, Mar 10, 2026 at 11:20:48AM +0800, Chengwen Feng wrote:
>> To unify the CPU ACPI ID retrieval interface across architectures,
>> rename the existing get_acpi_id_for_cpu() function to
>> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
>>
>> This is a pure rename with no functional change, preparing for a
>> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
>> platforms.
> 
> Really a question for the ACPI folks, but my preferences would be:
> 
>   - Simpler name for the interface, e.g., "acpi_get_cpu_id()"

OK, and how about add u-, like: acpi_get_cpu_uid()

> 
>   - Single prototype in generic header, e.g., include/linux/acpi.h

OK

> 
>   - Split the x86 part to a separate patch and maybe (a tangent, but
>     looks dubious to me) figure out whether/why xen needs xen_vcpu_id
>     to be ACPI CPU IDs

OK for a separate patch for x86.

Btw: the x86 implementation in 2/2 commit may has problem, please see the reply in 2/2 for detail.

> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      |  4 ++--
>>  arch/loongarch/include/asm/acpi.h  |  2 +-
>>  arch/riscv/include/asm/acpi.h      |  2 +-
>>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>>  drivers/acpi/pptt.c                | 16 ++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  2 +-
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>>  7 files changed, 15 insertions(+), 15 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
