Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B98EC54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 01:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrkbQLqXU9bcQNQ0p+sEPEtjYBJ3pcd7de1l0nU/bJE=; b=1RpXF9NwMK3uog
	XGwHg5MZFAPQ2iwsotCv/JcNB9vfXbFPFjaxcRdotynF3pANLPAiPe83sJR4kqE6KvatpNnl+lafX
	sLksqx1uvBZMfXeOgb+zy4sWRRLUR6zUo3+Poj5s0/HRRaWFqHzcOx3mr/DrugKrBRQMcEEf2Pwu2
	zOb/Qer6NdrRmZsQXmY03DVqCLmY1NvL49zKah3AxRAJqTSfm4LtYhC78jyR0KaUi3dnxn1V94u/t
	lV+aXIItnWbNEIVrKr/40ZYJo47Q8TItatge7oRyzy+sm2b1w5DLbYAZcDJenqiWgmidSfPIKr6hY
	gnssrwXnODV0XjakaBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roCbk-0000000BXe6-10j7;
	Sun, 24 Mar 2024 01:25:08 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roCbh-0000000BXdg-3QRk
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 01:25:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ea8a0d1a05so923944b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1711243503; x=1711848303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LzkhJwRQhOpnuxfYahJxkJR2Jm2xIqxG//Pzm2qwvz8=;
        b=Brd6JwkmvM+RR/p1d574wnXOQ5MwY4sSfg5/R0ai9NyKMeqlslSjjkfsBkSFr9HXM3
         MLCoKiDmO/WGtMj7TsYhNnFL+mv8dI89Ukj3J7sHZfpBk2+QeTLEhtc9ymrtzSaziKKt
         IXM+JYzfqYyVqiJzQE77HHFN6kza5txU+yPLVSHnJDrYOqwNPKCpy+soHem5e/jBS4KW
         nDoiKr2GwC7rCY49rRC70MHL0xfXMjqIQFbbnzMTNLaY5df8bAHV14fEmbeLroMqrSQV
         ucDd/qL8X9QMK05gBqismjC7M9Xg+z7gAW8XyeM35x2wOz6j/nW0vmkIIi4kZ7wNtTb4
         2YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711243503; x=1711848303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzkhJwRQhOpnuxfYahJxkJR2Jm2xIqxG//Pzm2qwvz8=;
        b=L0unHXyq1Y/HDGazF/6vxcB71sNhR0dsUZlHVW0O+Rd2q6An0EitnM9LSnGsNt44gV
         qWZ9tPdSJQE+6S2uCkBPvfo2oCsoPVmNg4ddmnksIQAXrlvfgELers2ylXOFYrQ8thYL
         Y099EnS97lVhN3p8GqVrjhwtmkZ6BhFmguXtwvCVbuolTCTjv0hI6XWYkmqs2/qeKJEZ
         /53WftuBinRckc/v2NJWkU5Srbr28y8LyNFOMRS6K3AGG6I83N0Sedh4h7MXqvmq4e6R
         q3wW5QNgMJGHK23agyS8nhFZJB2n69XfF4VD/f49bhvnmDWdow+YjGwW6Oz8pdOuGSYA
         mmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx7F4nb1obPUhmyJYuaxPTzKuQmnVKHsMyui8IDsnWnOKMjIyy2LjVqenSoI6zMMe2LvohrokW7u+yz4bSFWp/hZ/DvYo57PycJw9LalWY
X-Gm-Message-State: AOJu0YzyXeRf3896UEhSF/LRaKqNknFaX8fW4vA20WAgLYWwJl2EkIzn
	mh5dlgiWzMfk2zquUiHF79knkY1cKnCjFNhR+8ELuH61X4BlLYdH014V+IJcz/c=
X-Google-Smtp-Source: AGHT+IFF+lye/rdq8D9ARjDal8stTvsLUFgpD0E23JVfqmmpnnP960+SS+4KzaoTP/zPBnjkrzjPew==
X-Received: by 2002:a17:90a:f683:b0:2a0:569f:fa92 with SMTP id cl3-20020a17090af68300b002a0569ffa92mr2759903pjb.0.1711243503151;
        Sat, 23 Mar 2024 18:25:03 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:66c8:e9a6:59a1:e5e2])
        by smtp.gmail.com with ESMTPSA id kx16-20020a17090b229000b0029b77fbeb7fsm7815393pjb.16.2024.03.23.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 18:25:02 -0700 (PDT)
