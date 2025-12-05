Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7A3D374B7
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHWoXhkbhnD3Ex8si+PqFwWGZukJxkUotggAdbIA7/o=; b=pE7373SS1f0ktEnJw1rbxMZPdL
	eCt0w1CnkFErW5eJPH5dNqakxmPvquds+bTVd9c0b6iIlRxgZY75wDJVpthBIEYxQtDQQgP/1Lds4
	PQ2h6dPwAJNQ5U4LxdTIOE+FmMCRXnsQYHsZVGJR+exJY9/Wj/EDmnBS72beD2YFOSMYVHU7DlrYg
	X+6pj9gmXqC0UB9sfC63ZhEN0gXdFRdmNW0iQnnf5ISIGXLwqjP4wSIYMLimiZ2WaTIFCbz+eR1Ec
	PATIKnQHlcD8aAlDSbTpHG0MWWuapNGzhLLon3saQoNzZs9cSTpgdSEY60fLtwtN7AJaYfYbCfN4D
	c3/vhP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfEm-0000000ACA9-0peF;
	Fri, 05 Dec 2025 23:29:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfEj-0000000AC9N-3ruO
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:29:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2981f9ce15cso35599225ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 15:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764977357; x=1765582157; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m859Pz85Fe3NafYsTdo+q5V0iu/zXgcB/nZgW0VxOeI=;
        b=MD3W36oNxdVrQ6mpejpGSUjlaw4KdH9yOMiQAFPJKXaTpI6HXW8Od3L/1MVeOLS/gE
         1ofP3k4AfgpW07T0kIL0lZVnE/8CflHSpoWAiIUSFe+qcRT9ha5j41wuWOtCG+uXqRUL
         jmurW0q/OTFkE0+VGzWBBSajYiBPhGHVtH+/tnPfuJ0+haeCAwT/MccMHLr4udkZxmGE
         tsMenrKRWpg97Gk8OqhyxC0Pp8bAcm72AySx1s1CevO1Uv4Xsggxyt4FeWWp9fxhz8c6
         Z2B/9NP4GN0Ys8D99IAyWtauDC2vk3FtstgwvUegVUZtspsdaEcp4V3B49rseDODnLir
         uQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977357; x=1765582157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m859Pz85Fe3NafYsTdo+q5V0iu/zXgcB/nZgW0VxOeI=;
        b=GdiTqNf+OPPEPz+rWDatexfdRB0RPrW1aJN+T+Z0K6CJNAujqV2zJZLjol7oejuFc6
         eDjpmJVEuLjMImlMx61bQmXnrXLTUbmyo5LykZz52MwqaL8hvmKqpoc33Ajfk46dhD6O
         5K7HBfQZhAGO6xD2oYpzK2mEYXRm0M3XpqLOwOknmTYUyJHpeXznVNG80ZIK4stpYkn5
         0ETT1gtrIejMn5sn2z2jwjZrDqb/ueM2IYhLlWONyLkF1Hq5ismZY+Nf5itYCCzEjfaa
         pbN9oI8t8vq+12o93/ZzkjBuAwhlqSXGUkGI30Z7AI4H/lz2xy3Fnl65gTQtuy3XVmL/
         NBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4my9tEM1lz26ePnEOsEhOIXixasLx/ZaLZNDb7kcCHjtTJZMeySruYV5HQqM4qQWcYHNYPmQfVzMUFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwSicyWK9LgzsUR+YXVuj+BG+E+pRAIsj5HfFVOfyvT+Khh1z0
	aXhmL8xDFJ/KrLXsNz4rtL1V2eVvT0xba0N4uD9SlCFApMKMMziYGN2NW9I8IhRKBS4=
X-Gm-Gg: ASbGnctetBR+kybvbKuX7v9lSFTs55lVmQUKWXKhfIp+ckjtAnGieQCn/kWNxyhd/V1
	jSn7hw4pQzBpo56APEiuPVuGbGdkz+UZiuoUsasjfgDAiPjXesfwh6JBoN9JTEZhL9TvM0YtFmx
	nxAz66Pomjn6DF+nd8qe/5U+1CB93ASzAv/vms18Ekf/jRlE3Aqe8dWjSVYOZ9Ly+zPvVTBhd48
	CywHvXduVV8vEMc82/OSAI1zuaR207jNXfKj4kjtu34UIInGKF1grvspIQ7gBG5mPsy9FxnXOKe
	zeU9A6FKw3GBvNLTMXvjnXhCJjraUzxk4X77CfpomRmIW4ykAzPPOkUXsAhDlMzU7ULQPmB8bDt
	fwEuhJ4SmEyfFSqMHzQuvpqG8AxYZhNe7ZJs8d1cCD0iHhFxFifHPx75rwCv4DiFJkoiLsGsrC3
	0ezURJ+1cnsEr+cP/TFITqt2/jQh8LEQw=
X-Google-Smtp-Source: AGHT+IG0PS99KFFmyGmoZ4EZkx7PjzgoWxSynADwEB0PMGoZ1tOJUc0gMelNMUgjpR2OcW1nhmhbdw==
X-Received: by 2002:a05:7022:24a4:b0:119:e569:fb9b with SMTP id a92af1059eb24-11e031662c8mr594295c88.10.1764977356505;
        Fri, 05 Dec 2025 15:29:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm23779652c88.9.2025.12.05.15.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:29:15 -0800 (PST)
Date: Fri, 5 Dec 2025 15:29:13 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Paul Walmsley <pjw@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v25 00/28] riscv control-flow integrity for usermode
Message-ID: <aTNqyVVGy9_XjFGt@debug.ba.rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-1a07c0127361@rivosinc.com>
 <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_152918_008439_B7644FC0 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, Dec 05, 2025 at 08:32:32PM +0100, Krzysztof Kozlowski wrote:
>On 05/12/2025 19:41, Deepak Gupta via B4 Relay wrote:
>> v25: Removal of `riscv_nousercfi` from `cpufeature.c` and instead placing
>> it as extern in `usercfi.h` was leading to build error whene cfi config
>> is not selected. Placed `riscv_nousercfi` outside cfi config ifdef block
>> in `usercfi.h`
>
>
>Please stop. You sent this 28-patch-bomb TWICE to 50 or 60 addresses.
>It's actually merge window so it should wait in the first place, but for
>sure sending it multiple times does not help. Please observe the Linux
>development process.

Sorry about that. I'll be careful next time.

>
>Best regards,
>Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
