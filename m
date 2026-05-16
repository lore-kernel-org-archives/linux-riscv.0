Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AFFCD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JC0Euh3qJkSLfnMDcFwbM5AB2JIYHM0y18tGpwHOjIo=; b=FiNFEilNxLGEMO
	0+N5t4rIMoEtg6dkQWlSCCZK25NIHUy9KsxuWxoE232l+OTToS1gWn1t4ls4vz0q4KSz/f6B7qb9R
	gfPa7+redYHaxA95u/RfBZFnVUZXymz+hN+tyS1Oqk97lDKtjlFTfNv9jKpVv2l3+PZzhG+fpw6IN
	KCcIqNGJApdGOx3peGBTzFplI+vUbAARVLeSa5vlQq/Iv/Sq7Me7FFRQLHGPavNW29oxwunSABYQM
	WX3vcM9zFVMY19e5cZ7T5ybKOqaSrz7hMTQrHWk05gOBLA8TKAZP1DTtUBQmgQKxWDnQJOYzGGhQy
	k43OaaLsLbZxTIr/5KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOFLD-0000000AoKR-3MIN;
	Sat, 16 May 2026 13:46:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOFLC-0000000AoKE-0tKO
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 13:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05BF960138;
	Sat, 16 May 2026 13:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AB4C19425;
	Sat, 16 May 2026 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778939164;
	bh=GKVZ5j8qjqsmJoXt0a6b/BD/gTotnEQVA0nYLIeU1As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qe11BBILvcIILjPyGrdWN/A8LunHdzZzpiu+AKAxhcpjqALpHa/2I9fQTUPBcxXTK
	 KsKCbjW8wRCrW/RGjKmpSHpK1mRPGSHxQP5OTTgFz77qnBZMOr9nySygg2111sBr+F
	 xSb67ItgeIHPCQGvJZAMUSmY64c8s0FP0UXDsXDRICnbrtF4F+ujm4rWMByhjk+78P
	 K8qTtBvWkiEsK+ilmYPu/WRwFfaCS8ptiztDm0rcl64+X6GxLXPJVd8txPVbmLlGaC
	 70CipjXOp8uNAaTD6KDJyjoZ6oUyUm+MtQBP+O5nOHmuepcPnxNDzg/4PIPnJyvLGd
	 GxXoe9SUu0YpA==
Date: Sat, 16 May 2026 13:46:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi R2S
Message-ID: <20260516134602-GKA3679294@kernel.org>
References: <20260511070718-GKC3624147@kernel.org>
 <20260513060030.616473-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513060030.616473-1-amadeus@jmu.edu.cn>
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

On 14:00 Wed 13 May     , Chukun Pan wrote:
> Hi,
> 
> > please check my comment below, I think this patch has similar issue
> >
> > https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/
> 
> I don't think this is an issue. Otherwise, these commits need to be fixed:
> https://github.com/torvalds/linux/commit/1df07a40453fd652132051419140950d47941fe9
> https://github.com/torvalds/linux/commit/ae9d03f8aec76c1bff21083b67c211238d7c57b1
> 
I agree, these patch was introduced before we learned the convention from
DT maintainer, got no comment in that review phase, so it just slip in

so yes, we should fix it, and patches are welcome..

> Let's confirm the current DT preferred:
> 
> - regulator-fixed
> 
>   nodename: Preferred name is 'regulator-[0-9]v[0-9]'
> 
>   gpio/gpios: Preferred 'gpios'
>   https://github.com/torvalds/linux/commit/12df2c182ccb850988d2680a422211a812fb5cb2
> 
> There is no specification or preference stating that regulators without
> software or GPIO control should be removed.
Not exactly, if some device driver explicitly request regulator, then
fixed regulators without software or GPIO control are still needed

Please refer to this reply from Krzysztof, fixed, non-controllable regulator isn't
really necessary if no driver/device used, will only waste memory, slow down boot time..
https://lore.kernel.org/all/90eafe45-7863-4c1d-b1e5-55a4fe32c806@kernel.org/

In this patch, I think both vcc_5v0 and vcc4v0 can be removed

> 
> This has been discussed many times, and people are used to describing DT
> according to the schematic:
> https://lore.kernel.org/all/44ba02e34d7bf6a6657894802a87b690@manjaro.org/
> 
For Dragan Simic's reply, I see no ACK from DT maintainer

> Therefore, if you consider these regulators unacceptable, we should remove
> them from other dts in spacemit, or allow such changes.
> 
I would prefer to remove it, see comments above

> Thanks,
> Chukun

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
