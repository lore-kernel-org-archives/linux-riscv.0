Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E08C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8DOUldmj63tdrS97GKFqIzfQgc0iO32/071htd28F4=; b=ysCf4x8Vmol3jEqgtmJTnAyl9N
	d+EPzc512csqx6UWQIeT2zMt/MlD9Hd5u8Ms5oYhe4snf9oeurxCRRe4daBQ4Zb2ZsAe+90cisRkg
	VgJ04dwSCR6HOA4YuhACPWG2+zO53NLVow2DWDFMBWDcIhS3SLh54BTtrM0cg/sIKf3mawjGe3H8I
	rugLOq7Gd1K9CKruqBEopjJMU3u8XLkFDerugS7SOhtvihlXREJDiI6Z6nHGQ6BMTa9y0PkYSiynb
	mLgVkRVCea+Jobg14XQ6uHaXrtMogSUaUeCtldLQXyzL5lhM2zNJezHJJVTttOAuWLwnIDbOlEfvq
	KtNR2DVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRE7-00GySg-0i;
	Mon, 17 Apr 2023 15:57:11 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRE4-00GyPQ-0P;
	Mon, 17 Apr 2023 15:57:09 +0000
Received: from [167.98.27.226] (helo=[10.35.4.205])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1poRDv-00HZlp-17; Mon, 17 Apr 2023 16:56:59 +0100
Message-ID: <eae19ece-0d56-a91c-3417-f00b9b71f04d@codethink.co.uk>
Date: Mon, 17 Apr 2023 16:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
Content-Language: en-GB
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
References: <20230414155843.12963-1-andy.chiu@sifive.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_085708_162314_77CCBC2D 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 14/04/2023 16:58, Andy Chiu wrote:
> This patchset is implemented based on vector 1.0 spec to add vector support
> in riscv Linux kernel. There are some assumptions for this implementations.
> 
> 1. We assume all harts has the same ISA in the system.
> 2. We disable vector in both kernel and user space [1] by default. Only
>     enable an user's vector after an illegal instruction trap where it
>     actually starts executing vector (the first-use trap [2]).
> 3. We detect "riscv,isa" to determine whether vector is support or not.
> 
> We defined a new structure __riscv_v_ext_state in struct thread_struct to
> save/restore the vector related registers. It is used for both kernel space
> and user space.
>   - In kernel space, the datap pointer in __riscv_v_ext_state will be
>     allocated to save vector registers.
>   - In user space,
> 	- In signal handler of user space, the structure is placed
> 	  right after __riscv_ctx_hdr, which is embedded in fp reserved
> 	  aera. This is required to avoid ABI break [2]. And datap points
> 	  to the end of __riscv_v_ext_state.
> 	- In ptrace, the data will be put in ubuf in which we use
> 	  riscv_vr_get()/riscv_vr_set() to get or set the
> 	  __riscv_v_ext_state data structure from/to it, datap pointer
> 	  would be zeroed and vector registers will be copied to the
> 	  address right after the __riscv_v_ext_state structure in ubuf.
> 
> This patchset is rebased to v6.3-rc1 and it is tested by running several
> vector programs simultaneously. It delivers signals correctly in a test
> where we can see a valid ucontext_t in a signal handler, and a correct V
> context returing back from it. And the ptrace interface is tested by
> PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
> a guest using the same kernel image. All tests are done on an rv64gcv
> virt QEMU.

Ok, are there plans for in-kernel vector patches, or have I missed
something in this list? I expect once things like the vector-crypto
hit then people will be wanting in-kernel accelerators.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
