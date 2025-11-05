Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C987CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 03:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZBKAxK+c9RP/m921sYIXmr5xsYyTmFanbfb778yOL3Q=; b=Ij8FpKEJTrF0ow
	ubayFxkAde7F8646ti3QiRtT17j8ovdNLiHNL4WiLlHXpsawnSMFmuNXlOCL+PY32JALiAr48aCgO
	hwc7jhWTcBOco2JCBEY2GoDf9RmwI9p4ngowWoPSW1Z7dg3MlUmLSDF4KcbJE4PwEDZ8ELfa+ClcA
	X4kfRDKL/rmjFzJXfbGdKuQD5L0+dug4Kcaujbx9fGC1qwoV94I+5IeqZM/vf6jZAbZ9ToFLaCCf4
	FmUpN40XWPw/pwcE51DHPNKsh1lrfPKzfVsFNhailUkXh6RCmFStwYe4uHHf5zKlHn1dIzT80VP/t
	PAHS51lt4mZJZd/u8nnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUMk-0000000CxcI-0bvs;
	Wed, 05 Nov 2025 03:39:22 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGUMg-0000000CxX6-0GuU
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 03:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762313877;
	bh=dLRrQ1i7ZuvOR380K25xa+U2XNncx0jGHzRRhBIJiZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=nnZN/UWhIcf5KIk/1BFNUUYUxNMbhZrx3fLBop3bs8K9kP+HLehdf+nd5ncm+C4ah
	 wpZIGEhh/thDd/vw1dqKrcC1YIu+9hGY2HYjeZMDh07jRlUuek+0BP+c8Ng+KlRKaP
	 8pIwexvQTDE2yhQtwCwAgOuqtb6UQdcJkq4/UfQU=
X-QQ-mid: esmtpsz10t1762313869t8b875169
X-QQ-Originating-IP: VTNhh+X1bUuazguRm/WjXFuDmMP9yaF6AZ6vdFDmMhY=
Received: from = ( [183.48.244.102])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 11:37:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13385157105176269560
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: define all missing I2C
 controller nodes
Date: Wed, 05 Nov 2025 11:37:42 +0800
Message-Id: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIbGCmkC/x3MQQqAIBBA0avErBtQyYquEi20GWsINBQiiO6et
 HyL/x8onIULTM0DmS8pkmKFbhtYdxc3RqFqMMpYrZXFQ6MjQjErxkSMFEZvle87DgPU6swc5P6
 P8/K+H++XFuVhAAAA
X-Change-ID: 20251105-k1-add-i2c-node-df8b50b64ef7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Encrow Thorne <jyc0019@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762313866; l=648;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=xiZjpDy3EAXqW0w4u5A4HJBPYdwJ/UmEUk25ogsrIqs=;
 b=vxtr0o72DIl8ORZBrMCYT6gEVCmnr934Hy5aIBBkYpcIOREfIIbk7+cs1nn295z7OPFLEqRNi
 8HCFtKkb4AGCIbdKRl9krO/wrZXGBEq4ldHVkOdDDA7NyJ24o4Atl1s
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NYadThnUvFNzIe8lUce+JyK7AzU6o7Tax/Y/XM90kBkMRKknRKa+27Ei
	6QOHAkK1UZY+w+wojOlpEVam6AWIKH/fIYQ7gEIFlC1mgK/5J8dFuh4EY1V7M2TyINaXNrq
	JrM/GmDhFFRcXJDezeeclJMI0P5hhi/FMDqN3RGjAVfPTKjC03LNgbI27Dh4q/O/coPsNVO
	JZ7wAe+yB7J++sZguRIIBXvYDlvnEgVuR7BWply7+Yq44IOHbG+jEJwKNFZO3h6aqOT0vlO
	IwZG2+6uwQSOLaCx+ubs8gctGLLDmxNg3fSn2pI+Akj7K3fEUJ10vikDjjzEeR1SpkkLefF
	HyV9Pa4J9uP0ovtDc8apUtg2zFbyEXgej4R270vvQxzX9BjmjgvmS3lFBQt7uDX1BaPtxY/
	hPIdAhnSNqkribM1S3jxelNUPktLj97ZIZw8TURT0Ul7LszaOURxIl08aYLrTDrguVs0uKx
	v/zKg5ntzFVzJlPPz+rdEHookZ3zku22L/6XYafINnYJT6YKj+cN/EjhuKxEJQgDvjRUX7K
	EKn7x4ABlg24Uz1YoaRpuDLmo84Ol6ECl/RS7uiMKX0tQB/sgab6zds8aDvrd1NR3rTfZo1
	Td7g2LOKPTPstpbjD5Kw+F5dVi6QHEkro1JUh1z2rrC5aMRCaHte6FrNmkXwp1p63XwGkCS
	DiK1Gn8HhPbGSWNwzeNMIDRVoYSTQCCW+cPM1L9s5rF9HbrAnnFDe5Zzap07lg/H/MphedA
	t/Qq0Q/DFIR/zz/vZSxYgpFOcOnKFfqub0VyCkN0+dDl/5JoiVfEpcCK1hKhQzSGElc2sXR
	aPY6B2PXEhTvgZPnH9iHU6jGMInbK3A5igeGhGyOzjU9ylPlfVOUb9EIFMm40JuMbKJK6p2
	NeXqDNz9gErfNc9Ow2NG/9XRTF9asoNK2xawISl0Gpuhya8ioft3Si5iHBvCTUmK+ANkzWP
	0WspFssm5GnLG2fE5JZBjRIeiJUo2GJn+4JyRVnbtTv2W9fa7cM7+ECEbnOIY+zwobaPEjK
	7/jh7B63J9dnS0Am3Oew6N59wlfy2N7eHWaB/TPhjRZ2V9ULr1kXbU9KFIrhgkKxBDYZLsa
	caJqde92yna8bpab8DSnpV5t3ln5oBp9F8ZNAkvc0bpxAOtEshUgrkjM8OyRVGQag==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_193919_461377_9D50D5DC 
X-CRM114-Status: UNSURE (   6.42  )
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

Some I2C controllers exist in the hardware but are missing in the dtsi
file.

This series adds the corresponding nodes.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      riscv: dts: spacemit: reorder i2c2 node
      riscv: dts: spacemit: define all missing I2C controller nodes

 arch/riscv/boot/dts/spacemit/k1.dtsi | 90 ++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 5 deletions(-)
---
base-commit: 17490bd0527f59d841168457b245581f314b5fa0
change-id: 20251105-k1-add-i2c-node-df8b50b64ef7

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
