Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99669C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XRDn2NQU+y+T27/fi1umGMioA5H+3xScxstTH+AAc8=; b=nD6G67a06jP3ZG
	EKQXXphCery44WF53e89nsNIxONNa7R2ht6R8rmZsVnz5Lhm3nQYdRGCuRbzCQJ4Pk49ppqVqEeoi
	gG2eWllWiYA3kapiN6lj/E4LsESzSJg9/+QjbRNLnUtrpswa4mVpZteCW1ljVU1SIHOYI/1JL5kDe
	tU0oiaoaAUpQBSj9YxTb/es6WONabgcXrPeSNgRNsryvKmW3E3uZ95CijrP2DzhrD4w9wQ016seQt
	J8KXMbvGPHgXZRMQnFDSt9LFgzdTOJWjAva9uYGbfi6tDItO/VKAUOYaMRYxKw7NHpNZCyvbzCE3z
	bY2B9ErCtsUmjX434RTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lkr-00Bplt-76; Fri, 09 Dec 2022 22:22:05 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lko-00BpkL-3p
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 22:22:03 +0000
Received: by mail-pg1-x530.google.com with SMTP id 62so4443842pgb.13
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17FnP6NuN4raoUSRE2YUiZ5vUPR0p2ye05+ytN654ic=;
        b=F4UHwZiTlPkAo7AvWcSNI4HQUOZhXAQtuRzVJdWRD3KavGlFTli2nqZQjpBwzS9Tv4
         ppJxPpDy3UlxCMNCKZ48/hBsc6UyWSJD5qUf7D0wO22zmauBuUdRRxTLbUlVsbpDySql
         XuVyOGqSryZ27lmPWMNwy+fJE8ikCSGEZSHtFyHZFw+0zYawuVjy7gnevx5t3/5F/N25
         8i4mNBnZ7O0AfkUbLJL8hXf3+H31K6C6YneCh2Fxzh/16ZKBjufch8xr2TeylpszV0Hh
         6OLF7PV+Mnn3SVaLUy/Wckb+zy+JTbytqvFrNXBduRxRYr893J1d1eE3JxLeBla/N4oU
         67Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17FnP6NuN4raoUSRE2YUiZ5vUPR0p2ye05+ytN654ic=;
        b=rJBieGhfsO1N74g714Q4HfQ2vnItmge60MXeP1oPWyB7jSTMlrKNz4Yf0VqzucL+Gu
         F89XMmdy1uoLhG7YtM5ic8xMB9eug46Z+lGArrZZV0UriguektaT7w5Lf3VpcOdTivuX
         LPk6jD4GwlW2wc3KIBzVeZ/MBAL3hjO31U7JzPhyYrBvz2lLu9dCfLuQo5i2BDY7+9Tl
         y99SCqe0PT8/EczY2g7kXgSZTK3vr3CJLuevPRZQl+/E5IeeyCP3kMojXA2Si/EH+ZOd
         LcM/VDlk0gMxee6boAbQmT77k/AIFyT5nS62YT4wpsawvToL6pe53ux3YoyHMG1K7ZhX
         AZOA==
X-Gm-Message-State: ANoB5pnZ0dd/nlB3AktytyZ4oI48fhA9fKdW4gWQjt25hF4XBbLGr122
	pjDKEVgB+VlWDGVXWWos75mw4A==
X-Google-Smtp-Source: AA0mqf6uLRDqMB34PJyc3akalpJi05dLI0+PT7S+ktCXKIu6lW9xAm/R5lkdpc7wnnEweG9/QvVGww==
X-Received: by 2002:a05:6a00:26c1:b0:578:101e:ddec with SMTP id p1-20020a056a0026c100b00578101eddecmr2222026pfw.11.1670624517964;
        Fri, 09 Dec 2022 14:21:57 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id y15-20020aa79aef000000b005769b244c2fsm1677037pfp.40.2022.12.09.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 14:21:57 -0800 (PST)
In-Reply-To: <20221128023643.329091-1-panqinglin2020@iscas.ac.cn>
References: <20221128023643.329091-1-panqinglin2020@iscas.ac.cn>
Subject: Re: [PATCH RESEND v1] riscv: mm: call best_map_size many times during linear-mapping
Message-Id: <167062285116.3097.1605819842791838196.b4-ty@rivosinc.com>
Date: Fri, 09 Dec 2022 13:54:11 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org,
  Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_142202_171972_695BC2AA 
X-CRM114-Status: UNSURE (   5.87  )
X-CRM114-Notice: Please train this message.
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

On Mon, 28 Nov 2022 10:36:43 +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Modify the best_map_size function to give map_size many times instead
> of only once, so a memory region can be mapped by both PMD_SIZE and
> PAGE_SIZE.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: call best_map_size many times during linear-mapping
      https://git.kernel.org/palmer/c/6ff8ca3f93d3

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
