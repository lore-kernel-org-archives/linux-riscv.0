Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EE6C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 17:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYl5axJ6ZxmL5/s26iwCie8KJ8jPtqL7dmpf7ekx4VE=; b=hz4T9ou/Gziptt
	Ku3CKnS8y5Pzeckk997t1i8zVAN6kGL+MM+a1SndwX0r3ohKfMUX37FOb7SYHbGePMtjyQIuW1JnM
	tKWx+u5+OnGd8YQojETHTMwiCZvU8ZklOaOpBbx0we8Tt665aAS0zeMhN6t7gS1QKrVaMtmx1lIMW
	09Y99U4CJRVheM+wBuqHlQTymf7x3xOrwxj4hUqa4qbKbQZrA0Av3kwspMji7c53DS36Hhh1bnXp2
	cFS/k6BY0fxwSTfGKYJnR+HlvaFkQm46HPGhquPwbuQnxmJV+gjV/pCs0ldkn2H98maF5yFst2HqW
	qVeebiZqcRwEwkhUXK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUW6Q-00BFyz-0x;
	Fri, 11 Aug 2023 17:39:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUW6M-00BFyA-33
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 17:39:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686ea67195dso1660599b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691775545; x=1692380345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+ShFNdSFVR21QLlnvolclztaU/XrR69W28hugrsBGg=;
        b=lRRmYJGIe/7kIapJAZLe0Wi2gygQ/5cSk0bAuJHIKyAeUL+6Am2QUMqEmW3kBonPG+
         9oMdo+3aOy6NM2HmcY69SkFOAPgB24R5xDEbqQm1klQZsjwEByzFmi6DoBTUSigtEG1h
         sREFrOHPCTmkJ0d035ZGJTLc8A2nglbEeAHB1bfQi+aeELTMldn1+miRo9o6YrsUVgln
         3OAQb/HuRpMR0lTkUHsY6PQ6cvXRgLBSDOcgL6fg5P3373RjWyR9tsLeDwNps8qUJjat
         0Ni2EeS6cAQa6nn02FKmjeQrVb+/KmSF+RgWXB3jrGkAkH2UoXyDptC9lx3wPY4a2OrV
         0sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691775545; x=1692380345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+ShFNdSFVR21QLlnvolclztaU/XrR69W28hugrsBGg=;
        b=aEQhuNNkOFSstRXYqfjFNlSRw+BdJvOVOOVzwvU+A4gi/vm9XMCo89ixCfKsRMJlje
         UohOod2/nKubsngLijoO1E1ZDxBkRMjjB++i1zzFtJBevDwZC/k8k5MbQ3wbJnnu9VVf
         bgyTAfAWMM3QArJ5YUmQ3ynugldHNXXKv6crsFwTqlA04/OixdgDHt2HgmW1YytLtdg1
         GhskGc4RknvG2Kuwo24gsXuup44s2eAnMj2wp1dS+GPsnjr38Kr14ORVGyYm/fugFask
         DFIo0njqpJ4W1EITsmdYuFOBXWIFubG8iDxJKha9iKiLsifzn3xZgjEUCxmfAhL8jytg
         wQdA==
X-Gm-Message-State: AOJu0YwR0K+wBfC9GvdwqhOMw3dXFna70d9d/dh4/fzx8sPI4kAQlXTV
	BkVf92oYtVvQbOm/Ir/WPTgsXw==
X-Google-Smtp-Source: AGHT+IGYyZOh7G4Z/0Cx1ClUmw6Rc7am59y/FzYhsjgC95YBAR1CPevol7CBsiKpsbsJ/c8HFbIgUg==
X-Received: by 2002:a05:6a20:102:b0:13b:9ff3:f52e with SMTP id 2-20020a056a20010200b0013b9ff3f52emr1984874pzr.56.1691775545137;
        Fri, 11 Aug 2023 10:39:05 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:42e5:c1a1:995:5aef])
        by smtp.gmail.com with ESMTPSA id w9-20020a63af09000000b00563deb296bbsm3586241pge.22.2023.08.11.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:39:04 -0700 (PDT)
Date: Fri, 11 Aug 2023 10:39:02 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZNZyNjjekd2SW/mn@x1>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_103907_210026_B0EFE92E 
X-CRM114-Status: GOOD (  16.78  )
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

On Sun, Jun 18, 2023 at 12:15:21AM +0800, Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> tree files for the core module and the development board.
> 
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
> 
> NOTE: the thead cpu reset dt-binding and DT node are removed in v3. This
> makes secondary CPUs unable to be online. However, minimal th1520
> support is better than nothing. And the community has been working on
> and will work on the cpu reset dt-binding, for example, Conor, Guo and
> Jessica are discussing about it, I have seen valuable comments and
> inputs from them. I believe we can add back cpu reset in next
> development window.

I'm interested in starting the secondary cpus on mainline. It seems that
that "thead,reset-sample" is already implemented in upstream OpenSBI in
lib/utils/reset/fdt_reset_thead.c and the issue is getting the
dt-binding accepted. Is that correct?

It looks like you've tried to restart the discussion on the DT list [1]
so I hope that the DT maintainers will give their perspective.

Thank you,
Drew

[1] https://lore.kernel.org/all/ZNURXBKkYdiWLanf@xhacker/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
