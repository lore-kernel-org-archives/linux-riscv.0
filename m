Return-Path: <SRS0=3sXM=4C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE03C35242
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 20:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314E2222C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 20:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6kzm8IQ";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks6VxUrO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314E2222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLUwT0hRi4/QdiXI9uHL7GQ4sUYl1no+UBqcC9rwFQY=; b=Y6kzm8IQiLj8H0
	b57ewMwPR4ud0pI2BmkM182vJZPTM/kqueaYSXXb/EOyUjwxgg+i1xxJVQSgWjXaxBe9E1diFKmLw
	s1j5lboYacjdO4l3YddKg1mGdJ8E1i1iE84hzTn1H+v4TembfYkQH8Z8SDSTCjH3agZLe2jWUFXXU
	YVsdi36Hke/wF4FQoGbCwbhogBWicbJzR/TBSLrkktNw915XRHaSBdClTV4bx7/mQRES3wwXsX5pe
	mUS8S5FCyMIkhknsro6ww6XTyt3T+doq9FBLczcXKFkGyatJcofSE5uaQwKCu7vwAG9tDU52KLJXO
	SQLXgUgDFemoSI/njh6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2hw3-0000ea-Lt; Fri, 14 Feb 2020 20:51:39 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2hw0-0000dk-E9
 for linux-riscv@lists.infradead.org; Fri, 14 Feb 2020 20:51:38 +0000
Received: by mail-qv1-xf44.google.com with SMTP id p2so4902133qvo.10
 for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2020 12:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KLUwT0hRi4/QdiXI9uHL7GQ4sUYl1no+UBqcC9rwFQY=;
 b=ks6VxUrOEPuy0Rbe+ibwaGBe3i4yX+14Fs0/4uunoXWm9gPAUJnuFO6/seoOfqi5xb
 yGjoLK2Pprgtq4Qv3w2V1J9l+g5j3/Tj42Uhw5/iHuVvC7yG5kGlzCzMyt5z/GKaGKA4
 Y7UDH3VamrEHcKwe9VoY8M37xpT7gQzQuHdBbl4kXnw4DY5yb/zhjpkKJ7KDZnFxb/cj
 8sJJKIupt4ktEjNrJ3DDOZIrG/Y0OFef/WsSCuF7O7/Fc0qJzY296hsx6VfRke5eXRKM
 TbKFH0otzqivHlpIQZlG0LNmyK1RY6dtEGMtg8DPaeoaZetq6vxdBX96wn8vbezrweKb
 4z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KLUwT0hRi4/QdiXI9uHL7GQ4sUYl1no+UBqcC9rwFQY=;
 b=YVJXH6LC9vKPemtqE0bj+d4jxnC5XIjjjDbiRA7oX0PLCWnKgi8Mm6b7LTL2Ki3ceK
 8dgZyuKx/fUNBOIJ7SJZesHziP+iSqiJDec1vN0obYQEy8GHXxV4bH+rALSloZDPpK0W
 Ddvg+2zhcYVyeKe+U0nK0O16yQiIQE8a8xKd5EeXUyxmISPKJqIvzNNSS5TVjh+WX1DE
 0JlZnPOjPAMoKkBEKf5+PH9iwlmL/ZP6kKT07jn+1bNwwti2KMl71Q/4cNgORK2rRExW
 RtZLH4h40uiatv0ELFmvlXEhFfJajSHvKfJuQcTn6/YCrEdSKNxtmsA4zsh5Rl6Kp8Bt
 OwHQ==
X-Gm-Message-State: APjAAAVnkpDIV/ONnIONk2o7/dcs9dZxWMPCGZx6hBqCeJ8+COi/w01y
 wXt2I/dr5y4YOnbTlXeouY8=
X-Google-Smtp-Source: APXvYqxrX97zhXuf4MhCZrhTzlC15UsYyDD/BV0g6+4XeYT6k+8SlgniYKehko3ZCIaj3KJP3lfqAA==
X-Received: by 2002:a0c:f9c7:: with SMTP id j7mr3901940qvo.222.1581713493177; 
 Fri, 14 Feb 2020 12:51:33 -0800 (PST)
