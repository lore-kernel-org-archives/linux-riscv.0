Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D65C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Dn+iYh1m+a2b9VCIRKbrYvdOR+/ut5kfBAw/4wGKE4=; b=QeL7siExYw/z4e
	ZoH1d1wB4caVtwnmW2Q5atFAdqArNdgx+qchQdMMorCDH0E//fiokC/f/PPpnSyaxZo99Xs3XCmju
	yh3bCNrL4yULumzGbvsALWYSjHlYsMyaEU8U24T9TPxQYt7i1T1PG1mhBsAxHY60rrZavMMFXYKvN
	yWX7C8QMLFSWLNqJJA3oSFd78/bpnk9du65y7ncoOh2vwDY0PFUaqwq5w1mSBe3XljUZARbq8dO3e
	t/4YcYxrAQO4QuY6zP4DJ1wBvTb/gy+3GVUTArE6t05McZrswh8Dlkpx/kpZBS49nkBm0CqgTrgz6
	cQAmZFsq/XspkyB90CRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trz3e-00000005jn5-257E;
	Tue, 11 Mar 2025 12:50:06 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryy3-00000005iHx-1sCq
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 12:44:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso6180191a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741697057; x=1742301857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KAxTVq2MkmffpCsIoG9Vx8XOOm1e2JNRTwJ0699I4wM=;
        b=GAnNaKnslTA9MMT666I/NeA6XTGdmyoTQEyKMG/PYSIJuH0lctHJhiJRfjh+ZxXW18
         nOFA+kjuKP/dxZLxvl0B5n4HRtPnLVBgewY0pNemyVH9WqTfD22zdQYEpqbNDD4nUNBo
         rynb3EqXR1mY+ibMOtnEYbRm16USqlZa8sWEEnEMvY/sXWqbMLXcA1JK1pytzHBhTaTr
         6KAO9nZgmhCrIcVNSCDNKAMNjXGEpHQFoqQKd0aelVr+Yt8l+E+UPovdS3+4uIGQa+gp
         ox8wDNGOJTYVt8M09LQdpZKw5EJfOtiZqPxLy2IA9lJdcApWRP7pzXHk7UTb+KvH/wa2
         AxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741697057; x=1742301857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAxTVq2MkmffpCsIoG9Vx8XOOm1e2JNRTwJ0699I4wM=;
        b=KBxQIZpsXiCdMlaJod4acGDzBWE0Qu2W8YHbM7oPqAUTPojCqoG9il3Lypi1DVW/yZ
         V/9YRY/Px0lzwnmIKztSqORXr6xHNlOTPHOJVdip8xx4qVbn/zRxvjxaXoa0ox8MM1K8
         GOM6dkC4/i8bLljgpE/83f/2mueGxmTTGSuh5JSBqyuNbW1DJmuvenguWtfQ54fKCCma
         X64KRf4b7WJVQHAULiyzL8yquQIajRwMkHXgBSgzmJrYGen9yIYKdcoCSnrmSj2yIUq2
         216koRaJJV+3Ro8eBItx6RAdjVpA+x6TfQteDeDS/VMXfzwFQ0Ph/Mqzj7SzD8+GBeuG
         +x/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXo+TbDiAbCq3yPPXO4r392r7wXUG3E725bDzNLkasurE0YTD14F4x8UJCZkPHDTdsrm2GlKNTKAbEPMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw68GBQ2A72vx4542ukTFCafCxx0inNwqzRG11s+W8lGUWZA6FS
	YH6UXoK3mkF0u5HsZE0spBLS+lTAjxBT2YHEaKwX7jusWE7YLAZ6Te1rOdJHvrU=
X-Gm-Gg: ASbGncu/RldujNckZO3Mqu/fUtdO6HbUzOwbYuytkadGp00vOONptyHKb04ebZeLP/H
	XtZWXb888pwmw0tFv2xEqTWyQkce137r0Kv0OALnrKEQRZtM0fz8BZV5HCnru8di9D2MiMdGgrY
	Bdk1L87Gu5y6twAdzUf3sn4Xicpg1D7oAa3ixWeem1CiqURjE4KQv6qEXbiCbxctdNFpGsg1qC+
	wAkBKzn/dLfFlfOZW93lmudEw19anRlJhQ8tnh00WthROkp3EJ8OyamRO9vPRenl5d4tw22Vqmp
	qs38UMs5+H7mVpXJcDb86JmqTiCTPuxTe/E11kOl
X-Google-Smtp-Source: AGHT+IEO56Nb9J2khSBHRHHVBhO30LQsgobeKL8CBisjIMZ6nYRRy/fBVYFBaFBes9nMuhIvDJu9uw==
X-Received: by 2002:a05:6402:3581:b0:5e5:b7d2:d425 with SMTP id 4fb4d7f45d1cf-5e5e22db495mr18901947a12.8.1741697056272;
        Tue, 11 Mar 2025 05:44:16 -0700 (PDT)
Received: from andrea ([31.189.82.201])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768ef30sm8283422a12.69.2025.03.11.05.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 05:44:15 -0700 (PDT)
Date: Tue, 11 Mar 2025 13:44:07 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Andy Chiu <andybnac@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@rivosinc.com,
	puranjay12@gmail.com, alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
	eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel
 mode
Message-ID: <Z9AwF5hwF0ES9Grl@andrea>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-7-andybnac@gmail.com>
 <87ldtck8k0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldtck8k0.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_054419_481848_3B4AC3DA 
X-CRM114-Status: UNSURE (   8.05  )
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

> FWIW, the for S-IMSIC the write is already writel(), so we'll have the
> text patching and IPI ordered. Regardless, there's more than one flavor
> of IPI on RISC-V!

AFAIU, this writel() is intended to order the insertion (and the initialization)
of the CSD object before the MMIO writes; so, the "right fix" seems to turn the
"other flavors" into using a writel() or providing a similar ordering guarantee.

As a bonus, such change should address/fix all current and future occurrences of
the message-passing scenario in question (the patch addressed the occurrence in
flush_icache_all(), but there appears to be a similar one in flush_icache_mm()).

Or am I misunderstanding your previous comment?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
