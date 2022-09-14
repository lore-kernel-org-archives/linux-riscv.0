Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436C5C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfJEp4TGEac6ub/65xIY30RpmuI9GYUmPVBcZG2VNwk=; b=GDtSnbBYdpN1OA
	ixEqAftlCgjl3SWkEWqkRKeQs1iIq0xs0TFh0AahTGEL+50pyOF+EhdKBCIR0VYS6sLJh1vY5T+2r
	nBfu++3LfQyGbSvUkpRNVXPxgxxIE5gyck5gFR5uDwyL/vioVSq27IVjI7nb2PYWhAz9Py3nfd1TZ
	/vMHTFknIhfoboMBm0v/5AGVvohkfVKbI9N4aOSfOBxG82X9b8SP/ewaGZtuHP1ceneDsehWmUqsO
	4G04DOoKV8huoXf1OeHdcI6VmDrAF2zmJcisWJLXpAiLvXS2OPYrhkKZ/KO2MTsOKJtcI589OBaTX
	Qcrru73FeffLbVk2JUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTJd-0028JH-TS; Wed, 14 Sep 2022 14:24:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTJb-0028Cl-4U
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:24:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bq9so25996709wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=ZeXH6hqtOG4qq0HHcutea3zAFoAOF8Qol8AIK6OMbM0=;
        b=T2bH/YRZveXTAd8ORJks/7+CHhnDLf7342cjcHotREaOsWk66QHEB2mxuo/IqgbvyX
         dleO81QwLyCH5dx3oqEXvmrPHxnc1gRXVSPTIJ9ea5YRV9pvnkW4xIa3D/4J1ia8g2zY
         gYznTYLc/PHNYrh7rhSl4xef7qUXwL5k7eirRnUGuZy0TgoCv0VEHsTm+IOU/pZOBITl
         nAnNBmQBNH/9QMZ4Zq7XGNlk92yuDjiqZQgaWnNmoBymjQgmKoR1c3mBe6V325yuPuzj
         Nt/iG0TFRbproEV+CfjyhJgdW93I5YJKbc93SRg1mwSC6VDmsg5kCRcozQ67ScZ6mPzi
         O0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZeXH6hqtOG4qq0HHcutea3zAFoAOF8Qol8AIK6OMbM0=;
        b=CckgBlD/VIuGu39jokOdo1gfEYZHoftRHVdqASXJMPatl5mq0Lq+SQO3WkyM8oit37
         xa2/VeO0ufmf/aOfKjBIrHX/SUfuQjd1t38bz3ICnSYIUhLNt+N67/91ve0tq8ECSf4U
         eIcNwgHkDTXCn8xJJa12IhiXXIlteTTR1PU6D9FCb59z44JMJ668haTjoQjj3ae3L99X
         1yEvMDs60lniBmnCqiBWyi1FJrgzJmig6WkyxKvYbGjNzCiBJImUxuZ2oo88STyzyoNn
         Pado1ciaDn5Xcr87QAOkbP6pGPgMBUWqdpvuKHiJcQzArsVgCRHIw5GCQBIaQsB0Tkax
         zbGg==
X-Gm-Message-State: ACgBeo2cslE5IihCb9ocgXC5N2EjhckW4uOy51nmgxCl1YEVAq7F8TfQ
	KlPSJDtR2O68WANwRY56uqHL6w==
X-Google-Smtp-Source: AA6agR5bi0NbdCASgj9edKyXj5Ox9ft+UiU/6fHTaOKaJth8CG4BbRQaqwT7ZtFQkWRPoEQCI9OFJA==
X-Received: by 2002:adf:d1cc:0:b0:22a:450c:6208 with SMTP id b12-20020adfd1cc000000b0022a450c6208mr14501253wrd.696.1663165473034;
        Wed, 14 Sep 2022 07:24:33 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id p10-20020adf9d8a000000b00228634628f1sm13980316wre.110.2022.09.14.07.24.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Sep 2022 07:24:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch
 function
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220913094252.3555240-6-andy.chiu@sifive.com>
Date: Wed, 14 Sep 2022 15:24:31 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rostedt@goodmis.org,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 jpoimboe@kernel.org,
 jbaron@akamai.com,
 ardb@kernel.org,
 greentime.hu@sifive.com,
 zong.li@sifive.com,
 guoren@kernel.org,
 kernel@esmil.dk,
 linux-riscv@lists.infradead.org
Message-Id: <82E75CB4-3849-455E-807F-A0DBCAEED3CE@jrtc27.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-6-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_072435_235031_5FA2C6C6 
X-CRM114-Status: GOOD (  16.22  )
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

On 13 Sept 2022, at 10:42, Andy Chiu <andy.chiu@sifive.com> wrote:
> 
> runtime code patching must be done at a naturally aligned address, or we
> may execute on a partial instruction.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
> arch/riscv/include/asm/jump_label.h | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..729991e8f782 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key *key,
> 					       bool branch)
> {
> 	asm_volatile_goto(
> +		"	.align		2			\n\t"

.align is a horrible directive whose meaning changes between
architectures and requires careful thought, especially when the
argument is a power of 2. Better to use .balign 4, or .p2align 2 if you
really want to for some reason.

Jess

> 		"	.option push				\n\t"
> 		"	.option norelax				\n\t"
> 		"	.option norvc				\n\t"
> @@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
> 						    bool branch)
> {
> 	asm_volatile_goto(
> +		"	.align		2			\n\t"
> 		"	.option push				\n\t"
> 		"	.option norelax				\n\t"
> 		"	.option norvc				\n\t"
> -- 
> 2.36.0
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
