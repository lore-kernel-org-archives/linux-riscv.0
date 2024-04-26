Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE68C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 00:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5V3swae8eJzmx3jBTXao7ZeXTN7jboPgHnCsT4rrvvk=; b=wTXSaj0pgQQs2J
	lf29fuKAHmPEx3MjH1gUntjSD8+69UgmUF+UcYsNiLE/tmHXZP4EIdW0Ki7BsUc/8FpsGu3Y206Q6
	yOa8C7VZO+/Vg4zVAglOKKjmozOfZP2amoQ8MLg6hOEOS9tmWw2Qn3DmIwIhiTLv3/2IsCSiSZs2O
	ZqDH1xElMy4Hv4+6tCJnT+FX1SMYM9IwVgTLG7slngRZnzsdcQlnHXn1WiKksE+hSi9s1XD+hjfuL
	TIolQ2RAirfZbMmNF8pCOYTe8NZnh992oMmzydg7KsXwYvi5MGXBtQv5h06pPnwQzW+2sYuJDq+wH
	FW/PeCGi0LxU6Bi3C5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s09bJ-0000000Aitf-23Fi;
	Fri, 26 Apr 2024 00:38:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s09bG-0000000AitE-1S2M
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 00:38:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e2b137d666so12243085ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714091880; x=1714696680; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ4o1hLO9/sJF7lyjt8ecifulF1daEklcjqMGjehddc=;
        b=JLrsJVtEVDQbghkTPMMKtSB9yG3DmBYlpp1bvzxx0cSGayG50Avnx36PmS1glUVruv
         JlFHwmIZQ1MJwchgtKjeMjcr8PUjl5atcMgJtMWvhBQVLSVJvN3p+rL0WD6gnD0RMqmn
         s55Wk0YG8hsOr3lDUEnSZuRK/AOjcpnkTIpQy7Q2mGMgG8TtHcwqJAZOiDp/uQqbWgYP
         92GeM8x/yXceEgwpvsbSSB9JQG//1/rKRYN8jVFFSwUcdF1Ul6+zff3ylKCcebFnJ5RM
         /Op5V8JUeD3RICk5nd27x6YZ19u2kzS3IW34HYF+QGALVC2Es0m3iGIwE4Frzk+aKotx
         aDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714091880; x=1714696680;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZ4o1hLO9/sJF7lyjt8ecifulF1daEklcjqMGjehddc=;
        b=Zcj160XSUtLJBrc0c9yCxulWqV5GSWkjqymdUd16CNT8JFgDJUfOA+D8bn8xRcJykF
         oFGQu3/BQ2f5MjDM/tM7vbXNNAPin1TFeqE2RyX6Akwlx2Z6LbuRvuFlHlDVOQkIead5
         uI1JOrxv90jREPCkKRV2dwoW7sa1e+2IRmD5zNWkYcBNbT4Vj9zQoil5x77st4kjLogI
         ATbCCsZSBQbUydpT4RAIUxxNFenFpRStCJk93XbkrFwsd2KuwVBHMvd4Rk1wdQO7CBCU
         fDyur5mT+yVDRl93s62l/qSGLr3aVXUoOAYpyRJTn6VwYkwz+C4+RflQ51YVXI3SWCPX
         0yYA==
X-Forwarded-Encrypted: i=1; AJvYcCUgOvV5UV1rwPrhNoqFEQHct8y4UYJ7R3aRYN8l4kYBejyupNL8UN+B8/MUA9DBwTuBH3WApfioM8IeKLIO+fpY1ixVGDNlRi0sq+SFqyko
X-Gm-Message-State: AOJu0YynTzDnaqwDl4kGXzSZD8exfn3FsMOyzUjOj6b6dDhEzMdpUPUF
	rUd7GyYu2js27HPpUW+rmZbMSvX6aM68DspXizj47ahZcnrOqcKVHjKfN9sy0JCwKmnDsePVq2B
	kQTc=
X-Google-Smtp-Source: AGHT+IExkLDWbU3fbYGaRCDbNiORn1hPM71CVmOeHxw2n3cLOiKp+Yq/HeAa7aFkuqqoi7sQ6mj/Bw==
X-Received: by 2002:a17:903:2b0f:b0:1eb:ed2:fe89 with SMTP id mc15-20020a1709032b0f00b001eb0ed2fe89mr138351plb.10.1714091880593;
        Thu, 25 Apr 2024 17:38:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902d48900b001eb0800e913sm132741plg.116.2024.04.25.17.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 17:37:57 -0700 (PDT)
Message-ID: <662af765.170a0220.45e9.0832@mx.google.com>
Date: Thu, 25 Apr 2024 17:37:57 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.9-rc3-11-gb7e3e84006b8
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 7 builds: 0 failed,
 7 passed (riscv-for-linus-6.9-rc3-11-gb7e3e84006b8)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_173802_656779_8ED0A720 
X-CRM114-Status: UNSURE (   2.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

cmlzY3YvZml4ZXMgYnVpbGQ6IDcgYnVpbGRzOiAwIGZhaWxlZCwgNyBwYXNzZWQgKHJpc2N2LWZv
ci1saW51cy02LjktcmMzLTExLWdiN2UzZTg0MDA2YjgpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0
dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9rZXJuZWwvcmlzY3Yt
Zm9yLWxpbnVzLTYuOS1yYzMtMTEtZ2I3ZTNlODQwMDZiOC8KClRyZWU6IHJpc2N2CkJyYW5jaDog
Zml4ZXMKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi45LXJjMy0xMS1nYjdlM2U4NDAw
NmI4CkdpdCBDb21taXQ6IGI3ZTNlODQwMDZiODYzODg0MGQ2M2IyZTUzYmJjNmU2N2RlZTJhMjAK
R2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
cmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCU
IFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg
4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTAp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3Ys
IGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0
Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmln
IChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0
aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNp
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
