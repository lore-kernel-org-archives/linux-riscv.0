Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3077606C981
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HGGAOFPr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hO/ykntt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NCb+UeI1ua2Srvwd9WNJ4mzS4QIZxaqhB0KPmReP2E4=; b=HGGAOFPr/+jpMuofxdEOns11NQ
	hasSuO8BKeSzSRT/jvjSoaG6GGGJZSoSoH1fn6N+1PxJgt0sCbL89p1Y5JO5FeskfE8h5RcskYnfN
	j/mZoXpECfe9WY2phyUjWkAErI7gS6dI+wB4F/I/Vkd68t6UNlRahcPyP0wYLZyv4I0YukP+5My+e
	EvbdmtS4/ldCLlg2M30iymv7j2T42bvDUvdsS+obCUrqLjFRKLS2HOpiKW8jZmpZnjBRls1bPBe8e
	uXvLvpVPzRGWDUHnLbFd/YjiORvjMv7bPO+nGwCHKEQgjZujv+bZoiyk4641vVWb4KMk32oMark2p
	IofJwpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU69-0000000G2Bl-0eyl;
	Fri, 20 Nov 2026 19:16:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU66-0000000G2Av-2aSV
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D792614B0;
	Fri, 20 Nov 2026 19:16:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202192;
	b=CuV+cnLQ9m+nWHTOjE6U/tzWDsIWPlAJzHLwXWZO66i7oUjnFtdjFXlFFRAN0x2fX/0y
	 1oozNEscskSGfR2+kj6fS8AbbI8s5V75GrXH/MxmvW4GoNGMYiKQmINfuoUnhXtOOU+Fw
	 dnHeYtClQ+0dx0a1JIvW/eNvEHgRiASsHbk/86JkC4QWJDPcYuxtKy71Yeg2rxuJmDz3s
	 yRQ/dzichI35rvgYexK1bJPVj9BEdginmBfa5fgi/Vs7iIbkeiOFuGZpxaBEL7E9E2sMn
	 8LNb7xRK5lhRJtRO/Vq/y4rFXZI8aAYCNN5WThWHGMX6uMrvzOWDMhzsskCvwdQ0RLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202192;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VMZZaYjxAsNk+aIsMMw7wg9+anqipnDz8dl+A17D+zw=;
	b=KP7iffQCtsbUqcDZ81+mLpS+E1ZR3gtFrCanLRHbBYdwGI2PYTOyNjo4HIUUk/O+A8/H
	 SshrYwlDfrvL0VYEA8JIjW7+u74o6na38T8hJUnWxdUybAmRSxKPby66T/C5hgMSHmLKz
	 WWS3OUNkVdUexGCMqibr3xu0S1eSLZwghRTbmui+wdX4I1vqQDEVll9kVeqoCtCogBtQf
	 m3a8Yjn3Unrh/PNoZqpWNpBeyWuTP4MOsIbLNH4y+INpzhQ9unjKUApGQojsTchdSy9Ut
	 dAme1VyAYAcEhy8PGvkJHVZ7IZ9Odbmrcla/jiCpqDnD9j7bZrCIldE3AO/fuTBTfsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB77D1F000D3;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202192;
	bh=VMZZaYjxAsNk+aIsMMw7wg9+anqipnDz8dl+A17D+zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hO/yknttOtjSuR2sZzhA1s7x+ZMtTZt8gA9G8jEYyDd1vMjQVw6l9XSdqXFq2LIbR
	 7BFWeI91t7PsSkysP9R6/4L0Kb1FCjPpGPoLfQ0nLektyflEPjy1Ppu+zcqSaO3sZe
	 5dezjsZCA+KF1HpM2HMqbtBN9XQJfN+/kd4tz7p26uqdpQwnYqkuRLdgjzBRXdWXIK
	 lf6UboNce96H8ycqpdFF7WokTflAYugLigOB3/rQQ7XbFu38ByIvM22F/LC/21o+29
	 Qz/pBj/je3PTDu9zylzVI9i5eMWH//DPd2zk+2LQUrm6sseXuu03kBmZtUkxTh1psK
	 mNk3aqKmCZbwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B31B4B9C6;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:50 +0800
Subject: [PATCH v4 04/13] dt-bindings: interrupt-controller: add Zhihe A210
 PLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-4-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=1014;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=AEoDt8k53w5dy3iSBlDwYkPfz+bxGBpVIveGLfYHoNA=;
 b=1GYhi4YZ9kd+MNOYdzEmPclFuKMuXMDYkfAFeOAn0W5AMTox3qf6cloZLWJzDCjlc063R4ov9
 slQpGOWU0VDBJ9VJ/n2UIHV4eFf8hcROXJy6zlNyfuw9r+W3QfQsVpe
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the A210 PLIC compatible with the thead,c900-plic fallback.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb691897..fd5b61db3f5f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -80,6 +80,7 @@ properties:
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
               - thead,th1520-plic
+              - zhihe,a210-plic
           - const: thead,c900-plic
       - items:
           - const: ultrarisc,dp1000-plic

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
