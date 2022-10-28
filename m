Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89925C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrVuhqVmBDCZeQ8MJZu1OlCWZMEMr+sCCPZPP/9EUcw=; b=fgOoJ1HJLsdI69
	BTQOmXfAfqiMYoBlULA3TSo1KsO2euVB7wNZcUFY0wItFYkLq98Sf/3kHwSofgHsllwx5+ch+XZ0d
	kCpjycnJCGZdqfCRevYs8+XhtT4ptSazJc7ihIqeLIQ5OIZtxX8C092Vs15V/AXp0CoiPFQA6Y4PT
	QQo9OqgP6ylW92lc9OdybvweA+xixHdhFk8tCcXcRN3CPD8KaE90yy+Ab1GjcE05Hly2uGmfligLh
	r4QQYzs6MbipdIV1eW6l2t7rXYLNozduUdHbUTbLy4ixxHhsadmezCrAZwjjGD5Bo0t1fB0dPb0vZ
	i9uowNwURBr5Q/Bf7WfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooJyv-00G2Nv-1f; Fri, 28 Oct 2022 07:40:45 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooJys-00G2Md-0l
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 07:40:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so2939472wmb.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 00:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i2N6u0rpi5MSxrtESZE6Q60hmeXl2yrT4Q/yzn9seGQ=;
        b=AoCvpD2g8hOJXZ2R+h0TvZDHfaokVkjBrIgJhsnS+RetduEnMeG2bCCW5x/1wmwm7y
         tpBT95DdI7WubCuwdur/JGKGBJMJTmP2C+cDmuRV2EIc6vAsZ3DUgxOdepf3Ri0V5o/g
         s61UXLKKrJMPwJgSYbyvTnZ2kLiEieceMzgGWlWdWLree/oXrw+5/Cgog666CiUnyi5H
         iiuCQyE6pPGPEBhy4h9c2slAcvDIj2QVcAFikE7NBHa9TvAFyRkoKz9Xmr0z/0PG8Ue7
         mIV0FWee9ddQzPpFwF4bakArR7lyrUpkkh9KC8i6sE/VKS8eJ/p/NH5MjHPo/bG55EaI
         zcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2N6u0rpi5MSxrtESZE6Q60hmeXl2yrT4Q/yzn9seGQ=;
        b=eH3QtLB1YipjsPF/tF87e3l9j28jLUI/moMV8vj9e9Op3TqkbidFtblVlm1M0Kk+si
         CdN+K15qxCqfoNjV6f/r/Huc3neIK9WP2RdxiGKBxwQu/EP3z3wMS7oeDvOv9s+0tAag
         U+AZ4WK+fmNv1G6dRSaEGjNdnhr3AoPiQaLNJ5SFIcdfyElHoQJc9FvaIyBuMt9DQo19
         F8a6yyahqJP9nMAWXomwOOXkyQtC0AdKjA4oLSVPVAGzc/U3scdPcx+8Bv9c2T+OkfZ6
         MqMEsgb/XZ6pxK46IpQqXDI87L+eSofQamhJc9NHv6jnpdqNCTYGL3/sMg4HTpPeDcLo
         hzmg==
X-Gm-Message-State: ACrzQf3hnN17MjaQl5xmq6pIfEjCnmjvbSxz1GQFLpALTttQLtKvmnno
	0wX8zuTY7KLlprwDGsX9Xidw7A==
X-Google-Smtp-Source: AMsMyM6b9ooO2YT2Bk853NHb7QqLyKbP8a68ufEkfEtecmJkMMeYnDPuL+24oxMQM0KqoQzia6z3ug==
X-Received: by 2002:a05:600c:3b88:b0:3c6:cef8:8465 with SMTP id n8-20020a05600c3b8800b003c6cef88465mr8354486wms.64.1666942839337;
        Fri, 28 Oct 2022 00:40:39 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b003b4ff30e566sm12687932wms.3.2022.10.28.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:40:38 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:40:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, yury.norov@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, openrisc@lists.librecores.org, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Message-ID: <20221028074037.ksvtvzajyulm3oy2@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_004042_086426_9BBED5ED 
X-CRM114-Status: GOOD (  27.58  )
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

On Thu, Oct 27, 2022 at 04:07:18PM -0700, Palmer Dabbelt wrote:
> On Fri, 14 Oct 2022 08:58:43 PDT (-0700), ajones@ventanamicro.com wrote:
> > Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> > started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> > are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> > start and next seq operations implement a pattern like
> > 
> >   n = cpumask_next(n - 1, mask);
> >   show(n);
> >   while (1) {
> >       ++n;
> >       n = cpumask_next(n - 1, mask);
> >       if (n >= nr_cpu_ids)
> >           break;
> >       show(n);
> >   }
> > 
> > which will issue the warning when reading /proc/cpuinfo.
> > 
> > [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> > 
> > This series address the issue for x86 and riscv, but from a quick
> > grep of cpuinfo seq operations, I think at least openrisc, powerpc,
> > and s390 also need an equivalent patch. While the test is simple (see
> > next paragraph) I'm not equipped to test on each architecture.
> > 
> > To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
> > a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.
> > 
> > While the patches are being posted together in a series since they're
> > for two different architectures they don't necessarily need to go
> > through the same tree.
> > 
> > v3:
> >   - Change condition from >= to == in order to still get a warning
> >     for > as that's unexpected. [Yury]
> >   - Picked up tags on the riscv patch
> > 
> > v2:
> >   - Added all the information I should have in the first place
> >     to the commit message [Boris]
> >   - Changed style of fix [Boris]
> > 
> > Andrew Jones (2):
> >   RISC-V: Fix /proc/cpuinfo cpumask warning
> 
> I just took the RISC-V fix, might be worth re-sending the x86 one alone as
> nobody's replied over there so it may be lost.

Thanks Palmer. I still believe this fix is a good idea, or at least
not wrong, but as the cpumask change which started the warnings was
reverted (commit 80493877d7d0 ("Revert "cpumask: fix checking valid
cpu range".")) it seems the urgency for fixes like this one was
reduced. I'll ping the x86 patch to see if it's still of interest
or not.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
