Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E0BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKTyEFqfin2Ge6pr2hGO6rPkWWnO5/ra6W19MbffC5o=; b=gVWgL5SDg7rfCI
	RDm28p9qhvyWjnzQ4ppJB31/SKTZEtumI5qXW1ib09q7KKqoSR88tW2oewx5SpKUH3fDw53uBOKNw
	G0K2ZiiRGDuwcwwO/OyLkKq0XrYh+hVHFVloyJWikCpfgDkrAoPMxlQJRjxe8my4O44Bhf3cQIopR
	TYjg7+mmPCP4SujRQAx/I4kwihTAzqOqT6gI/F2WIJQYn957kwX0ZFolT3GpWjBEZbVPKsyE3+qSI
	G/Z20jCUjB28xD2jlJNW4epY/KGcHBB/kAixfZHSnjnmjKdwcyseQwNT1JQebkDYlQt6464J3Of6a
	KhrzAKyn1daciI35rXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYzY-000EXq-AJ; Wed, 13 Apr 2022 09:08:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYzU-000EVl-SA
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:08:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m14so1643693wrb.6
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4zB36RMxDLunDbuld3ECmBOvmX9u3/GDy+FlEXNdz0=;
 b=WBv+T+YkswybocW2g4FPyJnWFtpRidF6EP2r6rxboU8nbVYzGUqoMl8jJO/hBntOLj
 GAZ4kDsNpSWpNJtm7UXMM/i08CeaxaLnYAr3KR4e5JNGeOQwskj3xjlclb+vvoG7jL0S
 AAZBPNwh96CNpWCb4BC++xFjtGlW97PMQ5oPHr6QmcZoi4O7UsaV6T2dqb5hA+Q3takV
 Z9ZXfS5qzKsFpCgAdFht/JYMzRtsacs/2nAMasI9HCXhSwjBVNB5RpW8EW3zSx8yuDdA
 jDj/gAVfDeeq03a/YsvT0A0b3BnaN4g94s0ACILcuCQxruWVvUXc5YbO4Mpsh0rCRKBT
 jK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4zB36RMxDLunDbuld3ECmBOvmX9u3/GDy+FlEXNdz0=;
 b=wUXWLSWM3LMChzRZVMGLSpGMbMi/JSYCxWzm/00R2ymnXcskoCIzAJ4hh/V7k1MJg1
 nU6m0g5CK89ucQkWtsGapqbT2BT5baXMPy1lXDXZpXq224ES5Bc/R5RK0sAD0o9V3ZSH
 FSDiJmf2+3jAlwWSfhpHdj7x6JDPSlgDipR3IW9keD+lzW4gWYbxd+JWzBIgy6qan74z
 qtqehiBx3JwwAyNPLjVckzqCe/lWjIPolbhdG/g+KSR3fEtGINiJUxbg49RZDigspy3Q
 BdXP33ewSIgy+SD0Ehcf6kcWaytfZIh7t2m2Mga8UObBCDcTdpsx6RSNBd/hvbakOGJc
 InjA==
X-Gm-Message-State: AOAM5304sSifgAhNCIUSdJxJmseLUK+fzoZQLlGB18/yEBLKHZOFBeuX
 Lq0Tn1psp2CCZNnLnBlXLsToW/KNfyAP097S7Vi7wg==
X-Google-Smtp-Source: ABdhPJxphYtH1eV30Zzzy4z1n3y2xcF+U98AkSimcSUucdFFV8yGUwAx4BgW3gX5+6fnO1yMv0gpGqwNaoP7rRZX1Xc=
X-Received: by 2002:a05:6000:18e:b0:207:a221:302c with SMTP id
 p14-20020a056000018e00b00207a221302cmr14327494wrx.120.1649840923258; Wed, 13
 Apr 2022 02:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-6-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-6-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:08:31 +0200
Message-ID: <CAAeLtUDOhmUmp+XODm9Y1DFHKPEMXbH018qYODBWMd3gOFg-fg@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] riscv: extend concatenated alternatives-lines to
 the same length
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020844_933990_74B50192 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Apr 2022 at 05:03, Heiko Stuebner <heiko@sntech.de> wrote:
>
> ALT_NEW_CONTENT already uses same-length assembler lines, so
> extend this to the other elements as well.
>
> This makes it more readable when these elements need to be extended
> in the future.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
