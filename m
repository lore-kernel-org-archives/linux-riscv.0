Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A98CA100F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00y9iXT0LYyS5bbqC4wl5Zj2INxu2U49/eV4UnCukzE=; b=eSuu4zHaF8l3fi
	0vkv3zVCZtjacZaONbde6LwW69GqqYtkm6pIgZXAPnhgQeipexREGoUVAcMTgb9NG53K66g6uLJ7H
	4MSyRzddwXsh26812XsPu0d8CH8CppXbjokYY/fWNkSR0i7CSl0lxhnJBmBTAE+h9Q/pLbST2Y3sQ
	84DWRWuJ05ZZIV4a95Yf+TAyXfhkHDjAEQHRpNN2a1oVcuJpxYPen6BQcWisR1rJj9OVLffYvt6C3
	NexMWwvh+OWsLvg9b6ZjYdMcU5DOts2QshNZ7WoNEdleAvL/CmtyFYYTvf9w6N1jNx72bok5sc40F
	FHtvFNaNmPNqHfsoZQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j2v-0000000Avfs-3r0M;
	Mon, 22 Sep 2025 16:05:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j2v-0000000Avff-0rtL
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 16:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B34F60200;
	Mon, 22 Sep 2025 16:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14679C4CEF0;
	Mon, 22 Sep 2025 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557144;
	bh=JPkZxdmSLhErHT2r6+C3wkfctmMfikaGR/BNm9a5YNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNEhAO9aBetiLDHu8K9co2Qyo5AsQg6T/SupFrIVQSWa3I3reOQFVWsEYJapeiMoN
	 5cCsYyagEi096PoQPTkMz0vEV06YJTqmb661KvwQnc7vM400S6qrWy4qGwe4ESp2Wl
	 VsgI5kqtZVoXkObKtO4kKkE3JgxUE8PIJ4UyoB/VKFg8C/SGEHvYYWXy2mguMxA/Fc
	 lM54ZW8AOLU43HrYaF+3lfcp1/ES/ucuhvpaAycZSTCdNV8XRKgLUdC8ww7gNkrTGR
	 u71vKSP1hjUkuv9jtNAZAhXCKN2NpfERCQxVbQf7Q4NSyhk25OmhMmi1SHtU0DYIzt
	 oGy7oEnybRyhA==
Date: Mon, 22 Sep 2025 11:05:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <175855714271.140455.3621528471565311357.robh@kernel.org>
References: <20250915095331.53350-1-ziyao@disroot.org>
 <20250915095331.53350-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915095331.53350-3-ziyao@disroot.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Drew Fustini <fustini@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 15 Sep 2025 09:53:28 +0000, Yao Zi wrote:
> TH1520 SoC is divided into several subsystems, most of them have
> distinct reset controllers. Let's document reset controllers other than
> the one for VO subsystem and IDs for their reset signals.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
>  .../dt-bindings/reset/thead,th1520-reset.h    | 216 ++++++++++++++++++
>  2 files changed, 223 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
