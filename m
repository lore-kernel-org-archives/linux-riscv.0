Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD9CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 11:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/0U6OLjmGLiIJt9Y8PoOd/NUkKM75/7vHAAZ9nBUu0=; b=jL6sjUQQ7vEigp
	ookhmQaX1R+8duwcPUCVVzyC/5OXa8g7MD5pgOR4z3322QOWQDxc+y/bjve/Zh+BkVj6y6mSYUKU9
	VABzCkG85jDqW7AXQGRhpDJoQ0vQn+0efotsLVgRdE3L8IZ2D8SFqLy0cm0+QAdWcWihN8HO+XZcV
	oOYbU9IkgxhT22NMCxAG++gChvRCLSwFIKm7t2N8R4ydMBogBTBj8gLeySI87jvCdgjWJcAhBtSAX
	UCG/Rxdgn2Oiw+RfLIEszU1gZF0uv1eU5eQ86KrzwVeMe/wcNQv/o8+vJtJmPVN2FHaxVrmFv4Qdn
	V1cdYzcJA9hVCHZ+opBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiDM4-0046bY-Qw; Tue, 11 Oct 2022 11:23:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiDM2-0046au-4I
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 11:23:24 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C0AF3F475
	for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665487393;
	bh=GMOS7F+JraDc27mEIrPoxpvPmBrSiSQwXpNxQV+nL+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=cOagj15pdzU9CszKG6HvNi92hYkEWosSefF9s2Apw1SRY5xIxPnqp+eUs7SZmU0mJ
	 TOwra6JOQ4rUN+tLsaVw+hX52ulO1/niKPLegPIDfzv9f+vSVh6i0bUEEKv8Ne/NB/
	 WV6QAMGJU/nGvgprgkVl9ITcMC8FArSCz2vvNbt2sPAu5kDnyJoJntWDklyccaw0kY
	 lfr46jYzGZQlZbE+T+4+FqcabHJNY0St+yI2X4peOj9S007uTeuWyr/EKLjSH0WI6O
	 Rj7FUF5t0R91BfY4tdmuSDUNuJSo7cQEHVhMz4bhCjE3l4xXT+Q+OX7fE9zHu1w6rT
	 RYT7YapMh0oQA==
Received: by mail-ed1-f69.google.com with SMTP id l7-20020a056402254700b004591f1de8ffso11000715edb.15
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 04:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMOS7F+JraDc27mEIrPoxpvPmBrSiSQwXpNxQV+nL+s=;
        b=DRfHF9WtOw9+0/sbUkvAAn6RKS1YbM2qrFrh/PE9AnGvDznaE+yb9094siKGkjLkVO
         kvNHmEaOLoe49ZjGQiE1HyMkbKnP/7NLXOZC/IYo7nSJv/5t2rtejQWoT22j2fbvahnA
         IqG4GbpsB63k+0ii4ORLwWlbmWrMM39J/vhSJI/HY/xWK4wewb4uv/uOrkmDvU3rpN/5
         IN4PDxPQESwcBzKW6gO568ISP8202PqymFjOpueUeFtjdmwbbWZJfswvi70+aCv/7FfR
         c05KDJW3U4GJGQ1cfgtIuVKfGzgBZWI8uSapfyf89d29ZVxr1/B45jnOai5vc+WAICvx
         LnUg==
X-Gm-Message-State: ACrzQf14obwm51t+8F8nzMTKhCmCy3b9XMtefBy3u3MmOjCPrTmX1vEV
	RI2IWammG4kbarslyHesu33XEw9BIn/vKr3yozmHyOfFZ+DevqLa5uwshaw0ACw4KkQe3dXkrc+
	pLNmbNR6s4V2Quy2UqW5CZ7o0qN40C5PPu3UpKO5bZW7G5w==
X-Received: by 2002:a17:906:4fce:b0:78d:9fcb:50c7 with SMTP id i14-20020a1709064fce00b0078d9fcb50c7mr11037426ejw.63.1665487392656;
        Tue, 11 Oct 2022 04:23:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ARnDaFt21q+50iKtAKkQZ9qceHBSD1VOVl9szRmiwe49iQYc3ABQ3y+Ju46sCLriXjWrBQA==
X-Received: by 2002:a17:906:4fce:b0:78d:9fcb:50c7 with SMTP id i14-20020a1709064fce00b0078d9fcb50c7mr11037414ejw.63.1665487392372;
        Tue, 11 Oct 2022 04:23:12 -0700 (PDT)
Received: from [192.168.123.94] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007030c97ae62sm6790413ejk.191.2022.10.11.04.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 04:23:11 -0700 (PDT)
Message-ID: <b0ad936d-4d1b-e319-fa22-4a96c048a855@canonical.com>
Date: Tue, 11 Oct 2022 13:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Content-Language: en-US
To: Eva Kotova <nyandarknessgirl@gmail.com>
Cc: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, xc-tan@outlook.com, coelacanthus@outlook.com
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
 <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_042322_615498_B9AB7B56 
X-CRM114-Status: GOOD (  18.26  )
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



On 10/6/22 21:17, Eva Kotova wrote:
> On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
>  > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
>  > but not read is "Reserved for future use.". For now, they are not valid.
>  > In the current code, -wx is marked as invalid, but -w- is not marked
>  > as invalid.
> 
> This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only 
> protective page:
> 
> #
> # There is insufficient memory for the Java Runtime Environment to 
> continue.
> # Native memory allocation (mmap) failed to map 4096 bytes for failed to 
> allocate memory for PaX check.
> # An error report file with more information is saved as:
> # /root/hs_err_pid107.log
> 
> I bisected to this commit since on Linux 5.19+ java no longer works.
> Perhaps some fallback should be implemented, to prevent userspace 
> breakage. It is currently documented, that at least on i386 PROT_WRITE 
> mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good 
> place to start.

Which test case demonstrates the issue?

Best regards

Heinrich

> 
> Best regards,
> Eva
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
