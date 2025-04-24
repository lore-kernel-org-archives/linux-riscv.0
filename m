Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B1C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg50Pm+BWRenaLPtT2inbkCrL4371lzy6UZ4xH4u4/8=; b=f+hesRxcFY6wzoEw8hD2LRzj3+
	spWwLayhcAEa14rLoNzz8OilfJQMeYlsHp9hts+3xOkandR7gcB6E0mO4I+hXXUxwNk02dghppEme
	2/YFv/M7yVU15Z/F/N1M/hIPg5XzjEyVCT0bbMZpqdDKPFn5VYuCvwEXsdY+UzSc1qOZTOz5UB6bt
	H52EJyYFJfDc4w05A2jzqUSzVFcGibrHqD1clkntEiaFuyxRL/V7WOYWiQALNt3lEUW7PmVnkB6GC
	vcww3vsOzV83bqfgLl/bcNDe4O4LCU+WQNxxOCt6D3JLJ4v0uEqSj+iGCsRUWBTcY7795pMaNW9pm
	bNdZvCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uG2-0000000DlwT-288F;
	Thu, 24 Apr 2025 10:56:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tSE-0000000Dbhl-2vTZ
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Date:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c5AFW0Sl5/PIEX/fz2VgnHx4IggLIWYC9XsMAjjZFis=; b=rOLd1h4KWlN93R1xRMGpzIObne
	Klm5kDKVWotkY3k0rOqgRw2nquNsWe/hFNxrDM9i1d8pDwNFcuPnTHW4e/I5ABItNZnJP3HraQ8K/
	jvnEbqk0r6A9lzb9IlcNu/cuuj9lv/px0M5p4kbEdHlv5qEtXRTKoNbaoMAfGf1qNdLEf1QhggWpw
	60kwJGZIWPnWiawNOXbZcf1lfqfbxRcf2s4YD+JoBHcvpOYI6f0nItxHoWLc4U5CF/9CyhmRSxEoh
	0pm03canCmrvPDGXVMMI8T2+7Vp9863Nfr7CkgBs5XmgaVh7dSuHw1PyTWrr4KN+mehquZwknudqo
	6YQ6ganw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tSB-0000000Biha-3N5z
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:05:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso5203555e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745489110; x=1746093910; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5AFW0Sl5/PIEX/fz2VgnHx4IggLIWYC9XsMAjjZFis=;
        b=Ge/gB1M7qbHehafDyn9cgycjT7SZ5Gg6GDXYC1x/GFBQlZ8axxNnv5lACq2SpFSfX4
         mEc3d779jxJsppcDm9Ig2jsD3KXrKOLo95U6/Zp2UGJEXYgZTBP6u2VAEIXkD+NN0LeS
         FBMUZplfXunO91dOT0FdbJ1Lh8GE9JN8PH9jKXOs5p9Z+fRrceNAy7JwfIq8xhRR+rBC
         J0A/yHATso72/4KfmNpQ7aoSwo2GCg8iutmDE9pyDrG0EShgCsO2a/w3UXI+rcgGCUyk
         Ax3Jvpc83RFueZKqwPKNqL7Tahoe+Vwrpd8vHNGmKzJKBtCcOV+fc3pe13dqErLXhpbd
         0hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489110; x=1746093910;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5AFW0Sl5/PIEX/fz2VgnHx4IggLIWYC9XsMAjjZFis=;
        b=k4atCip4KCySjpAYVXqk67YQzPtZquZ0rlgU9hjASIKiJLytekSXKJOf/UGlIhqte5
         f7y9Xvoi/2DTiotb6WrdMawfhUbm15GyoXm+mJ75QpKn55gAKhHtq1sHGp/wn+0dKcuC
         yK47wc3Vsm0bYbQLVPZvO9gq8wXcnYTBoSZ6YxT1BNxeQrEPhjlxchd380yNB3VEGqUk
         mnMEIpSa5+Q+3yY0U1Mb3enszn2d1kovefwX5Y9lwQOHk/KLgTMSreXyGYYTOjdsf2GS
         g/oFEGn2M15YRgbIIRbCHKw00av3sQNvOluuE6Ws/oResIqXKyGiCrYvIkNEax3zjEAj
         oW6A==
X-Forwarded-Encrypted: i=1; AJvYcCWy7pIkzVL0Hi2C7IWvw5m1DkhCj6fyCWc5HinODzekMf1I/X5tMMczTUfY0Zdn5u8PsKeoxR6RHn+Sig==@lists.infradead.org
X-Gm-Message-State: AOJu0YytbGaOs05B7VpISJULrYKd6wxsbS2mJRdtuOYquV+HD8cPBejs
	MGFQ805TbUVkZ7ivaet8McqvVYaXfPdUsSA4rTWXlKps8tSxwtOg
