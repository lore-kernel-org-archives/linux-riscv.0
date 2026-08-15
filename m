Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B43CC5CFC1
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 00:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnrvWMj2JOFi0uIjy0FQFvYSIpU9h/2t0YJPg+IuEYU=; b=jQkEc51YO4ARSA
	8eMV0rY5hcHFgXwvb/UgCmCvY4QC8945cefXAhEuOtC6CWbsINRsFdCeMKfdpMSmzoAMrBXTPnOK/
	DPZrh0PZtElseOWFhuR4/n9vA8AEThaUJRNxEooG0b6Krlz3SDqlg0m4LN0QZDvvVEdZTB9KDklnz
	zB5sz1rr1v/CGo5jUKaMgBRC2EVUn2FnOeVVUYV94DhDQJe939jYjm1Q2QE0dzogyzO6WrvWozCZo
	KN73tjJSamg0WfUfTQtC4o3R78rb+lfacl9QlkmDpm5x8zBBMHpbHVY9YKmU8/7R7QdQtZKz44Pb/
	xlRrae46/Y7KEUIPyS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv1wF-00000003KS0-2nRx;
	Sat, 15 Aug 2026 00:07:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv1wE-00000003KRq-0sWX
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 00:07:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 245D4600E2;
	Sat, 15 Aug 2026 00:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952DD1F000E9;
	Sat, 15 Aug 2026 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786752468;
	bh=kWSRKvTjWjrBmE8RB5NmAV+Uzzr1c6KdIJcOaEpeRHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W41gzK+nj7D0R6J81tfBjV1umrlbXlj1j1cLCsLybgPX11Ycnp6gGJ8uEmW9Ci8JB
	 tbix5PBHSoY6tUwrRumGl/x1uOLAO1wAQI+n9yJ+SoOqy8BtX47aCCWCpG+19Ed5HB
	 ckId7+AkwOLpkSoCsbDA7xwdzoQejsVTIIM0xnRCJ2jiiIhwAipS9QQTo56dk2XChp
	 +nJnYLEjnHAc/lanj7i8yea7AlbOfq6oMa6gte2v14qVEvzUjvB1W74bdnRzAMKPNK
	 2QTmeEcl8APPdzE45T4XNL/KYYioFLv+ljzCUqDNn6q2Pz/402LckPQhaiJvdIa48I
	 cUG4/lMfrx/2g==
Date: Fri, 14 Aug 2026 17:07:47 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 0/5] Add remaining IO expansions on Lichee Pi 4A
Message-ID: <an-t0_Gd7zar_raC@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <amJF1g8sPu5RrrIQ@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amJF1g8sPu5RrrIQ@x1>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2026 at 09:48:22AM -0700, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 03:45:10PM +0800, Icenowy Zheng wrote:
> > This patchset is split off the "Add TH1520 USB support" patchset,
> > dedicating to enable the IO expansion chips, because the situation
> > becomes complex when one of them (but not all) was added for Wi-Fi
> > support.
> > 
> > I fixed a small issue of the existing I2C1 device node, and then all
> > original patches are aligned with the existing I2C1 node for
> > consistency.
> > 
> > Emil Renner Berthing (2):
> >   riscv: dts: thead: Add IO labels for the IO expansion on I2C1
> >   riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions
> > 
> > Icenowy Zheng (2):
> >   riscv: dts: thead: th1520: remove pclk for I2C1
> >   riscv: dts: thead: lpi4a: sort nodes
> > 
> > Thomas Bonnefille (1):
> >   riscv: dts: thead: Add TH1520 I2C nodes
> > 
> >  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
> >  arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
> >  2 files changed, 157 insertions(+), 37 deletions(-)
> > 
> > -- 
> > 2.52.0
> > 
> 
> I have applied all 5 patches to thead-dt-for-next and they are now in
> linux-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/riscv/boot/dts/thead
> 
> If no problems arise, then I will send thead-dt PR for 7.3 in a few days.
> 
> Thanks,
> Drew

This series should be in 7.3-rc1 once the merge window closes:
https://lore.kernel.org/all/178534081274.3143403.4697156662576834176.git-patchwork-notify@kernel.org/

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
