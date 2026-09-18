Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754A5C982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mszx4xOGElprT1vtKYLP5Z7LDhWtADbekq5GnKa1A34=; b=Xb02dk+EcBvIbs
	s1126uWXz0GZyubz1heC9G9Fsrm9NhzTQMdBExNievYxo8rcu9VfPIJuEWcVnFm1/Yf4zaLeyqDw5
	uaIXt3E8cqmY/iLFqNYVQE/cP68Ir88nEvhyfUxgWZtXdrOjA8AFxhTFPK2x0AexRBRjU/jHfxyd7
	yF6uEcZHznM/XDG+ZZDwbdB4Smksgy4vVlkpdwWPb/rUHctAl1f29gWEh4CJWvYsQtfFea/MKuCy3
	3lMl36OijUoZWaINyTpO4TOdQHYqAMyrAH7cHBnAOiGkfoThvj66f6ubbeXbr4XToulmWCJqzKCIN
	AaQ1lB1Q77LI0poG8XOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TtD-0000000Dnqh-3bNB;
	Fri, 18 Sep 2026 08:24:12 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TtB-0000000Dnpi-227Q
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 08:24:10 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c264788fd58so66690366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789719846; x=1790324646; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ORtPf5rfrOcpgyi/FO05MAHQySi4ZeH+yKwjJ5NuVg=;
        b=t/EFtHKZv2cvIZHFrD98mIBmfpw3BS7m1XA1BygYuay8nm5vP8r+9+gpWy9tbfP4W2
         b6z8Cbln/a8iyqs4qGAaqSOn3QBxWxF3//YFZwVqs9sP3r/d4Mh0GnJxInqbDan8aZXr
         qCudPPbUfa/vIm88G/bYBg1mNo48/0Wwa56K1scRJX9El/J0msojTFnNYKRmTihQ9kBC
         FRao2vImFwm/qkVCcqw+BmcWdmRk6v+flAK7LE9MEoXbnQtdPhBJxV0T0sz8aaDutVMD
         LeTcnNtyHECGvkATbhPTXr3t5FzUmYY3doRKtCxQR/dreKA7JfwU9omGm9m9dkIAkizd
         q4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719846; x=1790324646;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ORtPf5rfrOcpgyi/FO05MAHQySi4ZeH+yKwjJ5NuVg=;
        b=d8C1wBK6LQHnWZnZonv4+wzkmapofdZn4TSA8REWMIkKjHdiH2bV0WD3C9HTu6Uk4J
         QW4e9c4kuJ8wHKRa1VAr5QIJwNwBvcj/sQAQILB9BMGlbc/Gh9pVUm3Lz5TEHJKKZU5/
         WF6o6WR2Jxgzfv4C5+14Ih4MYkz2nk5bYjV8EmU0ZjysFyrocs6vZMkJflDGOqCExyhl
         GdRjSbisbco2WaURfZdH/FcukHn82I5yZTENeSyGIVtroPIr/+n8j7dYaBiEn8oPrJuv
         Tk3M1SPlTQQfS851QEZt0YerSLA2zLVILSSjsnVf0DQyzQCj8xJW1u01EKHFBNa58YqS
         ulNw==
X-Forwarded-Encrypted: i=1; AKwUvBzCDdC76fab25SvyZYTvgJRK67oSFaW7pk13e8XKaWvPIAYx2liH4z2MTsjiBDN2nD4phptmBNPDDAMWw==@lists.infradead.org
X-Gm-Message-State: AFuF++kzzNQOyPj6yOV/AORPqrCg7/abnSOuUA31qqMg1nPsOz327dV/
	9GoBGPUmY79v4F7jDAk8SZNFRCpmviuHHxKXgaRjTzCHPpgZ22oeoMtAOZj6HkkQe04=