Received: from [192.168.1.117] ([75.102.135.197])
 by smtp.googlemail.com with ESMTPSA id b35sm4117402qtc.9.2020.02.14.12.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:51:32 -0800 (PST)
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200212103432.660256-1-damien.lemoal@wdc.com>
 <20200212103432.660256-9-damien.lemoal@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeMuQENBF0/k2UBCADhvSlHblNc/aRAWtCFDblCJJMN/8Sd7S9u4ZRS
 w1wIB4tTF7caxc8yfCHa+FjMFeVu34QPtMOvd/gfHz0mr+t0PiTAdDSbd6o7tj+g5ylm+FhT
 OTUtJQ6mx6L9GzMmIDEbLxJMB9RfJaL2mT5JkujKxEst6nlHGV/lEQ54xBl5ImrPvuR5Dbnr
 zWQYlafb1IC5ZFwSMpBeSfhS7/kGPtFY3NkpLrii/CF+ME0DYYWxlkDIycqF3fsUGGfb3HIq
 z2l95OB45+mCs9DrIDZXRT6mFjLcl35UzuEErNIskCl9NKlbvAMAl+gbDH275SnE44ocC4qu
 0tMe7Z5jpOy6J8nNABEBAAGJATwEGAEKACYWIQSQYR1bzo1I0gPoYCg+6I/stKEQbgUCXT+T
 ZQIbDAUJAeEzgAAKCRA+6I/stKEQbjAGB/4mYRqZTTEFmcS+f+8zsmjt2CfWvm38kR+sJFWB
 vz82pFiUWbUM5xvcuOQhz698WQnIazbDGSYaOipyVNS52YiuYJDqMszzgw++DrcSuu0oRYWN
 EWCkJjxMqjGg8uY0OZ6FJG+gYRN5wMFErGfV1OqQ7l00FYA9OzpOEuW9PzPZEutFnAbbh77i
 zvxbQtT7IJCL24A4KutNYKmWg98im4mCzQcJCxE86Bv69ErLVPUyYbp4doLadScilXlvkkjL
 iq1wOt3rRzOuw+qnWVgWGBPxdDftz0Wck941tYF9XE0aMgkf4o1sGoDZFUFPCQdfEYPzzV7O
 S5hN3/mP5UeooFHb
Message-ID: <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
Date: Fri, 14 Feb 2020 15:51:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212103432.660256-9-damien.lemoal@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_125136_478422_23907E60 
X-CRM114-Status: GOOD (  31.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/12/20 5:34 AM, Damien Le Moal wrote:
> Add a generic device tree for Kendryte K210 SoC based boards. This (for
> now) very simple device tree works for the Kendryte KD233 development
> board, the Sipeed MAIX M1 Dock based boards and the Sipeed MAIXDUINO
> board.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile           |   1 +
>  arch/riscv/boot/dts/kendryte/Makefile  |   2 +
>  arch/riscv/boot/dts/kendryte/k210.dts  |  23 +++++
>  arch/riscv/boot/dts/kendryte/k210.dtsi | 123 +++++++++++++++++++++++++
>  4 files changed, 149 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/kendryte/Makefile
>  create mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
>  create mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 0bf2669aa12d..87815557f2db 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,4 +3,5 @@ ifneq ($(CONFIG_BUILTIN_DTB_SOURCE),"")
>  obj-$(CONFIG_USE_BUILTIN_DTB) += $(patsubst "%",%,$(CONFIG_BUILTIN_DTB_SOURCE)).dtb.o
>  else
>  subdir-y += sifive
> +subdir-y += kendryte
>  endif
> diff --git a/arch/riscv/boot/dts/kendryte/Makefile b/arch/riscv/boot/dts/kendryte/Makefile
> new file mode 100644
> index 000000000000..815444e69e89
> --- /dev/null
> +++ b/arch/riscv/boot/dts/kendryte/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_KENDRYTE) += k210.dtb
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dts b/arch/riscv/boot/dts/kendryte/k210.dts
> new file mode 100644
> index 000000000000..0d1f28fce6b2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/kendryte/k210.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/dts-v1/;
> +
> +#include "k210.dtsi"
> +
> +/ {
> +	model = "Kendryte K210 generic";
> +	compatible = "kendryte,k210";
> +
> +	chosen {
> +		bootargs = "earlycon console=ttySIF0";
> +		stdout-path = "serial0";
> +	};
> +};
> +
> +&uarths0 {
> +	status = "okay";
> +};
> +
> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
> new file mode 100644
> index 000000000000..4b9eeabb07f7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>

Glad to see this is getting some use :)

This appears to be an old-ish version, and I've made some updates in the
past month or so. My current work is availible from [1].

[1] https://github.com/Forty-Bot/u-boot/blob/maix_v6/arch/riscv/dts/k210.dtsi

> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/ {
> +	/*
> +	 * Although the K210 is a 64-bit CPU, the address bus is only 32-bits
> +	 * wide, and the upper half of all addresses is ignored.
> +	 */
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "kendryte,k210";
> +
> +	aliases {
> +		serial0 = &uarths0;
> +	};
> +
> +	clocks {
> +		in0: oscillator {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <26000000>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <7800000>;

This is true only for the default frequency. I wonder if there is a
better way to encode this.

> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			reg = <0>;
> +			compatible = "riscv";
> +			riscv,isa = "rv64imafdc";
> +			mmu-type = "none";

This should be "sv36".

> +			i-cache-size = <0x8000>;
> +			i-cache-block-size = <64>; /* bogus */

I emailed some people at Kendryte and they confirmed the 64-byte
cacheline. The cpus are rocket cores.

> +			d-cache-size = <0x8000>;
> +			d-cache-block-size = <64>; /* bogus */
> +			clocks = <&sysctl 0>;

This is correct only by coincidence. The clock structure is

in0 -> pll0 -> aclk -> cpu

aclk divides by two by default, so it runs at 390 MHz, which is also
what you set pll1 to. However, if someone else (such as the bootloader)
changes the pll0 frequency then this will be completely off.

> +			clock-frequency = <390000000>;
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				compatible = "riscv,cpu-intc";
> +			};
> +		};
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			reg = <1>;
> +			compatible = "riscv";
> +			riscv,isa = "rv64imafdc";
> +			mmu-type = "none";
> +			i-cache-size = <0x8000>;
> +			i-cache-block-size = <64>; /* bogus */
> +			d-cache-size = <0x8000>;
> +			d-cache-block-size = <64>; /* bogus */
> +			clocks = <&sysctl 0>;
> +			clock-frequency = <390000000>;
> +			cpu1_intc: interrupt-controller {
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				compatible = "riscv,cpu-intc";
> +			};
> +		};
> +	};
> +
> +	sram0: memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x400000>;
> +	};
> +
> +	sram1: memory@80400000 {
> +		device_type = "memory";
> +		reg = <0x80400000 0x200000>;
> +	};
> +
> +	kpu_sram: memory@80600000 {
> +		device_type = "memory";
> +		reg = <0x80600000 0x200000>;
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "kendryte,k210-soc", "simple-bus";

Should the -soc suffix be here? I saw it was absent from the fu540
device tree.

> +		ranges;
> +		interrupt-parent = <&plic0>;
> +
> +		sysctl: sysctl@50440000 {
> +			compatible = "kendryte,k210-sysctl", "syscon";
> +			reg = <0x50440000 0x1000>;
> +			#clock-cells = <1>;
> +		};

Would it be possible to model this as an MFD? There are a lot of
different registers in here, many of which are unrelated to clocks. For
example, there are also reset registers, a reboot register, and DMA
handshake controls. I think modeling this as a clock controller only
does not correctly reflect the hardware, and will be awkward in the
future.

> +
> +		clint0: interrupt-controller@2000000 {
> +			compatible = "riscv,clint0";
> +			reg = <0x2000000 0xC000>;
> +			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
> +			clocks = <&sysctl 0>;

Again, this is wrong; it should be running off ACLK.

> +		};
> +
> +		plic0: interrupt-controller@c000000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			compatible = "kendryte,k210-plic0", "riscv,plic0";
> +			reg = <0xC000000 0x3FFF008>;

With regard to the size of registers, I had the following exchange on
the U-Boot mailing list.

On Tue, Feb 4, 2020 at 10:23 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 2/4/20 6:32 AM, Bin Meng wrote:
>> Hi Sean,
>>
>> On Mon, Feb 3, 2020 at 4:10 AM Sean Anderson <seanga2@gmail.com> wrote:
>>> Should the size of a reg be the size of the documented registers, or the size
>>> of the address space which will be routed to that device?
>>
>> Perhaps we need use the size of the address space routed to that
>> device, in case there is some undocumented registers we need handle.
>
> Ok, I'll go with the whole address space then.

You may want to make similar changes for Linux; I didn't see any
documentation about what the preferred size was.

> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 0xffffffff>,
> +					      <&cpu1_intc 11>, <&cpu1_intc 0xffffffff>;
> +			riscv,ndev = <65>;
> +			riscv,max-priority = <0x07>;
> +		};
> +
> +		uarths0: serial@38000000 {
> +			compatible = "kendryte,k210-uart0", "sifive,uart0";

I would change the first compatible string to "kendryte,k210-uarths",
since that is how this uart is described in their documentation.

> +			reg = <0x38000000 0x20>;

Same thing as the size comments above.

> +			interrupts = <33>;
> +			clocks = <&sysctl 0>;

Same clock comments.

> +		};
> +	};
> +};
> 

--Sean

