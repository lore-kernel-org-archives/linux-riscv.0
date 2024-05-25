Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C025AC25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JB+emOiDfxm+96cDgqlLhzH8EG1qk8Cu66BlNsWJhaE=; b=pLpfNUi6F9IO8q
	wc9mfReqPnlcV7yyDHoJvBHAtD40YnNPw2GmsAav7og9zld4d86KiJX0HDU6WQn3BdNPCbZW46ey7
	UTXl7Uc+XlwA3Mzl79UZ49U/aeB+dzpEZzmCWYC5nnFj+qYXVon5FGWBVRBpoNOHnUkZFD41o462d
	HEfxWOzexPb7FFjSBKom0IUmRKsd7L4f1fa3VMGdgIeH8gGoClBkAwVM0bksbAnT/IMpBfHTmpTtS
	+3yjNDA9h3kDGe5y75rGTLnahuH98PnALEsVbW+CyGnzM0lOqGAtHpJBj4khh+XHSG3VPzJ7bTAEd
	3uvLlSODB9jvmelXWCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnqs-0000000AhRx-0RTx;
	Sat, 25 May 2024 09:38:10 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnqo-0000000AhQp-0J2h
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 09:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716629878; x=1717234678; i=markus.elfring@web.de;
	bh=Al99sxoejdNoINbkYNcTmfr2Q6A57jN5aK9I7dlIghk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uqgZDG7RGglf64ipJsRc76zS7mUyZQSqvxNKO16OcTp6oN6qBHWJtseVhGIn9pj8
	 HvcDL17L60l/QXDR5TBAu4ouVKXeA9WaetYAVaR0EnzeCBGW8XGk8AbQ3nbpThJ+L
	 3fwhZrhPHFHQT7b0rtGHqy1O/8TEQbroEwmI8EMCOOBrS2QDb1ZFnHgQ7Npo2P6mZ
	 Hk55GMLx9wb1BkBssoOAUoa3EMOJUwRv+tKBrVHlsuWRK4ih//iY7RLA8r/uUf9f8
	 6/eYkB7qoy0hfluD7B3VqPV3e6qIbqjvO24OW+4cUOSN/HjsIeIF2G1JSa8vvQX9E
	 FLVS8rs36dzpiWmKZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSZMD-1s3yCV0MCf-00LqqR; Sat, 25
 May 2024 11:37:58 +0200
Message-ID: <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
Date: Sat, 25 May 2024 11:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Bell <dmoo_dv@protonmail.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
Subject: Re: [PATCH] RISC-V: add Star64 board devicetree
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
X-Provags-ID: V03:K1:LsMJemhnw4gC5uXuCjSjRdCcV3bKa3+UZqXcRQZ+pwQN5gmBe8l
 n0ltfZxBuUO0OGWzTwFOlWfJzaemmJdyk7Z5JxUyEo0fiWi+t5lbvslIc4eR0E0oMwmulzv
 1tOrWDykoCco1XE82Bhuw6iKFjUCy5R/Rihi7FDWetxphcQQyvUmVoOyb+KHEZKBrkyN4ie
 pIPu8IW62eHl+3k7IY/zw==
UI-OutboundReport: notjunk:1;M01:P0:PKJGWqlBrl4=;cM0/ZXfhYqM1Mkum3lccwU7cwUH
 yRVzM89bgfn3q6Aj+ZPzQNcfzxMedaytYENGuqIceaIA8zds1VjJU6a6A6IobeANATya7q5av
 AzH3ZBQXsGmLMiftWnDvLV65YAdJUkd+jby3884ieSAf11ioleUpWNbYiEwlENtabRpAP35zz
 3/5nJh4Zc4I+PDi+6fp6jBe3D6Z7SE6CfU+fYeafGqzYEaeWxgsJy6htOfx1kBHCemulfx/nF
 ankBqYwpKpRg/s4vSf+/Sr1Q6mE5ofukvoNs4ct8VpVCd5VMJNJVtt+dJm30arD5Huran1Z10
 UVLY9qsMYnTAif5sLR/3+sWhauWctlwIg+bY+0gk3r3+G4D++klCo7FQ+5ZkIJjR2RTgKIwhN
 1ZYNJvob+WFoSCEGGiUL1qwKJw+MjubE7bttwxb8iK1FS+R9/7zqSMyHgDj97c0HhyfIXAFk5
 I9Ouy4GCfhf8FtGM9UU7LzlBaRNCmZBHfe6W8V2zomLdiA351HHX285nv89IAkGjPjTX6gn2G
 kaBpIcOG+Mxf3zmjJNnjjG+xNH3SjaFDrbiScwsyCmCqtaGGBK3aBNuC0ZalGRpw9DrMCfbEX
 OOUNnk6l3D257qjrcKN7fKyzXZY01YJJxi3HjrUedb9vgiLc79xtpELaRuS+50eFMNQYistGO
 fBPuhOgZ0zkYjmGDWzq3pW8KNYXt600+jef3SPszomAx2+SRzpeIaxmZiyUWrT7+uRrXSWjvC
 dftrfrzFOC0FezvpZSr3FlQJn/vgtuG0W1qORpAi41K0C/ex65DaafMsG7s6aL1H1aX4Tz8Av
 Gh5eJ00QSWZ1tzwNmG903i3q7k7Jyfg6qUTrH0IWsWtWo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_023806_499585_DBBFE409 
X-CRM114-Status: UNSURE (   3.02  )
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

4oCmCj4gVGhlIGJvYXJkIGZlYXR1cmVzOgrigKYKCldvdWxkIHlvdSBsaWtlIHRvIGFkZCBhbiBp
bXBlcmF0aXZlIHdvcmRpbmcgZm9yIGFuIGltcHJvdmVkIGNoYW5nZSBkZXNjcmlwdGlvbj8KaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/
aD12Ni45I245NAoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
