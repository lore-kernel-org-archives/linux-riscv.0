Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2688EC25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XxevIPRh2ZuatLZB/ZpA7aRtjHTogJ7rHD8sscMobE=; b=lHVdBuoR50+QJz
	21Ob3QKWHvcVWyW46Jg6O/pVvk/iYyog8ZAOIB62sqpBWC0QLG4amGHE4wZnFCUYKgT7ZQ7rME3N+
	9Zsq8DvErhOcPmPn8/5uOzXnkFZFK4oALylz2rH+FABuVf0NtecE2Y7uasXh2JnibmSSnMbwhNHvE
	iyrHDGyc/59U/e6HMAttOb0XFttLhTGCjOM+Q6tKVrWmQEFbo0eyTICWSDc4ruJTcPTiQrHgetcKs
	RvQSsAsqMFtYFae90tY6reLf2RffBEytyV1onfsGKymTqehzy0O7pBAcE/8c9KJXmUeGYhC1e6bWg
	l4fZv4VHGZLsAYixW20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlIk-00DA1H-1R;
	Wed, 25 Oct 2023 21:20:30 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlIh-00DA0n-2k
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 21:20:29 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6cd1918afb2so118862a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698268827; x=1698873627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4R+fBPz/tYoWNwPb9Pp7jc9YbV1QMHyx6psPQvV2NA=;
        b=FpnCfxBNcleTfheete7H22cUJUmBl7GQWhMrjY1qiSaTok7RMEp+tyf2oFhK0lys8w
         nzGLFv/KxYDgQvDeMJgHL2zMOZhJABfJQcBAt2YyP8M0uGN8te+Idu6epXoqkwhORvcb
         KGfkqTdQPb5BGCgQEzD432P4e3knwAIazbSh9ntHt0M7YriothCVn2MWuf2LdfS1K6gn
         D6PzeNz0Vfe2aoj99/BfgzqHY/ilWdOlvjNX7UCZb8aL5T51rEiF6VB8wG7LBKp+e+L0
         EytN2kgdPkyevdqrUA0KByo/VE/iRxEY2iXEOaXjmAm4iHeYmt5qOHlcEHBf611uqijl
         yr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698268827; x=1698873627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4R+fBPz/tYoWNwPb9Pp7jc9YbV1QMHyx6psPQvV2NA=;
        b=Kso40H8gcer1DXUnG9NaSyVk12DjI69KM/ajNgyaWY0WYvJHJOeSFGK1a7uF1LienF
         iXIa0CRrulV1I8MPLr3KTV9XqxHBBAs6yhTpAbQCjMGXFzGFX4VZY+jT0eraTxquwKXk
         LPhaE68Ldd+fUjOmm/MgswRqFchv2HcTT1FhPpRii7WGqBwAJRKwK79jt7fF0VI8bgWq
         dnUnsJuggSlGpK3St4Wh4rM2AESumjjGjASQK04JOScn7SDh6obvDr/IW5OmQ4qkYIUC
         PNZKpQOlm7JgCkKcBWkRw14rho+mponGe+U+gTdL8eXoH74EqkePpOTgFtN5VsdiB3CX
         kQNQ==
X-Gm-Message-State: AOJu0YxJBW9IDaMKSOc/a5yEcmAcHJe2ZXowqLYCccpjNRIQBS+fhlQv
	gVB2fl/KyLTlQYQTfQm7VnTQug==
X-Google-Smtp-Source: AGHT+IGav5/1dQVNAHhyYvy58dHFfkWIu/JtH4MUc2KdaTCN0BgNu4GrGfs3WwaokFiLCk2KDuCXfg==
X-Received: by 2002:a05:6830:7:b0:6b8:9a3a:ea12 with SMTP id c7-20020a056830000700b006b89a3aea12mr18253103otp.12.1698268827023;
        Wed, 25 Oct 2023 14:20:27 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id r125-20020a4a4e83000000b0057b38a94f38sm166296ooa.12.2023.10.25.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:20:26 -0700 (PDT)
Date: Wed, 25 Oct 2023 14:20:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Wang, Xiao W" <xiao.w.wang@intel.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
Message-ID: <ZTmGl36A3X1UtnNu@ghost>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
 <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <ZTl8gauEst2NGrw6@ghost>
 <059f17e6-e240-40fa-8742-7844ad3b3502@app.fastmail.com>
 <ZTmEkYn1NcUvL58n@ghost>
 <571211a1-470a-43da-a603-fd12a640b7a8@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <571211a1-470a-43da-a603-fd12a640b7a8@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_142027_892383_4D9128E8 
X-CRM114-Status: GOOD (  13.84  )
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

On Wed, Oct 25, 2023 at 11:18:40PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 25, 2023, at 23:11, Charlie Jenkins wrote:
> >
> > Thank you for pointing that out, I had not realized that macro existed.
> > Since riscv keeps NET_IP_ALIGN at 0 it should be expected that
> > ip_fast_csum is only called with 32-bit aligned addresses. I will update
> > the comment and refer to that macro. riscv supports misaligned accesses
> > but there are no guarantees of speed.
> 
> Just to clarify for your comment: riscv gets the default value of '2',
> which is the one that makes the header aligned.
> 
>       Arnd

Oops, typo. I meant to write 2.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
