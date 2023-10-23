Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A157C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oI6iNn6u6joKyyG9WMDK0KNzsu2PwgQDNquDG0d8fKw=; b=YT8hrZI4TW3gzA
	QCOX7iVAiEHIJhmK0DTl/qhKoCGkm9r9BACxRVbeINM24qyLx7S8I7nga3yvg71ZnfVMN/cSF+Z3B
	o968FGYIp1O53a2rp1xbuKz/euHLg13AGx7mOMwIZ46sKwXUxOYwZcSULb5i1CDEvn3cyspDfwzWc
	IUdzv85v0RVkD68CtaQyIi0nASSSe1giZe31rY+OskFxIm1NHV6e0xJSWsL351H6qV42fNWqrj4w3
	0YtGdKrlVjQWkTO1UA7FljLWk3eMnwGtGqNDEtSss6b9Z3dKMOqRn2iJXmRHVmhL934KEp4Ofe4Xx
	60EBoiKMhiaPR2tMkfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurif-006ymr-04;
	Mon, 23 Oct 2023 09:59:33 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quric-006ylB-2h
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 09:59:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso4624470a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698055167; x=1698659967; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2RqADPHi/ODAXFTyOZSWwkmYe5FsXVHIx8g7uPzN3k=;
        b=EGmKknYQ8YGxddncyBaIOCXqqsmlxyD8K5EwmcK9UA0t7ZD+n6cQl0lIoQ7HrlU0WZ
         g5WHKdCJZuqPjPmxkgJyqF8JEMH5zeHwLrG8EvFfvcZxdu6AKqNgQ83Tl8lnNNqv3Xhc
         N8HFslsTVuNcLY/DCMqP/mNYteh78CDRbDzn/SnlGsIK0pFfdyCcIHDkA52zbEnHy3sz
         FhRrUycsHo1WMx4Xj6QCjgotDOzMYLPDGffRZxS/j3Vgi/3oWMtcLneteWk5pLE0stFO
         tnB1GqfDLvf2yj+DlV8UO6c2L3cRwLs3owHIxExPfbXkvIlZhwU9PxQbp0Nsd0SQ5E6r
         wgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055167; x=1698659967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2RqADPHi/ODAXFTyOZSWwkmYe5FsXVHIx8g7uPzN3k=;
        b=Xz5AKLixONBd76SCYLrAPZ4vOHtPTrjtlUU3/GF2KkEb2EGtUt4EIF0S9hpmJAvIJJ
         cUDaIgsBGF4+AnfpKSwyqPWCYBQjzHYdB3tDLZxnttdDyJRhvfv3aa6cKSbjxy7xQz3q
         wQT4herSq24iGFgb0M8VYvUG46vVfAL6Bs3Mm3DP8eMck3SPvcA+QF5sXEtcJQXJppAE
         zd7CoYsAMlpId+slRWFXErXfZTE6hPyPcKfYJc78axAA2krDh1rNBpK1lB4FRKcbHuY+
         4mvflLZFxBtfqP0WzTWDAuTwGGUENnovaeuzp8ZAKf2ub/HNq1ga7zwu4HGWSKl8F8Yq
         IVSA==
X-Gm-Message-State: AOJu0YyPXyGuzdl5EEB6/qaVlTIz88rox+E4j4gOtswag+TBvWi2/FEy
	AHwy3ZzymrBNBTLSxYqoJTdR9Q==
X-Google-Smtp-Source: AGHT+IEaFDXbVnpKg4vFgDf/2pwx6Ih0ZQZiABFfnw7I7V0bf3GiPKkismdRN7VeOpN7PH5sK8Co7w==
X-Received: by 2002:a05:6402:51cf:b0:53e:4cd9:2df6 with SMTP id r15-20020a05640251cf00b0053e4cd92df6mr7118888edd.25.1698055167819;
        Mon, 23 Oct 2023 02:59:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7d6c7000000b0053ebafe7a60sm6153661edr.59.2023.10.23.02.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:59:27 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:59:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] riscv: use ".L" local labels in assembly when
 applicable
Message-ID: <20231023-8397e25545716f7f168e9007@orel>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004143054.482091-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025930_876923_1BAD21C8 
X-CRM114-Status: GOOD (  10.87  )
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

On Wed, Oct 04, 2023 at 04:30:50PM +0200, Cl=E9ment L=E9ger wrote:
> For the sake of coherency, use local labels in assembly when
> applicable. This also avoid kprobes being confused when applying a
> kprobe since the size of function is computed by checking where the
> next visible symbol is located. This might end up in computing some
> function size to be way shorter than expected and thus failing to apply
> kprobes to the specified offset.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S  | 10 +++----
>  arch/riscv/kernel/head.S   | 18 ++++++-------
>  arch/riscv/kernel/mcount.S | 10 +++----
>  arch/riscv/lib/memmove.S   | 54 +++++++++++++++++++-------------------
>  4 files changed, 46 insertions(+), 46 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
