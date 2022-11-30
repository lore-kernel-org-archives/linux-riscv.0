Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ADBC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYpAqGS2mn0f1pLljwjXrypxJvzpvFVhx/CKDgVS8gc=; b=VsGccKEtW9gt6A
	zo21n2k8HlV3jQf49GH4TkqheUNpFUxfvvIuDvqLvBYeElIoFPQNjCtV+Vv6YBRKDO6sx2IXDygBZ
	N+aYAjC0NjhGoagIGWvyuU74awQm6lqHM7ESqitdK5/Bx+AjaMjL5u2TudjQLwgzjAv0//c8bomIg
	sx6ErDKxoK+xk5W4UmlIaYcc7T3urfMo7nkGvsuDqNKve26f1k8IBRDlaweyqB2FUOlbkz4QC5vJs
	ETYYnzo4ECB6b1o+/HFu0NbIfC9aa3R8bZB3yX86VVmUo9jQvr6p8YITe3885W+RfW8+RQrCNCD/N
	kAyPdWNgL7zFBtsf+Khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XBn-003XQV-Sj; Thu, 01 Dec 2022 00:12:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wmh-003LoG-1B
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:46:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 128E261E66;
	Wed, 30 Nov 2022 23:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C1FC433D6;
	Wed, 30 Nov 2022 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669851993;
	bh=ZQ9Ih3obC5WFOWt2VgM3BKXbggwFZyTsm38RHWO01qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stnUqV66BRQ+2pWpRAV9cCCmELlKAFAl7ILiex22A4zNTmtWSQULmNCryIBPHJrZg
	 FewAlmYIdlEZNxzSFomtl0Z9fSZSt4xMDB8ETuukvc4xqwOGn3iVcawSiHiv0mNEfu
	 44IkOjFMhq0kOZN2luzon13p+Kqjz+eMy8cFDYwROL4/iajdslGDS2bNNLuABel2V+
	 GEAjmNcXGCoSv7fTCbfW7GJqD+tCdaTOv8dfPbiFW3wNfxxs6rUjXq+tqRhT8E0g5f
	 AjVE+yE3crC4pnKdCtV0GXJLsSFcxt9bbogbywFWacjD8lqr05yaShIPBAaC5F4kUR
	 A34AOPYMfQI6g==
Date: Wed, 30 Nov 2022 23:46:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
	aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org,
	heiko@sntech.de, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Message-ID: <Y4frVOhMt/gkuSY2@spud>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130234125.2722364-4-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_154635_183923_0F851DED 
X-CRM114-Status: GOOD (  26.37  )
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

On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The RISC-V specs are permissive in what they allow as the ISA string,
> but how we output this to userspace in /proc/cpuinfo is quasi uAPI.
> 
> Formalise this as part of the uAPI, by documenting the list of rules
> we use at this point in time.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I've not "tested" these docs. The NIPA-esque pwbot should go and
> test it AFAICT. If it doesn't, I'll go add that.
> ---
>  Documentation/riscv/uabi.rst | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 21a82cfb6c4d..bc3c8ced644b 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -3,4 +3,46 @@
>  RISC-V Linux User ABI
>  =====================
>  
> +Misaligned accesses
> +-------------------
> +
>  Misaligned accesses are supported in userspace, but they may perform poorly.
> +
> +ISA string ordering in /proc/cpuinfo
> +------------------------------------
> +
> +The canonical order of ISA extension names in the ISA string is defined in
> +chapter 27 of the unprivileged specification.
> +The specification uses vague wording, such as should, when it comes to
> +ordering, so for our purposes the following rules apply:
> +
> +#. Single-letter extensions come first, in "canonical order", so
> +   "IMAFDQLCBKJTPVH".
> +
> +#. All multi-letter extensions will be separated from other multi-letter
> +   extensions by an underscore.
> +
> +#. Additional standard extensions (starting with 'Z') will be sorted after
> +   single-letter extensions and before any higher-privileged extensions.
> +
> +#. The first letter following the 'Z' conventionally indicates the most
> +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> +   If multiple 'Z' extensions are named, they should be ordered first by
> +   category, then alphabetically within a category.
> +
> +#. Standard supervisor-level extensions (starting with 'S') will be listed
> +   after standard unprivileged extensions.  If multiple
> +   supervisor-level extensions are listed, they will be ordered
> +   alphabetically.
> +
> +#. Standard machine-level extensions (starting with 'Zxm') will be listed
> +   after any lower-privileged, standard extensions.  If multiple
> +   machine-level extensions are listed, they will be ordered
> +   alphabetically.
> +
> +#. Non-standard extensions (starts with 'X') will be listed after all

Ehh, it's always the read *after* sending something that I notice the
inconsistency. This should be s/starts/starting/ for consistency.

> +   standard extensions.
> +
> +An example string following the order is:
> +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> +
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
