Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F500C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1Iq606BlMg/WrwAR62bwC7DUbiomyUe9/VN1nDRXXA=; b=cNZMJOrauk91Hb
	D4l64kyARD6Z14QFLte7bdK07mw+AOwmrogCTYs0+ZrKE2iDrPuQ328Tr8R6EGeK8jYoi68rb1CMM
	IvLbmOI5lTVMMtPh1zRwBPAXUej9zmoLAFT8422NZ1kDVsQEyJHlxjs4/CR8iQk5Uv4M5dwxCncTZ
	KUsQySqvjwJu8tIqq8390/BsljbGWxs4Pfur6oilaYgbSsSgcLYOVKSOKRoI4SGyIRxQajWVjus9o
	X6qo1tlM+lOWkMp2iBI3vXwZBFX4wOnFy2EoGglRHzhKptQBYSYJM7g64VL2GEpCDBMOEQcEHSK4q
	uTVIi9jMIU2BAr++b3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naKLS-006aLF-HP; Fri, 01 Apr 2022 16:41:54 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naKLP-006aK7-Ul
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 16:41:53 +0000
Received: by mail-pg1-x530.google.com with SMTP id q19so2811221pgm.6
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=qFBAvnSg79zoT3+JHM3vRs2zXL9WFcit8FJyzU3capc=;
 b=Us9JNrHb8FSQA4yTPo9jEb5jZcr9MnUGvOzX0HJAQCEJXT/eL24QXIXcLjAkg8q6Kl
 HeCP8i0HPITMmBTyTOiKz4oxtxFFmv23M8iIV7Y+Bkq8/Tjkt3enC2MT03L9eVRCjhGv
 WK/EbevIn/hV3WIBoDuxL1zntTpJdCVehsc053Ajjx6LlY4LcaGAhj87+Kpy0e1vaCG7
 KVaRkPKD/4KYlvT97s1lFo+8gQtO5ne2j91rbWGKqL5WZRFgve4EdR7buLFyxj/YzNJ3
 0UGgPy4Sp+hXDWYd/ObktV48tCsv4pMsUQuTbUSvxdX3VI3W5YFXOah8r6FuSGtHy0DI
 YqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=qFBAvnSg79zoT3+JHM3vRs2zXL9WFcit8FJyzU3capc=;
 b=3NWoEzTmha67G/oIxj0tFptJKOFbNdea1R5JvVQrHeoSZvPMkVMg1n/UOiBoe5jAUP
 iqK7Xhs95qZ+mfgJHYvrLN8v9/YwUH3+tjRC3NMpoPrICRsVmxWPCNhXpWFiobIEe+Ty
 oV7H92vNdu5+6lJ6W3WPdCiZLDhKcYwxaiEVayFWCHYVMuD73AJqOlCR3wxE93J9pMFC
 Af/Lt0vOc4jwKNkSoZPGi/5CzA/ltiGcjIe33iYzIQBbFYnw9wY6bLGjcv0EnJSRNhia
 +DKh9mVeOBgtHofVR0JTCGO4UdpXtmmhdYXOfN8Qc7XSzl931BinIyPGwAeUM3nTp178
 QCmQ==
X-Gm-Message-State: AOAM531Msc8YL+xRkHmftvRdM4QZJvRxfZNftrxfKzNi+k/HgaWVH1+6
 Sbxd6dqTL2sNEl35ij9W6ElNOmK/Cdi/+oE5
X-Google-Smtp-Source: ABdhPJwes6GB4QofFG33x08DcMvHD/tGHasWxDQKJg/phGDL3vN9pemPhlXzw0y3X93EX8EhZ203Hw==
X-Received: by 2002:a05:6a00:b87:b0:4fa:a79a:72e7 with SMTP id
 g7-20020a056a000b8700b004faa79a72e7mr11808231pfj.68.1648831309069; 
 Fri, 01 Apr 2022 09:41:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 m7-20020a056a00080700b004fb28fafc4csm3812953pfk.97.2022.04.01.09.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:41:48 -0700 (PDT)
Subject: [PATCH] habanalabs: Elide a warning on 32-bit targets
Date: Fri,  1 Apr 2022 09:39:09 -0700
Message-Id: <20220401163909.20343-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: ogabbay@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, ynudelman@habana.ai, obitton@habana.ai,
 fkassabri@habana.ai, 
 daniel.vetter@ffwll.ch, ttayar@habana.ai, sozeri@habana.ai, bjauhari@habana.ai,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_094152_253788_B2AF3584 
