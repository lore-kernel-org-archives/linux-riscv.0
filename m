Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410AFC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vq6QioF3NSXf9azJ6cE6AImY69/seMIOyDeuDFqmuL4=; b=wjHnm9tRWLzCKU
	6Nfd3aGTjNZps7KfKZXqgLSbKs51UKToumGdtCffrh9Q+2RuYAZubCCEtdD//uEzv61ufnoE2hJzG
	vjyh1efgmJkZR8GDb6JN4mKuTqMKdE28qebTneYpHSVfgse2cYwuyipP2Gr7azxKYmWXsojpxHAMj
	efUmK1T+LdtDkRWR6aQWCaPgHT36khFgMVohYVPro0RA3uNe0iS1svCg1r8PifGwWqZr9Rnohm5Cm
	IM6l1YEWCtdCwJC5B92AlYTOtfUYzsmK79MkCx1Fh1JYzbzA/NNubYH5RTQv5LObebszmOTiF2ttq
	zxVxdgjG56h7hW9cfqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIKah-005PJF-0N; Fri, 11 Feb 2022 01:19:15 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIKae-005PIi-FP
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:19:13 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id c6so20606324ybk.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 17:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
 b=AIRSI3cMzMaKni8HjGUVaMbZAhUVlceEUvM1TVFe3VPqQyWXLz2Ak+cDAO5nh25AUQ
 dQ3wE5W1pllDsx+K8PXA7t3fk+pbwx53ncl4DxX+P/sPCtfqhhCY3p7GAiLGMElEMBcT
 Rs8XBznNz1hO9TGGw0UyBDAxLBlsOUXgNThNiBBNFXT02GOdDU4CcMQpLmmNZtAIXMiP
 J2U67gmXjBPoFTZ3vC2aObwrtGXtzFhHXF5ryg5us7Gj9GfRYv6xoqaEfVp4BRY4OcPD
 OmITTZAdt5Pngu3Te8EFZT3oHj3uqqBgP3EASdlKQFgwu1voCxa7FR42hHWE70gz11wS
 uSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9Yd8/YQb5ZJUEvP4mlzd3FbwU+8QT/5/lgHgUq257s=;
 b=3tsyeAa9iZDJQgK7+OAer2be6hczl6nHnsK1ujhXdTVA2hVxCIhZn1BLrcUBg5Gc+Q
 SisqaOQiTKWSsVLraoGT/4s5dISjO8zu5h8KL8lcdgYWoKptwOSz6mtmvVTF9dKhuARs
 SN4ucJ5aAhOFjfyZjC5J6Lx5bzwGM6P4uXig2u+V4YSG4vo0t1BKZwagMi+b4Nw2LoaM
 PGTmb4Jnk0uhbMtN8r5nrpcU0zc84m0UFY/F28wOI8E7zjwyqrFb9bo2yYY68G0QYlOO
 2rgBgQb29u8xaencjnxJq3xc8MsHIon/hGaTq/AtWXOas16qQrHyExn0hHDvJxe8A4pz
 ahRw==
X-Gm-Message-State: AOAM530Ue0WFXyljvG1xTgqeeAS6l/N9mdionrW7ZR7a0Ctpl1FC5B1X
 TNC3jg6zsRokHGI9ZI6StFWnCyth6fOsWnsmdUz1DGdFu1Ok3Q==
X-Google-Smtp-Source: ABdhPJxGv13LWL9egJMKkc/oNhbYkiByJArEzDE8gyZspHDoaexfLcX9zE0exXWR0/WRRRWmGDJt+Pt+o9nTlBDv9/M=
X-Received: by 2002:a81:4cc3:: with SMTP id
 z186mr10688352ywa.140.1644542351380; 
 Thu, 10 Feb 2022 17:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20220209180804.GA18385@kili>
In-Reply-To: <20220209180804.GA18385@kili>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 02:19:00 +0100
Message-ID: <CACRpkdbgbrHBO7JFAf9yUjdOfnfavDaDSoUDniHTJT=-im0+oQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Sean Anderson <seanga2@gmail.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_171912_539081_318BE5E5 
X-CRM114-Status: UNSURE (   6.72  )
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

On Wed, Feb 9, 2022 at 7:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
