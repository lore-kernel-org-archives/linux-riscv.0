Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D3FC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2i6qZ//Gh0B/rjRUmHBUQGNr+KW5I/a12zdGelvDGo=; b=B/f7NLZi2fi/ZQ
	LXmR20QdmysJPuffzWqdYTswDv0nJXgf95ifd+ciZxZgTdF02F2L5BCxBVQOWUu9SoNnyAwCzv+Rq
	utdHEca+imUabcDumStuSfDCdy4eKXbSk6wJapAbbJPPC4rjA/m9SKRPTRm61L9hdiqK0avktjHAl
	VbUryyMlOHIaqeKWQtHTM9Be+PwQXGOqGAp4b4VX0v/6ztMNskuaWWs3lF105z/PudPVoldGzYSpd
	+ztqSJhH3chNFY/gBDamG1Vw+7ZK1UXWi5GBvtOjQ4XSfSQeUbF4F90iPlGSVnK4zivdyk303Uv9a
	JNJZg+IY64h1CFfNBwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phFUb-00Fj8F-2d;
	Tue, 28 Mar 2023 20:00:29 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phEOu-00FWEu-2p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 18:50:34 +0000
Received: by mail-pj1-f46.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so16090837pjb.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680029430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aclulig/0cfgGpGgV4u2S3tdNeq79Q6EXLxPCDRVnhs=;
        b=HocprYJL3KkdQ38U4oCRR6ZmkWsefj9ZzPHM3NVz7mFT7/1swDRkZmrzI9KLhPaPEu
         WTjvhcEk1bvJsjUgLc+dUpJBaKs8bR8LQTDso6D0HKIlaMFos8Fq72QXfskBawrYNgYJ
         Sf57zvusns/FArDHCdcTszk/2hwAxcUm9cQQqtWSgk+IMK0RPQpcBcO7l5FGzHnHU28K
         V3ni0maTj5rAkQsz62/vhlaIv8L8oX9X0X84kTQUCJJRJ52vjjBUE8T/s5if5lwTDFkj
         5X0CU9aJkWjRHb+x2PCx7DUiZxEbcjOa++lzcClqVCgzDQvJid928qK5ZmFHwQOFBA1z
         itlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680029430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aclulig/0cfgGpGgV4u2S3tdNeq79Q6EXLxPCDRVnhs=;
        b=une34/PnHbGJT7ozKqbPb3mwtzmdQDwqLh6qtubocmAH1wHJVnyuare+k5DeLbQYm/
         sW6Xw0HziqpJFpKD5TvY3GXzWusp/1BuIKNbb89tsVombGkawEQg3qN4o/GAFidj+MsT
         sY2HyX9qL8qRsGeHAfw/HUSu28Vo3YPFy8DjA7x2CPQyvhQpTjzuIdyVz+GF3KwrAfhd
         zKVQ0/SdIqjD2si2ByhUCTvHzzxtPmK2uqWZ8QeefiFzXteRU191PFqPghcxB4tGqf1v
         hDg/DNeorI8dqLhS/T219VdkUVJi5YAvgOMBryuiH9WcDQxGEXYKU7EF4n4ASv9vCyMg
         Ms3Q==
X-Gm-Message-State: AO0yUKUmGzhNUJdLPzp2UfQlaPQVSHRhVbIcESB2myXXFgWM6fwoeDPP
	6ZtnDvjvpucQgzblIEYoKa+6FQ==
X-Google-Smtp-Source: AK7set8uvctoh/nJkDcpyIUFGHdxrv7NFMLkftZwEZXTua9H6PiYWtD5qB1zOx63VGJ9TOv670v8fg==
X-Received: by 2002:a05:6a20:78a2:b0:d9:2cef:949a with SMTP id d34-20020a056a2078a200b000d92cef949amr12028036pzg.28.1680029430067;
        Tue, 28 Mar 2023 11:50:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d2-20020a639742000000b00502e7115cbdsm17453090pgo.51.2023.03.28.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 11:50:29 -0700 (PDT)
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Message-Id: <168002941844.20337.2129252480039803517.b4-ty@rivosinc.com>
Date: Tue, 28 Mar 2023 11:50:18 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
  Jesse Taube <Mr.Bossman075@gmail.com>, Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
  Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
  Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Jesse Taube <mr.bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_115033_130923_914C88A4 
X-CRM114-Status: GOOD (  10.04  )
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


On Tue, 28 Feb 2023 19:26:54 -0500, Jesse Taube wrote:
> This patch-set aims to add NOMMU support to RV32.
> Many people want to build simple emulators or HDL
> models of RISC-V this patch makes it possible to
> run linux on them.
> 
> Yimin Gu is the original author of this set.
> Submitted here:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
> 
> [...]

Applied, thanks!

[2/3] riscv: Kconfig: Allow RV32 to build with no MMU
      https://git.kernel.org/palmer/c/b5e2c507b06c
[3/3] riscv: configs: Add nommu PHONY defconfig for RV32
      https://git.kernel.org/palmer/c/77c0c966719f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
