Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33827C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dElvivMFs+4n3sb/PrnMKgC9Jdl+gVKuF1+RO3H3OGE=; b=HSKlB65aECk5OF1yeL1kKMXGER
	scV+2xZ8rfVpmba3YtF7OoNDeRP8f7I6TO4H8cXtbOJ7HJBYFC5PKpO6fS9kY4mgWCFaZwIKpaA8X
	7coEebAkdXmA81lO7VJeDOs3ELNoWxU83ESKH3C0R9wOc5Q3KfY6yfmUZAqUdJs30lfaOscaw8lm6
	3AXZ56wkOQwh+nXvvjWcxMYxwxnU2mLzI9CzdPeusSjMDW5j5x3KzVHwPykpxoMeXotkJ6kldFKNn
	P3CSKbkARtCMuH/ddErlBqxCdNldyYZeaJMxefDQbMaAup+bcM65ZgIqVfr+ZgLSroQ+JYru9jeFX
	aMKS3N9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S4V-00C03T-19;
	Wed, 14 Jun 2023 15:06:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S4Q-00C027-0d
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:06:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6667c54839bso258392b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686755160; x=1689347160;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+ba+k+Uik7gkIXtpKVTlI2mwc1CHEshQrw4/m8gjUQ=;
        b=JirB+nvqJpGztfu59P4yoXYKW3FcejMQW/rC1p2oKGVSvC3r/o6LDjwNmjLA/KShGy
         h2+SDcFS6ZnHmYxH1qggfkSc0p9CpxcOWKySYU1uPZT8JOWwmCYK44MOD17vXtgSVKsN
         BFgFA4Ki6XBiTwqt+q2WNlGQM2FBuMYJr65sX1grNl/PSs81pjG2FyaFDi6gSUA5gi0n
         57qHDRgyoHWIwW04xFObw4a61CaRSZfWZPPy5ikwZpEbbrxAFqK8Afk2bpNCKWRA/L+C
         LHJgrWVuB+mELZLywTY/wm2CnBm5O2HXARr9b2a6xeqzkNSBsca0lESA4Uhf3iONuT6g
         M2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755160; x=1689347160;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+ba+k+Uik7gkIXtpKVTlI2mwc1CHEshQrw4/m8gjUQ=;
        b=brRYXZ+8XvB5GmE7l2k4lrqmsNpbzAE6aH7r/8lR3AT9ch960gdXWpkJS9IBAhaAwp
         t5Q6XNLSuYV8/7mUYoi/yUtwRn4P/OCUOkT5V1j7x9U2QgOnLTit07VxIXdI3AjKt8rr
         LisJqdfrDC8XrMkqeoHCPIZjS2MFxJMUNaH2YYm5UGBroFQ+8/EbOypYlLPfj/NAnj+w
         W1zg8xYXEZDQSGHbvCGFnjA89/XDPTPruN8OeEIbR2Wnd/slFdUj5FOpRim3S2J4jln1
         4R+OvxM4E0iupgx9z6MBryC3HCHPB+XKjZG1Mlx0aUUjBtPM9pul1WHxBZ8/yCfX/9X8
         a49g==
X-Gm-Message-State: AC+VfDzs0jv2XJJLUyAj70QAuF5a/CCK+JOiv3wj6aNf1OsisKUHVn9N
	7LuJRDJ+TYcQYBdz5EW+F3W49w==
X-Google-Smtp-Source: ACHHUZ5uBaS+Vs92J0AT6i0i6DWL2Oh99vhbTu9sYIkmkzB0zT68q445XTXpwUF6X18AWl/lHjE+GQ==
X-Received: by 2002:a05:6a20:729d:b0:100:3964:6cb with SMTP id o29-20020a056a20729d00b00100396406cbmr2377315pzk.40.1686755160386;
        Wed, 14 Jun 2023 08:06:00 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x17-20020aa793b1000000b00640dbf177b8sm10547721pff.37.2023.06.14.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 08:06:00 -0700 (PDT)
Date: Wed, 14 Jun 2023 08:06:00 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Jun 2023 08:05:58 PDT (-0700)
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
In-Reply-To: <20230614-credibly-pluck-0495779ada5d@spud>
CC: Conor Dooley <conor.dooley@microchip.com>, krzysztof.kozlowski@linaro.org,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-32141387-ea5c-4aea-b0b2-ac22c18b4cab@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_080602_231150_B334AD9B 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 14 Jun 2023 08:03:18 PDT (-0700), Conor Dooley wrote:
> On Wed, Jun 14, 2023 at 07:46:12AM -0700, Palmer Dabbelt wrote:
>> On Fri, 09 Jun 2023 07:21:17 PDT (-0700), Conor Dooley wrote:
>> > On Fri, Jun 09, 2023 at 04:07:06PM +0200, Krzysztof Kozlowski wrote:
>> > > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
>> > > checking for this can be enabled in yamllint.
>> > > 
>> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> > 
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> Did you want me to pick this up in the RISC-V tree, or is it aimed somewhere
>> else?
>
> Usually subsystem, or in this case arch, maintainers should take the
> bindings patches. So that'd be you ;)

Cool, it's queued up.  I'm just put a bunch of stuff in the queue and I 
think something's failing so it might take a bit to make for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
