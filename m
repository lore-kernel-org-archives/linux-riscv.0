Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C61C5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 04:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc9GdNr+zSaXakktXVSevxTYpMsmRz+0OxQt0fKfiXk=; b=B+l65fcH/EKMwf
	gGya8BCSGWKQW/dc3L/G9GdWHRNeZlP3TgI2CquAhZSQliBgqFJJ/+Xq6/yGdfY0tQZrZgprKBJ4k
	VyrIX8qI/1jpJm2LjkFSQ/gVaQBjmIE+Arqh4sSCOr8VU0REGi0lHoWKcahFiPJRr9B3+iXGQap5R
	334XWdkB7SAyO6V77HMu1c/lkHTtu+3Q2YsYthdotbp1xrhIViSmXD2B5GEv7FfwWG0y5qeoM/tOA
	cH3Jd+yRSXql6UFi22V4wcidDqY2dlBtaZWCS947NlS0eY3ivBWJTQZim2mjjEk7PFAiFLRcY5jza
	szJsgCm9U1aHz4imxS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioDC-00000009ld6-2F9g;
	Tue, 27 Aug 2024 04:53:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sioD8-00000009lav-3sZ3
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 04:53:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2d3da6d3f22so3928519a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724734422; x=1725339222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvPg2odSODo+vDn/Yud57+BmBlEnCSstG5MaGB4eQ8U=;
        b=m4zcsNqOUxpKWE8/ahJlir7X25r8DzXCC09+R0Gx4IYRJJ8qQRDSSn7gUmUsae1HEt
         TmT3r8bL2ij6QIFFlfO1imZhXJyrvg7iYkqPd77oiSyRHbuFum5P2uL0dyM2n0QbgzFA
         vuTtHch8TSkSs4pLLpFJRZh6Dyk0Vw5uKMlBVKwNkIbxJzlbLDpRkDU2dmWws7l35qEX
         +YjhtgYanh8oln/95bGYBHF7OYh48WUY1YUfrhsGx0s6JbPI+KEJ/mE0d3nJCwfB723E
         2LRZZ5W/Wsa+tt7w2hh3aiSUhxgne5g/biXruoLOYOSib/9W1HaiJ6FiubD61umvy548
         ofNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734422; x=1725339222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvPg2odSODo+vDn/Yud57+BmBlEnCSstG5MaGB4eQ8U=;
        b=KcYYbx3pT5ihl1J9cEBMZSw5PBSTvv4xRQBN4VD+BOT9N+p3yRCPEUSnegmESwqnrt
         sgZE7TjbaU2Q/GsjTZUSKtKnv6kh45ndF0L3WTO3Ml5F56QtrxKpmiodwSWf9nHenJS6
         EQuqQZn+gwDMqeDRB9IiDfCEWvCl9rwxpTL72vGmNXaEeolIHVhZBBSGQ35nrIpJiGIw
         KYZIf7z6EhCnPYp43OlgyrJ+0BuIRtByfVwuSX39bp5ygHY8v+Nztj7H65KbD6uWJJIP
         RdqkkgExQj6U03JIW/MeTVTLblHv0c8mZqqJQPYenzX3cVG3EdeOgqxijAqmDIzoD+z9
         t5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUEgkX4CgB16+ECFTv17D/fiHWDGKqk73NIxr5p+txMrLDXNSsiF2iDe37WtyXdoxIuOEzW/ktJKEJxcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY4ws5tO0fdgFmKtWQ+CNR4kP1h6+/RkxjmZmQ/8/1CVxRYtxr
	6y8yLauglSqshZ2MjEx+o+MhklGf4GXSdvQC0f+Wf1ZWMAfTmu8N
X-Google-Smtp-Source: AGHT+IEL1kKWGCjT1JsS3shOvdnMLab3oIYLzpv2H9njpHNKyiMPBT8u41muELEiFrxu91t9FxKUFg==
X-Received: by 2002:a17:90a:6543:b0:2d3:c933:6c72 with SMTP id 98e67ed59e1d1-2d646bcd8bfmr14272772a91.8.1724734421649;
        Mon, 26 Aug 2024 21:53:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d82a6d3d42sm125910a91.1.2024.08.26.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 21:53:40 -0700 (PDT)
Date: Mon, 26 Aug 2024 21:53:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v11 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <5c7d6c42-e9ab-44b3-87d0-f2e4711a8c24@roeck-us.net>
References: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49536C786048D1E676BB9C20BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49536C786048D1E676BB9C20BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_215342_989108_8159E6C7 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>, linux-doc@vger.kernel.org, Chao Wei <chao.wei@sophgo.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Hal Feng <hal.feng@starfivetech.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 17, 2024 at 10:22:57AM +0800, Inochi Amaoto wrote:
> SG2042 use an external MCU to provide basic hardware information
> and thermal sensors.
> 
> Add driver support for the onboard MCU of SG2042.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
