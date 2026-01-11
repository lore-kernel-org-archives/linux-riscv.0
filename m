Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA49DD2502F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cqU/61H60qMkuU59FFlJ98SV9gLPal0EEtfd2IlauiM=; b=KmjzCOWebgdkUt
	+XQjjb4e4KrfUJOGlXltFMt/wzkm9GV5uH7GZpYc8B5CHg2k8xw//zJVJu/0qiIfCV9ikOBlBaELq
	xpdcyWvPnpt1HPEVRcSY1txmB4ME78w0n2fgOonhAwb3yHM6elREANPdw7yKk4aUvg5ib2EcATdN6
	piSyqXdC7D1CL/VVl3F7/2cOP15gTbgVZGRFtWQJXVYZf8MTp65bGZX0Wvm6x9FyfiaN70y7HXkZ7
	ZzsoJMIZdczD6UUQTGPh0uq0782XlgLIax8vEN+Ub2kyZK3AFjj6xucBHhTHga3tjughpghyUgzOB
	PWw58pg8HcQik7XqD7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vepgu-00000003vvR-3jQH;
	Sun, 11 Jan 2026 07:16:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vepgs-00000003vv5-0lwt
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 07:16:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a09d981507so32389415ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Jan 2026 23:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768115804; x=1768720604; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1tirvteVVqNRzxv8RH5p/guBdYvlT413DYGII71lII=;
        b=Uz3jO/88XHow/WaVuQh8X9pa6iDso89WxYhYuMxdGjGgloPE0phfkvQGZ8kybaVIZc
         QX/JnOMjcUbD385pwTad6g+l1/49OsB3Ee4IhFAhr8zzCu7JpIC3/PwGa0a+sL5FwXj6
         HEGrbTFJX7eExNSGq++6F/jGxUW2eyw/LLNu/bvvD36PSeB/p2L55YSWKEjpW+WHRmjd
         yvg19Kh2qOqWu96C9/cusckFGhLVXpGpP5P0AnDE4FADrcpWPI8RebsIZzAnGMBVuNgF
         t7g9nTM85W7RNOeJu+VMXw/jmQBuPFABcEjMMu02UJEsOZaXp5gP+84a3ZmIv3+1FVo6
         PZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768115804; x=1768720604;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1tirvteVVqNRzxv8RH5p/guBdYvlT413DYGII71lII=;
        b=QqhkgkG1bvm0tOjx3/Cg8X4cDdYEMNtzFu8XM6ui/9p/mCU2QlnDtQF+8K9tXA0Yks
         u7DYn2dN2X8YJiJ1VaNmpn9GjklaKvfylvaUCvFOvD/t/WdYSX9PFLLWeVGApF5OpQXN
         OtEdz1UP7zl530zLnfHsqJWgnaLi2r2I7KQtTNFmJfQxUp3ETukFMZ0rJ/Yi+eB7TeXl
         SdnInbGfRsFp9PdQsDIb84jROUv4Qe7YYtgj5YYxyZxB20uX7HE4KEqlaRfsWasGK6fi
         PhAJLrAS6nLRvsDsvCOklQbo3BYNtHMF0mJjUyE0TclvTA06N5zJAS2v/2clH9CpMF0A
         nZBA==
X-Gm-Message-State: AOJu0YyMLDhsPmJc6dfsafBdeRnOzWhsld/0/8WrHwF7N1qJnGSfkVBG
	RbQNDdhPPQyOvQ3xq5WuEvfqySSj+D1ttGbNPWLbRHEq+LFAuXLCLLW+
X-Gm-Gg: AY/fxX4FCdNXGzWD8XlAXQe9tbKoav5uz4JHrullMOk0dGP2cmEqz4JK7YM2UD9VBuZ
	GxW7aq2g8Y9F/7+0vdmOTPI8TWA0QuC+zqvINMNpO8mYO1MjgZIQ+WaomfdLSA3xqxhbmiGZKVs
	AU54UO/1OzKqWcuf8cazJFpqaeOVddpmSIcYb1dSocG86kGC1+KFRvk4Ye69IP7c7rhm077OHHl
	QGB0EP/QI+T+tRI6zFN7v3W4yLXOPDtobDne3CfgSqXXOCuqgnvp+PNh/xMZg937fvjB+irePIw
	2RDNFXH1TmWB3bp05j0tjE5RS8FhgFO4sBdm5NEByzHj310EJ7W1QQUqQAXElvIhh8v5fUeEbdj
	yQJBXUaobxY050XWluaZX76A0OkaH+aRQSZvUnJ/0gs3AhvbS4x2vI/f9PHr1GOhFu0jdV9l33Y
	48xBfXAzn4pzIQW9PH1lFeadXoeOIfwMuZKxVEJSsOysh0BX3RX/cp6MP3359Vib1ENRZZ
