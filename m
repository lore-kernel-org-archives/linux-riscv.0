Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E73C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 06:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2KV2rYlOHGFHv4SLlh7Qx5GQFsmSIyoc9tPm0fdlgQ=; b=E8nsIgSqiDSksv
	/nVodAuXZOvT8HYlQq/e/IazYqBBfDWLUuG4Ehj6NNbYTEHALRYVZtOERcV/bMr3cO2HMiRK8+YZS
	a7Dl8Rn/TZzySs8OFpYTipwRVBfFtx2NWRRzy+gNovkH7PXLQfR8kigGheiwPBpV2ZhV1VIL+zlUy
	2JZoT4cwerxsDWC8g+1kjl0avyX9N+00rsA4pWHXy8t0up6Wy7kGhUcBIJZUvfk9s+RoB3utK5ZJv
	7UhN5GHTPxbyW7x5w6SiJH/Ap4kz5JT2pkkemaeNu7UkPGBYNlxTcMoXYh6GML7Cj8ROMvqDrv+pB
	huPwYOk4y5fkCEmqnGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZoQg-000u8N-NK; Thu, 31 Mar 2022 06:37:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZoQd-000u6v-Bx
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 06:37:10 +0000
Received: by mail-lf1-x12d.google.com with SMTP id h7so39711236lfl.2
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+AnTQEfUPZso3bsfDtx1jHrDQyOsSxuvg5kE43dRswM=;
 b=Dgyco3ciHGnnMb3HExWdSMpKfMnqnuidkqvevTjoXK+luZ1uYhBqJhE5s7r0ydQ7zM
 asv08bIz4XXhiFuIeEqLsmyI3PRmRjENFaXS1ydU6BhCCJswb2RvYBWhBnpw/SgG2dAa
 IGr6mBxiNrGbYBtG41yFUpn/GlQ0CSG2VFBNzxCE1WmO8lf5OXl4SXTNgVP6Qwd8DBzd
 ltSGG5g0BMwZQNmYrw2ktUAatAwdn35KNXL7WYppV2z5SZLu2xO/rn5CzcL6bT3NFSL3
 xgQ9K4N9Q5Dk7QOuQmP2JfYPC28p1AgVeDBGtYghgOhEfwp7baVM+o0Qg7n3t6MX22xI
 zjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AnTQEfUPZso3bsfDtx1jHrDQyOsSxuvg5kE43dRswM=;
 b=t8vJwjime5LxjyOqZX/TgUe3Ejal3x1shnbkSRMErX09F5rl81YylqWEzFCe1u+eW2
 yLzfn9C7BwbaH4oXG9bpzPwCqG1yGn0INo9NSnVwV8exH0CrUgpSHVixegqiKMhYfdHa
 tDCMvdoHiG+9E9G+DWUTdv88qLI4quSF2C4kNfVCkWY2MyeY79Py29zYA1fCbTjLXFkz
 zjHJziWWeCu5s3bZN1JB9w4CrVQg5tF3QrnhQFaWRfQC+9etEn1hdPjxrHJjOf0ztFC0
 ImSoX7KeEvnx4aBLlQJSY8GbKpp+TA8PDjXK6T6yo77juCfxm9FpYYcJ9NtZOXv2eGXi
 bLjw==
X-Gm-Message-State: AOAM5309tNjfWxW4b/iaLzVUSiE14zZSxjVkkS7U0TmHS5fb60cG+ita
 z3hpP+1P4Kt4if6xC4SeffelVnAUp3EVhWIcj9hy+g==
X-Google-Smtp-Source: ABdhPJxRPUYU3UNn8baHe79ewvSRzeq8bVgURfPJEYp9tpm+c3wy3szPut7BNfDD0nw5wbXcJS/NCSaVCQ0vzFXs7X4=
X-Received: by 2002:a05:6512:e89:b0:44a:86e0:2294 with SMTP id
 bi9-20020a0565120e8900b0044a86e02294mr9948388lfb.130.1648708624442; Wed, 30
 Mar 2022 23:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 31 Mar 2022 12:06:51 +0530
Message-ID: <CAK9=C2XYp5a2diGNLf8=a05uPP-gAmUodtMbDWrByiW9skjjmA@mail.gmail.com>
Subject: Re: question about arch/riscv/kvm/mmu.c
To: Julia Lawall <julia.lawall@inria.fr>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_233707_421323_AF664DD4 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, Mar 17, 2022 at 2:40 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> Hello,
>
> The function kvm_riscv_stage2_map contains the code:
>
> mmu_seq = kvm->mmu_notifier_seq;
>
> I noticed that in every other place in the kernel where the
> mmu_notifier_seq field is read, there is a read barrier after it.  Is
> there some reason why it is not necessary here?

When I did the initial porting of KVM RISC-V (2 years back), I did
not see such a barrier being used along with mmu_notifier_seq
field hence the current code.

I am certainly okay adding it to be consistent with other architectures.

Can you send a patch for this ?

Thanks,
Anup

>
> thanks,
> julia
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
