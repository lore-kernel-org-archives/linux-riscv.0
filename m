Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF21C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:34:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6EE61260
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6EE61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AQ15/I0b69CPhGOLuyTPGo052VpkpTUo7cbenUNrFxQ=; b=czFePRTKtcl/Fhnu+XFSHc3md
	6a/QjJbaOElwKdWQgnyCy44dnTaZ1uSv/kbC/zA+/YreEcWeVNfXvDPFUSyKo5vQxLBae206x5YeQ
	P5CODY7KUCyQIsRCcsqWco2cwH4eAmor4Qt5eX3J5wWExkPw0vNAF4YGx/EKvNB+9MeJ2zjo3y4Xh
	bxDuW3hM0EeBSfSk9pbs+WwLFfHs6iFZJKay/zmyQtKtP1xmbjg+4bWUVuzoqL14UElxxSEOqxX1Y
	D/OMGsTGcCu9DUCQcRdNzAhggJXQJv87OHzTC20cOdcAkMtgc3rARjvP6s5h42x+BrsKkBKSXUCff
	XTct1ZaKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6yr-00EdNS-Ih; Mon, 10 May 2021 14:33:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6yp-00EdMp-Bj; Mon, 10 May 2021 14:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=; b=WgrR7z67JUh5fMYBc1UBOalIFk
 UgzMaqSBBP8LCxTijUrODxluFgb1pgGrsuf5gLF5UeKR39+o9IhWpMFUDov48QuyJKKvNZbQXL4iO
 zLLxDY53bB9S1JUmfFn5CM5G0aqqjZZnxxtCkKPBjL/SdZ65UIsZhiVBMEMXb2XY5EUdAs0U/4XQz
 i+c1MT3GhAQ3lU0pGjq7ozf+bv6DOpULO3h62d+9NXm+Ra7bNuIuFUYNyyJYkpwfXUTScGMLclsXZ
 nnKwrI+jsWJihwUZRt/vXGFVGDZ5UAmuic5zgi9C/XBBDJzJv+qkTo8hdxhBpuatmcdKnbpTCSdT2
 kjNM8yQw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6yl-008oXc-9w; Mon, 10 May 2021 14:33:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id d4so16865340wru.7;
 Mon, 10 May 2021 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=jIc4OS4UG1e9Htue39hs2SdJXCmPLn+MTostxG/pw06sXYt4cF0beJY8cOPd4XkNvN
 wMkWqq4rS4nqVWqmlHYwknDCThc4F5oj3a10x6AGXMwZ0Kkxjgx6mU53ky5S6gct5IOF
 gb8YE/CdqFeQhJSfkuXg75IoXDsEW/QKbfnCDm8DSyF/6zHxA2in236S9Jv233h02Cag
 nY/zUkluYzDhxrfM75C6Qnf/beBRBG9DBN2uslTW/jB8AmOrnU4strwuRTlIYCmTiED9
 Adakd2gy/AYmhY6PfiGery2Nb+BVYLJb2xN6RqR96XQSpLkoAkrrTIc1zJH3tzspThUx
 eDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXsxoOt9fS3DXvxCyyFOaJfbPkU6WlTqA1MG4BgEpJA=;
 b=RxDfTn0c7SOkJ0LQPBBmM6Zx4Hc7thsPIL4RT5QaIMtJuh5ihtC4Zs/nxfDsn6hVoN
 EouVDVEJ6dyqmJMZdHE+Dx4sonlsf4nFmnIsVokrTlGEMX4NtFyeMFctlmsn9i56Ui4M
 brvb4UCgRqWDq90T7J6Kt8NUxZAAF+lbFI4lPrwRzoclr+Oq6jSo+GyDFKBuwU+e1/F7
 PBitFZQs6bg86v8etraektJ9nHCrqjzJ4x4ImK+PABLPJ9yT7xO5D87R4riWmMuIyiOz
 au8chxcMP1mkKLFxbJ6IG5BUPNrJHJysOz7QYls37sBZ8gwLpFK5N/W/Sk6w3jpjN+Cx
 c1JA==
X-Gm-Message-State: AOAM530FGPmTdnnXf1LznbrJnjahhbAxkRr6xR1BHbXvh+UjbHmpz83T
 fQwUZYEDor8hX666C6IJAyg=
X-Google-Smtp-Source: ABdhPJze1q8t3iuv5DjzOv0RveTjqSpEwnprh+IG3St78u9eWCZrU93KSEZYLbobgkyZLBZ/m0bYBQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr30469476wrm.314.1620657229579; 
 Mon, 10 May 2021 07:33:49 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id h9sm20117820wmb.35.2021.05.10.07.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 07:33:48 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Matthew Wilcox <willy@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <YJk8LMFViV7Z3Uu7@casper.infradead.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <ed65025c-1087-9672-7451-6d28e7ab8f92@gmail.com>
Date: Mon, 10 May 2021 15:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_073351_423678_92D27A7E 
X-CRM114-Status: GOOD (  16.43  )
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

On 10/05/2021 14:59, Matthew Wilcox wrote:
> Most of these
> UTF-8 characters come from latex conversions and really aren't
> necessary (and are being used incorrectly).
I fully agree with fixing those.
The cover-letter, however, gave the impression that that was not the
 main purpose of this series; just, perhaps, a happy side-effect.

> You seem quite knowedgeable about the various differences.  Perhaps
> you'd be willing to write a document for Documentation/doc-guide/
> that provides guidance for when to use which kinds of horizontal
> line?I have Opinions about the proper usage of punctuation, but I also know
 that other people have differing opinions.  For instance, I place
 spaces around an em dash, which is nonstandard according to most
 style guides.  Really this is an individual enough thing that I'm not
 sure we could have a "kernel style guide" that would be more useful
 than general-purpose guidance like the page you linked.
Moreover, such a guide could make non-native speakers needlessly self-
 conscious about their writing and discourage them from contributing
 documentation at all.  I'm not advocating here for trying to push
 kernel developers towards an eats-shoots-and-leaves level of
 linguistic pedantry; rather, I merely think that existing correct
 usages should be left intact (and therefore, excising incorrect usage
 should only be attempted by someone with both the expertise and time
 to check each case).

But if you really want such a doc I wouldn't mind contributing to it.

-ed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
