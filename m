Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D9606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zx/UpgWZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NsksbYKC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fqrv1dX+5yOJU/4s9jWG4QF67cSMKcN1+n7PipeLYic=; b=zx/UpgWZdeQ53GLZ8ZrgjBlgpq
	rwthtgBrkaVgiVuUSD5KrrdJKH+Zu9TKRLGZ585UZ+fozsedNRZY1/558fAHa+VLDWDkNj4UYeSdi
	if8+2lbD6Z1cuQMrj6emoWzfXhI/AIGxEaSmnOimAx9+OtdoB4Co9bAqUxpQH3YWorZnTDvfUleF/
	Iog6U2DKJEsqjr3RCNgemLTJi0aF9JJTztso+pqfrW9m/OhHIwSvNZxGVB2NVyZd5rQLrFtRwskl+
	Z0BoUuXrMd8ojcEEKGThYWD0spBzz5gvOEkZaIEzvzqKKQ5hEjnIrL4FLuPRHzslX00SqWIkgusQF
	UBeTeQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFlL-00000005Anl-2On2;
	Tue, 17 Nov 2026 09:46:03 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFlC-00000005AYV-3Oc3
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908739;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NsksbYKCBbf74CXbp2CoijNV8Dy1YKY68Y3OD5vpZ4xqBPeseV+A2smdYkpKwm3oz
	 cf/9Y70ZBs5onXwxoV+x0Gn7VnhzxqmFjTZf3zfx+IbYilO5k5E4ULJIfEOLL4qblm
	 o0LdQ1/eXTVvoYtqUW6udiX2KDxKbssYJSKRux+E=
X-QQ-mid: zesmtpgz5t1794908738tf1d2ced2
X-QQ-Originating-IP: bsaj2xLaLCWn3mXT6bX46pVkGuckt9dXFHuXA9E85Rs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3879609612317059501
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:13 +0000
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for SpacemiT timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-spacemit-soc-timer-v2-5-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNRtbkluXflVoUdQXUcwpN49M7TdsfTwioXmPAuZJ
 DcJ9bN1lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATOTdBEaG20sSJhw60S1U+35G
 NFNfVzqf1oE44YSF1rJqP5e+e7pwHyPDR0nHMpaV5Wdrd7c+l311UKgnVK9kwtk7bUabNRezaV7
 nAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++GdiEWg+kbht02EjRzlnCDl34zyGu2pijraIMxYEHq7WB59
	J2IE4ul84CkxVsebT9N0GJGeT9Co2Y3z1giSzUgkhVU9Wtu/bGffCVlV75moc81PeWbcvNu
	eLro0Wi440L0++LUFuFUhsYD784o+IH2+K38SWTeGK5OPjDb4ULyEPyNcYWld3rwHXVGQEJ
	FImUMLkyvwqEFqw7kAZOCx+skPtRgSpgzvDxRMV6fAGoniApnFZ5NUmHuB/OHpXDSdlNhtR
	QFsoW85WVpGXxz2U8ocNTHB0abWdBcKLtaq06J3Hr2HzT5Z4fjMgOodnFDmST60wU7hmTFz
	NxfBDFi6HU8amLrPIc8wx5yq+8ybudPvFY3B/Udg1+355+sh8Qv5Qluz68jb9UHWXKjhJ9t
	QLG28la39f0571H2089Y0Dno/U3HAhYFxIoBSwjKnLcU1W7pzlQd1IhNfY+fBhcTsb4UTQ1
	VMyWp+xEkbwdgbte3MmuHay4tnRgsN19mIi+4nsdWUJlkWqB58xQZE+dVLwCqso0Ngt+YbM
	gfMol8WsbZJQND6qCX3m8lXQsIQFPiWHDL9Gx9WNk4k7C8Lg/j4FfTqisBYuwrBE5o5q1EW
	//lB6tqvVfIpOP3bODtjACdXohxiob2tRDi/mVSAJjKZPAI1tQsB45F5nbs7KAM/7H57KxX
	RVTzwug4wzkw7+QuJtxI8mGuJKtDTA+vXBQ5cWXIqJsNXEbbhwNdk3fbc4Ogs2hLl0cAep3
	rHb8ecF4MvKfLypN0X9XHOOMLErI0Wz3ubT1df+vupwbe18UCZjRSPG/Pt1V0l3a90PqkAH
	ymNNTmtGBqqrGUFy2JVjlP/zkiN0Csh48APucRjCzI29VPrH4wxyJL+LurYz1z6900LoYzO
	x48ho5AA8dJTABWUc+tJYWmCVTYA/bJbrcR+QI5nWjYY5DGnvz/E/B8ebB6C2eGWUbw8Vkd
	VFtV+6cC2QbJzLXBNiUSEQLm6A4A1Q0SKHKSxUnxIIduYIwZ+CjxhYt16hqFhPSl6TH/S3H
	b/WX2hoCnj3U1kOakbSZtzlMqzR7G0rRkEJBxmpZZx3EWCl0Yn/eqvsetssTJHJvjxtJ+IZ
	XIAdfeFOEHX
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014555_644263_92DA80A3 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
