Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1773C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0N6TLbwbp0iKMHiNRKion7XSAOBrY4URRwu65oDYzd4=; b=J0aYcCmOCjI8dh
	NLgBoQF+qe/T9GKnVLYaAqa1hcyGdFnY+aPjFDGDDf3mDW3IGegfhTM/GtWWMH6tXB0yqWZrZA1KV
	7PB4/K7hfR+eRE8uK4T7dGAOL1xZorey+rXh0b/hTeeIK+2VcXTGlSp83NfCFHYAm2BtlQR3UXkHj
	Wnz40FK9T/yZWpHhbzaBADfTnnwW8UbxGfkSnwTspNnF/mtmb30OPq14EytpF2cr0da7IwQgSvxWj
	b2/AlDL2iXAP9RbUhacPayYCedWB6c6u60QAT0688V4w8zEHjbNlVrAJZFya3RVOstf5OZZICGtsL
	mwSMJUa+/3+/o1XQiLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWYe-004l5K-TQ; Thu, 06 Oct 2022 19:29:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWYb-004l3y-FF
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:29:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D488FB8207A;
	Thu,  6 Oct 2022 19:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D52C433D6;
	Thu,  6 Oct 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665084558;
	bh=TJJc6JYyk8ImRpxu09gukGASpFH1ZMIAHRlakUlE1sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MikCB+5O4Y+I+CSiJ/cKrdGHFt+MPfRjJjWAleWcKUTzmk1VaO5hb5atVEKEo8/Fc
	 XUW+v1elfwr2ICsylaa+7hzDZ0FdUoK1OfR18IHBqLqJmWTTg27Mlt46wlq+4xQjAS
	 oIT368ABprqBT5cCW813LIw32NvppDO83hoQxiLRIBfhUwQiKqv1+ccG+z9oEZfxT/
	 3cO4KYTrV1Ofmys6GxpUp6alJmeThk1NTDjNb+z5QgLARjOhNZ0ZT8lYeSfBTR6f2j
	 Oo78s+28+0zy+O5RJOXQwlxmxU50gck+3HqfzwFyc43S3w/Bz71Y1/60xmb6SLOZg0
	 EBzl+gfFx4Gsw==
Date: Thu, 6 Oct 2022 20:29:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Eva Kotova <nyandarknessgirl@gmail.com>
Cc: coelacanthus@outlook.com, c141028@gmail.com, dramforever@live.com,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	xc-tan@outlook.com
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Message-ID: <Yz8siqARjLH07PFt@spud>
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
 <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_122921_675380_406F38BA 
X-CRM114-Status: GOOD (  17.27  )
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

Hey Eva,
Resending as I think I may have replied to a mail with an invalid
reply-to address?

On Thu, Oct 06, 2022 at 10:20:02PM +0300, Eva Kotova wrote:
> On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
>> As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
>> but not read is "Reserved for future use.". For now, they are not valid.
>> In the current code, -wx is marked as invalid, but -w- is not marked
>> as invalid.
>
> This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only
> protective page:
>
> #
> # There is insufficient memory for the Java Runtime Environment to continue.
> # Native memory allocation (mmap) failed to map 4096 bytes for failed to
> allocate memory for PaX check.
> # An error report file with more information is saved as:
> # /root/hs_err_pid107.log
>
> I bisected to this commit since on Linux 5.19+ java no longer works.
> Perhaps some fallback should be implemented, to prevent userspace breakage.
> It is currently documented, that at least on i386 PROT_WRITE mappings imply
> PROT_READ (See man mmap(2) NOTES), this would be a good place to start.

Do these patches solve your problem by any chance?
https://lore.kernel.org/linux-riscv/20220915193702.2201018-1-abrestic@rivosinc.com/

I don't know the "area" at all, so it's a shot in the dark, but these
both have Fixes: tags for the patch that you are blaming.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
