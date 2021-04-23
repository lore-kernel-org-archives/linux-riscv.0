Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1057C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294F86128D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294F86128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0EneCVEhe+B4O2a6Ae2cdXoa2JyZAk2F4+HMfR/whfE=; b=Y24Jtu+CM/fAcxH45QhuUoJB1
	aeWp1WRWMRkWBXYUrnvzHm9ULYVqfAUH3/2ritVhAwh4HM02oFBguJtd2TFI1ibjLWhE+Z2KCSUkE
	RqbJcGG9TAteoI5g6pb2w/z/jDK+QUQEDvnsSJCqTe5BeSHA8tV2BjS+Fl4qWQMCH0PGGzs0WQCFX
	NoT7ethTcXVagNfzNwhhcxqQ0/ODfW2apHSj/oh83/3vJTwfbajgF1fyHxPIsAoQtySFsIcCUnwwm
	1vIX1xCc7I7WDPJsosVwnrCb+SdoFt4N48+yczfojllOazV0BZF/vto/RVR7N1dZvBcNZZjcmzB8x
	DfOkxW6VQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmX8-000TNQ-4A; Fri, 23 Apr 2021 03:31:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWp-000TJX-H5
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=oA6uUurtMU8w7TYacXD4ktf3tQXYmIfvhBvbbuCMgLg=; b=urCUYVLxYVFN/5+WgTqzfsoy29
 hk/X1TQEZ2hwI+GW8EfoilxzoeOxq/BzVyXvr6UnW4kXpfeAKdj9Nupjj6ppobgcOGjPCWEpviAd/
 GwxLjVC3H3rwoZY5rg/TOEhhrz2QjPaVSgCqVZGvSNjRLT76LX1B2rOoKm8eqa+oH01mWM1V3qODr
 AoQi6wu35wz0GqleLq9BijYQ7Sc7nS4jVaA6OCSGb1d898wg3EPsVNbOIMYmw2ZsvTBFrQHJ8gG75
 yz6MsVRP5q8dABYOyu60LaTDDKUUxjtW7knmwgi4IZG+fe9lGmv0/EhPscuiroIYhpftzHcmbISRX
 NZ/pDtMQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWm-00E7G0-6C
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:30:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id a12so33178470pfc.7
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oA6uUurtMU8w7TYacXD4ktf3tQXYmIfvhBvbbuCMgLg=;
 b=jAWMKXNs00Whsb1gKP4JLGMWKl2ami5WHvugNAa2ujA4Kv1uqqLAt2scV/d5GV8AXb
 sLDH1zOKXfBpg41ZNS6GKIvZtvBo7DCP2RlAfa5PpiWQZEX/V1Fx5UcLfPmqCOmlQK1J
 Ovu5eEHaXyE9bwU5g0D6bSnI+dqh6/O61fZBK0XAKEfau+RigVXOx7rIl/cAdlQwVM1/
 srmzcMz8FK9U5SoEzYc8bB8rKTpQIffhdy3jCtPW6UlJgFbW50+VgvVjRzzqK2aL9Omu
 OwpXfVNQajauxxbu3iq3WpYFQwb6cD2K4pUcTxf22OkDZEvvKJDWItV2+qOO//JBuvhv
 42tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oA6uUurtMU8w7TYacXD4ktf3tQXYmIfvhBvbbuCMgLg=;
 b=kZpOHQ1otTWDIRJ55pQVsjg9IX6qeT/lxQJc+n2ELIbqJtmJ7+53nNrqADIxguIRcS
 Srh+KSwAQLniiDAFle4P3bvy5xDqrBUnfu30DejwtP9nBXkDurjV8lBdk4YmW0w0NPmR
 H1OmnN2NYI+jsDdAY40StU70b2VCOlyWEmjR0CTNx1tww3YW8y3GnVK2WZkt1aR6f8Ne
 /Nyospzx5iUYC7v8HnClDSOOmiQeSmgpY14h3Lic13PiXEppRXWGIolSVaIH1xcrT2+P
 0ncS+5nIyotkhy3aYePWH6o9c6EOHOo1WKZSO67i9uN+gyZ5YPnXHYTR+ZpYIp1KRT+V
 YoSA==
X-Gm-Message-State: AOAM533q46dThkVM8CmD+7rkR6qSQ7bdeCANRXBv3oU2pUi7M70ux0+U
 peO1Ehap3QG1UJBzCTXPZsLh+kzmkEG5rw==
X-Google-Smtp-Source: ABdhPJwqlzAMe93JD/qSyfcM3dDhNq1vg2/xGFgU0QpmCCQp6zF5/O11volIEFPMtNWEj7Q3aoXJzA==
X-Received: by 2002:a63:40c1:: with SMTP id n184mr1765795pga.219.1619148645875; 
 Thu, 22 Apr 2021 20:30:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n23sm3388570pgl.49.2021.04.22.20.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:30:45 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:30:45 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:23:16 PDT (-0700)
Subject: Re: [PATCH v3 1/5] RISC-V: Add EM_RISCV to kexec UAPI header
In-Reply-To: <20210405085712.1953848-2-mick@ics.forth.gr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-kernel@vger.kernel.org, mick@ics.forth.gr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr, ebiederm@xmission.com, kexec@lists.infradead.org
Message-ID: <mhng-891ba63b-523a-470d-9e50-a881b9e3dde1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203048_237892_414957F8 
X-CRM114-Status: GOOD (  20.88  )
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

On Mon, 05 Apr 2021 01:57:08 PDT (-0700), mick@ics.forth.gr wrote:
> Add RISC-V to the list of supported kexec architecturs, we need to
> add the definition early-on so that later patches can use it.
>
> EM_RISCV is 243 as per ELF psABI specification here:
> https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  include/uapi/linux/kexec.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 05669c87a..778dc191c 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -42,6 +42,7 @@
>  #define KEXEC_ARCH_MIPS_LE (10 << 16)
>  #define KEXEC_ARCH_MIPS    ( 8 << 16)
>  #define KEXEC_ARCH_AARCH64 (183 << 16)
> +#define KEXEC_ARCH_RISCV   (243 << 16)
>
>  /* The artificial cap on the number of segments passed to kexec_load. */
>  #define KEXEC_SEGMENT_MAX 16

This is missing the kexec maintainers, who I've added.  I'm happy to 
just take this along with the rest of the patch set, as that's probably 
easiest.  I usually like to get an Ack on this sort of thing, but I'm 
just going to speculate that this isn't controversial and put this on 
riscv/for-next.  LMK if you want me to do something more complicated 
like a shared tag, but I see the arm64 stuff went in via the arm64 tree 
so I'm assuming this is fine.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
