Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1167EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xPfVJwDmZk3YRCuGc79A6BgoFcJhTYIJq+LM3NpyKQ=; b=TVc51uZoyEs/Fe
	qDIroiFphpJvchapcPINRTR2HzheXwTo8RQml8rnGPFYcifJ5PBqo/iitGUi8LIG4QM2oi0nRGqFk
	H3xjgWO4P5ghSUbQS5HFQcIHWiVKLRO7KxhOm08ntA6gmMrKNzAkzoc5AjdGm4KWHPWeMVi81DCLx
	s3OlRHniFc+F2+kGPe4lOsxr+1R1TQIAo2Nobz5SAuxJE0qEq+vPOMYrnzKZ4S3oP9af6XlKvkKLl
	dSnAraW2A2rOWM+Bc7qFKzx8dUeoo+fNXq1VJu/a+eDlu6YjMMe/cfOgbQuFRo0Nqr9074DolBrXH
	UInIXJNiGljjsKLAHkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMn7B-00Dh5B-1u;
	Fri, 21 Jul 2023 10:12:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMn79-00Dh0w-0K;
	Fri, 21 Jul 2023 10:12:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 182D760C6D;
	Fri, 21 Jul 2023 10:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473A4C433CA;
	Fri, 21 Jul 2023 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689934315;
	bh=s9HVffr7s45ExG1b+76BVglXN8ctcgVQkAoV0U6Ya/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HgpD08CeAGOpzQFq5GLnVwOQQQ5jE4WSE+LWpXt6nVW1axxLJALVfnHMV9BeoKKdi
	 ebfUYIBbDujrjnHQw6aVq+PeoIGEakAI+fTxqqOPUcZYTKhUgyXcdq/+KIXtl1TbWU
	 4Gfi3n5GvXdawjYNcJBg6rcpZOyOhhYg63bkmIutPH0sV/93D0hO0p2k765JE3R9PZ
	 VX+Jipd0jGS8RnmZSA8PkEtVCRElKJHqVWo+YK+VDBj46umAlyR/UEfALxBL71Pq62
	 rKsx96BmD6WfjdIaUcVB5CEEvW+u4V8L/Q2LJ3r+Io6Z8j0Q3JXMF5Ey8f+BlU76GO
	 01M0qaKi7T5Jw==
Message-ID: <921a2635-e34a-47e6-17c2-818e3594d211@kernel.org>
Date: Fri, 21 Jul 2023 12:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-2-mchitale@ventanamicro.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230721075439.454473-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_031159_183461_86DA8B94 
X-CRM114-Status: GOOD (  11.56  )
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

On 21/07/2023 09:54, Mayuresh Chitale wrote:
> Extend the ISA string parsing to detect the Smstateen extension
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
