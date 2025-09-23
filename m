Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586FDCAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 01:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4TLVRSeu9Hnv8WWMPBRATfAXfdW1WvIavaeaBSD7io=; b=VpUrN2NLOfmN/g
	qYkM/i9sD2+bjglHeVfykDYjo/KUbuNPpsxM6Kx7wvn6tCtH15FvDAbNQS92ir1aiVHTcod2+KGcp
	782XbHye3QPQ8cniRPx8wX5TkUZFkNbar9oYB8zqipr7FPvAw9ZWdy7ldYqmcEGED+nj+oy+RP5pG
	+mTnz5D96lnjHmg6gYi/FfD5ahyaoQPTKZy5UkTMSHktWnyrjr+P0Q+PuYvJicQBZo/aeE0078B74
	EwCIHvFE0zTR4z01kKBngDsvSERi6vRR8se/xUPXfd5Z2xFheK3HQwSyf0eK7FHqtIpuhwWtAoJZs
	9560t2DVNo0Eqy+OaLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rni-0000000C0ac-0LfK;
	Tue, 23 Sep 2025 01:26:38 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rne-0000000C0Zh-30Qo
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 01:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758590666;
	bh=R6prah68ZfsjQK8AywOG//BbF1v70nvv1zMUrmZX/8E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hQeNyhT46gkfO3bnI56SB6u78IRu68NE58IEzQsgFdoYfkXSnYaTFj8+Hg3egr7vI
	 UWgGVfXbRl4I9xLPA2uru/kCoNhzyNu/6OcUrpqHZKBGBUJboXai1rLbkeQZuM6D9c
	 gDCtAZl7UqCxwV703w/ct6UiaK/6r4HCVUuGPAW4=
X-QQ-mid: zesmtpgz4t1758590658t70792b8c
X-QQ-Originating-IP: ypD+x98mMo8iv/gr1uyYUH6f16wbGEITxjk+nMZAZus=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:24:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16270214164439239455
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 09:24:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <A945B5CD89E60F5B+aNH2waAtt6LNTyMl@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <aNG3xXKEYvhGfKjb@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNG3xXKEYvhGfKjb@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nti8seFhgrHQ3KIf5FY7llxF8NbsOqYvTjKATxq7RDrtzLDJUxmGZYpi
	NglzeiPmIseKqlYy1kK4RCaNyyI/iHaseVwYXT87+c9peHjQifsWkPRhkh0UCbtJk/k9nk6
	hh5WQz/Z5ZRG8BeVHaM8RVnS16IQH/zMxmQan15MY7IaZCFnOxpY04R9Lg9EPUU21Wv2F8y
	3l0q60nu/bMArXFMTMU88Yi/PKEmru2NkCLrS/XkSqVIkoaR16wtV6t0cGY0tjq9080MbEb
	0TxTNlauhV1+/JNiT+Q+76Kide51Wzq9XSJ6HnzYfilx2o9z8YZiYU9i0+zf0V7pV/yGk4t
	EE9PEUdeBVHXF7+PiP011+DJbMC1NdbaBmr95iKqp3r/c+SL3sG4w5gEZH1kTOiC5N8xY55
	KJ7n8lIT8f6zgp1Za2Jru/OL2tue+siklVP4qhmrOSeKCwKC33nTn+ijj4b5Zw31oETUDp2
	2r7XWdYLuYM4gfHcnSNVoSmwpCPdIO4WmMoYjSs/dMvjzeGACARK0AT754qa2jiNKshaazV
	QK1d3oJr0QgNQ1U99bG9q/g4uZT7W62ISi40sM5xdLtsmrsGX7CV51ygWbsrDWXWkgn7Wjx
	81gi+iyqCuBIvzLCkkcY/Tez1DT0l2UO2c/3lwhJV4p9qrN+X0ppb/b1G6MiV8hLxNdig+f
	VG4uMH7O0C5eElyQL0JU05iXg0D1QwQyRGk3J/U71Bs/h5+8w0tAoTJDpIBezZZCMYIQ9dp
	8ZOqESgI/spjEMsxTR2cGUOmCc/wuDPYIZQ9+3T1KD+yUAwWLIIwREkENz5hZjhsAMfX/5I
	Vz2QKj1kY98EdSXT21WC7LXs7XslZU/Hvmz9Kv8pFhA1ZVC/VLiBBBoNXAZedFrDhdppIBZ
	7xLpQhQgKqbJp+VqHFhJh2y/qEDG58T9P8HRhTDPun9UfMmu7xITGnOH7VKOzEXHfV2z2Fx
	tPRL5Ho0L+f5rsrFbctBZAXpoNgbQAf0tAo5IRnIFtigJb8wc9ZFDp0FdsU/3U33azkAKnO
	3/bImdf77glYoWkzieKaQLNipJnwMqaS/D5ecuHqgRfcTFtgqHKHggnJo91v6jJBTuoHwKA
	hUoNGEyTjy036iJha8zm/5dC0gkTvKPzlUCJ95LEB9j
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_182635_434492_6AB6F7F7 
X-CRM114-Status: GOOD (  17.10  )
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

On Mon, Sep 22, 2025 at 10:55:33PM +0200, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > Previously, there were a few latent issues in the I2C driver.
> > 
> > These did not manifest under interrupt mode, but they were
> > still present and could be triggered when running in PIO mode.
> > 
> > This series addresses those issues and adds support for PIO
> > mode transfers.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Thanks for this series. Based on it and with the few fixes suggested in 
> the individual patches, I have been able to write a small power reset 
> driver for the P1 chip, supporting reset and shutdown. 
>
Nice job. I'll follow yours. That's what we need.

                - Troy
> I'll post it on 
> the list in the next days.
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
