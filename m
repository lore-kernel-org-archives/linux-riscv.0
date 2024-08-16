Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710CAC531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FvHA8y/VkQXwBiwf+tf5BmGKCsU0o6GhRbNEvG3w5g=; b=Te0A4zYiIuhvNY
	zi08Pi8GSWLEQzWIy+8o2Cc4VBPaUDADAcldxuo1nrF61ArznGakJyWR1QdVdEEk2X/ZB3nR5YhZC
	5t9IHzCkKnONm8+T5bQbiVe3WL2t7p2ljJc669jyJeWW55XzGCCAFvNh8uXllzywSS8cnm6VWHJBJ
	0z/dWu/+TGrSMNdxJhc2qVR4dVCtSscQRErQ66Pq8USk1BNNx1U199IMoM2HxQjN01Mv2jDX1Qr3h
	DJajP4jBeGbQPNJsOEMRdp9C/4NQoiM3+rIpo+X4K3BksHDmBVdQNBNVbHS3VMMcXSc/KRNFe5ZCh
	qkIvb1r2ujs9C7XCyn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setUQ-0000000CSYL-2i3o;
	Fri, 16 Aug 2024 09:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setFc-0000000CPet-1zvZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Aug 2024 09:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7ezHfPbQtKZ/Nw2mLq7nbBPF6a7L0xlFdhWHwqipVgg=; b=EzLhdn3p0ZLDY2/0xPs9OtNCMU
	FbH10HKgWRtrWLdgiY+H8c0GpuTUhJQFyOemJRokVOto3VnvEihSOJU49yCvS6jbojqP7UOdBa+dg
	1wGUiUqIqcM3q9bpk+qBPk27cdI/5lR/Nfiu05C3Ke3lEeRPldZ8Vc76mA1/aEqz7xWwhafSIsnIW
	S5Pd2wu8FmacyjV0MuOteebNd+kcKMbNHrLeKf66kjcL3eXOS6Ud7owNzdab9uKDx6eeDRbdwbc1C
	KQR0rQrZ3lbfJPLMAKvP1tuyMxDkBL3LZjFTqIlUX2LWEsSpx8k+u0xd6qh37DQtmXTHKWq7YH3JI
	Ws217htQ==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setFV-00000008awS-19Oh
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 09:28:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so2169610e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723800473; x=1724405273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ezHfPbQtKZ/Nw2mLq7nbBPF6a7L0xlFdhWHwqipVgg=;
        b=D3S9Oj3LQNygDn7orkmza8P93KuKAeVzfu+h1QJ4wyK/dbJBuGF5TdHXMy11K4q6RC
         WDaBGiMfOzVa8wFCtW3PlFLgqcarE2eOU30Izn9aMwlkG46qECsLGlvre2Cb2FWdPWds
         TCXFeJ7vH0xZ58atc7Wc2jbEp/WC10p19pPNZ8lD1HxVp0pbwGIZtbH2oaLsQyY9E708
         RoGquwLLF/coZEehuYzdQPGO3EUZQ0bYTumeClv8f7JYMwxVDrjqFzRsDZzqNR5ePHOE
         yaUOV6SHo9BU5kMyBXrkI0HtWy+h8w5QdRnyzrNLEMv1IQtjp1ALrDMeBavMq+yl1/Vz
         jIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723800473; x=1724405273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ezHfPbQtKZ/Nw2mLq7nbBPF6a7L0xlFdhWHwqipVgg=;
        b=gsqFyrwWGIGyNm6AaMGf/8XJWwqo+mMOpPPQGjaV6A2FlZarv2O4ggi6zoOfid4zrA
         GcHF70JjQ5nz/vCoE4oD5oUz3fCdym1iRvFvBCSKu2q/OkfFepioYcR9QaMw2WPZ66Xy
         xoG0elHM5f63Vd1LVflFrd7v/rzkXkEwWkPNXdHVnNUjK0hJXstkgcXke0mjLUBWEFdA
         ky5by286AWA8GDX/BCMZR4GiIYLqiB+2a5sYyWyrOPachV66MaCwVL7vjCdO6eCF/cNB
         B+RCfZvbfnwY3rMaKgLwAJevIw3tCr1SjmjxWEoUzeeANRDLo9aDjMzZqRMEE4zMWKCU
         IfAA==
X-Forwarded-Encrypted: i=1; AJvYcCWLxhhHqD6oBq8HfGptsIaB02MA/p9TWautp/nVdHIsrq+iYHbEDd5Q3jb/hXAeuORLJGqb7E1ndw5rDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyItIEr/d1LsTKMQYhu4Uol/qKt/NT4r1j7y+ijkpw8jwkAkIyT
	em+J/hogw/pM1hatJW0K6YpHcyFnpecWQoPEDHnlL0l07uArliiM
X-Google-Smtp-Source: AGHT+IHtIobWpDyR/wNfIlTck6cEiVCePFpUoJf2/QSPMUvcyXdOt66tyYIYXM5IChI9qAvRRZJ/sw==
X-Received: by 2002:a05:6512:158b:b0:530:9d86:6322 with SMTP id 2adb3069b0e04-5331c6d9db4mr1616048e87.41.1723800472213;
        Fri, 16 Aug 2024 02:27:52 -0700 (PDT)
Received: from andrea ([151.76.20.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7dae0sm71435195e9.44.2024.08.16.02.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:27:51 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:27:47 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Eagerly flush in flush_icache_deferred()
Message-ID: <Zr8bk4WR24XHt5jp@andrea>
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
 <20240813-fix_fencei_optimization-v1-2-2aadc2cdde95@rivosinc.com>
 <Zr1NC7GBQHfqqplf@andrea>
 <Zr6MjWLD5VQAQHAV@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zr6MjWLD5VQAQHAV@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_102757_880661_0817C9EF 
X-CRM114-Status: GOOD (  15.64  )
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

> I should have added some memory barriers. I want to have the stores to
> task->mm->context.force_icache_flush and
> task->mm->context.icache_stale_mask in riscv_set_icache_flush_ctx() from
> one hart to be visible by another hart that is observing the values in
> flush_icache_deferred() and switch_to_should_flush_icache(). Then also
> for the changes to those variables in flush_icache_deferred() and
> switch_to_should_flush_icache() to be visible in future invocations of
> those functions.

[...]


> Oh okay so we will need to do a memory barrier before the fence.i in the
> userspace program. I don't believe a memory barrier will be necessary in
> the kernel though while this prctl is active, will the kernel ensure
> memory coherence upon migration?

Yes, the kernel enforces coherence upon migration:(*) in the example
at stake, this means that T1 will have a coherent view of memory when
migrating from CPU1 to CPU3.

To leverage this property, we (or the user application) would need to
provide some synchronization between T2 (that modifies the code) and
T1.  This typically involves some form of barrier pairing.

Feel free to reach out, here on the list or in private chats, for any
related memory-barrier doubts I might be able to clarify.

  Andrea

(*) A malicious/buggy hypervisor could migrate (virtual)CPU X, and all
its threads, at any time and way allowed by Murphy's law.  :-) I take
it as that goes beyond the scope of this series...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
