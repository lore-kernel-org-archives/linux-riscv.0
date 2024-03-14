Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D837C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Km7vUpqDT7YFEC/6bYQipD06xwY4UIzcNCEwFX1JWoY=; b=grHaji9Gmt9uWF
	KdN+1mRFS0lG9T+4aiPqxkOVSqy2s3/JenJ1yUjzGQj3EHmJywMXo/rAuGYNGrYfu4zRMr+jKjBev
	E7RI0IawOKKzVFbX9yNw2efVoHwcVIYLUZ6Ck5x7VvjCGV/aEZAeyzs049qcCC5v4UKTE1u+i8S0X
	dUIlvgaLr9Jgn4hc0oAQkBng9Vh+pNva0pHrZctymiIL0BizFgybWe1Tu6DZkIOJCJj6DB1S1wHb/
	EMX0ZnMD0Ksj4PApti8Tx4zS0z+GVtlX34ZP7aundjVWhU8olvyhg/J2RWe6RmFeEmJb5F+QxhATx
	xeJ8VD0gQyRZEf+O7ORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkib-0000000EKwu-3Vjt;
	Thu, 14 Mar 2024 13:01:57 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkiY-0000000EKvj-48Ei
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 13:01:56 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso773918a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710421312; x=1711026112; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iDGZqgspeJg4zHBRBt+Kw9aDW8biH7BvdhVXruVB8bk=;
        b=sfQWjR+Bq4Zilb0/9+jOnSrMnEhnL1ql3vUeyr4LpLtdFT1KNZLU56NmrgqvHgXBAz
         119bAHDNqe9gPzizYPnAGMk68XGIaI3LLO9Z/NNLSZNd7GuEqXYf2UUkMJInyw7gWPEq
         +NwrsC3pTangRLQLYTGd4spvH+Ie+UzN+LuP+IwMYW7eVqCRL2R+mFBDt8LKTVBZEOdM
         VuBzPynVXeryPmKEcVvpZSG070dZnJwPNXJE//ju2j0+2s7AKCVhQ3nL2N0dyXCZiyBd
         KJi9+9kfNTZduOlj/B/UE37EdqoMWlQY6Zzwhs2WwEzyFbLY6zTP5metRcc54P9kSBig
         T7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710421312; x=1711026112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDGZqgspeJg4zHBRBt+Kw9aDW8biH7BvdhVXruVB8bk=;
        b=DxLRBtWaOVSimJkZCNSdq0RDSOUjX0ISCvfOqHrLnmjgV+7857Mosnji6OeAnam8X5
         aQ8OnIzrVgc8yysZYInmNTdo7EO09ddTWHf1JS4C7z0hdlzERDEpsMf+kY/jcVNDbXPK
         sywicxvDL750Ylj+rhe5oXgZzJoacpjzGoYZtA65U8u44tBt8A03K/QZPo2HkXNyzs0O
         aV0ASv7k1xdZJ9CV9VN8Ej1bh+1gIOMRtJTM6Imx/JbZEV7nw9VO9nhPtQY+xRv0+496
         Y/JxRl7WGGSUPyM1vgn/t0DrGT0K1LqwDzEthfEA/ZDFT1KDPwBr/6tfAWMJpy1SoX4+
         DTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg8jJFjSpF46jErtv+VC/XiNwAVLwHOZvSShlx7OrrhIheIhRfXzZLSJk7WdxFA42PV9+r2jdLAIXDwMoAogO3z3BVM1ygdFf5rkMwr9eU
X-Gm-Message-State: AOJu0Yyvk10jZwOL1L6oKBI8lD+EoJ0vTERYyYGW8+q6T+AhS3ItceEN
	T09vRygDdjy+4vgt0pqRTO7Qti8fZ/YvdEN/aDhc7kpQgKmN55S/Jic36iTFPME=
X-Google-Smtp-Source: AGHT+IHjt7snZGgPOCt8pvkfGOPQoSTYOK6iBzHtdnCMGZYAw6ujBmBzK7/VkKchhqglE6LnuOXlCQ==
X-Received: by 2002:a17:90b:1008:b0:29c:66b1:a90e with SMTP id gm8-20020a17090b100800b0029c66b1a90emr1755958pjb.34.1710421311785;
        Thu, 14 Mar 2024 06:01:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090a2e0400b002961a383303sm836670pjd.14.2024.03.14.06.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 06:01:50 -0700 (PDT)
Message-ID: <65f2f53e.170a0220.bc3d9.17cd@mx.google.com>
Date: Thu, 14 Mar 2024 06:01:50 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.8-rc1-54-g2b2ca354674b
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-54-g2b2ca354674b)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_060155_086854_C2D6208D 
X-CRM114-Status: UNSURE (   3.21  )
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
bmluZ3MgKHY2LjgtcmMxLTU0LWcyYjJjYTM1NDY3NGIpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0
dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwvdjYu
OC1yYzEtNTQtZzJiMmNhMzU0Njc0Yi8KClRyZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0
IERlc2NyaWJlOiB2Ni44LXJjMS01NC1nMmIyY2EzNTQ2NzRiCkdpdCBDb21taXQ6IDJiMmNhMzU0
Njc0YmVkMGQwMjIyY2UxNDI2ZDJkNDViMDY1YWMxZTgKR2l0IFVSTDogaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAx
IHVuaXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZj
b25maWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2Nj
LTEwKTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3Nl
Y3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9m
IHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywg
MSB3YXJuaW5nLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9z
ZWN1cml0eS5jOjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBv
ZiB0aGUgYm91bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdh
cm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVm
Y29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAx
IHdhcm5pbmcsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3Nl
Y3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9m
IHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg
4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwg
Y2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
