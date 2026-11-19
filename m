Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D5606A325
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vRwBDSQh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz+9YleZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PmIWZ8Jh6+IThWmk4H0oMcfvJ+CCm0oRg59RhXZ5JZ8=; b=vRwBDSQhvWI8OMonnq8BUW6bND
	PVdXcaiQpSm8By636MxELXYzOcfQtUVOMViMCfpWeJx7IOAeJTIf/vSVKoQ/uMcD4h8reKk8u0nT3
	mTpV01uxsi5nfnd0eD3WyBgURueqEbvRfI+YJM7r66JpiSm5iaX6+e9S61t3sL3nNlhh5G0bvogaH
	CKo/drNVS6iXu53qnfYoD09+3HPEKS0vQMjRd/4YTE8o9uPnhRVXeoTTX7H+dosNzYud4yxL+Maq2
	VehT3Sua5VYOOCmsJFI11v0OKOXDsezNfYqF+6MaoT7fX89zTzLHPrCN5tgWE+BKkYdACKGm0L/BF
	EseY5AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUACx-0000000DX31-3if1;
	Thu, 19 Nov 2026 22:02:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUACw-0000000DX2o-0cjY
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 22:02:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21A5060F15;
	Thu, 19 Nov 2026 22:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1481F000C6;
	Thu, 19 Nov 2026 22:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125736;
	bh=QR0iNYcxGUYiRlvYaqU+jw33JmSml7dYWSzn2SLPrrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jz+9YleZOMMFNDjsyCn90VaFNV0QOepq/9gXBuz6qPhYha+atPDeAjRG+B5ghq2hV
	 EiXEz+GRt0X8SjBJ+U4Wku/rXXVwmwiu03VJvNg2SRD0XHBec+qYytEHX9L+Z0BQvP
	 s32cXdkXh+uGazR8HEexkt8WTHch+FSicy39UGZuTuY2xpMp6kWCZOHivHZ7xrh//p
	 Iy43GqouxWraOlAji2L/fNriXtl5jwn51297aGtel85TdJWo/8yaCD4BUvNi7H8E8R
	 LCMPeHy5RBP43VmjcH3VkJirKQ1hWgi9DnjpTi3w7R4zPRIhQ5/4G6uCtvahRdN+Qy
	 iH7yypnp4Tqsw==
Date: Thu, 19 Nov 2026 14:02:15 -0800
From: Drew Fustini <fustini@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Zeng Heng <zengheng@picoheart.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	Tony Luck <tony.luck@intel.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Samuel Holland <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>,
	Babu Moger <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Peter Newman <peternewman@google.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ACPI: RISC-V: Enumerate CBQRI controllers from the
 RQSC table
Message-ID: <av9x59BSveJJzCv0@thelio>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
 <20261117-acpi-rqsc-v1-2-381ce645751e@kernel.org>
 <20261118234201.76ca7a72@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118234201.76ca7a72@jic23-hlaptop>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:42:01PM +0000, Jonathan Cameron wrote:
> On Tue, 17 Nov 2026 14:11:28 -0800
> "Drew Fustini (Tenstorrent)" <fustini@kernel.org> wrote:
> 
> > Walk the RQSC table at ACPI init and create a platform device for each
> > CBQRI controller, so one platform driver can serve device tree and ACPI
> > systems. Nothing selects ACPI_RQSC until the CBQRI driver can bind to
> > these devices.
> > 
> > Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> Hi Drew
> 
> Very much a drive by review as I haven't even opened the spec yet ;)
> 
> Anyhow, various comments inline. Most code readability suggestions.
> 
> Thanks,
> 
> Jonathan

Hi! Thanks for taking the time to look at these patches. It's helpful to
have your perspective even if you haven't looked at the details of the
risc-v spec.

