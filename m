Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD0E784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 01:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmWfXBkRc1r5J0Vd+4DMW11bEQZ4LEHB3sF0FRXdtoY=; b=E+9zECXnqepkk3
	A2WycD8LUjunh0ekckeTLTooHkKqGjcKkUhtkrzxM0myo0MZUGqVqp8kErhv00fUQKPTWmgLaHbz4
	2bizBc81igce7/hCBQP+bsGa7Exfn6OT38L6LulxzlQZLs+L56Z8RLgkQ16CbF3hM1mYD5bw2dekT
	IUzXx+WTcW8wl+KWuQUBLG2cuggcAVd49mrJ5FgvjKOZlskI8Bdzvm4Xehqpl+yG37AcLrFYktmwk
	AEKiQSn4lFXukZ4OECScn3I56IhKHLxQs4KEvmKJ8LdH4vSxS2sow1psv0EgWEBLV6f7Bc5Eym1SI
	/8MY+cH2meYY19dvQ7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1xI-00000003BOB-1g6B;
	Mon, 29 Dec 2025 01:21:52 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1xF-00000003BM0-2Ufk
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 01:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766971265;
	bh=aGnIEv/VfEP+D5B2aIP/tXEv3CMUGWzK3F2vJ4iKjFo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=GaxrQobzjj0QuFERK1btmGExE6jg3+RKxoOkfVVmJ7FRfSej/ycgOhoZp3D3wxWDc
	 UqNNpiNfOmgoujmDSz9OtXNjgHI5c+rgqBEexD9r5d0RLzJr5TWd1RgY6/Aq1wjwOo
	 R3yWrBrjbfr3fNkkxugvh8R91xwjQgx9ql+7gwGE=
X-QQ-mid: zesmtpgz4t1766971259teee092f5
X-QQ-Originating-IP: PKgYghdT8oi3a6sFLOe74HJmgNBRtvW503vk0OEHnps=
Received: from = ( [183.48.244.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:20:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10468442197477288879
EX-QQ-RecipientCnt: 8
Date: Mon, 29 Dec 2025 09:20:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
Message-ID: <E42FFF2530F73556+aVHXeY6PlQt40uY1@kernel.org>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
 <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfykWmRlrd2ohhphnxX6ChVDp4TdAkCrjxT8zUVXJJWSXj/T2Hme8pJI
	HgEW6eaM4hMSwaiRrJbzhQKa9oarP0cmO5ZYNadUJ6jCqDqpIyUJ2chxVXT6txNQnWMNyid
	Y+RdWqZyCQmM1l5YCgkQRPjZNEzSCjwnFD9we3AHao0w7fijGm5eqwhYgbahBviVwu58oCg
	nBXJ+6j7NRCDJA0dcFqxFL6Br/kdtpirMeiZBhyM1ji+No+SEY1Z8X+DNQ/5xqgsr1FGCwO
	ovjpB2wIYKnJfsSRN6lm3eyoZlRC8Adcc3bW3lbllRgvJ16oWW6x+ZrX2uyGx5XGaXZJOGb
	foTXFjAHzM61mrsrvwBpobZYCTnS9BalfPCdQvJVQndsKtMMPkecHLCbMjJtA1fAJ93wA6d
	bshlKgbjL39RjCBjCSeb95VwhgaKJXSyAirar4CeASGPRFJ1eManlkVb7QyXnegcMQus/tP
	5evAj8Zw8f+vnxNKnDuLgEZHBTrkQhVF+qi9cS7PofnmyZtqa0i5a00GcGA3DSEKauo3DLs
	RVYsGcWXxnErcuuVSda/ztlT6xRGmAfTWnVnB2ju+AcARz8oS1Ife+OV7fOkyjnECXJxfIx
	FhkEWL/ArvFsyzmunFhtjTy+PCg/XY7XQPQKOI0wwvcYzzYgzzxFOjO7VhMeuEvDUTFQVyZ
	rzJhjoilRU9lcTuuBenL+j5DxuWbsjIT31581kOquSr4wVSpXJBODz1ZRrNqUWjff44g3+8
	m0kIFhqdnYBbGY31MCz/rzWiGQKK7sDL7DIe92W0/6CHKkyAbYgMjVlwBv5Hm5rZ+hnNqTe
	okYOz/tLAxTiw18KrNHXtG4laNjI5dpR/xaBpNaSWGnUge+v7Xq6SKo6icVyJKXzdLxKj96
	cPl/9lEZA6e3WmPG7xHylonCEdCQT74zwfTV9KGxrEd5f152MUSVC6EIrNujheA4d9JAnhp
	g2SR0bVOV85chuZpsXItMT48h1qONysWk7zXhPnALv86RoJAJigtfDYcYMtj2itMdmbo+2M
	GstpVblvxpepwIFqGlHUSo1caOSKV73E/3WGOezVeD92B0u6tX
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_172150_014632_2E17DB8E 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 06:56:38PM -0600, Alex Elder wrote:
> On 12/26/25 2:32 AM, Troy Mitchell wrote:
> > The clock-frequency property is optional according to the DT binding.
> > Do not emit a warning when the property is missing and fall back to the
> > default frequency instead.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Suggested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Any error reading the "clock-frequency" property will simply leave
> i2c->clock_freq alone.  This is good.
> 
> But the lines that follow this issue a warning if i2c->clock_freq
> is 0.  If it's optional, you should simply use a default value,
> and although you could state that rate with dev_info(), you should
> not warn about it.
Thanks! I get your point!

              - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
