Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FDFC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bAMaGRfNHU0n1eeZLjN3Y0r0NPSITbBfA7thjGXsew=; b=sW/HihrDBDae6a
	Qq2tI7bH1x+egpieyI+eoRKNr2fKNzLaJMCx0S9JCAsG4ytiZ2anYP0NNxyAzMBIspobvdvnjR/dT
	rqduchrbiXz3gI4I3k7q/fju/hrT1T/3t7fx0V96FW7fRplnPrB0EV3n7WBuHD2WPqYPFm5nPB4jN
	Uq1rYgsoiHkjG1NueqNUYsgVCpTTrcLAQYxNasdEGxTRrzGLuRQwU0fTfdxo5s1C0z6a6s5PAk0If
	3HJ87xqWapLXANQldb2IUoftJU8AgfQsxr+xKBWxyoIzEY1QYGCAPRxRuXphAx6SCwxlXXFNjdkyw
	XHVwRF1lbqV3sCe2tjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uRL-00CsBz-1k;
	Tue, 30 May 2023 08:10:47 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uRI-00Cs9w-2E
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 08:10:46 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4DDB75C0193;
	Tue, 30 May 2023 04:10:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 30 May 2023 04:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1685434237; x=1685520637; bh=uf
	gkqQI0rYCB4h44qKb7lixkTsQc+fvfFQk8IuGt6LA=; b=rcHTFo83aXUuRRTFc9
	KrOTd8KZv4rPYE7B/RhVmRvKug8CMK7Pfl4sVE0tjR9UZgfA9hfce2hfHS1jP4q3
	+TIgzSROcDOGEFMeJD3NrjW4aPpcMKs1wJpxClo6LlibFSuITND3EZqB62iPbZzy
	0t1xY3IEPVi3rQrpLki76l+uzSYfFMl/Z/toQa8X+vuckP58AUODZZ1RoC12aaJ/
	UVsvZsrBRIEnpJoTIy2SLplyoXLy+ZwJWAsLA+5XdEquy2N/eMZxKcFmgXhUYtU0
	sXWJuRCMLoaCJT8ep4LHteivocNfvuLe/EaeHI5ePK+VQeOmltDVWYVw8SeWEu74
	MBbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685434237; x=1685520637; bh=ufgkqQI0rYCB4
	h44qKb7lixkTsQc+fvfFQk8IuGt6LA=; b=hH2183mjAtoZDHb8H+VmAJEMeLSof
	PjvwgCsGgYSOopRKlzEOTSiXrtb+P8a+02t1cY6VfRc+gfEkPtuXyZnJyyBin7z4
	Z4ymmWE31Ko//dC2g679fBeDZ4aXTeJ9DuuDmvXIe/XF1PPNJGIJJ1gdMetyni9q
	b7pbyVG2xtKr90Qy/9WBSrgZi8spOx63VGpgJcbJn7MqNHPB4UQ7xrg2NicEhGhJ
	uOGqSqA7BvugwjYTC2+kJkB9WiO3hVok/L4L7AG0Cyp8g+QfGP+1l7uYiOn1N4hS
	0Jt9qOC4k+bme2YUUGG9pXkfAjwjPlB4qPmz5gG9MgVQtsdjlcqvhCIaA==
X-ME-Sender: <xms:fK91ZELoz7pUblCI_cnYejkvcwyJuVM2e2XSNP90tolX5F6DaNtPiQ>
    <xme:fK91ZEJM__V7Xs6zuiJ_x3hEXw4IQTkls_b5cJFSnm-9bHckf8pkz7raPbdJpWYMG
    7Z3t1UO9JLE4YH-90A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:fK91ZEscb5yO3T5OVK15KU6OzVCwdPBgcyepqn-SWacoNEJDqQx8KQ>
    <xmx:fK91ZBbawdLoTh9OPwtW0vh77edvEwxy29566UgfBkEfwF-CaxBfdw>
    <xmx:fK91ZLZjBUOCvTPASwQnHG3aLL9Tu-GEt45v5FBqQmlM1rFYF0sJkw>
    <xmx:fa91ZHHEp5jsDuAMK00ingcS5yaKs768aqWfWqtp3wi9MsMc8y5_FQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 53C43B60086; Tue, 30 May 2023 04:10:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com>
In-Reply-To: <2f5c3338898da65210ad3f62d7b7773a96f6d251.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
 <2f5c3338898da65210ad3f62d7b7773a96f6d251.1685387484.git.falcon@tinylab.org>
Date: Tue, 30 May 2023 10:10:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH v2 07/13] tools/nolibc: sys_lseek: add pure 64bit lseek
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011044_820518_13984BC9 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, May 29, 2023, at 21:54, Zhangjin Wu wrote:
> use sys_llseek instead of sys_lseek to add 64bit seek even in 32bit
> platforms.
>
> This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc and
> src/unistd/lseek.c of musl.
>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/sys.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index 98cfa2f6d021..d0720af84b6d 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -672,7 +672,17 @@ int link(const char *old, const char *new)
>  static __attribute__((unused))
>  off_t sys_lseek(int fd, off_t offset, int whence)
>  {
> +#if defined(__NR_llseek) || defined(__NR__llseek)
> +#ifndef __NR__llseek
> +#define __NR__llseek __NR_llseek
> +#endif
> +	off_t result;
> +	return my_syscall5(__NR__llseek, fd, offset >> 32, offset, &result, 
> whence) ?: result;
> +#elif defined(__NR_lseek)
>  	return my_syscall3(__NR_lseek, fd, offset, whence);
> +#else
> +#error None of __NR_lseek, __NR_llseek nor __NR__llseek defined, 
> cannot implement sys_lseek()
> +#endif
>  }

This is not technically wrong, but I think a different approach
would be clearer: Instead of having a sys_lseek() that works
differently depending on the macros, why not define the low-level
helpers to match the kernel arguments like

static inline __attribute__((unused))
__kernel_loff_t sys_lseek(int fd, __kernel_loff_t offset, int whence)
{
#ifdef __NR__llseek
	__kernel_loff_t result;
	return my_syscall5(__NR__llseek, fd, offset >> 32, offset, &result,  whence) ?: result;
#else
        
#endif
}

static inline __attribute__((unused))
__kernel_off_t sys_lseek(int fd, __kernel_off_t offset, int whence)
{
#ifdef __NR_lseek
	return my_syscall3(__NR_lseek, fd, offset, whence);
#else
        return -ENOSYS;
#endif
}

And then do the selection inside of the actual lseek,
something like

static __attribute__((unused))
off_t lseek(int fd, off_t offset, int whence)
{
        off_t ret = -ENOSYS;

        if (BITS_PER_LONG == 32)
               ret = sys_llseek(fd, offset, whence);

        if (ret == -ENOSYS)
               ret = sys_lseek(fd, offset, whence);

        if (ret < 0) {
                SET_ERRNO(-ret);
                ret = -1;
        }
        return ret;
       
}

For the loff_t selection, there is no real need to handle the
fallback, so this could just be an if()/else to select 32-bit
or 64-bit, but for the time_t ones the fallback is required
for pre-5.6 kernels.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
