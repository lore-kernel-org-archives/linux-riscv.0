Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C0DD3CCA3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 02:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5rZ08ofmi78LylKVF3bnLVjmmpOYUE2b+MUINfew2U=; b=uO4vAqXoLAoCgZ
	pM+QnIPMDkGvPcS05XXvmPcSXO2k8k8IyNxFrJ5+S5vp7z1d8NHO7I1kqxwuesVchwcC3FmXzcMcl
	CpvOSAOSiySTVbDMSVB/5qNkoayBHToYCNfnX+z1bbqcEhpJDKwCs0OII6ItVRTCovIkhBTGbT43e
	SERtcyvpdGN8+tbri2KDh9JqoQk1HLNOB+5iypvnGt7Nq+K3CsMzGM1Xyv1t84faGQ/EqzgOHkA0t
	sAxneD4oDRwvcJbp+PqhEjQtWzR2fcnP9fw+CoWbLwodEIBa2PRYC0nPoE9Kzk8+PlY97gY7WbuEg
	n6DK33Ut4ZYmcPY1ER5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDPk-0000000BaTD-38z6;
	Thu, 15 Jan 2026 02:48:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDPj-0000000BaSk-0Z6t
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 02:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F31143A15;
	Thu, 15 Jan 2026 02:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F46C4CEF7;
	Thu, 15 Jan 2026 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768445326;
	bh=BRM3KvYZAbsDWRlfgMnhQm5JQVq93gUjEvkpRH7cBOU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=auhGW2wKKdNn7Ufr/VnIl7KN0pbd0p037VothtdDeoQnGXsewMZ7girGgGU0wkrcM
	 Xsm7VnpFXY+7TkwmnuNv4MBN9WWFE/2d6+cr+3vXJWGN1BJulObFWKlrxcoIYd8hid
	 nttpF02vjJXZGJ1r2S9pPlfjfQboeLHhdMQtfiUMVxwH67BKVAHJx4o1nUYE5ro9yP
	 Q30y3GZ02QFXRseI3IhQVDMZc7Lu4l1y4Y/NhM8ckjEbRu1vvXS3T1kEhMZlbOew8l
	 soyVOjOAYfUYAqCY0i5NmlghDITqVh9KPN5HEXObbTJ55dIqDy72E8rqg3QcAn5hgW
	 +rSvt7zBPSHiQ==
Date: Wed, 14 Jan 2026 19:48:44 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
    Atish Patra <atish.patra@linux.dev>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, 
    Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
    Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH RFC 01/10] riscv: Standardize extension capitilization
In-Reply-To: <20251210-profiles-v1-1-315a6ff2ca5a@gmail.com>
Message-ID: <338a10b7-c617-93ff-ba0b-e9a1ddd8fab2@kernel.org>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com> <20251210-profiles-v1-1-315a6ff2ca5a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_184847_220405_5897DFFD 
X-CRM114-Status: UNSURE (   7.25  )
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

On Wed, 10 Dec 2025, Charlie Jenkins wrote:

> The base extensions are often lowercase and were written as lowercase in
> hwcap, but other references to these extensions in the kernel are
> uppercase. Standardize the case to make it easier to handle macro
> expansion.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

I like it.  This helps align arch/riscv to CodingStyle.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
