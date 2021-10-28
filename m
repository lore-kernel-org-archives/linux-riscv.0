Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74773C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE0660F9D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CE0660F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JHxBS+P9LL64nZ+ovEh2TfixmZANE9i47FPKs3wzIZ0=; b=Y7r2quz77nYAkt
	6BiXGJ3dnf4kwFOenrPvVvZQhwRGQfiafJjKfTHj3yh//BYVFa/tsZcG+L8FhiUoiyl83V7p3XxVZ
	biMlM7DyQFwEcNqooH+Y5tq6NwDXtQLgiY5Qv1LH/v+IJG8BFOOQdOVJ+Yw6ItLm1cc43wiuRviZ6
	IU9IZwcG2RWS6WL0linwtzvAMkZ3UqG4u5TP2UdwJOG3FV7xortNvr5Q6WrLll1pb02ejOaJqy7vM
	gJpoifXaYJeadaR68HS72FXkv3cMWAqa1ZS/N+hnVTxxaHoML4WxtKKvn688K3/fWk6zGsN3y0NaW
	OnnR3llOoPkr4YHQw5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4ts-007qIh-3z; Thu, 28 Oct 2021 12:52:56 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4tp-007qGM-JN
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 12:52:54 +0000
Received: by mail-lj1-f180.google.com with SMTP id k13so10451764ljj.12
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 05:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xrmACLrClol1Ht1AqRT5BlRPbvf71eFZVnNxO5q/rNI=;
 b=JhKrrI7sPs7TevEoAbZg+n1MvZ4cv3qdxzPNJCNisS6hVLngUXfsgutjyCjzeei6d+
 xgVauZR4TjYJe9GLWahh7i27SfK9BDBvkY5GDAid0aZkJ5zllMK+eKBKumZBnaL4lb7h
 6N+bS9VyZz8kfFJfWbiuQfR0KaQGKkV0kEAs5WMRf1GnExsLPRLCF9mpZd2u9sr5c8Ld
 yEE33buIT0pHw2h3qXnDgHJH9w1TpagF2QaKVPLU10dBXNt2Zkzwro8T1Bbv/SLSDwoD
 2Wfs3n1RqQM+LpnfgKuTQHEYw1Ajab5k4MHp8tCeIuHbmJ1HXf3zOZC4duALOHgkV3oi
 0ADA==
X-Gm-Message-State: AOAM531CMEMT6/TeHdGPkZMy5O4XrpMjQ7zG6RxQA0ceTjOUgMJqX2ui
 oGD3ze0yYG57uKJfn0b6xRU=
X-Google-Smtp-Source: ABdhPJyQuQYnh4pcXTg5UYacz2zwAvAPf7Nnyl+A/VS8XnK9ZOgp2IkFx0P7Wfl5aBeow658nwCU2w==
X-Received: by 2002:a2e:9d88:: with SMTP id c8mr4662425ljj.276.1635425567390; 
 Thu, 28 Oct 2021 05:52:47 -0700 (PDT)
Received: from kladdkakan.. ([185.213.154.234])
 by smtp.gmail.com with ESMTPSA id p10sm282150ljm.53.2021.10.28.05.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 05:52:46 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH bpf] riscv, bpf: Fix potential NULL dereference
Date: Thu, 28 Oct 2021 14:51:15 +0200
Message-Id: <20211028125115.514587-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_055253_670192_FB9E7295 
X-CRM114-Status: UNSURE (   8.48  )
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

VGhlIGJwZl9qaXRfYmluYXJ5X2ZyZWUoKSBmdW5jdGlvbiByZXF1aXJlcyBhIG5vbi1OVUxMIGFy
Z3VtZW50LiBXaGVuCnRoZSBSSVNDLVYgQlBGIEpJVCBmYWlscyB0byBjb252ZXJnZSBpbiBOUl9K
SVRfSVRFUkFUSU9OUyBzdGVwcywKaml0X2RhdGEtPmhlYWRlciB3aWxsIGJlIE5VTEwsIHdoaWNo
IHRyaWdnZXJzIGEgTlVMTApkZXJlZmVyZW5jZS4gQXZvaWQgdGhpcyBieSBjaGVja2luZyB0aGUg
YXJndW1lbnQsIHByaW9yIGNhbGxpbmcgdGhlCmZ1bmN0aW9uLgoKRml4ZXM6IGNhNmNiNTQ0N2Nl
YyAoInJpc2N2LCBicGY6IEZhY3RvciBjb21tb24gUklTQy1WIEpJVCBjb2RlIikKU2lnbmVkLW9m
Zi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvcmUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3Jl
LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwppbmRleCAwZmVlMmNiYWFmNTMuLjc1
M2Q4NWJkZmFkMCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKKysr
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKQEAgLTEyNSw3ICsxMjUsOCBAQCBzdHJ1
Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2NvbXBpbGUoc3RydWN0IGJwZl9wcm9nICpwcm9nKQog
CiAJaWYgKGkgPT0gTlJfSklUX0lURVJBVElPTlMpIHsKIAkJcHJfZXJyKCJicGYtaml0OiBpbWFn
ZSBkaWQgbm90IGNvbnZlcmdlIGluIDwlZCBwYXNzZXMhXG4iLCBpKTsKLQkJYnBmX2ppdF9iaW5h
cnlfZnJlZShqaXRfZGF0YS0+aGVhZGVyKTsKKwkJaWYgKGppdF9kYXRhLT5oZWFkZXIpCisJCQli
cGZfaml0X2JpbmFyeV9mcmVlKGppdF9kYXRhLT5oZWFkZXIpOwogCQlwcm9nID0gb3JpZ19wcm9n
OwogCQlnb3RvIG91dF9vZmZzZXQ7CiAJfQoKYmFzZS1jb21taXQ6IDcyZjg5OGNhMGFiODVmZGU2
ZmFjZjc4YjE0ZDlmNjdhNGE3YjMyZDEKLS0gCjIuMzIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
