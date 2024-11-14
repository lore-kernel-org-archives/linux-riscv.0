Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A548ED637D9
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm0AOpCOtALFiAElX+845Z1k7oZYRU9kJ1+Ohkj22uw=; b=Ri/nGxJNHqcBKu
	jyVGkr7kzMp/XNygVspYxCQ4KGpVP/NB3uUOHnrjnjwQZG7f77M7/lPpg+hSz1Azu/HMoip60QG52
	cTo07jao0dU3JhNG8+FeACPczmf6fzvWBLp0XgBvgK4nf+tQXkevqsg6b4AYj0s3Oic1njPzTKYHT
	S2YeksTr7Nq9j5/Ak+eWB2YU0jZUwjaPU48LY+svoGTDW2CcoOfgIHv4fEF70ZDz9sFeKbgUyegQW
	wTYWOzJZ8MvviG4fwobK0mj5HJa3bKR4qJnuZrJDioF4vnWT0i8wMHp9kjFf4Q3z4lkBgkalVRlfd
	OjvI6mQhb8Be5Cw6o1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPrG-00000008agz-3Rz5;
	Thu, 14 Nov 2024 02:45:22 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPrB-00000008aco-3dwC
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1731552307; bh=K9VMieeK/AcbTJGiy45ySp4wFRec//PkAXCg86pSVAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hbz9vemBlkVXu17bYYbilMZGB6R5Si0Chmnp12m8yMtyzUY6AhbU2jCAwxN9d9gp3
	 ItcdXEMiR9lG0W6Wcr1cTSBRZBvR+bJkJmnoLFx5NAqCwG8kheFhiaRzLOBxQUqKPG
	 QREnzQxZV+cWShL/Z7WDIETEpg5tGDLZfjg3mIqA=
Received: from [IPV6:2408:8207:18a1:fd2f:e457:528e:9ee1:6f68] ([2408:8207:18a1:fd2f:e457:528e:9ee1:6f68])
	by newxmesmtplogicsvrszc25-0.qq.com (NewEsmtp) with SMTP
	id B25AFED6; Thu, 14 Nov 2024 10:44:37 +0800
X-QQ-mid: xmsmtpt1731552277twisyswv5
Message-ID: <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
X-QQ-XMAILINFO: MqG4KXyEKpQypsnPJ05m3FqspBwVkFBEd/gU7ENwIHUXFuBRriRwaR2mNKoYlo
	 qngKfW4dHJ9PoBBJv72Sf3cGTli6vqSNlYlRuUuxdT9Uy6dg+deImZxYBrbNuxlx8rdH/3qo/J01
	 Ox4Ho8RraaG8XR4V/NIpDv3dofWDzMBdlPLBJ6Q09xjA3wVG1M7mazg0Dqplno/lh3gjS6WeCku6
	 fj+Nw/p7ZyPYya1nMulZsVWjIWwhlPYlZVtBjF9REUmaGIsDfGBl2URMOx3qucQ7uwWGdcB/By0C
	 gAxIhoGS9+HhX8FQAXnUE0MJZ9t69SVKEcsHMT2Bn3jLnhbNQTdGRLJ0pxEPK7NSjKuvFz1FTn4k
	 57kqaPLnMUm2Hn6wKN4HcKmWsZfQJzhJw3SR+LqNoSzlGP35aqBnrzVWP4Tsd4uhAEs+4R0PZ/YH
	 8Z6INMvfj6+Khl+4xlUTdPbALLjoeCA6XamMNZHmS+ZQlA4BRcVXB6qEckuNuhbZcpRxTQEG76Qg
	 D//XWOW4X9jArIz8MMWiN0ODtjcVQc6VLSC6WA3jiBNWvwftMkpgZ2uDjzaRLtOtiHt7jS7caETn
	 FVfbLDzzE34Q0YpoP85SIocMD6NYvIrKqq1ejhoApSuPLgXJK1Hbb1Ity6BB74ZKdaMe+82B0f/6
	 XSV3dsrfgyFeITr3/jgLrkMIvDh0ceAh9IiucdNgqgj4soA/Tu/whNeda8bh3N+HY7kZdfyp/RXt
	 VTkFN3JoMVng+ax7xhhfXjuLAEM3wgC3oaqNGF/EaEEnbcuQeVBKBQk39jNC7knmNzo1G/Ve2dpx
	 TAHQqDX4zFTQo1E8pjVdvls07UZHqbNZyUWJaIFeYXCy755SlXKwBzyLUCgX6v3Gab6SZf222BPC
	 Y8Qsv+68ncSL5vHlBeg68d/mfbZdARIMtR02Z9gliBiIO6O/5xcP9oHAzbcuQklDMbVx/abUi0RN
	 JKY+NTsvbZ9ACJnXzo/B6s8XcwJAwKgiYr/lvaPJoDi6jPAVcu/Pcfz1J3uDxU+De4vSAY65Ny8s
	 MrrGGgqly7BAS3SKTS
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-OQ-MSGID: <21b298dd-6071-41bf-985e-13724c4c730a@cyyself.name>
Date: Thu, 14 Nov 2024 10:44:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren
 <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
Content-Language: en-US
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_184518_466523_F042E578 
X-CRM114-Status: GOOD (  14.65  )
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



On 11/14/24 10:21, Charlie Jenkins wrote:
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.
> 

Hi Charlie,

How about changing the name of the key from 
"RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" 
and use marchid to identify what the vendor is, each vendor will have 
its own bit definition in this value. So we can avoid adding so many 
hwprobe keys for each vendor in the future.

I proposed a commit here: 
https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59

> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>   arch/riscv/include/asm/hwprobe.h                   |  3 +-
>   .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
>   .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
>   arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>   arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>   arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>   arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>   .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>   8 files changed, 88 insertions(+), 2 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
