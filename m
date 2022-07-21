Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D203AC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 05:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZMQ0Tmpft7znsynGupfBBsr844ePGtWvBK4cuQFZvtc=; b=DqawIyiIS0lkaczTPWrSgO1fUR
	uP1D07tGBpiB1QGbEbR5mMPL3hMzZJTYh0iDjgaU5T4d6GUXBh7wcJKK8isfzkO+u/6JugR+kys5D
	TnG5xUl8246V+VWYGQfpxfb3oGSQGmerGMZKx/nm61H6+45DdojyoWTEcT3V6/WgCuykWHAdoNLMD
	g6gGWM+ChmMkm7hsLRIkfCpvEdRTnQNE9NDX1x56avru3l/ZS+li/f8XQRrXiQhg/0asH7ybRUDB0
	BDDcZ0+zQi/gxjTkgzvX6VHKtmieKzzKbfzq8FQCXHVXA+yybVkEmP9CjpsRywdUfdpswnDg9Hibe
	ugnR28ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOv6-0001aY-GW; Thu, 21 Jul 2022 05:40:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOv3-0001ON-Ar
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 05:40:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id w7so831271plp.5
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 22:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=iYWDEsfejU6nP0not1ZzQx16PGQMfy/lNJ3VNlUbzWY=;
        b=vqyDACTMNJZoyirs0iQtgsC3/GSjQx6qqht5kDA1r7KqrVWs36IbHYfhHgnwvffpOX
         vjk+LE88aWOkmfvrUnBWsFGwveuDBwqdAGsUSgKt0ugAO/82Eo2YLGu/j33jhNCCGEj/
         GXZKQg5Ny+1Go+IwF22719/VXYU/seZIuV85qqoamRXik5X2z5GToVp40S3+ZTIic5Kf
         6KyzvjHG62hW6P1wSqtzKMmoxNhOppAWRemh5l8yRmRqusje0MGlKuauuEWbNzDNQOQ0
         d1SDG+eag7qz1hxnvz771dH1zCQ44obrq+MO3IITB4fa8W4if8U1XNw4IWjmvZ0wMWr+
         Mm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=iYWDEsfejU6nP0not1ZzQx16PGQMfy/lNJ3VNlUbzWY=;
        b=fmdeAcRZU3aPRpBfqy9M1vhkyIGuTSFs3mdpfdZrJ9mhwGpCKd7YKA9DUEMHQsv6vE
         QSynoZDRqeVgGMrvf0xOqkRQd6Zz/Wu9FXp4i6yu3AeM0m6k9hBt0LBnHdZW64x2Fwti
         mM9XuKHged/JXMSL+7eNisN5vo88nlA4TEF51JiRpv46Wxon33/YEmIooB0hgoyp4rby
         CgSMW+/ZGhGUhozcs2WXjVE01HfOngo06ZDXaGet3o8+9hEDjOUkcYDm4bWdqv7VrWQN
         FZve3FwdB1gAvP7wu30+t/U9OPKZ9U6rF0+aUqXVnmUrZ5EoMoJO5Avb+PvzjSol3tqr
         Mtkw==
X-Gm-Message-State: AJIora9iwQJnikSc+TKqwAIWTFA3iBkTF+Ez2ghs/Sb+JvYz0pXdFVbt
	r59HUnOSu6B75tC9ydhlrR/LItEMsz8JBQ==
X-Google-Smtp-Source: AGRyM1uonU+3J9FaquK3c8xW0rZXhm6EFm0KO4caw7tMxwzlZ2UqhlHT+vZri/ifFraav2l0iQEhWA==
X-Received: by 2002:a17:902:e313:b0:16d:1f47:465a with SMTP id q19-20020a170902e31300b0016d1f47465amr7477889plc.133.1658382014402;
        Wed, 20 Jul 2022 22:40:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i1-20020aa796e1000000b0052ab54a4711sm654016pfq.150.2022.07.20.22.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 22:40:13 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:40:13 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Jul 2022 19:47:32 PDT (-0700)
Subject: Re: [RFC PATCH riscv/for-next 1/4] riscv: align ftrace to 4 Byte boundary and increase ftrace prologue size
In-Reply-To: <20220529143315.3678563-2-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, mingo@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rostedt@goodmis.org, guoren@linux.alibaba.com,
  andy.chiu@sifive.com, greentime.hu@sifive.com, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-81b16e3b-704e-4cde-aa69-ea6fb58ec25c@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_224017_589585_56DD6200 
X-CRM114-Status: GOOD (  17.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 29 May 2022 07:33:12 PDT (-0700), andy.chiu@sifive.com wrote:
> We are introducing a new ftrace mechanism in order to phase out
> stop_machine() and enable kernel preemption. The new mechanism requires
> ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
> boundaries.
>
> Before applying this patch, the size of the kernel code, with 43432 of
> ftrace entries, was at 12.31 MB. Under the same configuration, the size
> has increased to 12.68 MB after applying this patch set.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 1f19bdac6767..cb6cfdffc49c 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>  	LDFLAGS_vmlinux := --no-relax
>  	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> -	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> +	CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4
>  endif
>
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
