Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB75C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVGfzOcbF+799gHY861DB01ZICHUW3a3DNmEXKb+fjU=; b=PyalBzPitpS5+Z
	/NK0ZC6UPYrbqTcJCms65CznlJ3utxBya8wKLiMrL/Vp8FDMEDPq5wkszs9XvkN+ZEqJPlBVZ8wWD
	MIeIuJWQ82jsZPGqu5wLvNayPwtMe8ABvt8oXiUHvPszwB1Qoqh1NLeuaSZN0igGgR3t0H+/spo5S
	fecpFSClw05xAsfYO7roSljWFRQCt9T6ivakZ9KR0gQNKhCmvpVd2YD8Lztt19Gc1e9zMW0T+J/pG
	xTcaLRWCueC1s2pgP7vU3nCwmjGRi5XsknDp8mWs30dV6z/HuDM4PmCb91zu0ai5MW3ih8JuX3RUQ
	ns1tgkrdwSrbrfAmcxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp80-00000006RQk-3Jnu;
	Wed, 07 Aug 2024 22:27:32 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp7G-00000006RFy-2y34
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:26:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso345859a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069605; x=1723674405; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBIy/YIYmaABmQA3j9o1k99kZxl3FitdDB149roFRGk=;
        b=ettM+fa5ynk2hPDGVln2lELUhXJYbxQDM/wkaNF0/6+te0Meo9FZRKoIdwLa2V7FJx
         CZ/ctxFDXFm5absZ6MUwJq/+24M7KQoxXCTc66LdVKF2DXlysdIkkOBApywa07+KUI0H
         fsvyOfl5XLpHOEAXag5wg0+lEAcGTw7lIVcxVy/k4tWs1NGKGdMy5jUq4gzdNMqueUss
         H+YUCYCrzDx1uB6IPo6CtyTlFKu0hXhYv+qsTZzjIFA/m/j0hHmip0IsfeXsl/CQMFf4
         BnBPP5/Em4FRPo6SGTsAI7QbWI9fZlbA1DyLXRVAPDHNlJcpw42Xxa2emmOKjrAaoJHe
         9+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069606; x=1723674406;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBIy/YIYmaABmQA3j9o1k99kZxl3FitdDB149roFRGk=;
        b=uDc2Q9y3FYZVXLv6crB4ZNwDFop7ND2Ca2Yvp3WTxiy8LSGOACV7ZuJnvs1nSFIbUE
         olbizyNtATFRpPLxUPvPWjPc31pjrNynfR71Xkep5/grNpItOXvQwsRJqelUASUjqd1W
         1hwgI8qL1q6gk7k5OCsZ6Yp3UW5iyNbzFL+N3kDyh+TN+l3+wZH+pFY/b6yeWj4I0giB
         MfnrRUOLEZpSPosuzISY5Q/9WbgAutUnO+i57KJAHj7Iklk3/XTi7Aa6R3zb+2IkmBqa
         EW7EmptX/885FxRQcWOM8HGZ+g9wu7OK9sqv2DCvwqO2FE27U6b20Mgjcpnadw44r5sK
         LSBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5d+GWtPGS5rigT7X/QwkwO4Oj+wjSYGJ7rFzsyst6JjxhmUiqv9Hy3NMXRkAREhN9uq5QE+6D7dtmcCC7NpX9WlGiO10MF9+W/KHW1pa3
X-Gm-Message-State: AOJu0YzhMrKrbrIbDi+XaykU0LE6Z4WUa0QtsbDc9l1mPi1s1Z/2MTkd
	L8xp72+VNpMdN92Ah9iQqMshhvrl5WmTmAPP4JruZz4aSEzEciLTrsGOk05mSO0=
X-Google-Smtp-Source: AGHT+IGd6zBFgLdZrc5fpXn4Fk0DlJIehtL2v1U5+1wFJBUpqiMspCMgOYDP5uaNavgy/IJn72zPoA==
X-Received: by 2002:a17:90b:2350:b0:2c9:7aa6:e15d with SMTP id 98e67ed59e1d1-2d1c33d4a01mr27917a91.20.1723069605605;
        Wed, 07 Aug 2024 15:26:45 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b59ff2sm2100472a91.49.2024.08.07.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:26:45 -0700 (PDT)
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
Subject: Re: [PATCH v10 29/40] selftests/clone3: Enable arm64 shadow stack
 testing
In-Reply-To: <20240801-arm64-gcs-v10-29-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:06:56 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-29-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:26:42 -0300
Message-ID: <87sevgdl5p.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_152646_772270_1C423274 
X-CRM114-Status: UNSURE (   8.57  )
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

Mark Brown <broonie@kernel.org> writes:

> In order to test shadow stack support in clone3() the clone3() selftests
> need to have a fully inline clone3() call, provide one for arm64.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/clone3/clone3_selftests.h | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

The clone3 test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
