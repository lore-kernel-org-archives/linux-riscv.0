Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B5C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 19:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tE/reNco0V2M6P787iCz7UOfGqpCmqYRSdKme2eEQXI=; b=u4IOwIHyoImnvY
	ui6nW1C7ULAzuyZ00MyDk0gp678aPvp/CKfYRIVK8DKeSnuPUdx59Ngx/a/KVJ9R1mIW04kf8Itvc
	nXiIhGB5xbA0NxOdE6iw4O0VLxkzDG8CQB+rkFyx0aptDl7556ixy3BLXXfJ6p+3gOzgyCURi8aKP
	Y6vuUrP4wmaLw66HFzea03BuK1+A4ngxbpdjVxyeiE9e8mB9OvV2n2kWtzOx02HVNLLpvJYhu/NC6
	ahBBnUYdae9/JD0bQD99xwkyKoTlz+u5fbaAti0awMORJXEBrmIggf9IwMDAXAH8IDokTOO4xL2Y1
	G6zmHYR/JrCrUbnxk9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oorHt-008Rm7-8o; Sat, 29 Oct 2022 19:14:33 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oorHr-008RkE-2W
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 19:14:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y14so20333965ejd.9
        for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 12:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AJRIdsMw/IOATrytnmVavgGTGfe9xVPXjP+iBSme7yU=;
        b=EQiTJUYjRkrYfC1hDKqfmlKYDk13GZOfknnLeRcwKl12UuZsoQDMLOzMR72KnGAY/V
         LWbDk+Np2vAp6n638Q0pkyMSSycx3KcyywNuuhlKZ16UESJZVhrbqOveuKBdF593Vvc8
         hwmLXGgn6YDsd2ZyqaaP9JqJ5tJsogdluGr4IHv876tDDkVzuwnwFUZMlThsAIenFA5Z
         Z832cHjIRZq3u2zo0YmTqpTpwKgrM0yw2Qxr/iZY4yvT5fp1/r3TNZMuyJ4zGN4RM/t8
         GCx/ucQgaEZ9cb/lFVp3X82zytiS5aAurpGV2rxz+djYTx/QlGOF0YrvIXRwYS4deJDf
         upTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJRIdsMw/IOATrytnmVavgGTGfe9xVPXjP+iBSme7yU=;
        b=oKNdvzQa6EbHrPK0pc8mReDi1Yfv359lv09YEXKvaR6YRruhg2Ef7vJ62ZUvNRqxhh
         1fznWX48sAqTb78gKwqaK+1bSdPgT8USzblaGGY++Kur6DQ+GXPGAOCdABe5IfqQ5ZwI
         ETBB4gSZB+gFl+bUHkBnC1LBVsj58EID9dEREdBVeKKwkC6snA+DsKqawQo3yxEJKkJw
         t0QurlggmQT5tCIoeR7uZ48qdp/2Bk4191KFHQYqbWwwkSVoma1nEmMZSfXrUyI595wX
         RBfj1+K0MrLA1j2K5DdlQbdyMjuA3cgyfrXMwXkuaE7Du8Qmzu7etqFuc7pwYgke8tEV
         4Icg==
X-Gm-Message-State: ACrzQf3956cflPZy1FgnkNb3jOF+29+0Thg4m+smmLcL2N6aIAycc/DB
	gvjwudNVq2zLkQaWxLAi8sAbP7QRvXPfHK3z4mY=
X-Google-Smtp-Source: AMsMyM5SayRe8eI5BmOIfBcPwMVf1RiS3yjxDSbTADPEcsw84802zGEC7OlnAiyqYT9YXCe+QIOgNcTI416kZVLx2Rg=
X-Received: by 2002:a17:907:270b:b0:7ad:ae01:e0d9 with SMTP id
 w11-20020a170907270b00b007adae01e0d9mr4392845ejk.196.1667070868665; Sat, 29
 Oct 2022 12:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJF2gTQn+6pTjuiGf-febHhDHjVeJ78Zdywd+EkteeO0MEUGaw@mail.gmail.com>
In-Reply-To: <CAJF2gTQn+6pTjuiGf-febHhDHjVeJ78Zdywd+EkteeO0MEUGaw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 29 Oct 2022 20:14:01 +0100
Message-ID: <CA+V-a8ugVeUB5qCG0CtTZHr43WXqv13-GBLRG9X1n_62LtJ4Aw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_121431_144625_09778A3F 
X-CRM114-Status: UNSURE (   9.20  )
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

Hi Guo,

On Sat, Oct 29, 2022 at 5:26 AM Guo Ren <guoren@kernel.org> wrote:
>
> This should combine with the previous one, which makes the patch complete.
>
For easier review purposes we tend to have separate patches for SoC
and the board on ARM/64 which is what I have followed here. If you
insist I can merge this along with the SoC DTSI patch.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
