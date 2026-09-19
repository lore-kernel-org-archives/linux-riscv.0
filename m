Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948BCC982CC
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NS0S4MffiC7rL/CQHKfvjiDs9c2p1jM1kjO+2C3HzQ4=; b=IsT921MwuKjFDw
	6wbIaKgchi5TKcRQU2uqJjxSoUbwgG4D4mZzuHgxzTPbrl85wO4HBFdVj8VQrrMiPvt84O6TvYOBx
	M2RPJ0RxZrvTHjVct/W8PtHOsyW5IJbcKCVsBgfq8YgYT79OEZj++vFzf5PQyNWLKJikCmkM6Uu6N
	m3aRB+7PK6n6Tz8B9xpcU4fQvgX8fjV5LaJ2lzGj6ZgxXzFzVPpRsqB2WHO4TYouuuQ6zrQowtumt
	OLkvE1Tx9etq9DHkOa6XWe/j1+IxyIxZeq0G+rCNs5/fCXwERQenIj/nbC0bo+q8vR9p4QBsOD1yn
	W3OoWfDYKklKc1o1YUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rzX-0000000GA6V-3YsV;
	Sat, 19 Sep 2026 10:08:19 +0000
Received: from mail-wr2-x1a.google.com ([2a00:1450:4864:30::1a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rzV-0000000GA5k-1JcQ
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 10:08:18 +0000
Received: by mail-wr2-x1a.google.com with SMTP id ffacd0b85a97d-482f6350f88so915668f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2026 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812495; x=1790417295; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEDackXqYkNwDSUsp74coCO6I5hlg5B9lEbDTL2AtH0=;
        b=c0n4o1JfWDLOLNq7cSHHa2I3m1WeRQ2k8fGCMzRbj9E0Y/HLDDkqtOwtwcvCycCsHC
         mgbpJpdoJjhsPzoRSOCAusmgi+Z/yDBF5dg19URVLNoWzaxR3ifwE4T7dVW3xb3vqUs4
         pFzyJxhc29iZpC/1u25RYZ1GngvGwmzl1OLBuOiTc3W37vV4IGzW0BebFhH7QqH3fAy0
         96V4OUVSV/apDnPkiC1gZbHpu5JvUAlBEL+pTD5E9pmZmRY7MgIK/NHYTvpK1Gn6zuBQ
         RcbG5EyfD4FYsdWkumes6W2zZZt9cWKG4mJd0xIHrfQAuZv/BL1UaEcThc9lskfF7d4H
         X6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812495; x=1790417295;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEDackXqYkNwDSUsp74coCO6I5hlg5B9lEbDTL2AtH0=;
        b=ex9rVw4u0IaBQZE3tKwdFq5FzUKtRsPq5oIvodjPY9/zMjLm9aIxZs4LGZJj2PJ6uk
         veSP2LgY8Hwsw7LzB7tx5xaW7N6TgK7u4WL+e2Uoo0T45JHyei+pb7JCcp3Li4z4nlXk
         6+wx32ZPLpvOA5zMIMZZAvmuW5pLMA4zUI4Xca1rTzoyWrFQeYR9WQaLO18dF/ceNSQv
         w/tXUXCcH3aMPEchlSKqGVpzZbVFpl8PA4WrgZbFHVgW8BjtH5zgkDqyHvpfdA3s/9ux
         cKD6XXpSdOldE8NuP1V8U2GhnGELb7p/AZykTuITpmtLsgKdvyCKEnhV6W/EfERIvbW4
         t3Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxnuLk9fl38m/bebHP6ORSkX47KKlzIgS/7R8Obz9W4LMsQta7eA4ZiYOFS72lr3fKZ/4rGBeBxEoYXXQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kUUg6tykQhSIBr66kycqktlT5BPpS635VsiOiHviF836lacYxv
	vY8/t6+Vy0SvotGYqSf5DFhGzAia6b39nnN5tZ/y6UZ5/jwBcqrFq7FC
X-Gm-Gg: AYBFou3O0wGe1DwcEHg8sS94aN+WB/uTf4S+7w8bNRosgi+zjhVEZtmqwfNEBEr7gZU
	RA/xyoxbLzrGa+EB2S6+v03dnLDePKfEVZAhSDKHBm9F0oIhHbFjADDa54+N7D9YKMDJ58cEmcb
	ABbbUEO/mrdNwZIkUq7ztylOxbb2UuHExWWk332i3fs+Y5c8meobveSRdx/VlMjQERDPWdntnVI
	OcaIzMPezRwDFN3QO7Q+uLPZaxLJeJbIbtiHHyBtqLgIUwt5AMRZFy6ObBYUQ4uUqOdD+3ku8zg
	/NMGsKFOS+84H+8A+7TcnyWglR7+YG+D4sE/c13BuIhWt0cUqFvba1ZoLuj+CjeKl+QzEgHFPvy
	f+lQbIybQYB7xS6KUr/R3J8EjEjC+1tjbJzXQst4sjOfivMsl2kUOtUesoAkK+Y49dkH5b3ISX0
	bChSulzN6jlb59cOpQsLIYWzJmN12ngnxPXAjupRTTig+ZUn4nqGZ8WQ79NPpqN4Vrrp1HKhvW3
	VnDb20Dj+ES3BElzBIZaD1wi7Psb/0r5AGkZ3c=
X-Received: by 2002:a05:6000:2409:b0:487:489:7af1 with SMTP id ffacd0b85a97d-4871e3645a7mr7898104f8f.48.1789812494679;
        Sat, 19 Sep 2026 03:08:14 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-130-19.net-htp.de. [89.182.130.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724591eaasm5999770f8f.26.2026.09.19.03.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 03:08:14 -0700 (PDT)
Message-ID: <6a7777a9-a9bc-4acd-a39e-ee5f78cbe662@gmail.com>
Date: Sat, 19 Sep 2026 12:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
To: Yixun Lan <dlan@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260804133236.205668-1-a.heider@gmail.com>
 <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
 <20260918225420-GKB297024@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260918225420-GKB297024@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_030817_358738_55D27CEF 
X-CRM114-Status: GOOD (  11.81  )
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

On 19.09.26 12:54 AM, Yixun Lan wrote:
> Hi Andre,
> 
> On 11:18 Fri 18 Sep     , Andre Heider wrote:
>> Hi,
>>
>> friendly ping, anything left for me to do here?
>>
> 
> Not really, I will handle them shortly, there is one minor
> issue, will fix it while applying (no need sending new)..
> 
> WARNING: please, no spaces at the start of a line
> #33: FILE: arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts:87:
> +       cpu-supply = <&buck1_0v9>;$
> 
> 
> Thanks for the ping (and sorry for the delay)..

Thanks for the fixup, dunno why I didn't catch that!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
