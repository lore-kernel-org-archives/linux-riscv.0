Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF06FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Tx4Eueksm3mAylkEZou2w4rhPF5GNkaJ2uSbUSJnyQ=; b=eJtN+bDl3xC3mu
	0mNzJBqNIx2Jem7Kmy05P1eLzai0jygUwJ9J+kIXJPTPoQvDo6r4brIYPNk3aU38z/089Lv+hO28o
	AWeBA+7rGiqanycLdN4NLdmI0oxV43G4+tAqMWC479pdz74URn3uqtyZY4kPW1UeK4hf7Q3Qe/JG/
	oy4GCVccnXuIkDziCZR0NRMCATZDDS46sOhU4Rl5T0a/cCGfhfNFdeEbejOi+VLdP0JgUaSkKNEaW
	IbNT0xOro8i/EQeWvWlIiNXN9utl0J5NHyKFSJdQlG1A2ehWlCvqveDKi4AOjXpFz6KWETPl2rnV6
	1laelgQ/rV9AqPaLSMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLuB-0000000HMLQ-1JCW;
	Tue, 05 May 2026 19:58:07 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLu8-0000000HMKs-3eIT;
	Tue, 05 May 2026 19:58:04 +0000
Message-ID: <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org>
Date: Tue, 5 May 2026 12:58:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
To: linux-kernel@vger.kernel.org
Cc: Deepak Gupta <debug@rivosinc.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260406232304.1892528-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260406232304.1892528-1-rdunlap@infradead.org>
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

ping?

On 4/6/26 4:23 PM, Randy Dunlap wrote:
> 'make htmldocs' complains about ``prctrl` -- so add a second '`' to
> avoid the warning.
> 
> Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]
> 
> Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Deepak Gupta <debug@rivosinc.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> 
>  Documentation/arch/riscv/zicfilp.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20260406.orig/Documentation/arch/riscv/zicfilp.rst
> +++ linux-next-20260406/Documentation/arch/riscv/zicfilp.rst
> @@ -78,7 +78,7 @@ the program.
>  
>  Per-task indirect branch tracking state can be monitored and
>  controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
> -``prctl()` arguments (respectively), by supplying
> +``prctl()`` arguments (respectively), by supplying
>  :c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
>  are architecture-agnostic, and will return -EINVAL if the underlying
>  functionality is not supported.
> 

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
