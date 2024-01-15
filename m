Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BDCC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqE+FqdUSN55xVwGWdaZjbSiUcoJg14GDJHSRnftgFo=; b=eTBF29bSP0DBrL
	pvgJqSYv0p5vpvYI+84uuULSLj4vGpb0bpM1ozxRVqgEg7kbBfzCfRnxTc5Fykw/i5o/t3Oml4Adu
	SUEHjemhBM1P/IVflrbABQygMSGYoIPbx4802K1wCtg2zd3b8WFndZIz1kX7D/GVMc4h4qLL24925
	694kW+gdm3HG7qhLsPfwkCZMRhFOuiV3ffHyonwIXKB7vX8QZJM5Di/NAwYjDYsCgxURWscZIYvKT
	5ONFTfKHf+ZM/vH5dLEAAZ1X0+Qw6DzRdeT5zjB2kr+S3Zju8/8Y/6ax03fmo/ly8mAljVlqAQa43
	BVi/KrZKgAWsvGWx/8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP4G-009RL8-0l;
	Mon, 15 Jan 2024 15:40:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP4E-009RJm-0N
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:40:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-55965fd00aeso718574a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705333200; x=1705938000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZWeeMkSKDbBY1qxO0WKMfgjkDxXFPye7HRiYjT/Kk8=;
        b=Le4IrMyuoyBBVGoZEePTp48cubMLhTKj2MGP8+iPlB3as/3Lz9zfRLv6NI32ofCM7U
         Pf+1a7zBY1HLvSloplse98V4lb+mG85wb5BhQ/9wq5QlqR+pot2X8LBl+CFZzxH6U0ug
         exqJXWk8Nucb07y6WfIZ3IZQPPUwOnUxEaStf7p7ovUp+n8C7qS1UpcWPCAlPXgFU6Cl
         w4nsQMQcnT5Z6p0XymE0Kuk/5TIxDq1u7DcobbNEQSaBzMDxeXf+XTqNtAxsdfFLqhHj
         quiSLVX0S6p6e/fq2dJ/GLwbPNcZ+xUs0AiTQXsBCbnxPM08Xikm8jg1J4h8Kl1inazz
         uA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333200; x=1705938000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZWeeMkSKDbBY1qxO0WKMfgjkDxXFPye7HRiYjT/Kk8=;
        b=GaZ0qGvjfBAZywVQRuTR5OoLf2qXV8Bn9hTchhux/AUKZSg3yFSN0mQ1UyLRDdoOPv
         /nZCWI9eKufH0sWMNTJykBM1T4KO3qEbjJoe3wDIRGgi2ZCBtwaJ0aFLXUZoZfpIBs4c
         miTUWWvK2ZvApM76LnfbMll7zgSqwg/yTVsJ7I6dnml14aOEDlakXrAbByXVGNN0wMQT
         zwzp2XzqWdDFBZmNy6Jn8u6E7wRTIn5LSoCngU/nnMGWUybvJ0Zpc/zvCEogDpCpZbuh
         arJCsGlmKbVXSZugudOyYi601n/2WIzUFck1w4K4vvKgAkD2eG5rKSNn7mvokHHmXCdI
         AlZw==
X-Gm-Message-State: AOJu0Ywe2OMnU3tX1J8KtXpHxhO13vwbJh8y/KGs/1SKfBLvUG1iiLZF
	K6qwrADQW+js2FkFWsbmURE=
X-Google-Smtp-Source: AGHT+IF1VcAbumODZjATC3MlT9DwzPRqK5Zh0lqjrstbfTliSfrkRTpZc3S+lxi4ADyiU17Zs2MfOQ==
X-Received: by 2002:a17:906:c2c1:b0:a28:abfa:dac3 with SMTP id ch1-20020a170906c2c100b00a28abfadac3mr2638964ejb.153.1705333199694;
        Mon, 15 Jan 2024 07:39:59 -0800 (PST)
Received: from andrea ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id vs5-20020a170907a58500b00a2cbbebedc1sm4308824ejc.53.2024.01.15.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:39:59 -0800 (PST)
Date: Mon, 15 Jan 2024 16:39:55 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: enable lockless lockref implementation
Message-ID: <ZaVRy4y775bfcEUH@andrea>
References: <20231202140323.315-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202140323.315-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_074002_179188_E6D41354 
X-CRM114-Status: GOOD (  11.11  )
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

On Sat, Dec 02, 2023 at 10:03:21PM +0800, Jisheng Zhang wrote:
> This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
> cmpxchg-based lockless lockref implementation for riscv. Then,
> implement arch_cmpxchg64_{relaxed|acquire|release}.
> 
> After patch1:
> Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
> On JH7110 platform, I see 12.0% improvement.
> 
> After patch2:
> on both TH1520 and JH7110 platforms, I didn't see obvious
> performance improvement with Linus' test case [1]. IMHO, this may
> be related with the fence and lr.d/sc.d hw implementations. In theory,
> lr/sc without fence could give performance improvement over lr/sc plus
> fence, so add the code here to leave performance improvement room on
> newer HW platforms.
> 
> Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
> 
> Since v1:
>   - only select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> 
> Jisheng Zhang (2):
>   riscv: select ARCH_USE_CMPXCHG_LOCKREF
>   riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}

For the series,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>  # code audit, QEMU tests

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
