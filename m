Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8676C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aJAS1b+22Ip546LtDPvLBxaUpmqWFbOM6o9zcKXfK8=; b=cjo3H//WsSUZqK
	8q9YqxegzOytTMDZqYrzAntEaYIyYRSQJzN0WW6LiSLLQc9G3rhVH+YlCr/HCZNtsXZkpW6NAYkYp
	OiyxswxN5AowoPEu6OPrgtELFgNDZC+J1hdfvBPySUGPVK9lPccb4MbRPb3FszsoF7MS0H6eD5JJo
	UqiPH1jQh272XbJwW1NAlYlTMVsgJf6sfzpljC93Ci1OduTcwrBiQ62jOKPohf6aoUlaoVVQIpZUC
	xax5tbRb/cg+kWufZWpI/5wsuz1XMhvS2aXOnJ1LK3s4fuoWNXE6Jl9qS7mAriBWMyR/QO7ocGVet
	r4wEhxN3ZCtCgQiSjFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ7A-000HIb-3H; Wed, 13 Apr 2022 09:16:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ76-000HGk-JB
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:16:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id t1so1680131wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmMHfNDqmWT+IUeU6nTPulhYOt9dlaLf/6nhn3P9z6c=;
 b=LgMS1ytDnor9k2mSXVtTWfOejXMB+j6RFAIVanxvx0waSAmqKstgr9lVf5HzxOsu9T
 R4sx/1uwCbYAbZJAmApJTSULweWSmsDNKoW22KB79k2QfqE7choXkusPNPBoVil6PKeo
 bsv/pQGuX8i6083seX2d3VLgN1i7HTrNchOVsi8U2QXySCAEosVDIZvfCALg59Grx97j
 XyyUpYkod4ikUIT8tV5HhrwzAKMZ/ea/Krez0uVqFWZMyofYw+h2AaerqTRfn+36Cmy0
 qWdTHvOW7fzZZP2/C3dAjsZphdnLj729lYmJSJ6+mBJa/A/rxUPzIY/Y3KhyT9Fkerru
 lNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmMHfNDqmWT+IUeU6nTPulhYOt9dlaLf/6nhn3P9z6c=;
 b=o5Zz8rQxD0S6KilVL1h4sxHhH8KAqTr+URThzfT6ELd48dPHQT9kWfqKqHAmSnLF8Q
 MWD7Vr+ECq9wNEKaJW9EFJrTnWTJ4HnRdyAEVRvVhUfa17I7uebJr3ihUI/EXYeQiBX6
 P1x0Ce0xe7ctQsacxRmMPfP4Pp2Zb2YZ6KiSIJhkkC/Oq2Qbi2/hXqBgyqAf6S0teB16
 uZUDtJlXz8AkldXK4hrOZnB06HGAgYX76IDW3gRHmORjLi4Q3QKr5KNJf5zQZxqTOla9
 fzfPAwSxiIVgUpGOyDU20BE4AbnQ3VMe1xWSa/Fk8zjwVZQvdT874g1cenfUJkUlo9w4
 Y6Lw==
X-Gm-Message-State: AOAM530pBovorAJhEomXLkl+nJATd8ggRZxFZmUkJdO9h9G6XodqR6LU
 DNdCI0AQro4N2FZMVEDDs7W1/ro5hIV92raedBrrjA==
X-Google-Smtp-Source: ABdhPJzC3sTpBpTVMWT+mrZgW9ofHkoe/zoI1cA0bUmokNa8xravvdpAg7mnBB+ymNOU41wbh1ge+VLELh6KDSmZIuI=
X-Received: by 2002:a05:6000:18e:b0:207:a221:302c with SMTP id
 p14-20020a056000018e00b00207a221302cmr14352522wrx.120.1649841393835; Wed, 13
 Apr 2022 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-12-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-12-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:16:22 +0200
Message-ID: <CAAeLtUDytpsYOcV1B1co6ufM_y7JdwrAZcN1HS9=ATyUiCmyZQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] riscv: don't use global static vars to store
 alternative data
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
X-CRM114-CacheID: sfid-20220413_021636_674130_C9D085BC 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, 13 Apr 2022 at 05:05, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Right now the code uses a global struct to store vendor-ids
> and another global variable to store the vendor-patch-function.
>
> There exist specific cases where we'll need to patch the kernel
> at an even earlier stage, where trying to write to a static
> variable might actually result in hangs.
>
> Also collecting the vendor-information consists of 3 sbi-ecalls
> (or csr-reads) which is pretty negligible in the context of
> booting a kernel.
>
> So rework the code to not rely on static variables and instead
> collect the vendor-information when a round of alternatives is
> to be applied.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
