Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26673CC6B33
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZAFQRrbnHDKqZazlUDKUHrO8vq0Tws7uJbjbwg4tgE=; b=cJafRuVVlkuDVq
	ENdI+0/i0DZq3GBsz3vsFSXZXA0kDd1szQ6la3cb85oxQ3sKksh4gvjH6vbX0Vu+IdFuTXjuMXWou
	NdCgYetBsbtf6+1PeNl316mMsIksTeqFIsM+MDS6KumzUqHveLMEPBojakIGFDecALfL0jnBrBmA/
	lhdT4/B6P6CZbgfR4D8lBqtle85UOmRy3Ja0EdJwlHD7dq87hN9O6S46XqPbw144dLLtit1pFm/u/
	3U7kxBktWO7qnGANx2PIxmz6fuk8udVXqedkyL6NkViO/+YpVNPb2L/bETlBdpAOuWyyEdoVU2DC9
	y9oTWhSEPolDcCXapRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAyP-0000000GeEm-0BXJ;
	Thu, 15 Oct 2026 02:13:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAyN-0000000GeDk-2koh
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 02:13:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A23C640278;
	Thu, 15 Oct 2026 02:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E02E1F000C4;
	Thu, 15 Oct 2026 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792030414;
	bh=lYGm7luE63xYSigJ7AvIGcEshWOQl1LBRF7q+2lkSJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ca+x6RHdf1/mOon8Y2zQUYOCRw/Fl1NLIrNEgYE1wUH6yScU7TVNUFvRV0y36s5GO
	 cS0dQG1JM7IpURZnNkmSU9ii1fyQWLn7OVGtV5s2qjtW4frOkY8tWn79tt1Domvrgj
	 FUs5EIChA1q/+P+Od5MssV9At101XB7ZJIG0wpC6jTtwEkib6ch43XtDT9oplLpN+4
	 3ZUMyxNKvvN1SCP7SqK836RfujFwX8hLtt5iYpkjhocZiHpPCoiO/ISXW9SXfgxbbp
	 qvT5S5CbDmF/DcOnbUhCe/RVGsa5HpTe9sMJwQpf+y6VWpfE5CqAk+X4HZxjPWHoID
	 07Q7vEfYUOS3w==
Date: Wed, 14 Oct 2026 19:13:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>,
	"guo.wenjia23@zte.com.cn" <guo.wenjia23@zte.com.cn>,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"liu.qingtao2@zte.com.cn" <liu.qingtao2@zte.com.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <atA2zA3S9Z8qpik5@thelio>
References: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
 <20260901-dfustini-atl-sc-cbqri-dt-v7-2-ca2935d85622@kernel.org>
 <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
 <aqwN1szItGPg4Qjh@agluck-desk3>
 <as0Zeoyjiy5CW1DT@agluck-desk3>
 <eaeb4259-46d6-4656-8354-669ad32654b5@intel.com>
 <SJ1PR11MB6083F4281EDD036A4E73A532FC9E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <a85a5aef-5468-47ba-afba-8bdd666dadd4@intel.com>
 <as6Y72SbiXcJh6Ei@agluck-desk3>
 <22ecec13-a703-414e-9f5e-75c89173e845@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22ecec13-a703-414e-9f5e-75c89173e845@intel.com>
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

On Tue, Oct 13, 2026 at 02:29:41PM -0700, Reinette Chatre wrote:
> Hi Tony,
> 
> On 10/13/26 1:47 PM, Luck, Tony wrote:
[..]
> > Don't bother with a control_mode to switch between legacy and native.
> > Just auto-select the "L2A" control on asymmetric systems.
> > 
> > But since this thread started from a RISC-V thread, it would be good to
> > hear what is needed for RISC-V.
> ack.

For RISC-V CBQRI, the number of capacity blocks (NCBLKS) is a field of
each controller's cc_capabilities register, so two controllers at one
cache level can report different values. This series will leave a level
unexposed if NCBLKS differs. The per-domain max would allow such
controllers to be fully represented in resctrl.

The hardware I am working with (Ascalon shared cache) has only a single
NCBLKS value, and I am not aware of any RISC-V hardware with different
NCBLKS at the same cache level. Therefore, I don't think it is an
immediate concern, but the spec does make it possible for asymmetric
systems to emerge in the future. It would probably be reasonable to
require native controls to be used for such systems.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