> > diff --git a/drivers/acpi/riscv/rqsc.c b/drivers/acpi/riscv/rqsc.c
> > new file mode 100644
> > index 000000000000..262fd5755d29
> > --- /dev/null
> > +++ b/drivers/acpi/riscv/rqsc.c
> > @@ -0,0 +1,210 @@
> "
> > +
> > +static struct platform_device * __init
> > +rqsc_add_device(unsigned int idx, const struct acpi_rqsc_controller *ctrl,
> > +		const struct acpi_rqsc_resource *res)
> > +{
> > +	bool is_cc = ctrl->type == ACPI_RQSC_CONTROLLER_TYPE_CAPACITY;
> 
> Not a fan of a bool when we might get more types at some point.
> If you want to do something like this have a trivial helper 
> bool rqsc_ctrl_is_cc() and use it inline.
>
> > +	struct platform_device *pdev __free(platform_device_put) =
> > +		platform_device_alloc(is_cc ? "cbqri-capacity" : "cbqri-bandwidth",
> > +				      idx);
> 
> Not particularly readable or extensible if more types show up.
> I'd use a switch that sets the string.  Declare the pdev and __free after that.

Good point. I'll drop the bool and add a switch for the controller type.

> > +	if (!pdev)
> 
> Drag the pdev alloc down to just above this.  Having it burried
> in allocations is not easy to read when you only check for
> success all the way down here.

Will do.

[..]
> > +static void __init rqsc_parse(const struct acpi_table_rqsc *rqsc)
> > +{
> > +	const void *end = (const void *)rqsc + rqsc->header.length;
> > +	const struct acpi_rqsc_controller *ctrl = (const void *)(rqsc + 1);
> > +	unsigned int idx = 0, added = 0;
> > +
> > +	while ((const void *)ctrl < end) {
> > +		const struct acpi_rqsc_resource *res = (const void *)(ctrl + 1);
> > +		struct platform_device *pdev;
> > +		phys_addr_t addr;
> > +
> > +		/*
> > +		 * The controller structure must fit and stay inside the
> > +		 * table. Anything else is corruption and the remaining
> > +		 * entries cannot be trusted.
> > +		 */
> > +		if ((const void *)ctrl + sizeof(*ctrl) > end ||
> 
> 		if ((const void *)(ctrl + 1) > end ?
> Which looks familiar. Isn't that 
> 
> 		if ((const void *)res > end)
> 
> Maybe that is a little confusing as res might be zero size.
> For that matter I'd not set res until after this check because it
> might take an invalid value. Doesn't matter as such but is confusing
> to read.

That makes sense. I'll move res to after the check.

> > +		    ctrl->length < sizeof(*ctrl) ||
> > +		    (const void *)ctrl + ctrl->length > end) {
> > +			pr_err("entry %u is malformed, stopping\n", idx);
> > +			break;
> > +		}
> > +
> > +		addr = ctrl->address.address;
> > +
> > +		if (ctrl->type != ACPI_RQSC_CONTROLLER_TYPE_CAPACITY &&
> > +		    ctrl->type != ACPI_RQSC_CONTROLLER_TYPE_BANDWIDTH) {
> > +			pr_warn("controller at %pa: unknown type %u, skipping\n",
> > +				&addr, ctrl->type);
> > +			goto next;
> > +		}
> > +
> > +		if (ctrl->address.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY || !addr) {
> > +			pr_warn("entry %u: no usable register interface address, skipping\n",
> > +				idx);
> > +			goto next;
> > +		}
> > +
> > +		if (!ctrl->rcid_count && !ctrl->mcid_count) {
> > +			pr_warn("controller at %pa: no RCIDs and no MCIDs, skipping\n",
> > +				&addr);
> > +			goto next;
> > +		}
> > +
> > +		if (!ctrl->num_resources ||
> Little fiddly but I'd split this.  The reason being that the next
> check if kind of checking for only one resource, but you only confirm
> that is ok with pr_warn() path that follows.  So maybe
> 
> 		if (!ctrl->num_resources) {
> 			pr_warn("controller at %pa: no resource, skipping\n",
> 				&addr);
> 
> I'd go a bit long on lines - not sure ACPI is that fussy as subsystem go.
> 
> 			goto next;
> 		}
> 
> 		if (ctrl->num_resources > 1)
> 			pr_warn("controller at %pa: %u resources, using the first\n",
> 				&addr, ctrl->num_resources);
> 
> //now we have clarity that we only care about first resource.
> 		if (ctrl->length < sizeof(*ctrl) + sizeof(*res) ||
> 		    res->length < sizeof(*res)) {
> 			pr_warn("controller at %pa: no usable resource, skipping\n",
> 				&addr);
> 			goto next;
> 		}

I agree it does look simpler that way so I'll split it up.

> > +		    ctrl->length < sizeof(*ctrl) + sizeof(*res) ||
> > +		    res->length < sizeof(*res)) {
> > +			pr_warn("controller at %pa: no usable resource, skipping\n",
> > +				&addr);
> > +			goto next;
> > +		}
> > +
> > +		if (ctrl->num_resources > 1)
> > +			pr_warn("controller at %pa: %u resources, using the first\n",
> > +				&addr, ctrl->num_resources);
> > +
> > +		if (!rqsc_resource_ok(ctrl, res, addr))
> > +			goto next;
> > +
> > +		pdev = rqsc_add_device(idx, ctrl, res);
> > +		if (IS_ERR(pdev)) {
> > +			pr_warn("controller at %pa: failed to add device: %pe\n",
> > +				&addr, pdev);
> 
> This feels like the sort of thing you should just fail init on.
> Papering over bits of the table that don't like you expect
> might be dealing with changes that have been made. Failing to add
> a device is something much worse.

Okay, I'll make the parsing stop when this happens.

> 
> > +			goto next;
> > +		}
> > +
> > +		added++;
> > +next:
> > +		ctrl = (const void *)ctrl + ctrl->length;
> > +		idx++;
> Could you turn this whole thing into a do { } while() and
> update these conditions in the while bit?  Then the various
> gotos become continues.

I think a for loop is better as it keeps the bounds check before the
first entry, but I'll move the increment into the for statement so the
gotos become continue.

> > +	}
> > +
> > +	if (idx != rqsc->num_controllers)
> > +		pr_warn("table announces %u controllers, found %u\n",
> > +			rqsc->num_controllers, idx);
> > +
> > +	if (added)
> > +		pr_info("%u CBQRI controllers\n", added);
> > +	else
> > +		pr_warn("no usable CBQRI controller\n");
> > +}
> > +
> > +void __init riscv_acpi_rqsc_init(void)
> > +{
> > +	struct acpi_table_header *table __free(acpi_put_table) = NULL;
> 
> See cleanup.h That needs to move to next to the constructor.

Okay, I will move it.

> 
> > +	acpi_status status;
> > +
> > +	BUILD_BUG_ON(sizeof(struct acpi_rqsc_resource) != 20);
> > +	BUILD_BUG_ON(sizeof(struct acpi_rqsc_controller) != 24);
> > +	BUILD_BUG_ON(sizeof(struct acpi_table_rqsc) != 40);
> It's an ACPI table.  You should be updating it only in a safe
> forwards compatible way.  Hence I'd not normally expect hard checks
> that will fail if it changes in acpica.

Thanks for the advice as I am new to ACPI. I will drop the checks.

> > +
> 
> Declare the struct .. * table _free() down here.
> > +	status = acpi_get_table(ACPI_SIG_RQSC, 0, &table);
> > +	if (status == AE_NOT_FOUND)
> > +		return;
> > +
> > +	if (ACPI_FAILURE(status)) {
> > +		pr_err("failed to get table: %s\n",
> > +		       acpi_format_exception(status));
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * A later revision could extend the fixed header, which would
> > +	 * shift the first controller structure. Stop rather than guess.
> 
> That would be an ACPI spec bug.  Sure they have happened a few times
> (usually when assumption was no one had implemented something that needed
> a fix) but the rules for ACPI are very strict that any change even with
> a version tick should not make incompatible changes.  You add stuff
> and sometime reserve things that previously had values, but you don't
> move fields around unless there is an offset indicator or size value
> in the structure to allow you to do that.
> 
> If riscv isn't keeping to that, I'd suggest working to make sure
> people understand this.  We can't have a regression because someone
> put that sort of change in the spec.
> 
> > +	 */
> > +	if (table->revision != ACPI_RQSC_REVISION) {
> > +		pr_err("table revision %u, expected %u\n",
> > +		       table->revision, ACPI_RQSC_REVISION);
> 
> Likewise, that rings alarm bells about the spec process if there
> is any likelihood of that being needed.  The only similar
> instances that I've seen were where things accidentally broke
> and we had to deal with that - and HMAT where this happened
> we at least landed support for v1 and v2 at the same time.

The RQSC spec doesn't suggest later revs would move fields. I think I
just lack experience with ACPI and was being too cautious with these
checks. I'll drop the comment and the check.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
