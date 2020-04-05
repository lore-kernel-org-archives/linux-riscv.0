Return-Path: <SRS0=yTIg=5V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D212CC2BA17
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7DE420672
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mt3+Qt0p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qy0QItI/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7DE420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H+0oq6gi0wf3iq8XzzSoBVpcUbwLNgP9dCzzwQG51v8=; b=Mt3+Qt0pabLZnOIGTldQQVeqA
	TgSX1xdHSLZXw1p5vsZ8gagpO8KO3WX0TRVPuqkp9KwJaecWVQ9xIttiuNarwx90mHbFQS9o1FP3/
	2akNKQTcZP6gP/2tY0mdC1kn48Cn5how1iuhn5OgCoekYwhDhnbBU2gjnvI8zk4lPp8tWPyvMyaeO
	yPHDmxODxa/U6j/oJlYBvE11i5asWs075guOKjnD3gfxq0Tkp6krObwfeoz/4N1wtGceJy28iLi1M
	gtfSsbhdWIqaiwsd3XdHSlMa8zy54d6ivVLnSlWbUB66YQHPV+ggQCRo7sQ+CZuzq46ShVR1DyW+G
	sc0ouaY2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL6OY-00041j-7R; Sun, 05 Apr 2020 14:37:06 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL6OW-000417-2S
 for linux-riscv@lists.infradead.org; Sun, 05 Apr 2020 14:37:05 +0000
Received: by mail-yb1-xb42.google.com with SMTP id n2so7275126ybg.4
 for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2020 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+0oq6gi0wf3iq8XzzSoBVpcUbwLNgP9dCzzwQG51v8=;
 b=Qy0QItI/Sxccq8Mx6NyTNju0X63Ern+3yjPAQzPZ3PZnd5zwCCU73bRsjl8J3KjMPK
 +ksBj+1poYsE1qaKzkXWwjGu/t6HMYFh78NpvlNWNoxQcBnHkJMMtzBrRcbLcKu+Uiue
 DFIM7Oi0kjRjIc9nP1OYGNP32mJYulYNkJY05GncZ17Bmxy/GBzEIVgEPjPiYhbEAm8z
 D+gE1Zuzolkuhsj6iwpHOoHFO2SHX79F4EzpkX6vM8Nt7KwFo0gavGCUij2B3rndq6Zo
 t6mo+wlQNzu8nUtYdIfuuUA80XkWGDTCLF1W7PQ7vHD71yFlEWemoU2c7n1LjAYUPLLr
 6fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+0oq6gi0wf3iq8XzzSoBVpcUbwLNgP9dCzzwQG51v8=;
 b=i/wdJC2YYKeRY0EkRp/10oDbP0tPA4LUri3w16j4DNlAAmAd9ubvZb9VjHneNd2sDC
 BsMBdfp40zgWvfl5oZFdl/QizMFAJovjWWUqZewD+8tI9R5FlGh+/RzMT82qJKZdC047
 HvSVa+wuoq6g4tfc0Nh2x8X+fZnARBNJ1UrVixNzfJsfida8+oYc2RTL04P7WD2dI96A
 sybLapczJBNtm1q7dUs4kpZYEFe7X6eVo6csUeDoObuFf2a9w3hepGL92kT+NixCrQPz
 56UdIasciIM42MIohnz5J9B6AZtu4ZzcZopHmj0yqs3St4ZI+BjZWodnKSsdTmxPsXvp
 B5Ig==
X-Gm-Message-State: AGi0PuaVmd2TBHBTjEbKGaCBeGJD9oPed1WT3VaKqfBgfSLzxp3udcbX
 07To49swXVc/oCmhnHg7FcY5SdQOcaRfBRKM+gA=
X-Google-Smtp-Source: APiQypIZ0P+jq5CeAviX1igg1e/s/YixfBJUfL7aJ2yu+ryeRm83nd3f9MCaMX4yJ/auCG4qVzendli5XOUEhd4fg0E=
X-Received: by 2002:a25:5e03:: with SMTP id s3mr30139069ybb.203.1586097421687; 
 Sun, 05 Apr 2020 07:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200318011144.91532-1-atish.patra@wdc.com>
 <20200318011144.91532-2-atish.patra@wdc.com>
In-Reply-To: <20200318011144.91532-2-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Apr 2020 22:36:50 +0800
Message-ID: <CAEUhbmW3tkOxu99VHhMCOSFoonp7Z9TuNsN22JBhYT7a+2vk8A@mail.gmail.com>
Subject: Re: [PATCH v11 01/11] RISC-V: Mark existing SBI as 0.1 SBI.
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_073704_118824_70EB09FF 
X-CRM114-Status: GOOD (  10.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 9:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the new SBI specification, current SBI implementation version
> is defined as 0.1 and will be removed/replaced in future. Each of the
> function call in 0.1 is defined as a separate extension which makes
> easier to replace them one at a time.
>
> Rename existing implementation to reflect that. This patch is just
> a preparatory patch for SBI v0.2 and doesn't introduce any functional
> changes.
>

nits: remove the ending period in the commit title

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/sbi.h | 41 +++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 19 deletions(-)

[snip]

Other than that,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

