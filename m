Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242BCCD5BAB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpoP+yeJZ+Qngs+nlvBKfn4PA3oPOAJLNJVBFZfGXto=; b=lc5l3vvJZy2XXo
	L7QKXijzjDVrGXLT85rmNdzvFNNnOSWn4ypcfZjXBXVdUpDbhPZQUbQLp+askuSH00tOeKhqRLgxE
	3jfeL0ezop2ZAoV3WY/pDK80HXs7h1JI8moG5tdY6eWj/7oFub/rsK97mWlhh71Srfcvx7xtbBq6l
	vTcXr81+PAI4ghVO1V6zCBgfsL0JSEmciNytfszZYzskLJQOeK2DEt79ztn7DtkwijDx0f+lQ5yam
	X0Gqu8ZuSOGidCZRyTCuDjVBV1L/EnAGAcA9CzP+hGm777uQeAOfi+dFe8FpirGm9FVaI2jslflgX
	YHafQFlYL7uliwshylpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCFW-00000009Gco-1zBn;
	Thu, 21 May 2026 22:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCFU-00000009GcT-275C
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 May 2026 22:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WPWjKtDA7kQDjj6GVIm6c5sZdcY7OZ9bfxBSLXp/6JY=; b=f+GIu+FKsJnE5VwDOji3niAdOt
	988YAy2OVBOmBRnugsVEU5ZgPe5wli7OmMICH3JKrI7rIafoMoLgLYR+Vo/dyfXH84v+SEPi++9Gv
	Rhx+qiswIZhezWZOLyIT51dqIXV8wruJEt0n1OzQaX99stZ/yhf37ea5jdTHsDYIhhAAIui+Q/e53
	+NaH/GjRRaBpG7QdUsK1Yr3qZKhmfU8sRCMQz3lZZXxSI/AgF2FqTzOp/bpZnSIfK9cWp8A6CaSLn
	boWiuQrU8SGb8hgtme6/PNP1d5L/dOtrX7z10zv4XuWYmaVSo9ewYV9Eub9p9IWKxvvYYsX+gqCjE
	Fx0+mwwA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCEM-000000034Vg-278b
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 22:52:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF35244418;
	Thu, 21 May 2026 22:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801711F000E9;
	Thu, 21 May 2026 22:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779403860;
	bh=WPWjKtDA7kQDjj6GVIm6c5sZdcY7OZ9bfxBSLXp/6JY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Omx52bTv46z1LIS3lyH0XFiNG3p/8XF7Q3lFu9dPnmH3je16l9C1quavnLLlhXMJo
	 e+QmqmY4yC7HYsf2ij+z1RAi6YxKBgY9IxSZtQpxK7RrjGTa9z7ORPlw9dU11mHVcI
	 goSUlhrRHbJnjxPmaWHsVYy2Zh8X2xjpdhXck3F4M2KMWE5A7fdxOn7DI+7TJI+A0v
	 lcFgfuA2jPe68v4qs1KXKod4LW5DWj2hEp9b0lLDczrV5WsoH5+Nh0RKdjbZA3Y5kq
	 uOqGHswOIzABZppypN4cBAujhckNKBugJAVoKE6CKUgxMj5JN4ulfD2I0b2PmD+N/B
	 mqQIfNB3PlEuw==
Date: Thu, 21 May 2026 16:50:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zishun Yi <vulab@iscas.ac.cn>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    alex@ghiti.fr, atish.patra@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: cacheinfo: Fix node reference leak in
 populate_cache_leaves
In-Reply-To: <20260509074040.1747800-1-vulab@iscas.ac.cn>
Message-ID: <58b50dc5-7307-c38d-3cdf-46343052bafe@kernel.org>
References: <20260509074040.1747800-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_235120_960607_45553525 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

On Sat, 9 May 2026, Zishun Yi wrote:

> Currently, the while loop drops the reference to prev in each iteration.
> If the loop terminates early due to a break, the final of_node_put(np)
> correctly drops the reference to the current node.
> 
> However, if the loop terminates naturally because np == NULL, calling
> of_node_put(np) is a no-op. This leaves the last valid node stored in
> prev without its reference dropped, resulting in a node reference leak.
> 
> Fix this by changing the final `of_node_put(np)` to `of_node_put(prev)`.
> 
> Fixes: 94f9bf118f1e ("RISC-V: Fix of_node_* refcount")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Thanks, queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
