Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AA1C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxoPW5Fa8vGrZLR/tfC1+6nTAqEyRnkX1V/9F0FVVpQ=; b=k1Dpge+AgbTyTd
	2WWF9Cw2y0aKHw9wQ8v1e24a7Rzvje2JekCF23e9zVDlNSvWTuGjuZyPDjVCBeL/+82RMo/npz4cY
	LgwqTsEf+ztTQwGqvSGI+fruSKZteN/vy7GxgmcSrV5x3G57nDs1BEZNBBWY0Q1WVbvvq4squzka4
	QEPmmcPdkSLKDLhL+sgav8r6MDZS1RzNRFwHfc3NCnSxKpOIZVWlmCR9K3WI8GB3IlreTETkdXrqs
	HSliGQIZutCAlBt/Fnv3dE9+KFn5Nl8Fyuq59kDcaWx94x6M7vmKIFQPQVlNeGMEtzLs+FsVyiWfg
	21MRMla+zrLH8I1vfldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62hn-00000002sJb-0obq;
	Mon, 14 Sep 2026 09:10:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62hl-00000002sJ6-3CaM
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 09:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38C9660008
	for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 09:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E639D1F00893
	for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377024;
	bh=eM8Qgu6NYAz2KlTImTDOnkezDzsEl+drhOjvzifcCQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bwb8EdQWtZKUS2/yJtWLuwv9QwqPg93d6fuTfQAb4ASCrf8mRwtheWC3cG+EouNaH
	 tOd8adCxSXUCsBpa2nVR+Uv70mQ1SC8865r8L6lullZlQTXo51dlZyOzXMcIjQgMHf
	 6j0O0mV/gpICV5vFu8Fr0SMRYv/5RtnlYI/OFAEnIvJoU1PHx/euzneVDydZ5LuPM9
	 W8+T1ZO/lGVkvsgQ7u6FUUPT/MJFnhdof0OK3kzZm7wbChMsSQ9GnafpzPaDAXJ6eM
	 51/JWrxXKnMiwzVTsMWHRnfTG85NPZrKYlVE4w5C0Cb9JfS05LeZaK8l6xkJUiWKMg
	 O8o2Kxl7o0ohw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so1672984e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 02:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwffgVSR9LuQNuJ0B1mmg4sXuMmqzd8I6v7byhsvw00HsASKtN1sXSRiU8chVnzKSUmkusHcVGBOQN1TQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nTXLy4gJT/2MamjvVbj4MLuJSsMhHo7YjvBQjy9PCYt4Qldd5A
	Vb6VMKsqn/YpP7McBp/mJyRJ5ssoF9TvxflGY5+L8guv4o6SY8piyLdShHSo3h7tL7wThnNVMRp
	OEuSQAZ5OTKzF9e6c2b1ZeInwQE/DlVE=
X-Received: by 2002:a05:6512:1389:b0:5b4:ab2f:5bd5 with SMTP id
 2adb3069b0e04-5b8ae68c4d8mr760395e87.8.1789377023628; Mon, 14 Sep 2026
 02:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260831105056.756259-5-conor@kernel.org>
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
X-Gm-Features: AcwNN1UxwLBklInMTDkL86Qeyshy5Z5cOuZdxURaH6Lw5kZs_qB3HVR-u2maOv8
Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: mpfs-mssio: three fixes
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
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

SGkgQ29ub3IsCgpPbiBNb24sIEF1ZyAzMSwgMjAyNiBhdCAxMjo1MeKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6CgooLi4uKQo+IENvbm9yIERvb2xleSAoMyk6Cj4g
ICBwaW5jdHJsOiBtcGZzLW1zc2lvOiBmaXggd2hpdGVzcGFjZSBpbiBkZWJ1Z2ZzIG91dHB1dAoK
QXBwbGllZCBmb3IgbmV4dC4KCj4gICBwaW5jdHJsOiBtcGZzLW1zc2lvOiBmaXggd2lkdGggb2Yg
dW51c2VkIGJhbmsgdm9sdGFnZSBzZXR0aW5nCj4gICBwaW5jdHJsOiBtcGZzLW1zc2lvOiB1c2Ug
Y29ycmVjdCByZWdtYXAgZnVuY3Rpb24gdG8gc2V0IGJhbmsgdm9sdGFnZQoKQXBwbGllZCBmb3Ig
Zml4ZXMuCgpTb3JyeSBmb3Igc2xvd25lc3Mgb24gbXkgc2lkZSA6LwoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
