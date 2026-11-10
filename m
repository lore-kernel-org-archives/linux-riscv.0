Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61D606A33D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k2I+4AfE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3g1Q9JH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5jwE+3qsWIFa1chqZf0ufjBUBNTaIPV83SoAQezs3o=; b=k2I+4AfEPLhPyNVvt37D7dY3Y8
	AqLW25947LsJFiJXg6mk1/XxWqhpdBM3bI+fuDzXu41vev66iy6JuATcD6mJeSCQPIM8J3Q52mRWL
	+GdIoTVwtHSwRIm2/Tao+SpyL3NX5A49JxnxFCIaqcAVkl3XOZ9Hd23m49wG8skWlW4qrGnu22yR9
	ypwaF1DmHmbKxlI+IHLL0WNr13TOHa7Nzmydt9bJLCBO8ZhCvJOhhkwVuClhW1LO6vJ6TkepG25qH
	jFlAOW/w7zG23V7zyuQTJtuGVy00Fm+En5YUPPf0mdqBojhpyUtaLDeN6q2XH7Z7vy4TJpNcqdbVs
	cuSK9ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwU-00000002jkc-44Hq;
	Tue, 10 Nov 2026 07:06:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwS-00000002jje-20Z8
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:06:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso777076a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294411; x=1794899211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=f3g1Q9JHCKlwvWb3EOys/Fybd1za71xRQfP6j5wGmMfZpjOq77Pn3E1do3pmBiNUU+
         Aq1jCr8efZs3mfd+1qA2NCG8E9EYeTpD0ynQkGyrP1OX+407ueGrrW/1+u7rEwEoofQD
         nYmvaC0c3mbCsuPvDkqUiTLBhbuWRdQyfb/bBj4l6/epABca+npZvMu3WVv7JHmS8Uiv
         3d+BNPrDvYNOOtJRqckTeayH4FwMxl7tk1ZPYcQLEzxnwynRjHM/2/ZFAiwlr6htFgnO
         3kI7mpXk6EZdtum2kS0MOFsp7p4Ty+TKKlpwzFJOQ6J1gWAFSuK6h0kc+b+DyW65w7+T
         Jo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294411; x=1794899211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=xXq8yHJNBLenMcBYyK9Imlk49VqGJ11lAD3dfdpHOSs/uQrGgmSeUhA71k0MEK0xj2
         LRK++yYWW4OIohtdY1OvBTHh3eI77Q6RXikt6pl9A007evxEZu/UG3DLlCacLIPO7iGJ
         t+vsVWKHvsfaUjTK9DzAyNO58YP0pjQkaIzavSeymtYP7l1jC0wZYw2ZQU3zC2eoWo5l
         aiSq8GqjpeJtmTyooxPojQI3SGJyt1WRvsHR/o/iuro3EvieGL9O4ZvYJAW/sVomUWQR
         EQ7ARcBi+iFOsWNWOzM7BZmg9b8HGLwsE2Ev2DdwW3ctxA94XbdLIxhGrgsrB8rLrk1M
         dPrQ==
X-Forwarded-Encrypted: i=1; AL+hErFUOxn7UlerW/8g7v1LlcTSLMzTPZjgTJfzh7NcrvDb5hK19FQHYfbYNxEAu0pbtttSJp6aK/+k+9wztA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8V2p7FIBezHUnxSxS53SptBRRTotcPm59zHyUzQvqJAv/e8vvU
	nmhfLoGC/PURSyUhZ1zORHgwdvmNyxPX+JLhNAzZlDrndYSJ0TFwLtfR
X-Gm-Gg: AYBFou0h9lcKE/UDUfis+6mBMSevsiMWnnpOyX8GK6QUpsWOUlO1+v77jl3qBOWMN15
	Cf5vp3BwLUQ20HaSR+FrA4LWmZKW97Rkngk6bYr8kb1KMqBZLQ7auoGU7+ePgXQ8WjXmc0au09p
	YQ2zsY24BJgF42/QPMpAcaSt6RE7NFFrqwtE6tqxRYV8g7hOPO7TGC3IF8PmOr7uEyjnzOn5FIt
	vNe+LqFGPLe/59VzNyRi8sOb8F0bgR9Ul1G3mozh5GgyY6dLQLTGlQ9DGXhG5Uzklpe0IxOPpbH
	FexFK6f4K3EOBACdDhtTjfjj5JDIM9gJv/YJLOFA2YqywC1Tr3sdnTjTeHJDwMJTbjMFcyuzNeU
	uZC+aVbRDqokzxL6vZtbVMap+ErBuFUjz/WsUWHWFZiwW7evpg87VVv30gf5M+SBjUCQCJ1pH6I
	xLih/jgPmLxbRJbwt3GucdnUmqTTPyH6XbExMgIn/LB+lgQknYnUtesGQszM0w9Yr1nnXV/1tIi
	CVd79Vff4iwQFwc24Wq6L12dm0GeTlrc/QZS6k4v6yBl+q+CE4gduYY9Ic3hDMAP9Ro3tMtgtrw
	uCGSGU8OpijitbHND9BdtRcU5vBCTtrWM9GI+/BCaozgbb6e
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr1909705a91.40.1794294411341;
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167918e94sm2647121a91.11.2026.11.09.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Tue, 10 Nov 2026 15:06:22 +0800
Message-ID: <20261110070627.217946-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230652_541980_88D3A6A4 
X-CRM114-Status: GOOD (  12.46  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
