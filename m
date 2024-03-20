Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94DC54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=80D6ZG9VWAJXPB6aH5JqVxyCywxQTIBI+LAMPnWTjIg=; b=KpxTgyNSl4wzeh
	HeCp9wJshLEandHf3adX5F7M3zoXR+UFdtNXAEXwjmV+XJcf3yVan2xnlheVnw2P+9ktEIW1DBzgM
	8cnrBgUXnJrdjcchru+N62yAZ3wEyDWz+kdWrFlpEuTm1goSZYhil3z3W/aZ1iZinMG5/lGCVpIyz
	cI4oLh8w3iBnmjzeLWgeYe+rRdq/K2M8TQ6Y6SnXlFzRZrQr+gx5SMjUbOySbw6q38BgJQWuAEaKn
	2qg2eNWkaLns9EFUV8DMfRSQHyNORFSYwQ31rnJuP4VNRaMlzPoLESMQW+dKJ/ic/+plq19IpqDKS
	o6ULNtOcU+riIiQE2y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngP5-00000007ezr-02UF;
	Fri, 22 Mar 2024 15:01:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmv3a-0000000H78G-3l5X
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 12:28:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56ba73c02b2so1497281a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710937711; x=1711542511; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bdUMDayjgwY4ifcDBF0amt72RjSwOT8m0FQhkrxhi5E=;
        b=PlR4z0lMAK6C5da1hKJ9BCBX/+qm0TQOPieZQ17HMn5Z1V4Cly/4mdKUMds23QMYJy
         A/j8sAnmPQwnIQ27hFjuKkWsA3rrtITvkSPYAVZIWp1UIUSdXfPBbw62ADmJjGwzJYnf
         Ays+prrqYaCgsQgXOah6hQiOxvmfzU93C1b+dnB2ofedMlDXnCFjJ8fu1csrvoDa7VdY
         j2xYhw6wvckKTi66q033GS8G6JX7og5M2vTqSPCpxPlNo/mtqMdKN9GQYWojDLsfLEgy
         mNGFe9c3zS7+w51DWICivm1/8H+q59291MJ6JIKm32iU572IHNGlsAoNG6PYYeBFltmZ
         wjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937711; x=1711542511;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdUMDayjgwY4ifcDBF0amt72RjSwOT8m0FQhkrxhi5E=;
        b=gbM9YlDxjiWPqtVGbAZ8C2w8jDXXlmglPACNTHnRqywgxego05PI50OuDKc39CYoYp
         xR+iI7rbP2yM/SvxAZ0rhGQQabL4PfEpuIvPJLoztKbMJMet1PL8SDrAz+0D/XrV2WT9
         9qt71RKCIj/pFJEOWTgoWurOSKb03djjZJXv3KJyplRwAZMY9z6FrRgBit4mXd7PCbiz
         4OL2sihGOK8R8lfq2KEw0/IvNakNqT4RcX773thnYaSEeGSThZ5PWSkUYToTZ/DWJ4Rz
         15r8N/f9jE9cSnW+ifMo53X/zphMcvaCWZQzr+b8xWSQHL87jZvDo+oYXqDDzh2JL4N6
         ArKw==
X-Forwarded-Encrypted: i=1; AJvYcCUe+Ao2N/BeYc1fF2Yx0MnyFFyOIKWGvpNx94oHDvdS2qbFOJgRcK3TWphK11UaED9qxkKDj3pveBSD5IE6jamCL9Y2PlRrpOquBExl5vh9
X-Gm-Message-State: AOJu0YyoaSkK0Dcrq7MFXNslOSRmNjTSHzM1tNalxp5GRRV1bgcRh+jY
	JKwTAD6wzWjV+0MNZn0OCHEetaWKwb/KOHttE+rZOa2L5yWtUxrw9FUbdO+jDNSgCf23YLI7tmq
	//CgFBQXUruYr57qwjYws3ZW3kOM=
X-Google-Smtp-Source: AGHT+IGOIbmdUnhCSYcULvDcwIIZ5WOCfD6T2cbHYI6yQL/t1zgl2lfCuC3N+Jp8O3Js/oAzUBJWFNtd2jCadNraakI=
X-Received: by 2002:a17:906:c106:b0:a46:9e89:cae9 with SMTP id
 do6-20020a170906c10600b00a469e89cae9mr11909879ejc.39.1710937710775; Wed, 20
 Mar 2024 05:28:30 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 20 Mar 2024 15:28:19 +0300
Message-ID: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and microSD
To: xry111@xry111.site
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	dfustini@baylibre.com, guoren@kernel.org, jkridner@beagleboard.org, 
	jszhang@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	robertcnelson@beagleboard.org, Rob Herring <robh+dt@kernel.org>, wefu@redhat.com, 
	Maksim Kiselev <bigunclemax@gmail.com>
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_052834_960459_EF577AF6 
X-CRM114-Status: GOOD (  10.96  )
X-Mailman-Approved-At: Fri, 22 Mar 2024 08:01:53 -0700
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

Hi Xi, Drew

I have the same problem with SD on my LicheePi 4A.

After some investigations I found how to fix this tuning error.
Here is the patch that increases tuning loop count from
40(MAX_TUNING_LOOP at sdhci.c) to 128.

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c
b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 8d6cfb648096..da8f5820fb69 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -706,6 +706,7 @@ static int th1520_execute_tuning(struct sdhci_host
*host, u32 opcode)

        /* perform tuning */
        sdhci_start_tuning(host);
+       host->tuning_loop_count = 128:
        host->tuning_err = __sdhci_execute_tuning(host, opcode);
        if (host->tuning_err) {
                /* disable auto-tuning upon tuning error */

After that change tuning works fine. The same value of loop count is
used in RevyOS BSP
https://github.com/revyos/thead-kernel/blob/c6d4e5df18a17903d012ffd89e67d0ee5ce6cf2d/drivers/mmc/host/sdhci-of-dwcmshc.c#L185

Honestly, it looks a little bit strange for me.

It seems that the tuning algorithm requires to move through
all the taps of delay line(128 taps?) even if we use THRESHOLD_MODE
instend LARGEST_WIN_MODE (I mean bit 2 in AT_CTRL_R(0x540) register).

Xi, could you also test my fix on your board?

Best regards,
Maksim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
