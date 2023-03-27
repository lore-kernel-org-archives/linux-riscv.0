Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE3C761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=Mto3hJmPH+wV8C
	6ShzsHjyZgdoyALlptFQx8TtdAjs6r5EgKLpu0u9JvbMwHy5Q63zKTRwLpxFAEF0YnuCCFgEbCxvn
	amHWzmItBwjhLVWb90eazulC5m87lqz03J0walgw+qUxdeq8OwGLYd/UluLWYUouvLcOuTDHzpgfy
	buO7K1n/Np2Vu2nlrbhLz0d4cINOai7qp0JouqAOL6VsYAb1geYshpbJCMfSN5naMlw9Ra2adKF72
	9r/y1Xf0CJRwKmvmVd0dbGgT+XBu75Y0PhnRu+YCpmiQrL0zIkHouLKTek+0DUoI91LWpIUXnOg94
	pkn8kx4ENG93Y9OEy69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghfG-00A7YW-0l;
	Mon, 27 Mar 2023 07:53:14 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghfD-00A7X3-1E
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 07:53:12 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id B41FC839B9; Mon, 27 Mar 2023 08:51:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1679903589; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=W8VZfxr33isx7L4ndJkyPRurmu+Vt1nqCCGJSyN5kCdJeefKiNJCR4lYdTB598uCW
	 1lUc/6udBg4PkM4QtBwodIX2Q4Vx+u4A8rQEK4UvuaAFMnALFcYzzG9KqhkU1qo/2l
	 fLqNBFhWB9Jt6hf56f5BnD13UUyO81ODmAXFF/ZqEpXHNzpsgSGfDwCV8L24FBnNV2
	 4kWLMaxvzLE5WcGvkYYF2zvrQvjtweDEZnmD5pS2Driv1xKzZA/fHS56zrLsphhirN
	 lfoWC8uyXUuEZYWpJAUX93CxEHvJPvq1FEAiUIVkiBnBllxbeGdHC8uWYMaBV3/1z2
	 0XTRSXd0nMgiw==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 07:50:50 GMT
Message-ID: <20230327074501-0.1.4w.1mghe.0.5670u4m4ns@lokoho.com>
Date: Mon, 27 Mar 2023 07:50:50 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_005311_555280_FE7EF392 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
