Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3AF606D823
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zaWG4vug;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hUrYVgu3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h2PElyJB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kXV97hvwsThH6p1TbMPDEM2bggGFAQwCVD+twlUNGWc=; b=zaWG4vugNHNuWmvTBAPGc4DwCH
	1Ho2T1jG0DFyn6ulNe51g3dUnCvV9HHD7lKPWlkiOUCxnbyu8YfFKkfE0bF1Hd//JLiyyks3n4U9r
	04IEDwltFwe8VYABEjhAONpwo+7xmZdbdmiOI4nMoaxS43eRsjsX9oz/RJ0YjFmX5Tl6o5jS+OeQy
	2OPaECU0kpolcrySo7N+J/zmrUHdK8t1kEHIax6rzXB4TIRIyW07xW0q6daBGcXZOpfT8ub98irkf
	nldbaq30aXdY+3YmErc7xLBjESzIbXxyax/7mC6np3Dh34CcscmpLTArXyiU4/mPE0SK85WcJbvpY
	7IatIv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJB-0000000BjBm-3ZAE;
	Fri, 06 Nov 2026 09:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJ8-0000000Bj6x-2z00;
	Fri, 06 Nov 2026 09:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YwyvrU3jJiDTxDxbsC0TfxtCg10y3nSj2oVv4WB1cAw=; b=hUrYVgu3zJSlsWhMLOJXAvK8Q0
	FfanMG3L9OuiwiGT3T+3ngcnw6o8TdatWWqn8+/O1d34lLJP8NeL7B6eJKApz19ViMpv2WYNatwww
	FYrOuJXS5ddxJaPXAI+d4tlnhFILzr/teH7TgpYRR8Dt5rwP0i8KcXEso1N9P/T5EjS9uJG51v6Xq
	CHOC8/C45sK+rLwHleDwGId/HSvcc43oHS6ZGQ5oNXlVJ/PfsEF6dv11tuFRqhEWERDPNSThUJmM/
	nRrGvQ5/wHhz5vMosZ7XLqkC7C1l2Z1jZPiFkxb/M0TmXe8emHS2QXdQWvmngq1la7fg2sbOnsYyB
	DBkqdpdg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJ0-000000042qk-2ul5;
	Fri, 06 Nov 2026 09:32:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE6EB4E413E9;
	Fri,  6 Nov 2026 09:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A17525FFBC;
	Fri,  6 Nov 2026 09:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3865A103292D3;
	Fri,  6 Nov 2026 10:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YwyvrU3jJiDTxDxbsC0TfxtCg10y3nSj2oVv4WB1cAw=;
	b=h2PElyJBpGZNfSeGD85T77QnJ1LDeNgFwvr2DbU74Wx6hQ61H/+f2yV2iurSqdYcCgjPdM
	NDySdw9dTb58cK88zriCRpiN63aIccjGh6v7d7NN/Nsg92hvnamiH0feBaM9tw6JtuNWno
	V4DIzduZlKWoORHQjfBZDyC+xaCVrktUzRuusKcdvO+Hp0pwAYSaPxsBpF0k5G9ix1+qUg
	X4CJrOi6hbN4RN5w9I4xr9T5BgDFDOVPvat0w+BU2q3Mob5pUOkcRUNw+eJEjbI95WO+6F
	klr8R/fYW7DhchjG6CGUyNasvxIZ2g8pJ8H43JFP59laMxWN4aCMiTwn+g+GgQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:11 +0100
Subject: [PATCH 14/25] dt-bindings: watchdog: andestech,ae350-wdt: add
 Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-14-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_093221_016183_FA850E3D 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIE1ldGFub2lhIE1UMjgyNCBTb0MgaW50ZWdyYXRlcyB0aGUgQW5kZXMgQVRDV0RUMjAwIHdh
dGNoZG9nLiBBZGQgaXRzCmNvbXBhdGlibGUgc3RyaW5nLCB3aXRoIGFuZGVzdGVjaCxhZTM1MC13
ZHQgYXMgYSBmYWxsYmFjay4KCk9yaWdpbmFsbHktYnk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1l
dGFub2lhLWNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9u
aW5AYm9vdGxpbi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dh
dGNoZG9nL2FuZGVzdGVjaCxhZTM1MC13ZHQueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3dhdGNoZG9nL2FuZGVzdGVjaCxhZTM1MC13ZHQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hbmRlc3RlY2gsYWUzNTAtd2R0LnlhbWwKaW5kZXgg
ZjExMDdjNTUyNzg4Li5kOGM2ZjM4ZTEwMzUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9hbmRlc3RlY2gsYWUzNTAtd2R0LnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2FuZGVzdGVjaCxhZTM1
MC13ZHQueWFtbApAQCAtMTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBpdGVtczoK
ICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0gYW5kZXN0ZWNoLHFpbGFpLXdkdAor
ICAgICAgICAgICAgICAtIG1ldGFub2lhLG10MjgyNC13ZHQKICAgICAgICAgICAtIGNvbnN0OiBh
bmRlc3RlY2gsYWUzNTAtd2R0CiAgICAgICAtIGNvbnN0OiBhbmRlc3RlY2gsYWUzNTAtd2R0CiAK
Ci0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
