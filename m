Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF876C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlH1pijBDYOBexZBFWRjOtcNySOP+beUCINgFGPF7kg=; b=UD5jgMseFh7h4A
	ZC2oh+WqqWyJJ88SRM5V4SFCiKWgwD/Rk8LxRkImPaIe39Zwqjn0RiMROhBMyt5itd11YVfYCmv+t
	020doh0wwQOzX7PvCusF92x/JU9I8gUlxVWzKQBWtG/q+uqQ/E3/x2mwjN5GLP2gdKnezqRkKSNQL
	ONptzo67WsABrZgS6F2uOwgXzcCx65tcQ4d8fJSSuugaU9PAkk0ebZGh0k/8UojyNBs+gXvF1PdRs
	H9Q46TPgOKF9Aa+GWsghx8TGXBspxRWM/W3VDZU3r9IJzKiUyrN0WJ13FEdsAWlKXjBvUnPv79SW8
	Hc479/i4x3NA/xsg4H9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0de-00000009z93-3f3K;
	Mon, 19 Feb 2024 10:12:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0dc-00000009z7e-1Cyb
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 10:12:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a293f2280c7so565497466b.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708337558; x=1708942358; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgeM8dG/n4ZXzp2IsdonmD1u0nnBnqJlHW8kJO8yOgs=;
        b=XebSqfPofR7Rbv2zZvwPjmY52pJWqRQKx5m5hQRJi21vqp4WkrerRxeqMt9CuvKSjB
         SXWvbFua7r/9y39/35sVD73g9dJamf7uECZkcYP4BDqMtfiGcb9y97Sn6VWchKFY5TxO
         Ah4QiV/UnMiXCctO5LgFXPNNDlKDZsM6r6Cfp077TUXEBKD9+ZAkS2Sl3ldfzuYe2VYO
         JqmTCHOXikipQh2kRQpSOjXQj/qRISC5redGLZifffmjFHUbhYRrKiNLiFQps/men7CV
         qASBS06ilpYy16IAsRd9NGH/83YCX4EO630tj8wZZUfFB/XrLZeIVhn7I29a/LKwazWV
         c1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708337558; x=1708942358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgeM8dG/n4ZXzp2IsdonmD1u0nnBnqJlHW8kJO8yOgs=;
        b=rvLH/fPQG2Mx7f/zJknbghICvmezgIr8BW44b4G5ihVBk5y4pfyoIcwXlLpmAz5LtT
         Ev83+8u6sIFeRE4MCDMrPxabh171w9OCG5ouM2gPS36Bb7HbjEwVMH6DyrX4otInEn7M
         kH2FWCWn84DTbnE9As+5vpHKNwhMHUYHMxv+kwcSLytQbl9MEHXzZlZfgHMyBqaIhEZN
         tuIAWudSsCiGFx9Fr/54GXCQCFQQKEOj3sQegtro9dahWhPx2jKg5RKPbYUAzsKWIjiK
         BDIOh9JISiS2ObdygWxkFkl2o8jZ1FuRZEnhEUA4z6tafIKXEY02c7CMZ+OuUf/lcsm1
         JJeg==
X-Forwarded-Encrypted: i=1; AJvYcCUDqDbG7JqYVOhGXcHyu0h0wtczOfW3Q2TYrRZaDjEBWkfuwkFLhhuS40l8mNdk/YDesaakHYbeGhdZwnNqyW1LY2XNsPJN5NNipZnCjcTu
X-Gm-Message-State: AOJu0YycrNuErBseWHSiG5IGf/HraePSvJjZSKFxAg7Ej2q/1X7Of5Dl
	J8GJWvvFrHeuhh7BUiAq1iWePM8KO9TGLeKL2iBM7uqbNt8bB3vy
X-Google-Smtp-Source: AGHT+IGPaP61nqjHVTMc/x0JkW/xd0y45abMJsxgxvQEar0eKVaEJwH8BFRHSBIOwQ6v0oxR64ryDA==
X-Received: by 2002:a17:906:5f8b:b0:a3c:f4d6:657e with SMTP id a11-20020a1709065f8b00b00a3cf4d6657emr7757560eju.69.1708337557282;
        Mon, 19 Feb 2024 02:12:37 -0800 (PST)
Received: from andrea ([31.189.39.37])
        by smtp.gmail.com with ESMTPSA id fj6-20020a1709069c8600b00a3cfe376116sm2792190ejc.57.2024.02.19.02.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:12:36 -0800 (PST)
Date: Mon, 19 Feb 2024 11:12:26 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Eric Chan <ericchancf@google.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, emil.renner.berthing@canonical.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v6 0/4] riscv/barrier: tidying up barrier-related macro
Message-ID: <ZdMpij90S0iTT5XQ@andrea>
References: <20240217131206.3667544-1-ericchancf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_021240_366257_2A6F52C1 
X-CRM114-Status: UNSURE (   5.45  )
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

> Eric Chan (4):
>   riscv/barrier: Define __{mb,rmb,wmb}
>   riscv/barrier: Define RISCV_FULL_BARRIER
>   riscv/barrier: Consolidate fence definitions
>   riscv/barrier: Resolve checkpatch.pl error

LGTM.  For the series,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
