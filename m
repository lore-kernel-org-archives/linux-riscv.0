Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C2CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48sLDcCJWRd2hLtIwq+rimA5GxmmZRbxeMPcoikDJa8=; b=IFoS501IHfxbKM
	WaFqi41W5w56wILT/iInGrNm3TyOsB2BXqXrIURk8vqU0sMCPyjHRRu9B24ZjuwsVrRjkm8tuR6Py
	zLX390y+DV2F5InXyUqdLTBILTWlwfwNXVHdJLTY+zkjEX9Vr8+AHd3eo+yUTmKW5hqp6GvaXbhqs
	lhlkRqv7QpSbX4YzAsNHMqBupG+ahRR3dUmwTxGeTW+vVcceicN3oSU2W7Lzx0J5wPZm0UBPwGCJI
	a/o5HVmcbCdJT/eTZKpg3q/4rRI3dnDpGR3H6uzHaAS42hLvYr76Yu2GStSZ2Qj11DFvXBs740bfC
	ADIrJ+rAq49SE6VLgXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4YP-0000000Gt0c-0b9M;
	Fri, 29 Mar 2024 05:13:25 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq4YM-0000000GszX-1MlD
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 05:13:23 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-614335f1745so6283737b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 22:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711689199; x=1712293999; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PEpiqzPowyn+Jm6DRSZLkzq3QJrNEIFqLCLs1kU8rzI=;
        b=N1wlAqRa5mmgImQyPdCuquEMUAfGsANfU3IneSHoyPW9gs4XSbHKaqOT2gpCMdYECw
         9FBd3Oj7+nWQcClb16+uriGcKKy4WGVT2QWTXFBJm5rmoBhCQbxEW/XQJPcijMtZGSQb
         wQ4ggOcfA7/J+Rq/UfyKZaynEagD+L6QuyZMrJUosQbVR5/Kr0cr1Zu9kbqFKKKe6RHi
         S2iqhZKnsFHB4e4c/3uOL6rOu1DYNH8x8kwqr256krLwc21iBDy46edoVpbq3ggaTaRN
         rAk3svDNk+KhfCAx3vAVGXICGuBM1voCuwcyQPHf1P9CXg44OucQzFL7TqzGFExTzXO9
         Ns/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711689199; x=1712293999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEpiqzPowyn+Jm6DRSZLkzq3QJrNEIFqLCLs1kU8rzI=;
        b=aRvmFfzzwgz6NMk5GI8WL65RB6F+sbnH0FDdO6DHHuO527w9I6xuOhglXrP53Qxwpi
         6z1NYryukvvFXGzh9EEv0hKrjPGW3yT9KtrQkh/aSwHnXdyWkpQUoSc5GJfCkXsCV/fQ
         gQph+Kqtlp+pPiBtdOndLPeUy38PZeZyrFF2sYntXlQbgsUP1Me9N/Vnx8zXtOvKDEx6
         ls7bDbhVViY0QzPeoePHOTVtl0dCRtP/3hy3jPeQUrMOIt6u/T1HRIrNg55qa+JASeQ4
         cu8E65RdbUniE/ByXWTznYSYZ7XrhFQzMU71Cz+IqSLi4nqNl/FSHLpyTTH8vbaLNU6p
         ZndQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBbhX1oOnjAteFYYmiWSMmsemPQow22+Qd6VpnuwI9c6+MRItQv4G06rl3nzqrn3NFwIfWAX6eOZ3iD2f0EwjTvu5HSNNjP8yVmlo5Ono
X-Gm-Message-State: AOJu0YzBqcCH9/0sBPWUeSezMlXxj5mI/3zxWnuks3WPuf3QNMPuzcU5
	fOZJ2YsDJCU02iG4TeE88Fr7eYRp/3gnpHQuGXp8dfdVJ8jLoKQhRQn9Chlfh3nUwI/B1QyLiyc
	aLEknjqeTjB/4JObpZoYicLyU8T1c6aAfUWpeOg==
X-Google-Smtp-Source: AGHT+IGLN1PwyHLJ6g5mp0jviCkkSbilJ2aTqCWRuUmI56Q5uig7YiHN4eVYWaPbzCmiulMFdD5ghgamQ1GUIWIMF2U=
X-Received: by 2002:a0d:d78f:0:b0:610:e46c:18f6 with SMTP id
 z137-20020a0dd78f000000b00610e46c18f6mr1641447ywd.17.1711689198756; Thu, 28
 Mar 2024 22:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044459.3990638-1-debug@rivosinc.com> <20240329044459.3990638-5-debug@rivosinc.com>
 <e7b0aea6-c03b-4e8b-872a-8f0299ed6467@app.fastmail.com>
In-Reply-To: <e7b0aea6-c03b-4e8b-872a-8f0299ed6467@app.fastmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 28 Mar 2024 22:13:09 -0700
Message-ID: <CAKC1njRaqW9S4moZ-GuCmRw2YO3S_uYO_byNVYarB2yFcn9zMw@mail.gmail.com>
Subject: Re: [PATCH v2 04/27] riscv: zicfiss/zicfilp enumeration
To: "Stefan O'Rear" <sorear@fastmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Mark Brown <broonie@kernel.org>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>, 
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>, Kees Cook <keescook@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, palmer@sifive.com, 
	Conor Dooley <conor@kernel.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	tech-j-ext@lists.risc-v.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, oleg@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, Christian Brauner <brauner@kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>, jerry.shih@sifive.com, hankuan.chen@sifive.com, 
	greentime.hu@sifive.com, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, Samuel Ortiz <sameo@rivosinc.com>, shikemeng@huaweicloud.com, 
	willy@infradead.org, Vincent Chen <vincent.chen@sifive.com>, guoren <guoren@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, songshuaishuai@tinylab.org, 
	Greg Ungerer <gerg@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Baoquan He <bhe@redhat.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Yangyu Chen <cyy@cyyself.name>, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, 
	yunhui cui <cuiyunhui@bytedance.com>, bgray@linux.ibm.com, mpe@ellerman.id.au, 
	baruch@tkos.co.il, Alejandro Colomar <alx@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, revest@chromium.org, josh@joshtriplett.org, 
	shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org, 
	jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_221322_484696_33FF45E6 
X-CRM114-Status: GOOD (  11.72  )
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

> >
> > +        - const: zicfilp
> > +          description:
> > +            The standard Zicfilp extension for enforcing forward edge
> > control-flow
> > +            integrity as ratified in commit 0036ff2 of riscv-cfi.
> > +
> > +        - const: zicfiss
> > +          description:
> > +            The standard Zicfiss extension for enforcing backward edge
> > control-flow
> > +            integrity as ratified in commit 0036ff2 of riscv-cfi.
> > +
>
> Neither of these extensions is currently ratified (the public review
> period started 15 hours ago) and the git hashes are unlikely to be
> correct for the ratified version.

Noted will fix the text in the next series.

>
> -s
>
> >          - const: zicntr
> >            description:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
