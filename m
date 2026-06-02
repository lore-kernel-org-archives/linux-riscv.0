Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999CCCD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0A5vbotgGlYTe1HtwhEvrRWU5Vynyu9ynhjeuCUwPY=; b=N7Y2o6N9uRveSG
	ANJkphZJUrae/5eyIarKHCKyoIB2LEQ56YUh5dE96Zjn5v7VSGtAY4fUSNyCecgb2MSVlxWIKUOxa
	rI7Y1ihTOt43dvAUqRKJwQmLL+L0/df4BK0zZ2+0ZCfPP8dD/rdj0KKC7kIxnXnCE1mpRZEfj6tbB
	ew0ym4ddG+T68GRaO+p0zJ80ORIpg2ed7WeIiqN71z1NPFeMpoQQMeD4Zl4wk381ZoeLCg5uG6bXz
	MRL0Qy95ecSU4iXYXr1DCnIsnv9alIKkH0opoLIauTuVY6633YJ4Qamu4IFVghcpsgRYsN+n90ZIC
	110wH/e8X/CvqCSkWF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKLT-0000000CYDl-0Wu9;
	Tue, 02 Jun 2026 08:19:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKLQ-0000000CYDT-0Y5C
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 08:19:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c858d69bde9so1168759a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388367; x=1780993167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=baPgPQ4M6fj72y08SMSzP06YnH5SCIgr5r1ru4ZDW1RnzYtdxcjn+EGH8LXRFANujw
         MMA1I7BOoL/4eLZhjp6333jspafKZaprNw9nXsKw4O8IL/4H9/SPTIxZCI+jU0w2af09
         ei0DY99+0psg8cY40U25zMlz6KifYAUwB8PWnr6QBY53v4Ii/mt/8E3LL+F4CITLVdXC
         b89Yaqw1lv9VM9LMQq3HQR44E/g6QxuVd27760TJGlpwO8OxMLlCxZb1cLpttL2n5B8I
         l+jZw0smuiqmgCGOcQ2ShV56SpjHCAEFNZvI7emcA/7pmCI8dhLT9/Vot29k2NXE7TVz
         cw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388367; x=1780993167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=UIIuT7USUp5RHeESWmydrVDwr/fu2Ee/L4qehsT3WHBMaQXgWrq6C9mJPczxvwUWSw
         IcLjrJ1ceDolD2ycTqGl+PC1/7V/2rjgfDgOWoKzsd26fg1BPJ7sm0WDdR7A96skdYa8
         aou6N2Avz+JIEEXZBSvjRRfZ3VNBQut5ky4KV/iQdaJcq+tYfWKcXRc1WKQILkLcgcXm
         QXC79L7s79Tcfr+zzuIZLuJG59E9M2Hz/Sul9A6RiA2VkAz4WDwARL+WQJaNdGUvS6IY
         uDvql7Feja03f3gckyio2EiF+2tif5dUg6AVT50fDyURVep8vbbKFV0Li9t/yfMzcWbD
         +VFA==
X-Forwarded-Encrypted: i=1; AFNElJ8xhAfhCghcDqVXt/ePGR33WWGWwdRo/PuuUg59uv7zzPMk5odNKjBbx6hv5diVOD1MJvvo5YlTkQZ54g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYqKrAcx0Wwv06yGOWfi6RRhNzrnp85ePWvXNB2OcubTPTYWuZ
	ZRiKhpJsjtggiT6vlhkn0oI8pmoiPllF46W7eazxVprjqrgCn74D52Wz
X-Gm-Gg: Acq92OGtDTaxzRBJktI9s1CZD162lcJQ9dI1ZKLiVl5Y/6Zwx1Z/GDG+8R5qxo30+vn
	G7S7pb8l1BvUn86lQ60SWz67wRBAZ85s+b+2MS/DaNpZLRcmKknFVLzuoN3UGfKO6yO99RGqw4I
	kfbgh4cimeE8JWOMkOsJfEE065PpJ1mJRSJwVCDeJvGekKdX6FfLyP16Z6ffG61enIND24ygJaR
	UQb6G2dbD9G+vzLg6DyxgKdjgxF/JK/M5+03ghXemQaUKxA+qEI/RH8Obqz8M7AsVRehZXnRYPU
	9TMhQ8PavvKCMQsC1DGZJEowocu7ONLALsYeBKy8A6fxQxWWmRDIFhmBrW2mzV9NSgPS2A9L4Wa
	y+nMSiaqE9TpKtT2LldpnH3kf+mNcBrmSk82AohHJ1VuDDNrmUoo+LyGIzLdGiyBysJIGWoGMfx
	6J6B6dB7VN8fVNgEk9I1ogJ++qC8t+UnU0jDgj4woEx+Ag
X-Received: by 2002:a05:6a20:9595:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3b427be8514mr16806476637.6.1780388366793;
        Tue, 02 Jun 2026 01:19:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c858108940bsm10413308a12.5.2026.06.02.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:19:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:19:05 +0800
Message-ID: <178038833103.2088679.3632311874557644565.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_011928_186804_813D6A20 
X-CRM114-Status: UNSURE (   9.25  )
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

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
[4/5] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
