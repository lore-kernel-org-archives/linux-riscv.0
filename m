Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38652C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOApoZSu3xCN8k1uaZXJXFh6uAhUbCH3DZZlR/qDHp0=; b=iMKh+625lmPLQS
	a5BNSOOAVDuei2fAnKoyzFJF7AR8eEmg0WPxXY4pjIiXHlPOwaB9iL45jdzduUgDtzvz7h6hbL6bv
	dcy5FXgJPN4wz738Xb3ozbWctQ2ct2XyeIOBpNJwCj7bkTsYt2NONG/UWh06c9rAStlgkqcJM0/dT
	g+cT27rVdQlsxtxyJtCOcBjCFoB/L5/fJt6YmGv/LTLxneSzYVRO7J1omFP2MsW6SORc6lfHKoxd0
	NVgj/Lu+szCi0/BXFg0bKCQW0A+jqevsBKE+19fJDtaf+UdEnCGuBKgO2O4vb+NfAI8M5oSIzHubq
	2T2UBazaYWUq4PLbEjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX8e-00GE7t-V2; Fri, 25 Nov 2022 11:45:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX8c-00GE6n-7o
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:44:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id l11so6058117edb.4
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ganGoGk0dGLWUVZJZmO5N8MpSnIzwLlxlJWd5xpG83Q=;
        b=RclqeXPCsvXV295FMJA2FxIFmH1hIIdtE83WJi1sS2G+TBtQqDyYZu42qNcLM3L6v1
         60gjZ9vN9VAt/7rkJkryeuBmRONyL1OJLG4o3NnUlcXE++uqtjTZ+dkgwPVyxTE/YO2K
         RiqNzcS3hLhu/tJeZB7zHbhLzznr/3DQxfMLz4LThA1Bp3HTUe9NpL7v0yrgjfL/qiIe
         Kt1dqqWBm4rvfIVaUPVyjsWq4Ui/4Vmzh863hv163sDvJH3wjCtHaB99VL0dj/PHkLDl
         O9Quf7aao/efSpjhi/xnajZL6cbZQdkZI5EqlIUHkORpad55O/fpRIZGQojRIEoDvYwj
         5xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ganGoGk0dGLWUVZJZmO5N8MpSnIzwLlxlJWd5xpG83Q=;
        b=P/E8QJLKexfb6yKXzQlf01aCpvGSPi/LYqQNLEFkw2i+ThehW6ydQz6OHZMBUL+opv
         PkIe2piVnIDLYXeD+AyUnKeNdYH70r4l+WrU192vgh7an7zGa/7adThJ3BIkKG8y+jsD
         /CjXFOI6G83hsQdDHfvgwSOa4TA5It+r8IxHYPxF2lxIea76d70HXlF9dEzRd4VIljEl
         /3YRkJnnUWtXv23aV4B2vy7Lmoujn0B+PRmHfKesf/UrxLoDQESlzuTkidMFRBeQo+fv
         n7LFg9wt2Nd4ql3fKcK7adZcJYQE/oM/t7F8gw/ZBYoGkBP+CUyVWmTxX8yR4N68tv8E
         pabA==
X-Gm-Message-State: ANoB5pnoibcp6AdxnwcDYHrCs0MDVST5AJiQru/qWXUkR7o/hH+5uTFI
	ijxBfdfaIlDAt1KoywxX/MGQxQ==
X-Google-Smtp-Source: AA0mqf7SeBJN7wr1Q4tACLDGo74k4BsLhAglgzt2jja6Yg+ow1nUgTWXD1+XxUrNqU9Yf/KfD80AVw==
X-Received: by 2002:a05:6402:2318:b0:469:10b2:df98 with SMTP id l24-20020a056402231800b0046910b2df98mr30800385eda.115.1669376696729;
        Fri, 25 Nov 2022 03:44:56 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0078de26f66b9sm1467428ejc.114.2022.11.25.03.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:44:56 -0800 (PST)
Date: Fri, 25 Nov 2022 12:44:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
Message-ID: <20221125114454.yfh2mtctbi3nkud7@kamzik>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/LgZkR1hkblJ8D@spud>
 <4801607.MHq7AAxBmi@diego>
 <Y3/OlKI1jyi0eoCJ@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3/OlKI1jyi0eoCJ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034458_296246_54D4B1B6 
X-CRM114-Status: GOOD (  19.78  )
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

On Thu, Nov 24, 2022 at 08:05:40PM +0000, Conor Dooley wrote:
> On Thu, Nov 24, 2022 at 08:58:41PM +0100, Heiko St=FCbner wrote:
> > Am Donnerstag, 24. November 2022, 20:52:33 CET schrieb Conor Dooley:
> > > On Thu, Nov 24, 2022 at 05:22:01PM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > =

> > > > Introduce ALTERNATIVE_3() macro.
> > > =

> > > Bit perfunctory I think! There's a lovely comment down below that wou=
ld
> > > make for a better commit message if you were to yoink it.
> > > Content looks about what I'd expect to see though.
> > =

> > Also both the comment on the original ALTERNATIVE_2 and the new ALTERNA=
TIVE_3
> > should probably be merged into a single comment explaining this once fo=
r all
> > ALTERNATIVE_x variants.
> > =

> > Especially with the dma stuff, I'm pretty sure we'll get at least an AL=
TERNATIVE_4
> > if not even more ;-) . So we defnitly don't want to repeat this multipl=
e times.
> =

> Oh I can promise you that there'll be a #4 ;)

I took a stab[*] at cleaning up alternative-macros.h a bit in order to
prepare for _3, _4, ..., _42. The idea was to try and find a way to
reduce as much duplication as possible, both in the current code and
in the new macros.

[*] https://lore.kernel.org/all/20221125113959.35328-1-ajones@ventanamicro.=
com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
