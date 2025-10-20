Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E04CCD195
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 01:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gy/REo5K9lIcRkFsg3Lw6ZmddTALqU8WF78Up+dN90E=; b=ZlWEuPm7I2HbGf
	YBES0gBtuQXairw4TXxwKgwXLTGMiw6Ftz4pm0zwB1ZGG2t+4owGhFaIIzGOYzMJlO24/ZspPVDEG
	6bkAEn+FWnnKXkSJBYuQp0o4/f46tApVoilz6nN9c/XGbG15JR92yPryM/iwbYoCq6vhrXsQMTOZN
	U28TdGu24FYZQd3lJcOS3j+eJWxwXNC40pDFmLZCybZdoEDGN6tc58DbKXRL/YMOnbMomfZ82tkQ7
	HoYrw1MR6i1YMg1LeF44Ehk4CiJdVLb3NJg8GNgQ687aMqheN0mKabRt90cB55LcP3MlmE09pYYjt
	jEOYnX19pVG8iMjU1V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAf7g-0000000Bf76-3N00;
	Mon, 20 Oct 2025 01:55:44 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAf7d-0000000Bf5a-2AWE
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 01:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760925265;
	bh=PHQXMd97MnTG8yBwsciGWWANd35WJk6gSCdTScCji0w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=aJ4AS9pwBuiXB537LkuEvoXvY0bGJWhpkRWqJRLE9dyK0ElxNcNrHJNIg/sF/HdXY
	 S3Sz3xMze+jAixt1IqefTAmBngl0r1aeFgwtRiaC2XcAf/Rw8ve0tJyKRV3W02vRe1
	 19vzMAK4Cn7JBIbTdHIL4JKix/6TjBprrPOfMyKI=
X-QQ-mid: esmtpgz15t1760925263t112ed490
X-QQ-Originating-IP: ZuqEQVrvPyjcqO5ccy9yBkk58y5T6FF/58EnwbXksTs=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 09:54:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8184163125021412626
EX-QQ-RecipientCnt: 15
Date: Mon, 20 Oct 2025 09:54:21 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
Message-ID: <D20EEBFFFF06649D+aPWWTSN4LByos8Qb@kernel.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com>
 <20251020014132-GYE1506524@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020014132-GYE1506524@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NdOiMXD9pMVqCEhq2LH3/PewXrAaKXxAULAMoDu/2B3ljHKGwZqfdHGq
	nH/J+TIZBb8DG6sUQtoovS29nTeYY9IScsH/3gr4EjnVoE3UziLOuXmUYFQ7k+xthAVxBI7
	YkWMELQaCOgwxiuOgh9QPqXIskZmmL98kuxce9gJwlAioNxlESYQc5NvDs55RofU26dh1CK
	fTne64e5Q3igyeijaRStOVxzuMj9IOUa9oVQcn5t7LCAhpZn8r0n9m/e9DtLDbV2k8/1d17
	Eh6em43GApoYDvA92tYefwKgrz3hGxx0iOnSL/FuKRZuYFqfLWrTk5dT3reHTJSDhN/ZU4C
	erQTo82Be7ra4ZIhCOK1jBKrC7KQfJCyZ5WMMUMI8EznbVvez4jcHk0OOClRzztsatuNmbN
	dv3VEdHnv4SR8t+Y2+hul9Yu2VHi6eZMRgcwVt8uRQ8UIpaPizpWXR5mvm3UFgU/dKo9mpi
	/7HkMq2mdi1C5TNOMOGvPhHl1j+O+TzFlqO/uvItwR/TfVS0PakH9dY+QJwB2OZZ5zMvYhW
	l2mgbpRF5oKkp0cS+bmVLcR43OsekDF+jYPzhjZ99X0ZD+vTq1tjy09PNAh0yc6T4fZ7OXs
	Wv9jAAIfDo2qDGYMtY9xRGHsMLNvR6N4Zfut6ccAf0utkLylxcQrLNMWAEyiSPKF5/bin5D
	ID5V2lSTthiBD1xdeaqXChuOA4CNeJlNROsld0wxb9Irwzr4yiA+hrVB6/X/7AB5gAEKtoO
	inxbd2YP8yWyRntttE6e31i9grZeLYZIaoDD6cUCZcc15m5EcBXrPfKALRNp8QI7a9lDStP
	/UFgmP1qBQ11hVPbvI3XynCxwLQWGBSFRhS/5LB/1GoaoOtRM3u82VnwTERXJ1bk26bRKef
	hLHLppzO5Poej70q7ArA74ahdvYbIkKzhGdGL6cNrXi1Kuit7Pf5hQBDONkBFTabWLr5vLn
	BKc0QR2MhzrwG1PFIM+VbxEnfn2LpKz/U4lcFy2FKuj2F+YHTEPdtsoodsgaSw0BJ5rRbqZ
	fC8Jyp57BhHX4qlzg42M/Q6BhobdmuTlPAQkIED5O4eCWFZirY
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_185542_084036_2B599BDB 
X-CRM114-Status: GOOD (  13.37  )
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

On Mon, Oct 20, 2025 at 09:41:32AM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 13:52 Fri 17 Oct     , Troy Mitchell wrote:
> > Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
> > single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].
> > 
> > Here's a refined list of its core features for consideration:
> >   - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
> ..
> >          This suggests potential for light AI/ML workloads on-device.
> drop these additional marketing info, just give neutral technical description
> >   - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.
> 
> ..
> >             Sufficient for various workloads.
> ditto
> >   - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
> >              SSD (2230 size), and a microSD slot (UHS-II) for expansion.
> ..
> >              Good variety for boot and data.
> ditto
> >   - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
> ..
> >              Standard display options.
> ditto, please check more bellow yourself..
> 
> >   - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
> >                   Ethernet port (RJ45). Given the stated markets,
> >                   this should cover basic networking.
> >   - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
> >          Decent host capabilities.
> >   - Expansion: Full-size miniPCIe slot for assorted modules
> >                (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
> >                general PCIe devices (SSD, PCIe-to-SATA, comm boards).
> >   - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
> >   - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
> >           for cameras and displays.
> >   - Clock: Onboard RTC with battery support.
> > 
> > Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > Link: https://www.spacemit.com/en/key-stone-k1 [2]
> > 
> no blank line here

Thanks, I'll fix them in the next version.

                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
