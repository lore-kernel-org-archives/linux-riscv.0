Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0566EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asyqpPakk+TkxwIg/ImVkOJXly8449N4if+AZGlfPhk=; b=ZVy99/JzXl+G4TWiTFRKgT4dCP
	KmjgUJ/a0wseVo4Mg9dI6g+LjEk+02bj7+FQlq9AFq3SfxoJGt2ci73gvL02VIgulzA3jr/zwqWGw
	9I8paG4uinRMI74PhYRdmKzCV6R6lMvOaKw/TWL9z7SAoZ5dzSfJf1ryw/zZgMz0Tl8qAnVLFFYwB
	EWHPyE2EIkNZ/tqIDfzWwZ+eyBgnVuPYaAEmv5qSCXYemHGhI1DKzN39HK4/oWrXUpv89YUMQr6yI
	oZu6vnkjU9N3BAGaLyAHjzNqyBssdXD+bGAtBx4SW8QzBMy5XKxiYY1uwcNlConHY03hh6MRVhLyc
	atMkTJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrk-0000000HJrr-1mv7;
	Wed, 04 Mar 2026 14:06:20 +0000
Received: from buffalo.tulip.relay.mailchannels.net ([23.83.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmre-0000000HJkc-3VhR
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:06:19 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 471C978201E;
	Wed, 04 Mar 2026 14:06:12 +0000 (UTC)
Received: from fr-int-smtpout12.hostinger.io (100-106-44-163.trex-nlb.outbound.svc.cluster.local [100.106.44.163])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 81AD1781F91;
	Wed, 04 Mar 2026 14:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1772633170;
	b=E4rGt2pgwYi/X5pIzdEVhmdJ1dS1zbJVj+g1R3dILHEficinZ7lPweJIsUMRKffzfX+xY0
	9V+yJQLFSHcVVga/yfW1nQ3VF6Djuj+AiJOluZ9ZQSoaR2DFECdlmkpjcd2hqvIJfxFfCI
	mQCPfKT2b/WhsTgCYYtGeH8V6S1gWt7NWwdRvw5BkgdyiSGIfGc+kHjpuJzR+mxPsTx4gB
	6UwfLlIT43b2pcYXjnH6SxGHBXIKP+XiOKh7HzsrNA0tRZ/QufFf1tSc7mlp7z17t2XOWh
	DcGHhfpDGitbfACOQrkidPvmHvB+CezybwZu1c36fN9KoFRCl7W2teSgnHSrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1772633170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6ZcnJ/j/bBqCLcJYERyzEEBssHFy6AjpJje4wPeAnUc=;
	b=N6uHgBEV8Fc1PqdiXjPDjztuTG1jrKsrEn0ME7iOKPlXkmsXdjbVAZq1Y4N7LmL1yJmteZ
	cofrX9J23Kntyt5xRft0uUwSUBm6eKZF4v11mjZioHxRqssz3RYYpfBRJAenmA5cbQTblK
	AmJz7KGqwN/n9lUMXScP8YKV9MMZtnmbCHuMOr2iMQAq4FIE0hvQ6Argy8JBgsHAFJjiiS
	YL0Bi0v4ezyVR94tTpJ1PkwNuDR7UMsxe6ktcl9kq+mtVtvv6Xulnx2bwcHzVPMdjTYA/6
	mJiKr0RbhuZYf/usExEFm09bz4caQkAsQfcCPNKRqCjK+MKv0nXjA/wcfrvAMg==
ARC-Authentication-Results: i=1;
	rspamd-7f65b64645-78922;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bitter-Stop: 54be4d3e301d048f_1772633170763_1578999821
X-MC-Loop-Signature: 1772633170763:2420406471
X-MC-Ingress-Time: 1772633170763
Received: from fr-int-smtpout12.hostinger.io (fr-int-smtpout12.hostinger.io
 [148.222.54.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.44.163 (trex/7.1.3);
	Wed, 04 Mar 2026 14:06:10 +0000
Received: from [IPV6:2001:861:4450:d360:f268:4cb6:92c5:22a0] (unknown [IPv6:2001:861:4450:d360:f268:4cb6:92c5:22a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fQvbJ62FTz1xmF;
	Wed,  4 Mar 2026 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1772633165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZcnJ/j/bBqCLcJYERyzEEBssHFy6AjpJje4wPeAnUc=;
	b=nAHTaatahqRW98jaGeLTZEnk5Rc+NxOllPE1H9Z9B6ckPb3hbPnf0pb8pGRjuSufoNZNHz
	XBvE1V4M2HRB/NofQCgcEE/i0PBFK6vIxllZOyfWoWYg3EpkquetP2RG8iW79ZftFbRVC3
	Kjpey6oaRnMX+8pygcHmPTDbrIinl83ztpz6yBjpymMrFjWO0XhBcn08WTMDjR2ql0WG+k
	2okX7pZkKvSO37tBAhvEVVB0oVTq9tjDB3Zd8L0wfwJ2elmEm6HZVGjqyRE1g1GJJGn0z1
	TfyW6JnrJ3sLYCmJKIGqAHoQ62C1IZI9L4J68T0IMVR+J3d7/0kAlkgWDGuElg==
Message-ID: <e6aa3c65-171e-4bab-b552-5e8cf4bf35ec@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
Date: Wed,  4 Mar 2026 14:06:04 +0000 (UTC)
X-CM-Envelope: MS4xfJGaqNo8HVHkf0pbSl1l5Xlg3h6UW8oWB0/I0QhOtT7T7ozYBKTdXa/YX9tbFiOy7N8pc8qFLLntzfRP9vONMIOpdRrtMUyu/P6uOvhuNDEF/XUmY8uJ qQ8y7/aBbQqnbimRVUHV5I99ZkiDtoCtRWoxNDBCh8Ykv10/cIppgBu+54Yqkf2KfNdqcntVX7cmAAh7Grtz5fP64N3D5+JA4u+v0B36DHHd2r1cwHdSMKtr vLmMAf6K6X+YBvYw6z9dfhsdRkAF/QhMKu6tAWMVUCeFYM9HXO5bzVGXtdb1EWURGvov4kGL2NlK9vwOaJsXhoCZVYgHQX45/8iGmsqVtxd6efr56av0snJ0 4Ys5XdrQOWLD7SwWhZniXk/LvvwXX9McjKzJQOJOaIUmOggdfr47F6RqxJzY4hUJicPclfIvYGrRhEglqk9DUpT7XBt5cYlrFiHxKVPM6xu0LcgZ6oUtEyEl IGrtBdDW9Ell6D7IR6jj8HpSNxvDR5GMNeoH21ZVMCYMU89ZPqbdbqLj9N7JsXTOnlcIlR/n7wJex41AiCyk611OueupQ1avamMaLvOM+Xa3qSbLRS7E6dIw 1br6Q1W59xQOrPvNzZH8swxVm5ifwpkUM4RaDgFFozkl6dSmWi22awNJOIXNi8CbJplJHnPhULRAUBHC/5/JMk3cUFv4jZGLVSfgo6+BVNZObRbB0tQkgF3I urYQIXKOPin67XicBSZotg3HnIy8TaJUYrW01C0EUH1xcOzUNhpa6PTM52oceANLA7UPP3IN1g+wlzHZ9QeyJExg4qY1p2Dpx5lDwOmt7DrNdtfKh+WiY8PG s95nhWsEZuO0SRN+cyhDrcRMUo4zXRD56j0R47t3Qs7Y9ciNDRXcVrAMubgwlQ==
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69a83c4d a=eDks/dr2Th2ytqR7xoOTkg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=pGLkceISAAAA:8 a=cywHqOp7CWn13ELKgeMA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060615_293245_BDB8EEA9 
X-CRM114-Status: GOOD (  17.89  )
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

Hi Iker,

Thanks a lot for these patches!

On 3/2/26 4:13 PM, Iker Pedrosa wrote:
> This series enables complete SD card support for the Spacemit K1-based
> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> high-performance SD card operation.
>
> Background
>
> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> currently lacks basic SD controller configuration, SDHCI driver
> enhancements for voltage switching and tuning, and power management
> infrastructure.
>
> Implementation
>
> The series enables SD card support through coordinated layers:
>
> - Hardware infrastructure (patches 1-2): Device tree bindings for voltage
> switching hardware and essential clock infrastructure.
> - SDHCI driver enhancements (patches 3-7): Regulator framework
> integration, pinctrl state switching for voltage domains, AIB register
> programming, and comprehensive SDR tuning support for reliable UHS
> operation.
> - SoC and board integration (patches 8-10): Complete K1 SoC controller
> definitions, PMIC power infrastructure, and OrangePi RV2 board enablement
> with full UHS support.
>
> This transforms the OrangePi RV2 from having no SD card support to full
> UHS-I capability, enabling high-performance storage up to 208MHz.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Iker Pedrosa (10):
>        dt-bindings: mmc: spacemit,sdhci: add AIB voltage switching registers
>        mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
>        mmc: sdhci-of-k1: add regulator framework support
>        mmc: sdhci-of-k1: add pinctrl state switching for voltage changes
>        mmc: sdhci-of-k1: add AIB register support for voltage switching
>        mmc: sdhci-of-k1: add SDR tuning infrastructure
>        mmc: sdhci-of-k1: add comprehensive SDR tuning support
>        riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and power infrastructure
>        riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>
>   .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  15 +
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   |  69 +++++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  40 +++
>   arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
>   drivers/mmc/host/sdhci-of-k1.c                     | 320 +++++++++++++++++++++
>   5 files changed, 457 insertions(+)
> ---
> base-commit: 5f499bb7a07fcdcf8877acaa8f413a5dc1fcfacc
> change-id: 20260226-orangepi-sd-card-uhs-0ecb05839b0c
>
> Best regards,

Things look all right according to my first tests. First time I'm able 
to boot a Yocto build root filesystem from SD card with the mainline 
kernel on the OrangePi RV2 board!
Tomorrow, I should have time to run tests on BananaPi PF3 too. Fingers 
crossed for eMMC support...

I'll be happy to test your further iterations. That would be awesone to 
have SD support merged in 7.1 :)
Thanks again
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
