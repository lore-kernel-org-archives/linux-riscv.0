Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62174C04A6A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ/3wqg44WG1UP+XeyPKOr0/KBPOcri9w1iBp7Rmg6k=; b=1pXVRU/tNZ9KE8
	WxINaJ48Aa9OmCnqGAS3Ejs7USYWrea5QTiEl28epA2JtaDi84k9VQ63gUEBvXsmtv+1MgzoFS6EL
	eRnvY3rwpfUcQ14McVK8YC3FIYc9qU7qtTBS8Lv49igEgFGJ49F9ptu8ijRCHKxXgCejArIhrDV3r
	TPv1lTH0LzDI2OccrG/bktHYmOwRcBQ2XkSZqoCQb89Hy5DOCnJfK9iTx0m/RsCrd91jOHXHiNIp2
	nKLd641zOSfzJznBdlKAmP9UUYlA3jqBgBBQnsdcjR8yKGzm7h+egSiyCKXf02udkcTPz7tF4fHt/
	ONERSRaQZZa/Cd4Whd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUZBo-00BcxT-1V;
	Fri, 11 Aug 2023 20:56:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUZBl-00BcwR-0l
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 20:56:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso7020745ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691787411; x=1692392211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGS8qetysZI/xubNvlzNZcECPzi8Y5beVEhoTCGql20=;
        b=bpz5rrOB8dMu6WWNnYOXXAwIOIjBSjI7o2elghyuwXnP5DQLKx3iWPgixgTpKDWF1G
         EbqI2QCDyQ3ghd95YR8ukIj6Op2eGv3Z9CAQh8ccDEsKq4QJhnt/K+ptdRUeb+SrZQpU
         M450fT0Q5fDU4c95+lzi99xgNKXHLf/2GIja99c/jSOsg83A4CugiBNd3gE5Wt9EQ/Wh
         jgHFHQd3xz2cEPApwpjGJyFU5aDmFkIFmrMyNBN+ZSXKH0r+TYl3SCXRGYU+x6JCMlJN
         xLuTjWZYjEyCjnSdgaioBMLUk+CFvuQczOrrtfs7/WouLfif+h4/Rqerv/mgRvacWQW1
         M9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787411; x=1692392211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGS8qetysZI/xubNvlzNZcECPzi8Y5beVEhoTCGql20=;
        b=A+GWyo64XK5t9qn4eAwxytfH9fYD1H1mMXIH4fj1UGSOY0csUudKVQnAN6pjM+Zvdy
         f+cio1Wz/a+vyVZtbHnB0V0vYn6ZrgD/lc4mf9volHZJfbiwKvwGNXWD5utbo4yuR65F
         0ZsIjzuyigk81U36S8J73eKGSFpHn6KpRKwDLRmkZ2IbM8pPSufjn7H+VbxwE5GerXEn
         /Bx1gdXzqoC4lpQKlwgIIfQmAZlBdCLJZDexXIhPyL4EsI7/olHGSfNnigvJMipEfDCW
         leBZXX4s/Lo6jLWL3R8eI4RypUrfXj0ocEODSYDR4Dg+hmNSXk7HA20uSMeEm5QsjTeB
         fI9w==
X-Gm-Message-State: AOJu0YyshkjpI8LQlzPNT9op1t/aWUn0/tTPb4sGMcFdm76XdpOEUQex
	9ESaQcfZ3pJ449OUdyKtmCDg5g==
X-Google-Smtp-Source: AGHT+IFWwzlZWGEa1qaJhVMxY4tldBHlHxQRTemKBJAviOEhIv+CzAGpXXWqZBF6EUGQ5FdiChtF4w==
X-Received: by 2002:a17:902:c94b:b0:1b3:8862:9823 with SMTP id i11-20020a170902c94b00b001b388629823mr2989679pla.28.1691787410964;
        Fri, 11 Aug 2023 13:56:50 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:5b85:b986:e090:9abc])
        by smtp.gmail.com with ESMTPSA id y2-20020a170902700200b001bbb1eec92dsm4358978plk.224.2023.08.11.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:56:50 -0700 (PDT)
Date: Fri, 11 Aug 2023 13:56:48 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] riscv: Add BeagleV Ahead board support
Message-ID: <ZNagkFWDdBSrQi1d@x1>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
 <20230811-unashamed-county-a3f662479f46@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811-unashamed-county-a3f662479f46@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_135653_482900_9EB89A72 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Aug 11, 2023 at 06:49:16PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Mon, Jul 24, 2023 at 10:20:37AM -0700, Drew Fustini wrote:
> > The BeagleV Ahead single board computer [1] features the T-Head TH1520
> > SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> > minimal device tree file to support booting to a basic shell [3].
> 
> What is the status of this series?
> Does Drew need to repost with the MAINTAINERS patch removed?
> Do you want me to queue this with the MAINTAIERS patch removed Jisheng?
> If so, I'd like to do so soon so I can get my PRs into Arnd a reasonable
> amount of time before the merge window opens.
> 
> Thanks,
> Conor.

Thank you for the reminder.  I don't want to miss the window so I'll
resubmit without the MAINTAINERS patch as it doesn't really matter.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
