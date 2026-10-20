Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34858606A334
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NiXjIVob;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.a=rsa-sha256 header.s=r1 header.b=w3IUetQH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXlHEO61Um0y/HAcUU9dtdJx4L6ez00N8b+M7dFIWso=; b=NiXjIVobirzjL+
	vhTg2sQHXD1yUGKIPyVSQOOaDGnuMOOkOUXBCZLURnZALfuY9R/0CDkYAoSuAbNg7QYfSwgSWcZEt
	ojhQ2rlEsMZdiS8aV6Tc45FaZXsq9Gm8ZL6Se5Oo0ntjhOYKtyO4LBU3g11jyMawJ9vvABqdRM4et
	Nf1VjDtGraAVQHN/gwobG2ObLhGrVB49cIiKB3u//Qo58Tsldu0lSDpbhWTL/u2puoZuLzdsrMZLH
	02umLV6USg4Jh1diTyGWkj+RVV0VSmUdojI+DfOZkehMKn3+c7mh4s1dzBxUIyGRdp4lIxQJOjpts
	Di8eIoMNC56udb93irQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9rb-00000009mwA-4Bj4;
	Tue, 20 Oct 2026 13:26:47 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9rY-00000009muX-3s5x
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 13:26:47 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqd5l97z1sRL3;
	Tue, 20 Oct 2026 15:26:37 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=jpWt/pMvPnNcWCjB76mm5IEbF3SFOZp71fCEp2it8SQ=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1792502797; v=1;
        b=w3IUetQHi9u+C73lf0vi3QevYSXepVNE+l2vs6fk34wTz7FR8+ui+616jsdmCSSe
         KUUHK2weVV3Tb/R7E5tw+JnwxOuT8SF6H88uCA68iSx8RMZkkSAYvmrays2XkTUd
         qinvm0VtgZ+lRuw3IjKUQX7SNxdX5wqlNAxzhEjah7dGN+HNGKTbc/CTgrWcyOro
         TAuv4HwGsZYDdJH5C/4n7WHnrqvLUUl9tH0zfVR6gntfpW3YVta8yzasSM2pgBwG
         Ql5bnUViZ2vryPqJVvwDMqfvc+ydGQDizIHrE0IVh2pHY3CUezOafy/ZE9fVraRO
         hrEhkKJqKjs4DYZNYzKCzA==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqb009bz1sRL4;
	Tue, 20 Oct 2026 15:26:34 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4j8CqZ2tf9z1qqlS;
	Tue, 20 Oct 2026 15:26:34 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id sbgV7B6_Tp6a; Tue, 20 Oct 2026 15:26:32 +0200 (CEST)
X-Auth-Info: GSJntXyhLGrkHEzpWsj7VhWS4UOUak/bT46u6RSuBCo370N1q882lgF9DqVCziHl
Received: from wiesel.intern (aftr-62-216-206-189.dynamic.mnet-online.de [62.216.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Oct 2026 15:26:32 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:7b8d:a039:76a5:1596])
	by wiesel.intern (Postfix) with ESMTP id 9EE5979A06C6;
	Tue, 20 Oct 2026 15:26:30 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH v2 0/2] Enable bluetooth on BeagleV-Ahead
Date: Tue, 20 Oct 2026 15:26:02 +0200
Message-ID: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062645_868612_B50CAD6C 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The single board system BeagleV-Ahead uses a Ampak AP6203BM chip for wifi
and bluetooth. Wifi is already enabled for this board. The bluetooth
module of the chip connects by UART and PCM to the TH1520 SOC. The PCM
interface is currently not used because of missing I2S drivers for the
SOC.

This patch set enables bluetooth.

Thomas Gerner (2):
  riscv: dts: thead: Enable bluetooth on BeagleV-Ahead
  Bluetooth: btbcm: disable read tx power for BeagleV-Ahead

 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 85 +++++++++++++++++++
 drivers/bluetooth/btbcm.c                     | 19 ++++-
 2 files changed, 101 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
