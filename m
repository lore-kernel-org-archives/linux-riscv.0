Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6165CEFCE7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8DbI9ohpzy2TGV1UAY3dPiDYBbAY1N6fKisQDiBfUY=; b=maiqfW4uR21ywf
	1kWXA9hqdU2cX4L+SFxxE2aCtqnzIH5mKr74J17VXN0Dsg0kOq2E6FdYLEV2xzjkfnKeWnwgATblG
	Y4dmIsNdIinY+lwyb++wVxZRMAXzR9L75zLnETU7FaYL580kS9iqvutiLm5E1lp10DL0rH+i0hbBp
	UQkEXubyeonVpl4kaJ4JgSg/MDhM4lBLPsc6La7tomIssn1ZnTEpxD75BBX3gPaTFehIPeXxKo3qA
	8D+c+G2EJOwNARcXSsaKdPXUQe2jVAeemqCKWJnJZTQrvdqrpxD19FTC9g6rEBwIZprjJ4GkbpmGp
	UJU1+WRpDtWBMxqvKlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBmq-0000000Dfvi-2eOx;
	Tue, 06 Jan 2026 18:28:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBmn-0000000DfvI-2raL
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 18:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5096441B6A;
	Tue,  6 Jan 2026 18:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A54DC16AAE;
	Tue,  6 Jan 2026 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724085;
	bh=/kUTBjDyHLOP++rgoCOAu8BTPjxi49VyNskoVZ4vBSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCAPKZAbn39k8eOCcd3oj3Nn4sYm+QuZqLjs7w6lS/wpANcUuqYlNWLB908OWP03P
	 t/6hVgUQ74kCvCWiDVdpZjehdtDGxhZ+/VTMAeXGVfVqrElZdGsxmJZqzzz3e6kSrq
	 Q69PJJd/lF8hveaXkcw48n4m2CIxWq/205cxax2Ja4Zs7xqBXu11qq0Dhv83IOkyTq
	 kaGzy7r4SotX7GdgYMI7LdHNYBLv9egs1brgf+TabC4uOYdiFYzjptuFHKLqjEyYTh
	 b2umfxcQCo5Q+TKBM6mbF5W0/jNBKyDs0QB/pM6yDFS6x/YTsd7tvnGxpKCQp9PQUh
	 r+o3VEq+6kmUA==
Date: Tue, 6 Jan 2026 12:28:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: alex@ghiti.fr, cyy@cyyself.name, me@ziyao.cc, krzk+dt@kernel.org,
	palmer@dabbelt.com, conor@kernel.org, TroyMitchell988@gmail.com,
	gaohan@iscas.ac.cn, linux-riscv@lists.infradead.org, pjw@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kingxukai@zohomail.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: canaan: add 100ask K230
 boards compatible strings
Message-ID: <176772408361.2509936.16592890461437169152.robh@kernel.org>
References: <20260104070911.219588-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260104070911.219588-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104070911.219588-2-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_102805_745979_DA0CC524 
X-CRM114-Status: UNSURE (   9.25  )
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


On Sun, 04 Jan 2026 15:09:10 +0800, Jiayu Du wrote:
> K230 CANMV DSHANPI is a development board produced by 100ASK.
> 
> Add compatible string for the board and its SoM.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
> 
> The hardware details are available here[1].
> 
> [1]: https://github.com/100askTeam/eLinuxAI-TrainingDocs/blob/master/docs/CanaanK230/part1/01-Introductionhardwareresources.md
> 
>  Documentation/devicetree/bindings/riscv/canaan.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
