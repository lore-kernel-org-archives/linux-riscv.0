Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD53E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMb80kgO8u4ggAhSolps+wz5kiyb8pK0OFdp86jiGcQ=; b=igdCUXoG1qyfTE
	QecffeG4eJazsqR5gaWvX3Oi/FvSp7/DAema5rI7Ay6nGftr6tUQTV1rUauqxdPBvGeGLGKjVaHV+
	JDRhKD1CbY7s71YNyzIeIGw4H2ZpUqiZfRM34BBaReDiO+x9uUo/av+PkHQePgnqTkJGBD4hHy7KW
	hXy5eBuoSbi9+T9k+Hisb3yV8ro+W6KfZu5bRrhLm5n0OfKTT1LzM1z/DySxsaZ6wk2fJ9XQZPvJo
	Q3Uaihc5gl683Th/yanykAUyKctmOaxMc4ZjMYtpC+OaP7CwQeK+zr4/Ul7SyGH2UkCzr+pNdUvCE
	lE+me+jQXaD59ROKI1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOj57-00000005z3n-1PCy;
	Fri, 20 Dec 2024 19:54:41 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOj54-00000005z32-43U0
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 19:54:40 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fdc6e04411so1545368a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 11:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1734724478; x=1735329278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NkPuVK31h6ylgXGAz6BTZY5MK0QZOsmKngt0A2KtN0k=;
        b=b/jk4eyDKCpsDX35xEUmOH56FQ3m61TOnfGPFcEqCie0Fp5+I6zJdsta1qjIglWnGH
         9G0STAuXB+wrQLQsA5fO+oOrd/BKqPPy00lXp4ADfaQ1s+DhWhBsL2rSShfuvDOtPvhT
         9Cq78OG3YANWSk370cQ0h0HZ5Uso/nZkBr2lGhsmrQPinDrICrsJZIKB8DhKLAIwpqW5
         OVPUJbnp+J5WZrYiVY/1em5tkaDphzHhQ6dHoYJkoudcLXUPYB61xK2uzCkajWzHFqMm
         pBZKT0DThj8wUs+gVuG2SiqOdKDuzwyYJzH075H5tJlqY0ITa8ELdoFloCWgviZJ0rfS
         EK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734724478; x=1735329278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkPuVK31h6ylgXGAz6BTZY5MK0QZOsmKngt0A2KtN0k=;
        b=hgjOJ9LHiwXJgRJy0ipjri9a0uRrN+B7tFaW7+a9YW32TWH0nJysFuAJ9HcKwjdq3N
         qH9NgwnxQ+b0dhzZwU54HSXnBbzXZqmbU24IfPpCQwZxNcZe+cVNLaTKR7iCULw5ukdY
         4aYQSSr/nyLSi++H2OkC7oim2+nXzNDN8hfalXnP2mMrwcgam1E5ouZCfSHDT1vZuIT2
         DCDq9gqvgWsZ4iawwNottRc3t6PHv8PqLx8rb3VXI/RuHPNy1J6JcvnIjKu/f3IW4TvB
         M2dsmzLoiW1wfZGnZjHRaVUClKI5Gq6rObKACydpCGgY8AvvM9Yen8uRYEflw/8tF1ri
         QGfg==
X-Forwarded-Encrypted: i=1; AJvYcCVhnzDAPmCQ0NjrXrbZx5FywrCTnLwsUfB+Z/DZLj7BW6mp4MlRrBW8vruiufBCunQcfQEH8wBoy/zwIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFOZ/FOypt1spXn2+KXDiSWu6qxz5BEloJRcw9Codu5CgM4Jzu
	5MjRId/KI4kMkYSbhG0TGukhyGpGDZbR/LjPsO2+tUKiPQGY7TEfDIReTVyDvko=
X-Gm-Gg: ASbGncvcCkr6C4ylSGiHc0EfIvJBR5tJ9KVgp2dktLyRBaysqC/+ACypkaid4yHWDmp
	+JHvbDqAENT6Se+3ntIYchyqlWNizGgVAA6Pdz7NMFsllvEJIbzTiyoB/Y9wDUS16eUy+cpUTVz
	lzEUEJJOp59Tom9MknPmyOIIG/kq+0qCgbdln2Wm7dhujCZ4/j6OW6ecpgL12Z2HP+Mnvp3Q9q5
	yz89wCBzpBea7NWk95uFvFD/FKHlQPRC3eUJ01+97zyMY9gG3EHYobvsphNm2wCzk9/73Y0VVZ0
	CQ3lbfE0O0LhDLeNUSfbOw==
X-Google-Smtp-Source: AGHT+IGKhyPUJg+rDxXOP26hWETP8CwUyIBCsCKTPtmY6GDDgXDpezWFyCeWsXvGQ9G/iU7jCbubWw==
X-Received: by 2002:a17:90b:2e06:b0:2ee:ba0c:1718 with SMTP id 98e67ed59e1d1-2f452ee8cd4mr6674514a91.37.1734724477996;
        Fri, 20 Dec 2024 11:54:37 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d53sm32904585ad.33.2024.12.20.11.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:54:37 -0800 (PST)
Date: Fri, 20 Dec 2024 11:53:47 -0800
From: Olof Johansson <olof@lixom.net>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: felix.chong@codethink.co.uk, lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk, linux-riscv@lists.infradead.org
Subject: Re: RFC: riscv64 big endian system attempt
Message-ID: <Z2XLS2HX2KqBJW6U@chonkvm.lixom.net>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_115439_004284_04C9FFA9 
X-CRM114-Status: GOOD (  14.75  )
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

On Fri, Dec 20, 2024 at 03:57:46PM +0000, Ben Dooks wrote:
> With the latest spec adding configurable endianness, we thought we
> should try putting together a proof of concept riscv64 big endian.
> 
> The full information is documented on our gitlab[1] which includes
> source repositories, build information and project documentation.
> 
> We have a minimal buildroot, qemu and kernel working on QEMU.
> 
> As this is a work in progress any review or help is appreciated.

While this is neat, I wonder if there's any real point in picking this
up broadly and enabling it, with the associated overhead to keep it
maintained?

While big endian ppc64 will always be close to my heart, little endian
really has taken over the world by now, even on ppc64. It used to be
that networking was the area that BE was a (soft) requirement, but with
modern CPUs having advanced faster than memory latencies and speed, doing
endian conversion in software doesn't seem to be a big deal any more.

As far as I know, ARM platforms are in the same boat -- they did some
early enablement, driven by a couple of specific use cases that didn't
significantly grow and are used in very narrow environment and with very
limited userspace.

Is this a parallel situation to that, or are there reasons to support BE
more broadly? It seems like it'd mostly split efforts and add overhead
to make sure it's still supported, even if it's a fun project to prove
that it works.



-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
