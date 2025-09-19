Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC4CAC597
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 01:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2M9VaBEFjd+HHCkdZ9+LXIwVYgS0i6RbcRBO7J18xA=; b=p7pPNoVm/ELfv8
	6ps6WBp8lsaAYGo5RVcDLVIdJIQANFc3FSr5UDLb7JQVRm5cduXeTe/pynrYO3bUULupAo2fAKzQz
	9sPJXTeGcPJA5CCLOQj2gYcQyQa5g4TcA7KgvCvANbtveXIn7AktYggVNf44nZPxV0/UenTWj682T
	b5E/x5OF6u9Xz84tK5fyFsmZKeq4rrs/sUHG5z1PdfbkBPB9kVHkaZC+6nC5A367sLLqTo8mlzCta
	yntySHPxlWjmO994vVfGly2HS+ar91KG0YN5p4Yc+aMTkwi195gr6rA0pWJ4e81eRj5pJnR/7JRB0
	DNeCTgtfF7zWEzQ9HmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPyq-00000001bhk-1h3u;
	Fri, 19 Sep 2025 01:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPyo-00000001bh8-0h4M
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 01:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 622DC40700;
	Fri, 19 Sep 2025 01:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B209CC4CEE7;
	Fri, 19 Sep 2025 01:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758245525;
	bh=r9r5P1pDsAO1RtvUMBMRM6SqndCJSqetTZtA19T5plM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UgkzJrXt0vEvXlXfpPu9BwAmHvoO+JHBXnHA/kL+C872Pwo51sJeXR2ZZ0mz51Rg3
	 E66IVqLjVbbPY8YtsaQ3LOlp7BDgAod8bdw1fZc84CwEPaNVr967FjWnff8xhN5Q+j
	 cwz92/DjI23I5MCDjhbQRR1D/M90vXBFdRAC73QlQ5YO4PFtmi4YQP0FjmDZtybn9l
	 FCuKG74DmkCLd0thooYGSCHuOvIKymaJx0o+tY1Y6l9O/VJe0JC6EWc++Y8Xp95iuq
	 +KQSrgzf3AFjJVOQyRHLoEeKYAWB9M+v7oFovsn9yPzSuAUMbfJp6Upv0G3esx2dHg
	 5brq0zuQCl8dA==
Date: Thu, 18 Sep 2025 19:32:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
cc: shuah@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] selftests: riscv: Add README for RISC-V KSelfTest
In-Reply-To: <20250815180724.14459-1-reddybalavignesh9979@gmail.com>
Message-ID: <0a05a409-b161-88ee-a731-4a773b21dcb9@kernel.org>
References: <20250815180724.14459-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_183206_222375_9BC9AD21 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

On Fri, 15 Aug 2025, Bala-Vignesh-Reddy wrote:

> Add a README file for RISC-V specific kernel selftests under
> tools/testing/selftests/riscv/. This mirrors the existing README
> for arm64, providing clear guidance on how the tests are architecture
> specific and skipped on non-riscv systems. It also includes
> standard make commands for building, running and installing the
> tests, along with a reference to general kselftest documentation.
> 
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>

Thanks, queuing this one through the RISC-V tree for v6.18.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
