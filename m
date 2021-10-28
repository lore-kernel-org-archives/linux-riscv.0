Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0548C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D5360E8C
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0D5360E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1bSiAm2EbGz8e8yoVG6mWj611TiH24OvCrTCKRIs08=; b=Ahpjrr8W9jY2eX
	ZiM1J8hazdwZjRRrRWonpqp6wVPwiXhtq8xqapiPJoFNvUqmWwHmFvvekDMuaansyjt5rq4PS3gY5
	hd9Idz83V1ZcSya7Akeh9oAHJ6h6x60ZcHVpyBBRXkAUSDNHBYwSgZ1JuwEP44NosnNil2XxmfO63
	kHsHDSstP/eWK0fMs9m6//AX8K3Cw4XZa/ozhCuGBPbAw9aunScmud7Y4PUprux3sLYNsZ9GGcwr2
	EvvOQe4KB6Cjs7VHjee8tJpdSh+TKkjKlCIGcUaPM0AOct27FvSFW1gyaGg3k4YiJBnGKUM+lU4OC
	BMMcYRP7M5JolqwsWN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7zq-008Ws5-Gy; Thu, 28 Oct 2021 16:11:18 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7zk-008Wnn-KZ
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:11:13 +0000
Received: by mail-lj1-f175.google.com with SMTP id e2so11552496ljg.13
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6s4f8YcjDD+CpjBx7PKIl2wBVCSaaLbyqkYVC2ZnxY=;
 b=muFFiYv6XP78kLGWtPCpa0nsmqoasXbXdzUFjLKseba5MJaCHBJfUyvZGDaYUPl4wV
 7HEc6wMFnXynhPPjQ1uKTedYbEUzi2lAnrvJrldBTAOyGhR902PWULb2XnjgRGGc0/DU
 OiMT+HKsbzpVSvlR+Ib1jnATlO2n01SBH56kcJART15ZHIDWkgSAcYI/0roDo9B9pCZo
 ZOdylF/mhamC5dpZ81tR1mvxIH68r1gaVeYfFUAuJmCYaU1hV3Ufobfjr6zkhYmNmCNH
 SPWZbd5HmDTwD0DI9mAx9jGRiyur104sJPAuEX/DFjsiNmW+sgelezULICQXKOSk3mjY
 Zw2g==
X-Gm-Message-State: AOAM5307qdVyUa74LUvWE/liFKSDRNF1zoECRl0FDuL2CBWPhykvf+Bn
 CRW3u06C1nnlDj2M2xk89Xc=
X-Google-Smtp-Source: ABdhPJw9RfKTCTjLi4ZdAxhCHFhQ9JTLQ3uevQ/FREeI82pyLvcRUqHuDKshzgx3UPpTSz84y1xMrQ==
X-Received: by 2002:a2e:a48c:: with SMTP id h12mr5583843lji.221.1635437471276; 
 Thu, 28 Oct 2021 09:11:11 -0700 (PDT)
Received: from kladdkakan.. ([193.138.218.162])
 by smtp.gmail.com with ESMTPSA id o17sm49680lfo.176.2021.10.28.09.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:10 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v2 4/4] selftests/bpf: Fix broken riscv build
Date: Thu, 28 Oct 2021 18:10:57 +0200
Message-Id: <20211028161057.520552-5-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028161057.520552-1-bjorn@kernel.org>
References: <20211028161057.520552-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091112_696164_98081C21 
X-CRM114-Status: UNSURE (   9.79  )
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

VGhpcyBwYXRjaCBpcyBjbG9zZWx5IHJlbGF0ZWQgdG8gY29tbWl0IDYwMTZkZjhmZTg3NCAoInNl
bGZ0ZXN0cy9icGY6CkZpeCBicm9rZW4gcmlzY3YgYnVpbGQiKS4gV2hlbiBjbGFuZyBpbmNsdWRl
cyB0aGUgc3lzdGVtIGluY2x1ZGUKZGlyZWN0b3JpZXMsIGJ1dCB0YXJnZXRpbmcgQlBGIHByb2dy
YW0sIF9fQklUU19QRVJfTE9ORyBkZWZhdWx0cyB0bwozMiwgdW5sZXNzIGV4cGxpY2l0bHkgc2V0
LiBXb3JrYXJvdW5kIHRoaXMgcHJvYmxlbSwgYnkgZXhwbGljaXRseQpzZXR0aW5nIF9fQklUU19Q
RVJfTE9ORyB0byBfX3Jpc2N2X3hsZW4uCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmls
ZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQppbmRleCBhYzQ3Y2Y5NzYwZmMuLjg4ZTJh
OTc1MzUyYiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxl
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQpAQCAtMjc3LDcgKzI3
Nyw3IEBAICQoUkVTT0xWRV9CVEZJRFMpOiAkKEhPU1RfQlBGT0JKKSB8ICQoSE9TVF9CVUlMRF9E
SVIpL3Jlc29sdmVfYnRmaWRzCVwKIGRlZmluZSBnZXRfc3lzX2luY2x1ZGVzCiAkKHNoZWxsICQo
MSkgLXYgLUUgLSA8L2Rldi9udWxsIDI+JjEgXAogCXwgc2VkIC1uICcvPC4uLj4gc2VhcmNoIHN0
YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8uKlwpfC1pZGlyYWZ0ZXIg
XDF8cCB9JykgXAotJChzaGVsbCAkKDEpIC1kTSAtRSAtIDwvZGV2L251bGwgfCBncmVwICcjZGVm
aW5lIF9fcmlzY3ZfeGxlbiAnIHwgc2VkICdzLyNkZWZpbmUgLy1ELycgfCBzZWQgJ3MvIC89Lycp
CiskKHNoZWxsICQoMSkgLWRNIC1FIC0gPC9kZXYvbnVsbCB8IGdyZXAgJ19fcmlzY3ZfeGxlbiAn
IHwgYXdrICd7cHJpbnRmKCItRF9fcmlzY3ZfeGxlbj0lZCAtRF9fQklUU19QRVJfTE9ORz0lZCIs
ICQkMywgJCQzKX0nKQogZW5kZWYKIAogIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCi0t
IAoyLjMyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
