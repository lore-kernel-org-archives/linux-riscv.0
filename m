Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A6FCD5BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 00:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQTWa0HMDVjCUNGJC1bRqZlAPk9s/bklGpKZKJuSbs4=; b=qq6NIItaGxBcbr
	MjNiuhDMRCOaq32+FCQnoquIiT5UaM58mcTY2vqJLiiV6w4c1flwKQGHTmfGPUBAcQU/qrRtQLoJW
	BigQEE9nj0qNc4AUEPpNJSmWpSwEhk6mB5/ONRJUClZnyKKLBJSC2pcDW0akrYeGmTPNqAYzIy4E4
	Sia6fvyhT980Pku/97ItxSo6nebcFRjLwTJkYJYQJ+X2bzttOefg5q1trHWddO4SP09aqJPmvg93E
	ZaNCCaoVTJxva5IUD0BlidrDusfzcf5eWSjpxIqDb/y+vINioi3NhOI+63PM7DhZcni4X3Pdz3Q9g
	25IGKzxxA7jvSYlFG3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOnk-00000004rro-110i;
	Thu, 28 May 2026 00:40:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOnh-00000004rrK-39H3
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 00:40:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05EB443589;
	Thu, 28 May 2026 00:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D351F000E9;
	Thu, 28 May 2026 00:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779928840;
	bh=tG/XbpBTWLccePGRYNDqANTMLFU+201Aq8Yk0wCxIGI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=a2Ii6QTcINR7cWAEyE/SM/pxdcdqo0QRirABpphjq2gaort+oEPNz/o3cvTWkcVQ8
	 oFpbLYYNbpajc+xhHC4PAcyRf8YL0Vh7cr5c8XFmmt6+q5F0zAo+e1GO0U96sGq4om
	 URCZEHqpjnZYnaqLUmH0+Lfho46D1ZdF61Qs6JM3KZeOOcePJXfmksT4ISkDAyBZwW
	 XuqFD0oE47VbOSg/20F1mL+YUl03kfNeJqRue7UoZswTUCfYJNHlDrl4E7WrNcel1o
	 tANNzRVPeFwkp3f6KqnjmL8zK4njmzYOkGdWTtNNUB+UGEA/gum0qL4GA5WFLTPgGU
	 ss37Mbzyz9OJA==
Date: Wed, 27 May 2026 18:40:36 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, danil.skrebenkov@cloudbear.ru, 
    ajones@ventanamicro.com, atish.patra@linux.dev
Subject: Re: [PATCH v1 2/2] riscv: cpu_ops_sbi: No need to be bothered to
 check ret.error
In-Reply-To: <20260413123515.48423-2-hui.wang@canonical.com>
Message-ID: <a201a559-3346-1f56-4d8d-432933054993@kernel.org>
References: <20260413123515.48423-1-hui.wang@canonical.com> <20260413123515.48423-2-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_174041_811508_BD64B5C4 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, 13 Apr 2026, Hui Wang wrote:

> If the ret.error equals to 0, the sbi_err_map_linux_errno() can also
> handle it, i.e. if ret.error is SBI_SUCCESS, it will return 0
> immediately, so no need to be bothered to check ret.error here.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
