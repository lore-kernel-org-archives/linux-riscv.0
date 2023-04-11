Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF5C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9TSgMf1amyq6awCag2MWcyM65vdWmhaOe/1INeuJkTI=; b=C1K244GoXq5ARVEKU4ng94A6AW
	HgCGkdwmTnNDwa+rAK6WSDqShNHMe0RbbwG4WOHCHkkoxWS9dJeEduoRYf41xre+6MombgxNlkdHE
	xEvzQlP0K0IXIPuDSjX/+AUwP3MIC5VdfOLZVmO1MpfbFQHB9XUa1OwRL+H+3KHlN2Jk6j68VT5nO
	uAVv+57GCSWMH0as21sPwc6xzs5mxzCxL0KqgwNL5p9cNBWwfD0ytKjnH/Q8VyQbeRkhAdx7vTz/V
	w3G5fTa9Y97ZVnLRkPrQRcO9tA/51orDCiu4fcoBaB7FzVoi4f/H7UF4t4uURMTOad0vzHglPLVZ8
	UXGKbfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmD9u-00HYUS-1M;
	Tue, 11 Apr 2023 12:31:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmD9r-00HYS0-0T
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 12:31:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso9484199wmo.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1681216287; x=1683808287;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsdJg6MZvLyW6lyiDQpN3lhmgzc4LeAZsE9rDHV+Jr8=;
        b=gik7YFy29rFOY8/ULA7RG1tlEApOn1I1BhHWSq0CeLDZpAQjbKnGrnZpCaMFbjkGr/
         Mb7BiyfdL3fyxV/v+fxU8dStBUcPzh9mHpb5ZzbACaLg4sEFF5YSOUu/dTp90nx8j+wU
         Fgfla62Kt+GiUM6LgIaXxuzqrIle3fiR2tV9Zx00NRZufT7qZ6tr2gymEJooY2oazGEV
         eVVHRWh2MbrN7UiycEa0yoqumWR9lqg6dUOtWhJztQDIQ8Ozsqrx+/JStTkpxaUQrSkR
         5PVQiS8p287IOdqvUw+ACt6umZheyrTvNMI/mQ58HlEElU53W9qguwwRVRHdWs4Iynko
         qlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681216287; x=1683808287;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsdJg6MZvLyW6lyiDQpN3lhmgzc4LeAZsE9rDHV+Jr8=;
        b=gx8kruja/noDCCyfxhzoA45lyPNkabOGO8wJVQB7FUoTQz1GZ76YTpMemDW/zgFlP2
         lfkMGajbV2PUSTN8VBcqmOM2CVqzgcBGREqMqbcuZa2xRp23EVsVK0tTUvGhOJoIKB+k
         DmMcflAWF0ipOY0LI4ie+QX1ivlG8JeS70tYBfuRuc5H8JZ0SYnN6oMoFe9NhStzCUlZ
         EwDB7mo4fLxPEAZOHhNSHTyfdBvzEcQZvq7dD1FCkLHPnMMftIaKUja/CvYgXDAbLfIx
         iVVZuOU4OD4as04fKRGJbLXe1kIBepvpX8DgU98wz0LjqJxSFvH6kKu3lLc0KMR5H8Et
         4A9Q==
X-Gm-Message-State: AAQBX9ccN3Nst8Ekm7fY/psVjQszh4r0LonIKsFAciAGw+UjLMoCOupF
	R/mVNENMGONdXrEA/jHmjbmxVbQhkRxC7YjPrw459Q==
X-Google-Smtp-Source: AKy350aaxiNbNBEuf22Wx7XVDPR+xAL3ayHy6cBRDSBbd98zpwLA07+fLQAy8RT/FUUA9LkhcQ/xUDUsdwCdCs74LiI=
X-Received: by 2002:a05:600c:218c:b0:3ee:282d:1031 with SMTP id
 e12-20020a05600c218c00b003ee282d1031mr2918698wme.7.1681216286906; Tue, 11 Apr
 2023 05:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230329082950.726-1-cuiyunhui@bytedance.com>
In-Reply-To: <20230329082950.726-1-cuiyunhui@bytedance.com>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Tue, 11 Apr 2023 20:31:16 +0800
Message-ID: <CAEEQ3wn6Gu_L37PEnQc-bBJC+OAnQWH1gDSOwKYPSTNzy1tCzg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Dump user opcode bytes on fatal faults
To: conor.dooley@microchip.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, peterz@infradead.org, mpe@ellerman.id.au, 
	jpoimboe@kernel.org, mark.rutland@arm.com, svens@linux.ibm.com, 
	cuiyunhui@bytedance.com, guoren@kernel.org, jszhang@kernel.org, 
	ebiederm@xmission.com, bjorn@rivosinc.com, heiko@sntech.de, 
	xianting.tian@linux.alibaba.com, mnissler@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_053135_186869_0AB41B2E 
X-CRM114-Status: UNSURE (   4.37  )
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

Dear All,

Any comments on this patch?

Thanks,
Yunhui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
