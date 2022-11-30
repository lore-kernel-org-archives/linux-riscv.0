Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E135AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYw21ShmStIdpv2MpBtCR3x2FLegFbxwPSlW5eWDgv0=; b=F8YaxWLb8KC56V
	xsswnLvle6Xcv/0EuXxa4r6wRzSI2CRwvHhbLahZBeGHdTrMko3jIYyS8bkxBtA3h3i072VmJUYJi
	ovcr/vs1kcFTYg/R5MfGzjdX9/dVawKWxd+pG+BGWqmzuTicyvo4lc498Em2cIM7wrK6GEJHdWb2s
	pt6BsiS21ak2lGBiaUL+inzV3iHiD0qvke494JJe7R9mY/1EFiHtjN502O6m50YcehDrXZVYtuDPK
	DExnlT4S5nEzMGNUjtIwVuFvzfdIFhY3yTbR9N9Vb9D5SJm54cKX0D/kYWTKZuId5PDvKjkoqy4Vr
	ANvxvA7I/K5QczSf/1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nu0-00GoEJ-SQ; Wed, 30 Nov 2022 14:17:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ntw-00Gntt-HY
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:17:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id e27so41660693ejc.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 06:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaDP+iXhMdMXbA2fTPRqgFdrvnI5JtTuItHkr817NBc=;
        b=DdiHYrQtn9cdqVF+5CEn1/0EN6LsmkMDP/mvEh5paKVCDHiEonYAQRaC6XoobHBeg6
         +Ba6S3/zzSY2wFNmZHIbD1+Nm8w2Ogit6TGAxxyTqMNPlsjhu2a6pPRWZMvkUlXDTcdW
         /KOHnJxQ19gqepU4FElcHINuYcz4mC9dIyvnYuY1UkDITOsGr731jIRpAFOoNFIWr2Ih
         ARWRZ9ecRY4n3w8kvRlOx2hcrrZVMfGShiGxdILf/p8HJjIsD5sQRVlkwP/KVcbMLtWb
         J5GGaRvyNubuXiwVuyinSus1GNpaGsr8vnizmQXwocOx3agkiDpDp26nynYen/3/5F70
         BtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaDP+iXhMdMXbA2fTPRqgFdrvnI5JtTuItHkr817NBc=;
        b=M89ahqcD86V+T3muktFgcop+l0PDQmTVcJbM3CtU8uZWT+vmb3GXgZZlxfRTyHdrqv
         6+weEnaKoZyK1ND1cCDm5hCNefsF4vHHoMVbAtJPZ3ebY+aUfuCdcE4dC5765GhINhee
         zfl0dyn0UcIcCN8KsL4ATlsTxN7rqM7BowlFR1LGJ39p6/KDe3gqFBhiDVwI9EFBzeYs
         vewOR1iJ0JyxhKmuodkMAj6tNEsRY8ggWwJ7kqH1ZVZQaE6W/fCOkFRcvi108D35f5L5
         Jsr/om6Qtdq1wB6oDWRE7NdDqCVOJUxa/fPTwRk5kaKyOgmu9QwFQJEMS5bW0BZRKbwL
         KPcg==
X-Gm-Message-State: ANoB5pngxTykvz+PHkl4HFnpGNM8C8z1hEPd5tfK4xYsYm74zkdfr3FT
	Ts7VV5YANv46f+Hl8crogSe1A0cZCtLhwQ==
X-Google-Smtp-Source: AA0mqf6HsJpnkRoixQlEHjZ8rHiY9gkuRTNJRsXngln4Y2ywIT+sXbqKrmb30qQ+OOfKT55juWx6aQ==
X-Received: by 2002:a17:906:1713:b0:7a3:fc74:7fb4 with SMTP id c19-20020a170906171300b007a3fc747fb4mr54107097eje.17.1669817820159;
        Wed, 30 Nov 2022 06:17:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b00781d411a63csm680907ejc.151.2022.11.30.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:16:59 -0800 (PST)
Date: Wed, 30 Nov 2022 15:16:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Message-ID: <20221130141658.yed6aurdf6j3fuuk@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-3-heiko@sntech.de>
 <Y4aPNs4clTTSvmF8@spud>
 <4000385.ElGaqSPkdT@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4000385.ElGaqSPkdT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_061728_614565_A60F9699 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 30, 2022 at 03:04:44PM +0100, Heiko St=FCbner wrote:
> Am Mittwoch, 30. November 2022, 00:01:10 CET schrieb Conor Dooley:
> > Woops, I built this commit in isolation and:
> > /stuff/linux/arch/riscv/kernel/kgdb.c:32:32: error: use of undeclared i=
dentifier 'MASK_JALR'
> > DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> >                                ^
> > /stuff/linux/arch/riscv/kernel/kgdb.c:32:20: error: use of undeclared i=
dentifier 'MATCH_JALR'
> > DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> >                    ^
> =

> actually that is patch1's fault, that added the prefixes in the first pla=
ce,
> and I've fixed it there.

I guess I should have done my grepping for patch1's review with only it
checked out...

 git rebase -i -x '<build command line>' <series-base-commit>

is our friend.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
