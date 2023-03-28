Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C354C76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3zvYuNl7XQQ6pFdmyzSCAP28zIp8BvhXewr1NgXIus=; b=eTPHGTUNSzzdIt
	RxaxnIFxGKlPdYyzO7VtoILXYSap49MpUEkqum4zdLHB1S8jZdB6dqCY74wlDMUO1E8kBz+H4GiPo
	/aLIulYmlzfaqmKjwwh4XZdZYeSocDqL8a8LlBhLAcbEONgL2HemaIqGmPAdyyCvWxxKlsi6b3b52
	llEfHMq9bg8AS+G3m2Gk3A5+g4lu3qWVbMEbsA4KBICSx/kSxJsPZkJ693frEJka1baUhBR3bV32J
	qBCtak4VLwg+0NroDwQvufVecIakXv4JjJN5E42BSRwQ/baOqjK5S9UCx1phpp64lJwLEwkpI4+RC
	6VPKFL3TNaap7y2Fpg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgxLn-00Cj8j-2Q;
	Tue, 28 Mar 2023 00:38:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgxLk-00Cj89-2L
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 00:38:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E6241CE19FD;
	Tue, 28 Mar 2023 00:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CBAC433D2;
	Tue, 28 Mar 2023 00:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679963884;
	bh=u9KFs6cotcR9My14LoQOcoE33Db8Gtr5qkuqQI/KgnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AVej+MU/db/2tSiT+WNdJ/9mXqO2M/zoBQug4Wvl+ZD+g70dpYJCqQ/ysxPj4QtHT
	 kaitS+Z47ZzDM0TMym3/ZQv0+YWUJOkwsIvCetnnvAF3JWRWowA0VnFvNA5AWOlzoU
	 5uvauJHC4uQcVHqHtBi094OY454r8E/1dhVh1/tPyWMJx6Dc5leRJ6VmW2m5J2L5VR
	 jN1+L8DcoaULekM+203NU80i0Ld8kzyBZvcz8osP9o6FODHF9CE5P7BFzppACRdpKC
	 8q/rJ4Zjxx0QKmI7ezu3mJD0HhC1Bd4Pw561QkiH97oqcwoYlbg56WGRJbMEELHbnr
	 hE+Th33GpjVTQ==
Date: Mon, 27 Mar 2023 17:38:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Guo Samin <samin.guo@starfivetech.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>, Richard Cochran
 <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
 <yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
Message-ID: <20230327173802.0ceb89df@kernel.org>
In-Reply-To: <b20de6ba-3087-2214-eea2-bdd111d9dcbc@starfivetech.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
	<20230324022819.2324-5-samin.guo@starfivetech.com>
	<20230324192419.758388e4@kernel.org>
	<b20de6ba-3087-2214-eea2-bdd111d9dcbc@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_173808_957922_28E03E2B 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, 27 Mar 2023 09:53:22 +0800 Guo Samin wrote:
> Thanks,  I will resent with [PATCH net-next v9].
> My series of patches will depend on Hal's minimal system[1] and william's syscon patch[2], and this context comes from their patch.
> 
> [1]: https://patchwork.kernel.org/project/linux-riscv/cover/20230320103750.60295-1-hal.feng@starfivetech.com
> [2]: https://patchwork.kernel.org/project/linux-riscv/cover/20230315055813.94740-1-william.qiu@starfivetech.com
> 
> Do I need to remove their context?

If the conflict is just on MAINTAINERS it should be safe to ignore.
Resend your patches on top of net-next as if their patches didn't
exist. Stephen/Linus will have not trouble resolving the conflict.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
