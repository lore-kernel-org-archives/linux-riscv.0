Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93321CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwVLKYr4fy6vzF6K7eINzeOeiRTBdc+FlbgkWRVXhng=; b=WiJz1dNIzIlmJU
	VTOFq7+JN0hDsQsFe/29I1devm+Vd2RPBR7HhBLuqLL5Sr68mUWI88G6weQXEluG0kefBnfkLTzoV
	8f4hUmhhTocLwpb+h16BFXcYRiKTC8dYJ6jtjSYCqK5LoMMp28Pt/ieg+F5p8W036T/S1nSe/qads
	2uhhZjh3H1/5HgVJoiyApY2x0R2iUza4xSmJnAge03JvszE3yvRZdTxOtfiXyacM48/3Lx1f87F1v
	EICWR0djy3qWzDi4/luq613k8LXaH1PZTeUuG5Twtuf/6/Rr9oiXBTy4D9BjXj93O9D/zX/U1rJf/
	F3J9hMW+LE6PEm5LwaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqr0X-000B80-2n;
	Thu, 12 Oct 2023 08:25:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqr0V-000B6a-03
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 08:25:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso2470285e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697099117; x=1697703917; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6Cp4djRUeDiEy4xZu86ZIvejwMtz2L6/IM29LKj8uQ=;
        b=Xhrs0eGq3F+erEZmNxieXUcqsZxNJTWaV7xb3Gr7j5Hsyp85LPisnnzOgSXKpmG329
         eep8rCnhP5jczYTOt8TdFi6JethiQQ40m8ElBjtzwGb7jo9JGDs7/+o+il0giSuJbGnX
         nxybAknMBj7qlWEfX2d1BLBqo6bsuMUaxcYvfqJ2qyNZ9S1ZNt6nDhwI3fAz6Elxj7MX
         Yu4FUKXRZ1Ido3Rwq2HSCYsI7kVWEtpoHAxacELeE+A6D3saxgWH2L8cANGhVxsug6Vi
         1HECrD2wM7mRXvqlNpz5Da7T6BcRoqV7LowjwZSJEvAexgRM1/Ox/titO1W/G0ELLnni
         aekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697099117; x=1697703917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Cp4djRUeDiEy4xZu86ZIvejwMtz2L6/IM29LKj8uQ=;
        b=ECmGCiy4RvLy5q65tprzNuKFy1/1+Mar4673xeVAWSVHU18Yikjrq7mID3ZlcKfMB8
         8GsLv5ZxdUlE/eSrLcH45k2QQ4aFlqCNdJ09UtbEX4bEBQ9sdNhfAfPAuLnGwW6KMhA2
         ScltcgTreTpb/HUoQI3OPLAdzOJq1DwRVgw/CS7OZnTP5+BLFxcMKstNvL8mNQ/jfDU7
         YdR1xy1nxzc4dv9Ahq5Ydwt6aDskD5YTQkMiOeL1oijGsUCSezaygbQUlCuSJE3rZTI2
         +rQUYLAzn26fNcCXVc0khxeL4/ulA0M9J7TLoAce/xBjJrbpAa9S0RXOIs3+KOEZwVbP
         2o0g==
X-Gm-Message-State: AOJu0Yynaa4FKMtd5DMl7xmdvVjl4wC7sAef99yfFw8AojhyIBYmVDiD
	97169NbjrSTwfqEOaM1vSIv27g==
X-Google-Smtp-Source: AGHT+IHmcKJuJlt+r5jebp/RgAKP2nkKAOCLCYajd0uJf4+i35/c+xqERVY+pbY3bOhPGrRVc9HHoQ==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr21048700wml.2.1697099116857;
        Thu, 12 Oct 2023 01:25:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4004000000b003197c7d08ddsm17766352wrp.71.2023.10.12.01.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 01:25:16 -0700 (PDT)
Message-ID: <8a4e0424-5bdb-4011-a7dc-8506c609384f@rivosinc.com>
Date: Thu, 12 Oct 2023 10:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/13] riscv: report more ISA extensions through
 hwprobe
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>
 <20231012-clanking-imagines-150a7c05f3f8@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231012-clanking-imagines-150a7c05f3f8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_012523_257778_32E02C3A 
X-CRM114-Status: GOOD (  10.42  )
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

CgpPbiAxMi8xMC8yMDIzIDEwOjIxLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MTIsIDIwMjMgYXQgMDk6MTU6NDZBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biBzZWNvbmQgdGhvdWdodCwgbWF5YmUgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHNxdWFz
aCBhbGwgbG9naWNhbAo+PiBjb21taXRzIHRvZ2V0aGVyIChkdC1iaW5kaW5ncywgaHdwb3JvYmUs
IGV0Yykgd2l0aCBhbGwgdGhlIElTQQo+PiBleHRlbnNpb25zIGluIGVhY2guIFRlbGwgbWUgaWYg
eW91IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlci4KPiAKPiBJIGRvbid0IHRoaW5rIHRoZXJlJ3Mg
YW55dGhpbmcgd3Jvbmcgd2l0aCB0aGUgY3VycmVudCBhcHByb2FjaC4KCkhpIENvbm9yLAoKT2sg
dGhlbiwgbGV0J3Mga2VlcCBsaWtlIHRoaXMgaWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbiwgSSB0
aG91Z2h0IGl0CndhcyBhIGJpdCAidG9vIG1hbnkiIGNvbW1pdHMganVzdCBmb3IgYSBmZXcgbGlu
ZXMsIGJ1dCBhdCBsZWFzdCBpdCdzCnVuaXRhcnkuCgpUaGFua3MKCkNsw6ltZW50CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
