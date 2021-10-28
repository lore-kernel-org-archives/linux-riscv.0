Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C18C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB9260F92
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAB9260F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqGXWqhkJykXLbcn0h8eZ1ll7WpfdhUjCB/QE8wfVds=; b=L7gHytzJ/mhe0w
	oryfc9gooK3g04dcBf8in9GHb99KCtl33ILhusa3Ol0m0MgHcqO34fQKbR+byUWXpGBDYv9H5kC60
	pI/YdVY7E/MxS367I9a8HIatwxNrxHUpQgLmzcN3iUibaiWePrbIeOkWVbTO0LnAalduzCFlxeIfX
	Zcf5t0qEPcI8Xld5lrLhgeYjS4rf9Imi/WVjRcx9gkndwjS+Hn8lm0wscdFoRJTzafpDHht2m2pXw
	eXB9KkJmAPTNzfWiG7lXrwjJiC/vDJmjPekeqEXZVwIl2EaC2ctJxxslL1QgnDseRXvnTEjwflmqp
	VtCV3DC28xcfLtltgwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5Kz-007uaB-PG; Thu, 28 Oct 2021 13:20:57 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg5Ku-007uX9-T7
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 13:20:54 +0000
Received: by mail-lf1-f53.google.com with SMTP id x27so13549486lfu.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 06:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PZBfQ2VLBVQ+FScckJP/YM1qLVydE5D6300dI/9Uj0=;
 b=r3k0zKq2KwH91vmwpg+HI+AjE+MnMsjLrLXi+9pWeOhUtKp7NwMtMJ/caUzvO5M6d+
 nt1dHHRKbZ/7n1thzD62NnRsFl4xo5cJanUshkpvfz4WBaW2MOIp2P7mNtRvWcgoZ7dU
 j4meCb6+793d5K3PIdu1J0Mg34HobjRUPxF8VzQpM14+2olN4NBgYXYiKPC2xsJ08+M+
 KfogXJNyTRSajShCly6RZGtpy3G4KbnaROa/XnFJgEaT+By+J2rKSMVxwte+jsHB1FPU
 5oicPHUd6j51kIkJ9HDoF5IKcMmjJtb2+eO8KTICeOY0EWcWx/AxXBWA34BBPQ3haYWP
 KjaA==
X-Gm-Message-State: AOAM533lgriMrRZQAruXbVaXth+R/SdGFwI9lIJVD7YuUzQSXYK7MrfT
 zMGi5ktxHKucZTjhffealDpyjXEMyrg=
X-Google-Smtp-Source: ABdhPJxfNRrAhW5xushlBQeEd0Em0sopu17I+MiQ1/8I8I+S67KskkgZ+epYCfCrm5NfnUNj6YVqHA==
X-Received: by 2002:a05:6512:2309:: with SMTP id
 o9mr4155941lfu.124.1635427251319; 
 Thu, 28 Oct 2021 06:20:51 -0700 (PDT)
Received: from kladdkakan.. ([185.213.154.234])
 by smtp.gmail.com with ESMTPSA id o9sm309616lfk.292.2021.10.28.06.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:20:50 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 4/4] selftests/bpf: Fix broken riscv build
Date: Thu, 28 Oct 2021 15:20:41 +0200
Message-Id: <20211028132041.516820-5-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028132041.516820-1-bjorn@kernel.org>
References: <20211028132041.516820-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_062052_965175_0BB4A7BC 
X-CRM114-Status: UNSURE (   8.56  )
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
ZSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCmluZGV4IGFjNDdjZjk3NjBmYy4uZDcz
OWU2MmQwZjkwIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZp
bGUKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCkBAIC0yNzcsNyAr
Mjc3LDggQEAgJChSRVNPTFZFX0JURklEUyk6ICQoSE9TVF9CUEZPQkopIHwgJChIT1NUX0JVSUxE
X0RJUikvcmVzb2x2ZV9idGZpZHMJXAogZGVmaW5lIGdldF9zeXNfaW5jbHVkZXMKICQoc2hlbGwg
JCgxKSAtdiAtRSAtIDwvZGV2L251bGwgMj4mMSBcCiAJfCBzZWQgLW4gJy88Li4uPiBzZWFyY2gg
c3RhcnRzIGhlcmU6LywvRW5kIG9mIHNlYXJjaCBsaXN0Li97IHN8IFwoLy4qXCl8LWlkaXJhZnRl
ciBcMXxwIH0nKSBcCi0kKHNoZWxsICQoMSkgLWRNIC1FIC0gPC9kZXYvbnVsbCB8IGdyZXAgJyNk
ZWZpbmUgX19yaXNjdl94bGVuICcgfCBzZWQgJ3MvI2RlZmluZSAvLUQvJyB8IHNlZCAncy8gLz0v
JykKKyQoc2hlbGwgJCgxKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgZ3JlcCAnX19yaXNjdl94bGVu
ICcgfCBhd2sgJ3twcmludGYoIi1EX19yaXNjdl94bGVuPSVkIC1EX19CSVRTX1BFUl9MT05HPSVk
IiwgJCQzLCAkJDMpfScpCisKIGVuZGVmCiAKICMgRGV0ZXJtaW5lIHRhcmdldCBlbmRpYW5uZXNz
LgotLSAKMi4zMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
