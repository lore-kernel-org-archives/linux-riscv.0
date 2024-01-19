Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535DFC47DD3
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNrIOPB1tsxLXvZuY4Ek1xI0RGOp5YyiVDDK2sDN4bQ=; b=Q4wouQFENWoP4D
	yTVmVyIsRChwXOV1m4A6vzj0AgEhN2xrwrt4uplhVBLXeOi1n+J08WZLnaYsxxuYuY6NYULuEcMQH
	YiAgXciGtpUWnF7WUvyye9MZK9AmD1T8gPk+pw5A+gse4sTkqAnI/A9p4U/B/mFb9mSq1iPjcJkud
	1wdA5AzhAFu0eZy+3zQC3wCIBEvEkhyvBX3/2lWpW8WDh09lH1OpnMWP7cTQryjV1nuIH1QuTIrop
	YeDAoUB8xt78DpSXr1LOWvJv33bYo/dagPNPUeZ+0RrifJibfkcKweE7eIwTQN37xuIh5ouw4Ek2e
	MM1hCJgmYtWNtVioB5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsby-006Gji-0v;
	Fri, 19 Jan 2024 17:24:58 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrx1-0069mZ-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 16:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1705682539; bh=WBVXT1eMhsUBOF+VkQjn2e6bAsMa31G9ZE+9F6Mv41s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mDKTd2E2DS/YmHWX8pRY4d399KM7iv0HaSbiUE/EdxujFw0I42iYwgN9WRcYhHbvm
	 OTRkESZeVjujmzGL9ek6sRaVg9vOrdWOTo8YATtRAtSX8S2aD4Ks5XlGXraTbx3PPX
	 VVw3FgAn438e2yrVBH4pWG9EvAqxY1W99Sf+/caE=
Received: from [IPV6:240e:379:224a:8600:8135:3b7:6c6a:b836] ([240e:379:224a:8600:8135:3b7:6c6a:b836])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id A911FC98; Sat, 20 Jan 2024 00:42:17 +0800
X-QQ-mid: xmsmtpt1705682537tgsl6n8dc
Message-ID: <tencent_17342E52CC61C847A3071F8E609CB6A1E306@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmaYnJROs3H0TrudBMJlyIIvfi9OBTz/ZcMDsfL2q1VPX5agvH4Zn
	 bUkoMKeu+MpdXKBuec19bhIw41DmQnq0AeSka4+zNaKWBUDHVXWz9jun8b6cr28FjbBVSldB5r4W
	 1UbMEK36fpiKpBgrLOGQye2wjXfIEQgyz+GKjlb8v1Hmu59zLPYiGqnNoSklXleQJd/hsy5wmx1I
	 onsv7VZ3PiMQy6+TqD9ulPByTIkv+MX3lTxlehn4QdiWOttnD0E91iMkM3V/OEw89MYcasCnHg4h
	 vKiUxDHbiVT/QaGzZyBGUHeMX1DpbNcdbsFy0R0AMCYlStIYXmR8VDWZmlCCY2gFbY4J16Vc2krm
	 MC/dQBGC25UeOlc+JW1zCggYOo0UANkdlGZ/FfGmKa6UKT1WqsgTNNpfd6lIOPCu6JW/jdzPusJ9
	 9ZSPTti69gxqV7GNeo4GBZwqihalVHkC02v6AwA8xMQFl0QpbKFhYujf8sOCGuIJ0LJH2hCHf0Yh
	 7FOBbghZycYOl20nrK8sGvOmLTa6nE1mDVOqkmazBDgELNGfABszc2w7DYmzJV6TLMUP9g4C1VkI
	 Qtp66/g4bSO27LPNFLQFS7w99td7YPrqaA49k4w8SgWjJTtoiqSKToJdHqZcsOqgXRj0Fo7Dd/Mt
	 HLTuWAWljjx9RAAMH8AKNmFDqzaGhpxCE8+spYbrSHx98cvfnFamf17mJ/TCnRRuEVhvKnMgd6sp
	 30HuKFiQD17Sc4kePzllgdYEy4CkiTwXrlO1NZ0r+Uku7pe4HpDdnIEO3h2nIMsH5o4EgT9zinjw
	 0FBgM7VbTAp+p7mEOmfsl98m8z/Vs9PCv/6f2TKJHAfk/oU16IFH102Q6Tq2wMC3i1Dyiy3Qn2zf
	 xalVr8WSQZ4MWn696562F4akCLqkxLm9/nUOQ42YIQD1EfHCq9Asb2+dScaDufj7KXAcsDjd022i
	 3+ZGOupQ++Cbw64zNGZbrl/rHvmipm
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-OQ-MSGID: <adb7072e-55de-4f0f-a36e-494181ea2700@cyyself.name>
Date: Sat, 20 Jan 2024 00:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] RISC-V: mm: correct mmap behavior in sv48 address
 space
Content-Language: en-US
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org
References: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_084240_166700_825EB969 
X-CRM114-Status: GOOD (  20.40  )
X-Mailman-Approved-At: Fri, 19 Jan 2024 09:24:57 -0800
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

Friendly ping. There are already 5 days since this patch was submitted 
but there are no comments now. The previous buggy patch has already been 
in the mainline kernel since the v6.6 release and breaks some userspace 
software that relies on mmap to create mapping on the hint address 
without MAP_FIXED set. I think this fix should go to the kernel ASAP.

Thanks,
Yangyu Chen

On 1/15/24 03:55, Yangyu Chen wrote:
> Previous patch series [1] violates the principle of mmap syscall as it uses
> hint address as the largest address space to use rather than where to
> create the mapping, thus broke the possibility to mmap in sv48, sv57
> address space without a MAP_FIXED flag. This patchset corrects the behavior
> of mmap syscall and use the behavior of x86 5-stage-paging as a reference.
> 
> I first noticed this issue when I was trying to run box64 on a sv48 system
> with commit previous than [2]. Then I reported this through private
> communication, then a box64 contributor did some investigation and found
> that trying to mmap in sv48 address space without MAP_FIXED flag will
> always return a random address in sv39. I review the changelog with some
> tests on qemu and found this issue was introduced from [1]. After reviewing
> the code, tests and docs, I think the original author might misunderstand
> the meaning of hint address in mmap syscall. Then I did some investigation
> on other ISAs like x86 which has 5-stage-paging and found that it has
> addressed the same issue if some userspace software assumes the pointer
> size should smaller than 47 bits and also solved in kernel by limiting the
> mmap in maximum 47 bits address space by default.
> 
> Finally I correct the behavior of mmap syscall as x86 5-stage-paging does,
> and migreate the documentation from x86-64 kernel to riscv kernel.
> 
> 
> [1]. https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> [2]. https://github.com/ptitSeb/box64/commit/5b700cb6e6f397d2074c49659f7f9915f4a33c5f
> 
> Yangyu Chen (3):
>    RISC-V: mm: fix mmap behavior in sv48 address space
>    RISC-V: mm: only test mmap without hint
>    Documentation: riscv: correct sv57 kernel behavior
> 
>   Documentation/arch/riscv/vm-layout.rst        | 48 +++++++++++--------
>   arch/riscv/include/asm/processor.h            | 39 ++++-----------
>   .../selftests/riscv/mm/mmap_bottomup.c        | 12 -----
>   .../testing/selftests/riscv/mm/mmap_default.c | 12 -----
>   tools/testing/selftests/riscv/mm/mmap_test.h  | 30 ------------
>   5 files changed, 36 insertions(+), 105 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
