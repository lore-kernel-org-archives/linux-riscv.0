Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A934EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiAtj5/SuT9XSlunklNGkxM8itKVYbh9/2KcyA9QPfY=; b=TeP1eAoZ8UD0VN
	6mGoDd1jxifiIWsZicsn7MgDArgYF1YKVTQ+ZZqmnz0Vfg3hvMQdVcwhmdNqISEb22FEVNef1As0q
	+gOcOkGnjlLWLeeF+K+F00NQjVV51cUBmKBZYp5O8CEgzEiVW/vwVGqv0gm5NeemEiH0KMUmDCtR4
	RH/75mNHWx/NEceoF9NXremlzK2y65t7Be0EWmn3bw+IYjzozS9B8XB0uguTdNUjWaoOXrXEL5UNq
	MPJ7FwCJIw4CDuv154Ze4ITebzVJhGHKl+mqXpqPl8XUpLbZjq3MavG3ZQMbtAuSsdZdXe0BTDbaa
	6rDu5CD+JczEeeOhhd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rhw-00FkJI-2B;
	Thu, 15 Jun 2023 18:28:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rht-00FkIK-0o
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 18:28:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b3db8f3d94so28155575ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686853708; x=1689445708;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVChjkIcSM6+MNaIJlrMcShBmvjcuV4uPlBpX4ONGWQ=;
        b=lzrKOx2r8o63tyQknjMShqZ4Ks/nGd467s+Q0mwp9tGYafN2VMWGj2AZwRDIE5/QmW
         IxetuEwfkkPeA7eAQ9Qw/bPCBX2ElYrh5rDTXo2iqQxyfOzJ5adnWwc6kVR5GD30IqLF
         KugNlFI6+qP85LG4QdoZp0nCBb4pazWHP8DDNy6g0giRkvsLuWYpyKXgpB7rnh7ixv+O
         wY6MmeG4owCwb266i7BFJLNdp3uvQoQRn4kWJKio9CLxIB0TF+x4OPAUBJZs6uK5HMsX
         /iw5a92V3hLmvvxdMIT5/rrt/aBsVoP1u6dU0T9X1RyAU0zZreyzaOrang21qu/Z0Plz
         m4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853708; x=1689445708;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVChjkIcSM6+MNaIJlrMcShBmvjcuV4uPlBpX4ONGWQ=;
        b=Fe4WZXo72iUA42gLBsjfG50v0NxQpW6PLv2xicSNLTsoXs7bUNolFyBF89FH2dBUh2
         YS978mjHd1Z/bnaO9aNDU6EwEiesvMbq6FejmyveTumlUfe9k51eAXwZ0m+PSDXqdFy/
         SXwx1DIx84gbko25wEkccby3vq6gG4lBZ6zURJciw2+9fKqIiBO/XBb+2XkO9cxQT6qp
         V1nrafnYJGURMZ1CylmX/RtbXNClGKjvjp6DfQsLmgoP1BhoWoJBgp3FT3k9vyQkXlCg
         KrSxf3to88fSDaMJJS/RZrCbWDAGO+DroGBO0zA1AxGzsuQLmo/UryrkEL08jvKGydDI
         1YXQ==
X-Gm-Message-State: AC+VfDxVKTI6ly3RqbMRZv3FdpkHEIuNw7RF9QHO/lfxhdVCnhiP5NnL
	Qe/j1nzInHuhCwSXYc6lnVsAJg==
X-Google-Smtp-Source: ACHHUZ5yt0VPK6NWeZnlY/aLP9daDWJTbT4CRFJ5q0WhZJ1UafvOtwLd1fkMFTX274W9OpO2trsQxA==
X-Received: by 2002:a17:903:2311:b0:1ae:1364:6079 with SMTP id d17-20020a170903231100b001ae13646079mr17199372plh.44.1686853707702;
        Thu, 15 Jun 2023 11:28:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001b39ffff838sm10598209plk.25.2023.06.15.11.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:28:26 -0700 (PDT)
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
Message-Id: <168684928914.25663.18359435106543749767.b4-ty@rivosinc.com>
Date: Thu, 15 Jun 2023 10:14:49 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
  linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_112829_509190_C2A6D8D4 
X-CRM114-Status: UNSURE (   9.70  )
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


On Tue, 06 Jun 2023 07:59:19 +0100, Conor Dooley wrote:
> Palmer suggested at some point, not sure if it was in one of the
> weekly linux-riscv syncs, or a conversation at FOSDEM, that we
> should document the role of the automation running on our patchwork
> instance plays in patch acceptance.
> 
> Add a short note to the patch-acceptance document to that end.
> 
> [...]

Applied, thanks!

[1/1] Documentation: RISC-V: patch-acceptance: mention patchwork's role
      https://git.kernel.org/palmer/c/b104dbedbe61

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
