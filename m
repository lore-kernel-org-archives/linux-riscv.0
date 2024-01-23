Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9419AC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ikNGTYtvd5lhpvq0JTsYVOBhUapa4lvUQ+EiwGlbUFc=; b=PLEIjFLD6Mqczb
	t2K67/yvdA1ETIaC+/SA210CvSZ7UW9KhvR4rzq+wQvq93R8rFYASAf/ZIpdnbG2Cu7VBfpQVyyR4
	CvU6DibdvLtPLVPsCMuJkXj/Llw0O3m+ztyshieET0Nqor+VCH5hsngUClqKdZA0+SnDc1cr2SiuK
	HMBGJ/KliwLsAIcDrlypGVF830a0cNuuu+rhalTAJK7AkFQ/g2LQw/bFm/J8c4Te/q6GG37bZ0I0q
	QoojA3XxoCVp3vY2oSmemto3FtlXmHRfpdu6CHPr1LXy53earOiD7gWCS5ko0RfI1WNdhyzmMYwz0
	rCydGT8hhvpePRCQoppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMp3-000JzN-1e;
	Tue, 23 Jan 2024 19:52:37 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMoz-000Jyd-05
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 19:52:36 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso3975743a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 11:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1706039549; x=1706644349; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ad5wBvzKlEi39hVB0Ye3ouh7w14dxBY08O4elrxj2fM=;
        b=prBJk2rskJtVny5nNWFlZHG1mpPr1NqbI/a/f1EoHMfNxjKpRFDZd9D+zrqbfeSj7s
         J4ldwhOXpYVTQs4lbIM/ee0TvSmFTEKhbxdx9629ua43THWNU+sNNVJy9+pgU4y2okWY
         x4jAKHWovxURWlssWmUUHDXgMMz0zooirQbDFLKSZHH+s0PTR/rkOVB/qaHwc7YS7JGM
         GA2ZTsol1/n25PuvWibaHMYkDXrEsCD/ub/fRkfIAx/93rUMqVrb4iGiJf3po0z+Bx+s
         xt/1WzZtObJ9kmIA6MuIizFrTfvUGshQyuQQGlZWS/KtKBYmh+3tSWrxK7srivwxtCCR
         A04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706039549; x=1706644349;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad5wBvzKlEi39hVB0Ye3ouh7w14dxBY08O4elrxj2fM=;
        b=Ex11/eFoSDSBJS+Q0k/K6Qbfv1fwhcRT7hHYwJAaJip9PrhsRDIhCWsXKeFj+C0WIJ
         o1JFaDFQmRkc19dpGNEjPm+paCUpi629RxO8MQ5uddhC9Im4N3aQAhAe47xf3yYs4PsW
         annZzo7n9QYZLb12bIyaprv8tL+Djw3g2C3NWDt+0iooz77oK08fmClSOFFBf0N7dYEL
         wbWVSCBFC7zM15EgXC8LGWZdtZzHSlThy4td7FhJzSqgOSk3KbvE7WX78wCi0our9CG0
         uZpHwHXeQayrVRnuCiouemuI8Z/mQRQY9YidmSM9+YXXsPWaMbM3LMeDLArIG8l5Te3N
         uMhg==
X-Gm-Message-State: AOJu0YzWoO2pPG/Igy8qGQ6vB7+1tEN0eudZBW4lKxbDuWpFhoRZamDE
	YR0AUH0z7YOKDPEjGObdw6EVI4jLCXJut55rSWL6ulZVambIWmXEdCvki//iuaU=
X-Google-Smtp-Source: AGHT+IF9GvN+RL98B+SnPtjCJACpHpVuOB1pS8PbCxhNyVZx8/8PcJg1A18EXp0IEG3x4SA7CReZgQ==
X-Received: by 2002:a05:6a20:878a:b0:195:2202:7b8e with SMTP id g10-20020a056a20878a00b0019522027b8emr6242398pzf.125.1706039549354;
        Tue, 23 Jan 2024 11:52:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t6-20020a625f06000000b006dd87826805sm204570pfb.75.2024.01.23.11.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:52:28 -0800 (PST)
Message-ID: <65b018fc.620a0220.2b51e.1822@mx.google.com>
Date: Tue, 23 Jan 2024 11:52:28 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.8-rc1-15-ge2d6b54b935a9
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-15-ge2d6b54b935a9)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_115234_057762_4BF21F1D 
X-CRM114-Status: UNSURE (   2.46  )
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
bmluZ3MgKHY2LjgtcmMxLTE1LWdlMmQ2YjU0YjkzNWE5KQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBo
dHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2
LjgtcmMxLTE1LWdlMmQ2YjU0YjkzNWE5LwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApH
aXQgRGVzY3JpYmU6IHY2LjgtcmMxLTE1LWdlMmQ2YjU0YjkzNWE5CkdpdCBDb21taXQ6IGUyZDZi
NTRiOTM1YTk4YzdkODNmN2UyNzU5NzczOGJlOTAzZDY3MDMKR2l0IFVSTDogaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0
OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBk
ZWZjb25maWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAo
Z2NjLTEwKTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5
L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJy
b3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDEgd2Fy
bmluZywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCldhcm5pbmdzOgogICAgc2VjdXJpdHkvc2VjdXJp
dHkuYzo4MTA6Mjogd2FybmluZzog4oCYbWVtY3B54oCZIG9mZnNldCAzMiBpcyBvdXQgb2YgdGhl
IGJvdW5kcyBbMCwgMF0gWy1XYXJyYXktYm91bmRzXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
LS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
