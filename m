Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC82C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhiZqIo4G5icb1NYQ0fJndE6qev3D3LjDLI2nPE0Ex8=; b=rD1a79NwEMTZ36
	O4DbKsuxo66shnvM/sFx2O9B6LbX4W483VQEcMbA9YUuPpoF3yiwS3StIImqI4WRtv0iTQWwi1L+L
	/7K6m5DzDyoIkRcpW2/LxYSaU6hAJSB1MnZnxaDGZJtd3Ma7JkrxX6aY34WqGZnCy0C9FbcmI5Qz+
	HPDbDXkiYueSJsoBn43SKd7Y/8hJ2kwuidkIQ6AkzmRpAFcK9l/GsQHyLWKcE8rkS4kCWq2tzDtOy
	9BN7LbAXHbCIZOSRa2Kg8yK7gd63lASYde0rgCVQxsdeS/y80dDKX0btSri/URZ8LpoA4PpEWWY3/
	skT0ggn53SPgWnQ59ndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kpU-0000000GJ1i-0CTc;
	Wed, 08 May 2024 17:11:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kpQ-0000000GIzX-0kf2
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 17:11:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so8624b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715188297; x=1715793097; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tSmrj41Qt+Se2fdGi7WeozvVj6AfH//AS3pb2zkquGg=;
        b=P1/Vk1ftAPZ/JGfIcL46RAevnIIRS6UDYW9YJ/cxP+SM2aHbg3EVccS5TsIPCAw3ay
         KrUP/+WSLA1KgcJppL/dLuokLaHqc3yLoAfkhLvX92l4rouz/CBAeopVjE09FSWWhHjD
         uARbGkNXgEPUaBgPfItz+UMFQ109Ypyeax0n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188297; x=1715793097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSmrj41Qt+Se2fdGi7WeozvVj6AfH//AS3pb2zkquGg=;
        b=KSEBzxSVx/L9ct18SNbx5wiNEVW0sx6U48dSq0N97nbdsJnXIY0KJCvx1QG8gWGRhF
         wVqMXfm+4a3oHVhVmODXHhiJhgBAEhSSb6lhXT8rPQg58TrS486rB6LtyGM/9DPcK8g7
         8yjTYc7HV6eysaiP17z+KWaoJvvFVySJKr3T1XJghfPQs1R02ZPw0CHZz6z+0vFiigSN
         sX+QKDmhnHwwfkSvsErZ3m3ML6jwILbsvursgdfbBEuG7jFAmttSG1GoeoG9MasA+449
         kdNVdYArUMvUOKy9hNQofclQLrYsTSPiM3yNdDwQJMzXp206ER6L5GEVSDsq60qKIuxH
         M5ew==
X-Forwarded-Encrypted: i=1; AJvYcCVmtwUuwgPpgCTl/5dl/i5SmCciv/nmjCCls28b9M710xuDwGy9xwIByMWuxRzaAbq90MGzYAVkcqVwub34wkqNeTQzznWXIdo9SijLFNw3
X-Gm-Message-State: AOJu0YzwBnjenlOdrGHlZZO36hjRRCeisqjf0WbQV3P0Or0JgQiSdA9n
	Wmlv43eOLe5cN5C7GTnP9C+wypBqaF+Rq8M2jO4Yhc9sh8UrvO+XXO38Y6jpwA==
X-Google-Smtp-Source: AGHT+IHN8eeXE9OsgItxEKHR70nrrazwBAjav29jEzJB0wGGmdP+iVlP1VjtMYRBUjqpRzzzPBgYhQ==
X-Received: by 2002:a05:6a20:c88b:b0:1a5:6a85:8ce9 with SMTP id adf61e73a8af0-1afc8d1b02amr3543639637.12.1715188296881;
        Wed, 08 May 2024 10:11:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lp9-20020a056a003d4900b006f44ed124dfsm9245352pfb.160.2024.05.08.10.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:11:36 -0700 (PDT)
Date: Wed, 8 May 2024 10:11:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Joel Granados <j.granados@samsung.com>,
	Eric Dumazet <edumazet@google.com>,
	Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-xfs@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, kexec@lists.infradead.org,
	linux-hardening@vger.kernel.org, bridge@lists.linux.dev,
	lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org,
	linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <202405080959.104A73A914@keescook>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424201234.3cc2b509@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_101140_232762_F1A0C9E8 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Wei=DFschuh wrote:
> > The series was split from my larger series sysctl-const series [0].
> > It only focusses on the proc_handlers but is an important step to be
> > able to move all static definitions of ctl_table into .rodata.
> =

> Split this per subsystem, please.

I've done a few painful API transitions before, and I don't think the
complexity of these changes needs a per-subsystem constification pass. I
think this series is the right approach, but that patch 11 will need
coordination with Linus. We regularly do system-wide prototype changes
like this right at the end of the merge window before -rc1 comes out.

The requirements are pretty simple: it needs to be a obvious changes
(this certainly is) and as close to 100% mechanical as possible. I think
patch 11 easily qualifies. Linus should be able to run the same Coccinelle
script and get nearly the same results, etc. And all the other changes
need to have landed. This change also has no "silent failure" conditions:
anything mismatched will immediately stand out.

So, have patches 1-10 go via their respective subsystems, and once all
of those are in Linus's tree, send patch 11 as a stand-alone PR.

(From patch 11, it looks like the seccomp read/write function changes
could be split out? I'll do that now...)

-Kees

-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
