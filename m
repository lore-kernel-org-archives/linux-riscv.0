Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3D606A333
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K2+vHuYt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5lNybHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=drTRR4iffLzha3zTwb1bISuskZfg3iti12xC8TdwF9g=; b=K2+vHuYtLGOTin/YVIJvWRnEa+
	mvAQ6YvfzZOArjYYiSQGOso6wi4mK0fwzbd6NGc28/mPqRM867UODxZswgKc573JI0Mqi4/atMNpT
	XdWuadtgjAWu82n0tz0o8Bbh0RkZvx2clytoKowbfzCs+Royew2dv3zPnbDRRyKHnbNcDGvR47DH8
	4r7zIYW83HC/g617A9D1i/rdiHIIzGvy+W67ZIacGeffk5XD1sYsRydFndduWBeb5TpTLUH/4CKry
	UPsokk+S3ITYgUQFKwJaqkv7f5EBtwJhf0YG+pO3bwKFIc0q4BLUBqoXa0jkGreDQfwU6dcNKndvL
	bkG8NOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnFm-0000000AKCH-3LFE;
	Wed, 18 Nov 2026 21:31:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnFl-0000000AKC2-0vpz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 21:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EAD8415DD;
	Wed, 18 Nov 2026 21:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061851F000C4;
	Wed, 18 Nov 2026 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037500;
	bh=GSXnf5nv2fVeS5LQVArcdIaVDjGKR2SGDo/49eE5VD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P5lNybHMuD6Ekep+qjOOYc6sl3PHNLdnYPfYZyQ1uE2BnPeGNnzG4BydUZkEkz/T8
	 o6JiNvkd3IOWksfr5dM+8skk0y/tMbPsXpKkjOLUjnB3ux4BQxO/D5hVeGsKY0SA0V
	 RHVuG95PBlhip1caxtUlq4FaFQUkKjySL8m6yNLPTKAnMI4uIE8JsC0Axh+vcnpuzm
	 66ylyS1Kr6zXxYPpnpM3ZQuTbCXO4OWkgwMK1DbaKDaUUA1kH0nwZKevV9E/UK8vFy
	 HS0rSqb9uUIWJ4kYeAEAwtRy6mpZmbdmrWV5dSShKFantoFIrUu+pfqQSFy32VxrVC
	 9CEcRFlaWYbDQ==
Date: Wed, 18 Nov 2026 13:31:38 -0800
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
Subject: Re: [PATCH 1/3] ACPI: RISC-V: Add RQSC table definitions
Message-ID: <av4ZOllAbNJ9v+rn@x1>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
 <20261117-acpi-rqsc-v1-1-381ce645751e@kernel.org>
 <20261118203744.6201beaf@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118203744.6201beaf@jic23-hlaptop>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:37:44PM +0000, Jonathan Cameron wrote:
> On Tue, 17 Nov 2026 14:11:27 -0800
> "Drew Fustini (Tenstorrent)" <fustini@kernel.org> wrote:
> 
> > The RISC-V Quality of Service Controllers (RQSC) table describes the
> > CBQRI capacity and bandwidth controllers in a system. RQSC v1.0 was
> > ratified in June 2026. Add structure definitions for RQSC.
> > 
> > The definitions stay in drivers/acpi/riscv until ACPICA carries them
> > in actbl2.h.
> Hi Drew,
> 
> This seems unusual.  Normal path for this has been to
> put them in the right place and just flag the pull request as
> you have done.  Then no one merges the series until acpica
> pick them up and Rafael pulls that in.  That way it 'should'
> not require a change, Rafael just ignores that patch and
> picks up the rest.
> 
> I haven't been paying attention so maybe this is being
> done differently here for some reason.
> 
> Has added benefit that no one reads the patch as it is another
> projects problem :)

Thanks for taking a look at this series. There is no special reason,
just my lack of experience with ACPI. I will switch to the actbl2.h
patch generated by the ACPICA linuxize process.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
