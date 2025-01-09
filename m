Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87F5E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4Q29TuO1jtz03AZ9HjlC5xc68CGw4rBs3Yc6RV97BEw=; b=jjZnpd6Vm2Hz04EgF7rLrxaESa
	ibwLNru4sFbjm9MSHF4BRV3tOUHSnTGWx6vDB62i6UOhu1X3jQzbin0qU6B385YRJDALqdxwNkOTF
	FJvN8p+YzD1HvjFbCsM1S3WKZYRy4GRFUf6wD3pm5l14MJtABXkAlVhm4GZlarM94cYKvkLIKeTr3
	BoOO8mKqvnYPbgfR+dWYiRt9f+MGNgxBs4ICYn1a/4pyHIFzLhgRfOJjX1VFIcXa3ObYu8wpctkx/
	HyF3AW3K5+ELhgwmWSdPwe25Z16b/7ruL8U22sC6+WHP6AzQne3TjV8fZ26f2io2xeO26ws+5Y6Vy
	02r1oD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwcj-0000000CtUb-0mgF;
	Thu, 09 Jan 2025 17:47:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwbd-0000000CtGr-3byK
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 17:46:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216395e151bso14946175ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1736444765; x=1737049565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0LOV5zmf4ysZfrgepWXP5md4CMCuVZ0Nucxb0FhbNM=;
        b=Ub4Cc8dCnnTRFH+uIoCXJ2o/piuCZNzXrPzzU0EVi7R/oriQt2xqBRCU3B507pqNYj
         WukPHjdNJweE/+Gr0/hMyel+74xKj5pEeufdMd6NF0RYbOCoFHFfo4/s8mbJ0gRl3jvL
         r0YdikzqwhMLIm2qqMTAklpQLrBKgXG1+5fWVKEUoQL/IjHPU2KYplVQ0WpA2bBOM5Fd
         S7CEH/5wQbuD4CcBdRI4RBfrM5l6/fSvU75UPNLJGNfxOR9I3VsPs64HZDp3Eq44LLSj
         dgbK4Tb9lsYWndCtkLIHNI4z7P4UKOM0rahRmghJHt6+bx0hDrV2bl1tD3kD5b7IT/nP
         zIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444765; x=1737049565;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0LOV5zmf4ysZfrgepWXP5md4CMCuVZ0Nucxb0FhbNM=;
        b=JYuHtCVxWroTcTnqFqBBxl88ya3tociPLFBcys3yeJ+jA1dwKE1hx3/qaEM/s6WEQz
         +hKAZlBVnCuqXe0I3wgrTap5F0m/APmJq3V4kQKwCFaq9br2J1bLybA/NPmV1vnXq/Di
         yxORg2i9ZE3dJT5gbLk/TYM3WPEh+stpvcRNUU2lm11GC9fUcLH3J1B2mdo/KB6fzyj8
         rzy5c+JHt9G3Kb9SG98PhJI+JlJHtiUp3i5b/WFEIRDs2eLZRJHQq8XXMd3Wegsxtxy9
         rVvPMduRtmEvHN3YF2GkfM53AbKMhUnn0xsnpJqaSnIuyS9gmqfGTHsmi78iAGEWdV/q
         srog==
X-Forwarded-Encrypted: i=1; AJvYcCUw7tGDUjTV37V+E2SbkPdFj5Lxn8NuB6erith1RkfF9xCSRmSUVKgUtNhuqUYQEaXeSIfUvwJtYhRVag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTTRM1MtOzHxpyXjDYX+HVzs7tDYjR9vLa4kglzK+Nn9ZA29V8
	pErF/ZzzTrILJ+Dg8lTyTJYuHCTiGLkiBYgay9gALLLOQFCqH7tnxp8jD+C7R90=
X-Gm-Gg: ASbGnctjgoP2jxq3J+XTZRubJuhoalLgnD6DZOF4HVkMfpDyL4Mvbw/WT60QiMJtMuI
	K4RgKXFF8crDWmmltEmcP9qGpmM3QggWAyM3+/DIeoJKFE+CaMqV13XT2cEHsczGqn7R7saMZ6V
	nA45uedoOjr48J21FqSnH1RDcTPoNNP0lUwGC1mqQsfzlfFNxMZSwXy6WaedS+dH7vVb6NlpDt3
	oe2qvmtQ+CM43ioFZQjeukjyaBxF+PQzqApowJW/FwhDFehgBp6kw==
X-Google-Smtp-Source: AGHT+IHmKVES+3Np+xbmyHH4y5Roklqn0WF+Mdt9JI6jsRR52HgSpLfLim2ceCu/1IJJujREwWVxyQ==
X-Received: by 2002:a17:902:e843:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21a8d64e2e2mr71276795ad.5.1736444764698;
        Thu, 09 Jan 2025 09:46:04 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d13fsm586465ad.188.2025.01.09.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:46:04 -0800 (PST)
Date: Thu, 09 Jan 2025 09:46:04 -0800 (PST)
X-Google-Original-Date: Thu, 09 Jan 2025 09:46:02 PST (-0800)
Subject: Re: RFC: riscv64 big endian system attempt
In-Reply-To: <Z2XLS2HX2KqBJW6U@chonkvm.lixom.net>
CC: ben.dooks@codethink.co.uk, felix.chong@codethink.co.uk,
  lawrence.hunter@codethink.co.uk, roan.richmond@codethink.co.uk, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-bc49e903-cf56-4454-8885-a79dbbf3d48d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_094606_164198_B3622DC4 
X-CRM114-Status: GOOD (  22.88  )
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

On Fri, 20 Dec 2024 11:53:47 PST (-0800), Olof Johansson wrote:
> On Fri, Dec 20, 2024 at 03:57:46PM +0000, Ben Dooks wrote:
>> With the latest spec adding configurable endianness, we thought we
>> should try putting together a proof of concept riscv64 big endian.
>>
>> The full information is documented on our gitlab[1] which includes
>> source repositories, build information and project documentation.
>>
>> We have a minimal buildroot, qemu and kernel working on QEMU.
>>
>> As this is a work in progress any review or help is appreciated.
>
> While this is neat, I wonder if there's any real point in picking this
> up broadly and enabling it, with the associated overhead to keep it
> maintained?
>
> While big endian ppc64 will always be close to my heart, little endian
> really has taken over the world by now, even on ppc64. It used to be
> that networking was the area that BE was a (soft) requirement, but with
> modern CPUs having advanced faster than memory latencies and speed, doing
> endian conversion in software doesn't seem to be a big deal any more.
>
> As far as I know, ARM platforms are in the same boat -- they did some
> early enablement, driven by a couple of specific use cases that didn't
> significantly grow and are used in very narrow environment and with very
> limited userspace.
>
> Is this a parallel situation to that, or are there reasons to support BE
> more broadly? It seems like it'd mostly split efforts and add overhead
> to make sure it's still supported, even if it's a fun project to prove
> that it works.

Ya, I think we'd need some real concrete use for this in order to want 
to support it.  Something like actual shipping hardware.

>
>
>
> -Olof
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