X-Gm-Gg: AYBFou16xIW/8I6Z/EatsSOcQZCxNBLJ4Eefmqn5D6sb/mrsPtwbsb/lnQ21ynB0hDO
	LSvNoEKn4Zt5ZAUNX2Sg/P3ECl9PLRyUY3wuvY1MBNnOZMZ2TOABy6UPY8CNP22LsCs8/OSfGNf
	8WEtujHZFyvBQaF37inwpEok2Tl89gl3jBdCDYPO1Fep2kEjifrnRWtutDxHTitDzwlLnvU29Bg
	5KlgrqbVedHNpuM3VDv1cOSMGVZ+BGyaV1eaBRPISOqTYos7hQKVr0yih9umifpwJNy6Ne+Qg9H
	z+9tdC0QlBVxTezdanSwGFUP+VjeBdqI+NJrPkag9UG/v3tUSqlhrX34eWpc7O+EkscwsvYPZmA
	9q3XLnwYdFJjdpeIssdhsq/fJ8Q9Cpx6XDzYT6dREp9IOnLhfVXnDns3LAN7/aS/9Yi9LfEX8I0
	uyWnPgK5JbOefZ8sKTfJWwYdbF56V6sS+0KNk02W2uLu0ELdIe0dLe0dfnO50S/pjtBCUrCBJxb
	h8=
X-Received: by 2002:a17:907:72c7:b0:c26:3190:296b with SMTP id a640c23a62f3a-c2a15e7df89mr192409366b.48.1789719845848;
        Fri, 18 Sep 2026 01:24:05 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6aafsm33384266b.51.2026.09.18.01.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:24:05 -0700 (PDT)
Message-ID: <b567cb05cf1508be7474e2874d267d8e8a09e49c.camel@linaro.org>
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Daniel Matyas <matyasdaniel006@gmail.com>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Liang Yang <liang.yang@amlogic.com>, Miquel
 Raynal	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman	 <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller"	 <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Bjorn Helgaas	 <bhelgaas@google.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Ray Jui	
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Vinod Koul
 <vkoul@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan
 Hunter	 <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Ray Jui <ray.jui@broadcom.com>, Scott
 Branden <scott.branden@broadcom.com>, Atish Patra <atishp@rivosinc.com>,
 Shawn Guo	 <shawn.guo@linaro.org>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding	 <thierry.reding@gmail.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, Okan Sahin <Okan.Sahin@analog.com>,
 devicetree@vger.kernel.org, Paul Walmsley	 <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley	 <conor@kernel.org>,
 linux-rtc@vger.kernel.org, Ricard Wanderlof <ricardw@axis.com>, 
	patches@opensource.cirrus.com, Lukas Wunner <lukas@wunner.de>, Chunfeng Yun
	 <chunfeng.yun@mediatek.com>, Eugen Hristev <ehristev@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux@analog.com, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org
Date: Fri, 18 Sep 2026 09:25:27 +0100
In-Reply-To: <20260917144028.459053-1-matyasdaniel006@gmail.com>
References: <20260917144028.459053-1-matyasdaniel006@gmail.com>
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_012409_534749_1DECFF21 
X-CRM114-Status: UNSURE (   8.80  )
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

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE3OjQwICswMzAwLCBEYW5pZWwgTWF0eWFzIHdyb3RlOgo+
IFJ1bm5pbmcgZHRfYmluZGluZ3NfY2hlY2sgcmV0dXJuZWQ6Cj4gW2Vycm9yXSBzdHJpbmcgdmFs
dWUgaXMgcmVkdW5kYW50bHkgcXVvdGVkIHdpdGggYW55IHF1b3RlcyAocXVvdGVkLXN0cmluZ3Mp
Cj4gCj4gVGhlIGZpbGVzIHVzZWQgcXVvdGF0aW9uIG1hcmtzIGluIGZsb3cgbGlzdHMgYmVjYXVz
ZSB0aGUgc3RyaW5ncyBoYWQKPiBjb21tYXMgYW5kIHRoZXNlIGNvbW1hcyB3ZXJlIGludGVycHJl
dGVkIGFzIHNlcGFyYXRvcnMuIENvbnZlcnQgZmxvdwo+IHN0eWxlIGxpc3RzIHRvIGJsb2NrIHN0
eWxlIGxpc3RzLCBzbyB0aGF0IHRoZXJlIGlzIG5vIHByb2JsZW1zIHdpdGggdGhlCj4gY29tbWFz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBNYXR5YXMgPG1hdHlhc2RhbmllbDAwNkBnbWFp
bC5jb20+Cj4gLS0tCgpBY2tlZC1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGlu
YXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
