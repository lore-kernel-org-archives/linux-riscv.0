Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457F2C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 20:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CEA2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 20:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpHf/S3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bAT5mi0l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10CEA2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=i21sKUqZ8jVkiTz6jUi5G6cV5M9/jq6I66SaMhWWUjM=; b=QpHf/S3lslnryuqzi914tnaQb
	TM4mqYy2Id2GHiGbQdxFgsoaNKfgbdMSqw4ZS8ZFpLakSfJw+fM6/A21gVy7oM6RKWYHRkc+Lbs8N
	qYS4msKzLfGfqEBW5eq1aEvHRCp7CZ9GxuUvPjp58Ij/BIifhw7XUYpNoSA5jP/UUdntNPYIZY0Gc
	jWDJC8U65ufuxBEGCXNjPcwjZwK3BXFaJ+aJ8XD1YDF3tlXJWDVFE7FNrW7V1OakE3bDmFwMcWTkQ
	mUK194BGecv3jFQw/6D+XReNa57YnKU5ZnE/gZrwD2LYljHGAaqOecIuZlOFS7XzxJ0jRzZE57kdS
	4A4axNQZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVMnz-0003n0-CB; Fri, 07 Dec 2018 20:32:59 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVMnw-0003lr-D8
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 20:32:57 +0000
Received: by mail-pg1-x541.google.com with SMTP id s198so2204183pgs.2
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 12:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3IOnEKSmrS7SeIEZTNze+oEiPhQkMUoqtxG5jbOrw+o=;
 b=bAT5mi0lhZeGn4610XYS43mYau35PD8p9vhKgY2R3NYfJJfSEuyj4LfCwotEo7zMEm
 kQA79rkf9/V9DXDiPBJGw0Cv2PDKynMgmNuZqFoGZO/+JEKxSNMDYOpbIJlYWMjstRbg
 tIyvRl0JIJZH8bEKktWLrXwBszWN9lSplG6W5qxJN6vgS6lNSZfnFlsgJJEgp/0LZl8m
 ST+MdrYWhmF2CBO34QA1vYHIAv9C7ITY1VB3edsXMM2GB9S3OQGmw5mchUTHhvLqiOdU
 INXkuDNkN2MGB7pk/7QuWM0tTZ30Y994GUYJU0tIJOz+zf6dTRxTvtjzOioDvx3SaSY8
 5YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3IOnEKSmrS7SeIEZTNze+oEiPhQkMUoqtxG5jbOrw+o=;
 b=gxBqc5eEqz9HiJGNC+TkOQzgQ0sNCLOD9ml1sMMZ9UJYHO15BfONMTF1fDeqPPhiIX
 roYkobh3x8P9EZ75e58/0exoEFB7c0nQU9yowiYusEhnKoTLP1uabLJjxX+cXADhKNis
 os1YdwEde7BiXUGdBRz5qaTPw7kr+8Kdd37soYwJyBNkUL/5IsdUPvobB498z3FnLEbY
 rrbmBj0OpPCaCidlgMzPVIROS9XMyAzPyL/0WZC6TUVNrShIiSXeFeGiKAxmeMqLGnV5
 G5qL/lGSGmGISkT+qA8dugMv/HOn4x4EFD9oCt0caM8zKap68LX7Wx+XNYKdNxI9l1Sh
 G64Q==
X-Gm-Message-State: AA+aEWagvYlyt18ucaGX9DM1+B2Wq8Lszeo4S4QDNeROxB35HIA42JNQ
 qmMn5XCwGQ0FFDuNGXyvcEXXLunBmh4=
X-Google-Smtp-Source: AFSGD/XqYyFxNezWTXtDxTSkba7Ux+INkp46I+QzTZHMJTnszb/hhHrev4gxe3BG+br/InBJHjAobw==
X-Received: by 2002:a63:441e:: with SMTP id r30mr3257031pga.128.1544214765042; 
 Fri, 07 Dec 2018 12:32:45 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id w88sm9721642pfk.11.2018.12.07.12.32.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 12:32:44 -0800 (PST)
Date: Fri, 07 Dec 2018 12:32:44 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 11:30:17 PST (-0800)
Subject: Re: [PATCH 0/2] riscv: enable syscalls tracepoints
In-Reply-To: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-49f84968-18a7-4acb-b41a-f056d1ee7034@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_123256_446168_022D57A6 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Dec 2018 07:26:33 PST (-0800), david.abdurachmanov@gmail.com wrote:
> Depends on audit patch:
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
>
> audit patch is already merged into linux-next.
>
> This simply fixes compilation error in do_syscall_trace_exit() and
> enables syscalls tracepoints.
>
> David Abdurachmanov (2):
>   riscv: fix trace_sys_exit hook
>   riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig
>
>  arch/riscv/Kconfig         | 1 +
>  arch/riscv/kernel/ptrace.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

I've attempted to add this on top of next-audit, which I've merged into 
for-next.  Let me know if something went wrong.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
