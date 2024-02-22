Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54F5C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MqegGlYUTmSYR6u5L2qSwOnks+TeGA2xf5kgE/RB4Hg=; b=U5de+7L02Zj6vJ
	wZXgr8EqtIiWY/S5xqXAut0vQwLS6WqFVr1pqBwzUUQhUQ8id72kLgtCXzpaUrCZp/WkEIzTRPdG7
	9m49Bntf4t+RLV7Twfan4XM7BPz5lQD8hQTzHFsiM+hLu9ABb9Xm5T4hjRU/dJq+ecn0zk/vnNDip
	SCDOcWkXb76Dd/pbZU83sf4VPxEe35ZHdBbywDLEoVokD03RjCISxFRZdMVtSinoNFN3Z9QnLQg6m
	FoSjD+Uayp1+Ep6FpnqLDjLRe9CSvirqMPkGLAa2xxRhlrKwh4bsTpInEjYvkHSiBahBld6T1z3mU
	tCXmuM+dkwAAta45QhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdI4y-00000006u6x-3PQD;
	Thu, 22 Feb 2024 23:02:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdI4d-00000006u4u-258J
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 23:02:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso185047a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708642898; x=1709247698; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qilnjnn1CdnEz/3UO7SW+RZnPvCPqORwd7Jo2aJ81so=;
        b=2Fn429mNeqT/ogxauzlIzyj+rMoDA86eF+5GOHTyU2AIKlQLT5nl1QtYF4A6bbzyUC
         qPDc0bdNEWpnSOQKp3vq07/QUQeMS7WPUs3BZ3qwNo1/XXAIOJZPwYk8gKgfYmHrMr5B
         IBxxrCaVESOiWMUZRK+iZ5MnrtYq9k8hub7snAE9NccMEKPHwMmGmw8xsWraCyMHYeC1
         iZLvSnNF8oa4zgmyfXzzqGZR1NPXXtqbbQMw/o8k1+PyAbmR49K7NkXVn+b6jSWjxBBt
         5hDecHoP1FV1o6KaFEoN+G1siNGQRRZYZ7+ey57gxS/cKu8aIyktbmuH0mPkJvVb5CzR
         DDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708642898; x=1709247698;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qilnjnn1CdnEz/3UO7SW+RZnPvCPqORwd7Jo2aJ81so=;
        b=E81e/+Lz41337fz03pEN6czbgTQYx+wyxIo8SuQ/TQo/u2mTAwHWofbo8AKYpJq4o9
         ATQLBEZ+mOsiOI+l4R34MdR29jgB+hoPU/LfJ0Y1meXBIpLFMfVRFmeJve/d7gUYhDvs
         9IV0NRSoAr/8LL5xlcuWjUFlzY2ME7CVKWrbqqwBCjN367PCgmt1LGF1Sm31axuVMWs6
         DZtGMdJfFCi2w79dkst6TnK4K248/GmZfQQRw6sAjSCs/lGTqQxASnHOe2OlgJEiiuva
         D/XEoxebOuio/bFBpmUfZkZcAG2j5GAhsy89G/hNi/0ECDlZghSG7YvlgNH5i6zvqqNS
         it3w==
X-Forwarded-Encrypted: i=1; AJvYcCVeiEVfugZAETjkpg00BXZ7Hnq0ac4rSgSnTrTZltJ7a30/jTZDC9EJTkyHzkW0py648u8xezeYtx/UPDcxneKDAfkpREIpj2jieuqCy5v0
X-Gm-Message-State: AOJu0Ywgh4mmFAmPLOhbQva8FOxcsE14+yGiRPqcGGB8bIztzZZPJZEd
	QvMIdEUwGNX2LqG44qk2M0kmZXc2g+1AyJ61ZX22jVUkmzaT3zhM17s26vLtzhg=
X-Google-Smtp-Source: AGHT+IFnYUoT9zs0p9vCcWNM57jMGUo84rEv3U73fEOthpgHNgbVHSAaX/twlLJx58G3irNH1yIk6w==
X-Received: by 2002:a05:6a20:c78d:b0:19e:9c5f:ff04 with SMTP id hk13-20020a056a20c78d00b0019e9c5fff04mr304806pzb.20.1708642898191;
        Thu, 22 Feb 2024 15:01:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q20-20020a63d614000000b005cd8044c6fesm11021451pgg.23.2024.02.22.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 15:01:37 -0800 (PST)
Message-ID: <65d7d251.630a0220.71ca5.5f70@mx.google.com>
Date: Thu, 22 Feb 2024 15:01:37 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v6.8-rc1-33-g45e0b0fd6dc57
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-33-g45e0b0fd6dc57)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_150151_751315_D2834B19 
X-CRM114-Status: UNSURE (   2.21  )
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
bmluZ3MgKHY2LjgtcmMxLTMzLWc0NWUwYjBmZDZkYzU3KQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBo
dHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2
LjgtcmMxLTMzLWc0NWUwYjBmZDZkYzU3LwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApH
aXQgRGVzY3JpYmU6IHY2LjgtcmMxLTMzLWc0NWUwYjBmZDZkYzU3CkdpdCBDb21taXQ6IDQ1ZTBi
MGZkNmRjNTc0MTAxODI1YWMyNzM4Yjg5MGRhMDI0ZTRjZGEKR2l0IFVSTDogaHR0cHM6Ly9naXQu
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
