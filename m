Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26B1C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DpJu4JbHsqo762TZk7rNPiei3rd4NZoU1fspGPhGSAU=; b=w4xCVxBvRIbr2x
	3DDJKfsi0xth48TQ5wWgNXv8ToAmhGerhhjwRlYRd7AZoCxwcaZAlYkKgd7FJ/7i6MsWDvklj7mrw
	/dHTw1dQQ2n4tgO0nlrcfxFQXSFz5z+D9P7+Ygc5TkfFZIzwFQNuv0MLfDUfen2zg9pXmMrEGbCc3
	T/p5tfIAqtwEAduBsenuH+hyavIYu6D64WdtuOvs4qY05xgVbDj0zy8fOh0Odf70UEN6dSfaNTV3T
	Ud5LVFznC4oJ+sDOB3ZXfa+cGYNscKS0Mf83iG0bhMS2+km6c2X8lmclLd2Unk1MzgNxhQZOgruQq
	dN3t3tPzSMQiMsKLtDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn5fN-00000001II3-0YgQ;
	Wed, 20 Mar 2024 23:48:17 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn5fJ-00000001IHZ-48wa
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 23:48:16 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-229a90b7aa9so246502fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 16:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710978491; x=1711583291; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ui0gjw01dQ51yTBK8j4JQS1UnA0+wjX5WBEGHBUK/Ys=;
        b=y3K+LKBVmIkBtuZd5GnTI1w8P+M7A2G2gb4Ci6qi+BYb9M4F3o0IZuTSgB7wp+6+vh
         U1SYycYenVYX55D4lyHgWjnlDecgJyI3H+0eLeoKrzOfe4rTA0p1r9ZrOoLD/TC+SZqE
         E27Iwj6X1uMJeSYTCqFWobM2W4GYagC8pd5tY81kZjhSOwia0EV9JtG3c0ndO3MmGvl4
         xhNAvNRohyM/g1etF2VBdI0ELyspaLHSoagKx//E1AO1ZlAwEOyHB/JJuBkabELnLVvU
         Ujqh4q4hoNNuJGumIE8y9U0UV1pZBLBPFtwrxo/2dZb3ygc+5hj7KvfTKaJu8xFYGhW/
         guuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710978491; x=1711583291;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ui0gjw01dQ51yTBK8j4JQS1UnA0+wjX5WBEGHBUK/Ys=;
        b=I0v2gX1vAtlSrTQW58tntPTlRgVNQpxyQvW7NK+yPlCnZG9XbZU4kjjWQ1BjHffwwm
         ubSpXL2ihu/leWWpIvzBACAwX5jlESFfZ5wpq+pyi07H5MZxaXXIoUOzLusCZjve+XkN
         AJDrFkQVVeHPoCVzRh95r74ZOdNQFkKbBEFeailUCThKlh751vB/0MGqXR6684J+iw5c
         uKgA+du9S4mQdbDQt4ykq5nBi0PmwPjwZrXFMGmZ47T98ucNuoOCrxPKdKfZw+Pcp/Sm
         eXdNmZR9NfjJ4OxGM6oiEIGKZoEpYnESGsL23nvRUGY0uc8GFAoh56HbziATgiHk2SU6
         NF1w==
X-Forwarded-Encrypted: i=1; AJvYcCWXdnc7twSHLVmI9JaNDpJ3j1Mg+niC1DVl2iyAvClcMzjBLGjVruBcVqBlGIN+xnjhnaZOQVu4+4sYTLY+DQ80qSh8vC39RF8guFPa7eid
X-Gm-Message-State: AOJu0YxhAkVj3AIHVkFIRz0W9MEmcJlV3r78BX1DsLkPo3RPtYBdrliw
	1ffgRVa08+VZ+tLUes9OA0lxCpX4j87jIKl4bzJdySnDQeWBLGg1OxIYsR4gOEt0icudcPtVnbp
	ZzVA=
X-Google-Smtp-Source: AGHT+IGyp1XFk5jEQPo1UEyMVNkmnwwJf6Q0+lSrU9GOxWlFaGOED0Kn6+6UBsPA23YAyOQGJZeI4Q==
X-Received: by 2002:a05:6a20:2d0f:b0:1a3:3cba:816 with SMTP id g15-20020a056a202d0f00b001a33cba0816mr4505539pzl.45.1710978090332;
        Wed, 20 Mar 2024 16:41:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm14283118plh.249.2024.03.20.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 16:41:29 -0700 (PDT)
Message-ID: <65fb7429.170a0220.65606.b310@mx.google.com>
Date: Wed, 20 Mar 2024 16:41:29 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.9-mw1-49-geeb7a8933e71
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.9-mw1-49-geeb7a8933e71)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_164814_353360_7735E6FD 
X-CRM114-Status: UNSURE (   3.60  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fy
bmluZ3MgKHJpc2N2LWZvci1saW51cy02LjktbXcxLTQ5LWdlZWI3YTg5MzNlNzEpCgpGdWxsIEJ1
aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3It
bmV4dC9rZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOS1tdzEtNDktZ2VlYjdhODkzM2U3MS8KClRy
ZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMt
Ni45LW13MS00OS1nZWViN2E4OTMzZTcxCkdpdCBDb21taXQ6IGVlYjdhODkzM2U3MWY5ODM1NDUz
NmMzZDg0OWEyNjk3ODUzOWIwOWYKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNo
aXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0x
MCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJu
aW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEw
OjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMg
WzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxl
ZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpk
ZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5nLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5jOjgx
MDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91bmRz
IFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25m
aWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNl
Y3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJ
R19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEw
OjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMg
WzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZp
ZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdh
cm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9t
bXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3
YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5v
bW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywg
MCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpG
b3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
