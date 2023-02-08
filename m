Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E590FC636D7
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eIYhBGqg+OitXue0vwtAdC1YJL4JhXanQOybJXg8nV4=; b=UmC2omu18VWxvY
	/pAuV69naPI7tSJRC0TBbRiumWE0zcMKgTf/wik35N/4vL3ZxfyTCCalGNeO6JAfPCacAlNwWZ1YH
	QKIGcY1NYol2eqAO4p6JQb1C8HfK1y7VSb4MRA65GXCLZkbxvqadumuGwd+1yScb8YUZI7KDEozKR
	nSSypAf5xOVqCSZCCA5ZrvOiA0JoePetyTG59X7bfR3LjTD67Pf3NDSx8s8a8sVo1xYL1kVHRcACP
	lJ7j4N7P7yIFx/QUK+12e59sgGeGRAoQzS33IcuQOUNup1SSyEVnizxB5sMAwIKTMW+2UgC8sWmTG
	M/K+KHk36yaDx46tl9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlRY-00FuRB-99; Wed, 08 Feb 2023 14:29:04 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlRV-00FuQK-R6
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 14:29:03 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id d13so11478616qvj.8
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 06:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WE/gPMaBx/EpR5LKoE9r3aKinik7P+lmgz6oMIYx50w=;
        b=EOFxZlwAB1StI8zpJndrYVj7J0psxYy6yegyPIg3C2TulkuZGJm3VP14lay3pEE112
         V2Y8foL64OZMz3sW5kbvVrAXGZvu3op1WNS70VYOSURfuMNcSGNtCmjFX9rwcDk+mAsJ
         x49xaDCjBfZgcsTKG4P5z/xzm7p5cNhTyfscbCXaL/gPhEaHn90Q3Vjd0yJMbGZqWTzU
         SG/4xcDh8WVYfxBJutnljGxbV22nBKwhc0lX9cUOSakhTtljgbjP6sezHfJbHG+YHezo
         TkCAsZQZPHSI9hFpJIWipUA+SwyYLpVT+FBSFubUTfMCBahGNiFxMowfyuv60sGVL7QV
         ji9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WE/gPMaBx/EpR5LKoE9r3aKinik7P+lmgz6oMIYx50w=;
        b=b349/vED8SrGZQX/NEXuYRdc6iVUaeeGIhqew6qVovPNOed6kWxQ4+dBI90T5tjBp1
         jEx4n1J12k7vVk6vqqg6uXxh3gcveG0gAh0uZMrCRRCw37o0IhoBKmaEDQlVcZbvDLuV
         tWUV7X+M859F9MGpcsoBn9PB13CXW2m7WixG6JugFsilwuLQ/yFUg/yWxrgEY7dttHXj
         t/+t7a7pGZljc946rQEEWbj/uT2Opht3WzmzX6VZ+iY33zP/b5VKGSEwfr+bGEpO4qaI
         4cFUBvuIWZtWGhqdj4auMVHEsf9fHKQHxTMh4RJRbxW7gOk0BmYhqSUYyYlsq/XkViRw
         jzUQ==
X-Gm-Message-State: AO0yUKU88kRSPNvPz1ULgTwKvXq5RVrZqJNuBrCXOKpVBsTPIA/6I2R0
	lKjs18mgTo0mfsxXleEFQNc=
X-Google-Smtp-Source: AK7set9kjct65w5o2q9gAXAEsn6yKOcJGveWGLTdVDRJXy4Qo289gjhNhlft6R4OLwmPx1rF0VjF2g==
X-Received: by 2002:ad4:5ba7:0:b0:568:9110:d359 with SMTP id 7-20020ad45ba7000000b005689110d359mr10123799qvq.1.1675866539320;
        Wed, 08 Feb 2023 06:28:59 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id dw27-20020a05620a601b00b00706c1f7a608sm11762098qkb.89.2023.02.08.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:28:58 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] MAINTAINERS: update Allwinner sunXi SoC support entry
Date: Wed,  8 Feb 2023 09:28:41 -0500
Message-Id: <20230208142841.19597-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_062901_912259_9040EBE8 
X-CRM114-Status: UNSURE (   9.32  )
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

