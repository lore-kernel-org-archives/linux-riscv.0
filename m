Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EB1C48BF9
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvdAVinSAosJ9WSOuEYfDyQBrK6fhIgcRFe/JtC18yI=; b=1/wQKC5wfiymPd
	32Rw+Lw+FAFW+6K9RrRdUpjpcuBy4XU1++M0air1+G7C80gOBGCQ3/8fqMkQ4x9ZINMvpugkMI8Bd
	lszFs07+O3wGhl9V5ojUu2t2CQ1m4xS2uoLC/Cr2wHRuSJkpKWZIEo916N+XALLZFGeJe7eu1OGqt
	1EchI4R6Zljyk9xERsIr1RDHX7cohu6OBkVB69j5HAFy6MWcuSaBXy0M5bD3rs8pjU61z5h6fbQaE
	aJQpWY62Z27l/VtMViwCLiVIFDNDLmonEZt3NaYvAthvlgSu/SgVLfd1UdbugdIFIdrZiqMpP2juc
	Ql8lCLclvhE8UKwdSutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ge1-000yyD-0o;
	Wed, 15 Nov 2023 14:13:29 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Gdw-000yuj-35
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 14:13:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 725DF24DB83;
	Wed, 15 Nov 2023 22:12:51 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:51 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:12:50 +0800
Message-ID: <e7c887a9-d08a-42e6-ac21-effa8e2e620b@starfivetech.com>
Date: Wed, 15 Nov 2023 22:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Shengyang
 Chen" <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, "Rob
 Herring" <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Bjorn Andersson <andersson@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Shawn Guo
	<shawnguo@kernel.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
 <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
 <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_061325_347802_999D790D 
X-CRM114-Status: UNSURE (   6.20  )
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

b2vvvIwgSSB3aWxsIGRvIHRoaXMgaW4gbXkgbmV4dCBwYXRjaApUaGFua3MgeW91ciBhZHZpY2Uh
CgpPbiAyMDIzLzEwLzI1IDIzOjQ0LCBTaW1vbiBTZXIgd3JvdGU6Cj4gIGl0IHNlZW1zIGxpa2Ug
eW91IGNvdWxkIHN0YXJ0IHdpdGgganVzdCBzaW1wbGUKPiBlbnVtZXJhdGVkIG1vZGlmaWVycyBs
aWtlIEludGVsIGRvZXMsIGFuZCB0aGVuIG9ubHkgc3dpdGNoIHRvIG1vcmUKPiBjb21wbGljYXRl
ZCBsb2dpYyB3aXRoIG1hY3JvcyBhbmQgZmllbGRzIGlmIHRoZXJlIGlzIGFuIGFjdHVhbCBuZWVk
IGluCj4gdGhlIGZ1dHVyZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
