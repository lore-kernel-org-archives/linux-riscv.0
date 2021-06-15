Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD45C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8F461369
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8F461369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VaYsxXwvjLzwdQt8iU9fNGYE+dGwG2RWp6OAWYxZYk=; b=PTnOLT3Z0H+9gx
	1Jmleg+QnutIajv9aaR+M0yfxgF8UatfL999nF264O+kmuJ6GwT2qnlrLYk1xT+Pjk8crDhZnw/6h
	4EAiplW3auEeZAjfsnHsNfqisys5Sy5LJGnX24CJ/OjqeemhXzEyLsLJ/irnEAha1WZrEXHsG1BrU
	DgC2DMqDoW/d2bjtELtioViohXH6l3bRyXxDVRJq2Mwpor8G7WV1OcNt8xitSYPsi9gDo7sCtOqKG
	8P7OlmVDi/q3q/c1CgbXECS0mCkDspDaYIQvr9GPX97QU0A5hkPfkYythI7I48wtAVpwTSYbS81gS
	Y6t6HLYbWCjtwDeIhDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9JI-000FUX-6w; Tue, 15 Jun 2021 13:40:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9FB-000DDm-9w
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+mj0zKnNZimo+b0MCUPLJzY3nx5LlUdHFFIGbFIHkkM=; b=JkMl4MBnNHBrJDSLqgt5A4Bu+1
 DHwaxNvDCiBPGeOoM9NW6HBVF2oaJhA1as6sU4aU5M/1Sc7UllG0WHrs1zIg2Mex3P/zz235/l3rg
 EAaoATNtjcPztIqAOPaMDthV7ybcdfQRrgghAOL5on93mRhmSJm/NTD8gic/TdIStNyDKNq2A4Gfj
 HRGqIWahNQSSHAfAb7s65Cj32iIZUcrH26ocP6pz65x+UefS7gu3KBHZmKcDSAgUMbKraAvBNuzq9
 CA7DVpPpoHTtFO2aFi3kphD3cO5tvp47X4xGhwA9fbPYOqxMEjudmC806mqGnAraP6Gb2FB3d6zrS
 df5BifmQ==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt7ef-007p3H-Dm
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 11:55:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p7so26584987lfg.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+mj0zKnNZimo+b0MCUPLJzY3nx5LlUdHFFIGbFIHkkM=;
 b=F3kUJHf5n5IAORPF+Anp44ff2rZIYN0+3++hNC5IbxpPYWhLoBHM0lQid+Dbj27K5c
 Emb1JZZCTKKILXGee62fPBkhV5GvEKUg7qmm8iIQjhVkMXcF+Se8CkbkJbZ0dO5LpsLL
 C0/9QJ0YvOpW+AFqaKIjkVNp0QDr8tKJY0xLJ/5mu1VzFNCezAeCHw4CFz2y7b/hNuRk
 REy62jgEwxpvKVwrXGSWl9Bqvu2aq31Tw4A1xFFJaAZgzIE+QcJDJmG4oDbfhg80qcY0
 0JiT0o28UDIA85s2evfyTbZUr7GYLa+hclDuIBKZTSjrL7pGSmqcbJAo/UO0AAaUup9J
 Y8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+mj0zKnNZimo+b0MCUPLJzY3nx5LlUdHFFIGbFIHkkM=;
 b=j0PBfFOFDFDkVs8ZrMiXTRzPRimrTSbQoPg/tc+TxRvgMohvC0/twDUpZM+74K+xyi
 /1W3bGOiYKk5nrcVZ2PplIfLw3CmozFwORWSZSrd/euGYaxkdlqzL1w7U2tI6+v1b59O
 8DsZg5usCfBQZgpUHsEbuh63cqruG72YMluVg2d2C5cLL0kgIi4uhECzq/ey3SR109c7
 nsBD4eqyOlfBMeSSn+RMDqjsZSnVpcyzPKJWT7QFvclTy31kDzVR218UuttlycYraPck
 niPRwf0wZG0Lr46SSSPIEZgNy7T6v/ppflyfe7qD+e82b+Lf72zh474SaFfFLninuE64
 Walw==
