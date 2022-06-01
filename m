Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815D7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWurH8dd+r35MP66rnYZEp4WyDaSWON26UYt+6UaxMY=; b=YxOkThVMnAfSr0
	ZyNk2iP++Xgmf9w3Vku9EeS67O/+rqTLy6kdjZeZ6gphRBaHb1IIv2PAHEGTiaj5GyN/rsmMDXRmf
	JwmKUxD8HOlm8mYMwbM5N79h1d8ZRrm5KY9Z93hJtqPgPhoemtOEXlPjl1hvzEPNA5aX0hiQuHlIr
	tMC09aGJ5tlPbINSAxWlhsfsrekN5reUXc9Fr0JLeZUcIN9W2pxRbJmAKdOIk8W9HTiOEKGw3BTz4
	/5HjvgMQ2SnokivZdn2hfoiDJIwP+2namlnMd/wl/sELfHf5ySn9NmimFn3tPeLRlY8gWAeYHvO9m
	jsGIYj5R01mnbwMw03Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLpn-00FOqt-Sv; Wed, 01 Jun 2022 10:44:15 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLpl-00FOlu-4J
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 10:44:14 +0000
Received: by mail-lj1-x236.google.com with SMTP id s13so1531330ljd.4
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnL1OLV1PY9lMlL4F1psml7tqA7a4raxuISBfgJIhpI=;
        b=JPQamR7LzqBH0jJ27Q0Lo1OAV/I4In+aj2UdcEhnFoer7CxhD2/6Th9So1GleiVW0s
         UDhN164xgDIrzm42dhqzlmg6PmzohB3bxkZxWrHWgUV1R/hoQc3TNkLapmDN/NanpCh6
         GOlLZmqx2w4nUKpsIb9EcLaWMr3+f3yw5x03SXud+iPX6FRxo7JTxHv9GKmrdY99uvIi
         Eq4JaXgQscOudi91YWYXiFf0VE3WyAAJ8KiMt9Ne1Khmwu5NcwkN6jhk1o2dYXZTO1H7
         unCPHAkLVQ/vH579QAadTf3eteQfjHt/FW0uDbdh3eGRUuqWtk1vETB2+SxNo6odo0XH
         6nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnL1OLV1PY9lMlL4F1psml7tqA7a4raxuISBfgJIhpI=;
        b=oCtjvFtET58tSx7S4zzAGSiC76MuJkpnLnUXVQ1nuSz56WCwDxb3XlowbBRoSBQUgH
         OpUf8EbS0e36OCNiwgGeJZEBxabzwc5hNuBYNGva8GXKMcL+dte4JYej7Q6Flhr9thLp
         OgLyiEKHny7CO2HS0BIW7bpJgQ9bwXqttVbgdzbycbKZqFkIx47zd8zG585qpFDYJtOu
         G5yv71euFZujfy6qL8vlBsmMWil0zgt8R3ArNS6AtRrYgxwUhXLD8dQYC6uqRXpEP3ja
         KK0BiHLeOJ/pUwltSboNIKyd55+fmTmED80LgqWwRKyC/Sg1939qdVqqtCw7Je04XnqC
         bLFA==
X-Gm-Message-State: AOAM5304/O+niAgsR1tqoFfLtEyX2VJZ2vJvK4Y9WNpiJtJQQTFI+i5+
	Rf1VHCOOGTCH7FixCy/l3INnpR15i/NF8zgXlV+UpA==
X-Google-Smtp-Source: ABdhPJzL6Hm338xmLjdt+tFgPO2JQEu2i6HOMaY+iApQ+fEFRrz+yOa5Wgm+FzcqjSzhM0e9sGs9ibkQ9ZNYB+uvycE=
X-Received: by 2002:a2e:9216:0:b0:255:6834:dcae with SMTP id
 k22-20020a2e9216000000b002556834dcaemr2925927ljg.466.1654080249243; Wed, 01
 Jun 2022 03:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 1 Jun 2022 16:13:57 +0530
Message-ID: <CAK9=C2WB2eoiFQfvSeQkioqcMuSLhP5eVKrd+eaTbuNMAXaG2w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Limit KVM RISC-V entry to existing selftests
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, kernel-janitors@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_034413_256016_40712F49 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, Jun 1, 2022 at 2:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit fed9b26b2501 ("MAINTAINERS: Update KVM RISC-V entry to cover
> selftests support") optimistically adds a file entry for
> tools/testing/selftests/kvm/riscv/, but this directory does not exist.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference. The script is very useful to keep MAINTAINERS up to date
> and MAINTAINERS can be kept in a state where the script emits no warning.
>
> So, just drop the non-matching file entry rather than starting to collect
> exceptions of entries that may match in some close or distant future.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Anup, please consider to pick this minor clean-up patch.

Sure, I will include this as fix for 5.19-rcX

Thanks,
Anup

>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36eab5ae237d..a8eee9d2aea5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10863,7 +10863,6 @@ F:      arch/riscv/include/asm/kvm*
>  F:     arch/riscv/include/uapi/asm/kvm*
>  F:     arch/riscv/kvm/
>  F:     tools/testing/selftests/kvm/*/riscv/
> -F:     tools/testing/selftests/kvm/riscv/
>
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:     Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