X-CRM114-Status: GOOD (  13.79  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpUaGlzIGRvdWJsZS1j
YXN0IHBhdHRlcm4gbG9va3MgYSBiaXQgYXdrd2FyZCwgYnV0IGl0IGFscmVhZHkgZXhpc3RzCmVs
c2V3aGVyZSBpbiB0aGUgZHJpdmVyLiAgV2l0aG91dCB0aGlzIHBhdGNoIEkgZ2V0Cgpkcml2ZXJz
L21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmM6IEluIGZ1bmN0aW9uIOKAmGFsbG9jX2Rl
dmljZV9tZW1vcnnigJk6CmRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYzox
NTM6NDk6IHdhcm5pbmc6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlmZmVyZW50
IHNpemUgWy1XcG9pbnRlci10by1pbnQtY2FzdF0KICAxNTMgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodTY0KSBnZW5fcG9vbF9kbWFfYWxsb2NfYWxp
Z24odm0tPmRyYW1fcGdfcG9vbCwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCgp3aGljaCBlbmRzIHVwIHByb21vdGVkIHRvIGEgYnVpbGQg
ZXJyb3IgaW4gbXkgdGVzdCBzZXR1cC4KClNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgoKLS0tCgpJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgdGhp
cyBkcml2ZXIsIEknbSBqdXN0IHBhdHRlcm4tbWF0Y2hpbmcgdGhlCndhcm5pbmcgYXdheS4KLS0t
CiBkcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMgfCAxMCArKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyBiL2RyaXZlcnMv
bWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwppbmRleCBlMDA4ZDgyZTRiYTMuLmYxZmM3
OWMxZmMxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9y
eS5jCisrKyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwpAQCAtMTUw
LDEyICsxNTAsMTIgQEAgc3RhdGljIGludCBhbGxvY19kZXZpY2VfbWVtb3J5KHN0cnVjdCBobF9j
dHggKmN0eCwgc3RydWN0IGhsX21lbV9pbiAqYXJncywKIAkJZm9yIChpID0gMCA7IGkgPCBudW1f
cGdzIDsgaSsrKSB7CiAJCQlpZiAoaXNfcG93ZXJfb2ZfMihwYWdlX3NpemUpKQogCQkJCXBoeXNf
cGdfcGFjay0+cGFnZXNbaV0gPQotCQkJCQkJKHU2NCkgZ2VuX3Bvb2xfZG1hX2FsbG9jX2FsaWdu
KHZtLT5kcmFtX3BnX3Bvb2wsCi0JCQkJCQkJCQkJcGFnZV9zaXplLCBOVUxMLAotCQkJCQkJCQkJ
CXBhZ2Vfc2l6ZSk7CisJCQkJCQkodTY0KSAodWludHB0cl90KSBnZW5fcG9vbF9kbWFfYWxsb2Nf
YWxpZ24odm0tPmRyYW1fcGdfcG9vbCwKKwkJCQkJCQkJCQkJICAgcGFnZV9zaXplLCBOVUxMLAor
CQkJCQkJCQkJCQkgICBwYWdlX3NpemUpOwogCQkJZWxzZQotCQkJCXBoeXNfcGdfcGFjay0+cGFn
ZXNbaV0gPSAodTY0KSBnZW5fcG9vbF9hbGxvYyh2bS0+ZHJhbV9wZ19wb29sLAotCQkJCQkJCQkJ
CXBhZ2Vfc2l6ZSk7CisJCQkJcGh5c19wZ19wYWNrLT5wYWdlc1tpXSA9ICh1NjQpICh1aW50cHRy
X3QpIGdlbl9wb29sX2FsbG9jKHZtLT5kcmFtX3BnX3Bvb2wsCisJCQkJCQkJCQkJCSAgcGFnZV9z
aXplKTsKIAkJCWlmICghcGh5c19wZ19wYWNrLT5wYWdlc1tpXSkgewogCQkJCWRldl9lcnIoaGRl
di0+ZGV2LAogCQkJCQkiRmFpbGVkIHRvIGFsbG9jYXRlIGRldmljZSBtZW1vcnkgKG91dCBvZiBt
ZW1vcnkpXG4iKTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
