Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66843C433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 08:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183CD23975
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 08:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 183CD23975
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2dIAD6jHRMK0U2fOoHGUj+myafQ01rcY41l18Fr00Jg=; b=iZ9MUmZtGfb8O1143N72xymVs
	QzH9xiRgYhXudCGHVsEHFSrSxX9rcXTig/4KBsTT7Ne5Ij4f9DpET2CmD2ScPaLDBhifDa8YdTfJd
	VAI14qSGVAKowYxqZ6q0o0qDDXOuel2qUPzrHmv9RMYIDcziUjeMwQODD18caDox3xzFsvlKSluPK
	eM1LNbREJ5faZHFxny6Gt4OkR/YayFtx4726Hr/eGCHOCpz6x9QyHRyV1gEj/zrpBoVhlcJUCZybJ
	fVCPWL6nTVch7EKxYBuymlYv7SYRH7cjktgsQGB87HIV+VjF/uIOGDAVinQcxqQhvxwXE89bGQUZ+
	S1+r87hmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2VHh-0003SM-RH; Thu, 21 Jan 2021 08:25:41 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2VHe-0003RQ-H0
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 08:25:40 +0000
Received: by mail-lj1-x236.google.com with SMTP id 3so1517272ljc.4
 for <linux-riscv@lists.infradead.org>; Thu, 21 Jan 2021 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpwN5C2RXaQ8dp8IACeDHHRkP2r9P2ksf6c27smpuuM=;
 b=wroXOgRGxvgAdh6XmUxeT1ttxKWOVaMvdFZFJQhBT0c/U9vLbK59i1pjwWkCPPHbg3
 SENK8j5MT0JcKlASUhH3kyxx8iJk/nKGAIv7Z5lmpDahyFwYYXBDV0n2c0UbfMR82Xcy
 ku9TDQL33szLi4WYj9YLssJvsGby+3lfVcR+zNbc7Tmg7E+nwQDHgC6205EkNdf2yaHy
 9e8+ZBbVwFlfE6qeov941L7wHH+odvQzdIPmnzM+TuecJXsExCQ2QDHSRci4E1CJLBjt
 N48KkQJHFFAsugDck4kACIF0hWAHpRW3mXW9OyZk4Qv0TvTsZIKSVcKlz6o8KizAMl8V
 We0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpwN5C2RXaQ8dp8IACeDHHRkP2r9P2ksf6c27smpuuM=;
 b=F3Xzi41HP9uEeG3KolagS19bldBQFHUpqCUF36JLlURzeorlpSdb39ke7k2eom5a2c
 e5E1HWmK0qTNMQj81/SJ5jVgRpe4KmDjF6CincBF50++b2nm+fHx7jOxtHdqOc8a7c1s
 JZjiqOM4mZplqS1O/P3Ee6jEshcyz2xYfew2f/zVwynudcFwCQgNEnPDL0J44a/WHbVR
 gG5HS21GDFEeO89IAg4k0inBMVi+h7u/3fpccCwPGf6J17yoEeX285N1DKPbw6AsoePi
 BmqU9O1AMVPQ0qCvhYNjObMbfP0v9tuF7LXpbGPLI3hbis3ytSeJTpfyjqi08KGsNoDe
 nyWA==
X-Gm-Message-State: AOAM532UtomKqiKrYGB/9VxgsxljBT1qyAws18JF2Dbqu2TnKUXOf734
 KEzrZjIQ+qZTmq0TVg5nTLuahthJiSA9vL2YuBq5Wg==
X-Google-Smtp-Source: ABdhPJyBYKaUXGeT7ru4rgRC6OKS2A7qyDna6VLNHBBspM26S5nzG8vnM51ZcKvjNnVklS/ne+kH+hlH6xWzrwzcpBk=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr6337934ljj.438.1611217534069; 
 Thu, 21 Jan 2021 00:25:34 -0800 (PST)
MIME-Version: 1.0
References: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
 <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Jan 2021 09:25:23 +0100
Message-ID: <CACRpkdYCiiuBUnJGMea66Q=MEmp9hpYMm3bwYZg2YnSUbAPGFQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_032538_867116_BFB5A2FF 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2021/01/21 3:21, Palmer Dabbelt wrote:
> > On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
> >> Hi Damien,
> >>
> >> this looks all right to me.
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Shall I apply just this one patch to the pinctrl tree?
> >
> > That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
> > take those as well and I'll drop them?  I don't generally like to drop stuff
> > from for-next, but that's probably better than having everything all mixed up.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
> >
> >> I think the line that touches arch/*/Kconfig should be dropped
> >> then, that better go to the SoC tree.
> >
> > I'm OK with you taking them along with my Ack, but if you don't want to that's
> > fine.  Just LMK
> >
> > Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> Linus,
>
> Please let me know which way you want to proceed. If you want to take the patch,
> I will resend without the Kconfig change and move that change to another patch.

It's fine to proceed as is, since Palmer already applied the bindings to
his tree, just apply the pinctrl driver there as well. I don't see any
risk of collisions in the tree.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
