Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C16C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeGaQixVKgDdh9lpd+FhRmwBoSoufayBfm8SXt1EDFc=; b=iHNZk0xsFWOeTf
	sskGR+uomXzwdGhn10fDE0ZWthvqZzhjxxmsOcnxg2KbtHmD46+GXwh7WuQ1nRe5JeEHhu1iEoeBA
	M7D3eeFmnzA7Dog7UUuddk4qjGUmn/0m7OICTyrMGdluhdDwXEkB/9Ew1FQuiyhT6eGpRMfSxTrrM
	yx8zpJejklw5YDfWPGVHlpQPO9mw4hmLzMikRcE0cm5TGn6X18cooduVbbOPGV8JgqpMaAiThdQXH
	ERntbCTdGCiub8pzQz7+EvqIN7PCWdGBSVG6R3MnBGIwQvQvtc84HL/eI1rRIWgF0x9DNMJ2fCyrL
	RjmssVNFT59MEiCBNTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Rnx-000000014Xj-19zf;
	Fri, 25 Apr 2025 22:45:57 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Rnu-000000014XJ-0NPp
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 22:45:55 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4774ce422easo32498351cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745621149; x=1746225949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpxvPODl8XU4Mrgb+cq2MoZhp3SQCnv4izTBeRkVjNw=;
        b=GvY2mw8t3klRLrmir8ggvl437KXc8MStMGiKq++uqteSAHZ8zh4JI2CosMVjt81xPM
         BWuoQKrnkIqDW3zzO9QkcZNBZWkeTR/kwpwmu6caj+6uMPzoUwH6z/y12o7pnuQLDCcU
         LezxtIhuqyFvS/P2Hj+EyNqgKyClU7cvFbhJzBEjA40Ul+gmmCasE2LIYHHeq5ai2Hsf
         EKD0aynZ6ulYueatO+rEtFQ0ZlCrS9/Z4rqZytwi2uchueRrRSB3nGb58RsYL5PTjjwb
         jNxJqHzLA2TN6aSsNEP2iIhglJI16joOlfmbIiLQWFDRvXFpwPKjSzBD0OXQJxwPBfiX
         9Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745621149; x=1746225949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpxvPODl8XU4Mrgb+cq2MoZhp3SQCnv4izTBeRkVjNw=;
        b=wIgkhwO3XuRpzeLqmlmB4GZzjfjLtaMxji7o3/d4Nj6J6NFcEJuGEzfr0bMHeRNYbj
         B57O7HR2MzX6ZxbF8pKTMihw4uKUQ3glw1xqeW79IEuWmhNHh1YBM65d4Kk0KuZc30WU
         yGEAneZYre9QATgHpIyJkeupMKFlAF9zsfCTspfl/tLDnHlGdWLRMWylbTqU+k/40HMw
         bY2Nvyo5pwm5dv+3jWWVMTQtdusGOqPaAPZgDuTFnv0P+E1R0ebIIQAaGciQ9ex3zZCm
         Hp+2se+7xQpnI/RlrIF4SzLdOT8CIApIFyCSZwATBdKfTS9Bx8pK0MHWndtzBunqUE4k
         Tabg==
X-Forwarded-Encrypted: i=1; AJvYcCWslTOwuiLFJJfpK6BSt4LLQn9YiH1gBv39jWChkQG74WOrAeZdLiqMvHwlFDfVdQ4iL3a1cZ4obiJTcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaNJYvca/ch0iVreC8fumkNgb2sUs++yMz0/2uRH27fttlbS4c
	n6s8r73iFqxfyf5f+Gu4M4BlcBODVX4GBOEVU6f3E2B76snrpHyf
X-Gm-Gg: ASbGnctp6C7TWy6R0Ly5IMnZSOkXdVbNHjJMdLLBZK/ydbKLXh+jfNlgy0EElzdL/a5
	lDqUxDyxit1xxG0jK82VtSFOs8rE8Yb7tpMcuBFS4/42QPTRKofWmrji13/sFIjK3krxWiQgOSB
	AIatEZ0dGNN9HGO4TTq/rH3i54wnYK80SucRwmcK0bxfRI5moyfDgsKqsI9nY5IudQlmyEoeiML
	c5oJJ+Y3LSiatAzaldj/WCdupxASOlwex2DIBrFxShbcPZ5Qog6kllWdq2bYnxzzFiT/uKKjCVm
	Xq0X+Poq1lmlz0SF
X-Google-Smtp-Source: AGHT+IE80Z+JWIw8051HVjg8pT0cQ+xe8MMsCMDbfTvfXwWaHxfynvaJjSTMoIgWVOj7FDMoV6TEqA==
X-Received: by 2002:a05:622a:44b:b0:476:6625:eed4 with SMTP id d75a77b69052e-48132e8c157mr19310261cf.38.1745621149280;
        Fri, 25 Apr 2025 15:45:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-480b050a57fsm8619191cf.75.2025.04.25.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Sat, 26 Apr 2025 06:45:35 +0800
Message-ID: <174562110477.44005.9722007878351490810.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_154554_151910_9FD98ECC 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> SG2042 has a simple pinctrl device for all configurable pins.
> It supports setting pull up/down, drive strength and input schmitt
> trigger.
> 
> Add support for SG2042 and SG2044 pinctrl device.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> 1. Fix the binding documentation error.
> 2. Refactor the cv18xx code so SG2042 can uses the same code.
> 3. Add SG2044 pinctrl support as it has the same layout.
> 
> [...]

Reapply this to the sophgo/for-next.

[8/8] riscv: dts: sophgo: sg2042: add pinctrl support
      https://github.com/sophgo/linux/commit/a1d04b8461eced3c8933fc3f58ddcc4b44ca9073

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
