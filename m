Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A98C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 23:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fI5We3XEOQ3v50pktgQQ8P+7zZAH+L749yl73D+OT8=; b=nIeHCfq3cDUmR2
	7eXUG1pU+7OKwDAogxdTXH4Jv0UP3emYwV+v+UXOd/aIMCjliy3cFMrlv6PxF1ruvLuvUlahbwbxc
	AkkCynsvXn9exlIUhwIDZl9kjJBzKGhNYPV+Ysg60gzI0O3/ng+CUeElkCvaOpFMYURroqojlmNbE
	Bm4QlPDFOwYOpinhXGCx3g7yZ8vY9mKT9h0CFDPE/Efb36f/Rt6daw0qHjfYk9BtyPh88AxGZ2IG6
	ZQLR4R1Nrs9hlmkLLtEv/N8axBy1UtuHRLJnh+o15bZhqbYsei7r515uV44rYHr6ejtYFETUdtdso
	7x5a/TzvsJpFqfeKvXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaqq-000000012DJ-3yBY;
	Thu, 18 Jul 2024 23:47:57 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaqo-000000012CS-21Uf
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 23:47:55 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7035d5eec5aso684734a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 16:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721346473; x=1721951273; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wG4uwlbaV+J8vLwBombRfMb1OG6U151ykySFE5AhqQ=;
        b=vzx+QTXh3q96BW7jYsmcce6q3h12cQj0nJqV8ZX8KqoBCY4Q8+hoICm/6bUnmQZRp2
         DA7gEvkhJFdoroCeBDeJ+CKEVOZAmxq/XlWupxTh311lRS3EiIpy6bq/NEV8qepewZzq
         gS7c20bofxqsnpbiuOsv1fgQdOnVM3tAYXD+t2XulNW9yFHlAv64wXMYCRw0VM7YsF4I
         CtEa5t9lIp8ZsJKE3AAukf05cAHoRu7sHFmaz0xr7Fa4j3i4252oMvUyGZf3FxY1IoAq
         8xTqOdsHrlWJLAYzHfyABArD5eLFOpC4w8Sv9z7TYX3jmR0wwtZEdiCr5yAs/ml6aKL8
         LY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721346473; x=1721951273;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wG4uwlbaV+J8vLwBombRfMb1OG6U151ykySFE5AhqQ=;
        b=OFvLKge6tiUpD+IbgMH4F45FHIuCJpqa5+JdPEdvUyn0FNaEQ9GXAy0qGPvdwfxCO5
         qQDsb++NJ0z6L6wLgNjKxbWasvO3DoPq77W3v29bJAIFmit/QchvtUJpM9Ag9+9BiPLL
         3tKIZPl+/sqdCa5sMwdXYGFwjRqKoMeXq8iahfdoostQurlHDLOmpLspChgF4/DCv3Qi
         GIlRXAVJj76wNoXEuNzkVMF20cEENtvelAupWokBkcclR2hu+/dCoYlAEwbaaaXs1phO
         I4qsPnmJGuhUMGc5Y1kS7s1WRcJCmD2j/xiJWyFOgcWFRtOqnNWZ96DiMNKdEUDs8xtn
         lxPw==
X-Forwarded-Encrypted: i=1; AJvYcCV6tIysmSFA4iAHxE3PN6efEo9cHlE4o9SCch5mZZiRAiwf1f/BoNr+O11T67FMPlWR7j2JYtoE8xrGim/ENt/ixRNV0m0LM98RJ5WrYllF
X-Gm-Message-State: AOJu0YyxVs1M9TfKPbPhS/RDosoUmQUWYlp27bvrBxCrlcoodYniQjpO
	sO9AeM+y7jK0VusMxaaHHqzR9/MphlPGIpOcIptEPspizqRypyhsIgWFEQTtMjQ=
X-Google-Smtp-Source: AGHT+IGb5vwrvVRNc/Zru+u1tWaF5JoGONpNCNR6gfjZnBju8QrPRuYrwnUehHVlBaNSMasi1A3gpw==
X-Received: by 2002:a05:6830:700b:b0:702:1ea0:cfbb with SMTP id 46e09a7af769-708e37a48b4mr8654473a34.18.1721346472747;
        Thu, 18 Jul 2024 16:47:52 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79db5690a65sm142926a12.16.2024.07.18.16.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 16:47:52 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 38/39] kselftest/arm64: Add a GCS stress test
In-Reply-To: <875xt2xojp.fsf@linaro.org> (Thiago Jung Bauermann's message of
	"Thu, 18 Jul 2024 20:34:18 -0300")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org>
	<875xt2xojp.fsf@linaro.org>
Date: Thu, 18 Jul 2024 20:47:49 -0300
Message-ID: <871q3qxnx6.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_164754_546665_4967B837 
X-CRM114-Status: UNSURE (   5.44  )
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

Thiago Jung Bauermann <thiago.bauermann@linaro.org> writes:

> # # Finishing up...
> # # Thread-4030 exited with error code 255
> # not ok 1 Thread-4030
> # # Thread-4031 exited with error code 255
> # not ok 2 Thread-4031
> # # Thread-4032 exited with error code 255
> # not ok 3 Thread-4032
> # # Thread-4033 exited with error code 255
> # not ok 4 Thread-4033
> # # Thread-4034 exited with error code 255
> # not ok 5 Thread-4034
> # # Thread-4035 exited with error code 255
> # not ok 6 Thread-4035
> # # Thread-4036 exited with error code 255
> # not ok 7 Thread-4036
> # # Thread-4037 exited with error code 255
> # not ok 8 Thread-4037
> # # Thread-4038 exited with error code 255
> # not ok 9 Thread-4038
> # # Totals: pass:0 fail:9 xfail:0 xpass:0 skip:0 error:0
> ok 1 selftests: arm64: gcs-stress

Also, Shouldn't the test report "not ok" at the end considering that
there were fails?
-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
