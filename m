Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF0CCF9E4
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDrFfWztwzWSQXyAlC7MYpQ4jjHkfcjpJswcHJubYAk=; b=1WFJ2nyhg949MQ
	mwjAeuF9HFLW2ll+C85xX+tvc7F44Yqj0lJ6l+AKMx2PfzMhykMGH2w0E1FrIYMoNXWv84eUD1K2b
	OZ5vOYpcW1OskHrHzK2PQHJ4MnpJz928n+xF5t9h9KKNoXsoJKdU0lLhpbIMrN4/Sl6BqYPKDIe9r
	U2hgMmayVxUNtYshbrTdpI/tc2HqYBJ9EZclY6CV/YfoWDaVYoIwdgzzXHS5WANOQNz9L714hk/wo
	kLq0VJofyjgDVqIKoocsiOUrJhkP/FWV0MY+8zBMJ0ZRUzYOG3FDg+p7y4e6VpB28rLXher6K3uxP
	9EkepDkZQ9YUTKTCJTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stURW-00000005yjx-1QbM;
	Wed, 25 Sep 2024 16:00:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTJO-00000005hqG-1Dps
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Sep 2024 14:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=; b=VB+ATUOqzeoibU1iLYjqFBQwMt
	53f8W0kV6XCy5FPjeFQ2wLXAwBmfq3Jz/LIDrXkd3fH7clns+nwBPUsZM/7ZmZOFQ13rDoKbeFP8c
	eIDBh6SZlcmHntJiiCdwW0kEIM2rCj18vvFVdtW48GqRbsuXHVt5h+4swaCNsi6xfchpILqG0qEPn
	G1sBwY1LB4+BtM7BQiTufSGKW+qAH+Kls8XhN7WvPFTrbdwufPGsfwNwxecJJf0hRWI/mf1RstQT8
	iNuGE5foeGlLmfMO1YBedbhjK2qOWNKkJHPQHzoKX4ylva5istkMnHPOLihzHVlXzrf2vi6eCCC9D
	V1rgJ+kw==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTJL-000000023hu-0nAz
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:48:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8d3cde1103so651804866b.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727275688; x=1727880488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=;
        b=hEELQUhi9rORm4VlSUZbckIbc44fqYvSZWEP0IHrC08sURoGBuW3pzc53xqJGycBTv
         7zIoLrobRD0w+2msdzMrVW0fxuz0gj5JMl1gkwE5XduDjzOHUjC/K3vx+Yk4rJBBL7Gt
         aHJ71Tp+MSxxldyDbiGInRTWQUJa6w3Ab2mvIFYBxWSTZEqnh6xikvAKfWUJWV0Ek8Q8
         iTJWw9jTBcS6eSxRk3jGGJ6Ih6fbk4eh/AO1efQip/4XIsURvoFhVGUzNPSzoviskIQP
         bUdTdQADDyOk0ttCoIuqBm099mwQLSOuH/8vcsSahZSLWpp6AFzn1jYiURuaooQKAh07
         8E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275688; x=1727880488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyBcDGv2ZvaU+gCpRHgZ2PagwSzXnWPp11RYk5AnOc=;
        b=nFFP8pksrVHjG8TOEnRgUGWg8ZobjHclv1o3MIokqtRcDhcUVYjtwglcU4KNw/CDB+
         ej6finDlQREOxfsaYMIk6wPPeg0t5Uvllci4sugflWVcESPOKdFo/DaG/AXxD9vS2Iwv
         IXVad/u/U6uEZgy5aw+kbMPa4zA44ia5Euhx7s75ue3/iHi9Lcz/WReL1j6QWRUwBWpI
         Z3o82q2h2xm9n7JLz225ABRchUXpwP5fx/cWVwi6JbtK7rkmsx8jJHzomnXgyizsdv76
         aA2j/ohfFuq2T1SCPSMdEnPf1/FE4zoJJQ3o8IFYNAKFNCjToUIHxwiUReLqMn+FCkWT
         zIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6WGT4EW9PDczDgz/4yvs6sQqpRu5jDGrZA+23UNpu0/v63d466kUdnuxAKo99e2FRTY9AsTqngnTalw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+Jj9PpXhyACE4MuiZtzkPHY09fXpM7coW4CET0Xcyylv8Pkc
	bjHEspiFT8mSkAYwLgaobSpUxsK9+NSF8bhjqlemkdjZYGoZiqDQemO74nR2VyelISRQA+4mRZA
	nC+jp+Zt3g+PjtBszDDgF+eIerz95LTAlour3Mw==
X-Google-Smtp-Source: AGHT+IH9j/JX+iBbn22xiqIB/wV8Wbu13blKCn896GHhaJCrEb2BGvwE5HBNntXMQ3VhE//CXwPTCMbWKAAnjo/V3hU=
X-Received: by 2002:a17:907:7ea8:b0:a8b:2604:1da3 with SMTP id
 a640c23a62f3a-a93a037583bmr325593066b.17.1727275688066; Wed, 25 Sep 2024
 07:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240925142532.31808-1-namcao@linutronix.de>
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 25 Sep 2024 07:47:32 -0700
Message-ID: <CALs-HssQ=ytHT6ZBfO_qNDGTepzQGUVEygCPReb=JeWVkzsQ8w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
To: Nam Cao <namcao@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_154811_496712_3905B3C8 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMjUsIDIwMjQgYXQgNzoyNuKAr0FNIE5hbSBDYW8gPG5hbWNhb0BsaW51dHJv
bml4LmRlPiB3cm90ZToKPgo+IFRoZSBtYWNybyB0aGF0IGlzIHJlYWxseSBkZWZpbmVkIGlzIFJJ
U0NWX0hXUFJPQkVfS0VZX01JTVBJRCwgbm90Cj4gUklTQ1ZfSFdQUk9CRV9LRVlfTUlNUExJRCAo
ZGlmZmVyZW5jZSBpcyB0aGUgJ0wnKS4KPgo+IEFsc28sIHRoZSByaXNjdiBwcml2aWxlZ2VkIHNw
ZWNpZmljYXRpb24gbmFtZXMgdGhlIHJlZ2lzdGVyICJtaW1waWQiLCBub3QKPiAibWltcGxpZCIu
Cj4KPiBDb3JyZWN0IHRoZXNlIHR5cG9zLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFt
Y2FvQGxpbnV0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2lu
Yy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
