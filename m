Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFFEC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hra9VHsWTijXUXzrcXnvSPL/4ez2AhdCoJht3an3KZ8=; b=1OiD3Bpvj8E5PH
	7RQwjVO2hwu34ypzmIkqrqV5U/MC/pYi4pJi3vlwwjiXGAHtR6d+PML/tTJIqra2bN7d5fsMLvibg
	1Tc9ADMMWzdfDs296/8qPf3jorfe4pvS9E250aXLddlZWmEQNZtS4PK+JBB+FXLYjZX07GeWsLTYf
	RTtg8Mj8+fMlIP+hKu5y79S6NYNx2zK4HtFYOWZOGyUVL+RcOsfJIkrDCypvm/6bdWQ3Nrvc++yqp
	65KVjaCcT+G6E/wPXOkUSaeth/tkuhtVzyQjyjCrhKK8GU60zceWKUgV+Gk4ZqvbL2Yrn3eBhTLlu
	oe+8bX7kcCJcgkyQsGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuH5X-00000003uZa-1AbH;
	Mon, 17 Mar 2025 20:29:31 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuH5U-00000003uYb-3Cfq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 20:29:30 +0000
Message-ID: <8729ccb4-cdd2-48f7-a8d4-f55a24964bc4@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742243365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2gPp8ZZpEDOPhCSsNGFmD3VmlQ7JFSNt9SswdFFzlU=;
	b=w2FTOwgjsx7saoQwKyeyBl1fhl0fcyDSJgA2K/1oGFLpnKWZ5PG9HBkeFzaw/4Nlj2e0Hm
	xhsQRP06Q7vUiB36Y7CRl82oxq+MPGTZuDeFqjBCCH06LBE7qGgW8vSAI/FGdYm7V5Xj+A
	ww3ri5CC3UIlnHpe+jadeoV5FyUBtMoF860oFlg1/+QZTzbsjZBsu8XThWagzgP9qvCpyW
	kRzS27lH075qI+yf+CU5VuCp5Ziu+Tw1iWEmaAkL6YPQFxwJUIBhW4VchiL2IW4OjfKrc1
	lMtS9M3FIYRSltcyxWxu/It/unHJw44S8H3ZJN64e6jWXb7Ok89MIwJDdSGLXA==
Date: Mon, 17 Mar 2025 21:29:20 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC] riscv: introduce asm/swab.h
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com>
 <d964bf15-7172-448b-9aa1-72d5bf3e1695@ghiti.fr>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <d964bf15-7172-448b-9aa1-72d5bf3e1695@ghiti.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_132929_143359_7CC01888 
X-CRM114-Status: GOOD (  10.72  )
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

On 17/3/25 17:36, Alexandre Ghiti wrote:
>> We need a default implementation to fall back on, but there isn't any in
>> `asm-generic/swab.h`. Should I introduce a first patch moving
>> ___constant_swab<XX> into include/uapi/asm-generic/swab.h?
> 
> Yes, that or something else to avoid the code duplication.

Thanks for double checking. I figured as much but I ended up getting a
bit confused with the include directories.

>> +#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
> 
> NO_ALTERNATIVE does not exist to my knowledge, and you don't need to check for ALTERNATIVE as alternative-macros.h will do the right thing in that case.

It's a define hardcoded into drivers/firmware/efi/libstub/Makefile. It
was introduced in [1]. It helps avoid these types of warnings [2]:

  riscv64-unknown-linux-gnu-ld: warning: orphan section 
  `.init.alternative' from `./drivers/firmware/efi/libstub/riscv.stub.o' 
  being placed in section `.init.alternative'

Let me know if you think I should drop it.

[1] https://lore.kernel.org/all/20231031064553.2319688-3-xiao.w.wang@intel.com/
[2] https://lore.kernel.org/all/DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com/

> It would be nice to have some perf numbers too, maybe Bjorn will chime in :)
> 
> Thanks for your patch, looking forward the v2,

Thank you! 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
