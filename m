Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE8AC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:40:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9A361493
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9A361493
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7L3Wuvfmbg9BdTzLttCCANfwuq3RrnOx5gZMcs9bZCQ=; b=bnuIPW2A1qY1k8
	L95eASR3jQNUeU5h7JBbl2xC/IdDcyAoklZjAq/V6BDxcZzV1AD+AjItCIDRi1Hc2owyCb3ZS6FxX
	cjrNtzMOJRr9KfsZNdSt7cPW6NSKHr+O8Vb1nFuijWEIbZO98lWTZYudGUnphXp+IEPwLO7JB9lM5
	sfVNrvfGf29BlNfasb89pWQ5xaYF4VN5Z6nXAu5YVlCvprDmPNw+YXeDMkxym4IeO7NVXPG6fc9W9
	hgOMg9ZZtzpPuSRoN660d+8esNRrf9aoUp6y8zudq/oSYmroY6Zz4/T+3zNvgIpu1kClywfQWYAWB
	YAAgTxKoFdhxVzrZoXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UFv-00H76E-EU; Thu, 08 Jul 2021 13:39:55 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UFr-00H74Q-Vg
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 13:39:53 +0000
Received: by mail-yb1-xb31.google.com with SMTP id i4so9022032ybe.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wUfpTJEM5/D8ctmlDv+SG01e+UeWNEeVLdWzBRW2AAg=;
 b=cV6KerYNHeTtem3QqcymyHW3Xuz7IFbIAc//FO8ZB+ufC9KgIxfG+xQeEGGx7eMV1w
 m22czX63olHy78ITqFqWHJbvX+ISKtSArYHFeyCZTyZ1wiQGbIC1YeEiv4YZ74Ogyuq+
 Tv5EXGAsTTEAyJe0ESkxIq3hxpug6gi4s9X4xOOrSPbdf5m7PRhZQsB2WoOACCjh8UtQ
 V5O0sW2Cj92Lk8Rkak5LzF5JoHEz0hRLzSZ6407bOncttNjXwueRnB4sDtxFVYHjvLGM
 Ic4UHr0o2e6E9o6f56XSGA3NFYjpPlaF+hGgGkHhE2v8XSjz9sW0SWQfDx8sZWqRzkHd
 keDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUfpTJEM5/D8ctmlDv+SG01e+UeWNEeVLdWzBRW2AAg=;
 b=JQ4Q54aG+lQpLLKOaUDkWijwVQ7KQQfgI4pi01GmsBMkusnM4Ot6e4+eVQhdp8ob6U
 Mhj35KNknbVrP1rpHnwcM6mSfyCbeOQUY2CKglD/sEA3oPagn1rpg3DXvDaWMvKYoSSB
 UpSlib+Y1K9nTO68AywgEbO9lqkHiN5BBr2DOSe0pWnYleM3Q+SOizcKu81f/gDdLE2A
 eq5GZAaVGnWE3uzF1va5q8vlBZV5wVgOC+Sja17TVSFzGz+0veyPbEgD9GKbCjYTZaYy
 vCblzqqnVEXPZBJWOzG8+wtIyIiFKkL/WcK9npj6HLrBQ3UHaB4lOxloGWTvIQ6TcJEC
 kCRQ==
X-Gm-Message-State: AOAM531TDA3bGc/+l7PPaJ6qwy1gBZ3KnN1/L4joQ8eVQcx9MPrtYfQQ
 r1M1dwvqqxYzBMVPqwlf/YJAzVOzulLUTheqDQU6uzLg
X-Google-Smtp-Source: ABdhPJw3HWI7ivTZ45Cg5T487tJ+w2MNpY+Xj0x97C9Eih+AkDvJ+FVMwWgSTrSsFYacg1mP90eYdNcC+lCBoRlP1vc=
X-Received: by 2002:a25:df11:: with SMTP id w17mr38849657ybg.314.1625751591298; 
 Thu, 08 Jul 2021 06:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210616062739.398790-1-bmeng.cn@gmail.com>
In-Reply-To: <20210616062739.398790-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 21:39:40 +0800
Message-ID: <CAEUhbmWXO+kHTmQEggjcyyqpQaLwVFeu2ueos+a4WN=P34Vwrg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: microchip: Define hart clocks
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_063952_061055_AF726490 
X-CRM114-Status: GOOD (  11.20  )
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

On Wed, Jun 16, 2021 at 2:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Declare that each hart in the DT is clocked by <&clkcfg 0>.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
> Similar to https://patchwork.kernel.org/project/linux-riscv/patch/1592308864-30205-3-git-send-email-yash.shah@sifive.com/,
> this adds the same <clock> property to PolarFire SoC CPU nodes so that we can
> calculate the running frequency of the hart.
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>

Ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
