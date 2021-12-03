Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37D6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6XExN99JJ7FhLLfGJCLDgRC9wdNUB70TeccepU+BC9Q=; b=5FT0E6IDV5uT8joYlZ4V01qNR8
	3YD8Xxu1+rHIQIPu/3z0Ld4NtXYRcx/eFip1qhyw6YJcstyc254M8G4DAasncx+Ojf3CCbz3GZvuF
	SUHrVw992xznM5trhE2ZG96HaWU7kDCqquBoeLHugV997QeuCJrs8DckYwao33Djy+CP1i7Y1U1mZ
	KfLwvGEu9J9RoE3QiUyBu5GI7ZGAYVnwIXs86uHmNCrwi+O6zw+Qd/kII2Eeg0Y6EPlG6GuxFBVhp
	tTXqX0q6S3KFkeTJ8yPB9PlPP6cCv0eQPzj6MkwuG7sFgy6eHCPFvbqw5d5qfsQLkWmqbx1cczY8p
	pyElVafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtB8y-00GU0k-CK; Fri, 03 Dec 2021 16:10:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtB8u-00GTzK-UA; Fri, 03 Dec 2021 16:10:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02A81435;
 Fri,  3 Dec 2021 08:10:33 -0800 (PST)
Received: from [10.1.38.15] (e122027.cambridge.arm.com [10.1.38.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 783AC3F73B;
 Fri,  3 Dec 2021 08:10:32 -0800 (PST)
Subject: Re: [PATCH v3] MAINTAINERS: Update Atish's email address
To: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org
Cc: anup.patel@wdc.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20211202235823.1926970-1-atishp@atishpatra.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
Date: Fri, 3 Dec 2021 16:10:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202235823.1926970-1-atishp@atishpatra.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_081037_074693_C5884144 
X-CRM114-Status: GOOD (  16.37  )
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

On 02/12/2021 23:58, Atish Patra wrote:
> I am no longer employed by western digital. Update my email address to
> personal one and add entries to .mailmap as well.
> 
> Signed-off-by: Atish Patra <atishp@atishpatra.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6277bb27b4bf..23f6b0a60adf 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
>  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
>  Arnaud Patard <arnaud.patard@rtp-net.org>
>  Arnd Bergmann <arnd@arndb.de>
> +Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>

I don't think this does what you expect. You can't list more than one
email address to replace on the same line. You can use the command "git
check-mailmap" to test what happens, e.g. with this change applied:

  $ git check-mailmap "<atishp@rivosinc.com>"
  <atishp@rivosinc.com>
  $ git check-mailmap "<atish.patra@wdc.com>"
  Atish Patra <atishp@atishpatra.org>
  $ git check-mailmap "<atishp@atishpatra.org>"
  <atishp@atishpatra.org>

So only your @wdc.com address is translated. If you want to translate
the @rivosinc.com address as well you need a second line. As the file says:

# For format details, see "MAPPING AUTHORS" in "man git-shortlog".

Steve

>  Axel Dyks <xl@xlsigned.net>
>  Axel Lin <axel.lin@gmail.com>
>  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5250298d2817..6c2a34da0314 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10434,7 +10434,7 @@ F:	arch/powerpc/kvm/
>  
>  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
>  M:	Anup Patel <anup.patel@wdc.com>
> -R:	Atish Patra <atish.patra@wdc.com>
> +R:	Atish Patra <atishp@atishpatra.org>
>  L:	kvm@vger.kernel.org
>  L:	kvm-riscv@lists.infradead.org
>  L:	linux-riscv@lists.infradead.org
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
