Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7007C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 22:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Umyk6KEAL0z7rZ/mMW+gKvfkdNERZgCoPxRDZMGFJ2w=; b=JZZFvkrgc151iH
	zksgUQgng292yWkPcTDeG3F1Uzbm8Qrb2xw7ANigHSHat/WLTZd5vDztvRrDwYXedMonMmo4mdlB5
	5X5BvLQMckWQoh3ocqhTl2AjgelmzvuxwNajzJxGCZUm/2WMAtqTJ5nS8fI8x+69j1aB4hg1lzIDw
	WKsMB5BR/0YtPuuFwnyFrWV/p7AefDR8asvPsmXHfnGjEj8ARXOTNh5qZU3LKsB+7J02H+nW9OmdM
	aCmvTw2mrJbnsjHf6i0I6DicMPZlbF9MLCwv96FsvvYzc7KHhyIpWZcooDrkJ2AFbxTqOL67AKUZk
	gKslhxfWcC1lRomw++QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGJu-00An61-6b; Thu, 10 Nov 2022 22:46:50 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGJq-00An4I-PG
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 22:46:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so6205412pjc.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 14:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88wxF7EFPI4oVF6TP1DUCBFSPf8iLofiNlQTDEC/2/E=;
        b=Bd5wnWlpK7G2yQB6xFMcBNaY19/+Hp53I5ByjmFSt7jOjwEMxLP0JeT2nEgmOmC6gf
         HAgp09tEWNs90/tiLbjVKe/lt9EJcH+6Lso1skB9teTnLw3NUzHiKFhiHrMHLYXsdivC
         5xseIPqqfCxv5oPrUDNJN6i7kt0y6BQZu/tlPa/qi3nBumpu907ktTSyswJOpr7zEOhL
         6VoiGP6cmaUIcaadSOhJ503SM/I9w2mxfm/tsv4PnDxn1h++dnmAh6JfRv/5OqhQb09l
         qY9lKQP5kO/lt/hsgIt61hStPeA0it03UGeS6fey4Wa93SllNYAk9DUodq1IqEjMGD+y
         8SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88wxF7EFPI4oVF6TP1DUCBFSPf8iLofiNlQTDEC/2/E=;
        b=7N6yRyAnojO1pP2oPEQR89zNH+VKwU16+0Z1eXdWxiyJt+Q1uemovAK2F/s+jFFc1o
         v6tYeooefX5mtUQsGdppqprPhVo9bFB6wy0liKZ6KGS81/Sv6tI2PJTUmMxH1VKTz7q/
         8i7UCsTOU8MDK9tY6ZJ8IeNT8I07/+fR+Fjwx6oo1znsd0aSxClvltfMcQqU0Uhxqujr
         +pl0RVG5C80HLEx3gJZdhGbWzva68kvcyJQROD1qhKsVPGgbFUPP80GCTamH8jcUbTgm
         5HRinRKfzlP/SDSEP6gFS5M2WAYIcUC0vYBo9cGd95mYCq1Q2l1fyZh85meO+7J+vKZy
         l5Yg==
X-Gm-Message-State: ACrzQf3+cNcOnrVVCAXZc+cKbqkjEfi0KzZK3/xp2frd9Jc/14tjr32N
	Af4dHrVLDMBJi+T2k/kb1r6jZA==
X-Google-Smtp-Source: AMsMyM46dMjtYOYxxhT+H8nuIspDfW4PXlfp8Sw3+5OSXjBnHTEwH17yXbjSY2l2DcZdiITD0hVxew==
X-Received: by 2002:a17:90a:dc04:b0:213:8126:867c with SMTP id i4-20020a17090adc0400b002138126867cmr2361274pjv.183.1668120405202;
        Thu, 10 Nov 2022 14:46:45 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id om8-20020a17090b3a8800b00216df8f03fdsm3594817pjb.50.2022.11.10.14.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 14:46:44 -0800 (PST)
In-Reply-To: <20221029113450.4027-1-jszhang@kernel.org>
References: <20221029113450.4027-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: process: fix kernel info leakage
Message-Id: <166812034327.20280.16820301693244403901.b4-ty@rivosinc.com>
Date: Thu, 10 Nov 2022 14:45:43 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_144647_061613_508B01C4 
X-CRM114-Status: UNSURE (   7.01  )
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

On Sat, 29 Oct 2022 19:34:50 +0800, Jisheng Zhang wrote:
> thread_struct's s[12] may contain random kernel memory content, which
> may be finally leaked to userspace. This is a security hole. Fix it
> by clearing the s[12] array in thread_struct when fork.
> 
> As for kthread case, it's better to clear the s[12] array as well.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: process: fix kernel info leakage
      https://git.kernel.org/palmer/c/6510c78490c4

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
