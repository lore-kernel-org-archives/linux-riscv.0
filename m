Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2C8C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZs3YzfSYe8YhxYY9TX7b0ANhmW2ht6Mbxxh+duaHHg=; b=FQY99sY6CRzMEm
	zm5vEypjz0/vGYJJ2//P+XVhZpLSJiNKSIP8QPtVYX806inlTiFjrPnAJErXP6Cz9kkeX09G3uufz
	hlHmPhx/f+9W6AZSyQ21RhBvicJql8bjDCYsEnShYYlsjSzY5KjLe5FEbM7CuAaah+Fe0/TDfBSat
	HJdkEw8aWsjXkERqruZNDyRER0Eee7L0/oDLEhLXWTvXEb7M8h9k6q3POI2aSIF1KFA5KIfKQCy2P
	A0gbGSTdqC4khrvxe/lhNqpFuAZJ4OeUsbhBS61aWhwwyld92TStOUNuzvPsKiwqYMcv/uK8m0TyO
	0bluL6Rg6CHWOowoxrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAiv-00DPWf-5a; Sat, 08 Oct 2022 14:22:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAir-00DPVT-Vj
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 14:22:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 671B7B80AE5;
	Sat,  8 Oct 2022 14:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE2C433D6;
	Sat,  8 Oct 2022 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238955;
	bh=WpsbLV1k1LdGsZAYRrhpFF8H3l4G3h3csAgFDHOsZ6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/QWLg1pXgy+b9YTsneB36RDyrMzeAFl49eD/oGSSHc8QaWH3TU11YSn84PhzXi/2
	 Zh9NBLdkZujgSAt7uTjp9hKeAuIbZeQcJsXH/pULokJJPTKVs7tLAimsF+oKyRkhyl
	 NjSNgpIoo+0W9RP1vQXNjlukbnj9gvKQCzsn1ocj/NhtePKlcA1ZUix/F0aC7FxJgy
	 GRADGWjBWQaNnpx0mg3qUr3Zl+AIxeJWFvMGrvc1gd4uZXsAtbysWSqxVduzNYtTyT
	 cmZqKnYla+g66mLo9IemI+/0fqoSqVUDADijtyL+Qta9n8bPUsr8TsO/3NoxcVHVAC
	 obuyyz7n3eubw==
Date: Sat, 8 Oct 2022 15:22:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org, ajones@ventanamicro.com,
	ardb@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, samuel@sholland.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <Y0GHpJMQwEeLEq2Y@spud>
References: <20221006064028.548-1-jszhang@kernel.org>
 <20221006124144.abaz74g7nxrb5hxj@kamzik>
 <4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
 <Y0GBO77e2Lu/khkI@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0GBO77e2Lu/khkI@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_072238_209669_89DEDCDA 
X-CRM114-Status: GOOD (  10.40  )
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

On Sat, Oct 08, 2022 at 09:55:07PM +0800, Jisheng Zhang wrote:
> On Thu, Oct 06, 2022 at 12:44:32PM +0000, Conor.Dooley@microchip.com wrote:
> > Also could you please add the reported-by from samuel & a fixes tag?
> 
> I will add Reported-by tag, but I'm not sure whether fixes tag
> is suitable, and which commit I could use? commit 8eb060e1018
> ("arch/riscv: add Zihintpause support")?

That is the commit that Samuel blamed for the issue & is the one that
added the static branch - so I guess so!

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
