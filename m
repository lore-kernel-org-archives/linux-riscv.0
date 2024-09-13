Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90648FA3734
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2fpHs2XXDk0+xg+gWymwaxSTE6fRWFyC/fC9pb8PJQ=; b=jwaCSZfYTrIhu6
	V6DfDG3Lg4tyr+OFobX1FbuXc02xMNWA/6gdoYCusBwYM5JCZZuYB/5rMEkjH9nEetXERlKYbcYOx
	6TPtLp1fUw2Dg51GYxjtc3tJDsat+eUxDJEgHYPVmtx8ssjbk+QC4ngt1PcaO/hzDuiwO0Hx2F6l9
	cpqLczClE6rz59fBRoyyN/kYECC3qUb5qXD5F25gtzFBrGWFiGruseyx4EaSTXSpqMP8lBEip21nz
	5ymYF4MbFNfbZ8wb6m78sPws2NpQtIHR64gnYUCXKMrIngk/9tQmyoXeLlSjD6uUlUD0UDdwstOHL
	qoKS9C+gHtClikROfOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp2Gr-0000000FR27-0cnL;
	Fri, 13 Sep 2024 09:07:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp2Gn-0000000FR0J-4BDG
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 09:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4140B13D5;
	Fri, 13 Sep 2024 02:07:38 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9100A3F73B;
	Fri, 13 Sep 2024 02:07:07 -0700 (PDT)
Date: Fri, 13 Sep 2024 10:07:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
Message-ID: <ZuQAufXBEp-87mrv@bogus>
References: <20240913080053.36636-1-mikisabate@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240913080053.36636-1-mikisabate@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_020714_097228_D4E5321B 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: aou@eecs.berkeley.edu, Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, palmer@dabbelt.com, cuiyunhui@bytedance.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 13, 2024 at 10:00:52AM +0200, Miquel Sabat=E9 Sol=E0 wrote:
> When populating cache leaves we previously fetched the CPU device node
> at the very beginning. But when ACPI is enabled we go through a
> specific branch which returns early and does not call 'of_node_put' for
> the node that was acquired.
> =

> Since we are not using a CPU device node for the ACPI code anyways, we
> can simply move the initialization of it just passed the ACPI block, and
> we are guaranteed to have an 'of_node_put' call for the acquired node.
> This prevents a bad reference count of the CPU device node.
> =

> Moreover, the previous function did not check for errors when acquiring
> the device node, so a return -ENOENT has been added for that case.
>

LGTM,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

> Signed-off-by: Miquel Sabat=E9 Sol=E0 <mikisabate@gmail.com>
> ---
> I was wondering if this should also be sent to stable, but  I have not se=
en
> a report on it, and this is not responsible for an oops or anything like =
that.
> So in the end I decided not to, but maybe you consider otherwise.
> =


Right, it is not a fix per say and hence not a stable material as ACPI
is not accessing the node pointer.

-- =

Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
