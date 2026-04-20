Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD7F557E9
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACG1LO+tOzJd9FSDWrELR66b/Zlqe8cNfwsKBg6gmR0=; b=2peDN8mm1dxft+
	/yB+q5hxa3YoxV6SPcWU5RL3ImxftmZ/IWHGnFlA1xqnJLNHQLAHBTBt9815v3W9shWtoxJGpti7w
	mH2UE3Bwr8BwR4TnT2s/d5NQxwLJcV4ArpZ2BrJW44Y8KoBXlqqjpD2b/nW9CMkFCFscfa7uXwALR
	j7v2B9igKQ1JEbjwdKFcAw33iawJV3GreE724h0IDV39BNctrsMq37TDb2thPBJPSx401BHuBIFrw
	xGIrUlRMAcFIRZkCZssx0vt5Y2/LKEx6MvPVIyMVCGJ0iGnHw/73c3Pg1M/j/EYZL+L+rfOWXnV2x
	k/mrppMj54Lf77sLNYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkdW-00000006ejF-0S88;
	Mon, 20 Apr 2026 09:09:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkdR-00000006eiP-3iEN
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 09:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0347F44402;
	Mon, 20 Apr 2026 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50287C19425;
	Mon, 20 Apr 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676178;
	bh=00dCGcB0/P2/wrNA/yA78fISH9yP7ajstHGqOl4WqWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiTdIBmOBopOQBmLW8e5mhGYOt/R74btFeB4E1bpiwPzYq3K9nBOZ/9PvNH33tV86
	 /4h2I1BfQjB/MqFe8ZcsReWS9QYbLcWsTSsP6CUKbUpxklQUqQFc/O/g4k0Ui3Mo42
	 rcLDWwWUQjnraDnezXojTdqSm14gRno3Iy1TVFWXQndQe5OCRfzR+48zmiuY56l6ST
	 ICxY75WKWO23g+6FE2bU8fzP7k8VhZSDFablmFSdXkWaKFMm3aPYbZB8SGKw+GSjRq
	 RmDascB4B4xBiCNxwE8USWaSukL3ix7B+QLzNbuHobkE4MUMtPSkYvoOTM36IKkrUk
	 GuBLhJtDR4RIg==
Date: Mon, 20 Apr 2026 09:09:36 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
Message-ID: <20260420090936-GKB203300@kernel.org>
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_020942_483274_27A25573 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Troy,

On 16:50 Mon 20 Apr     , Troy Mitchell wrote:
> On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
> > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
> >> On 20/04/2026 10:39, Sandie Cao wrote:
> >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
> >> 
> >> Missing space after main commit msg.
> >> 
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
> >>>
> >
> > Also, the file reported in above warning DOES NOT EXIST (I checked
> > next-20260414).
> In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
> 
> properties:
>   compatible:
>     enum:
>       - spacemit,k1-pinctrl
>       - spacemit,k3-pinctrl
> 
I think you refer to wrong file, which should be
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml

> So there's no reason to use k1-i2c. As far as I can tell, while they are the same IP,
> there are subtle differences between them.
> 
But yes, the idea is correct, so NAK to this patch
>                                   - Troy

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
