Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9DCAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98xu7PorXhl0pO4ecQVDs2Q0XnUcaPm8Gd0mlGWyK+U=; b=XmWnHzjeNt2kk+
	Df7rpcTYyNOqpGxLMWXp2ShKPQQBUKivkHrHlTg4hWhwP1SvUJUQl8rCaDy8zanugk3letGb27nq3
	6G+YYRe8c4q2F2nKkZYcakoNjNfNFi1mVj+Y2Zu82NntOw3Kv6LNCIkad9KDopGFieOOMV+UHLoy3
	eydIoc8NI4Kr9NwY6rhTpWgHkMdVwpDe0qzVw+RmvRCbRWcgpOQGrRNr9J+3OE4AtCVrTjqek4PcL
	qCYE0X3rp4NR+mkHbql4SYhnuRITVl+TFYHcipsv3/2zn82fAQBC3i++Tu0N58eGUFoF4rZt+tp8V
	RxPHlWv+VG1YfpqYuBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVo2-000000027Nz-3EyW;
	Fri, 19 Sep 2025 07:45:22 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVo0-000000027NM-25TP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:45:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so1134116f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758267919; x=1758872719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNMgvIIFlPxMgwjf1A0nfVZAfJVYlyoyJvlDVyQp+0I=;
        b=eZoZZj8LBnnSnuAJCU00NWXOf7k2XojdFxrtBJVCHvDPa7yRVJSD8kY0Mo4eSrA/re
         NlT6c39LkJc0cNRqGdfPJt6mdAfQizlIeS4gzS4/72bes43Bb8j0WzxJhrh3DAejTM3p
         QEnZeg3xD1AmlzXNhWC5UGe0txKBK5zzGq2bPq/x+SmvUsYdxLtG26PYT5XPfZAppmRT
         uWFNiac/uDFSiwCSbgK+3zgmWjYtbeITepz4eUXPVVWTGC1zj2CWt8V0kWU1X3XI2wGU
         JAYaZdA7Gw2QMJH969jDW1CBuo0CwVNcbmZsDWrjN328ZbYqyEzJFeFcDMSYCV+Gzey6
         TDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267919; x=1758872719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNMgvIIFlPxMgwjf1A0nfVZAfJVYlyoyJvlDVyQp+0I=;
        b=fu+OBwixYx9WmTwu+XlPn3/M+STfhjuBHwdjla7k9yIFa7bf474VbVEy6jfIXfwfoR
         xBupR7MagbWxJmm3GrCdlDOP1hZFB+BftehFVGBCV3DvKbRZgJnbRDAsGE8lF9cqdz6b
         kZBOU+CsRBmUt1eRBlCCHr2gYUm80D5VbbTCotBwffRFaw293rO+dNtcAiswMYoQU4ol
         0J4Prh5KE4qOIkgn882DD2kgZqmaor+xRZa/rwfF2IVKleXaz3m30jB8iBLAEVhTARKy
         mEoc0WxYQt9H4nJlK1MpgSxDCAOXlAurVSvRT6Sh1CPN3hAtMz6ujBsZTvYvz5QYPRo7
         5PuA==
X-Forwarded-Encrypted: i=1; AJvYcCVcOSItf2m54qM+WMyOntGurTsnvd9wum472UIyRREeR5aWqQc6EtS7bFVJiLW1GvaTq5hTcMQh6xi8IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qkMk62yxW1ZfQrBVk6Z9f+SAFHWZ2G9qAMhys29A+wM62SE5
	DQJGACwAiui/Hi6Mz0sIwcPWzoYIIS52VYxvxVriSMhf6ynFbDn9Zogp
X-Gm-Gg: ASbGncu2APZgUbWJd6CY9Vt3x9QevJEP9lPIyP2rQf5k/DIyrfJIyJSnrIgxRy9jeBk
	3TgmFspdR1zrb1n4hbWoZtb7TImUrzmQRhGHk4dYOyoipZttk6Vpk0WdtazFUej+C0lo2udy+F0
	+JHgF8NF/wi05NJdgV1HZh7ibqQH8IwzTKhhh9+0K1SLP2AeSHt4K/NXHmRst3K+tA3ljzGgVQY
	QG3n9uqisP3KI5urApX61tZG6YQsmLaqAMtdY0VFxEs9sI48XzSa8SFoz2uP2lYV5o8ktblcdOP
	1/AYAYC36Tf6qWsq3uPZknPUqHpZq7++9jUoupYgh52eBpLHSg7BXIlNrUwbqjvfCnH3Tv7NO2a
	4JXCF3b9NZSvaK2+2x+bF
X-Google-Smtp-Source: AGHT+IG5w03VkX5w0L+qmk9oTgo8UMgIyxUlqtHb7DAa5eouVlBho3WcVeCjzVUkdw6abcur45ZJQg==
X-Received: by 2002:a05:6000:25c3:b0:3ee:1586:6c85 with SMTP id ffacd0b85a97d-3ee8713efdcmr1612059f8f.57.1758267918368;
        Fri, 19 Sep 2025 00:45:18 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f3211e8c7sm73637115e9.3.2025.09.19.00.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:45:17 -0700 (PDT)
Date: Fri, 19 Sep 2025 09:45:11 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Guo Ren <guoren@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
	brs@rivosinc.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	apw@canonical.com, joe@perches.com
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension
 support
Message-ID: <aM0KBwkdPFD69oui@andrea>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea>
 <aMoyntAydNMtcl+3@gmail.com>
 <aMw3504EwlnDOJI0@gmail.com>
 <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_004520_541671_8F734EAD 
X-CRM114-Status: UNSURE (   6.69  )
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

> The existing implementation of spin_unlock, when followed by
> spin_lock, is equal to 'FENCE rw, rw' for operations before

This is not true without Zacas, that is, when using LR/SC: write-to-read
remains unordered in that case.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
