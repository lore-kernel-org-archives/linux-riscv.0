Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B9CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQqxYkltt7pEUrr9Tq64fyaiDooTIx51lDIVyokE+sY=; b=S8ifRICAC0Uu0k
	EhVnx/33qy0dRFllNEY20Hw7ddmr/JDOEbiqfK5owpfWVZyE7w1BwKgPj6beSvXipRbBDDZ+Jw0j7
	6jCfDQLFmuHoSG9gYYxi+hdmKyDnfc0qZmAA20U8yVN7Giv6aieWFVelHuM9YdB4dQJTaPo7B/oB6
	yWO2JpP86JN/KjTk0vgW/OL3QlYbRqkXQH+sr12iPepKq47YRHfJwm/iqsXVxkUNd3ToBXBNjUaap
	59ivrQDHGGh4PJ1Of1L30PMscc7PDawY8mueW0QpQ7noQFy8K3ycrBHwtgg+ankgky5tUKJXyjC5p
	ZXUYM6WJAtVt2uAfIZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtEtO-00FoY4-0X;
	Wed, 18 Oct 2023 22:19:54 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtEtJ-00FoX8-1u
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 22:19:52 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d0f945893so1462726d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697667587; x=1698272387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jRC9HVva9g3R+13NnFT9VqaHyccZUivRNg5/IFJX6s=;
        b=wVBa4NX7ZjtD4a2vDsfCzCA+b5XcfQfCkDnAlmOEXWlWRRO8IZw0T+ivYQCkqihQpW
         vEx2UfVT23aju1EZERZi2irgozlAIoSGSGBqUxEJQ44tEClYQA6ftr0a4cWhFHYTPKHK
         3EO0q6+vSZmlhostsXm+fCml5PmUMJGxSGSDU1pgzCpE6bfCaJFhIAOe7H7bzYy2urGa
         Q99zotcSkVXWsQqycm7l8AFk67CohaUrp4XH0g5FgfufQAbgUn+uP4LK4d2LgRKFR4S2
         hNHK8JhznJKEzea7Vz1FRKVtyk14JOuKRQVDzrVsTYIulZDPaxhj5fhX6H5DD+DmCCyZ
         uidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697667587; x=1698272387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jRC9HVva9g3R+13NnFT9VqaHyccZUivRNg5/IFJX6s=;
        b=X9NccXtSOSWQi2K0y3OiXYi6aNFwCInxQKriXUb1u2UNZ8PE6qDWGgvtwdpuEC5Zmc
         YhrJ+ES0PJVkXhP+ek3Tv/T2DeLDqcABF7eW18V1ACQLCpFj3f6GzSsuEC3bXTCwHH+9
         IspOijTTYHGal1qShWaP198byw+HdurB2sr3d7qwOvfwGvDJN6FB3VgmcofiKrkbG3zg
         gbQJjwV9oiFt1SDB4khmlO+BoBeBQHi2eVNOSND5RWjVVEUuMGJXO6cx7XTDQSMcu1B7
         vD6KTjPXULx4dRlBwvU6cEE//i9ebpRNABOqo1e+njYi0W40Z3MPMx7u6gsZ3vX/sJ4x
         OdzA==
X-Gm-Message-State: AOJu0YzljJBNuq8+vflcBd1GnTQ9oyqrwUEdxiXpNVxuuWzEOedmF/Ee
	cSu2bw5e5lCQ0fXZh+ZBSBotXw==
X-Google-Smtp-Source: AGHT+IEEmnCxAAe9vHxUiqgxlAvnjdO1EUng0/cO66uNrmeaXVf9bLQ/iB2o960SVloWr87MMFxH8Q==
X-Received: by 2002:a0c:dd92:0:b0:65b:12bb:56cb with SMTP id v18-20020a0cdd92000000b0065b12bb56cbmr319625qvk.12.1697667587161;
        Wed, 18 Oct 2023 15:19:47 -0700 (PDT)
Received: from ghost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id da12-20020a05621408cc00b0064c9f754794sm280752qvb.86.2023.10.18.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 15:19:46 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:19:43 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 1/2] riscv: Add remaining module relocations
Message-ID: <ZTBZ/0Wfz/1oBwrl@ghost>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231017-module_relocations-v4-1-937f5ef316f0@rivosinc.com>
 <871qdr938h.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qdr938h.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_151949_631717_9A2C8B4D 
X-CRM114-Status: GOOD (  10.49  )
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

On Wed, Oct 18, 2023 at 08:47:58PM +0200, Andreas Schwab wrote:
> On Okt 17 2023, Charlie Jenkins wrote:
> 
> > +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
> > +{
> > +	*(u8 *)location = (*location - ((u8)v & 0x3F)) & 0x3F;
> 
> I think that should use *(u8*) on both sides.

Yep, thank you.

- Charlie

> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