X-Google-Smtp-Source: AGHT+IGZm667RPLQia9HoFoTJ2K+vQGsDFzKQoD92vBJluj+/b62ke4K4DhfvzelZ+CiRlpVmGyvmA==
X-Received: by 2002:a17:902:f791:b0:29a:69d:acdc with SMTP id d9443c01a7336-2a3edba6425mr140815665ad.25.1768115804354;
        Sat, 10 Jan 2026 23:16:44 -0800 (PST)
Received: from [127.0.1.1] (122-56-204-36.mobile.spark.co.nz. [122.56.204.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2f8asm144738325ad.57.2026.01.10.23.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 23:16:43 -0800 (PST)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 11 Jan 2026 20:16:13 +1300
Subject: [PATCH] riscv: defconfig: enable NLS_ISO8859_1
MIME-Version: 1.0
Message-Id: <20260111-nls_iso8859_1_y_riscv-v1-1-2c992bb2c00d@gmail.com>
X-B4-Tracking: v=1; b=H4sIADxOY2kC/x3MQQqAIBBA0avErBMaIbOuEiFhYw2EhQNRSHdPW
 r7F/xmEEpPAUGVIdLHwEQuwrsBvc1xJ8VIMutGmQUQVd3Esh7Vt79A9LrH4SxmyQRvtfbfMUNo
 zUeD7/47T+3696gxJZwAAAA==
X-Change-ID: 20260111-nls_iso8859_1_y_riscv-6e8f262cc7da
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768115798; l=1917;
 i=javier.carrasco.cruz@gmail.com; s=20250209; h=from:subject:message-id;
 bh=2KisexXb2iMnyqKRuiuSKbq5Ytaq1bdEeOJOFTgQ+aE=;
 b=vjN1rOziAzN7gcn9Nz7qwx1dl5t63pNW4Jj5cQj/uZi+yvl+2rBA6SDTGJnDWlKTUsA5HYS0U
 wo4M47Kqo8MCYB+qKDt7FkzZfgkUavfnx08wWRbOJIW39zfmafZ47j9
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=/1fPZTF8kAIBZPO3D8IhqidB0sgYzPDkljBZXsXJZM8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_231646_269123_3CF2AEAB 
X-CRM114-Status: GOOD (  12.46  )
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

NLS_ISO8859_1 was enabled as a module with commit efe1e08bca9a ("riscv:
defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1"), but the
NLS_CODEPAGE_437 counterpart is selected as built-in. The commit does
not explain the reason behind, and it is not consistent with the
defconfig for ARM64 that also enables these modules to mount EFI system
partitions.

Select NLS_ISO8859_1 as built-in to provide both requirements within the
kernel image.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
I stumbled upon this while scripting commands to launch
qemu-system-aarch64 and qemu-system-riscv64 with debian no-cloud images
and -kernel to provide a defconfig kernel in both cases. I expected the
same behavior to mount the EFI partition, but it failed for riscv unless
the modules were installed/provided. That didn't happen for arm64 as
NLS_ISO8859_1 is built-in.

If there are no good reasons to keep these configurations differently
for these architectures and only have NLS_CODEPAGE_437 bult-in, having
NLS_ISO8859_1 built-in is more consistent and the EFI partitions are
mounted more easily. This is the only configuration that had to be
modified to boot Debian 12 and 13.
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..5ca534a51809 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -295,7 +295,7 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=m
+CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_APPARMOR=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-nls_iso8859_1_y_riscv-6e8f262cc7da

Best regards,
--  
Javier Carrasco <javier.carrasco.cruz@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