Date: Sat, 23 Mar 2024 18:25:00 -0700
From: Drew Fustini <drew@pdp7.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: xry111@xry111.site, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	dfustini@baylibre.com, guoren@kernel.org, jkridner@beagleboard.org,
	jszhang@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	robertcnelson@beagleboard.org, Rob Herring <robh+dt@kernel.org>,
	wefu@redhat.com
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
Message-ID: <Zf+A7KEYL/tZb9/N@x1>
References: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_182506_102199_1B230BC2 
X-CRM114-Status: GOOD (  23.81  )
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

On Wed, Mar 20, 2024 at 03:28:19PM +0300, Maxim Kiselev wrote:
> Hi Xi, Drew
> 
> I have the same problem with SD on my LicheePi 4A.
> 
> After some investigations I found how to fix this tuning error.
> Here is the patch that increases tuning loop count from
> 40(MAX_TUNING_LOOP at sdhci.c) to 128.
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c
> b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 8d6cfb648096..da8f5820fb69 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -706,6 +706,7 @@ static int th1520_execute_tuning(struct sdhci_host
> *host, u32 opcode)
> 
>         /* perform tuning */
>         sdhci_start_tuning(host);
> +       host->tuning_loop_count = 128:
>         host->tuning_err = __sdhci_execute_tuning(host, opcode);
>         if (host->tuning_err) {
>                 /* disable auto-tuning upon tuning error */
> 
> After that change tuning works fine. The same value of loop count is
> used in RevyOS BSP
> https://github.com/revyos/thead-kernel/blob/c6d4e5df18a17903d012ffd89e67d0ee5ce6cf2d/drivers/mmc/host/sdhci-of-dwcmshc.c#L185
> 
> Honestly, it looks a little bit strange for me.
> 
> It seems that the tuning algorithm requires to move through
> all the taps of delay line(128 taps?) even if we use THRESHOLD_MODE
> instend LARGEST_WIN_MODE (I mean bit 2 in AT_CTRL_R(0x540) register).
> 
> Xi, could you also test my fix on your board?

Thanks for figuring this out!

When I was upstreaming support, I noticed __sdhci_execute_tuning() in
T-Head's version of sdhci-of-dwcmshc.c seemed to duplicate what already
existed in drivers/mmc/host/sdhci.c. I had thought T-Head copied it
because it was a static function.

9cc811a342be ("mmc: sdhci: add __sdhci_execute_tuning() to header")
allowed me to remove __sdhci_execute_tuning() from sdhci-of-dwcmshc.
However, I overlooked this resulted in changing the tuning loop from
128 back to the upstream default of 40.

Before this change, the microSD did work for me on the lpi4 but I would
see the following:

[    4.182483] mmc1: Tuning failed, falling back to fixed sampling clock
[    4.189022] sdhci-dwcmshc ffe7090000.mmc: tuning failed: -11
[    4.194734] mmc1: tuning execution failed: -5
[    4.287899] mmc1: new high speed SDHC card at address aaaa
[    4.299763] mmcblk1: mmc1:aaaa SD32G 29.7 GiB
[    4.316963]  mmcblk1: p1 p2

root@lpi4amain:~# cat /sys/kernel/debug/mmc1/ios
clock:		50000000 Hz
actual clock:	49500000 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	2 (sd high-speed)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)

With the change to 128, I no longer see the tuning failure and the
microSD continues to work okay:

[    4.307040] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    4.320462] mmcblk1: mmc1:aaaa SD32G 29.7 GiB
[    4.338646]  mmcblk1: p1 p2

root@lpi4amain:/sys/kernel/debug/mmc1# cat ios
clock:		198000000 Hz
actual clock:	198000000 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	6 (sd uhs SDR104)
signal voltage:	1 (1.80 V)
driver type:	0 (driver type B)

This has the benefit of the card now works at 198 MHz in SDR104 mode
instead of 50 MHz when tuning failed.

Tested-by: Drew Fustini <drew@pdp7.com>

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
