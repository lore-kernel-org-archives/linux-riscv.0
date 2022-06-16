Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 23:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+zGRoE6pb4bcMoCHWXZl51oIw4b6QRY7mzW1wUE2zaw=; b=GysJJUJNGG1GEiBEpE4m3dwmdi
	DDDk4hS+idPmEKKMTISPINZ1nYcPm1bFjIVQ658FwcRTiIe1uKucDe01LBM7AWRO3YHuSjm5dKMQb
	kBBlnY8dXlOPkLEX0TgTm/fNqs8kbMWDu4/vS2Kj14I8SO7NSlvaP+9kU+eoISfoY5gTEber6UJrF
	Nm4/x6UXCZJBrKaLV3aGXmPok4rNXQFzAkWdzY3xQ5Kt+GER1TS7+ZuMMKsRI1vPI5oJThL1SJM7B
	LYdrAq/tIg0+HaQ/TT3oYqTFkQBl3cbUy5V5X7a+GJayqQOy27IrEh+wDTLJY92cxk+bQ9JA0QsF9
	C3yflvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1yWX-004j52-7p; Thu, 16 Jun 2022 23:03:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1yWV-004j4h-4I
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 23:03:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id k7so2429548plg.7
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 16:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=wDHYazrSJbs5DQzniIUtQnffNw9K72mrEtU5mGnXyTM=;
        b=CDhgd1tWWuBnt3ODMFgRWChX4ZlhHDlNvk/KAnZvEM2Uh/2LxA7JlQqCAmIaIJ62Uq
         rjXr/O6k48kIcIKrhSGjKh010fJuX9FsZ1rt562IC6L5MxUV3swhFUMnabNLL65hn5aC
         O930jLdTFS18cl69MGnuTRlHwpjEb15YQyeuu3kf3gijZfiKPFgA2/6NAd/Xq/LNyy9h
         zTZMtfii0pTLVp0GC9cS6axH6lcZ27aHXQcLo4kMkovEhlsML1g7Mr140bcS+b5UGtEb
         3nH6yHy10Jz8Uqv9yjX/uc/MFdPj1BroBrZCEIenEA71dKuCij6itLoQ5Ln6P+jrzm9F
         ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=wDHYazrSJbs5DQzniIUtQnffNw9K72mrEtU5mGnXyTM=;
        b=ak69X6rU2y06//0cQsn0Jc7kZnfu9murVoS9o5j/CssQP9NHZTHezKW9u4DWS3Az+q
         9mRz8Gzt1a17vB+spSKz9ZEe1fDD5aCkNrA7IVekvMWsvaqvMG6mxZFxDl1KfH6tBi4R
         n4hTapAVMioKXWjcYNiMMrRFo7M2Ueox0BEAX4VKmIMSnvAS3rGiWmGCIMLhpl94BlHc
         YV9dcezb1vzENTv5yXzN7zuTDvMupr0Sd7RbJxQnKFEKriw4xQoKS/IZgETYDYsGyuiA
         hcQpFSF5pfkMCR0j62SVUupqxjbKqSjW3E2SGyhGfYrFvzMvTtN1S1TjcJLvfCsfmBiB
         N8eQ==
X-Gm-Message-State: AJIora/vO1JSJooexHA6BTKOWA6coMZfUXiIBcKNPv+33QjnPQgU+GYR
	7/1QIfCjCCTwWwsJBFjovjf0dg==
X-Google-Smtp-Source: AGRyM1v6twEO75FBFVmu5dVRkWLbjc9Dpk9I3qAW4EUEVPN2f0MjYr+iMVrV7WSlrqlRKeASGwu5rQ==
X-Received: by 2002:a17:902:e30c:b0:16a:2ee:c232 with SMTP id q12-20020a170902e30c00b0016a02eec232mr1288991plc.123.1655420613404;
        Thu, 16 Jun 2022 16:03:33 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id x16-20020a17090a165000b001e667f932cdsm4291967pje.53.2022.06.16.16.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 16:03:32 -0700 (PDT)
Date: Thu, 16 Jun 2022 16:03:32 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jun 2022 16:03:29 PDT (-0700)
Subject: Re: [PATCH v2 0/5] riscv: some svpbmt fixes
In-Reply-To: <20220526205646.258337-1-heiko@sntech.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
  cmuellner@linux.com, philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>, heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-55ae586c-07b7-4e6e-b695-6df8608b87d5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_160335_206867_1C56CE0E 
X-CRM114-Status: GOOD (  15.31  )
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

On Thu, 26 May 2022 13:56:41 PDT (-0700), heiko@sntech.de wrote:
> Some additionals comments and notes from autobuilders received
> after the series got applied, warranted some changes.
>
> So this is a small collection of cleanups for the svpbmt v10 series.
>
> changes in v2:
> - add Guo's Review
> - add patch dropping the use of function pointers in code
>   that can run before relocation
>
> Heiko Stuebner (5):
>   riscv: drop cpufeature_apply_feature tracking variable
>   riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
>   riscv: make patch-function pointer more generic in
>     cpu_manufacturer_info struct
>   riscv: fix dependency for t-head errata
>   riscv: remove usage of function-pointers from cpufeatures and t-head
>     errata
>
>  arch/riscv/Kconfig               |  9 ++++++--
>  arch/riscv/Kconfig.erratas       |  1 +
>  arch/riscv/errata/thead/errata.c | 38 ++++++++++----------------------
>  arch/riscv/kernel/alternative.c  | 18 +++++++--------
>  arch/riscv/kernel/cpufeature.c   | 37 +++++++++----------------------
>  5 files changed, 40 insertions(+), 63 deletions(-)

IMO only three of these are actually fixes, the rest are cleanups.  I've 
got ahead and put everything on a branch, with

    riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
    riscv: drop cpufeature_apply_feature tracking variable
    riscv: fix dependency for t-head errata

first.  Those are on fixes, the whole thing is in for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
