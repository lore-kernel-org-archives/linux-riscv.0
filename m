Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303A3CD98E2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ka3jEDPDv6NN+ilmv5L/k/3/Zr7bJAVx2bHCV8F33I=; b=14zJPAXoEXOmAy
	18zcc7U5J/T7bPJXPgg9+8qCnUJm07huS2Y7fqoZugFEeU6UY9d73ayaRi/K4VXp69ryeERNM5UZ7
	SpM4yS7QF8Y0o5JT7IL7E9NiRoDxMs577roFXE2JFhHn3U/vfD1TNM3PY4oMU2t8oYvIP/TXakKAv
	B/TRbSx2EmsYUMqr8KtvqB6Nl0KeYqg7izvgAf8jtEZDT26ORFfrkLLN/L/UCU83Vzi6pcJIDVHA+
	96mDQehu2/kfxnDJpwUUConPM+o7UjqIsjeqm9p25qfA1NS/Z+9CaRgMkjI0ps9C4rQOvURkLR6/Y
	I2+1CRaj1UPJjupLb2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsxU-0000000020h-1OcN;
	Wed, 17 Jun 2026 16:17:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsxS-00000000208-2Cli
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 16:17:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49222b6e871so44342405e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 09:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781713060; x=1782317860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=00BSHQd1j4XWZK2YFSucxAoO1q8dCKrhXt7//WIy4nI=;
        b=DjtYFKXwRm8eKlKJOKXgqmYziEJ0NqvE5l06tgya8t0kIc3Ynn6l/hG7t2iBitrKmO
         RNwV8vv/JugzL23MFCsK9zD/tPUrpdYKgZTNrNiIzxddiGwi4Y/rMJL+6gO93dNL3wcM
         NeAjm2wFC52BPjAAmEvHnxMMiw+Z/R1OFQYl19EaMPBHFsp4LkRbRvBYPpSAgbrcGMVu
         JAY0my0B9jRw7uzLxYT51hcnog/T/MRI0nUie1YFYsRFS05NYXDhcaFLOL0MpLogZVSL
         Jai5TCtenx7/cotqVhsxgx7UF0VpWnRO1QypbHtP8uBE88hFURUVbfj9TMfPM1EuinMC
         61xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713060; x=1782317860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00BSHQd1j4XWZK2YFSucxAoO1q8dCKrhXt7//WIy4nI=;
        b=p/3EqDC6j5YISctkFOhgYVSUFR/V1uJL9BUrgsIadkU2vApiCQ2T5iaQINft3xc3Zh
         Jg+47K8/9pU7whx9cPS5vK5KuZulSfmQcqrMlZLCYVeUwHT/H6dPu5ipboyNg4M/1t9H
         BUFQDPq+EzGp3oino8+FUOcBN8/DGErmWeTae0JVzdsSHMhYjE06iguNPulOD/oidZH/
         pe7H+t1OsgOoPP/i87Q171WJ3HeLH5VzsUyRnpJMhVvbC0TBUHnG563jMv15QqdAdJM+
         H26VsAKMcRqxrt8rctsZYKbOqIoATSk1NAroFsEtlTy/Q9GNKr4HjpvPKP7LiMEPSfK5
         g1+g==
X-Forwarded-Encrypted: i=1; AFNElJ8JA75v77qM6i2l1Yi7jAMMyA/lIhIWWSR5yTJEqNbfC6zz2u5NKaaDR6B0mDx3e5AVjPm4bqSFbujnYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtEAY57jHkz5LRGVVL8qTWphlTrg+FR4TZvn++NQ/vk2asEGnc
	gRpzdvv6ZcCMqxy4CndrxQR5yMtku4Elz2NBuB+aXU3U1iAEvB/Al4tz
X-Gm-Gg: Acq92OG8Xh2ppFs9pyZigAl1A1uEf2w9iVWMKVL5HpcnYOflE3H9QhixJSUhtoIP3u2
	t00P65ODqfBipp5nT/xcIz/j53HxaLubVBdB9OsFtm59EGA+hlWwV+hZtP5xXAW2rIS1dlkueYk
	c4xGXdL8pgoiYDqpyEpT3+h1FG3YAPm0fI6fhdTeSV2CdA+AhEosqugdLrsYNPGjoKo1X7qVb06
	lsyBX+lccCGgMppZ3FU3cRxm2FALYrCkqwx3b9nxd4mgr9Du+jpSku7A1D8YhMtYy9YZIGYxOti
	Bpw+UFKmGg1DJ9uzzf7nm2zR6Afazh/8zre74zWpoThrx2jFxhPtn4pSzC5kx9w1WbXNpawiJHC
	2IDCPBOhCBExg1fuQEu9+acE07hpRetF8a4YUenP17GSO5lil60rzrfyr8BKqu5Lfembi0ifJLK
	UYdx0jyeGDYmX+b0tN+9t70l09x9149TPPtBg2Ll6kVaYlMkBFMivuTMf376OtH/qrNRyIqSfuM
	xSAFHAS/emOu+6BRA==
X-Received: by 2002:a05:600c:8889:10b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49234139bdfmr51405045e9.28.1781713059719;
        Wed, 17 Jun 2026 09:17:39 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm59746373f8f.24.2026.06.17.09.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:17:39 -0700 (PDT)
Message-ID: <d515b780-84ff-4854-bd77-e98247d62172@gmail.com>
Date: Wed, 17 Jun 2026 17:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] riscv: clocksource: Add p8700-gcru driver
To: aleksa.paunovic@htecgroup.com, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Paul Walmsley <pjw@kernel.org>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>,
 Chao-ying Fu <cfu@mips.com>
References: <20260616-riscv-time-mmio-v9-0-03af7bc8f2d8@htecgroup.com>
 <20260616-riscv-time-mmio-v9-3-03af7bc8f2d8@htecgroup.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260616-riscv-time-mmio-v9-3-03af7bc8f2d8@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_091742_595467_0D2F56D5 
X-CRM114-Status: UNSURE (   5.97  )
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

Hi Aleksa,

On 6/16/26 17:03, Aleksa Paunovic via B4 Relay wrote:

> +config P8700_TIMER
> +	bool "MIPS P8700 timer driver"
> +	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI && 64BIT
> +	select CLKSRC_MMIO
> +	select TIMER_PROBE
> +	select TIMER_OF

You don't need to select TIMER_OF here, it's already enabled by
TIMER_PROBE. You could consider using a comment there, if you'd like.

- Julian Braha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
