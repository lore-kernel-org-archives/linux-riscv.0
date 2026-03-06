Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D2F513E9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHay6XHV8eCadadSs2QaNhsbCZI+M1MdtQSODC3fFls=; b=ckCD2LF6u/dCMM
	98zVeM3XTqyoK7DgwcLRzSRyjJ5A9GgIKJR+tzmIt/7Ny8WpUAaYFJW5atZs9ygltF+dbHsg7EOix
	3vGjH/ijquoJHlCrEcyi3az4gXQ92PlSmKsBrzNIfeWxTgPGjMP7MwAg7ZjGLznL2sjAy5ckmhbb1
	b6aMrLIfCWvGJYm2g9UQCJsId/NC2wf+Bjq8KaKOdEzYvibJ2ctfA138eJIOXwIHrVunPdSC8QNnj
	2mugYnDJ6//YKSgPaTbqFuLgb5lsM8WUsko/tokUHqFacGJc8YE/eYCwWg6C4fbnUz6J3rWGVbJmn
	PGGlV1WSPgKbcNtqTIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKo6-00000002smq-2bc8;
	Fri, 06 Mar 2026 02:20:50 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKo4-00000002sln-0y77;
	Fri, 06 Mar 2026 02:20:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=63G8v1SmaEgTYdfJTyL6ai9ialxWPrLA+2LQvndcIO8=;
	b=mwQ0hElsHFrGBY+A3e2KK7IjK1rv0TAkhpGRCNBsH64nmtcpuKi+oWynKmiaLosb7CItekbvd
	7Ur566TDm1xinylYA/X8Q+XD14TchvZjfjiy4Cw81UnxzrRRUjK7AmWvdX6Y/jbCiVwouEIKPd8
	GTSznfAxZkaV5F0QVZ6bA9E=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fRqkq3J7bz1prLV;
	Fri,  6 Mar 2026 10:15:47 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id DF7C52022B;
	Fri,  6 Mar 2026 10:20:41 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Mar 2026 10:20:40 +0800
Message-ID: <e33affb0-e8f8-48fc-b344-90fea722d30b@huawei.com>
Date: Fri, 6 Mar 2026 10:20:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
To: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260305083650.54611-1-fengchengwen@huawei.com>
 <CAAhV-H4xZsyLdzswPxPGHoQNd4LKXrTOL-oPGZHyVt8dj0xu6A@mail.gmail.com>
 <795a9167-6c49-4c7c-9a36-385bf543cacf@huawei.com>
 <20260305145403.0000394e@huawei.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260305145403.0000394e@huawei.com>
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_182048_426777_6BEAC296 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, x86@kernel.org, liuyonglong@huawei.com, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Eric Van Tassell <Eric.VanTassell@amd.com>, Somnath Kotur <somnath.kotur@broadcom.com>, jeremy.linton@arm.com, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, wangliupu@loongson.cn, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, wei.huang2@amd.com, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, bhelgaas@google.com, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, sunilvl@oss.qualcomm.com, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, chenhuacai@loongson.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/5/2026 10:54 PM, Jonathan Cameron wrote:
> 
>>>> +       ret = acpi_get_cpu_acpi_id(cpu);  
>>> Can we use get_acpi_id_for_cpu() directly? Then just x86 needs a wrapper.  
>>
>> Yes, it indeed simple.
>>
>> But I prefer to have the acpi_ prefix for such API names because it's a cross-subsystem API reference.
> 
> Can we just do a global rename of get_acpi_id_for_cpu() as a precursor
> patch?  Then this just becomes adding x86 implementation and using
> it on all architectures.

Sounds good, done in v3

Thanks

> 
> J
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
