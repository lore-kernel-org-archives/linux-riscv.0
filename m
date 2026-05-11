Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974F1CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8OqFoHcMmia5bcvet1VyyVYTpTbhUNyUlnzW457hcI=; b=ejxFGF+m/fbXlK
	GjSWYCuEZIEuAbJ/POsE6/8/ybZ2YDvwcm3/sXHV6RQjOMia+sF+/FfOjuSWQLG+lWPrO3X1YdbPM
	NgjFgYL4hdtNALza9tgVSoVOIQgY7wyvVpFRubKtLG/xbcZaVZ66aznd8kPdQxcTJ25dA8bFYAdQW
	e/tr04hl+JjEjUsAOo+qfvXwJLkZzdmjC37RoYF3xehIaN8WaLWtlhdfqxFQEmV07k06bTlchd6j1
	95Y09bIdgMYZgavZUKNJO+5UAFDLdsvuZXUdxhNXUpqtDDLx5rNnI9Yt19T+PKOvd5FuWSnGJ/KpW
	oUdu/SrwammusNORcwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKhl-0000000CYaT-3OeS;
	Mon, 11 May 2026 07:05:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKhj-0000000CYa1-2ScA
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 07:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBB6540A65;
	Mon, 11 May 2026 07:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31807C2BCB0;
	Mon, 11 May 2026 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483126;
	bh=cPWpJ3ODp7kHpyer+OEkVZg2DAv+YVBmvyXY8bdNLr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgmgmgQzpHjhq6mrGzVqYUF9vTKAlqZdnft/4nNKO7p3DrdPT2nbWweiJtKczehVu
	 WyqPzpUl+TGiBkC/t+8aIO8qTPXMHyJ/NlOaoYozyiRk5gqaYnEGl35vGn22aEbY9H
	 QzrV8vbLx+aBQu/o/VB77ORIhWoxiwXJXXv4TuBWGO+aN6Z/DWFk2qfnVYLBUuF53F
	 brawa9B4p6oVNIfsF6Epb7/YlZDwtTP8khlyfQhq2dvXxyq43u/z4qUJFLgrIq3ZLV
	 trK211h2zcuAPo4W7eGSrrIUlItC0gL2bZssvEzoNVn1ah6k3jks0ENgUK5ZHHNWQ/
	 8n7R5a7RjCmAA==
Date: Mon, 11 May 2026 07:05:22 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: enable USB3 on OrangePi
Message-ID: <20260511070522-GKB3624147@kernel.org>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
 <20260511060101.3782514-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511060101.3782514-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_000527_649907_61913BDF 
X-CRM114-Status: UNSURE (   8.16  )
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


Hi Chukun,

On 14:01 Mon 11 May     , Chukun Pan wrote:
> Hi,
> 
> >   riscv: dts: spacemit: add fixed regulators for OrangePi R2S
> >   riscv: dts: spacemit: enable USB3 on OrangePi R2S
> 
> Ping... This patch seems to have been forgotten.

Thanks for the ping..

Don't hesitate to ask if you think I've forgotten, or the patch
has been ignored for too long..

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
