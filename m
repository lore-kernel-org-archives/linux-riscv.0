Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687FECD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 05:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oOqRzkKZ3ESeS7N8FbHi7A2CgcRM5m92zWe4LlIY4U=; b=Yq3dQVaVz06Xyq
	tvBG/c9pWibsfPthFUZCEtDzjU+HcahrXzOReMm1is0+6nAc4/hNlVRVZ9lV898itMi/rsyw3QT1s
	rh6hEU/FMg0MKGoOzeVaI1GcwprvSaQnPq2f0FV1YoH34xmjI+wCcshgba0UHgRGa9Kn6JHHZjpxa
	QOSRI9LyZpeHgGituC7DNxnFk17Cjh8dfhHlCLrUf65h3vzKn7CTL5QDWnjB+S6wslodajtW8k9KE
	E2v+nLbANa8nE2HpwW+aH5WlTrb2tz6SVWiOCYnad2RYcKXXD8RssOckFYXvph87nPNGnKfF7dJli
	q4jkqZQ1O6vQANm+tL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTcp-0000000C7Wh-36J0;
	Sun, 17 May 2026 05:01:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOTco-0000000C7WT-2MF3
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 05:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2893600BB;
	Sun, 17 May 2026 05:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A46C2BCB0;
	Sun, 17 May 2026 05:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778994072;
	bh=w0R+IU0Qf9k1/TmEYOOCrxVZkzJCPWvnHCpoOqhmlCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jd3691L3RIaqnX2kkTgD/CKP8yg+R7Hrn/xgdWGzraAYO2vSwerBXEIMhsUdxiSkJ
	 u5980Kei3bP+cPHXqLpyMruZBUtZ91Gfn2W7EaqQewqp5rto9jlvHOmgIzWcF05+tU
	 YWxwk7d7bAxLSwvlkvmJVLwr/mJqPy5tK+5saPzfMy6/jLz+e/NKRZp792nZIApWIP
	 3WcOySK7CNT1yXwF6F53DQoeqwO+j2yC2lGW92dzEfqcxZ5NXzzs6RVnkKaEhLs5HL
	 PtuhdeZsn7JcZxuj62maHejEz8a0p1Lh6Ifh7XDknQrAv3XAG/h/50gaYixpjdUM1t
	 gUTFVHHFejzBw==
Date: Sat, 16 May 2026 22:01:11 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH RFC v4 16/18] ACPI: RISC-V: Parse RISC-V Quality of
 Service Controller (RQSC) table
Message-ID: <aglLlzrpud8Dj9ky@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-16-eb53831ef683@kernel.org>
 <20260512214628.EB578C2BCB0@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512214628.EB578C2BCB0@smtp.kernel.org>
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

On Tue, May 12, 2026 at 09:46:28PM +0000, sashiko-bot@kernel.org wrote:
> > +	for (node = ACPI_ADD_PTR(struct acpi_rqsc_node, rqsc,
> > +				 sizeof(struct acpi_table_rqsc));
> > +	     node < end;
> > +	     node = ACPI_ADD_PTR(struct acpi_rqsc_node, node, node->length)
> > +	) {
> > +		const struct acpi_rqsc_resource *res0;
> > +		struct cbqri_controller_info info = {};
> > +		int ret;
> > +
> > +		if ((void *)node + sizeof(*node) > (void *)end) {
> > +			pr_err("truncated entry at end of table, aborting\n");
> > +			riscv_cbqri_unregister_last(num_controllers);
> > +			return -EINVAL;
> > +		}
> 
> Does this code also need to verify that the entire declared length of the node
> fits within the table boundary?
> 
> If a malformed node declares a length extending beyond the end of the ACPI
> table, the node pointer could advance past end during the loop increment:
> 
>     node = ACPI_ADD_PTR(struct acpi_rqsc_node, node, node->length)
> 
> Could this cleanly fail the loop condition on the next iteration and silently
> return success instead of rejecting the corrupted table?

I will add an explicit check so that an overrun is flagged as corruption
rather than silently truncating the controller list.

> > +		if (node->length < sizeof(*node)) {
> > +			pr_err("malformed RQSC entry: length %u < %zu, aborting\n",
> > +			       node->length, sizeof(*node));
> > +			riscv_cbqri_unregister_last(num_controllers);
> > +			return -EINVAL;
> > +		}
> 
> Could this loop be bounded by rqsc->num instead of just node < end?
> 
> If the firmware pads the table at the end for alignment, the parser might
> attempt to process the zeroed padding as a node.
> 
> Would encountering this padding trigger this length check, unregister all
> successfully parsed controllers, and completely abort initialization for an
> otherwise valid table?

The behavior is intentional. RQSC does not document a padding allowance,
so a zero length entry inside the declared table length is treated as
corruption.

> > +		/* GAS must describe system memory. ioremap() consumes it later. */
> > +		if (node->reg.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY) {
> > +			pr_warn("controller has unsupported address space_id=%u, skipping\n",
> > +				node->reg.space_id);
> > +			continue;
> > +		}
> 
> Should this code check node->flags before proceeding? Standard ACPI practice
> typically uses Bit 0 to indicate whether a hardware block is present and
> enabled.
> 
> If flags are ignored, could the driver risk mapping and accessing
> memory-mapped registers of explicitly disabled hardware?

Ignoring node->flags is correct here as RQSC defines bit 0 as: "When
set, indicates the controller supports allocating zero capacity blocks
or zero bandwidth blocks to an RCID."

> > +		/*
> > +		 * Resources follow the node header in-line. Only res[0] is
> > +		 * consumed. Bound it against end before reading its prefix so
> > +		 * a table that ends partway through a resource subtable is
> > +		 * rejected rather than read past the mapping.
> > +		 */
> > +		res0 = (const struct acpi_rqsc_resource *)
> > +		       ((const u8 *)node + sizeof(*node));
> 
> Is it safe to hardcode the start of the resource subtables using
> sizeof(*node)?
> 
> If a future revision of the RQSC table extends the acpi_rqsc_node structure
> with additional fields, sizeof(*node) would be smaller than the actual
> node header size.
> 
> Could this missing rqsc->header.revision check cause the parser to point into
> the middle of the new header fields and incorrectly interpret them as the
> first resource descriptor?

I will add a revision check at the top of acpi_parse_rqsc()

> > +		if (res0->id1 > U32_MAX) {
> > +			pr_warn("controller at %pa: id1 0x%llx exceeds u32, skipping\n",
> > +				&info.addr, res0->id1);
> > +			continue;
> > +		}
> > +
> > +		switch (info.type) {
> > +		case CBQRI_CONTROLLER_TYPE_CAPACITY:
> > +			info.cache_id = (u32)res0->id1;
> > +			break;
> > +		case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> > +			info.prox_dom = (u32)res0->id1;
> > +			break;
> 
> Does this code need to validate the type and id_type fields of the resource
> descriptor before extracting res0->id1?
> 
> If a controller specifies multiple resources (node->nres > 1) and the first
> descriptor is not the expected cache ID or proximity domain, could the
> parser blindly misinterpret its contents?

I will add a check for res0->type and res0->id_type before using id1.

-Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
