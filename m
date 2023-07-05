Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7E7EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWGxQVn2fsa1vvzt5/VD7NrDbI7ih1P6x5wkzWmGRck=; b=3v246F5UCUfh8X
	2hUSEYhqVb6UmXFLsPl2QQWsoSNag1hTk1eLUafmwlQrgpq74HIiuIE6stsW8RSW+gpUVp4fHkwEz
	9xfc/BFuTCgRZ8pjKLnev4lLIEQIg8r+/vFLoJrwn1op5pVNYQaAWNCloCMPMPN5EYxQxIThBSzsa
	8aFGubwkxzMkqvHfrvzjb8m4NL18CZl63TwBSxEsYsGs5PVOsApn9e7rNyoGGWb+bWGzqi3bDxEc5
	b2ukt2BzE0xnEAHG9Va1OwKcKdXblUPpmEHr5x80VAA4NtBzAnuzBDZ55islFOGX1YsAYkQkYhh81
	iosGSism2ZE7ISdw8dDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC74-00HN6v-1F;
	Wed, 05 Jul 2023 23:40:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC6z-00HN4P-2a
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:43 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-54290603887so88539a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600441; x=1691192441;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxFf6cr7VzBSJcFx5bp9Lo374Pe7Bfzt2idCozVeP/8=;
        b=Rq1J+9vXk5AkawXXRnTfn8xBzXCUzzny9qVtpCHhmCNz9f3HEa2Cl5Dwl7rTgW5AsH
         iGcsv82jOqYD5k9gqvdE6Nawq+FwIRfklQUS8CEaUfa0R+iyE+yBLxhyGd6X69IcFXI5
         59vN182uP4JBRdKhBgqdVlcc5W9dvu2MrDz3CyNQecXtOg6NT7Gr5PFHKzOELymrotTm
         JdgTU0LwypqtvctqFtGHp04jgR7UrR1+lyUOCJ5C51XkQEiLNXnTNvgPjN8FWn0Qa3QW
         g6U/RH7CVyuHikLZo+eZfFpxQVI9zvXzk8FXfHTEkDeCI6DVakplFYgPXq8ysxq38TVt
         TS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600441; x=1691192441;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxFf6cr7VzBSJcFx5bp9Lo374Pe7Bfzt2idCozVeP/8=;
        b=IVbtJNzMf/GJ4/iluLPhHFqohCco9LPvyGq8eQM0I0lu1QxP1ZJIHgfSjwNTzDpmP3
         SF7gLC8OD2NR53lf33jU5xjoXlz30HknOrw8dN5WXmazxf9Z38ae5b258rygQ5s+hgqg
         OBk1mOO4b02lgcgiMwXgTTFxXOXjm4dxwEx6DxjHwjzyrm5FTT9yfjEI5Bjjml7VPnp9
         36sETnKvUSzhyJ90P3kI4xADVGwCmNkb4d67PWoDA82N36BNHnd+gaXCVdOmih/sE9bt
         ceMd2Wwt52Y6NRG2Ezhetk/d1hd412mhytVHRLteLYww3ZXusw11XEPXyCMOvTL8NsMm
         O/IA==
X-Gm-Message-State: ABy/qLb9BxpJF7dAo6aF+UnGaiXI5EbotFI1xHI4GdXLnDxiaViI2Czv
	ABdgW3VtS2jaYOMaZIcZO+tmWQ==
X-Google-Smtp-Source: APBJJlEwMJGqEypLFxwemFqKOoQtBqD5d4+5TsGzexH8+PpuwuZ7uM2nx+ZHkuijSryoOr9kr+PHGw==
X-Received: by 2002:a05:6a20:138c:b0:126:a5e3:3927 with SMTP id hn12-20020a056a20138c00b00126a5e33927mr281393pzc.8.1688600440680;
        Wed, 05 Jul 2023 16:40:40 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902744500b001b83dc7feabsm16260plt.304.2023.07.05.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:40 -0700 (PDT)
In-Reply-To: <20230629-paternity-grafted-b901b76d04a0@wendy>
References: <20230629-paternity-grafted-b901b76d04a0@wendy>
Subject: Re: [PATCH v1] RISC-V: drop error print from
 riscv_hartid_to_cpuid()
Message-Id: <168860030761.22647.12481801234463847382.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164041_873976_66FDFB0D 
X-CRM114-Status: UNSURE (   8.67  )
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


On Thu, 29 Jun 2023 12:33:34 +0100, Conor Dooley wrote:
> As of commit 2ac874343749 ("RISC-V: split early & late of_node to
> hartid mapping") my CI complains about newly added pr_err() messages
> during boot, for example:
> [    0.000000] Couldn't find cpu id for hartid [0]
> [    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
> 
> Before the split, riscv_of_processor_hartid() contained a check for
> whether the cpu was "available", before calling riscv_hartid_to_cpuid(),
> but after the split riscv_of_processor_hartid() can be called for cpus
> that are disabled.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: drop error print from riscv_hartid_to_cpuid()
      https://git.kernel.org/palmer/c/52909f176802

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
