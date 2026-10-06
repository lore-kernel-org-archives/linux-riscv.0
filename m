Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE88CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNlBJcfgLyM+hg37D5+0E0YCRsB5qv6Y5lZJrr825wU=; b=0pLD8cE1+inNoW
	hVAMXz2LyaYo9nGtU5jnawOnn9arxIPYvlw2dUbRu0dvtwx7EM4WYsTagkhhE7SxaQ69RhTcTryL8
	+E5+cgMdzirfaF06C8DucmpRrPwzAE1y6mvdFrzl9KSCNPshOLnkyJqgxhOyovFzdnEH99/hMM2Hx
	WLOuBlzgRnZNfrHOkbMrxV/UUnFUA34iCsBiLaYsotUrNTIsRZiYPCFgutooSW+7U5VXRvVWoNlUI
	t9OsWSoLdKJdc70F/Ck4hgrBvHnqX6gdtSMNZNKADxQ23CHDPs1BO95GtIYjpG2fb1YHQxTI2MSmX
	+pdpRowFEqboL/uHbtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dt-00000000TfG-2xJz;
	Tue, 06 Oct 2026 10:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dt-00000000TeQ-1BSm
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2FE3407B0;
	Tue,  6 Oct 2026 10:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A97B1F000FF;
	Tue,  6 Oct 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281796;
	bh=kyU579XOXAIlEHwjuDyIrRWHf4a6GOX7VuOC6l8fjmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=U4m6DelRB8wHStLxn63xF8zK9Q0lJZv42tbcWGb6jo3f11OeckqYgy4/XknjJnVBV
	 9TZgFLlgBrDI3aXjWGKyKFbzJ4o5IrmgS/VZ6QL5yGqFZxwN0ziH8u6knAEp/uCorV
	 jx3be0GagGZ7TcJsN2/PhGB1BtLVaD3h4fp89G+rA9fIlBTpNVddxPD0Rnq2DOpmHi
	 SiJwLQ8W6nAAhv07nRBlVEkJQMmT8+LUY9GCtYhgxo7eTG/iMjf0XxhRk4F6rziPF2
	 T3PJ2CVYEKSIDNLFsjxq5MI3cC39jquTFk7sytvwzKZGao0jMKTqYKfe+/QoLC1+GQ
	 rJnOZCytlFASA==
Date: Tue, 6 Oct 2026 04:16:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v1 0/2] riscv: runtime enablement for native misaligned
 ucopy
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
Message-ID: <2d08eaa4-c7da-04ce-e3d4-7cddd336db12@kernel.org>
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
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

On Fri, 11 Sep 2026, Andy Chiu wrote:

> This series is the continued series for commit b94cec5761d2 ("riscv:
> skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
> makes the optimization available to distro kernels compiled without
> NONPORTABLE config. Now, the kernel can skip the software aligning code
> in ucopy after fast unaligned access is detected at runtime.

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
