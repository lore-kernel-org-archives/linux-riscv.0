Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FCCCCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShMM2ELRLwTEp8wm4mjv9VLLzYSf0uHkhGJPgszzR5I=; b=jnBNVZx8ZO0pbH
	homPnoBc6hJm25u7CVcJnWHQQqqdtFUejh+nZjadh6FWa5zNhDgh2J46SLhe3sWkYzTc+nFMLi+Ym
	d/YYvoSbthQORBamZH2zWBBGWGZNgH4oAaQbv0LAkT7AravHOjxVom4BrSKRafS7nk+gA0WEAa/vb
	ygPcrudfXHKXMBlIpsKTZhpXBpn0wX538Yx/SY2DkKUO1ZAwt4zDLPnYVilEXWNn0QInuRI4RtPRa
	bS2Q9ykL2DkptmuLMaSYm/6jAkK00+kd0LjsWxO2vJFp+xtsADvs4B6LVjLugI28OfmdcONLyGpaj
	AHCTUC7E9GaEHDHqiv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u8P-00000006mtL-1aMN;
	Thu, 09 Oct 2025 17:08:57 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6u8N-00000006mrs-0UAh
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 17:08:56 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-42f68a0a89aso9389445ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760029734; x=1760634534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91IhoUqkbJwn/5huJM++DC3XaWSuratiU2ex4V2AW8o=;
        b=TEMCNNnd/ouiCSDxv1J/ImLgyK5QZO7UDbJpAo+4hElru0aP4j+pXQEtSsyX774/Tl
         zR1HsksRY4RzLIReqIzkbUkLZCquvPD4Zwq+MGc0rBnYOwbEt+R5r4qzffp2/Wj9O0eq
         Gcsdw5PX5igvCrreyitt4mzhjk2z6gMGTagF5fK6IEtlnkLufojGBgEnIAWD3M/Mx6Bm
         YhgarYPtpPb27onSEXTtww5H9WclQSGiDlM+P0zkCtmXjuDF3x/DUcUvMPTQlQvwaRcb
         cvA7USqkPWYo2RoyorPuzyRJ1657SKKFV2jaa5jbs2DmHJgAmqpPFVRPbNXhO7v8lqNJ
         oIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760029734; x=1760634534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91IhoUqkbJwn/5huJM++DC3XaWSuratiU2ex4V2AW8o=;
        b=IIOXjqVRQP+UxWnohj2uJSShM0kUxuUw/+Nq+1NYOmSc5qtu4MUPawNONe+Ss1lVxi
         vjLFiW0u3s8JGCiuRBHNSmtOQ2yRCn4HvMMVtEHJHJZkHi3QbLMDKlJggaq83tAOZDkV
         l0Th17wyGuZGnu5nNXMjSqoPVoOTparTV/XLNYlqv9bu2nx6Lev6yjZ2PKSXokM9DYi7
         gpYBTKHOxotVt2dwat3Rw31p0vZszBaN/KjC49j+ifAtQolTKnwPQSPvWgTNsA9FSPo1
         CtopNbAQD1Do+DBHAqOtArfHRr+nZIssJlw13xkDQTSGKg2MdWLyLyjhGRoNIl7TLoFW
         azMQ==
X-Gm-Message-State: AOJu0YyJObbuL3J9SjCjBjU7Rr6C6VHHdjBDCAH8/xNvfH8Ch4oEkEcC
	EksL90Awukg81v5i6I5YmfP6xZpfaA0smyikt8TvJ3SyYndc8bIbq4vIz1Mlyk71keQ=
X-Gm-Gg: ASbGnct07ctp87TjM87bFItQkblVJmwLkECRv6cLB/RvQnjz5aIv9RG35mGwvPahivl
	SusdNeCBA+4kUIZ+g27E/6Hu0O/kTl4gugokWV8HcV3QxyLnI0qdXLvWVsNETAIHJlDNrL6wOjf
	CYk2rmgdj7JgsvxVfn1eX379uQNgGOZnltjL4OTTxPulbGNvxENcY6XQHeEJBRglKQTxM7OqBPp
	ilo5WMmV15Guqjm4CVL7GByW7IL+pUiqGqb66Itsx3r3W1LpjAXuU2Cl++SfLVQnKQosUjAT0Vp
	mFtmfBADbhKbYPsUSlGvGNg/aClWa/tt1jKwSSHht58JcBSBe5Z+VehbyX0VuICSAH3laXAraF5
	O2WMN1pYZRK3XNDSRBKl8i/89pmGYAH7SGTs6LWr1Ca2Q27i3EL2FWTaI+pY=
X-Google-Smtp-Source: AGHT+IEDDXGHje61KhPvVD0wQh6hKseH7rH+kzb8GOXQ5/O7/SNQ9iRGs3Q+ht0YPg3yhdWyjh27jw==
X-Received: by 2002:a05:6e02:12e4:b0:428:cd3c:6a3c with SMTP id e9e14a558f8ab-42f873dd4famr77561385ab.1.1760029734163;
        Thu, 09 Oct 2025 10:08:54 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f90107a3fsm12115795ab.0.2025.10.09.10.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:08:53 -0700 (PDT)
Date: Thu, 9 Oct 2025 12:08:52 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH v2 2/4] riscv: hwprobe: Report Zicbop presence and block
 size
Message-ID: <20251009-643d7302be8ec611ea622aff@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
 <20251009134318.23040-3-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-3-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_100855_159136_46B1C230 
X-CRM114-Status: GOOD (  14.16  )
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

On Thu, Oct 09, 2025 at 09:41:52PM +0800, Yao Zihong wrote:
> Plumb Zicbop into hwprobe. Semantics mirror Zicbom/Zicboz to keep
> userspace expectations aligned.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  arch/riscv/kernel/sys_hwprobe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 000f4451a9d8..7a6ae1327504 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -113,6 +113,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOM);
> +		EXT_KEY(ZICBOP);
>  		EXT_KEY(ZICBOZ);
>  		EXT_KEY(ZICNTR);
>  		EXT_KEY(ZICOND);
> @@ -293,6 +294,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
>  			pair->value = riscv_cbom_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE:
> +		pair->value = 0;
> +		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOP))
> +			pair->value = riscv_cbop_block_size;
> +		break;
>  	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
>  		pair->value = user_max_virt_addr();
>  		break;
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
