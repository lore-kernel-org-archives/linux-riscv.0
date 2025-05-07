Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B500C3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juIe4m0twm/jn7QdjufFjVTjgupKPZ4u+pccXg1p8A4=; b=zq9v+brPC+ogjw
	oqOcZSBryfT6rFzyHBHuE/AsttNVUORm9uwy4Es5vgXKgHd9VajZesV5kgQCp44z+fXoZe5ECc76f
	s/Agf3hzHTFwEFI2Ee6+NLsi3GA7IRxzNYEOy+6I7OgyoRGq3N59arq/OSgKW6o8iW0HIkmX/SHU1
	vjiGG2sVDfXfEoha303QaJ2bk1mdt/7T3SjJouYl68POc69lCw7ijLTofwQggfDIY08PfpEU1JwCW
	2hKsmTut2+Da/lvaKmfcuyC6NywvxVtOdWskTEqLH8nOlKBsjD9VE4fpRy4QhkUcT5+58gK0+S5aK
	hkbMoNKGV4jGw6V4dcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaEX-0000000Ektn-3r6J;
	Wed, 07 May 2025 08:34:29 +0000
Received: from mail.astutebeam.pl ([162.19.205.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZHS-0000000EY9c-1haL
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 07:33:27 +0000
Received: by mail.astutebeam.pl (Postfix, from userid 1002)
	id B953025A41; Wed,  7 May 2025 09:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astutebeam.pl;
	s=mail; t=1746603124;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=asYnm2jf3MAB2i7qFdHolFsL1gvkA3Ek/53dvzwruCldMp5DfbqnN/+nnt4K516GR
	 9Nin7enIEnOFzouiPhrHxWybWBu0prLUY0hWjUClgHi4s2Mi3WXM7PZBr6TB+glZ3T
	 bOa3+LfF5j8bIE1z6MeihmUesoQIM8/dMuBgPqvPWRAIccUDuuplbRDPgjm8W0/iXR
	 aCH0x5ercILVgD2yjWl/Z4ssGzG+8HWaZyqMgzhws0bTL6ZE3rv+ciB2PeYxTCuYo4
	 mtDVJ00/+57kz0lo+ryb3YehXCzuJXFQVsdgkXFIcPyi7y0BbD75m5FYVm4Ka/7KyY
	 fM4Gil0Z4vwCg==
Received: by mail.astutebeam.pl for <linux-riscv@lists.infradead.org>; Wed,  7 May 2025 07:30:17 GMT
Message-ID: <20250507084501-0.1.i0.1gewv.0.b7dd32gp6j@astutebeam.pl>
Date: Wed,  7 May 2025 07:30:17 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@astutebeam.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.astutebeam.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_003326_589364_D2206A2E 
X-CRM114-Status: UNSURE (   0.11  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