VXBkYXRlIHRoZSBpbmZvcm1hdGlvbiBpbiB0aGUgIkFsbHdpbm5lciBzdW5YaSBTb0Mgc3VwcG9y
dCIgYmxvY2s6Ci0gaW5jbHVkZSBtb3JlIFJJU0MtViBpbmZvcm1hdGlvbgotIG1vdmUgdGhlIGJs
b2NrIHRvIGtlZXAgaXQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyCi0gIkwiIGJlZm9yZSAiVCIgKGFz
IHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2gucGwpCgpTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgV29lcm5l
ciA8dHdvZXJuZXJAZ21haWwuY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMzYgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
UwppbmRleCBiOGFkODQ0YmNhNzcuLmZmMzlkMzRjYjRjYSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE4NTYsMjMgKzE4NTYsNiBAQCBNOglFbWlsaW8gTMOz
cGV6IDxlbWlsaW9AZWxvcGV6LmNvbS5hcj4KIFM6CU1haW50YWluZWQKIEY6CWRyaXZlcnMvY2xr
L3N1bnhpLwogCi1BUk0vQWxsd2lubmVyIHN1blhpIFNvQyBzdXBwb3J0Ci1NOglDaGVuLVl1IFRz
YWkgPHdlbnNAY3NpZS5vcmc+Ci1NOglKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21h
aWwuY29tPgotTToJU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Ci1MOglsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNj
cmliZXJzKQotUzoJTWFpbnRhaW5lZAotVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdW54aS9saW51eC5naXQKLUw6CWxpbnV4LXN1bnhpQGxpc3Rz
LmxpbnV4LmRldgotRjoJYXJjaC9hcm0vbWFjaC1zdW54aS8KLUY6CWFyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyLwotRjoJZHJpdmVycy9jbGsvc3VueGktbmcvCi1GOglkcml2ZXJzL3BpbmN0
cmwvc3VueGkvCi1GOglkcml2ZXJzL3NvYy9zdW54aS8KLU46CWFsbHdpbm5lcgotTjoJc3VuW3g0
NTY3ODldaQotTjoJc3VuWzI1XTBpCi0KIEFSTS9BbWxvZ2ljIE1lc29uIFNvQyBDTE9DSyBGUkFN
RVdPUksKIE06CU5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgogTToJ
SmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+CkBAIC0yNjIwLDYgKzI2MDMsMjUg
QEAgRjoJYXJjaC9hcm0vYm9vdC9kdHMvcnRkKgogRjoJYXJjaC9hcm0vbWFjaC1yZWFsdGVrLwog
RjoJYXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrLwogCitBUk0vUklTQy1WL0FsbHdpbm5lciBz
dW5YaSBTb0Mgc3VwcG9ydAorTToJQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgorTToJSmVy
bmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KK006CVNhbXVlbCBIb2xsYW5k
IDxzYW11ZWxAc2hvbGxhbmQub3JnPgorTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKK0w6CWxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKK0w6CWxpbnV4LXN1bnhpQGxpc3RzLmxpbnV4LmRldgorUzoJTWFp
bnRhaW5lZAorVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdW54aS9saW51eC5naXQKK0Y6CWFyY2gvYXJtL21hY2gtc3VueGkvCitGOglhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FsbHdpbm5lci8KK0Y6CWFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVy
LworRjoJZHJpdmVycy9jbGsvc3VueGktbmcvCitGOglkcml2ZXJzL3BpbmN0cmwvc3VueGkvCitG
Oglkcml2ZXJzL3NvYy9zdW54aS8KK046CWFsbHdpbm5lcgorTjoJc3VuW3g0NTY3ODldaQorTjoJ
c3VuWzI1XTBpCisKIEFSTS9SSVNDLVYvUkVORVNBUyBBUkNISVRFQ1RVUkUKIE06CUdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CiBNOglNYWdudXMgRGFtbSA8bWFn
bnVzLmRhbW1AZ21haWwuY29tPgotLSAKMi4zNi4wLnJjMi4xNy5nNDAyN2UzMGM1MwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
