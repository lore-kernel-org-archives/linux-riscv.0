Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F2E9A03E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2a5NcslfP+lH6l2q4OYjzjr8PuHXd0cNII/SrFZd1FE=; b=OTU7x7xZRHB01I
	+LTA6Dm1Bw+hM+epYZdjDkdqcbCT264BuL4MVM+ley5PVNoNJIjqIroTZCslZWXxjDPzCLAm47Hyw
	eCbvpEfBPd3msOVZtNn6sMce0mqnzeU8IQZs0FsAfnP1y9kjdgF6TzCq426e/xMKhzXxkOSSx797l
	RU5Y3mG4QGC2nY1R10NuI1MI3Ty5YmFpVCW/mSHe72BnxCLKShJpE9Sc0Rr/7/URtkIfG5bEGvv6q
	X7AUJI6IYrgJZDXTTZeTiskES0X48os+1zsb6vQfw+VBkff6N4lhvRm9oqoCgowEAY43uWM8WlkjP
	fPP4f/JeXxEv+pMp+KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTg8-00000008zhN-22HE;
	Tue, 17 Feb 2026 22:36:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTg5-00000008zh1-3oEr
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 22:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C62041AA1;
	Tue, 17 Feb 2026 22:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C88FC4CEF7;
	Tue, 17 Feb 2026 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771367780;
	bh=fpWLMGake2nbfxsw2JifRPbV4C4cu+jMNO44Y5INPqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVDxJWBgs59sS3DNxLuPVsiywvYc5gg06lYoYmr4QUYlSsVuXX7xjFE8AjIVTS8Vb
	 7cdlbqo9AwPlF6Ad4qfJ0RLNh3nDI/NbARpWf7V7NHJ4aQWhITLrAGimkdW1PX6Gx0
	 qBmOkOpQWTVNsJ+k8KIfBGVGtC2g/PRXTtlqQVPC2Kh+5LbPxcy929mC4IZvcepjcO
	 sqMJ9IPoPgqwmcJ138AWW8AFx+Tgl52SSCZcd2riPmJrMh217bRCxpxsFNo3apBXiW
	 7X46IAKqZHHvHWRTSdxaZlGVdootEufHv7cBSJn2jgoe1onumUHeHa/WBYMvyAE3Ta
	 6c1veuC92kKqg==
Date: Tue, 17 Feb 2026 14:36:23 -0800
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v2 05/17] RISC-V: QoS: define CBQRI capacity and
 bandwidth capabilities
Message-ID: <aZTtZwE03nHj0S98@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
 <3f53c823-74ab-46c3-9cf0-c28b062f2c89@intel.com>
 <aZCh3JaS2V0pLWXm@gen8>
 <0ba158fc-0c44-4b83-b733-9fc00c4d7f3a@intel.com>
 <aZSzZChSrjXeZmf1@gen8>
 <538dcb97-2699-4220-9df2-0bc6d5f64412@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <538dcb97-2699-4220-9df2-0bc6d5f64412@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_143621_970394_429E08F7 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 11:02:30AM -0800, Reinette Chatre wrote:
> Hi Drew,
> 
> On 2/17/26 10:28 AM, Drew Fustini wrote:
>  
> > BTW, I'm working through all the comments in patch 8. In short, there
> > are a lot of shortcomings in my current implementation that need to be
> > fixed and I will explain in my reply how I plan to address them.
> 
> Thank you very much for considering the feedback. Could you please also
> consider splitting patch 8 up into more manageable chunks that have
> descriptive changelogs? Even for an RFC it would help digest this work.

That's a good idea. I'll think about how I can divide up the code into a
larger series.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
