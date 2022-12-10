Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2954C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 04:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcrSFbQcz2oPdjmCbqyZNftVO3vtPpF7EsiS6UOK15M=; b=C0Ci/JzzWWySs5
	nEfByXJSi8knfsuQdI2lDYVDJKeStMZadNb2aUB2X/B15AWcJRSc5t0UKzRZ+mHvTBWMJI+Q8CwLJ
	kUJAcBp2UuS5toxhZQq+eVBmmQaNbMT/84gpXRGl9etHxSuoLRVsDoVKTxkRxPi0OMcC3kLG/A8O4
	OzAuCsLcJ3LPsu/B712GODfdp8h93NUSiCU5u7VLep3cCq9c67d6TEx5slFMB/TDiX4dZIZiXISFx
	jEopaGUPqSR/Jq5Cg1xKTnLY26hdCWdpUPW28MThr17R0i3qfuekyaryqcoW66kfXaq4ERSRxKswm
	4VzpiIB44hrBKOenz5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3rGB-00E0AE-CF; Sat, 10 Dec 2022 04:14:47 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3rG8-00E08z-S1
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 04:14:46 +0000
Received: by mail-pg1-x531.google.com with SMTP id 142so4828851pga.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 20:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8XAJUDyw+MSaJY/iIXaNM9Iu3RHyiOCMDkeTgcBOLc=;
        b=yt35+TBPREfWGWV4RBL5O6LaEdMQMWqnrSme/7YvvALXFe/N2oKo/uphNcqgGPJI7R
         +VP3BmdtxTjGxmiBVUM/0gcDqcdIMnn7u3+kwh0tdq3fpNoDrB4XPH7zLHBOl7sR0cvg
         I1i1kW++Mc+g8Vdu+w2RvPvyzezleO55rSvU5kG6FXaBTJ1kExbZIlHCg77Cqgj+kEsL
         kqAqrDTIejU+o1sMWPAcouDNjcHpcXNfiQZxh1XoOccFnwGZVu2d8eVowUFUkhGj/K7z
         dfMcMfgkipd2+ZgizLKS12ZsfP6n0knPKGXM7k4dYpGA6aBJetKmrcNRM2NuYs1ziQo9
         eSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8XAJUDyw+MSaJY/iIXaNM9Iu3RHyiOCMDkeTgcBOLc=;
        b=hEL9VrHGlI2VUjHIiExSpFuGydmIHlKhSlnxCPiKvQYNN1rqtHVmydbMRZU2ENTiZw
         yhmJ8TscA2w3neF/CjdbTJZIhGXbsS3B90QloiQUg056gEgq9hGX1eQ9CMEbJxuBwyQT
         O07lewfZ+aQK8a0pcjb4Hhv41cGuqp9C96ZeBeLlzieNgAulJsO7ow3co4n1mz485Svz
         fxnIi7NxvY93NMbwUAPni4pbUDIDNGkiC5R6VKdKUx4o/gAdlVEMZAVn+W8e12wQxQ5d
         VFyflDdHn78iBBG9RqIKzy7fjIvNyQUlXuLjH9yZQjUNX7HD6LrUXnTmy7420Zv51PJ6
         w3Rg==
X-Gm-Message-State: ANoB5pmHivPXWeAq+JbhQNjQWHZOZjHMj7rbi+rNp6XZtoe+bF+j5MEm
	51SK2FMjzaUxugW7QTA74vea7Q==
X-Google-Smtp-Source: AA0mqf65qidiRayE5OZ42qUmmoBXCI5BzqdinDJnQmu/kQTCGXQrD/ueH6YekCka6+CL5lOOQVb+4w==
X-Received: by 2002:a62:a509:0:b0:56b:f127:f21f with SMTP id v9-20020a62a509000000b0056bf127f21fmr7896836pfm.13.1670645681488;
        Fri, 09 Dec 2022 20:14:41 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id r7-20020aa79ec7000000b005765df21e68sm1963091pfq.94.2022.12.09.20.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 20:14:41 -0800 (PST)
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
Subject: Re: [PATCH v2 0/4] riscv: alternative-macros.h cleanups
Message-Id: <167063852575.3882.10324864712024871658.b4-ty@rivosinc.com>
Date: Fri, 09 Dec 2022 18:15:25 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, prabhakar.csengg@gmail.com,
  Palmer Dabbelt <palmer@dabbelt.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_201445_150459_7714AB13 
X-CRM114-Status: UNSURE (   9.73  )
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

On Tue, 29 Nov 2022 16:00:49 +0100, Andrew Jones wrote:
> This series is a collection of cleanups for alternative-macros.h with
> the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
> ... will be possible without lots of bloat. For example, adding
> ALTERNATIVE_3 should look something like the diff below and
> ALTERNATIVE_4 the same. This has really only been compile tested, as
> not all alternatives are used when quickly booting over QEMU, which
> I also did.
> 
> [...]

Applied, thanks!

[0/4] riscv: alternative-macros.h cleanups
      https://git.kernel.org/palmer/c/a0b4c0f7a0a2
[1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
      https://git.kernel.org/palmer/c/2ba8c7dc71c0
[2/4] riscv: alternatives: Don't name unused macro parameters
      https://git.kernel.org/palmer/c/7d52eace1bf5
[3/4] riscv: alternatives: Drop the underscores from the assembly macro names
      https://git.kernel.org/palmer/c/bb2efcde5946
[4/4] riscv: Don't duplicate _ALTERNATIVE_CFG* macros
      https://git.kernel.org/palmer/c/26fb4b90b745

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
