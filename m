Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2DBC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD9OYpvO7vJ5vKyklBftceBVeGjqp9dmmLAOufv8+kk=; b=ArLqofmAUqk0xc
	8nFtlhpbJ/REKR95QhjRXHxE/+Yc6Gwpkbd1iOmoRe4ZmLG6ajpTs+ej5n+zByshG0PmIwRvmFb8l
	SXbzlTt4EGpfaaXdQd1iNF0+IoGGY21J01uxMR8iI5xs/y/sJN/J0zSysu6bRz/G4lYS6Gai5PIu3
	8vXDRkJkoj4URU2RnWCrWEnncePDYGmvU4ZnwzdXJE/XJboyLH62yLMXmT9L9B5g62UC3hGZWMyK0
	BEMxVCOdUDDlh1M0jZ3L1rmVlfLlF6myEvVEuocPkHzfpDWC/CWYvGtvjoQzNe76JZXmEBLTcvoBa
	Z+1wDCNI9Nsy+fdlI8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgil-004nq1-Sj; Mon, 15 Aug 2022 20:29:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNgii-004ni2-CS
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 20:29:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so459195wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xr+UfO+qh4isF9IlG5bCz7LtZXBHMAXoplA9/7WZzXo=;
        b=W4xaU/BQRB9QDvjZod3/K3AWAoKIGLhJ9kSF6a1Iya5gjWDxGbWWn/dZ285MabIA9M
         ay2Id7daU2+BUbMKABA3ixnJor0fQfOk85SxhM22w47UmU/gksLCG4KajVtQfVRAvri7
         YkMbZ+/h+pF+dbho4ih9LjpsT6URElhZmiKctKEqOqehyEgr2Ew0L+uTpfy58iXpjCOm
         X3QIZwo2PtKT/6AldR1qYt/qgDL217r7mHpzBLNi8p1yyZd7pBF9XVyVoVKQWyVFY5yW
         Xk5ag8m8afmpc2Uipn/qL3gC55NG/b780t1nk9B0pVPxSREuswL5T6zhJ/5elaga/BX3
         iOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xr+UfO+qh4isF9IlG5bCz7LtZXBHMAXoplA9/7WZzXo=;
        b=3HtZwLGti9REJKT1SMGxWQEXlynpOPNRvEWwNMnhGTPx2t21loFlj24budtV9Swt4W
         S+9NqgTXMZkC9pE83FthwepehF0Moa8H1JkKlNr0GnZfx4CvHMazdAV7Y3t9Ot31yEob
         zYD+e7Hk8yIQTPrPJRw7OsZgAQauAkjqINXKodUdk4WuxbGjgtZhviuGQlsvmS44XJfv
         sBaVo3veMOAyK/ifIe5Vu71E2M9xkaQjvELfnCoKfTMHbFBivgkJWY7/hvnNuk+lhY+v
         zrZVTzWmVKpMy/ZS80nB49v2tp5306DpnnzTHqElvz/2nvNPJLoOLJEvEQB6WNbYtsTU
         FWuQ==
X-Gm-Message-State: ACgBeo3ldJQXJJE/3t6XQO1K5rjVqkattMrHh+psmrcbpsmvixY+TW35
	IKZ7tQ1AAFOkahXdN/Q6wdhSwQ==
X-Google-Smtp-Source: AA6agR7dfZyQkZTV2Qp0fB4jebLEk+ydPCl/oc9p/QV2VmrnbmA80BIWxTHmCnHaPLjxKiwjgswSig==
X-Received: by 2002:a1c:3b46:0:b0:3a5:a92d:9e62 with SMTP id i67-20020a1c3b46000000b003a5a92d9e62mr10852053wma.175.1660595391981;
        Mon, 15 Aug 2022 13:29:51 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id e10-20020adf9bca000000b0022515d9e2ddsm323905wrc.45.2022.08.15.13.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 13:29:51 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	broonie@kernel.org,
	nagasuresh.relli@microchip.com,
	valentina.fernandezalanis@microchip.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: microchip: add qspi compatible fallback
Date: Mon, 15 Aug 2022 21:29:37 +0100
Message-Id: <166059535262.2709508.15329793193826864091.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810085914.801170-1-conor.dooley@microchip.com>
References: <20220810085914.801170-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_132956_478081_A6DE53BA 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 10 Aug 2022 09:59:15 +0100, Conor Dooley wrote:
> The "hard" QSPI peripheral on PolarFire SoC is derived from version 2
> of the FPGA IP core. The original binding had no fallback etc, so this
> device tree is valid as is. There was also no functional driver for the
> QSPI IP, so no device with a devicetree from a previous mainline
> release will regress.
> 
> 
> [...]

Applied to dt-for-next, thanks!

[1/1] riscv: dts: microchip: add qspi compatible fallback
      https://git.kernel.org/conor/c/7eac0081a8e9

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
