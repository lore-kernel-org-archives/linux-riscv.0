Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92D8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1t+MIWKbKuyMHCAdV1scjow0EFMsug2/KDPE19m2fA=; b=YxcYDD+niCP+34
	tQm7Oxz2gzUt8fwuNAZ5Rmw1BmEiod/+X0AtMs84E1p52EVFVBD1FfbUoUO30eCB32mg8v6aKPj2i
	PubJHHbER06ooo5fnOhSaanho2PAtD5SkgCWg2SJXTy2mgXQG1Y8MYFQ0J8q+Hug60MWbFx6WQQDh
	znD7YBvPAq4A9oNJqjTyculSdfuG3UHx2EGh4Q4q2+WjoD3uygDuSudRTeGzR3ctF05pBzQikFLt2
	NPlH+5HZWiqoZSsxa9JuKMbwylknxXmIeNK4GUlrTz6OV7HO88PXIeg4DCJ1PtOMEabUFrdzsbNmO
	YxJi4hce/dx+5N7rugWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFu6-00APkw-GV; Thu, 24 Nov 2022 17:20:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFu2-00APgq-4x
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:20:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9030B828AB;
	Thu, 24 Nov 2022 17:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC8C433D6;
	Thu, 24 Nov 2022 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669310442;
	bh=JB9qZrrqFpGk0H4HPOvs80vQdLVw7i9EscGuUefH0pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Te3QID+ipAkEEoYZvSJdkNSnHQLGbt/iXdSeIexqtPiAqge3n6lTbM2ez8F36oWo9
	 DAUB8gGiDWzKTPCw0LKE+8IdQtJyYPR6F4WuWze3SACJkk0tzk86X5ZsDiauQpwqD4
	 kbVAnWlfJUU1+YXSkluKcG2D/8z+wjQFa/jh0RRk28slpFQxcvIGPkl9Hu8pTVbnmy
	 lUUyeN4W5MdWVUjGFCqsbj7nRB3JgOQNheBDhTtitp0a/jGv4gVkpLwtlfFc4Nkgci
	 siyIVR5zSFU//GHaxH4ABmzrZZAQ24Z4jhfbypnJ6L23LyTmmLVlYaT6okfkTh2/AW
	 R7wakXTCE3pWw==
Message-ID: <c9ae9644-5cd0-29c2-a25c-bb497dfcb1c8@kernel.org>
Date: Thu, 24 Nov 2022 17:20:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org,
 Jiatai He <jiatai2021@iscas.ac.cn>, Heiko Stuebner <heiko@sntech.de>
References: <YqYz+xDsXr/tNaNu@Sun> <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer> <Y39AXYPFzSiBngwI@wendy>
 <Y39Lwp4rQc3Qkl0i@vermeer> <Y39blUaC/jHiOYCk@wendy>
 <Y3+mBAV8oxphjHcJ@vermeer>
Content-Language: en-US
From: Conor Dooley <conor@kernel.org>
In-Reply-To: <Y3+mBAV8oxphjHcJ@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092046_532640_807D16A6 
X-CRM114-Status: GOOD (  22.17  )
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

On 24/11/2022 17:12, Samuel Ortiz wrote:
> [You don't often get email from sameo@rivosinc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Nov 24, 2022 at 11:55:01AM +0000, Conor Dooley wrote:
>> On Thu, Nov 24, 2022 at 11:47:30AM +0100, Samuel Ortiz wrote:
>>
>>> Patch #1 is definitely needed regardless of which interface we pick for
>>> exposing the ISA strings to userspace.
>>
>> I took another look at #1, and I feel more confused about what
>> constitutes canonical order than I did before! If you know better than
>> I, and you probably do since you're interested in these 6 month old
>> patches, some insight would be appreciated!
> 
> Assuming we don't go with hwcap, I dont think the order of the
> riscv_isa_ext_id enum matters that much?

The chief put it in canonical order so that's good enough for me!

> 
> iiuc we're building the cpuinfo string from the riscv_isa_ext_data
> array, and I think the current code is incorrect:
> 
> static struct riscv_isa_ext_data isa_ext_arr[] = {
>     __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>     __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>     __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>     __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>     __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>     __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>     __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> };
> 
> zicbom and zihintpause should come before supervisor level extensions.
> I'm going to send a patch for that.

idk, Palmer explicitly re-ordered this:
https://lore.kernel.org/linux-riscv/20220920204518.10988-1-palmer@rivosinc.com/

By my reading of the isa manual, what Palmer did is correct as
those are not "Additional Standard Extensions". /shrug

> 
> And the Zb/Zk ones should come after the Zi ones, and before the
> supervisor level ones (The I category comes before the B or the K one).

This I agree with though.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
