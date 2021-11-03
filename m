Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF8BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 11:55:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E9460F5A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 11:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E9460F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4/s5UwNBFR0c7cz0IqIG2gmWBZJq8/G4qvKS3pakwvc=; b=O1oODdnfSQxmDR
	0boXrd2ddoH6UcMDkQ7BJsPdLK6KGjpZP1CYQzXhlf/ehlDrqVfVkypXeRLWVnemfjo4RhnNU4850
	IVY6V00GvzTtYYKYlq1TjsUZtck+SbfXrOEFf57KdVZ1flHCoHLCZpJ3ph1H8A6WS3o8pMKZO7QRV
	E78IJyBbs/0H9xWtDgGNE+kxaWHtgQ8yXez1JBJRWSRRLPydvTdBFIlevo6W0WzoUO201pzRtrVl6
	NVxr98Frvz1YF0HmdY7DF/AK4fvfjtnGRQLWeTIOGUdT1sUn8OSHucV+SbpcE56NwrUfUcJgDM79K
	Guo+AQd2D6qH7zCe+FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miErb-0051gK-Ud; Wed, 03 Nov 2021 11:55:31 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miErY-0051eb-V7
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 11:55:30 +0000
Received: by mail-lj1-f176.google.com with SMTP id h11so3379523ljk.1
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 04:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=11mAUeEzHYo4WofQQnhX6tKzbvv6UrSSLpN/q7XHPV4=;
 b=XFEc9HEMtERewRMJYAbzLCF8rZP65T6MvWsOvKxd70qnqn1a/OSwdZTthpDvw2obW2
 tU8kZRgzZiRc6RY/cO+bi6qK2w7sTA1/IHYwAjQhQ6rkCnP7lG+ru0s83ZV9HCN9OyIg
 h9iBTKTXwvKs4XECl2fHD/khsTV6Rc/Ru/VRK5bru3j4K6SgZn6rbVXeoh71BGMrerIz
 mO58TYODVZKsjdhDuPcuFQvpgEXs1NvDIRhh9uaGHakR+PnKxACbxwvLQGB60UvlWDGh
 FLF+L768CQ6pVh/+xnrPVILT/StpYesFeM8IkF1aVvvspH2GtSIMJb9fw8TVMurfl8Tm
 6/tA==
X-Gm-Message-State: AOAM5338kU7VPvLTQbKo65Fy9gLZTHwiDYkRHzsq7WkN/RTvnSuWP1wD
 QpNLwunNT+3z8zpD371M6mw=
X-Google-Smtp-Source: ABdhPJyPei1aKTKE69u+FCwdajtiXEz9jxZBU//xdhQs7vcHoF3KS+mS4SShXAwvvND1vpqm4oTlug==
X-Received: by 2002:a05:651c:2cf:: with SMTP id
 f15mr19032566ljo.170.1635940526852; 
 Wed, 03 Nov 2021 04:55:26 -0700 (PDT)
Received: from kladdkakan.. (c213-102-90-208.bredband.tele2.se.
 [213.102.90.208])
 by smtp.gmail.com with ESMTPSA id g18sm161890lfv.25.2021.11.03.04.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 04:55:25 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, tongtiangen@huawei.com
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build,
 and silence RV64 warning
Date: Wed,  3 Nov 2021 12:54:53 +0100
Message-Id: <20211103115453.397209-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_045529_027287_B59375C3 
X-CRM114-Status: GOOD (  12.29  )
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

