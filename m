Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D35C5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YrV2xq4EU6W9rH73S8ZASsBmVqKpsfLT7EgUE/IrtY=; b=HVCtruxmVFmm/S
	lKRJ84kFLHL1D1Mji3gGvgOATiby7rEU4DOyJYCs8g++L+Vv1Wwi5P1zCAhjTJsIRcNzGsX1/KxB1
	LjPVQ01QW49pyc71idIfvmMp1G/XYtNCj/Z5UVSRYlyVtkk1PEdAWJWWB9nMqlByVwJmOXA0HgHpF
	yrRwIdPkPDJ6uXjvsEXgtqA0WcxUkz3/WtCut+L67NdhY+to3VuufFmH+0fFUYKW9w5CWq4F7y3ny
	/x0jmM+E4FBCUOpVI5zcgdUB6I8vDX8NUMzhwRmjeihI2z1Thmo+T+7m+of0Qu7vx06GehRAA+qCA
	FaWIEwvI1gEqGvbzU+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvKB-00000002xJx-1QyV;
	Fri, 14 Aug 2026 17:04:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvK9-00000002xJd-1pxV
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 17:04:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAB2E41FF6;
	Fri, 14 Aug 2026 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F055C1F000E9;
	Fri, 14 Aug 2026 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727044;
	bh=4Pp8s4B2T9IQ9eJkN9kBjdme+RhnxVC9qs6XRtDa230=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Pu6YM4ntzNwOqjDtVUKGkKhu1LyH2oMtpEW5N5p6/M8vY82XCe8WsT3KSfPdOMhAv
	 OkaWVCn6j+7TGzQza+1dXqcgoOVHcbyunNaqXL80OjcKolFU4P+C9f5O9HyK9D8HCk
	 MISHNIwnQTNE8mW9ttRrRIlRQHOtIEeMcAHFiBnP3JLPT3mJPoyJnSJFZxfLN14/Sm
	 5/sHtppq//1OPRVl5GXB/x5zYCuXVQkSHQGpbzquYKqqcnEXf5psmN9FTLyGVmPeJm
	 PPPRkgQl4DdbOku5REd9mWXqnNEi5702k2l3kRuCinUHzMXGo4DVRInfDHwD30XOfG
	 G/uVVNBH1BtiQ==
Date: Fri, 14 Aug 2026 11:04:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Paul Walmsley <pjw@kernel.org>, Nam Cao <namcao@linutronix.de>, 
    Rui Qi <qirui.001@bytedance.com>, linux-riscv@lists.infradead.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
    Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    open list <linux-kernel@vger.kernel.org>, 
    Linux-Next <linux-next@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before
 usermode
In-Reply-To: <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
Message-ID: <1d36c93a-200e-3105-8ea2-36f20c382644@kernel.org>
References: <20260721150511.1607105-1-qirui.001@bytedance.com> <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org> <871pcaa2g6.fsf@yellow.woof> <5a181a44-4f25-6cff-fe17-ac1995da8ebb@kernel.org> <CAMuHMdV+nFbF6QW8MCX-T0wSygcR5bw2o5RrHe2j=SC=44XFWA@mail.gmail.com>
 <CAMuHMdUu16GZ0WX3tfpzThfmP21kW-u4JTg8NBQ1HKUDvfXORQ@mail.gmail.com>
MIME-Version: 1.0
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

Hi Geert,

On Fri, 14 Aug 2026, Geert Uytterhoeven wrote:

> On Tue, 11 Aug 2026 at 10:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, 8 Aug 2026 at 01:30, Paul Walmsley <pjw@kernel.org> wrote:
> > > On Fri, 7 Aug 2026, Nam Cao wrote:
> > > > Paul Walmsley <pjw@kernel.org> writes:
> > > > > Now that we've queued a patch to get rid of the async hwprobe
> > > > > infrastructure, is this patch still needed?
> > > >
> > > > Yes. Removing async probe only ensures probe is finished before the
> > > > kernel is done booting.
> > > >
> > > > But there are usermode helpers which run while the kernel is still booting.
> > > > This patch ensures probe is done before that.
> > >
> > > Okay, thanks for taking a look.
> > >
> > > Thanks Rui Qi for the patch; queued for v7.2-rc with a cc: to stable.
> >
> > This commit is now commit 994dad686e755477 in riscv/fixes.
> > However, riscv/for-next contains the similar but empty commit
> > acf3fcb5e9199cc9.  Presumably this is the result of a bad rebasing of
> > for-next on top of fixes?
> 
> The empty commit was rebased, and is now commit 4e864f1c3d8d147b.
> Please drop it (it breaks my scripting ;-).

Fixed!  Sorry about that,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
