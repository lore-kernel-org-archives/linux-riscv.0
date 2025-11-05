Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCD5CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLK2VcIsCaflfcbmBXqchGww2/oF1iFOC10ChrOTEjk=; b=xXask9gHAwA5lF
	hrMNP9PsdvNqDwwL/mz3rPUq3GdXfXFVJQVItyuGnJZuNhHNFkKlRGsI7yl5RN2AIYnC7b8QKlxWT
	7cPMsGCj3B92wXG8HfmiM77kiDe9tl45aSbeXruMkcs+WpWxxLfG13f4aJdQlZ5p3+i9yoCXHyB56
	kidJx3S3j8UZRiTtysNneC7ZZco+4NcqCy7quX2tsKFKdVpJFwtjrjcBaceXr2Awq5nuJpu7MuoQa
	fpzoDuoG0qAMln7pcSQNJsUOT+7+fdRC9b6ImxxlsPamGwQ5Zw8udhxgrnG5nN9L1XD0BnLJy6yju
	WAZv9EB+29ZpshAkiExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZ8l-0000000DJSa-3GNN;
	Wed, 05 Nov 2025 08:45:15 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZ8k-0000000DJS5-01e5
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 08:45:15 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6462F5A90D;
	Wed,  5 Nov 2025 09:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1762332308;
	bh=9634LwCOBvkVyltmD3yEImG3GLp+vauzcljqVmCfZXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdykuXFGz4Kyzn2l8GzRhXbOwpemTjiqSY9NnkSJ5kXzDibcDKgk3Crya1dT+N1Ts
	 UH7FaWWUF2fq6OpnbmFSDJXIvL5PdoqWz0jZZotf4VyXYy5InXO3QMRJdHGa6Rzaeb
	 MxBIh4MUKJl+OcDL2c70JUQZv/F6/7aKR/7bsxHQuOEkn9h/bIqWxcBXiTQgrOnRku
	 AipM7oV8uNY+j4VTR+A71+Lm/Bi/LEdJjrz9vYJsMnA4ATN+A/7oIdHQmvkac7W8aF
	 xTWnLZwWkQ4WulMxLtSJf6QnV4ULuve0Bf0buUIZk7fVlBoEn9/SfE5IqaOkZRXopu
	 eMENQjBRtCNbg==
Date: Wed, 5 Nov 2025 09:45:07 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Will Deacon <will@kernel.org>, Alexey Kardashevskiy <aik@amd.com>, 
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, James Gowans <jgowans@amazon.com>, 
	Kevin Tian <kevin.tian@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev, Samiullah Khawaja <skhawaja@google.com>, 
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v8 00/15] Consolidate iommu page table implementations
 (AMD)
Message-ID: <3wwyr2kqhaj5icznsizcu372uzhygubkytko3vueamwnf6vzr2@hlas3nx53tps>
References: <0-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_004514_282360_544F916D 
X-CRM114-Status: UNSURE (   7.37  )
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

On Tue, Nov 04, 2025 at 02:29:58PM -0400, Jason Gunthorpe wrote:
> [Joerg, can you put this and vtd in linux-next please. The vtd series is still
> good at v3 thanks]

Applied, thanks Jason. Please send the kdoc fixes which address Randys review
on-top.

Regards,

	Joerg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
