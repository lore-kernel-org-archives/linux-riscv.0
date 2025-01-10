Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D43E7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 00:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GU5biHqnOHYBpIUTzvsWH2F7CoLImHTu49w2A+IW9mE=; b=GTOCX2SuqbjJTw
	Uz/yl1ERBWy+OXsEDAoTihCCIJ7XavifD465ugTS2vAiqUYxZimyMlnF5BqtNCpcC5Eq/k4+yAUqb
	KxKsZ02Y3UZQUTBtlc0JKYqCjy/WsllKq3RU4GkzzrVNVYaidgsuI8yvKfy82lvkaPTuLMhZLnTOo
	zQDqUBRzdFCX9Jl7x0QmxtSE3Y2elfoLeEgSJrmNuHz5HRwZXehcen24hrKgz+JqwbBglFQB8cGxW
	Q32Pq8SIZB+xopx9ofuS6BbUfZLFKohxLdErJ7kXsj5eTtDbhY7HDa3gVU5WYCJn1IuSBWNFeBzfs
	BgX2AcExv6FK2R1/JQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW2sG-0000000DdXD-1Deu;
	Fri, 10 Jan 2025 00:27:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW2sD-0000000DdWE-1cEN
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 00:27:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2166651f752so31136535ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 16:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736468857; x=1737073657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E5FIVQBG/19Kn/ktK89Bwn+zvRNqLpJe6idV6sMfvB4=;
        b=XV2UlkEZQ4sD2svPmaXFNYxnKMeAmYAzWCHgX602DDl7SvTS7/QC2/JiM5C0pKeBZ4
         LkhQzpqNuHUE/SyTRwh60kTsq/sdbzm01nOd7KinvjvN4OZKgdJwoMezrSPDkcbyJ1+j
         J4eHO2QpV2EZh8TQlG1UGsH+T6sADf6Q1Zk0YWYI5Ye+pNb+fsKLr8t7eAsPUmdHI3BP
         MxQ2uSjQDl2r+GgndySdpfW/Ngke9XRMEMkBiB2fMbMw37REfOAUaq4qVY+0/8MAGJpp
         zyGVgdbZZk0yI0+B+MlMoqXP7NOvdTJUoPSAmPX7mh9uu+vcQk2Wp0QEYNmgYMjKxyqd
         yGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736468857; x=1737073657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5FIVQBG/19Kn/ktK89Bwn+zvRNqLpJe6idV6sMfvB4=;
        b=tr/AL7XAHQiLKjIXLrV4vDsxPOnphFsutVFE5+HbUrrIyx+p0T5gIZ8a3vnggAXh9M
         BABDF1cLkYXwNfe3Z9L1ncQKMB/F/s/MqIhWWOKrv4rLhc9YI2DzSZF1cDZ5Xu7amiXS
         s+cQDVErPU0kn6OQjHMpMhz+f3czlHHsCeeSbqGSkqxhtfMAI9KPyVliZtD5fmVnvULR
         zQ7GfGzt1V1evZlA8L9HpmwGMxTvWU9e57ul0hL4ewkhoC5Qc7gHJxv4XMessFSn9j/v
         rNUqVTllVdzIVfddoZ7CNH1mpHaGgTcnc4dxvZ+gZBTnfNlFDhwX4T/KYDJ3exjW7paj
         ztyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPExrRMt+gx8OeSy3gZ7bZVhYDRP5gS7WnnftJreFNy4wMtFbwB8AreJnzeqO7UqxLbtpAtCxYsBcVMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDeWbF+ffOma+c3jHKDrwntHz3xvZ5VZ7bFEfEQKvjDTV+M34c
	Z4VisxQ/kLupbuPRuiohesGwWqqWSmEqRsZon22siu/o3riqMG7tWqdOXF8pCwc=
X-Gm-Gg: ASbGncuQU0PXT5iKL7px3AMf4MaFB/FadziC+j16LLRw7tGkURrQJK3asEIlFI7tcH8
	R8ooASA1O9WSyiaNhZEW9X+n4IRtXAvnHeSauJ+IZlA+4osjZwlO3w8M6vP9by4RA1VGKRgb9mf
	6qty69+sEFKCmzKRxwEyHwukVfzIbov8gfvXcEA4pErNKNiVo8HSMzzycSgjOHeBQvXWvG9YVP/
	pufVRmGz8alyj3OLjNOkji2R/EdLZw5vVicjWz1hQHwFT5TxsI+
X-Google-Smtp-Source: AGHT+IFFLu559HZep7Z4pf7mVNR4iyH+/ZmHD6Q1a3lnPqYVJRG2tLN8xkguxuqbMFb8E9v4uibeKA==
X-Received: by 2002:a05:6a20:2594:b0:1e4:8fdd:8c77 with SMTP id adf61e73a8af0-1e88d13b502mr16186403637.8.1736468856651;
        Thu, 09 Jan 2025 16:27:36 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3b1efd4551sm1430396a12.68.2025.01.09.16.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 16:27:35 -0800 (PST)
Date: Thu, 9 Jan 2025 16:27:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, greentime.hu@sifive.com,
	vincent.chen@sifive.com, andybnac@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] selftest: fix riscv/vector tests
Message-ID: <Z4BpdQA4t1ip0yK7@ghost>
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_162737_673185_F1384968 
X-CRM114-Status: GOOD (  12.50  )
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

On Fri, Dec 20, 2024 at 05:17:25PM +0800, Yong-Xuan Wang wrote:
> Add test counts and pass message to remove warning of riscv/vector tests.

A similar patch has been staged on Palmers for-next tree that I sent out
a long time ago. I also reworked these tests so that they use the
kselftest_harness [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=8fcaf922831887e32c8bdf5ebff76bbd80c971cb

- Charlie

> 
> Yong-Xuan Wang (2):
>   tools: selftests: riscv: Add pass message for v_initval_nolibc
>   tools: selftests: riscv: Add test count for vstate_prctl
> 
>  tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++++
>  tools/testing/selftests/riscv/vector/vstate_prctl.c     | 2 ++
>  2 files changed, 6 insertions(+)
> 
> -- 
> 2.17.1
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
