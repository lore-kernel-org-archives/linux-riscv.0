Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1CCD5BB6
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpTiwKpFvqdJqx2odsrvaqKIzMO2cIC9eTVOhRSX1/c=; b=jagEYWF/j2iTsk
	b+YPaibD2sztasebLcKtQOF3kHJIecBA8Znxfk5I+oTNJO7VPIirWvHiR49TPh2wpxFad8aub059t
	syFmg/L5bXfcNJ4eABEjujZuhR9m9+ViyafIvRZujeFIESfaklzZjs1hloH2siFkl3xrZaf1HlcXA
	BtgM85ob39pyfFbGIpJFxZK1nc880di4a71R+ckcuC1YKoLrWzcI2kwPKTiW9E8iUB7PNV/HCL+JX
	6n2x1aRY1YiuUlNntz0eticOlC/qJRBGlOYnvubJ35bU96BJt8nczQNoZp+y6RWopWy7NhvBrutTh
	WywagcI0XRil66IKK5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smB8Z-00000008DMd-2uE2;
	Thu, 05 Sep 2024 11:58:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smB8X-00000008DM2-1tQp
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 11:58:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-374c8cef906so412070f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1725537530; x=1726142330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6iMplLwFhYwIhl0QufQeylFzl9DrgK03TZsuK4H5HM=;
        b=l65kGUQhuGpCMlgbuXLcpJhr1oS80tNdttdo+BjPP/JQOpBZtPgRnwI73hJuSP4Yg7
         OVCpDxIn2eeL6ROiWPii37QA7Be5RrVmjBKtGa26lcukpa2X0uYoXCRBkSRyfqrvDkjz
         UOOWvfJVhisCLj+xxRWeDy6926mlZsgP9LneQW1btNKRd2039cHZhHccxsl9UJBkojuW
         uZ6CAxI6Dx7CKNE0kT+IkOwLQ1tOtcWV/IQ4ulzKykuBSh3u/47TWYok5X/suk+vedwR
         TH8g9QihtJ6s6Qn7xek819o5qqZcqBn7hI+mcZZo24aqfjdsX6ataAMxeYyhQljsvoRP
         OKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725537530; x=1726142330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6iMplLwFhYwIhl0QufQeylFzl9DrgK03TZsuK4H5HM=;
        b=toF3XrtDDWXnmd5JounvKyMm9Vjnkkth6Wbl9ENJRobbmB8+9NegEsFpawu2ixNuDq
         6Fwv974E4mE2TN0rHGB0KvSrNKRZxEuBViMJOFciTkO+tQcXr30BN5aoP0zlpA5JRnVh
         jZuD2xhCC1BqwgvWX7/MLJcZoH7yxycwnNPQ+kfX7JjGWyrLHe33DDiGj3LG7GUhBAYB
         TmDMc9dTWcN4jhU9JzSzBgpzTUg7l1vt6DLNvIttcPVBvj9IJwIE/VqcIKpQ1ylQwXpK
         YtP8twV9soSpRajp7NYRJRkCTrMu1bPkiISjJncIu7W3sa3cbB/Vqs+vzpUnrbbG9nG1
         9Tug==
X-Forwarded-Encrypted: i=1; AJvYcCXWljaCzWtLV1kSXVHJPcK1jxIT6ucYYxMdy4wxkXj1gV++R+YStM5oYW0QlW1th2CkdS1mz1VPp308+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsR1IdBDLmd9uLGm51wmm9dqSLXNJxSjTDulMD6VGiuzo8eEIB
	lxBF+q8ez0smFAs7uulouS54fN21PTgOUf6mNFLR6tzCsN77sDaeq2oQbzTU6RU=
X-Google-Smtp-Source: AGHT+IEX7o83QIs1/7d3ff0VhcEX0jV5bPDNukQ9NWMDwyctUDpHADIpOxuINPKbM28EQB3PlIZO3A==
X-Received: by 2002:a5d:6d03:0:b0:374:c7d2:4d69 with SMTP id ffacd0b85a97d-376dea4719emr6709258f8f.47.1725537529708;
        Thu, 05 Sep 2024 04:58:49 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374baae211bsm15247900f8f.66.2024.09.05.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 04:58:49 -0700 (PDT)
Date: Thu, 5 Sep 2024 13:58:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Schedule SBI-0.1 for removal
Message-ID: <20240905-fb435de5a664ac2060776810@orel>
References: <20240904145404.6291-2-palmer@rivosinc.com>
 <mvmmskn5uh2.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmmskn5uh2.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_045853_514565_D3F57977 
X-CRM114-Status: UNSURE (   7.13  )
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

On Wed, Sep 04, 2024 at 05:06:33PM GMT, Andreas Schwab wrote:
> Perhaps follow the example of commit eb07c4f39c3e ("mm/slab: rename
> CONFIG_SLAB to CONFIG_SLAB_DEPRECATED")
>

Yeah, at least deprecated.html points out that the "_deprecated" attribute
is a typical way to convey that something is deprecated [1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#id1

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
