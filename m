Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CECE67A8D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 07:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDL0HZKvy2DWi/iZhd+t9YeNi5Yxxug72pc8/rKeJl0=; b=Kq0KAWU47iolv9
	GlKhkK9fzlmUY2Xf35VDBNBevIMm2/w0bctIulSj6gTijuzcsYoeygCTR4UaK4nkmj8RO9nL4dGRY
	iW2IaDYLm/HG3JCmOiWkd9c6V14NphIEkzx34YfVM5EplMZR/GMxuuuYBWQFCFJMO2XaWizkKujzf
	XvA7TG1tLO1XqvkxnwDVzcsYew2RWw2YL1h47lkFGQmsfME+QaKZtQExItoYYzf2/Xq6tCIt2Y9pj
	sx7azIDsy6zJFudJlR1hq3SAyAAmOrXiT6l4otd7PAqWap1WOok/9L+TNJBYxKMtKiWoR8mKWtcrp
	E3pf6U5NrU0YQoA2zllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKH4-0000000EgtW-0zxk;
	Tue, 03 Mar 2026 07:34:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKH1-0000000EgtC-0gvK
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 07:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D793B44477
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B614AC2BCAF
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523270;
	bh=zVV0NCaniVIFi7GE1AKPE0lpZi3TXQKHW5/CTeMIYLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txxjX/mp2KJZaqiL9ZJqjgbPH04h1XJX/EGcDCJg/SfMYbHi+LtORX6EwLf/wOWPd
	 w61EpO1clEB7Mx+qQa2v9mMq/h9HkrZea1tXqR0j2HM6d4cRNB/QX8iMLfmq+bd8+9
	 nmMviCRwe4qA9dsb7ZCG01trsrtpYsuCxlcA6O3GRJwN4NB7cD8Vj+2e4/ZyS8krJs
	 4DtUWHHgeB/kp6vpgMy9M3SA7LzT3wz+MiNd4i0FXxDOBpu5xlNBYkWjlpFwcZ4cJW
	 NSbl4X5iGvQ2ABv/ajj7DCUUxNULTql2rkN3R1qaZgzVbYHODvA6CcPbWQoDzzZ1jb
	 AGQP0b6NtY1bQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso6492504d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 23:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxoHC1rB/FXL8noaLY2NO7nQwz73WBMqmof3llKZupMwQxND+JInFq/UCwdLchMldlTarlYHkO6/tNLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXQVRdhlE79IpYpE0yfKg3Y7EeGDnOv21BdG7y55KywKuNFDtv
	ulESa+gYLCxJgqehec7Zeht7hB3b6KC8Z1b3OGHN2XYojQjEmAyyAT9/rLBAsgWmAwNaupd3Kdy
	958guRah2NbqkVcgVy08dAkkIFz1k0HQ=
X-Received: by 2002:a05:690e:4185:b0:64c:cfae:a9ce with SMTP id
 956f58d0204a3-64cedb514ccmr622513d50.7.1772523270130; Mon, 02 Mar 2026
 23:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
In-Reply-To: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 08:34:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
X-Gm-Features: AaiRm517uAgxnadmG7vOG2GxR2Wmqlb_Rsg7MADyIUOMfZW6UpQeGpdorSLrOr0
Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_233431_222209_BA83D0EB 
X-CRM114-Status: UNSURE (   6.77  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCA3OjEz4oCvUE0gRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwu
Y29tPiB3cm90ZToKCj4gSW4gbXBmc19waW5jdHJsX3Byb2JlKCksIHdoZW4gcGN0cmwtPnJlZ21h
cCBmYWlscywgaXQganVzdCBwcmludCBvdXQgYW4KPiBlcnJvciBtZXNzYWdlIHdpdGhvdXQgcmV0
dXJuLCB3aGljaCBjb3VsZCBsZWFkIHNlcmlvdXMgZXJyb3JzLgo+Cj4gRml4ZXM6IDQ4OGQ3MDRl
ZDdiNyAoInBpbmN0cmw6IGFkZCBwb2xhcmZpcmUgc29jIG1zc2lvIHBpbmN0cmwgZHJpdmVyIikK
PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+CgpQYXRjaCBhcHBs
aWVkIGFzIG5vbnVyZ2VudCBmaXguCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
