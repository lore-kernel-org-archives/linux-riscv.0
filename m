Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7FCF483D3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV5b8ZyjjnlM4q8P0P/rXGNGGxNA7o69kg03celFL6Q=; b=I2yTMwwQQXYvp4
	uZKnrHRP98DOirWTQdH5CW0NuFrqjXf1L7fT0LNCdVyAOPosl3dgcbiV7CIUSmE/mc5pKJpPhhzdZ
	ENMzICZLWyaVnAGq6gCOgSAdCNSanuc5YzB1B48Xa6wIXpPdQ4hBAQ4gVeuFLDei2o4ZpXT5wuC//
	YGdwgJLMoRituVdVq1eVT1/Vij8iUmFtRj6OcDm51R96fxHV7fTO34+7Af5y3jzMbNZ2RqjRBb/Nb
	9D3VpKSIF4gY4NX+UHHq4pfGgB4rePFFc2ZM8W0+Jc+LuNSHkR1Cz7OvVizKi7x3dYziBu1tZKBgo
	d5Fz6RNeoQ43/94Jiuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iEC-0000000H9HK-1EfF;
	Mon, 23 Mar 2026 16:34:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iEA-0000000H9H4-12NA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 16:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF7BD600AC;
	Mon, 23 Mar 2026 16:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E52FC4CEF7;
	Mon, 23 Mar 2026 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774283644;
	bh=tVhFdnif88pL3/1o5nN1Lj07iE1igspGsloimepkwbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LqwVeIstThWnSWZs5/7IiXp0BeQ3jii+jHusHFQhmCxbDkumptDevNL9itvh55FQT
	 ZESCfGx/feUcoPVVArWQ0RURwBbnq1XNGvx64sOxsPLqLl4nPyVg8T8sifR6hxfyq5
	 g9V1ZiyKuFTwtdi0DddbIlb0Iwk3v+by1+ckLUq4=
Date: Mon, 23 Mar 2026 09:34:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] riscv: patch: Avoid early page_to_phys()
Message-Id: <20260323093403.2ad50dced749e13cd98f01d1@linux-foundation.org>
In-Reply-To: <347c918e-6682-455c-ba08-096d9b7b89e4@iscas.ac.cn>
References: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
	<6ec5d4d4-f171-d41b-2705-a051bcb794e9@kernel.org>
	<347c918e-6682-455c-ba08-096d9b7b89e4@iscas.ac.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 23 Mar 2026 09:58:05 +0800 Vivian Wang <wangruikang@iscas.ac.cn> wr=
ote:

> On 3/19/26 01:42, Paul Walmsley wrote:
> > On Tue, 10 Mar 2026, Vivian Wang wrote:
> >
> >> Similarly to commit 8d09e2d569f6 ("arm64: patching: avoid early
> >> page_to_phys()"), avoid using phys_to_page() for the kernel address ca=
se
> >> in patch_map().
> >>
> >> Since this is called from apply_boot_alternatives() in setup_arch(), a=
nd
> >> commit 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE
> >> memory model") has moved sparse_init() to after setup_arch(),
> >> phys_to_page() is not available there yet, and it panics on boot with
> >> SPARSEMEM on RV32, which does not use SPARSEMEM_VMEMMAP.
> >>
> >> Reported-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> >> Closes: https://lore.kernel.org/r/20260223144108-dcace0b9-02e8-4b67-a7=
ce-f263bed36f26@linutronix.de/
> >> Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE m=
emory model")
> >> Suggested-by: Mike Rapoport <rppt@kernel.org>
> >> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > Thanks, queued for v7.0-rc.
> =

> I have only just noticed that this patch was commited to both
> mm-hotfixes-stable [1] by Andrew and riscv fixes [2] by Paul. Is this
> intended?

It happens - better both than neither!

I'll drop the mm.git copy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
