Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8928C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:40:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700012065F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFYJypOh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="cGVyINxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700012065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HH4WRvzOIO96OnCtbdMxR5mehif9JuWAGbQaMpbvcms=; b=eFYJypOhdIDOYN7cR6Fm7xP+8
	4nTVJ1WKUNO1+4tQJtFLzMUnRXs4Td/NWOV4cEaMqEdjrKfYjBQM/kQ0OTOZ+GamntBiir6FVT5sM
	6o3l9DdzXkQQKXpEDhS9xq5xBvLRpuWiYiSIL9zb5mt5Kba/e+IuhKOzrQ8njM4ElwVubhw4B1nx0
	TIwEbkEdDh2sZCgulZXcHUxkBQyG7GJQQ9jYiTZ22/PL/QyaEsglpecOop6F/4Krkugnt14fvlBTV
	ibNL0Y726RgSToySwU54z69IS391zI9pn3APtO1sxINzgddhedVNVEFY2Xt4thgPvTg9W1DsQ3B8n
	3DIGVhkyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonea-00038B-EI; Fri, 26 Jun 2020 12:40:24 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joneS-00034F-Fq; Fri, 26 Jun 2020 12:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1593175210;
 bh=kBlVHxyUp3+0RDOPOn69M6zoqhE1t52hPzBx23SEtCg=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=cGVyINxqxyr68GxOflHTsz3WHeMfJmrc363tLsbHbJijv5sg+mQLgDPdfcVaAKqLh
 sM/tfr3UOR9NkvqA6HrJEkSJNWOCTQMXOwYxHCapTP9acTdjb/k7WmMxv1tFNfvlkB
 4MVOk7xwrubB03kKBfVoXjp87/R7x4/1+6icPuWI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([88.152.145.75]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1ix6D726FT-00sz8i; Fri, 26
 Jun 2020 05:00:26 +0200
Subject: Re: [RFC PATCH 10/11] efi: Rename arm-init to efi-init common for all
 arch
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <20200625234516.31406-1-atish.patra@wdc.com>
 <20200625234516.31406-11-atish.patra@wdc.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 mQINBE2g3goBEACaikqtClH8OarLlauqv9d9CPndgghjEmi3vvPZJi4jvgrhmIUKwl7q79wG
 IATxJ1UOXIGgriwoBwoHdooOK33QNy4hkjiNFNrtcaNT7uig+BG0g40AxSwVZ/OLmSFyEioO
 BmRqz1Zdo+AQ5RzHpu49ULlppgdSUYMYote8VPsRcE4Z8My/LLKmd7lvCn1kvcTGcOS1hyUC
 4tMvfuloIehHX3tbcbw5UcQkg4IDh4l8XUc7lt2mdiyJwJoouyqezO3TJpkmkayS3L7o7dB5
 AkUwntyY82tE6BU4quRVF6WJ8GH5gNn4y5m3TMDl135w27IIDd9Hv4Y5ycK5sEL3N+mjaWlk
 2Sf6j1AOy3KNMHusXLgivPO8YKcL9GqtKRENpy7n+qWrvyHA9xV2QQiUDF13z85Sgy4Xi307
 ex0GGrIo54EJXZBvwIDkufRyN9y0Ql7AdPyefOTDsGq5U4XTxh6xfsEXLESMDKQMiVMI74Ec
 cPYL8blzdkQc1MZJccU+zAr6yERkUwo1or14GC2WPGJh0y/Ym9L0FhXVkq9e1gnXjpF3QIJh
 wqVkPm4Two93mAL+929ypFr48OIsN7j1NaNAy6TkteIoNUi09winG0tqU5+U944cBMleRQOa
 dw+zQK0DahH4MGQIU0EVos7lVjFetxPjoKJE9SPl/TCSc+e0RwARAQABtChIZWlucmljaCBT
 Y2h1Y2hhcmR0IDx4eXByb24uZ2xwa0BnbXguZGU+iQI4BBMBAgAiAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAUCVAqnzgAKCRDEgdu8LAUaxP7AD/9Zwx3SnmrLLc3CqEIcOJP3FMrW
 gLNi5flG4A/WD9mnQAX+6DEpY6AxIagz6Yx8sZF7HUcn1ByDyZPBn8lHk1+ZaWNAD0LDScGi
 Ch5nopbJrpFGDSVnMWUNJJBiVZW7reERpzCJy+8dAxhxCQJLgHHAqPaspGtO7XjRBF6oBQZk
 oJlqbBRFkTcgOI8sDsSpnsfSItZptoaqqm+lZpMCrB5s8x7dsuMEFaRR/4bq1efh8lSq3Kbf
 eSY59MWh49zExRgAb0pwON5SE1X9C84T2hx51QDiWW/G/HvJF2vxF8hCS7RSx0fn/EbPWkM6
 m+O1SncMaA43lx1TvRfPmYhxryncIWcez+YbvH/VqoLtxvz3r3OTH/WEA5J7mu5U1m2lUGNC
 cFN1bDsNoGhdlFZvG/LJJlBClWBWYHqHnnGEqEQJrlie9goBcS8YFUcfqKYpdmp5/F03qigY
 PmrE3ndBFnaOlOT7REEi8t3gmxpriTtGpKytFuwXNty1yK2kMiLRnQKWN7WgK70pbFFO4tyB
 vIhDeXhFmx6pyZHlXjsgbV3H4QbqazqxYOQlfHbkRpUJczuyPGosFe5zH+9eFvqDWYw2qdH+
 b0Nt1r12vFC4Mmj5szi40z3rQrt+bFSfhT+wvW9kZuBB5xEFkTTzWSFZbDTUrdPpn2DjYePS
 sEHKTUhgl7kCDQRNoN4KARAA6WWIVTqFecZHTUXeOfeKYugUwysKBOp8E3WTksnv0zDyLS5T
 ImLI3y9XgAFkiGuKxrJRarDbw8AjLn6SCJSQr4JN+zMu0MSJJ+88v5sreQO/KRzkti+GCQBK
 YR5bpqY520C7EkKr77KHvto9MDvPVMKdfyFHDslloLEYY1HxdFPjOuiMs656pKr2d5P4C8+V
 iAeQlUOFlISaenNe9XRDaO4vMdNy65Xrvdbm3cW2OWCx/LDzMI6abR6qCJFAH9aXoat1voAc
 uoZ5F5NSaXul3RxRE9K+oWv4UbXhVD242iPnPMqdml6hAPYiNW0dlF3f68tFSVbpqusMXfiY
 cxkNECkhGwNlh/XcRDdb+AfpVfhYtRseZ0jEYdXLpUbq1SyYxxkDEvquncz2J9urvTyyXwsO
 QCNZ0oV7UFXf/3pTB7sAcCiAiZPycF4KFS4b7gYo9wBROu82B9aYSCQZnJFxX1tlbvvzTgc+
 ecdQZui+LF/VsDPYdj2ggpgxVsZX5JU+5KGDObBZC7ahOi8Jdy0ondqSRwSczGXYzMsnFkDH
 hKGJaxDcUUw4q+QQuzuAIZZ197lnKJJv3Vd4N0zfxrB0krOcMqyMstvjqCnK/Vn4iOHUiBgA
 OmtIhygAsO4TkFwqVwIpC+cj2uw/ptN6EiKWzXOWsLfHkAE+D24WCtVw9r8AEQEAAYkCHwQY
 AQIACQIbDAUCVAqoNwAKCRDEgdu8LAUaxIkbD/wMTA8n8wgthSkPvhTeL13cO5/C3/EbejQU
 IJOS68I2stnC1ty1FyXwAygixxt3GE+3BlBVNN61dVS9SA498iO0ApxPsy4Q7vvQsF7DuJsC
 PdZzP/LZRySUMif3qAmIvom8fkq/BnyHhfyZ4XOl1HMr8pMIf6/eCBdgIvxfdOz79BeBBJzr
 qFlNpxVP8xrHiEjZxU965sNtDSD/1/9w82Wn3VkVisNP2MpUhowyHqdeOv2uoG6sUftmkXZ8
 RMo+PY/iEIFjNXw1ufHDLRaHihWLkXW3+bS7agEkXo0T3u1qlFTI6xn8maR9Z0eUAjxtO6qV
 lGF58XeVhfunbQH8Kn+UlWgqcMJwBYgM69c65Dp2RCV7Tql+vMsuk4MT65+Lwm88Adnn6ppQ
 S2YmNgDtlNem1Sx3JgCvjq1NowW7q3B+28Onyy2fF0Xq6Kyjx7msPj3XtDZQnhknBwA7mqSZ
 DDw0aNy1mlCv6KmJBRENfOIZBFUqXCtODPvO5TcduJV/5XuxbTR/33Zj7ez2uZkOEuTs/pPN
 oKMATC28qfg0qM59YjDrrkdXi/+iDe7qCX93XxdIxpA5YM/ZiqgwziJX8ZOKV7UDV+Ph5KwF
 lTPJMPdQZYXDOt5DjG5l5j0cQWqE05QtYR/V6g8un6V2PqOs9WzaT/RB12YFcaeWlusa8Iqs Eg==
Message-ID: <8b71b663-8a68-26f3-c806-a2873a6d8923@gmx.de>
Date: Fri, 26 Jun 2020 05:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625234516.31406-11-atish.patra@wdc.com>
Content-Language: en-US
X-Provags-ID: V03:K1:d8YfDH5rm/aIO6ZblpSCJcfvrT+bctc+tiI1/6xHvAvdC/Sqc1F
 CuIXhmT2IwP7hla2TlaR62Jkuwsy6iQUrdBHhxAuf/Mb56aUi2l5xLdZhjhj546j9XTNHkf
 YIIBM3rUjvH7ebu2Yf5c1k1ScTqK+9rPiLMIyn9DIL7cFoaZ9wq9UBug2b1vCk8izySugFa
 NV4bwY2mL1LKS2rI4zD9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vioJ9DgYzM0=:z6J32b79P6GNVkHSY4hQO+
 1fyf1pd/RzsmhPyRZo7jIHKnTwgOIfMePeh+zNjsdd1kkM4eCOq5e/PQy1CNtBvXh7FCDrWDa
 eyl0rQXR/diVVCvXlq3lOEjmzwe6C4AU22gP1iT2i95dcoLlYUkKjKCpPXTgFifYoEkqY98qO
 Dt2kO1Rjc+4JhPHrIWDrDx12Htc29SVdBCJMPvi8fE5qepFTjia6WGcKBHEkn+b1wEaMagTw0
 5XLOs1BIVc4XTkLQMV/p0A5rTfglAuyj48iNzibwIxNGjlsLnwmLfL4s47xMIOV8jCKTCMj5i
 KMvU25M170bNJAkXkLP9rlZjVqkQHc2fQNuucCHAIRy+zXpf/McN1s4izDpIJL3y0gISypz9w
 YQTkcX1cxyNy0PLgwL8ydNRZYgQOD9ACk3uBmPfyjfC3mncXOsja0h/e/ukeH002sA3sz7v5g
 c3Nfd+rM0iyFf3NZkD8Hyl1c+y/NOYFj3q1LPUdX9s0ljF63IeOp5nKpsQ0Hc+mL2DaZyBU5i
 aY9supqbw0/Zz4MW0kfUzGx5nHlHLRcD6Xrna3G+VY4wgIZvXL+K6dva30hGV4NRuIkUDbpkI
 ACkIsMVAlsYk7IWF2dKBNi1/69fzHrN6WWVeUpB/HWKrmVTE1mf5R9RoPXUFlfHlJsrbYdR7F
 RzDKkFRj0+3pxJIiz7WAQ8g1RToJRmyPXJWVb1Bx/I9ykwqVvj9U8geLVr1VxZKdNvjO9fnPL
 KlKbTNdGdZhBg6ryJukKovaNXGGpQ7RCpvWPr/vSh0nam1daDBBxzJY7X3OkIT6jP+G6xg8d9
 dn/7zflBKqRP/BnI4q2flpWlvUUd9ws7oIYYXpHT9IQGyEJOB6dXqh4gGc8w79td0rohA7eKk
 /E8nMCMSMsnBLRCWPsHIlLVJ3JoCnAt5V+AAYtIGBmSzuYmXmgaUVyEBIC02LT28211t4F4R2
 BNZyAbokpRyuYzCu5cisqJ8NpHiyQT5DmkjBNxS3GpQi3abd8WHXZiMxM1novtTCHZ0iaRVdJ
 zQf+B2MNJqLkUq+lmnh4dlzvSLd0mJADysDqAl5Hn3VpvascCM8gg8QCMypOA2C484mugJPAj
 DJ58St+wz1zIqlkako3ZJESdizqraIyz8rkQyr8qbulxKZYqkteXkmKlPpnnazpi4d5g+IMm4
 dpsJ2yhF1BoeeN1tSKohGuxDfn8sTks4doYyvNNEEgd1vYYbBTekbs3eLy8jrstnZo4lmQzTy
 AhMFt+kaLwFyJflvr
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
Cc: linux-efi@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/26/20 1:45 AM, Atish Patra wrote:
> arm-init is responsible for setting up efi runtime and doesn't actually
> do any ARM specific stuff. RISC-V can use the same source code as it is.
>
> Rename it to efi-init so that RISC-V can use it.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
>
> diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
> similarity index 100%
> rename from drivers/firmware/efi/arm-init.c
> rename to drivers/firmware/efi/efi-init.c
>

After each patch we should have code that builds. This helps when
bisecting. Therefore I would have expected an adjustment of
drivers/firmware/efi/Makefile in this patch and not in patch 11/11:

-arm-obj-$(CONFIG_EFI)			:= arm-init.o arm-runtime.o
+arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o

Best regards

Heinrich


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
