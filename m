Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAEFCFD379
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4gAHpfaL91KH3pqvxb+wD4mIXsTNaOf9qgBOSa7dwE=; b=PAZXynhSWB5e4H
	VtQXbm565qxtQT5SqX3KxFt8rTHtJInE9LUlxjdsYMn3It5n/H8I11yvF/ylmVKZlKD6D20hThfp2
	WsOBkpK1SFFyiOGL2HwsB/OAeSncfHvMWue3nZ4u84znj/TTtPludWHLoDMlTCoX3O/dUuKPVyL1B
	9K1xpJ/5Tz7MLCGRUi3iV2bC0Uyc5M8zDRmqQoPcn6y1MYchCjWhbRCLdXxtgqQFoDaklrYMq99xp
	IB1nj1OY3x3wni2tF4PuYdFNV3bGVwF+K/alBN2X8yzUKMkbrGJj2HFDrYewbfcJzLS+fLe+sbVUL
	2n21X3riq+S4eGb3D3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpN0-0000000D1rN-1kCe;
	Tue, 25 Nov 2025 09:29:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpMy-0000000D1qx-3XRZ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F25F4601F6;
	Tue, 25 Nov 2025 09:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04936C16AAE;
	Tue, 25 Nov 2025 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764062995;
	bh=NKy/zIFWyoD4WdHy+i3KxKzG5ZrXrwfJwFkWFvGtJrs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FyjPSYV6Vtt9/jriwhz4nzuLnq4mO09e4a8whVOQTZhC4M/7s5i2tBc6jrErFT7/Y
	 qLfmotNxFAruxkh4l5m86DFv3/pO/oPaZArv1tB4fs9hdJojMc9XlGPb3bDrK/x10d
	 3wukyfQ1Nztt7vEpkhQMgTPby2ykWKBVZuAawI0VOfQQsO40GPx9+5ou1nsAO9CL+N
	 dGBENDPC0u+RDwQEPp9K3PFfxGkHTKtxbbB1ng6heW7rkrE+ZzKy/KbfAO29S1XZHL
	 Z/LcZkSq8ps3AHEL+6Ph66g6QZ1jQJRCiBOz1BTM8fvW4ZvLwt//wd8jLkMoyvqFj8
	 CuUGCzBr9g1fQ==
Date: Tue, 25 Nov 2025 02:29:53 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Chunyan Zhang <zhang.lyra@gmail.com>
cc: Alexandre Ghiti <alex@ghiti.fr>, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, 
    Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org, 
    linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 5/5] raid6: test: Add support for RISC-V
In-Reply-To: <CAAfSe-umv64D011cjxPJEc0dBK29Xa4u6m1T=-THZ+V=a3f+JA@mail.gmail.com>
Message-ID: <2b81141c-2fcf-3083-e99f-a6205e121ab3@kernel.org>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn> <20250718072711.3865118-6-zhangchunyan@iscas.ac.cn> <00a97b26-0269-4c07-99b9-33bb759067f5@ghiti.fr> <CAAfSe-umv64D011cjxPJEc0dBK29Xa4u6m1T=-THZ+V=a3f+JA@mail.gmail.com>
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

Hi Chunyan Zhang,

On Mon, 13 Oct 2025, Chunyan Zhang wrote:

> I noticed patch 1-2 are in 6.18-rc1, patch 3-5 haven't got merged, not
> sure if there's some other plan for these patches.

Those were deferred since I wanted more time to review them.  I've queued 
them for v6.19.

thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
