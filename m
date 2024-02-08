Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9680C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hicVnjJEkpp6aNcIuvZHu7sRKQI67LfYr0zNoIdBPuU=; b=f2fnqMFeKtCtRi
	PnQoTM1FfqvOd1rqQ9JMvIxNWwnPHn3apL6qQdMIXBaogiadOcTTaNoXAk1QSJaiZhZYyvU/Sgz8e
	lVWCGBZHADMZUrVAPG6a3rriTs2aiQigHaiYA1GJ6L/hPQe+Y3niJ54Dya1QeTY2HImCE1VK81xPS
	gY3CSa2yIFjsLAQ3DDRbkMhhp/SqNNtrBOeYM3qAUOTTWb/FGpXIGSHuanVCiP5YLP70VdCBQfTYH
	XUAPAHAuZP4cTG3Ch9to8sHlcOg7q1TZxWqZuMeT0CQccR2Sp67HvUqLGpX63liXf7Ld/HCTDlExQ
	8konvt28FV7DCjr/iTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY5Ad-0000000E13p-0xwj;
	Thu, 08 Feb 2024 14:14:31 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY5Ab-0000000E13O-0OQ7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 14:14:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a38271c0bd5so249853966b.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707401666; x=1708006466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDKJggBNKUh5J1UD60+/UCBCI6C1MTiVKiks1Qd8k3o=;
        b=IrOtBJ2cT5aup1WIAWM+TYshbU4TXhyctopQEvLbZw7UQDb9/kxYvq6Xp0vEGvOmhM
         4/Fndm14j9+W0f+DQnqoc9qB+v5EMk0ImUwPT+qOD+OcSF3R3Mis2owq6zQW4Tn2Qcc+
         HuvWmJGWWtq/mo4veZpPFPMrJXPy6xnzZiXo+2hP5OfzqjXjEzPJNyX5+AzWqH9Uf5KQ
         NPFTPG1GTpM376U+XKAgl8xuymvc11cph+3Pb3vcRL+nGt1UJdB+iuJTEVtkHvD0mR2N
         9skUr5VZGOWiH1EkUusFpAiteVp7aysT5w4MNdipc2ZK5aqqerEEuInPM2Fb+MhggkV5
         oqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707401666; x=1708006466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDKJggBNKUh5J1UD60+/UCBCI6C1MTiVKiks1Qd8k3o=;
        b=ZPDNSCpxMko1f1BWbpYm2Um2QUaR6ZhZoABJyDbmkaA9vpl2vDqZwS6TpjQRic1Akn
         WoP8TTCd9UCsPLd4FEcSaeGhHVzlmEycGQaSeyu1b8laPdK+qlkj88au/FcfENcIXlOh
         fozgEYT0jELlc/Uy079jpvqB/EYKX1QoNYsvoEIjnVT5UA7h9tQybSE8RdFGOrMlOKuI
         71ks7EMf1yvDzEwlxiYmL4JDOTsjkjviRPMc0yRqI6YCGPe4XbKj1L2GbbEZthxL7/u6
         Kxn4P6J8c2gZ7M1y9mV/OaVhRMctDe77j10vrLmcRLEjgq2Pf+I6FLkw9/FJW4Nwanfl
         LkyA==
X-Gm-Message-State: AOJu0Yz4V9/uAys4O2DN/pejyiFyZUYaHKpM0W1eKL2QbtTcQxOXJevV
	uHLxSNf1zP4wv3AbDAvkZCFRUA/kZIHH5e2VPgR9nv4kVBnxyDac
X-Google-Smtp-Source: AGHT+IHr4RdcZIOaiSh1Q3PJLh4mVb4SUYUwnQUTA1xO6hlUnbTbmNqlpNO2IEh7urUC0/CYI9RdoQ==
X-Received: by 2002:a17:906:51:b0:a37:461c:61ea with SMTP id 17-20020a170906005100b00a37461c61eamr6213238ejg.43.1707401666084;
        Thu, 08 Feb 2024 06:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoXDprPoNLSf2MZ9/EnDleTd8xWd97TTn50rofvdwKhL8xCFOh2TlzUy+KkTqjRDlgLpqs2vrcVBTXLXm75Gugm50V5UpW9uiKe8XIpysaLfGBKGFA1JlX2CRbF0p5cVNyZcohCtQPO9+he/imflmMPDY0HprXZqtHTcXuTI55pmA6SqLgBTQkCFEwNQdIBAjlrGFEWJsN5SvnqNdvgVD5sfPMCWNGSctd37zIRhkdcm3Rv9NXmQvDLR9+aDzjOtNvw+IdRaFZDSnlD/SYPNrlWbG0U6Y8b04nmUSNPhSkib7+tbUFu/w2TIgrlcW2tI0RqfM8BXi8nhA5lS/gcn1/od8WVD8dc0+GJKrTFfzSAeqn+BY9/CuDG2XbkDb2HXF9q0hbCg==
Received: from andrea ([31.189.46.254])
        by smtp.gmail.com with ESMTPSA id ga6-20020a170906b84600b00a371c568978sm78815ejb.150.2024.02.08.06.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 06:14:25 -0800 (PST)
Date: Thu, 8 Feb 2024 15:14:21 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH] riscv: Fix text patching when icache flushes use IPIs
Message-ID: <ZcThvZgdzVHotyQq@andrea>
References: <20240206204607.527195-1-alexghiti@rivosinc.com>
 <ZcS+GAaM25LXsBOl@andrea>
 <CAHVXubj7ChgpvN4F_QO0oASaT5WC2VS0Q-bEqhnmF8z8QV=yDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubj7ChgpvN4F_QO0oASaT5WC2VS0Q-bEqhnmF8z8QV=yDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_061429_178109_B15D3C76 
X-CRM114-Status: GOOD (  20.50  )
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

> I did not even think of that, and it actually makes sense so I'll go
> with what you propose: I'll replace atomic_inc() with
> atomic_inc_return_release(). And I'll add the following comment if
> that's ok with you:
> 
> "Make sure the patching store is effective *before* we increment the
> counter which releases all waiting cpus"

Yes, this sounds good to me.


> Honestly, I looked at it one minute, did not understand its purpose
> and said to myself "ok that can't hurt anyway, I may be missing
> something".
> 
> FWIW,  I see that arm64 uses isb() here. If you don't see its purpose,
> I'll remove it (here and where I copied it).

Removing the smp_mb() (and keeping the local_flush_icache_all()) seems
fine to me; thanks for the confirmation.


> > On a last topic, although somehow orthogonal to the scope of this patch,
> > I'm not sure the patch_{map,unmap}() dance in our patch_insn_write() is
> > correct: I can see why we may want (need to do) the local TLB flush be-
> > fore returning from patch_{map,unmap}(), but does a local flush suffice?
> > For comparison, arm64 seems to go through a complete dsb-tlbi-dsb(-isb)
> > sequence in their unmapping stage (and apparently relying on "no caching
> > of invalid ptes" in their mapping stage).  Of course, "broadcasting" our
> > (riscv's) TLB invalidations will necessary introduce some complexity...
> >
> > Thoughts?
> 
> To avoid remote TLBI, could we simply disable the preemption before
> the first patch_map()? arm64 disables the irqs, but that seems
> overkill to me, but maybe I'm missing something again?

Mmh, I'm afraid this will require more thinking/probing on my end (not
really "the expert" of the codebase at stake...).  Maybe the ftrace
reviewers will provide further ideas/suggestions for us to brainstorm.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
