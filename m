Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408C8C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 05:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EUbQLnbzeuTJTVm88f6xhORehXrTJuRmikXRLSD9b4c=; b=0UbmmAUmT8e2L8
	YtDGPXHSIEhKG2wQcjlGuhCOF8pbKHAHXU+wo4QvOu2rKSwiOqR2OJMjN92P+uRu5qMp9MVc9FVsM
	G9ApwSGfnj0hLUnsNjyiW+rk6KQA9fjjdM4HZx0cNRIsJZ01SzbquVjkvgZgcyuvS3Pn1PfQ3szD/
	f2V0C2ymG+24qMq0LgVjr7i5sVXf6Ec7jTlLdJJWq1dlhwrlsLEVYGzI7lLsniNcE6v8f9Yj3ae3h
	mX4edE9Fpq1MfcXOAkHN91RjpsxLpJ5BpThJmXitH/iNpH4fwcogHJTKjzw7yysaKgwnBgX/9MLQO
	QbB7CI47iEGJ+cWmeulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBSj-00000001zFR-3qGm;
	Thu, 21 Mar 2024 05:59:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnBSg-00000001zEw-2ysY
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 05:59:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so322127a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 22:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711000773; x=1711605573; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vIgBS2Js0yDtmSTSfIrPUFDraAHqcSq3ESkjQziDg6I=;
        b=24IUO7wxCkCFUAenrH0cQM4F03BNwaaPxOic4WilRxP000NyI8QvJgLpu+Ie8oauBy
         4isPNztUOTQINlnkWWGBQh03zNGTHyYNhvxdBEjUlJ10h4c4ZmsxluTVEufbXBERtFOw
         4zJUNjlaphxrgCABW4iiClJuo8gQ4B6kbNN0gk8PvfUtLW1inymGzFPR8kSr/Qtx2R2i
         9R62K12q8KNpnFe0n/1SM3zjRIKTpzOqOnss0PSG/ltrH2RQ8VU4be9BJ4dWNGApBA9i
         zf5iG+tpX2TGFpgy9QGXL9ChLq5eOJO0TeYx5aulGJkv5kHRVK0jD2Y882tOcun70kcp
         NJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711000773; x=1711605573;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIgBS2Js0yDtmSTSfIrPUFDraAHqcSq3ESkjQziDg6I=;
        b=MROvvMPYiwe8H0sOcTtctJ3K/hJyfOulyYLjQNNzoWJVCTbbJJEoSx3ElSLnJ7h5fX
         k554o50nRpVJK3OKF3Ykz1xHBYEElVCv8aFyEdx4lHZpSY38ldbQ1TAuiyit0gCZXghw
         IXDdaFTJnBQHwiwofiAJL3CHW2I01FIsCD5Cc6fNJs8vTrvfPpAYqDkm7Byoc7OkqaRD
         7TAGljHm4odUw6FI46HdMSbk02cOlPpCvYXy8ByZfAs6DPi3U7h3qlHUGMCgV2ujBlW2
         Vp1wRoIg3XqebpwoyC2ikL4BhncaodkPIHD7nbjpIWVNxBUoJrjlLQ45BmmCWV9Irz+O
         dDYA==
X-Forwarded-Encrypted: i=1; AJvYcCXx3UAnDvUFi/m6cOhGJuNgGJc90cYakJJvuo2hAS/UxHWDiLDnYd6Sg0eKnkdlxeOXE/DeaWCbJmQT1jJ7sCrsg2SP3Rvs0X7wENofl8LJ
X-Gm-Message-State: AOJu0YySaYbEX9tLoQ2e53xZKmuRTS7AiF+S+hV+iD5s3xTn/oGDaquq
	gWn2fErRSMfyKXV9D+7ER7t2eFRLOdrmxgDnlEyGBUKfeIfimYFyLaUQ92ZVQe4=
X-Google-Smtp-Source: AGHT+IG2fY2WL63zceh6jIxoeYJYEm2HfG+RyAdQasWH1kp1Z2PYs+ITBC2WgGiZ/tAqn/mgowJZiA==
X-Received: by 2002:a17:90b:681:b0:29b:c336:3b40 with SMTP id m1-20020a17090b068100b0029bc3363b40mr4984129pjz.34.1711000773217;
        Wed, 20 Mar 2024 22:59:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gb8-20020a17090b060800b0029b2e5bc1b9sm2699978pjb.23.2024.03.20.22.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:59:32 -0700 (PDT)
Message-ID: <65fbccc4.170a0220.52e1a.8594@mx.google.com>
Date: Wed, 20 Mar 2024 22:59:32 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.9-mw1-50-ga9ad73295cc1e
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.9-mw1-50-ga9ad73295cc1e)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_225935_015987_6EAA7199 
X-CRM114-Status: UNSURE (   3.46  )
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
bmluZ3MgKHJpc2N2LWZvci1saW51cy02LjktbXcxLTUwLWdhOWFkNzMyOTVjYzFlKQoKRnVsbCBC
dWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9y
LW5leHQva2VybmVsL3Jpc2N2LWZvci1saW51cy02LjktbXcxLTUwLWdhOWFkNzMyOTVjYzFlLwoK
VHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51
cy02LjktbXcxLTUwLWdhOWFkNzMyOTVjYzFlCkdpdCBDb21taXQ6IGE5YWQ3MzI5NWNjMWUzYWYw
MjUzZWVlN2QwODk0M2IyNDE5NDQ0YzQKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBh
cmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdj
Yy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3
YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6
ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3Vu
ZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRh
aWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5n
LCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5j
OjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91
bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZj
b25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NP
TkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcs
IDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6
ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3Vu
ZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNv
bmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
bm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywg
MCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9y
cywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
