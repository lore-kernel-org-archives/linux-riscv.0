Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892E6C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 05:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXxC7GYrX2sqBj9ZgpoYYQtVB+NyxI39LScV38bP62s=; b=tCoHUKJrFfSiYM
	3jqpROkhnIPXFnk/rqiTE0I1tqMhrbBbxd6K/eV8+vYu3y/tUzURjYYBfeFGvmhKgfd84wNrVNntW
	50fIe+aKhAAMyUiqN1jg5zraPJLzBd0DAXuh82YPeQWsMV9LfNS7UJCAqmL2mFkqWHArdx9haFqTW
	JY4r5ZG4JIzwKqJ0SEAoCgHng0M4ud0o9xYTGRNk+CtHGKAJVoHopLMVjaMMuuS8jsbJQVFMvlTfh
	rShrOntRlRE8pYXTk1J4Sbzhn2o1H0hGKCJObAJ3DimfZx16uI4FZGAiqkXLC07g3XzxExOgIbCbt
	o+O97He5Tk3OwmbRUfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWeP-000000066CH-3mzj;
	Fri, 03 Jul 2026 05:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWeP-000000066CA-0KGS
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 05:41:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A517E6001A;
	Fri,  3 Jul 2026 05:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED521F000E9;
	Fri,  3 Jul 2026 05:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783057279;
	bh=K1dUUsyk6rfusf74RsE3HlTSEHwrqILFgZJ4BkGvnSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yMg8LfaoM0vwIGg0rhTmu7UjJzj0k1D95WoTIGuTVrjb0whhqRSu+Z3W8KBZdAnUA
	 7TnMDwftKw9iZXXuNUkG9lVE69FaHdqgJiY9xJV6EtT52erQgSyVBiNyikKbm8axLZ
	 KDJ0N67mOfrvPlJk/8pMsBqYXZL/sCnkKMs/INy0=
Date: Fri, 3 Jul 2026 07:41:29 +0200
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
Message-ID: <2026070316-surgery-unneeded-bceb@gregkh>
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
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

On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
> Hi,=A0
> =

> Based on the current framework, I am concerned about how to support RISC-=
V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.

That is very vague.  Please provide specific examples.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
