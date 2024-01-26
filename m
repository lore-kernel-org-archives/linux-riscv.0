Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D66C47258
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 01:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iB4XSQHyW7oz/SFPiIdtAhndfSzVRXGdWu67hiZXyXM=; b=b6l32uJmv5t9eW
	e1bHWTOrhLSmKKh+bwd010wBJFWmLe1dTA3u4zL1XpLTKHIpWKbm9SdpXcpTIRj6aQWCtEHMJhr6/
	dZMdFU4WPRJpw9954yUUht3OGQ5dXPUhutJaelvZB4f4vq4hSERvolw/mTtPMqdAxp40JOE7X4J1U
	zdM7vb6ll2v9e9e91pazt3Aj8TYlTS9loZ3+w3sjp7K97+FSx6VXl+4DKrVhrzaJ0+w6I6o45/VDg
	Q6HlQevS6qhEk3d5FvLv3er2kI1+VVRY8GEW6caJJuiTomAOrTUD4C7LHCosGz2dVGl5QkjwHtrKn
	uNkfOdnMuFapBjzPtAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAsB-00000002jYs-1s9J;
	Fri, 26 Jan 2024 01:19:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAs8-00000002jXt-0gw3
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 01:19:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d71b62fa87so8383025ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 17:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706231944; x=1706836744; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V1GmHsjh+DfvOjX0elEe1XDsGIxCMmGQN3IDs7Fvb2Y=;
        b=LVlw1EqXr7XvxZy42FPi5mmiFFkg3/C5tgJnLhaXyihMesdIKXYU+yXTdVFbbYK+bc
         pAATffk2kd4KR3wkpIqgl8qAy9+Fm4hfzw+qTkf4pgdZ8sBMKE60HhuQWrsRbIb4UcTl
         bfKYphpcOm4xsVQITE9nrY0i4/So++wPe8kjVfmXyUmI7HBFkOAFE5LXTSTmGH7Bn4JK
         hgsFweiCCQAU/UFZdsGRcV6T4Yrz1KuLyIfQSfgeuXT9Ad0dlVPPy4vN1MS2NBK3y+Kh
         HmI6iDvmwK6EHydKcUQ+yjjNObTfwYfpSk5bw8Qa8G14SJnmYsBHaADTuG4J7uw4sMDH
         IYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706231944; x=1706836744;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1GmHsjh+DfvOjX0elEe1XDsGIxCMmGQN3IDs7Fvb2Y=;
        b=rGl77W59BZonrMOiWmVreqEhhm1ApfXBD2GH3pLxtp4T3AWXWchyjyhmAQ79MnCP0Z
         xUCeAwmXAPHGw8O2Coobp/UuphcVRyWMQAsAns90fqXU5JM39B92zAc8tIxc1Yu1ibsP
         BL13+M2Tdj6Esse0oqdXL+74f6vzjc7wjvC4r6rIheq3iEYKNIZ3cEdUmXmYWjNeTChp
         jmBeV0qlPpQRv832QfFjp8lBtjyEOlEG5enTpqrLA6G2Z7PkTW/NF/5XxJeTBoIDtXE3
         +jKy1+p99hzlb/AD9QLsG85rcoX5zgfte3420n24TGeEEr1Mgk8almCKmunJBTmv+gr9
         JGfQ==
X-Gm-Message-State: AOJu0YypwKnwYbnRE/wrfydkkS07u5dzec8X92hEyIZTaBcExyWZpl8+
	eYgv8zA/hz41uE5SJOmCDMasZ15m0zufcv80n54eedmvWpotE4+PP2Lc6ZSBZf9HiKTJSTNNCc9
	xGOg=
X-Google-Smtp-Source: AGHT+IGKF20BRrVP9c9Segdkl6bd3QV4qp8WLwslsXcQ1UwU08Wk0/BOehkElaQ2J76k1DUNs4ieEQ==
X-Received: by 2002:a17:903:244f:b0:1d7:8a03:e23 with SMTP id l15-20020a170903244f00b001d78a030e23mr254644pls.65.1706231943784;
        Thu, 25 Jan 2024 17:19:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902e19400b001d71923136csm111486pla.211.2024.01.25.17.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 17:19:03 -0800 (PST)
Message-ID: <65b30887.170a0220.b8737.05d0@mx.google.com>
Date: Thu, 25 Jan 2024 17:19:03 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.8-rc1-27-gcb4ede926134a
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-27-gcb4ede926134a)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_171908_234747_9C1C4F1D 
X-CRM114-Status: UNSURE (   2.19  )
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
bmluZ3MgKHY2LjgtcmMxLTI3LWdjYjRlZGU5MjYxMzRhKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBo
dHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2
LjgtcmMxLTI3LWdjYjRlZGU5MjYxMzRhLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApH
aXQgRGVzY3JpYmU6IHY2LjgtcmMxLTI3LWdjYjRlZGU5MjYxMzRhCkdpdCBDb21taXQ6IGNiNGVk
ZTkyNjEzNGE2NWJjM2JmOTBlZDU4ZGFjZTg0NTFkN2U3NTkKR2l0IFVSTDogaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0
OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBk
ZWZjb25maWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAo
Z2NjLTEwKTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5
L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9y
cywgMSB3YXJuaW5nLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0
eS9zZWN1cml0eS5jOjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91
dCBvZiB0aGUgYm91bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3Jz
LCAxIHdhcm5pbmcsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5
L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQ
QVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0x
MCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNj
diwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