X-Gm-Gg: ASbGncuxo0Q4zDgXUlMw7eoUgwKO7uVSqL1TbRTEqj9hVSG2Ky7mWRsVALTTDjIjFI9
	NrrSTTPS6WX1CWNxiYdXjL14kJYDSDUG7LyeqdLEFE34XgPjtAbHKmwG64wvL5nDGzfKwvIKNET
	npOD04wdaJck/s+POL6PSSxlWucw70+ueqOUGtU8EUVyLMCx7isbpRI0XaDf06GCt4O5ySFE68M
	FzTI9m1qD9GO5Vt574vbbHsf9z/FTFOF+xiw70brexMJ9YgpQGX8261Dzjg/MgYbkXHWPwhwC4s
	VLPI9OTfsqcQ3zFVqpE+gVZR0fVGitv3dkhFXzllqSGB
X-Google-Smtp-Source: AGHT+IFyhtL9Ef7Md+k5uRJ2uRcIXFYfZUHtQ6CdgOkpuVG7jZDLW9qm2lmSxi2HeBkY7L0FMNMN5g==
X-Received: by 2002:a05:600c:1913:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-4409bdaac04mr20233865e9.30.1745489109241;
        Thu, 24 Apr 2025 03:05:09 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d29bf8fsm14517845e9.1.2025.04.24.03.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:05:08 -0700 (PDT)
Message-ID: <680a0cd4.050a0220.296475.3867@mx.google.com>
X-Google-Original-Message-ID: <87ecxhg9in.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,  Dave Hansen
 <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Andrew Morton <akpm@linux-foundation.org>,  "Liam R.
 Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Conor Dooley <conor@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Christian Brauner <brauner@kernel.org>,  Peter
 Zijlstra <peterz@infradead.org>,  Oleg Nesterov <oleg@redhat.com>,  Eric
 Biederman <ebiederm@xmission.com>,  Kees Cook <kees@kernel.org>,  Jonathan
 Corbet <corbet@lwn.net>,  Shuah Khan <shuah@kernel.org>,  Jann Horn
 <jannh@google.com>,  Conor Dooley <conor+dt@kernel.org>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  linux-kernel@vger.kernel.org,  linux-fsdevel@vger.kernel.org,
  linux-mm@kvack.org,  linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  alistair.francis@wdc.com,  richard.henderson@linaro.org,
  jim.shu@sifive.com,  andybnac@gmail.com,  kito.cheng@sifive.com,
  charlie@rivosinc.com,  atishp@rivosinc.com,  evan@rivosinc.com,
  cleger@rivosinc.com,  alexghiti@rivosinc.com,  samitolvanen@google.com,
  broonie@kernel.org,  rick.p.edgecombe@intel.com,
  rust-for-linux@vger.kernel.org,  Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v13 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration
 in hwprobe
In-Reply-To: <20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
	(Deepak Gupta's message of "Thu, 24 Apr 2025 00:20:35 -0700")
Organization: Linux Private Site
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
	<20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 24 Apr 2025 12:05:04 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_110511_964840_9A6F0DB0 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============5332117631002431919=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5332117631002431919==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dj., d=E2=80=99abr. 24 2025, Deepak Gupta wrote:

Hello,

> Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index c3c1cc951cb9..c1b537b50158 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>  #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
> +#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)

Notice that, as it stands in Linux v6.15-rc, this will conflict with the
values for Zicntr and Zihpm. See 4458b8f68dc7 ("riscv: hwprobe: export
Zicntr and Zihpm extensions"). I'd say that you should update these
values.

>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index bcd3b816306c..d802ff707913 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICFILP);
> +		EXT_KEY(ZICFISS);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);

Greetings,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmgKDNAVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlMe8P/3GWvWsJksgXvOwVEdZk24vFu0lQ
heUgo5llXNYRxNaU0iBfZ3qVuWR1WIoDsFnd6EzvAM4/miQK/jOfgb4/xOXls+Ah
qzj0dMvXuLWIRfEom5PhWxW9Tevfl90Pk/TkkzvmaA0t4D/eEvKOsFEFpLFFnP+t
/fCiUbrVg7ahnA0Z9vBA7oLJt9NNks7FOSFH3ZmiJLI82sTMOnQKxGe+GHy0bUc+
0pwUt3aeugR6ZciXnDq4Gfj5m8zBxHgCpGnSNk9eQTtrXXPHcrRBDHAIFESssje8
TaZzLO4+jKovhY6jicjetbtiLYyldXkOz01R49CcxwVlAD5fxgNYpcHu3jnjx+Hw
wSHeMcyjabQHhBop019M9OAFIBQPIKS1B6y570G+M+t19H22083cwGIdLqIYAOfv
3Gml165o3Sl0NPVV/SnNaW/0mxlZq4Y9wXHbnNEJ1JMJlbNYJJeKPvvcPGD9xsgb
iqT5gFNPh4w6OWM34Pb25D6Q1PNlKy8BX9DPgaRlKyRNNutuqJg5x7PK6LN7t4gR
gjrvXyVDQ2rWt1JnR6lq87uVLvuwRC6YEZJIOZ59k4bWzhwvl23a93wACN0PJyKg
yUcHgDHSscAYTxSkOSAWX6Kkh7pg9aiZ3hHYyeI4wKuot02nuZzZZ1/iigfX0X8x
PAoq2NET1dRPiyaZ
=JubY
-----END PGP SIGNATURE-----
--=-=-=--


--===============5332117631002431919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5332117631002431919==--

