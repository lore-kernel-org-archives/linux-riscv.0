Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40138CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbYPfJwiG8ieO1ISd3kBZfhmoGO7xcpV+9lqV5cwfms=; b=2o8k54pyjaNwyA
	jrE48hqg44v6euQ5uTTjxwz5XdKXGunTHnj7hTbwCPyj5D4k+EAIg5agjBqnb3fQZxgj34nlcfadS
	7Xvs0hxG5nEjFEIDu+nYh1P9m7Ek5ecfXKxubXsqm1nbVBAhym/YliSSaaO99vHZBW4oyav1WGhlg
	J29PfKDGvnZdhoa81nA1BL2I2Ure8khZBEmWCNKslW+3Ak4/lNmj4LuwluiuZV6FNWVDc0T8xdyqL
	dY9fHx34o8Yny3zYI0Edhf++GRLMTxx1r2/wwN8ttOO/yUDL/ZwEowF1sKZ6ZZ5WKkL9dBZlh1rJo
	s7R9bPkb+iybfF3wR4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt62z-00EhyN-38;
	Wed, 18 Oct 2023 12:53:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt62w-00EhxF-0G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:53:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c9d132d92cso17195985ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697633589; x=1698238389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4bV1pYZhN5D0dbLwFy/u3ve1RaIEgwcUfBCkqo2+yE=;
        b=KHZPi8NBNg5QzT8Yxmw5vFcc4aR238To3alobzU4KE+oQ1EUuVetT8S9GgfkXxeMmS
         dnSNRXqHT9mGGgCIMmoBkK7OZOuQzNoplZcAIw3Avotn6N1LRB2GSPobTvrPAZZ72jHB
         v+hd/3baqDzTNcqFUrHId/JPw+eZvucSReSmQDe0mVVc0XPgBMTu+4UHjyjUGOu/M4yD
         XqGSZMthoaEWfXquhzLtEDmdOjIGCiizd4z9jcU63R/rn4lgopA4qGF5hVd/hW13dVOA
         dJujw2FdXDcn2PLP+5Sbwp3Xoi+cm7MSLwwH0hmvQzENIWCUKY5R8mwNVTm/ECOtUPch
         m6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633589; x=1698238389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4bV1pYZhN5D0dbLwFy/u3ve1RaIEgwcUfBCkqo2+yE=;
        b=ulKK/YJ9DLDu5zY1x9OBaocJc9aPHNpG/W/egd0bttDE5sYcyOIYiZGTf3x9Z35639
         7Kd3+tqB+JrI3tJeESzLjq3ft56RzUu+/roL3SBgG5q8ijnFRsmhgAY9qge8cVOsPnKB
         +yWobNijU1efDKqqyOCCYCKWI2Nv9Aqfn4jf+OerkRD72vZUrmL4HOT/Tj7mOBACdzGv
         OWPaBvV8cRSaVzhaAtg7Ih2tzsypg8RM1wy6H/x/43rdX9Ggh+yzhDDH5hFjbFxPGEoh
         n3E/7dZjWU1mZ7ZdNqx/ctNeXH3PtcuW+9wUiC3kZQkTIp6wP622lw9dMG7Y+8eSKppU
         8r7w==
X-Gm-Message-State: AOJu0Ywmc7DLcNpPwoH2Ix8FrZnP7X8GpaYGhhHNZqJG6Gt8+hGOWUya
	pEMtZiTt56MZu9FByicar2h3gQ==
X-Google-Smtp-Source: AGHT+IFPDreTmEhnjLsKBJ/2zlFkymtjnnL8MnaU8RHtshB63uY79+49cBh7Lw0owZ4sNW4yui5n8A==
X-Received: by 2002:a17:902:f154:b0:1bf:349f:b85c with SMTP id d20-20020a170902f15400b001bf349fb85cmr5148024plb.1.1697633589226;
        Wed, 18 Oct 2023 05:53:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:fde2:480:5b62:f2d2? ([2a01:e0a:999:a3a0:fde2:480:5b62:f2d2])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902bd0900b001b8b2b95068sm3437763pls.204.2023.10.18.05.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:53:08 -0700 (PDT)
Message-ID: <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
Date: Wed, 18 Oct 2023 14:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: Jerry Shih <jerry.shih@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_055310_308265_6DDDA9A3 
X-CRM114-Status: UNSURE (   8.77  )
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

CgpPbiAxOC8xMC8yMDIzIDAzOjQ1LCBKZXJyeSBTaGloIHdyb3RlOgo+IE9uIE9jdCAxNywgMjAy
MywgYXQgMjE6MTQsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4+IEBAIC0yMjEsNiArMjYxLDIyIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEg
cmlzY3ZfaXNhX2V4dFtdID0gewo+PiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemt0LCBSSVNDVl9J
U0FfRVhUX1pLVCksCj4+IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3NlZCwgUklTQ1ZfSVNBX0VY
VF9aS1NFRCksCj4+IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3NoLCBSSVNDVl9JU0FfRVhUX1pL
U0gpLAo+PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiks
Cj4+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDKSwKPj4g
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAo+IAo+IFRo
ZSBgWnZrYmAgaXMgdGhlIHN1YnNldCBvZiBgWnZiYmBbMV0uIFNvLCB0aGUgYFp2a2JgIHNob3Vs
ZCBiZSBidW5kbGVkIHdpdGggYFp2YmJgLgoKSGkgSmVycnksCgpUaGFua3MgZm9yIGNhdGNoaW5n
IHRoaXMsIEkgdGhpbmsgc29tZSBvdGhlciBleHRlbnNpb25zIHdpbGwgZmFsbCBpbgp0aGlzIGNh
dGVnb3J5IGFzIHdlbGwgdGhlbiAoWnZrbmhhL1p2a25oYikuIEkgd2lsbCB2ZXJpZnkgdGhhdC4K
CkNsw6ltZW50Cgo+IAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYiwgUklTQ1ZfSVNBX0VY
VF9aVkJCKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZL
QiksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAo+
IAo+IG9yCj4gCj4gKwlfX1JJU0NWX0lTQV9FWFRfQlVORExFKHp2YmIsIHJpc2N2X3p2YmJfYnVu
ZGxlZF9leHRzKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRf
WlZLQiksCj4gCj4gWzFdCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWNyeXB0by9i
bG9iL21haW4vZG9jL3ZlY3Rvci9yaXNjdi1jcnlwdG8tdmVjdG9yLXp2a2IuYWRvYwo+IAo+IC1K
ZXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
