Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71609C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FzcFeBdPqQ5pIffowKPdtrvvt1rs4qscbEabTXulRU8=; b=UJvmNU69ZGVWgl
	kuJjpJb7Voq6ipT0AnjEh8JgLneBz4rKroSpCnOtIq81h784mn+sGWcyhD6kGdSZYM6I2J4ZheN/1
	PHfAKQolrHl+mVxK7HKPzPxeWUfyg90fJEAceAO9OUHfiMT6QJtuINoJs1y1mG+PLIsVvvBbTceZ4
	ZDHSk+bR9dLs2XRiWs+7BLcm/GaaFvUkk/1+2dOJxKIrVFd6ShnZld008gGc01bWL/3QHnOX0i/we
	erAaSii2NlimHGqlPlgEDXy5VJ53gwGiiCarywF33RButPtMxfcGsNllBtZ7GIagZmkk+6ooSaqlG
	ehLM2NoXyFM86WDDkAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXzxz-0000000D2Ju-10Sn;
	Thu, 08 Feb 2024 08:41:07 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXzxt-0000000D2Ip-2LSI
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 08:41:06 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e2bd54b7f6so589729a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 00:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707381656; x=1707986456; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mSDx8EDa2WdCKq4KrOIKu2DCTIad1qk7DgBOlqYRiWo=;
        b=OLY49cRA+lZbiw0FRF2n0IufZAiviyVEVpuNgJR4K3rBpNUMafwsi+Jf01NiRSr+T8
         q4uxpmHU9SkG+IF1iFEv+WClT+bsRrk3C+bEZCD5OgRrbHu003hh8IW+p64zfy13JXH4
         OGWTCwmxn4mqvbeDr1GbfIV2UsDGq0lFqWrrBiHJ1CYepcDN0jHd47tvi9TXbkmf3vGZ
         RCziyflYYp0fKzS4jWaAFJi+Dpo4iOvW5b+R0iUOPG2QMyhegb7BXRem7fI6YmX9LK3k
         puLPH56iRVx/BCktvlb4CfMHPlcdCpaZZcn5KrmTX1YAzG76/23XHZHIhYJo1H7Z4B/v
         D0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707381656; x=1707986456;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSDx8EDa2WdCKq4KrOIKu2DCTIad1qk7DgBOlqYRiWo=;
        b=R8emn1aaQPAJAm0GKUf9GO6tngIS8el2Pr8D6OEIahNG/F2BJUX3rWJ8hOsyue6/mf
         UD7MLpi6H/ES9aPpOYG4gS03jJeFrVpntvYhCk3X0U1KwSMQ6Cu+eIzQQEBFNP4az5yo
         ZpY/Ne0NKSZc8yjvMRzragD3Cyj0GZzlpP6EjkkK829vXSFykjJOGHnBlqTUNR051JY1
         MbzBwIv346o8DU+jnQTvUVwXIfgTBgvHB5JMOwPWQqSKEdaEpc4toC/Au/E6vim3at7J
         hWe6H6jlGXBoQv2F7Ne3TQX+Pl6a8tkYV4oGlwgrkZeHCBSRYMi7nHzYE3Dh2DumVcOE
         u1VA==
X-Gm-Message-State: AOJu0YzsAM20B6kKEVwW/BMsm1eaWaJGYiB/nw9fn2gwKRTRL7Hd5srm
	RmL8a4W1mPzOgWf4bI8+t8Voi+3E8HIcy+UQQvawPrTKbvRRaOQiQ9Gx71M8EgrZKoMFO/9AIbh
	GqRM=
X-Google-Smtp-Source: AGHT+IE59I3guDEK5LwymR9XSydYYS2OIKCnSELNvAyTBk6ocKe/9+J75aVqtcX6k8ySLH5oBox37Q==
X-Received: by 2002:a05:6830:3153:b0:6e1:1570:d4a2 with SMTP id c19-20020a056830315300b006e11570d4a2mr10694226ots.33.1707381656182;
        Thu, 08 Feb 2024 00:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6m7f+D/lXvQ73ZzFzpSlLz7RDAFOk/d5/cXbuAcguNE3CMCfH88nhDmZZo2vf3c+kLYrYRZ2Uy3bCEJ1WqOqsNLqGcfpcpDqIrhLHbMffowd4tjBCm2M6dKxPF/x2mvEdXKuIpzplLBfmyUlxoQ==
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c126-20020a633584000000b005dc1edf7371sm3062726pga.9.2024.02.08.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:40:55 -0800 (PST)
Message-ID: <65c49397.630a0220.a432e.9177@mx.google.com>
Date: Thu, 08 Feb 2024 00:40:55 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.8-rc1-8-g3951f6add519
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-8-g3951f6add519)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_004101_815936_9419E684 
X-CRM114-Status: UNSURE (   2.16  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHY2LjgtcmMxLTgtZzM5NTFmNmFkZDUxOSkKCkZ1bGwgQnVpbGQgU3VtbWFyeTogaHR0cHM6
Ly9rZXJuZWxjaS5vcmcvYnVpbGQvcmlzY3YvYnJhbmNoL2ZpeGVzL2tlcm5lbC92Ni44LXJjMS04
LWczOTUxZjZhZGQ1MTkvCgpUcmVlOiByaXNjdgpCcmFuY2g6IGZpeGVzCkdpdCBEZXNjcmliZTog
djYuOC1yYzEtOC1nMzk1MWY2YWRkNTE5CkdpdCBDb21taXQ6IDM5NTFmNmFkZDUxOWE4ZTk1NGJm
Nzg2OTFhNDEyZjY1YjI0ZjQ3MTUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
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
Cm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywg
MCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpG
b3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
