Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C0AC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 23:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2Bh4Qlp2PU0EMlnScI9I0+oCzPornNtEbrqIE6rgZE=; b=3pbvqoG572chhx
	f/xQKn5adCjJWxYwKF0pzg8XkhxfAX8h1S9TaMOGoxB+vVSIMLz6levHRM6q0bOitd1g0PeQnGhPB
	v/k0DacOVQtLSaEBZsIQA4rpTTT1+jeDTyQh6ExLeYxamRvASER/wVnGWqVn7LgqViVfCQcufmfbp
	gJ5WwDCOUOWQBkw6v3Axkwo56dfQWEIKitFaaalgFzS0s2l7mm4wmT3/YTstDfjcaHa5ipfBb9UtE
	F3veeC9jrTxXLPqG5Iel3NxU7r384SYJ643mIm0mRkbBvY+Lljv7BLpHnufUC9fAlXz76ZqFfe8X+
	6QMAfwCf+kBJ8w78D6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznhZ-004nzI-9V; Mon, 28 Nov 2022 23:38:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznhV-004nx8-Tp
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 23:38:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d3so6758788plr.10
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 15:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRqQDlC4NF1cl9mhZT5OOJjaP5wNAID9J2sA8bdU0zA=;
        b=OdXJe+tEmg/2snhvaGybt5MblnkruFi19xMidiljulqy61tIsAhzrXLrEzrTN4REvI
         QWaf7uMequTwF37LRraG6KJ5LjZYplbT97M9bSSoADekmZ2ve5ENgunQqSaVhrD/cnRA
         VV5Vkbv66v5Dt1Ki3HPfOJejcFSvp9Y76Rx2960BTYJ72XkvSMLy1WFBoBbN1fFAQuGN
         o/fumD4dAqSbJiSxZCMln7NcONeXyxmrU3OBq/9O2rRWqm+w0AQD3bl2NlG3sdBK4GV5
         lhHI5zLJ7gOcNpe9k7Hduwp9HW9PEU92Hu3QNxEnWaLoyNDJsoeOAPeSx02gPALkXyv1
         8QaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRqQDlC4NF1cl9mhZT5OOJjaP5wNAID9J2sA8bdU0zA=;
        b=A6QfvySjJBfE0LzYEjwV5iJincN73mMnoNmsV4jXZVc1CbFwXnR/VU0iwZNTVmN4He
         FGOg52UcYSA0H8dj6Pj5HwJedP+xKRUq8mYhCwK3rsUDRR+8nHcKh1C/gFgCf0mzCLr+
         mx/gpRcmfBy5sQ7kwFTktqgoNd/M1Cqv2b1ZFEHnVZrG9rRn831my0Y0yOcCNsDN8ma/
         EAkr/7Yu4kHJobEncXgJHXCY48jWzpjWxT6z+qIQb5eRKhNE/gaDVp0i8h0J/+YQUGl9
         9BujrDZFf9dG3PJKJw/hCk0Y22tqzcxgUH86esR0YD7sPDI9N77dqdqGM3mNpmjguQ+3
         Byqw==
X-Gm-Message-State: ANoB5plGO9rqEJsP93MLr0EM9Sq33Ixi5ItTHvO/M6aEn6/W+vpeRRDO
	K+YuL9oTLmnNltOaw53mt7G+YA==
X-Google-Smtp-Source: AA0mqf4ZZetnOZgVq0CIkDDuG09QioYMDERHdx2KKF57JhNygelLjbNol6eNGjKVLXR0nLettstKkw==
X-Received: by 2002:a17:902:bf44:b0:188:64b8:2402 with SMTP id u4-20020a170902bf4400b0018864b82402mr33943418pls.81.1669678692173;
        Mon, 28 Nov 2022 15:38:12 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a24-20020a63d218000000b00477f5ae26bbsm4516399pgg.50.2022.11.28.15.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:38:11 -0800 (PST)
In-Reply-To: <20221126061557.3541-1-samuel@sholland.org>
References: <20221126061557.3541-1-samuel@sholland.org>
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
Message-Id: <166967858805.10679.4577917699615835460.b4-ty@rivosinc.com>
Date: Mon, 28 Nov 2022 15:36:28 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Albert Ou <aou@eecs.berkeley.edu>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_153814_204597_91C6A9F4 
X-CRM114-Status: UNSURE (   5.01  )
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

On Sat, 26 Nov 2022 00:15:56 -0600, Samuel Holland wrote:
> The conditions reference the symbol SBI_V01, which does not exist. The
> correct symbol is RISCV_SBI_V01.
> 
> 

Applied, thanks!

[1/1] riscv: Fix NR_CPUS range conditions
      https://git.kernel.org/palmer/c/1d6b5ed41f8c

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
