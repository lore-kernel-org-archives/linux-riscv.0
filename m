Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48670606A330
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MK0uAqo4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbxrgyxx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/jxmTOCnXCgsQjV13CSWHud6CYEU7N4PpGClbPZGJd4=; b=MK0uAqo4J6ddNv0URVJvicYERf
	AahQ/6hM9B1YR+yYpe+7CTNbVsYY2YAsG3twzH1TaSncz0ck7PYNb8IUpNjVFj/IxuyzPn36F0w7J
	y0Bpdd/CGYf8o+0PZDqSbvtEYkjNXsMqCnPDlFybzpqw02KTvPDavRKhFAFkThpgv25FdwnrJcD6r
	Lqi4FWNtaGbv0Mw3EH39LY1rtfeGwkhFUKJFoODp97BFgb8JeUiHvhMiYHSO6m1bCffcSrVKr3ebz
	AnOJsxpw4NbI+T2sRtSOkEpVE7j9O9sEopTaJ2zmmnRe2JyPv/HYr/+FjTADMTVtPTqbynXjqoVUv
	Fu4KeOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsfD-000000087HV-0ffA;
	Thu, 05 Nov 2026 08:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOseu-000000087Dk-0qTX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:17:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0395404D4;
	Thu,  5 Nov 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793866639;
	b=1Tu2+M1FpsFi59jzhUDq4o6lT9V70J4c7fh2deZ5uFOngDQpuLCBtLwfy8i732buCrIN
	 MXqq0sad5mT2dQxgq+9P0NWwqXCCEt1mg1uI2Qt77b9TkEPi3bqp6W+6Xa87lyFbhWo9w
	 tcIFnGX8/GzQqTY8a5jQoje+jKIHv9J/6kG0VEN6dg7zPzRedMY2E/6VpXVpgtxMPyqvB
	 NjDmjJPJs2632yBrGDYUykaPBCtREbXzTD55gsC0mDjKLlgNCxzWAZZvQS84lLKvie9gA
	 BUXVjiD97LjdNWDxgIb1+uS81FW72P4fewNSYh5VreVt7tmFd9bCvBsf1xr/oNeQCcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793866639;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KD4AAaRf4p3UJIXQQB6vPlBio7Rs8gGThbMv02QHs+s=;
	b=P8dR/otbnKnoNLmKnw5R6EHiD9l6QCkSB9xxsG5eAMROSAPLIGpc7w2fry8cRw3CmC2W
	 9pXLAGnP8E8K3PvXhm4+ZxTaZBrpNzLArU8Gr112dwjgZPHMbwAn6LewBI1dslFTDemP+
	 u9C/OnW5ys2De1Rezwu9nNXifaevGsjnOQOTa8Dk5j+Ye+yxvs5F9XLy2JhieertnDKYY
	 QbcfklRbjb+mHIfSNJP/AfL5DfDELdC1i1Ab7H80Uty4NnO/QIh9RS2vK3sY+ALTiITZ5
	 7SCjDiRL6+pPOkzvcA6XZvnp3TOY+mDK5nDe6ugb29Lzo7sBqfjFstT9HEOw3KuKuMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57B8A1F0093A;
	Thu,  5 Nov 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866639;
	bh=KD4AAaRf4p3UJIXQQB6vPlBio7Rs8gGThbMv02QHs+s=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=hbxrgyxx6BFw8s7ol86ak2XN/m5dn8iNbseaNBqkfFpZdpywaDy7PbC/3HOz9qpPT
	 hpj+/LDtg+tT/6sN5MyLYnhBNi6uEskHmUbU084E6LMS166zf4FLiUNPKqxryww81m
	 U28NoNQ88qU8HBTt1fDImh99HH7cFtq6XdBj2kGp1NLrZizY57IjwILnzjcxxQCLhT
	 3wkO3XuF1gq6QETotn4Uj5zGJpVJo2cxN7eVFaPZ9XsxIAYWhqviAF8eE9YJ10TSX3
	 B4ZQ54lUxvKtUeHLj1e+iBUhYSHzA0ubaAt0Goiz3ChPs056JuRnAfLkx3IXVdcOZ2
	 To2X5VfMYMaWw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACB544716D;
	Thu,  5 Nov 2026 08:17:18 +0000 (UTC)
From: Isaac Adjei via B4 Relay <devnull+code.isaacadjei.me@kernel.org>
Date: Thu, 05 Nov 2026 08:16:51 +0000
Subject: [PATCH] gpio: mpfs: reject unsupported interrupt types
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtII4muEi1Kx5pFahpRRHdPW
 r7F/w9kSkwZevFAopMzB18gKwFmnfxCyLYYVK20lHWLS+SAW3QZOe143JGQGm061czGWQ0ljIk
 cX/90GN/3AyioTb1kAAAA
X-Change-ID: 20261105-gpio-mpfs-irq-type-e36c823bcfd6
To: Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>, Isaac Adjei <code@isaacadjei.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866638; l=1787;
 i=code@isaacadjei.me; s=20261105; h=from:subject:message-id;
 bh=RPHB+79SRzi3MO4cqrlIZyGYkUrVv21I2XEOqLhYUno=;
 b=fFDDILoO4M0UxwIpenwFbNGJG0/z4thpkU2owNKbMEFvFJ2+2Fw0TJ7pG2PG/Yd9BnSqRfuuC
 2eygNlMXFfxBi6tBkhb9N+FkxBtISiPq5e7WZCwWSl5xEAZcw7nXG0d
X-Developer-Key: i=code@isaacadjei.me; a=ed25519;
 pk=VhIIXFXv1g0LAdmG85V9QxWkeBc0KGdKUVH/4o0lWco=
X-Endpoint-Received: by B4 Relay for code@isaacadjei.me/20261105 with
 auth_id=1415
X-Original-From: Isaac Adjei <code@isaacadjei.me>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: code@isaacadjei.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Isaac Adjei <code@isaacadjei.me>

The switch statement in mpfs_gpio_irq_set_type() does not handle
unsupported interrupt types. For example, IRQ_TYPE_NONE is not listed.

When an unsupported type is passed, interrupt_type remains
uninitialised. Its undefined value is then written to the GPIO control
register. The function still returns 0, making the caller believe the
operation succeeded.

Add a default case to return -EINVAL for unsupported interrupt types.

Smatch reported the following warning:

  drivers/gpio/gpio-mpfs.c:144 mpfs_gpio_irq_set_type() error: uninitialized symbol 'interrupt_type'.

I built the driver with W=1 and got no warnings. I also reran Smatch
and confirmed that the warning was resolved.

This is compile-tested only. I do not have access to PolarFire SoC
hardware for runtime testing.

Fixes: e57b53f0f36a ("gpio: mpfs: Add interrupt support")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202411080149.bOpayvf6-lkp@intel.com/
Signed-off-by: Isaac Adjei <code@isaacadjei.me>
---
 drivers/gpio/gpio-mpfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b..0b7a48e0a 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -138,6 +138,8 @@ static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	case IRQ_TYPE_LEVEL_LOW:
 		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-gpio-mpfs-irq-type-e36c823bcfd6

Best regards,
-- 
Isaac Adjei <code@isaacadjei.me>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
