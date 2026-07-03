Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC003C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHRUrzAOasoeQAyArC1omMABjJN7MOFYNmfm8OE+7ts=; b=PpA4DBg/jhj4KY
	TQT8z1g7mM91cNGwPwfBuA3IC+r17iFKegujTYbw8x6AOEdDAJlf2L7H1+YHtHbCmkLHRbFv6PUjQ
	EhV5+UY7F05YmNUHHs2JAwRobogdrbXbC/Qm7nVDej8KEhjThiBoXySGqRiqFBAqZZxRN4SiNrzbd
	chOyHjAAQF2ykPAkrjgzwiTk8sGHUBDgCMjBeUdLkyR1ATJQJkOA4zwI5FAU3y1AZ/yNsgNFBRBaV
	haJv0TxqfOXmN5UNvyGp5peqhkgvUuIEWOSquGWGm+uOvIxbxz7cV1JYOBxazCDmmQHd+6VDVnH7w
	5VjHWPASD/CULtKNz9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYWI-00000006I1X-076J;
	Fri, 03 Jul 2026 07:41:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYWG-00000006I13-2K6W
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 07:41:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 962356001A;
	Fri,  3 Jul 2026 07:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7181F000E9;
	Fri,  3 Jul 2026 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783064463;
	bh=kMqoLvZk7UXpRSotpTBH9ZtApx2EgbAedMgVy+3wNS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhTNqMNF9sBWKBBN1DJh99gvQpDQOqEw61XaYxYhVp9SWTwtsAXIO/6cMu3OPyq6o
	 4AnlM4J8xr2yD9PFWsuyO6znk1xBJI0p92R0ipn3FBjnafbjKY9CrIb6tQh+GfsbvQ
	 PfPj0LiNMSHwM/DuJoSBOyxHK2wkdF/VvXioQfGo=
Date: Fri, 3 Jul 2026 09:41:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, mark.rutland@arm.com,
	mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
	sunilvl@oss.qualcomm.com
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
Message-ID: <2026070300-submitter-humbly-833a@gregkh>
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh>
 <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
> =

> On 7/3/2026 1:41 PM, Greg KH wrote:
> > On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
> >> Hi,=A0
> >>
> >> Based on the current framework, I am concerned about how to support RI=
SC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
> > That is very vague.  Please provide specific examples.
> =

> According to the /trace control interface/=A0[1] spec: "The ATB Bridge al=
lows sending RISC-V trace to Arm CoreSight=A0
> =

> infrastructure (instead of RISC-V compliant sink defined in this document=
) as an ATB initiator. ATB Bridge is not=A0
> =

> needed for RISC-V only systems."
> =

> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU),=A0 =
so we need also ARM coresight driver in
> RISC-V trace systems. Current framework seems to only be applicable to=A0=
RISC-V only systems, and does not support
> ATB and=A0=A0ARM coresight=A0use case like the K3 (K3 SoC contains RISC-V=
 Encoder, Funnel, ATB, CoreSight Funnel, and=A0
> =

> CoreSight TMC components). For more discussion, please refer to [2].
> =

> =

> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci_sy=
stem_overview.html#atb-bridge
> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux=
.spacemit.com/

So, what specifically does this mean?  Please provide review comments
for the code itself.

We write code for stuff we have now, today.  If future needs change, we
change the code to handle that then.

The only problem is with user/kernel apis, those need to be nailed down
so that they don't change.  I can't tell here if you are only referring
to the in-kernel stuff, or user/kernel apis, sorry.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
