Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B94F9D0CF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xSYpDSEgybjvSiiG86K9wYP1XzemxyQVTJ0Di32VbY=; b=051FqvZam/3M81
	WzmDhcdM+UnN0+cHq0O7LtNTW82HVGADj1kZdrY1D2gvymZ0JmCxFyr6our9JSASyVfCi/Gfy0oan
	/LcgCRGCAQYmOzS8B3PPYAewosVAO1JUF9sG3k4PoyTzwqzJes5kVkdQlVUo8ddnK2UzobcuqXh4a
	z76DNiptPI6IlNCF+OBzwLgSCK0QInG8/yrCS5S8YN3305U+PVwpmTiz7B2WOEqfcvWCpgOsJfqcp
	oGrh8c3eZgWuMy5lRQmPZHhU0hVsuhlfWwMnTbj+tqxBhbNzsE4F8lu3+iy0vlXZKbSzUFpk0VYok
	ixavuqr3EmEXa+VaAkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdlq-0000000HN6t-1Vb0;
	Tue, 14 Apr 2026 13:25:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdln-0000000HN68-1DoT
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 13:25:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b9910707d82so694101166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 06:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776173133; cv=none;
        d=google.com; s=arc-20240605;
        b=NUVceWQh4jhj0kI9itOvacP255vDc5zZ/FkKEPE4v8kUtViuHEcg2BWiw+tms62Gzd
         zaSChsmbHl5OVdLGsgfluNJ7+sM06+e13Lm+aSzAvyxF3n71Yxvws8NwKvJYBgSi/qhZ
         ukol1wvcjWircNzep3KLF0Ce3yh1A53GEDgc64UOUDMlUzXCpU+l3xxScc1E9SnHvnA/
         uYt3U6tRgfCgVOwj2zi0iqETNqmzocGkm4wha91/zbSkebqaN7g4uI1bInu+zIEvcgYh
         r+LOT+hR/iJAogk1Byi/ls8OrlMqhz+Q7jqVFrQ7mG8sYGIzt1ige9MUT/GIoH5fD3ax
         ux7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        fh=i/yI0bBK1il2mNCRBIAbYw7+2aqKyrNYRQWWL5UDXos=;
        b=aHsjjaj7XtjB5DXyn+EQc2emM/qIkYuPLOvZi3gbHmuhPBWnDHgUORS9cwqS2oaeWb
         3+yRRpBONirN+TBDhMKvjqeciEPXo3JjgLnxoTp39G/nLrAkFpgxpm5aDE2f9bs3QBcb
         ptXYwWyrqveki5I1tJyVBPS9rHAuSX0GDkJkh9X/esEIz24OQLpeSTUfkPtiA/OIrxpi
         M/Y4Z7KkaE/uKhtm/znYY+SpYX66DZX9k4llHjFQ4oSJsLbsOQPNRv/mIVDmo8IzI8rp
         A6lgSOBkOT195H8R0C/jbssuv0boeF0r9h/B/cOtY/GDLPlZ0cYBGEBKXVvo1waYqfvg
         lgXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173133; x=1776777933; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=UN0Zla/RZMZyeB7P0mE94dmqY6j7+MPnmsH5aNcGL79X2RbhEnbaP+Bx819chEKp6H
         iWJN8EvWy6cielWvPrLy/irPZUNIMu0ZVZMJNraEGkcDDKEvpFef765TPMivaa9I95fH
         xsAPqPa6B9hc4s9O+FW+sV5ZTVSVBhN5FGsaghuGqFUJt3JNC4/DrX/Cdqp/8fYKrov6
         aMgwcaPg2B71/G6EUTvDgLdJUSlAFwi5jdYDF9CQk3w0FebO4RwsKdzltf+IbY1lwv6R
         CjnfAZqeOeFbpDekCZ+Zz6ikkb2weabGslmdOUX8JB3SeikOL5SqzRxTyPA6+ZLB4RHi
         dKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173133; x=1776777933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=XCfvxT3qcjueocyAGLxSS2+oySec7UoNn73z+IZRLsIyv1dQMbsezejzBgB/jUf0p4
         Q/VfDWNkg0J6PLF8r99mSOcq0Ih63v79iMO16IFmxtF6fN/M+i8j40FTArsuz9SFMOg8
         Quz1DWkWt3hNIGaONigpQKnCyNgWKqntjeDRP3CCKTdVXuSXcYAqmfg5nfU9LQBh2NYO
         gkBxt8KN3Wce+FyYuwh7IrPdI9kNRK5PWPKIQyKrlfRr5Cp0Ty1uOcGvgw0zPuxVr421
         ixZH8iixt1QVvzkcDy+6mWo8kuKmrNDBlKBGvmM2OKcNtBROGlcIgZlGnpO56e8uGGYy
         yVNA==
