Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EB8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uWeECgUy58SLtIIrs1Oa7wrzS2jjaUGdA43r+0+/qg=; b=Ob7Jc6eQIHQ/in
	KLucPJRNHAmfYqUtyRYWD+Xf0PkP7MjKQ7m0Xrv+pwP1YozWifJqfsU8mCyj7Rf2fPXmQP0FpQhNW
	UgDmHQWd0Ipgq1gYEkOlDIiYbS/ll8SKvdYKKgtkXIOztyFOdjskqIHsGhWRFdKXfwWUQCM59pzRz
	bbx7ACb4Iz643CIekNoaSgcvRIp5WtohXEXPY1XnG5Ji/yr8/T2TWbjzKuaQhnXS8TWTimNlrNUo3
	j9AYYQFXXzN6vOCBNlz5e25xRHWPWaX/RHnb6dYeIhmpYlrxlnJoxg4S0jc7jiKA5tSD+Dr88kuhE
	jq2P3JNCzpAxtbKQAVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lXW-001VLy-1D; Tue, 05 Jul 2022 16:36:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lXT-001VK7-86
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 16:36:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so7563005wmb.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EmLnrG7RjmkZkoaedf/AcqY9w1jbh+1fWdmZ7QBondE=;
        b=Z1oOdheVZJ6dQa0p776tKZDLAYHAcaJOVw+nUPxr64CsjIv0yWyAlaHUUrZpYTcpP+
         cqFE73JKR3DVixXSjp6tqcrZm12zENvd5UUdlXAcoluzdUX/m/5AdEo3+VjjxqO1keQR
         c56FElMX+ntpRB7eiyp4c9qM5D5/CliNFRbzJlXulzBghYMI/4Boouno2pVhpiJOQHyr
         KoiTbDfd/8WHcI0W43kcp/48kUp/xff6++NghjIZtWAZmIni+IirUUHq8yqWKmbppLTH
         2P463lFjpbEQR2qSZ4E58ejWBnfmhVIG6kfvRV2frF93N7i3nAiQx9zaBEqFh/kOxCmY
         CUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EmLnrG7RjmkZkoaedf/AcqY9w1jbh+1fWdmZ7QBondE=;
        b=l4AgGWVwKyJ2HGZsdqGnBhcD2MUF5DUIgS+2DkC4ovopydFNj6rV3pl6xxUfSBHofK
         6QfURJsss41YbcHMNjEOc1Ng0JrsVnwbzrDYlmfr5x79Ozv21mnHDg/rlQso9EUsHYnW
         BcFCh37UFVXXQHESXaudI92aJQGRJ/D8uG5ln1mjHMOku1ZYFp8oEMk/WOYt1L1FY3az
         cD3zp3KwAkzQiuyUSXc69DbSrQGIlPDae6IEaMVG64m0xkZWmsmoh/xyjq4Qftk0qQuK
         sWiFSNZtZAWRnmctGgN6UZY6V8r8EPnWkkkp04cDeJiVomTn6EdAp1AUDhDkRQ2WyWGf
         ZKUg==
X-Gm-Message-State: AJIora9b3LXA2AOb5nbqYng02gmg2m5E5MlBkFDs3grY7LxBs/OxSe6/
	uFWI76JtgNqQ3sevibSUY+BfCg==
X-Google-Smtp-Source: AGRyM1s8cE4Ve852oDDbv/xzRRKOZSh7Hnd8kW0luPTYEl3BHhAHGA2/redgAa8G15v7C7LgFSVKlw==
X-Received: by 2002:a1c:cc1a:0:b0:3a0:39b1:3408 with SMTP id h26-20020a1ccc1a000000b003a039b13408mr36733506wmb.157.1657038995336;
        Tue, 05 Jul 2022 09:36:35 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id q17-20020adfdfd1000000b0021d4d6355efsm324298wrn.109.2022.07.05.09.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:36:34 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com,
	palmer@rivosinc.com,
	ivan.griffin@microchip.com,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	krzysztof.kozlowski+dt@linaro.org,
	atishp@atishpatra.org,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
Date: Tue,  5 Jul 2022 17:36:23 +0100
Message-Id: <165703891541.1175279.9783601760471076609.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629200732.4039258-1-conor@kernel.org>
References: <20220629200732.4039258-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_093639_345411_44649DCC 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 29 Jun 2022 21:07:33 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The initial PolarFire SoC devicetree must have been forked off from
> the fu540 one prior to the addition of l2cache controller support being
> added there. When the controller node was added to mpfs.dtsi, it was
> not hooked up to the CPUs & thus sysfs reports an incorrect cache
> configuration. Hook it up.
> 
> [...]

Applied to dt-fixes, thanks!

[1/1] riscv: dts: microchip: hook up the mpfs' l2cache
      https://git.kernel.org/conor/c/efa310ba0071

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
