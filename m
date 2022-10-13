Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B343C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBqOQO/2pmH0GkP459KDNTC/f4SD51s5otmLUOW+Kxc=; b=qn8gC0ZUMcliM2
	JqO7Tum9OVKnWxMYY0ogiHnAm0aUouOv1/71uOWsz3ti5jyN3940jw+Ht19XFrqt6qiTtgYVVUAMO
	JJec9ghMajs1/pg0iJJ75atxG4AJSlK1mGI+4EU9cyjswdzcmGBuD+t+fhFfQca1tPFpbIP3tJkuu
	JcUrW+6eB/9SJCO3WqDgf7l0BVTA80brHxZR2MqPgcOfYiNH8CStyrORq8cn1Dl8YBDJlNxfQX3pY
	fcaTWK1iDyz47LGzEmhV5/ZM8NLI0203twnZ0LlUVqAqCwWKUhPPM8RnnGJIdeg7kw4OIb+mhdaPn
	Iw79WGxZT3IgPaote1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqZc-00Agbf-1Z; Thu, 13 Oct 2022 05:16:00 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqZT-00AgXC-GP
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:15:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id t12-20020a17090a3b4c00b0020b04251529so958571pjf.5
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jjzSbquCGIpZBdOT7nOgHDr2hdlUw8WRIsF1vsL4Nk=;
        b=UKqxWkfM/aMOqDYiA3dhhALbROWYdi3V8SUNyNVkCs0PTqmV52wr8cxoold1Ip2j70
         njd8Rq9HVQ1M6N4IJJj3lh1ZGnFJekZ0LqTJYq6odww9cAWdgqs8aNs1BwLvtH2jD68a
         UFjMmiUXXyDntoXChizYt9EfaT+oVLKmOQrS4H/IxbGj4yu6QhHnDV4Tb0tbIhMOZBGq
         +XB4Gw4YMwWBqMDS7PeTnlVTsqil42mhqHIDek3b4/uJC8SDS2x1yRWenHwmrpyxl482
         6tnDZ8GmiKAI6/wm4fXhUTwSXyfg6J6T+cS8eWTeM7dAmkh9ScweSoudEiHi21BFahja
         MTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jjzSbquCGIpZBdOT7nOgHDr2hdlUw8WRIsF1vsL4Nk=;
        b=nyWpvMfmopnS51gkg+ONJ0aS+IGoRkCa3LwxnoKBBWD7maIq8muHaNPv8jdNFHP6k7
         iR/T9smVrXnryRlMsTzvo1KDlK2w43LS8kXntAOVA1g4ES49zvMCMdGdoMsrnBFCpcs0
         WvwYzXPZTHLdaRbkAt4VkrrQnq6vG3Ip8zpNjBJVwYpwjU3VH4klXnqJJTi0MLIMZsD2
         CUtD53E5Os6fhGeLwPLE5owziII6iQX8vVW4hHUP99j7KbSOVuFzdkyncRUmtHm+ciFa
         smoMEaPj6bM3k/bzLUhEVW635lq8DH5qx0VaxYQyZJUGTOGPDjHOvFVAEdGmZ1DvCS9t
         KC2A==
X-Gm-Message-State: ACrzQf1lY6KwB6+XlnqiG999uerLnAGIkjEaapgFG9tWNR18AxdM4Fw1
	WBMpEiB6FFnN65XI0Qd6TjkuZw==
X-Google-Smtp-Source: AMsMyM7n13PJvUAYFtfq5Tw2ZISk2AiYMgqsFCw4SHVk4/QZn3nYBJI6UNk4g+wo3EqfDTnMhqMd4w==
X-Received: by 2002:a17:902:ef51:b0:180:7922:ce40 with SMTP id e17-20020a170902ef5100b001807922ce40mr28773522plx.8.1665638149701;
        Wed, 12 Oct 2022 22:15:49 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 24-20020a631558000000b0045feab454f6sm8632449pgv.51.2022.10.12.22.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 22:15:49 -0700 (PDT)
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
Subject: Re: (subset) [PATCH v4 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Message-Id: <166563815015.20405.16941289599227550003.b4-ty@rivosinc.com>
Date: Wed, 12 Oct 2022 22:15:50 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-2a85d
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Guo Ren <guoren@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <anup@brainfault.org>,
  Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>,
  Sagar Kadam <sagar.kadam@sifive.com>, qemu-riscv@nongnu.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
  Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
  Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_221551_664393_1167EABB 
X-CRM114-Status: GOOD (  11.16  )
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

On Tue, 23 Aug 2022 19:33:16 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs. The final patch should be ignored for all
> serious purposes unless you want to wash your eyes out afterwards, but
> JIC the versioned extensions ever come up, it's there.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
      https://git.kernel.org/palmer/c/826249942679
[2/4] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
      https://git.kernel.org/palmer/c/6e965c9bd738
[3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
      https://git.kernel.org/palmer/c/299824e68bd0

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
