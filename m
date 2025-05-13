Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A0C3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 04:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9KxDrgEPTxcbIQgYjb+yZQ5tiQsOL9+lDgPcVHHstU=; b=YUH0xXNyU5oO7w
	+GeItRM4uKBf1PJ38EJ64P4pK8tWDuwfaaNZeVEJrO+P6u0yiyPxKSlxW5p7R7IP8h3se/+TdcqMX
	sqUwBEc8kjrLXpsV4KlzmOvwv8GE3VPqSkT+eWS2B4a0/NXoNV7lPmABbGQLG7TclzawdVaqzrdu/
	VZE4dM/lQWgCbyPSqi1K4G7YndrAPz1UmEZd320dA51yI+ua2zl9iB3gOzeGPwnaCeKDbvMS3BG3M
	qm+Xqm+n1I5R7FPH+1Sds/UB+Y3OaLLrHrg4SrEttLLgIfi+RwchFBnwTvzC34QBw3/gva75jTbur
	rMD9QBnrrxvyrP0xNgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6b-0000000BIba-2h9j;
	Tue, 13 May 2025 04:19:01 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEh6Y-0000000BIb2-3l5d
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 04:19:00 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c559b3eb0bso355065885a.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109937; x=1747714737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=ds4eIWKPdsslliMoEHiLkHpYsr2h6j/o6yshdUEd0VtNMODCVIzygbAMrzMg+/l+Aj
         pZ4/kWFVkcMR+ZipsqycDabfnr5cD/lOLfEjpBMaWMpVGJGA3LNjYcrflThqS2iLTwH5
         2aw1yw9jxuKdTUThds/5cEKvhr681A4/8LJh/B6ajgVyDZ8WihG1dgeolIQ3c0FkBnis
         lSHrYrrYGg3cOGJezfc0XVMbia2di9/j4c2+mjrMbYPeXjC4PDVMt5JzwuOW3dBrqyN9
         00vtagvpbOMh59hsWL6XV4K6vvonoCbZPfBW05A8atmZMyy94tibL+jKz3psR6hiqavC
         mOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109937; x=1747714737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=Tzs+HXwJa9z4EcX9neIIyifuLIDpYPwNy0u2SE5wrSeuUQm/MCx8AsvXKJ73jovAdG
         SsB0X9SHkLae/8jWkSRTR38ZZ7tUVi2EP9aI1+X4+ulWsWHjERk97CKUIo8am+uNAMK+
         U7j+SVxCaz8twEHeL2bk9s9A586opBlhA7/jp1TQ8tkWZD6G1UTGlSAD7uSNwqXdJfDh
         wXMFbwY0Z+ULSPIfzk0wetT7UHmZQHVnp7D3sfGrilKHuxDpQ5wmqk86No+XzvoXtlf6
         j5pyh71TuzFtOCR+SVsqu0WsKaW4nXIDqRzmEHy+UFoApGz/avyy/zcYgAuaiekvzSgM
         VJIA==
X-Forwarded-Encrypted: i=1; AJvYcCX6kGxi6J3OGC8/HD7JB05MEWA4OE/bkqZfOCWMpqpMeUQjYpGkgx8VKS2gxlLWf2HwgYeQdBok30u9LA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpl2RwJBuvYKM3aOpo/X3aBUXGZ4vVG0bZ7ZSVA/5QqMLNeCb0
	U84Cn9iSwLp9vZfpJjfFnWZZ542v/HxpKbBvnZVO4zUgaQNM7+sn
X-Gm-Gg: ASbGncvOKJlSfGXOINvUgBJLDQ+dDx0HCPOdxSP+r37rqdg1tgDgPEWDkTCftJYpgyj
	y07b1npdIT9yVoogHkLRaS71Y5wIL2UFI47TpvjsSZmgi7W6XRFki3C14yK7cT4iM73uuZYk16V
	iMSM9AGh6xIdfXHhPr2Rg0z9guTy4Vb+OqgFqhhrq8ANgylJRCslWPf1+3y3DHp+GrlIfUrlJEp
	WwijTOOEwoEsWwBUY6mn1j7oGmSe0hqfNW5nD1Hib1L6EgCWEWMTqjsYo7Bfir1FG+K+VSGQFW3
	1C0KklEHARCkQFSxZ/Gt/oE7LE6AWIh0zW46YA==
X-Google-Smtp-Source: AGHT+IGlBRWOdS3CfEkXVh58/z7On7nwxsAIWM5VLGw1h5sQ4XN4zOiVj+aqM40scUBbTtFSgOXdbg==
X-Received: by 2002:a05:620a:9518:b0:7cd:155:383 with SMTP id af79cd13be357-7cd01550387mr2276285385a.30.1747109937021;
        Mon, 12 May 2025 21:18:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6378asm651965985a.29.2025.05.12.21.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:18:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Tue, 13 May 2025 12:18:21 +0800
Message-ID: <174710989159.597941.17259091695735282020.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_211858_938604_35B196BC 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, 30 Apr 2025 09:26:49 +0800, Inochi Amaoto wrote:
> It is a hard time to maintain cv18xx/sg200x device tree file, as
> it uses something that dts override, shared peripheral header
> and something hard to migrate arm64 arch. So it is time to rework
> the device tree file and reduce potential problems.
> 
> The part 1 change mainly focus on the format of the current dts
> file, and try to make them easy to understand and adpat for the
> arm64 arch.
> 
> [...]

Applied to for-next, thanks!

[1/4] riscv: dts: sophgo: Move all soc specific device into soc dtsi file
      https://github.com/sophgo/linux/commit/e07daed2a1577ec5b9eafcfa0b690d4082661024
[2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
      https://github.com/sophgo/linux/commit/4f6d5f22f94db169b58809de57db2fe95ce3fa35
[3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
      https://github.com/sophgo/linux/commit/4a7f2bba7bdb2d3afbca8d40268503d32868c325
[4/4] riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt number
      https://github.com/sophgo/linux/commit/53cf91b37246948935de7147d09ae6a98070400f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