X-Gm-Message-State: AOAM5324r1aggJYf2/2eQx7GC4DqMKIVfYQsx39oiFTyZ9VWJjfmqpIH
 HZFFQCrRc97n//dTnQKQkFng4mLHMLvVEOmB1so=
X-Google-Smtp-Source: ABdhPJwiVlzj34OhyvcD2auRDwqxFtqF0VbI3x+HBHxv1P4A7y0TdC9bmjb1eEXPOMOwFDe6RQKcgDAbmFW6ff3/dZY=
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr15393177lfi.174.1623758098195; 
 Tue, 15 Jun 2021 04:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210613004356.3503995-1-palmer@dabbelt.com>
In-Reply-To: <20210613004356.3503995-1-palmer@dabbelt.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 15 Jun 2021 14:54:22 +0300
Message-ID: <CAEn-LTrcLL7EvdskX3+f_Youi0ApC8-0p6u8r8LpyATKCOKA9g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: fu740: fix cache-controller interrupts
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>, robh+dt@kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greentime Hu <greentime.hu@sifive.com>, lorenzo.pieralisi@arm.com, 
 Yash Shah <yash.shah@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125500_332191_42B32EFF 
X-CRM114-Status: GOOD (  26.66  )
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

On Sun, Jun 13, 2021 at 3:51 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: David Abdurachmanov <david.abdurachmanov@sifive.com>
>
> The order of interrupt numbers is incorrect.
>
> The order for FU740 is: DirError, DataError, DataFail, DirFail
>
> From SiFive FU740-C000 Manual:
> 19 - L2 Cache DirError
> 20 - L2 Cache DirFail
> 21 - L2 Cache DataError
> 22 - L2 Cache DataFail
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> Olof pointed me to
> https://raw.githubusercontent.com/sifive/meta-sifive/2021.03/recipes-kernel/linux/files/unmatched/0009-riscv-dts-fu740-fix-cache-controller-interrupts.patch
>
> This appears necessary to make the FU740 function properly, but hasn't been
> posted on the mailing lists.  Given the age I'm hoping it's just slipped
> through the cracks somewhere, but I figured I'd send it out to give David a
> chance to comment if there's a different plan.

There are a bunch of stuff that need to be cleaned up and synced with
U-Boot copy of DT for Unmatched.

This patch is required to boot.

There are others patches that do:
- Change compat string for CPUs to report U74MC instead of bullet0.
- Change memory to 16GB from 8GB.
- Change regulator values to match what's in the Rev3 board.
- Add PWM LEDs nodes.
- Add a gpio-poweroff node (this could change depending on what
OpenSBI wants to do).

And most likely the "a00" part should go away from compat strings and
filenames. "A00" was most likely a copy & paste from FU540 / Unleashed
board. Regulator block probably could also go away from DT as Linux
doesn't need to touch it, basically it just runs whatever is
configured in OTP.

I believe the current DT that landed was written for Rev1, but a few
revisions happened afterwards. You can only buy Rev3 boards.

I wonder if we should modify the existing DT file and rename it
"hifive-unmatched.dts" + new compat strings to remove "A00".

> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> index 8eef82e4199f..abbb960f90a0 100644
> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -273,7 +273,7 @@ ccache: cache-controller@2010000 {
>                         cache-size = <2097152>;
>                         cache-unified;
>                         interrupt-parent = <&plic0>;
> -                       interrupts = <19 20 21 22>;
> +                       interrupts = <19 21 22 20>;
>                         reg = <0x0 0x2010000 0x0 0x1000>;
>                 };
>                 gpio: gpio@10060000 {
> --
> 2.32.0.272.g935e593368-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
