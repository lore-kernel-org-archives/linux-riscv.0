Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ABBCD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2P/+9pCOUrsl9gf3E1bFPPwlV/LLfV/eLM37NXUiuk=; b=35wnmXEDAfED3f
	H7yhDcPvjvvRSe4+ktUKFEsDZSG/OJCdaS2j0VR6p5MykLKROaJXqC1ewqDQh7DxmoSLDqg8zYZ4n
	iU7O4hb6RvD+6rxzyQVXf6WjmovNcTCajPQPYBxejBq+B+2QWJiuA5QzwTZ6jYOpuru7pS+6HZ7JG
	PyUI8Xc/bZhC+I6LfkgmUtYua3XJrvI7YQyh8eXltlYfXiapkV0e7kTZPfsdMxlA7BIUXgkhMF8Sm
	6CX0lpYXREO5rLxRPY1zlTfpf6S8ywMJo5LuCuBGcVC4L3pexjNcN8icc6JdaQxUpVJ+l0qm/Trds
	ooEeGOhvO391VbDwD5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXEc-0000000EiJD-1G1w;
	Mon, 11 May 2026 20:28:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXEX-0000000EiII-3dqL
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 20:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 834E143F0C
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 20:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62398C2BD05
	for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531289;
	bh=Zufrx/VI2aTaZkc5aI8hQ7bIa937j/pEvPsW/ybHiHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kY0n0me5gHXh9SQBpm0nawZ5itoni+8MAOqu0APPqli6Q1gWVeenTtLbc7QYrM2XI
	 gu/zJ6CgYj4Rj+bKfRhnqbs4kim2CfHCSmsE/wddLxU9oIcuvWsMrMxJTepLKh1oX1
	 0uTRg6SA1yp98tnfeG8It03g16nMgBE9MA/aWNGr9Ht4qPMDrzCTIue7kOVjzgTFf1
	 +rvC2qwFE61wiOdIoDCOE+fxqmNixJQQ+gFJiUkmHE4fYBrWittGipin0FxwGQUeJF
	 xVcbdWi7Pxxwc7wmvjGrQHI7arOSyRrr9OtKPbXYCl1kJemmRf4RqnC1T9qHTUNWu8
	 ZfrvpdlNdMPSQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5271849e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 13:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oBM9UcdqOfPJpYRUSaRwBYrkuMlOoaldv9OpmKNReqdxGdWGnKneoKq7wXZbVNZe4CJczMBAoby/41g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyByDumKvKxX6Cv+fh7K5UcEhCfwj34iVhA0sjB/F0qczSLkGCu
	OW/ouaL7qsfwXr1dPzwpOdeRsyof0T9VJSDqnC+Mi/N8CZFbxgEmZbulk83baLkJNmQXbOk5zLl
	dHQfcFfnqaZ+e5VcLJvVGCcV6QK7xmXA=
X-Received: by 2002:a05:6512:32c5:b0:5a3:fd83:13f7 with SMTP id
 2adb3069b0e04-5a8a949f147mr5220966e87.6.1778531288026; Mon, 11 May 2026
 13:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud> <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud> <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
 <NT0PR01MB1216A40D68A84F944F4CEABCF23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <NT0PR01MB1216A40D68A84F944F4CEABCF23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:27:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_7wqHYDL3K7s6AGTfLcH+Hs_sr3o53yJOBQ+F+Q4xGQ@mail.gmail.com>
X-Gm-Features: AVHnY4LemyhdlVVL4fcj1rkaW0eUQWg0zRd1czeP7h1K7aGobHiBihe2v4zvxNE
Message-ID: <CAD++jLk_7wqHYDL3K7s6AGTfLcH+Hs_sr3o53yJOBQ+F+Q4xGQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_132809_926963_4F5D2743 
X-CRM114-Status: UNSURE (   7.41  )
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTo1NeKAr0FNIENoYW5naHVhbmcgTGlhbmcKPGNoYW5n
aHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IFRoYW5rcyBmb3IgdGhlIGNy
aXRpY2lzbS4gSSdtIG5vdyByZXdvcmtpbmcgdGhlIGJpbmRpbmcgdG8gdXNlIHRoZSBzaW1wbGVy
Cj4gc3RyaW5nLWJhc2VkIGZ1bmN0aW9ucytncm91cHMgYXMgQ29ub3Igc3VnZ2VzdGVkLCBpbnN0
ZWFkIG9mIG92ZXJjb21wbGljYXRpbmcKPiBwaW5tdXguIFdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9u
IHNvb24uCgpUaGlzIHNvdW5kcyBncmVhdCwgdGhhbmtzIENoYW5naHVhbmchCkxvb2tpbmcgZm9y
d2FyZCB0byB0aGUgbmV3IHZlcnNpb24uCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
