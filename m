Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F407BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Q3ekXPI70YIYtqxGwjASH/Q8Z4OFerJiFADOqysIzZ0=; b=PIkeoa6MfyiLixk0+nPzamnuwH
	ZNzScCfoX3vkW2zBDv1MSb/IGQl5ZrfjpJDyF+zezzykjwEnhCW8oRy0PxxsjfSpJM16u/TespCun
	EFUE1tmLbWYScF7IuUCb5CfF8N0GvGBygxcwQLH/jMg4ZZyz/3Z0L9BN3PQmX+vgJdXpdiL7Ul9W8
	nLTZhzO9tfQHh2p4dU8+5meX7bzYpxYijZWqK8JXMhYA5Xn5lB+AR0PYTXxp2KI7pG9W6DPJiQnbI
	qYZW0DJWXTTJWhnzdHc6/5FUWiUJWzc4150g81WO4z420zWbkEBFpIcKdQeZfZF2VvTSE4faoLNqg
	i7YA1rZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnk0-000lPR-St; Thu, 31 Mar 2022 05:53:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnjq-000lK9-Gs
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:52:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id w8so22464055pll.10
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IBamUaj9YrgQoUbRaPWrU7o5ZQ6M8T/P4ePIRI4QM34=;
 b=zJcpbuOej6gZTZJPWaEzzkrlN5H7zYi/tfZLPl5QcNA5MOpFxQ5bpfEpOWC19kkDIQ
 o95XAGxPbCJuut3OL93cgHLImqrj5tQw4RnXTAxrh46dZ0trQ2lQE68dCAV1VD52ChB4
 6j/+8K5dNuPIHOAJkt0HJCGsrMqbPmjjDRP6QCpg442u0HsCNmVYdzwXV5tmwY/md7gc
 g2YQvbRpQu3dbCqYg4UpMe5X6DQRTBlO/f+Em8Ju1z2XRC3npyuYaPaKGsA87r+yNUfH
 q2JhDEoe0d2ALVFSB31HCbqGy+3dAaol5DyNIvhbdvMFnUCijLm8a3WsXVccdmfXLAlw
 6N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IBamUaj9YrgQoUbRaPWrU7o5ZQ6M8T/P4ePIRI4QM34=;
 b=xDZk/wFUKDCMZ5/BxfCpVc4VIQIFXkpA2UAkFv44fDB1DAXyDbKJRvXrx3Wk8SHkai
 3zFelkJw81XzYb/SMpHxGvu3aRTaCyY9zbXzz719NXfcXrWaNu/cClJnsdnzzSI6aw0L
 J+dY/cvJLSEWcXIDe2QzDcf86UZPi2kfOxIPoBbX4Hg1yCzo4P8cCMRy7NKqQiy4Owz4
 AFPCoJfDDKWvl58+79rQ31ax2UNDkjUKpSlwmpviNPk2x1ZoDWQJb7sMXuN9/KfjDGiT
 CgBCzLE/ve93Dqtdt0rhq0JZFsFgTpCH/8SqTJeJjglu1GV3sfrbtnLKXLZEsRvxptdK
 n3Ew==
X-Gm-Message-State: AOAM531szBrkYyf1wpYZam93xo5CHz9E4djJpqk9hRy+aBnkVdKS4mT5
 8E2r0Ke556vRH4WlKiQSquhh8g==
X-Google-Smtp-Source: ABdhPJxatwbY0eiFFqqr4kfADTBSUPWRHFUvVXS1GEzij3x70XU/UukTdZF6PlEkpcpm6uH9deBUDw==
X-Received: by 2002:a17:902:82cc:b0:153:cc6e:fac1 with SMTP id
 u12-20020a17090282cc00b00153cc6efac1mr3414756plz.138.1648705973585; 
 Wed, 30 Mar 2022 22:52:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb44e0cb17sm15616555pfw.116.2022.03.30.22.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 22:52:52 -0700 (PDT)
Date: Wed, 30 Mar 2022 22:52:52 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 22:52:09 PDT (-0700)
Subject: Re: question about arch/riscv/kvm/mmu.c
In-Reply-To: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
CC: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: julia.lawall@inria.fr, anup@brainfault.org,
 Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-9835bc56-8f99-4fd6-bccc-262b642a2ccb@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225254_613800_6A521FC4 
X-CRM114-Status: GOOD (  17.97  )
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

On Wed, 16 Mar 2022 14:10:06 PDT (-0700), julia.lawall@inria.fr wrote:
> Hello,
>
> The function kvm_riscv_stage2_map contains the code:
>
> mmu_seq = kvm->mmu_notifier_seq;
>
> I noticed that in every other place in the kernel where the
> mmu_notifier_seq field is read, there is a read barrier after it.  Is
> there some reason why it is not necessary here?

I guess that's a better question for Atish and Anup, but certainly 
nothing jumps out at me.  There's a pretty good comment in the arm64 
port about their barrier:

        mmu_seq = vcpu->kvm->mmu_notifier_seq;
        /*
         * Ensure the read of mmu_notifier_seq happens before we call
         * gfn_to_pfn_prot (which calls get_user_pages), so that we don't risk
         * the page we just got a reference to gets unmapped before we have a
         * chance to grab the mmu_lock, which ensure that if the page gets
         * unmapped afterwards, the call to kvm_unmap_gfn will take it away
         * from us again properly. This smp_rmb() interacts with the smp_wmb()
         * in kvm_mmu_notifier_invalidate_<page|range_end>.
         *
         * Besides, __gfn_to_pfn_memslot() instead of gfn_to_pfn_prot() is
         * used to avoid unnecessary overhead introduced to locate the memory
         * slot because it's always fixed even @gfn is adjusted for huge pages.
         */
        smp_rmb();

I don't see anything that would invalidate that reasoning for us.  My 
guess is that we should have a similar barrier (and coment, and maybe 
call __gfn_to_pfn_memslot() too).  There's a handful of other 
interesting-looking differences between the riscv and arm64 ports around 
here that might be worth looking into as well.

Might also be worth updating that comment to indicate that the actual 
wmb() is in kvm_dec_notifier_count()?  Also, to make it sound less like 
arm64 is calling gfn_to_pfn_prot()...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
