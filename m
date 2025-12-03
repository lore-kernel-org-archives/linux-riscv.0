Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE271D15DAF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21vMSha+gNXmpb4nzdmBIrUDqiZQpGZhlD/delygViE=; b=1V32t9a3HjtCPg
	w35VPIjCtPfV8oeaWiADz3kNVHTSZjCK+xM3Wa+bE9iWcL+Ul6SHoSLZK9thK6ohagnkeDSveF+Dy
	qpeRljJR1y2RcBNejCyEHA21gPsD+K31G0rri0zRpKTNkprTzw/P3ZM1JYCkqAZSN7GJIy4Hcx87Q
	jU22Qx7dlXA1g9ZnPoYRbMAWyHsjFbeH9nOMCU64Yik/XxZKPaZea9shgDZqNZw9yd0EKAQi8vCeY
	pmMBKMlBkp115FVWxDyK79f2n/R5qlkXKzjDzdx85qCEjXI6TO6hSTDChL3zGPVieyq5ZYZdd5Ar4
	WekP3MXqh461MZjcDV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpld-00000006oHK-1hhY;
	Wed, 03 Dec 2025 16:31:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQplX-00000006oG2-3nBP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 16:31:48 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A20D64019B
	for <linux-riscv@lists.infradead.org>; Wed,  3 Dec 2025 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764779479;
	bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=V6f7WredS1j0MVj7v/9J24ruCc0AnOf6kopGzdcoLB6474o24YpbBSXjQmm7JoQKq
	 YuU+iBD2eTyCT28PLtk3Id9wbI1QxL5mOwAoHdmbEirYXqdb7h6J7IFRQAaMBiQIBD
	 I1pVc9F2gYwB4y1tb18+Nyt4p5UqsfBJeT1fZJIYqjNz+2gpuq0oaeU4KOgH2aCPoZ
	 4KK+ClbJcilR2ruhjojqfbidXWLXZRzxg9BEZO4Prx8HMiLFOT4s8d41DKgeao+1Lb
	 FFhBkH6fYImSdj0I8I0oM8vvO9742CRjF0/M6T987+U6RjsreciRyLfNJuwOLzRqPM
	 KeyXvR27dHabmgY7RlJP60mkOcytdavBRrwzZgH1Qy/y/QME4UAjfzRYkWhDbA2cPg
	 VeqdRzYL6MlhSj9jhJ4YOFXoLGYsigYdFby5COiSC6gPu9gBvG9uYXCuV4EhaFNmlL
	 2seUYxkpB6ZH2IQbv2RPt+utnpwnAbw2HrPbjuisSEDNVgg+jsQFiI5NYKYZwCSHMw
	 FuW9GyL4NFZ9u4HznMyfXH7TCO8VA/L0haqzd6pefE87M18+M0P3DNgc4MTVGMSqz9
	 CSVpcPB0Onof3D7bkeVXvx+OiDm6QqRx0qsej8YQvSMFKn5uAgewTim0aS87Hv2RGK
	 wCNhHNbqB+D0iaSNqIEP6EFw=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4788112ec09so40010615e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 08:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779476; x=1765384276;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
        b=WZiJuba7RRSKW38+2cUKMG+sB7W1950F46wLd1Mkt4SLTzfWO+giSK1eEA38XWtnSL
         AInbX+9D6HeR2Q3HhrFrTTL16H4RvreTQM+S+T30+4QKTmZFfsPkPIo0xuqg+Qn9X00C
         ygTK1IavCSDEdxVD38wFuPjZlxdQIoAAUNoS+Lw7FdFApmnL6dXaDknJAUoj3qzIAd0c
         WBQDZL+ImBDwTAP/zXkxsDI2CuIF6O8YiXsqfLJNckD2maQPERH3mSIoz6vFifAyz0zi
         oTda6a+DSlA+2d00jp4rZ/802wxzT6BTeeeL8BiRrXJNjSMrjWCJcHqh/71hPp3Gymsj
         WVyA==
X-Forwarded-Encrypted: i=1; AJvYcCU1xkjPslKxXAhKQUgvkM0r4QDIBpieo3S0osVqPV34laUjz7kL1DRbNPhhiApWy2LKHhZ3q8slMGTjig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyheNwVThbjBjJTOtk6ceq5GZ1rsGWLBV0fpNdL0JOkXyt91Rw+
	sdGWITIczjMKS+dYjpM6tQQCn1gnZCnVpw1QKtnXXdExj8SD91nJj9GIVh2T8im2LH+E8Ag15n4
	mnXfs9AAObDhgQ9GlVlTUeRmciR+Km2Y5coxKvfuOchHGE6r7xTZH+mg9/WB7vRMFkgOaqdMDbU
	NTGFEgsp1zzw==
X-Gm-Gg: ASbGncu6IHHW/9W2QuakKyInviwz/+u2OrOdSAvygzcGgi0dGo3QxuQvgrqMu3e3jCP
	M3q92IgzW9WOP0Shwj8VvDG6YB1FBviGPI0+oH9p+sGQRdop3TJua884DzBD9AiFk2zF21JyzaX
	DgF930eoWQj3811wjEvBaIH4p2LclfyZEP0TMk//513mcAquL85lb/SUn3D1JHLlc6JLgKxrGZv
	o647hKor5Z4LNEBGs43rBIlSS00Ohu8ERFvXuMv6LoYg+G3rHFT6juFI0EDisTUjSoLMeKwOgnu
	7xk51tNOpb6EnoUu1xrWekdqQtXbjyfkLsRO2h80Y2dHKKSxRUPacVMjp4ftNXnfvplGXa+i83r
	RQmCwfJU9d6ILntUSeAAmuWOfWi7ybqZ2uu2Qh1bILL2LAqGQHeDYa6Rddh60fSQeik5rgjJAzZ
	g=
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27911695e9.17.1764779476163;
        Wed, 03 Dec 2025 08:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCKejq/2U+1EN5UAB8CezRHOHJDvwMZzcFVGMZ1T1ZB5XD8pg1afh59Y/Z4iwxgxyD87hFlQ==
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27910815e9.17.1764779475621;
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Received: from [10.1.1.222] (atoulon-257-1-167-49.w83-113.abo.wanadoo.fr. [83.113.30.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm40900310f8f.9.2025.12.03.08.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Message-ID: <6b25515b-c364-47f1-bd75-8b7dc16e3701@canonical.com>
Date: Wed, 3 Dec 2025 17:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+debug.rivosinc.com@kernel.org
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, alexghiti@rivosinc.com,
 aliceryhl@google.com, alistair.francis@wdc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, atishp@rivosinc.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bp@alien8.de,
 brauner@kernel.org, broonie@kernel.org, charlie@rivosinc.com,
 cleger@rivosinc.com, cmirabil@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com,
 david@redhat.com, debug@rivosinc.com, devicetree@vger.kernel.org,
 ebiederm@xmission.com, evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
 jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
 kito.cheng@sifive.com, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, lossin@kernel.org, mingo@redhat.com,
 ojeda@kernel.org, oleg@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, peterz@infradead.org,
 richard.henderson@linaro.org, rick.p.edgecombe@intel.com, robh@kernel.org,
 rust-for-linux@vger.kernel.org, samitolvanen@google.com, shuah@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, vbabka@suse.cz, x86@kernel.org,
 zong.li@sifive.com
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
Subject: Re: [PATCH v23 00/28] riscv control-flow integrity for usermode
Content-Language: en-US
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
In-Reply-To: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_083144_204733_20110ED4 
X-CRM114-Status: UNSURE (   4.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
