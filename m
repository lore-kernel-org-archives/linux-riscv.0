Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F71CCAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 03:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzcLomz0InHm6d8bNgLY/c6SD01yP0HJO8YqrqkLss8=; b=gRUYXeIojwOSGR
	XzI3VREBa/5yU6WdfLr/eJj3TuH0aRHRCofOx83FcFxp7TA12olUy9ahuv8wfapzUzDr0Cy4oGFew
	4TbQ64ylwcdrdA2zFRAvZjpMesmGqHK8bbTqlVCnXjbpMzGJLlwEuHJUSOxRDEPfnN8a9KyC7HY73
	wc27UR/mivcvOYUWZzl5kDI/wVlhjoXhE4UxvbsbZ/NU3SAU092vnPb1QSHwxR5K3QP7eI78PGdBP
	/3PKCD7rx+vsW0uZM6S1bFTua13CgvnPfJn1ccWwH8U5+yzF2QZWitHMxmB1taKt11uFVZrLO7J3O
	PIPA9HvQcD8deJdjF5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iVW-0000000DhMC-0Hlj;
	Sun, 28 Sep 2025 03:55:30 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iVT-0000000DhJa-1Sza
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 03:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759031705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TXfimD2q560aPLho43hi6Uuxe4qW179hIPP7duab3tYoOPl4/vdK1N3N9Ev6u1Mzbm6g3BoD+kn/IBbD/4zEECtK8eld8h4zkBetmzM6Vs8y24CMfbl2lJ/ivkF1MswtYpDA58KLRJyHRf9PlSKr3D26e8Vh5mkqeOewG9TrlvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759031705; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tKfnmneuohN8coB1a+XGSw3Os4lO+rOJEhg1bdS4Bz8=; 
	b=fPYT5e4/upYb5xdhouQr/mRM3SIn7M8i76Ia08te8OtWYHjoPBryTcbLS+zVGS77IUqWtQBg7tsuf53TRufWN8lIPEUjjFODNztz3wR/luMEkPcZ7z/TLoz9JuZ8tsDG8bf7hDlD8Bsl8EHHc6Z0cgS8ibWKlOK9RZ1O6Ryi0N0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759031705;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tKfnmneuohN8coB1a+XGSw3Os4lO+rOJEhg1bdS4Bz8=;
	b=Hi2KCnO8kZjT+5DHvNRBl89zKzpUDfTXWV5rkkForhdx3w6DPQp5WDvbt4UhUXqr
	jo/9HWV/xKBAHE7dn3XWaoJJ8sEUsAaU3/CbD/g5c+mLwD7Tf2145O/6XXFgu0bs2fi
	vKoGQiRHSULVmGoLODHlZ14OheQXUMKMUBrrgmjo=
Received: by mx.zohomail.com with SMTPS id 1759031692647275.44505116756466;
	Sat, 27 Sep 2025 20:54:52 -0700 (PDT)
Message-ID: <416407c8-9af0-4331-beaa-f53e1a5cd427@pigmoral.tech>
Date: Sun, 28 Sep 2025 11:54:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] dt-bindings: timer: Add Anlogic DR1V90 CLINT
To: Qingfang Deng <dqfext@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-4-64d28500cb37@pigmoral.tech>
 <20250927135912.3327-1-dqfext@gmail.com>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <20250927135912.3327-1-dqfext@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_205527_763119_03695CC2 
X-CRM114-Status: UNSURE (   9.63  )
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

Hi Qingfang,

On 9/27/25 9:59 PM, Qingfang Deng wrote:
> Hi, Junhui,
> On Mon, 22 Sep 2025 20:46:34 +0800, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -29,6 +29,7 @@ properties:
>>       oneOf:
>>         - items:
>>             - enum:
>> +              - anlogic,dr1v90-clint    # Anlogic DR1V90
> UX900 uses the ACLINT with SSWI. Please use the new ACLINT binding.
>
> Link: https://www.nucleisys.com/upload/files/doc/Nuclei_RISC-V_ISA_Spec.pdf

Thanks for pointing it out. I will verify it in both Kernel and OpenSBI,
and update in next version.

>
>>                 - canaan,k210-clint       # Canaan Kendryte K210
>>                 - eswin,eic7700-clint     # ESWIN EIC7700
>>                 - sifive,fu540-c000-clint # SiFive FU540
>>
>> -- 
>> 2.51.0
> Regards,
> Qingfang

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
