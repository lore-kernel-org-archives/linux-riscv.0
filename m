Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434BBE7AD77
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uP8OzJQNF5cxZPZSkCIXtlfqavvZNxEfVKHetTuU8Ds=; b=mBOZdVTW1bpHzy
	NeR8JIYHszsOX5QqVBZvNYB7BGHFOIkGqMehHoIckZIRiMOmDz1cltFUhFp94HJxZ2UQSF5btdjlK
	Y4/e53mpN2GCw9ywf1e7xdOqolPiEc8F5vkErgxwbgJ8xCG/gQ2bVZwrkhQKSeWDxGIv8FDxfYsV7
	l3+XhBTah/0ShCQPotaAC8DXrXXKB5zXdocqIOXlcpf/JXB6N3E07mlTq+n2xy8kAnUAa25oQ5W06
	2j4+SweASuTQsp2gJO75Y16BJueI2TYxAt1xClIjQCu0Usm4z0QH9oFVXQkED2YoquzcPPeXL4kmO
	Eh6JiHLMHivLnLjjw9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyRe-00000000rLO-0shc;
	Fri, 26 Dec 2025 03:24:50 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyRa-00000000rJ1-43QR
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719451;
	bh=ZGYixiNr7TgV4tXYZjkDv48ADHaDqX/RgfMC9wzd8ZM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=sU/QDOqRCazu2lyhT2MEuClWm6+BErA5W7UFFI7KFf2cvYnN2UaMdAc3xZoy0snvc
	 HKTNPzvzCDWhSRbKXCJ2aA47OxGrVJdnQzs8rVqgJDwWUKcgR4af6FK/BtMyBkEHWO
	 NATVunk/JCCHsrUflFkxy8ekGCe9Bpc01V09k3Ow=
X-QQ-mid: zesmtpgz3t1766719449t6da0dbd5
X-QQ-Originating-IP: /spbIg54ayM0uf1VDTy00rI812ssEztteaeVpK8OAVs=
Received: from = ( [183.48.244.228])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:24:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12943365269370993549
EX-QQ-RecipientCnt: 19
Date: Fri, 26 Dec 2025 11:24:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <7C70798E25DC7187+aU3_145f-0aK1tZi@kernel.org>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEBSZfMfsfaMnpGWFzHTYuIEh/0ifa+2tFCC7ECIDxOKurc9x4XdtmF7
	C+bNMLikIxFT4XMakAHp+npOY0AGr+rvgi2GF+LjJrtiQqSJsGCa195JTY6rHgXG3LQo8wo
	sT6iBtrxr5+lbZFhFPcVq6nhf9wTUwURjD2wwD2AR0ObVGqDJP5hzycSFWPIwBenknsXhZs
	N0u4JfYxrQ+OVE+lkudDuh5ztB+8SUX8zAA+q4TufXHzdR/7LoAfqgV2/3IggSy9w2wtd81
	gXj827JuN8bBCFeiY4fCGGnLvXd1SMr7GXAuQmZNb9W6zJaG4i2/ZwFbBoQRinBKQ7vYvtK
	UHSJQrJQQTpLiIlfhMIR2XZTXYhe9Dk8d7+9ELxJQsQwc+Qkecel36pAdEL4buoE3gCQvlx
	t1ShaiE5j/upp1gHTPEdMSjU8b9Vea5NLv6cc9MD/AEzu85pOqmK5vxSRR7g158EBny14UC
	rpzMem3nX4UbCgMjbLacuxoTK0gl5VDq7GOIe/N27YVd5Vfy4Uw/7kLCyRlhEErG+D46OFT
	hJb4ArMaZ+Jr0pKltgP4Rdbl4eya/+/JErnykcyjA+GPYYXy3fvDjuVScZD0K14HLA1jSzZ
	wmGxKys5XUrPwSwSvS/xBmXJx+DulBmlaVsI0kOV5A7JcYkCN9guvaabZPBdWeJuEMrFuQQ
	52qcLLINjQz5cai56xyToTX13Zu+NVm8fM+Bm/WvXXKoePuJhqiuwJnQywCrHSg0RKDQRCX
	MdIkV5bpCfkLsaGZtNBr/lzS14CLFArYdVmJirabEsA8coeeP3imJqc4yD+du7roOmUgVSG
	0vdZFd0P1zVd9jtuwsAwzIziLyN3ug6+yi6aCbfENdSmaYBYqgRgWWAKF9VnI9Bdc5Wqrru
	2+fNlOJnFqW79+aIQ/VS5s82wvM1GiFshTNImANt4GCa7WudAcFI+VTLrBxLyNgMqBeF+96
	9QW6MtIaCmIqzG36/15V5Q6weVTJ8+PzqXPeNP9P3YJX1zTQfA4ZJPA2NfDWtMPtBVS5dMY
	dete6twKDitQLwSPVh0Cn3zKrZQq0FTe1LpLNWPLP0DKmN8IwAcvggGiCbJwDZ6Hb/YOUdQ
	6gz1TWEZOF1mBaswcsLyKw=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_192447_733333_E4189EAE 
X-CRM114-Status: UNSURE (   8.84  )
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

On Fri, Dec 19, 2025 at 03:42:21PM +0800, Encrow Thorne wrote:
> The K1 I2C controller provides a reset line that needs to be deasserted
> before the controller can be accessed.
> 
> Add reset support to the driver to ensure the controller starts in the
> required state.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
