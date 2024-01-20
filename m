Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB3AC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHTK0RbtBmEGOIIg6kDdR0by8s7Yk5DGBBPVSCih3cM=; b=0PBj99wmxwSDEc
	12Eg6Dqn3WZd9SqS+uzeu1E6mXMMtbCe+sPVGARih8Ua0LqjPDFfXmdLuiwyhfKygkd8nihfx66Ap
	cWVs/RHVjKonNfSvnLFAAnTclrMJnwFPdOkijFtr8AKniPIc4Yin7bQWKQe0SsQn4lDbb077Q1031
	U+gHDSpkOBxyLdp+5DYU4EWhYD/DgRBob9KMTXzKRT4FYF61Dwhhp14hwoqB0SCpeKjn789ZzBS8N
	TLQpGY7VabThwAkvsCnYEMFemTmDfH5EjXVLw/s90dVwkiYzfFK81KVgc0bTaIq7uuOGO+VXs8Gnn
	DkKWxZNNzTkFeg/maxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJxO-008XK5-1J;
	Sat, 20 Jan 2024 22:36:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJxI-008XJ6-0H
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 22:36:51 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5ffb07bdce2so6200027b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 14:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705790201; x=1706395001; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OKXSo3EgAC5s4LET2Bcix4c7SwF5sttT2XdQFlYEyro=;
        b=gpXQ5FZvbj/lWT3Jtp2tKQKbn0jbawOm5zCsr2YaLXKVvKFYGh7LK7RoZKlfwraSKx
         I8BHw6Kc7njslk858XGPWRnax9xnYsHeV7B/WnPbOPX0uPpeLMs3LVMMbJHGDLx+qK8Q
         a0qYGMHMfdueT+govcuHK4PAUPvufzVSFwVLhzGtKNtuIginD3sENCU/ttryfwpL0rOg
         b9NKRmZkcwYGINENJjd3cIzdjAyGtAzVkwPKIn1kVbwDJYhhuAK5v81gDcQ5MljYlQsa
         TnfSCW/zYgIkTt0NY9Ez2zPO3zsGtYh5+1Muh6mUeyvxLJTBZ+CG94lRFEXSBf8fm/Ix
         +0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705790201; x=1706395001;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKXSo3EgAC5s4LET2Bcix4c7SwF5sttT2XdQFlYEyro=;
        b=R9kNTtmaGqUJjBU1VWvadGjO3O8hVcrxtbvfXrWzbk2zsu6m3Rer6tkwZB0D5AGFvQ
         cFUB4Rh5y66HZvevGefEvAlKg/L/KwOkzgTTzvxhOvBbJ8/wBfWqsHT37KOOXMFMSUh3
         4fIjOVVcW9pFyGUtgP7OJqQNJax7R885/JJc+hi14F3jiMud+awJBGFQSq7FbcMDkSAx
         rARmjaG6IKRXDqaL8AxQk/vKIXJoXBsMj0mHwZJgaWulnT8Al5P+kOhndtBpilKHjAzH
         nKi/GqtWbQJRDGdE37nxfgFddCiY7Q3xGSuqAuZELGqy4QydsNlrdzvNyxul4hQPl1dz
         VI0g==
X-Gm-Message-State: AOJu0Yw8UrdBrq0dS0ND4euJbDgKlSSMzbSgI3YmAodk9FyMko+gGccR
	jyxdjfjAFOWM2EapvKPTZjduPfrvhkKKngou5Q9ngzbEA5A/4+yLEmwTSc5JwxjjG1SgozncHnG
	7ia8=
X-Google-Smtp-Source: AGHT+IHnV6j00ozndzE9x10v7NOR3zfap+1OXz8JOWLOosfIKGi5aXQ9e7HCarUVgGOew4TT6Kt5YQ==
X-Received: by 2002:a81:8684:0:b0:5e7:c181:e66d with SMTP id w126-20020a818684000000b005e7c181e66dmr2234500ywf.20.1705790201427;
        Sat, 20 Jan 2024 14:36:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ji15-20020a170903324f00b001d7164acf5csm3753856plb.120.2024.01.20.14.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 14:36:40 -0800 (PST)
Message-ID: <65ac4af8.170a0220.f82f.f4f4@mx.google.com>
Date: Sat, 20 Jan 2024 14:36:40 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.7-12908-ge5075d8ec5647
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.7-12908-ge5075d8ec5647)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_143648_152354_A6C6B243 
X-CRM114-Status: UNSURE (   2.13  )
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
Z3MgKHY2LjctMTI5MDgtZ2U1MDc1ZDhlYzU2NDcpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBz
Oi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9rZXJuZWwvdjYuNy0xMjkw
OC1nZTUwNzVkOGVjNTY0Ny8KClRyZWU6IHJpc2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJl
OiB2Ni43LTEyOTA4LWdlNTA3NWQ4ZWM1NjQ3CkdpdCBDb21taXQ6IGU1MDc1ZDhlYzU2NDczMjJm
YjllNjk5YmZiNzYzMzFjYzhlZTA5OGQKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
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
