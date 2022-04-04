Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ulc7VSKFM1/7TdAMKDoZVq5exzLWNnOM9Iyo1W/NmYU=; b=lPKEk1jVgjPe57
	29D/keAbMrSpA/NNMJRtHTMMACHEfEYxOKiwL3T9ndbf7EW32/f2bzLLPkT6q8dK966Klf3/XHkEs
	A9dre5Ul7cNE4gpq+QKwzdmgcq6emuIgb9400oiFsDARgBT/W5BYTqXnIERhSaoyL7XXxmwIWbi8e
	GtjjDBfufQOv8boWTyITdMH/x9eS+zQMIGVRdB6FHT8MQg74ZaJRaBQOyEa9Dli6nrehURT7YATBr
	U0TOAgwRdwjcDXwmpcVeb/bAIVYjTS6IJw6PraVRJ1UfTheuHcNqsWNlQA7yVNjJqeZhoS1pY4uog
	80dmFKy7SYsqWbqGnoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHls-00DljG-DI; Mon, 04 Apr 2022 08:09:08 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHlq-00Dlhm-5x
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 08:09:07 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
 id 71B45A2271; Mon,  4 Apr 2022 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
 t=1649059634; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
 h=Date:From:To:Subject:From;
 b=Q+S0Jh38xO0oiSsu7AZYp3lRjDGgGrerZ8Dw8eb6Sy3Dw43yqZp8MKROkFCqVAtzw
 J+EJPuC/IhNY+4TTzAxJBLvD8eLoZNn5MWlisFq0DzYumaEJ/SGOSJfe0sHIWBUy56
 PWb0cXgq6QcosY/616Asg2RgPV3OQp1rzSiTcVpZOxE4/i0xaZTHoRjdbfC7O7owzO
 bDfw3b7L2yLY3bWs5CHyDFN9/PxFKB8DiTKz66SfpluZlv7GXj+rehREqsfHU/Qrtp
 7q4MlWIa5tJ3j1VVxXhOQKrJHlAyynN7WVMXuhBDtiXhq0ttTK+fKFrbsqauObXDEt
 G48y6MsPosDeA==
Received: by mail.coredeal.pl for <linux-riscv@lists.infradead.org>;
 Mon,  4 Apr 2022 08:05:41 GMT
Message-ID: <20220404064500-0.1.2c.c89p.0.yj788el1r3@coredeal.pl>
Date: Mon,  4 Apr 2022 08:05:41 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_010906_405780_61E3E35B 
X-CRM114-Status: UNSURE (   1.04  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHJvenfDs2oga3dhbGlmaWth
Y2ppIGrEmXp5a293eWNoIHN3b2ljaCBwcmFjb3duaWvDs3c/CgpPcHJhY293YWxpxZtteSBrdXJz
eSBqxJl6eWtvd2UgZGxhIHLDs8W8bnljaCBicmFuxbwsIHcga3TDs3J5Y2gga29uY2VudHJ1amVt
eSBzacSZIG5hIHBvZG5pZXNpZW5pdSBwb3ppb211IHPFgm93bmljdHdhIGkgamFrb8WbY2kga29t
dW5pa2Fjamkgd3lrb3J6eXN0dWrEhWMgYXV0b3Jza8SFIG1ldG9kxJksIHN0d29yem9uxIUgc3Bl
Y2phbG5pZSBkbGEgd3ltYWdhasSFY2VnbyBiaXpuZXN1LiAKCk5pZXN0YW5kYXJkb3d5IGt1cnMg
b24tbGluZSwgZG9wYXNvd2FueSBkbyBwcm9maWx1IGZpcm15IGkgb2JzemFyw7N3IMWbd2lhZGN6
b255Y2ggdXPFgnVnLCB3IHN6eWJraW0gY3phc2llIHByenluaWVzaWUgZWZla3R5LCBrdMOzcmUg
endpxJlrc3rEhSBrb21mb3J0IGkgamFrb8WbxIcgcHJhY3ksIHJvendpamFqxIVjIG1vxbxsaXdv
xZtjaSBiaXpuZXNvd2UuIAoKWmRhbG5lIHN6a29sZW5pZSBqxJl6eWtvd2UgdG8gbS5pbi4gemFq
xJljaWEgeiBuYXRpdmUgc3BlYWtlcmFtaSwga3TDs3JlIHcgc3p5YmtpbSBjemFzaWUgbmF1Y3rE
hSBwcmFjb3duaWvDs3cgcm96bWF3aWHEhyB6YSBwb21vY8SFIGphc25lZ28gaSB6d2nEmXrFgmVn
byBqxJl6eWthIEJ1c2luZXNzIEVuZ2xpc2guCgpDenkgbcOzZ8WCYnltIHByemVkc3Rhd2nEhyB3
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8gCgoKUG96
ZHJhd2lhbQpLcnp5c3p0b2YgTWFqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
