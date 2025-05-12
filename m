Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8202C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar83A3KBc/rKvfbBi9r0dc1JCJeKnUWqmpboPms+YE8=; b=vPX6vi0Q+3nVTi
	Q8QIlpKPh7vIV+NMv0fNB7H5KXQApQHbUoDxf64f9qGQr9wKhZLf0WoRseKmwkTuzYugt2gaSQhS0
	GdfuA6m276YM6ZfL5DwfBQFoepJiqYq4QwoD2tiT1UuBGcCIJqqjXbaXqIsAQuQOVkf9dUmaZdMI/
	KR0coDQHaYv4EfWmjmeD5GlmVJoxRVPpHNluiQ5f5nhtoEvxqxdeyTiTu2PeW74/kVNGHXLiroofR
	KIOQ0vaf1kJMetiD8YgqKKhC/gbH3TUtM78vlBRHaG2lAHxg7AO3/JPYpHxMTATgdohAlB/zjOkkS
	VliKeka/nOOa1lo7CgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJt1-00000008HXu-1UrV;
	Mon, 12 May 2025 03:31:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJsy-00000008HXY-2tM4
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 03:31:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e4d235811so57492975ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 20:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747020683; x=1747625483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/WssY9yXV1+tK4NJiyCXiRRN23AcQI1nbeYnFAYlis=;
        b=E6VI6qObS9xUkTVJSsYBB0kOR/kcMTfSyuO0hXnRnqJndYqWQ5wh80vfI4aOsHesML
         sOjYZIzpyxz8OPCU5tFPxBnnwmAeNYtL0T943z27TBkDwQEMdqgg2vtxJ9lTcow1tgFK
         C61hO5mUCS7wBLyZQ0VUKibCoDsOANFj9QehA36T6lrvee6tsBgl+ZzwJi4Gy0+T5f0X
         0WWOAzJw5oHb68dU9+9rf0QaZdbHxjg2Lm5P4q9ErOIM/hfur+a0CKP4k9S8QC5waS+b
         vUxnFr6q9XdHNoiRVxb4YaxUETMFXtx1lkgY5VDRPGJVad+Jic03YVol9LetvwuSPNUV
         fIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020683; x=1747625483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/WssY9yXV1+tK4NJiyCXiRRN23AcQI1nbeYnFAYlis=;
        b=TP62g9JdowY1xH4agUEmqXQY3lrErszcviabTuxmjy7+r4fu36r8X5h6wZHTg5Gt9G
         u40a/viNPP+GytXEflXutoH2JjfepBhQV/JmWjKiL1h9lbxl5IgU/F8SnfUbwmWhD6Yf
         ebpYwQyeYsL5IZAFAn1obRM10MKShdYIRmGVp7PC+hIV6U5qZhGY+kU4v+u5O0JJwhtE
         eraVDnL9lvPA6d7uH6tdCs6E2CdjHp2TpsdMNvPYoCybGTggcoD5C/ZWp7J2XPOhLGH7
         3xDKkuIeLTtpqzKPMT1HYwvXGNGIXXuRIMexE1myUy/eZT4jruGDoMDeXA0PJ58OVZt0
         udqg==
X-Gm-Message-State: AOJu0YwtBAvJh8KHDpmjXxaO8lfpLhkXzwQBiDGF31VjpY+eRd6MrrSt
	bGUZ5tTzSgnLYv9bvtiiHmfVFfeWDLNt2bg52VNsbUjY0imAZBVly8SuVFLA
X-Gm-Gg: ASbGncsRKnx/yYd3ZzhBfLOtqmD8fgYBxU/xtVej+LW2llLv6xDUjn3d7klk/ClAGFj
	1lR+izb3UwfzxtlR51jKgEYCVg6591TLn1C+KpTsK0JckH87Z6wIBABBeIgOziucwH1zfVCIL17
	+UOF0RtvOwvXZ5/qdITbRJ0B9HAa7PA4pkb3HJxOq6x8x2JtS0otw6fUnxkSxyNMGIkcrltq1Ee
	8moaRC7+/JjghutFTMDIiWh4iAjSoRq4PQEpANNxjDSewlnFZq5Xq8ov1jgy9wq2Z2BSyydY7y2
	Oag4IDwlvEMtKAsWt+bh6AB4F9RB4dyXOc2xbJQSN41o
X-Google-Smtp-Source: AGHT+IHV0sT/Lv6DN9WosHj9i5x1s5Dg+ynbITyJd4SjAQ9qVpKEXA3d0dxinHtz/Sypy1WncJ9paA==
X-Received: by 2002:a17:902:da8e:b0:224:13a4:d61e with SMTP id d9443c01a7336-22fc91d24abmr152464005ad.51.1747020683160;
        Sun, 11 May 2025 20:31:23 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc773f225sm51575375ad.89.2025.05.11.20.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 20:31:22 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware break/watchpoints
Date: Mon, 12 May 2025 11:31:17 +0800
Message-ID: <20250512033118.1071577-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222125059.13331-3-hchauhan@ventanamicro.com>
References: <20240222125059.13331-3-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_203124_780393_1A79B936 
X-CRM114-Status: GOOD (  10.97  )
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

Hi, Himanshu and Charlie,

> +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> +{
> +	struct sbi_dbtr_shmem_entry *dbtr_shmem;
> +	unsigned long shmem_pa;
> +	struct sbiret ret;
> +	int rc;
> +
> +	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
> +	if (!dbtr_shmem) {
> +		pr_err("Invalid per-cpu shared memory for debug triggers\n");
> +		return -ENODEV;
> +	}
> +
> +	shmem_pa = __pa(dbtr_shmem);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			(!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
> +			(!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
> +			 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		switch(ret.error) {
> +		case SBI_ERR_DENIED:
> +			pr_warn("%s: Access denied for shared memory at %lx\n",
> +				__func__, shmem_pa);
> +			rc = -EPERM;
> +			break;
> +
> +		case SBI_ERR_INVALID_PARAM:
> +		case SBI_ERR_INVALID_ADDRESS:
> +			pr_warn("%s: Invalid address parameter (%lu)\n",
> +				__func__, ret.error);
> +			rc = -EINVAL;
> +			break;
> +
> +		case SBI_ERR_ALREADY_AVAILABLE:
> +			pr_warn("%s: Shared memory is already set\n",
> +				__func__);
> +			rc = -EADDRINUSE;
> +			break;
> +
> +		case SBI_ERR_FAILURE:
> +			pr_err("%s: Internal sdtrig state error\n",
> +			       __func__);
> +			rc = -ENXIO;
> +			break;
> +
> +		default:
> +			pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
> +			rc = -ENXIO;
> +			break;
> +		}
> +	}
> +
> +	pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);

This is printed unconditionally, even if there is an error above.

> +
> +	return rc;

If ret.error is 0, rc is uninitialized here, which may explain the error
that Charlie came across.

Regards,

-- Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
