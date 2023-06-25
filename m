Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF1DEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHG5g8tZXAZNkSInyg5je/pUC/4SDE4ePDwB03DcKh8=; b=sAE40jxngQmJD+
	dgX4p2ALTW9h5jobCm4qhD5zZC29xwr8bPnyTBxwfhEKmEE+60OyBHSJiDE+mT5xhkCBXjGWYdDJz
	Yu2BihF5uzOZycZxYYcGLqWLEhXWfWjWLUKklCz9Td+8nFIdxrGpxjny9rHQlBJJsVLo27mvSx9WQ
	Z01aZLZVNVdjst4kMSXlUUd32+NQJYvjcTt4mTd0/PHxeUw0VI8GqUlU2vzIoocJDtmYjHqM1oeW4
	SXZqAJ3OtDJh8k+f9a9OyN7yAQnvOQD6aRLEMK3S/mL3kEEfYnprzpEIjMtw79EgaDCwROULsJjP9
	D7fl6t8pgX6WGQFyIACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDT2g-008L8k-0k;
	Sun, 25 Jun 2023 16:56:50 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDT2c-008L7T-2e;
	Sun, 25 Jun 2023 16:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1687712190; x=1688316990; i=markus.elfring@web.de;
 bh=mWu+5+5RD8uWNQkDyqDgTeflu8ZPfVITkxrOWnNCHsg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=fXCOjAaq+BTK8uVy7+dFiYunYkQtR5xJwktxMwNKTxB/5vABUacyffNCMgN3uxVXKwD/tfg
 Vl5iD4o6W88BlQbyIuuRhnV61TW+vfeUfW7QZcU+gIsHlpm3lmpi6lpeiPFMCKSYhBETumuXF
 5b4+B6T47G6XssLXmao3FbBG5NFvPzxq5AILfLJiftymjveQXgBZsW40Gv/htf/NSZqItDcCL
 lSgaC41d6fcM6RhCP7nfpeArR+fIBhC1K2HGMlED0fnJwPFI0DEhutyxSw0x+2vgCyeZXqd5v
 98ODSQ63u1GTlnK8z3TTh+HXEEXWP4bJW+wZc7IH3v++wx4qntkQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1qOwRI0E8o-00PELV; Sun, 25
 Jun 2023 18:56:30 +0200
Message-ID: <6a5380dc-7090-c01f-f3a9-69d5898f06d1@web.de>
Date: Sun, 25 Jun 2023 18:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maksim Kiselev <bigunclemax@gmail.com>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230624131632.2972546-2-bigunclemax@gmail.com>
Subject: Re: [PATCH v1 1/3] spi: sun6i: add quirk for dual and quad SPI modes
 support
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230624131632.2972546-2-bigunclemax@gmail.com>
X-Provags-ID: V03:K1:VyJe/m3KijFvWi87fz/heZWoJfUsbwV+dpJnM5Mi9FSKu0E5On2
 G9VnXGCx620JyEijBSk1Gj/n5iQPbw6MsZK7x1gJtNoEq4SFjqBkxxR7GrWrVbXQTmw7Efk
 0r5T41xDLuHJuesmtdzMWIu6a8yV1E/jwe3XKWc5caX0PK3QvuucBvIQY9dgOxKrhRi65y9
 7dkl63WUtu09FKz0TobXQ==
UI-OutboundReport: notjunk:1;M01:P0:50xYpXXyqLo=;0GDqroyBbI4ygY/WhdtRVr0QgfC
 OOKihxZJPjGOSdRvGOm5xJeuP5bmxQ0vL2/6iA4LE4lLVGTF5gLEmspOoaWL/61Mu2DYwMxO0
 N41yyn6H+7Wt1aJjN0ev368EaiI+XvCz3AhB6FTxMQhMFhUiyob/kzcpF1v39deTYOUU+1PGU
 dGc5l8vKxQTY/vkVqi2Q/PmEAifjcCHGcQtzyVtUaJHigHBUr43tj2kei5BjgqIt7YAivM15Z
 HqtNmyAArWxDbf6zCaSglXlGGWvoGprD0w3Dwdd02+2aCerBb1emMzpNBSiVaFlG4/VgmOWqQ
 Ji/iuXKyBs9typSxA99SwHT2TKyyGuOBB4D+WaD2Mx22GmxWUkGd9ozzd+kdiRSfAK7hTOeYR
 Y6QG3vmk8HG6OVlCtXlKSeZaNcEk5pSq5FHEuo3RKR7TSkRBvSvLhIARZSDrK8/G6OiUiXWw2
 CTc4SVpQ4/xCJt4wJYKEkAfn1BU0ZYd9SlM2Yqf4YpWlAW+CfOzaS92NBfudDwGVNDEuckV7F
 zr/qz3nWiKsT4WCbcBwH9J7qlbS4n4c3aKuIBJGd+FzJsOLXWVZihCoIpaosTzUCmZ1szcKxu
 MAAicjJNX2VTAqcfVKKA+hV679W/Hh7ScZGMKIY1/fih3o0NhCC8xRsjki106nRhcMH4dLkBs
 wFwE0mcZZn5JcIH25uelVmn0qpa5gwvPyadAyw/HR1GjosE4ny/GsqbcJhVyVssVGCD1hgr0Z
 Fx80yWotxYcWGrKDy9dejdb0UztQNXibCoeD+TVZSQ8LbGROyDH5jYfbQbVmfqqSzeHufTUVz
 nArec0DlPEsCmIGAN/6PGlJNo2fJQgbUbQAHai42P+TTe3kMkUvtiUmmJHYokQOQcW1TH7WJG
 t8rBHaoSGIWnSkB6JjKlDvLZHNxRLhwZGwMAzit3EtSrg3OAAKLADKu+leEP0cw9/DcW0rp+k
 mN8VGblaFFMKvNEdGRZxseahV/I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_095647_250610_1BC1C760 
X-CRM114-Status: UNSURE (   5.47  )
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

4oCmCj4gVG8gZW5hYmxlIG9uZSBvZiB0aGVzZSBtb2Rlcywgd2Ugc2hvdWxkIHNldCB0aGUgY29y
cmVzcG9uZGluZyBiaXQg4oCmCgpQbGVhc2UgY2hvb3NlIGltcGVyYXRpdmUgY2hhbmdlIHN1Z2dl
c3Rpb25zLgoKU2VlIGFsc286Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuNC1yYzcjbjk0CgpSZWdhcmRzLApNYXJrdXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
