Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABF2C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkhMWoGihk2a/yd2nrjhgxvbe0KqzSsypgVEaaOjSfk=; b=Pw9Ydm6ZBrYHcv
	B3SvYKhm/d90Htr/qSYpz0TStMwDuBGrNlXjp0Ew5WYMP+yL8JVVzVR2uFZFdPkVnJheiHXx6AYNr
	96GIxS4JxLWzZKmoUkmAWk/0el5DHDj/2lZoHnY+IoYkh3/ZA/LGEV81vUFreCCVsc+Uobo4tZLAf
	vOLd/B8dIgdVJ2TGbA1wKUegJMiVXvVUiroCaBWpKID/3C3YzBvdTIjIeKltV3L2mBQm/Z9/YYl/x
	b8mKYrcRBOce/2zXdI0Oyupq9zgj0ROqIGzy6qXnU3wFxmTJy5cWIZYoMjwiU14OD2v8Nw/WGy9lV
	3rgkz0yPf9AIZklqgIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Z0-00CUTK-2Q; Thu, 13 Oct 2022 17:00:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Yx-00CUSo-0c
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 17:00:04 +0000
Received: by mail-pf1-x430.google.com with SMTP id m6so2528913pfb.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27cGiu0Pf2lf77wdB4SczFGe0dYVOUJndJgYtLGfh2Q=;
        b=ha3YlUkjApYlUAQOIb3BwJut7rOreagRPltDoN3/evAiA60czpVBNaIvKYT6asLhS+
         YUUc8bmXKoMbB57vodTNwdRCDmpGL8ozL8bwakefVz4gL43MTjZ6XphKchXXSvUWGuml
         NFhhDxXGU6fIMVfY+aQHssVqpXT9x7TuO/wZQHhCwTldjClOH7q8hjux4g0H5c+XKwSr
         xQgIKfCVgGy9o17L1EHloeWdEHHLR5+nFBfrUCIWXtthTzFPcPg3Q4T9XU0pbvpJtejH
         v7iEqPiOK0EPCz9ldGu4HfqnNvysop+rvwV8AG0XwMzLV8Te4Fjv2VF8xW4/7UT3L3Zy
         RExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27cGiu0Pf2lf77wdB4SczFGe0dYVOUJndJgYtLGfh2Q=;
        b=e+ClD/CXCFKWZP2aRQQ5PxxQa7qkwcBqf2T9vZXm10t1QVCzLttXMpapFgvRzdsv5C
         9bhItfBJSz9PKoj8YmXzLFXjaBZTRHesD+bqkORQc0iaJqu7ODOtWo2CGRUv7KBSzrXq
         TVs2kFIVXoIj4PJFano/rhnl1YsG1MqNmib4TN3XFNxrvDdijGbeXQ546nYe4+oPmJCr
         wHaieg6sOlMz9Z0VQf3oqcKpo+oMvT8RbMF8IBQnNBTgZhEy59nxGuuyK2FgRcglAWUT
         bOSw3OiJZk4xfdbIm1dH4pSCdWLAD0KGmQlHHkvgwYWppQT3euesaiePN3BCSw+UoA/X
         bNCA==
X-Gm-Message-State: ACrzQf1D5EJOZO8mu1FW5+zAaeTu1vKZHP29TiJqjXeBZrumjxWGjEFs
	rCCPsdQ47yjyYkjddTgNMubldQ==
X-Google-Smtp-Source: AMsMyM5fRzBRYjBWiEeY1dgIQaQVm1LW3/HAX/zrzYXR70biomR0fVPdRkcO2/AGu2JcuyV4V1L2aQ==
X-Received: by 2002:a65:4c46:0:b0:460:f598:d038 with SMTP id l6-20020a654c46000000b00460f598d038mr730221pgr.99.1665680401862;
        Thu, 13 Oct 2022 10:00:01 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i3-20020a170902cf0300b001785fa792f4sm78055plg.243.2022.10.13.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 10:00:00 -0700 (PDT)
In-Reply-To: <20220905111027.2463297-1-heiko@sntech.de>
References: <20220905111027.2463297-1-heiko@sntech.de>
Subject: Re: [PATCH v2 0/5] Some style cleanups for recent extension additions
Message-Id: <166568032205.23595.17535934122459066446.b4-ty@rivosinc.com>
Date: Thu, 13 Oct 2022 09:58:42 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-2a85d
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, guoren@kernel.org,
  Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: aou@eecs.berkeley.edu, Heiko Stuebner <heiko@sntech.de>,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_100003_078922_736BB8C1 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, 5 Sep 2022 13:10:22 +0200, Heiko Stuebner wrote:
> As noted by some people, some parts of the recently added extensions
> (svpbmt, zicbom) + t-head errata could use some styling upgrades.
> 
> So this series provides these.
> 
> changes in v2:
> - add patch also converting cpufeature probe to BIT()
> - update commit message in patch1 (Conor)
> 
> [...]

Applied, thanks!

[1/5] riscv: cleanup svpbmt cpufeature probing
      https://git.kernel.org/palmer/c/e47bddcb2ec5
[2/5] riscv: drop some idefs from CMO initialization
      https://git.kernel.org/palmer/c/f055268e3946
[3/5] riscv: use BIT() macros in t-head errata init
      https://git.kernel.org/palmer/c/499590c084f1
[4/5] riscv: use BIT() marco for cpufeature probing
      https://git.kernel.org/palmer/c/e283187c034c
[5/5] riscv: check for kernel config option in t-head memory types errata
      https://git.kernel.org/palmer/c/14057733109d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