X-Forwarded-Encrypted: i=1; AFNElJ+fsqWMuCTrLCOILrLnZk6RUHWRCkzpwxfjWgHL9uZH24AlomAlGmw3h+sYOCVVpp4XkiYagNVSF405NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywUnZzLDpK0UwH/+jEPfxc9R+eKNx9ZMcmwx+iqVQQiczfOYSD
	Yy9SJ2I4GlxCliA46sR6vNHH3vUxHLURSvAfwYpZLbh2AgIC6A10ZuZVUUAXdb9Ql4A9I9n4403
	Ra5WPD6i4+w2AUtIAmItG9z95mEFLQdE=
X-Gm-Gg: AeBDievf6POup5G7QWgFBbsR40HmHsPnDEoogKHKMtoUFobqwoRRzl4YZ/tLhT0xb59
	lwlC+fJ0WYclLZrdNKXRCLS3K6vTcmhJCogAjEPJ4djFghOej6q/w0blmuiRss9W0GitFSDIa21
	tCGuIYVRv3/85sn3eHnyHIJT558uG+9hpmgU9SkkoFiKpB2z0dlD5xecfbJYSJ6T9NqB7vHgp67
	9c5cjk1mcIa0wam4YlgbCH+aTZCk5xYspKp0jSJHE/cPwYTR/jEuQs98K/pYgQpPz9fqgakkz8A
	iosKMA==
X-Received: by 2002:a17:906:ba8b:b0:b98:b08:7442 with SMTP id
 a640c23a62f3a-b9d7277caf6mr927238066b.7.1776173132486; Tue, 14 Apr 2026
 06:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org> <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
In-Reply-To: <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Apr 2026 18:55:16 +0530
X-Gm-Features: AQROBzA45N5tX_gxF8wNR9dEOurmKJqRG5G4HXCsGJ5ETbsePSdurO7YbSqgcRs
Message-ID: <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062535_378106_4D17FB49 
X-CRM114-Status: GOOD (  22.58  )
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

Hi Shuwei,

On Fri, 10 Apr 2026 at 13:30, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
>
> Add Operating Performance Points (OPP) tables and CPU clock properties
> for the two clusters in the SpacemiT K1 SoC.
>
> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> board to fully enable CPU DVFS.
>
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>
> ---
> Changes in v2:
> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..3780593f610d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -5,6 +5,7 @@
>
>  #include "k1.dtsi"
>  #include "k1-pinctrl.dtsi"
> +#include "k1-opp.dtsi"
>
>  / {
>         model = "Banana Pi BPI-F3";
> @@ -86,6 +87,38 @@ &combo_phy {
>         status = "okay";
>  };
>
> +&cpu_0 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_1 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_2 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_3 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_4 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_5 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_6 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_7 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
>  &emmc {
>         bus-width = <8>;
>         mmc-hs400-1_8v;
> @@ -201,7 +234,7 @@ pmic@41 {
>                 dldoin2-supply = <&buck5>;
>
>                 regulators {
> -                       buck1 {
> +                       buck1_3v45: buck1 {
>                                 regulator-min-microvolt = <500000>;
>                                 regulator-max-microvolt = <3450000>;
>                                 regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> new file mode 100644
> index 000000000000..768ae390686d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/ {
> +       cluster0_opp_table: opp-table-cluster0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +
> +       cluster1_opp_table: opp-table-cluster1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +};
> +
> +&cpu_0 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_1 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_2 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_3 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_4 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_5 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_6 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_7 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..bdd109b81730 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <0>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>                         riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>                         riscv,isa-base = "rv64i";
>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <1>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;

Based on the Spacemit kernel source, the k1-x_opp_table.dtsi file
defines several additional clocks for the Operating Performance Points
(OPP) table:

 clocks = <&ccu CLK_CPU_C0_ACE>, <&ccu CLK_CPU_C1_ACE>, <&ccu CLK_CPU_C0_TCM>,
                        <&ccu CLK_CCI550>, <&ccu CLK_PLL3>, <&ccu
CLK_CPU_C0_HI>, <&ccu CLK_CPU_C1_HI>;
                clock-names = "ace0","ace1","tcm","cci","pll3", "c0hi", "c1hi";

These hardware clocks are also explicitly registered in the APMU clock driver
via the k1_ccu_apmu_hws array, confirming their availability for frequency
and voltage scaling on the K1-X SoC.

static struct clk_hw *k1_ccu_apmu_hws[] = {
        [CLK_CCI550]            = &cci550_clk.common.hw,
        [CLK_CPU_C0_HI]         = &cpu_c0_hi_clk.common.hw,
        [CLK_CPU_C0_CORE]       = &cpu_c0_core_clk.common.hw,
        [CLK_CPU_C0_ACE]        = &cpu_c0_ace_clk.common.hw,
        [CLK_CPU_C0_TCM]        = &cpu_c0_tcm_clk.common.hw,
        [CLK_CPU_C1_HI]         = &cpu_c1_hi_clk.common.hw,
        [CLK_CPU_C1_CORE]       = &cpu_c1_core_clk.common.hw,
        [CLK_CPU_C1_ACE]        = &cpu_c1_ace_clk.common.hw,

Yes, it is possible to add these clocks for DVFS to work correctly,
provided they are managed by the appropriate driver and declared in
the Device Tree (DT).

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
