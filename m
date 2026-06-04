Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E49ECD6E6E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6XCnLrle/1vnvWrMXT54yqFG4bLdvE9Jirx+EWNrLM=; b=GQFtzSOLg1uaUz
	R1CkTAvu18nEiFTLQMp2r15q28DTm2d5Ojnd83n/EqcAT7kLyCvq8gerRBTod3GH+0q3yhp+gIipX
	0S4t1+LkPVcl2uDbPYnR/HSgJ9CaCxsah+gR+JKrYjLMxCIgBTvJHNquPDDhDmVbgoOJSZZN4WTTf
	DKJ1qcw1zz5H7XTFxyqrcbZW2R2GI/EevSo1XbD6QdnL9uzAps/8KLvJS5YyqU4f1Qdi1+I7iTUMZ
	wjY3JFaEWOmvwhzc4xwQ/eh6b7CJxgF/rmzcO7Kqo2RFrGPKHeSjhaTyTUJsmxBvysGhln6pVNNvJ
	hDrPKsK0gPD/8NOhCXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGjr-0000000HPdu-1aFm;
	Thu, 04 Jun 2026 22:40:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGjq-0000000HPdn-0xGA
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 22:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E556445BD;
	Thu,  4 Jun 2026 22:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA00C1F00893;
	Thu,  4 Jun 2026 22:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780612833;
	bh=pcf+/TQHSC1lT4PMAPLFzMjabSqrHnTT7tT2IMtCJBI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JjQkOmxZJM/3c7vpeiNFCYBI3RPfO6e2JyqEIQmTb9vf6Lj9nW3Mr6jVox9VLHe+N
	 wk4saK2/au2ta8MS77MYbw8fgxK0J+yYlqizalZODqNVhD0JxZ/1tQVFAQHrsl/88i
	 CdxkclQQVTniXlQhFor/J2Eb2pFmVF8Oc27oANcjer7nbet69bNRIIaDZSh19TglAr
	 VDmjQUw6AkAMDPC5W17fp6kFvThRzNEZgb4ayUgUHBY4VIg7QFUIDGrtmFEwRShkj0
	 6hEwugdka3lCEveyulV6YpWndGBtvItmEwutPNoLy8xYj4Iv2f99WO/y8HS0UDI5iV
	 zgyQTnBRTUKcg==
Date: Thu, 4 Jun 2026 16:40:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Richard Patel <ripatel@wii.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
In-Reply-To: <20260518183918.322545-1-ripatel@wii.dev>
Message-ID: <3f2d4628-a95d-89c3-2fd7-3e1a407d698a@kernel.org>
References: <20260518183918.322545-1-ripatel@wii.dev>
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

Hi,

On Mon, 18 May 2026, Richard Patel wrote:

> prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
> unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
> be permitted.
<
> This is a uABI breaking change (fails previously accepted bits
> with EINVAL).

Thanks for the patch.  However, I'm not convinced that this actually 
breaks anything.  The behavior of the interface changes when unknown flags 
are specified, but I'm not aware of anything that relies on this specific 
behavior.

Does that match your understanding?


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