Q29tbWl0IDI1MmM3NjViZDc2NCAoInJpc2N2LCBicGY6IEFkZCBCUEYgZXhjZXB0aW9uIHRhYmxl
cyIpIG9ubHkKYWRkcmVzc2VkIFJWNjQsIGFuZCBicm9rZSB0aGUgUlYzMiBidWlsZCBbMV0uIEZp
eCBieSBnYXRpbmcgdGhlIGV4Y2VwdGlvbgp0YWJsZXMgY29kZSB3aXRoIENPTkZJR19BUkNIX1JW
NjRJLgoKRnVydGhlciwgc2lsZW5jZSBhICItV21pc3NpbmctcHJvdG90eXBlcyIgd2FybmluZyBb
Ml0gaW4gdGhlIFJWNjQgQlBGCkpJVC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sbHZt
LzIwMjExMTAyMDYxMC45b3k5UnIwRy1sa3BAaW50ZWwuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGx2bS8yMDIxMTAyOTAzMzQuMnpkTXlScTQtbGtwQGludGVsLmNvbS8KCkZpeGVz
OiAyNTJjNzY1YmQ3NjQgKCJyaXNjdiwgYnBmOiBBZGQgQlBGIGV4Y2VwdGlvbiB0YWJsZXMiKQpT
aWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KVG9uZy9E
YW5pZWw6IFRoZSBSVjMyIGJ1aWxkIGhhcyBiZWVuIGJyb2tlbiBzaW5jZSBUaHVyc2RheS4gSSds
bCB0cnkKdG8gZmFzdC10cmFjayBhIGJpdCwgYW5kIGNvbW1pdCBhIHF1aWNrLWZpeCBmb3IgaXQu
IEhvcGUgdGhhdCdzIE9LCndpdGggeW91LCBUb25nIQoKSSd2ZSB2ZXJpZmllZCB0aGUgYnVpbGQg
b24gbXkgbWFjaGluZSB1c2luZyByaXNjdjMyIEdDQyA5LjMuMCBhbmQKcmlzY3Y2NCBHQ0MgMTEu
Mi4wLgoKCkJqw7ZybgotLS0KYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMgICAgICAgICB8IDQgKyst
LQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vZXh0YWJsZS5jIGIvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMKaW5kZXggMThiZjMzODMw
M2I2Li5kZGI3ZDNiOTllODkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbW0vZXh0YWJsZS5jCisr
KyBiL2FyY2gvcmlzY3YvbW0vZXh0YWJsZS5jCkBAIC0xMSw3ICsxMSw3IEBACiAjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogCi0jaWZkZWYgQ09O
RklHX0JQRl9KSVQKKyNpZiBkZWZpbmVkKENPTkZJR19CUEZfSklUKSAmJiBkZWZpbmVkKENPTkZJ
R19BUkNIX1JWNjRJKQogaW50IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4
Y2VwdGlvbl90YWJsZV9lbnRyeSAqZXgsIHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKICNlbmRpZgog
CkBAIC0yMyw3ICsyMyw3IEBAIGludCBmaXh1cF9leGNlcHRpb24oc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiAJaWYgKCFmaXh1cCkKIAkJcmV0dXJuIDA7CiAKLSNpZmRlZiBDT05GSUdfQlBGX0pJVAor
I2lmIGRlZmluZWQoQ09ORklHX0JQRl9KSVQpICYmIGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkp
CiAJaWYgKHJlZ3MtPmVwYyA+PSBCUEZfSklUX1JFR0lPTl9TVEFSVCAmJiByZWdzLT5lcGMgPCBC
UEZfSklUX1JFR0lPTl9FTkQpCiAJCXJldHVybiBydl9icGZfZml4dXBfZXhjZXB0aW9uKGZpeHVw
LCByZWdzKTsKICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggMmNhMzQ1YzdiMGJm
Li5mMmE3NzljN2UyMjUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtNDU5LDYgKzQ1OSw4
IEBAIHN0YXRpYyBpbnQgZW1pdF9jYWxsKGJvb2wgZml4ZWQsIHU2NCBhZGRyLCBzdHJ1Y3QgcnZf
aml0X2NvbnRleHQgKmN0eCkKICNkZWZpbmUgQlBGX0ZJWFVQX09GRlNFVF9NQVNLICAgR0VOTUFT
SygyNiwgMCkKICNkZWZpbmUgQlBGX0ZJWFVQX1JFR19NQVNLICAgICAgR0VOTUFTSygzMSwgMjcp
CiAKK2ludCBydl9icGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFi
bGVfZW50cnkgKmV4LAorCQkJCXN0cnVjdCBwdF9yZWdzICpyZWdzKTsKIGludCBydl9icGZfZml4
dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKmV4LAogCQkJ
CXN0cnVjdCBwdF9yZWdzICpyZWdzKQogewoKYmFzZS1jb21taXQ6IGNjMDM1NmQ2YTAyZTA2NDM4
N2MxNmE4M2NiOTZmZTQzZWYzMzE4MWUKLS0gCjIuMzIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
