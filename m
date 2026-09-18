Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E10C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXan5IVliMFq8Bxf0Wfp6V0/cD0dwG+k9Ayyt5fRm3k=; b=WTgoj4vcXs/QXP
	oqzLosixvnjkcuKIq1zrGIzdZUT92vWxUOl8BTg+cuYi5Qaik+PrDozo5Z3VlOeaI+4FoMHTNSPUy
	IspjzF4E+EBaIHHNuk/Cl+fCLdBQ5PuWA2ybhV5bleYTnJe35HXRo8do9i87DOQPqgTKwJZD09ala
	a7ATDXy2sPLYlcqwT4ygBBNEeAyeorUCjBlFh/9JkVYQuuzV0hydFepL5vLnGUQEnx1YbIP1xHask
	MUKLJ93/3qlwaAWlPsbvNWHbRa++eenIv8wrEnMbh2cBISXtsoSFDP2cWZES38/6vgsDNd6AmubOZ
	sRQQePFgHZnTOWWnOsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7i95-0000000Fhac-2nmw;
	Fri, 18 Sep 2026 23:37:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7i94-0000000FhaV-2VNL
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:37:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56DA96053B;
	Fri, 18 Sep 2026 23:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB41F000FF;
	Fri, 18 Sep 2026 23:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774649;
	bh=5XuFo9Hku9AH+B9//W0dXYAF+SnmgYlyyyq0dIrSUxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LcBNvofM9VVzSc1HZsyvbKKWDImSzsKjs1JoIFMhkVKhOurf+nocUiTUxYqHqPH0v
	 ksBYpb+4DQZuz5SejlfcCX075n3TEtdysB5WyUFebSZwGLfT4CHBRGjHm9Kdzit9+d
	 sm/jZ4kvNyfB9D4OINqYSmA/N8Rj5mndSGLYBoLdo2O5hFGIXAhSFlapCLNfr55FO8
	 NRgWHoUGLyrP+WvaN5kq6yMQ9JpfEXuCKzsrvPJr6Mjb+GkZRgZFWQNwnmpeslH+7K
	 VfLao/VxMG23wBsuEQHr2y9yZp4y0x2HuIabylG0LoraDsKysqG+osfCv6ReVmtTxr
	 j6Q9ViDirWiEA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Troy Mitchell <troy.mitchell@linux.dev>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: (subset) [PATCH v5 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
Date: Fri, 18 Sep 2026 23:37:22 +0000
Message-ID: <178977450889.1115058.13731797621841664029.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
MIME-Version: 1.0
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


On Mon, 14 Sep 2026 16:03:52 +0800, Troy Mitchell wrote:
> Sensylink CTF2301 is a system-level thermal management solution chip.
> 
> The CTF2301 is an I2C/SMBus compatible device featuring:
>   - One local temperature sensor with +/-0.5 degree C accuracy and
>     0.0625 degree C resolution.
>   - One remote temperature sensor for external diode-connected
>     transistors, offering +/-1 degree C accuracy and 0.125 degree C
>     resolution (temperature range: -40 degree C to +125 degree C).
>   - An integrated PWM fan controller capable of operating in two modes:
>       1. Direct-DCY: Open-loop direct duty cycle control.
>       2. Auto-Temp: Closed-loop automatic fan speed control based on
>          measured temperature.
>   - A 1-channel fan speed monitor (TACH input) for RPM measurement.
> 
> [...]

Applied, thanks!

[5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=97bd8165a3f734fe97664e186406686bfa34f42f
[6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ad17d98848df3907d6732673a139e9ed832b547d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
