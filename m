Return-Path: <SRS0=VJSH=77=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61105C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 00:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328BD21556
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 00:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jBJQZsGY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WHR7pvxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328BD21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m7UPz9IB0wuR+ULFqjoeOn81m+kFdV9mf/EYc+fuqGI=; b=jBJQZsGYjNbSjDr4XRVqsy2UR
	SJxf/OdojND36OR0B18ptoayI543+Y/v8n639hzJ/HWHUAWIgEeCEhaa59q1Zi6qf8R+8TixTYcWH
	I94brGyk++bpVciYCie+KH2GWOgjke7nFMGBA7EHI45OjGn6lEuieDEsiJrLfC9GgEpLKPeJMXFhx
	xwkA+dd6m9Dvk/K6lBfEmJDEvlDbjxY3U0MiZQ/gKGvgEe+RKHBQ3pG1Sa/TaufVEXpyaZX2TFMmR
	YumYNhpyUco1F4A2lDlAS5ZrZgD8wX90+AGU6mYYIT7taNE2anwcyzgmhMJ7etiHMgknCYBHgTVwQ
	pHsJR1WRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jli06-0000Rp-UI; Thu, 18 Jun 2020 00:01:50 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jli03-0000QR-9G
 for linux-riscv@lists.infradead.org; Thu, 18 Jun 2020 00:01:48 +0000
Received: by mail-yb1-xb43.google.com with SMTP id s1so2170995ybo.7
 for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2020 17:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7UPz9IB0wuR+ULFqjoeOn81m+kFdV9mf/EYc+fuqGI=;
 b=WHR7pvxYT/fclLn788v5XuVsyL1vB6rW1eD7ALXv19rL+XV6ejoQgIYAg1oSVDAmfB
 Jjri8MNNMAw3CHDnX8Dzet/q7pZhC2vVE+AszMyOe1nEqNfjfqR08U9DGr051iERPBur
 sDes9x877Ax5T5f5+CtTenbkmhI9UoN2LLcVK5OJzqgs2KtIOX9J6Hpmcxyp0/esnfN9
 mDYDVIidYIt/rE5F7vNl58cHbPqtTaShAYq+tCwdVfjIN9pFCsDkKnhE0OneFCkGbR+D
 gkMlf0D/pf8EfDvl45r4xM9u/k0w4wa/guPU0aXvDh+tSfeTQiJ5AXR8wPxKXfXHn4nW
 /ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7UPz9IB0wuR+ULFqjoeOn81m+kFdV9mf/EYc+fuqGI=;
 b=nhi0SCu0vlENUJOeMZZuOQjPHaHSi9ZKiwFQIHfoStff9meNoUb+uqguRb93e+Dyau
 D+aBrq/vzqKXBgNUKlHBkAuIk6fq1pSZ7OXBhsTV0o0ck/hq4fIQdz2rpp7u7yNWAuaV
 5D55L7OMfL9Kt/FUqjb1+5pcxZwej2q9vTMlvdOVntj6fY81NtHRRsCJJyupto8Jl7WR
 DHbCnbg9iLL0FrM1BWyq/29CG7b0NriMnk7whkyuNH/piQDtWDmlGwAU7aUVXW6GmYft
 f9P5PioVMXDx8Sf1F8Mh2kkY9Fk6ySefKQxJz+urmr0dnAUTL9FBxsRMPM9O3e/cU6UG
 LLMw==
X-Gm-Message-State: AOAM5327pl7r44CTezwYJSNqDgmVGPER3uaTfbTcxePI70jaK1W1YyzG
 0y7QUoTmeAeOTBVH2U8ot+/mczI2A7+ClvWpnGhh8Q==
X-Google-Smtp-Source: ABdhPJxx2Psv8jjW1S0mhJDxqQoTkh7WJXb/f7KtAQbV8jWCveufSRp7uVjuXyd6/Tn3clPASVryOBL/Qi6oVXFmiIc=
X-Received: by 2002:a5b:cc9:: with SMTP id e9mr2244637ybr.287.1592438501718;
 Wed, 17 Jun 2020 17:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200617203732.2076611-1-atish.patra@wdc.com>
In-Reply-To: <20200617203732.2076611-1-atish.patra@wdc.com>
From: Michel Lespinasse <walken@google.com>
Date: Wed, 17 Jun 2020 17:01:28 -0700
Message-ID: <CANN689EXQsH3C92fe=QHVEZasWmBiMXPoOB=bRLhK2CP-hdKqQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Acquire mmap lock before invoking walk_page_range
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_170147_345257_6132361B 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 17, 2020 at 1:38 PM Atish Patra <atish.patra@wdc.com> wrote:
> As per walk_page_range documentation, mmap lock should be acquired by the
> caller before invoking walk_page_range. mmap_assert_locked gets triggered
> without that. The details can be found here.
>
> http://lists.infradead.org/pipermail/linux-riscv/2020-June/010335.html
>
> Fixes: 395a21ff859c(riscv: add ARCH_HAS_SET_DIRECT_MAP support)
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Thanks for the fix.

Reviewed-by: Michel Lespinasse <walken@google.com>

