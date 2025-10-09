Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B167CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rL7w1ayPDc2xPb3bjuk/V4DUPHOe7nXEKZHzxs1hjSE=; b=23Wbb1aBwlr9fC
	Ow/DH778p9XwjROPKHwtnqgZ9CUEuPT9+EQuEuMbRuPPCTL1Y7XecNULOIIq3Ba+S/qTMk5H1C5K0
	7F92ufw6B/vx5NCKdn3pweQ8tOA61+IUgH/bqslTNmbqri1WhsYIVSm+1cUiRDDY6rbBOv/Um1Y0H
	V+uOGsLP/g2iONTXHr3Ty9Rr9fIE1itnFWvTelQ/J7M+30B5DysV3iRKlcpO6h3w5HacAw3kMNOVW
	agyH7mG7Q1C9VDXFCxPnJ4AHPhIMV+sdxOtyDhKOWReEpumevzxXuU4OSoRzb/VWkteXFVcqEZC1A
	pNolH6Omd8PyPwaRuxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hUN-0000000572w-3cpD;
	Thu, 09 Oct 2025 03:38:47 +0000
Received: from bg5.exmail.qq.com ([43.154.209.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hUK-0000000572b-2MNW
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 03:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759981068;
	bh=NYV08VwWK+VCWK8zEMUDzI03igsAPzvucgAerlP6T2Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Wo7Y9eJbYhAJRGSu/0iQXdk6tNTruo06GcROScR1vKqiaZ7V1BGvtrs9/Pps7MeGv
	 YKhvAtgGEOaI/hmLQH8VbxfxVD1ujjXAPG7BDo9SeKsB3LQOVHFtFStx8tHwuRl8Oj
	 7T8okYReD5OCoZ5jf7WowXtZpM8oqxsnan/zvNcg=
X-QQ-mid: esmtpgz13t1759981061t0d23b669
X-QQ-Originating-IP: X3ZKTjlO2Y/CL0fdpyofBlTObtZxrr4RfV1kqTHy5ZQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 11:37:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11439905582249369742
EX-QQ-RecipientCnt: 9
Date: Thu, 9 Oct 2025 11:37:39 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <B45BBF07F015D568+aOcuA7CwpD-u393R@kernel.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
 <20250930012702-GYA1357001@gentoo.org>
 <F7785DF1AA531CA1+aOcQwrTLmAvlQ3ik@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F7785DF1AA531CA1+aOcQwrTLmAvlQ3ik@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M4lPCacZ9YleJLbPPknz8TcclJO70fmCUi6Z9jynNVdb57jDmRQIqLX8
	YmlVRyKxllxo9ot0IyXDWXtFOn4bkguU7xAucdBwN/UJy0tIo58AgGZqPx6A5NYRpw74TPI
	xKNqcx3mIgWmHVr0pdRc0VQZr+FAD1gV2QPKMGETizJ77diC51+POyA0crfw5LMWl/Q3GEm
	cx3MWgKk16yUdTHOPeYO3kFpg4aPG4Xtdn1vSrJwkIwwpv5WTVdf+PZlMtR4HsmGOTGWkyJ
	HqJ/rcC+ugGZFBUeDtQpjnRoiine7UohUMgH2fXy+j/KCN0CiAnVB+iQAvr71FAHfH0Me0Z
	iGWSgNutVShb8vjiFuf0E+a7wQfS35eNo/t6G9AL6+WOrXjRURERxX3ZJhDsFZxJiT7tttQ
	9luDhDW2X47V5ZuGjWiViBWfjPdTGvwIj98wZVT/YQMQj9UwaJnvC5szZZL50OL1YSmkw/7
	24T260W+ECnq4aoMDfbF4QRuSL3/HEUteeCoojCNgDlX7Eq5dpjNhhHnCyE9d/hMnFhqDVP
	xS9GZN0n1R4uA3ZC3AisM3k0um18RwnLp7tB1SG7de0PAo6qlEcyUjo0vvap4WlFyFzEilJ
	J9xRdIPdAA4cyka0hgnzarDyhjBZtaGs/5Rs5n0HH47f59Sgm+1dN1QoUuXp19CyxN1D3I0
	bvNo8ab1n+7IuzC3MDCNljpSPqe7x54sdb9KXlzIY02gp0DUE/KjW5UCQBOiXjyk7mKHRau
	v/mzGF659lIWTIA0k2LNDI8c785SiiXqn5b1yOaPo55vvVFkAeKQxc7443yN+0ec0n3zWcW
	MYDHkf3OIy9+4dj+R3QWDT0kxHvl7/NybXypB7lm7jWW+VOMyRmeHxS3uVoQzDK6RNexso0
	PdGx2Re+7k7VppLBIFkqu3gEfOjY9N1UaQsnfCPz4T4eFWhf6yO6L5QFvt9JhhnrwmzcLAs
	ZTXn40BSkTZuY003w4Otvf4PqC6FMfdR8XyM/IT0sukidubgnuBFmQX+9QVUnoIzuqJvBaK
	QPj5DXpRqyt2L430dBsAs0W1tzVt2Jv0GVdKFKc+hKyyjzZ1edVDoJshVuWz8=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_203845_282697_6CE1BDD1 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 09, 2025 at 09:32:50AM +0800, Troy Mitchell wrote:
> On Tue, Sep 30, 2025 at 09:27:02AM +0800, Yixun Lan wrote:
> > > +	/* To avoid being affected by the state of the previous transfer */
> > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > +
> > I've not see my previous comment has been addressed!
> Oops.. I forgot to delete it.
> I'll remote it in the next version.
       ^^^^^^ remove

              - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
