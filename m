Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D61C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pZX8ZkEZQAWJxCVeAXbl5WZyO00Prtv6agwBO+OLg0=; b=BzRU94O5BEUV7f
	vGYjhAW5o4nm8IjxuxDa/q1XNOYH8OO3M49FO3lemmBHbd3S4Ca3cclb5JxYLkZW7Vwlm+YzVfN1w
	WHBiVpbFMfbcNXPiOxeRDHfvQmj+S8z9RjZPiCh/pd3pw168J5oemTUYSDi+pyu4vvJf1g2ry6nHe
	mfXGNH3YtCBhvWk/DHCK6UiOfz/6N+het8cMfMuVk37A2gIk0EhGrbEa2Fr5dczavOV2XZj6+FECG
	bnWuAdG2HEGg2BYfldyTTbnFf+LEvKNPPlNoupJTD2g8Bqc2ODIl91mtOvUADSYTNWXj0F1qN6Wgb
	o6TYkRo9yHK4KQcjhddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vny-0000000HEoq-3tcH;
	Fri, 03 May 2024 16:30:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2vnu-0000000HEjq-1j2H
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 16:30:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2e0a0cc5e83so65391191fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714753831; x=1715358631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPVcs1TOpK/zIamQ+wtUWsaV9d+WzS0scr8FdFX/12Q=;
        b=dntfJOQjv9uZ8K+CvmSkzYwcJmPuL7FsLyiyIjLqziyexAkYZJwR6zA2FJ75P1ATap
         KdOFio2T6Ftwk/Bllx4fvHlcyC+Lq5V5XHXa8uVPkaBqSsjaJZXwSO4vOWCIt2S8SnO/
         QO3WXXhGZSV0RxhV3Q+1B2GWNqRvqTWiR/QVIPwFkHodl2WaNPLIV+DMPi0h6O2sdKa/
         Nm1ONDBVOarxAlhElRjhgUKp+xNXc+Z3nUC4jTIMyhxksWk9DwIX+xBUg0Dg+gqnhpOp
         DBG7FLdoQJa+CCoifk28UgN641Shbx8t7vY++PZB733plFCo0C1Jdw7bdb1R+6dhoegJ
         fRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714753831; x=1715358631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPVcs1TOpK/zIamQ+wtUWsaV9d+WzS0scr8FdFX/12Q=;
        b=IRLeEhnnRgMbmSpqirx8zmU3FnTE/2BsO0RXOdzrxCQfGpGwkDFzQ2vGeTiNEmQPhl
         MmfqrsLITSumJrAf1A5smGUefNuT0bSbKIsj370BOEFg8tLYJHHDMHbICf/dwFCz5xQU
         RerV8S7JhfmFi+vpVsSEGW2PDM9ysTFidSVq6MBlQDLT1/TazbNvj4wbK0JrH1VurL/r
         phHrlCBLuErKywOpSEootzqD4Qu4GsXgHYNYg9iRR3UlDOb7YrfVC++VD5FadDOIBDHJ
         PTxjOCzzgKRkAaw8wz9GYWpf+wF4CEjHoghT1RG1AgkdDpodiAw3U7oml69gjB43p3BN
         oX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULJMZrmGCOHv31ife3nLTsukjqkLuoCw3DGViA4F+KDpt95Z7/hm0AgS64Dd9wfigmxOa0EBWGyRW2gM4mOjKjYtuaDZ2Td4vDSXmRMBaQ
X-Gm-Message-State: AOJu0Yxr6Oe/N+XH13ugyB/Rpcx8VpfSDsxJXAM1smuoY6/raQk102W4
	kdXRzolUdOupaWV9blqJnhfnbp766tMue0FW7op34GPmWeyyIBmmx+Gp82BlVpDyIPSpj0fpGlR
	ZK/DTutJHoFhc+4DZz7ENW69vvspEEx2/w4rM7A==
X-Google-Smtp-Source: AGHT+IGE7xxu21b/33CNpShSktw1p7c14hONSdRe5GLkslIarmkQXZLYgc3VeAksgpSpBEPHVsKNhmZwLeEcUDNOhGw=
X-Received: by 2002:a2e:9310:0:b0:2e2:72a7:843c with SMTP id
 e16-20020a2e9310000000b002e272a7843cmr1041621ljh.36.1714753831332; Fri, 03
 May 2024 09:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-15-d1b5c013a966@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 09:29:55 -0700
Message-ID: <CALs-HssJRSZjuDQjeDiSRYCyEnUDBKQRNCsEVPmLrCKfz_H4Ug@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_093034_471312_2E42C4C5 
X-CRM114-Status: UNSURE (   7.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMiwgMjAyNCBhdCA5OjQ34oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBEb2N1bWVudCBzdXBwb3J0IGZvciB0aGVhZCB2ZW5k
b3IgZXh0ZW5zaW9ucyB1c2luZyB0aGUga2V5Cj4gUklTQ1ZfSFdQUk9CRV9LRVlfVkVORE9SX0VY
VF9USEVBRF8wIGFuZCB4dGhlYWR2ZWN0b3IgZXh0ZW5zaW9uIHVzaW5nCj4gdGhlIGtleSBSSVND
Vl9IV1BST0JFX1ZFTkRPUl9FWFRfWFRIRUFEVkVDVE9SLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdy
ZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
