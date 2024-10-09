Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59861CEE339
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SVJomMHDPREWZC0G409y8yw1V+7o5930kuKtL+Mhfh4=; b=1xmeeoBDGEcVGxUZ2W5TiH31dy
	KfIq89XroPZn8aInM0AYslxdYA0V/zAgvTaoA4gap9HTqm0vF4v9goFL/1rKvZFEJjhFFFmvVBG3e
	ipYkPDxVhWlKgmArbscmunZwpdVxST8OQ+GWMVC9J8ufHtz5ZJXY0Vkcn194tK/WnRCgMSP51r8hI
	xBVSJQN223OKaxpsakGsQ+tiGm+XxnGED1m4cvLdOd7f3/UM8Qqvs9PBsByHOQ4OPTCjTlHXww68y
	I3FZH/gjjCDWa8itGhdy0PnbKPPJsfzZIsp1H1cW3e+Qydv6WKenBMi61Fr24SmJCIe73CT3T3Ce5
	FtgX3Zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaoM-0000000AGMF-1GEj;
	Wed, 09 Oct 2024 17:49:22 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syaKg-0000000A9Ia-2uj2
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 17:18:44 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea0728475dso66616a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1728494321; x=1729099121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE15ibMGDi+NxxTDjcKlwgS0dglI70fk+X+ersajG3M=;
        b=kNiedU2uZ6rouuUsjQEHuj4ZudgqsHN3ihTfgsgDRQ92w5S2seZxjr3naFjMeeKKfc
         QHn2ip+k/5VOSwni3t9RfERh5c1qg3wjUrzpn4d0WoRjIK57mr3f6dLMeNKbVpyxRayI
         66lV0p5yJxlxEhJhTSOJOaaouNB46UGohwXureFtF6xv1E2RdP9exVb3XLe1lS5PjJFY
         1hpapW4shd7hBJWGcg0HWTRM2IMhNHuug5IRN/40XXxc75ROldS3aJ69nOHsl5btmAwH
         YBCRXgM+IHStx6ZqlFinpgFndRajDXaW/CTu3Fm7aNJolTQcVDgbXn4H2hwG5N6DVpQE
         63xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494321; x=1729099121;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE15ibMGDi+NxxTDjcKlwgS0dglI70fk+X+ersajG3M=;
        b=JyBKEMx9s83uI8PFuEh0gVdR74qtn+m9wzNf7OddGmLeIDvnr4TZQlEpalmikKMHBC
         5WOO2lZPCKM4RetTGX9VfY2PgyzYmPAoobwvYEDQG5i4pGe99tLW+DCUq2ozmIY9jtDg
         x1wjbRY3ay1BVEDr7sVKnMfTOO+0prO8DQhpYrphnDnXSYCE//w6DdJ+EdotcDvA5qPW
         kn0+AJfSqEyGXMFc2QrSmPe7Nteyf1eUzt2+QIeH3Q0sJ9ToAxca6VZbITGjuF5dRbuX
         NDyFfjGHvFGrrg2jJRdtjH8LwpMhoCHXgSTOomFNaxzTApnJYqZUT91DN3KVxVD2joIb
         xJGg==
X-Gm-Message-State: AOJu0YxvFgzpcvAFDQKOqdbDLfv28gOVhgNIHggWKOhKQoBjKaFs1TRR
	7WTMGUWu7TUZlX/sxUjdjGJ8iuO+FG8O8bKLoCNHT/KbEwBuKYug1s75dzSZatFgpQpYcEWAg8A
	d
X-Google-Smtp-Source: AGHT+IH+dUdqWJdilHkcfNrwnO/4bpYGAbPTeUc897OZzGRUfL0r6Othkiqnq9rjY7iXezEC0dz7jw==
X-Received: by 2002:a17:90a:d913:b0:2e0:89f2:f60c with SMTP id 98e67ed59e1d1-2e2c805fe05mr543826a91.11.1728494320877;
        Wed, 09 Oct 2024 10:18:40 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a8dd0fa9sm1849185a91.50.2024.10.09.10.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:18:40 -0700 (PDT)
Date: Wed, 09 Oct 2024 10:18:40 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Oct 2024 10:18:38 PDT (-0700)
Subject: Re: [PATCH] tools: add forwarding header for arch/riscv/include/asm/fence.h
In-Reply-To: <mvm5xq44bqh.fsf@suse.de>
CC: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, parri.andrea@gmail.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-adb76a44-07c8-442c-8bcf-6f29d061c031@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_101842_752090_565D6BB6 
X-CRM114-Status: GOOD (  15.79  )
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

On Mon, 07 Oct 2024 00:24:06 PDT (-0700), schwab@suse.de wrote:
> This is needed so that <asm/barrier.h> can find <asm/fence.h> on riscv.
>
> Fixes: 6d74d178fe6e ("tools: Add riscv barrier implementation")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  tools/include/asm/fence.h | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 tools/include/asm/fence.h
>
> diff --git a/tools/include/asm/fence.h b/tools/include/asm/fence.h
> new file mode 100644
> index 000000000000..917a173059a4
> --- /dev/null
> +++ b/tools/include/asm/fence.h
> @@ -0,0 +1,3 @@
> +#if defined(__riscv)
> +#include "../../arch/riscv/include/asm/fence.h"
> +#endif

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Happy to pick this up via the RISC-V tree if you want.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
