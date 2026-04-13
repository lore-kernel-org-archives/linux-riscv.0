Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B75EE9381E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9xwDV7KvSbA7CNsp5xo6l9cJ/q1yWGA/d0nTNlQKt1U=; b=iwTuRzShgTYn/I
	rZCFjOTm547bc+fGtf6LiQlUfI8IWy082LApUqBMr+A+5GHm8tDGk73Ss8mAkSZ3qp1ogv9qmNPcm
	bcSNSlIwwgcuMX4z3qr6iQiQlBDQhb4JKztCC6VkE8tvsSqLAFw8r8WstZej1EZB/kWt2ivTyP5Cv
	JJYfjeoa0pLR62cikKaVdPF1bQYwWsH7fFTbVFZxqG58LREd979eXdvIi+2DISG2QlcsjG7E65RL1
	xatnRG2250TjUhxizvj/3oyXpYw37QW4bBxuNlxD0BzuJNtuWiXhYFBaQ0KMs/fUb9OwilU6WESXh
	ZV9vXW3Yq3Ob43ntgNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA6L-0000000F1rO-0LqK;
	Mon, 13 Apr 2026 05:44:49 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCA6H-0000000F1qi-3mWQ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 05:44:47 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-408778a8ec4so2291002fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 22:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776059084; x=1776663884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5VXrjV443bibQOd/tYM5XouxdJe5ZhAegjzCEygNJdw=;
        b=V0dT8J3KIwk3Q0BY1CVB3fWFLVHADGXyD/cZVnrzmXs/jElQuMLvcWDFru6l5dP4Sj
         8M8OQQWSI4RLR80RDRNwpRABHubpZgVdr0r7+ljMWLtH57TrwYBbChg37rbDFlwtJaGa
         iYT5eIak3balpkzblo+2z9/oSOOMA1dO7h1d3b3YwC4AV8UuI8J3/kS33XH2dAlx3/wK
         rKsaQhRJOmqq00KMLaWKLCFm40S0LTBk6wUOmNZxO1l0+kOGJ6VlVvK5ez951FMQZO8V
         hmj3xKLBbkLNzWVdSfQcWf1k+HZBVM2TT5V7UgT1t5sFsqAVSloZgpm5WBp7dBBPH/rJ
         nE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059084; x=1776663884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VXrjV443bibQOd/tYM5XouxdJe5ZhAegjzCEygNJdw=;
        b=GyYigW2PqKD/AdXUsHLdxU6xL8tNFffmuCApC6dltvqCF3tmpiTCHpPK78LR0dNT6t
         iEMNMRgQPZeRo6LNahjpv0z3mQjxDSuiFUZc+MIbQlyzb08C5LIJ6fOGLpPMHqfGFECV
         ytiutFAXZ8N3snFgZKGyNo8sGS9edaqW6vxA/CrhwSGSNWEjL7wXKmBr/8f9149b7+fZ
         4BeLJeOYjcOxG+HJ6vmkD5BMQ9PTuCk2P0rxsjVnGRKJBc7Y7YDrhvrKU9APr7u2sm9Y
         /6LbISoZGnuW9qgKMXqWEIDZpYsg9l1j/6wd5NfEkVdTO3Ict7IYLS2g+Lp0OR8ZKqf4
         O5nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3X/e7lBWozJ1rIMraBvRaeYCouB7xw1UNvGux1n2PnDegZ/jxkv8jvcy+ELktrA/WudbEMM6kB1ngwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqqzJmWaP0aerLNKRcaNyGKkOSnJhUm98QZ7V8m8UpYTBpIwb3
	IbbTnALm688rHzX2aPHW5ImP79hsBTGAJeCBg9zzn2+bd4sNx2gZ3+sr
X-Gm-Gg: AeBDies2fVXJeCWUInwsRK0eqQJN20cBet2VFAG0CZsHUHYhBxgQgLTH//ySoGxgtVB
	GKmZwL2bCiQy65VMVS1aeARXYgJGlBJPiihcjwMKFrdtYEfMBay5PLTtW8+vfy5oNMv4ZOaZaLw
	lSFWwUl3GqczyAyZxqVhp3uDflVlRH2O7UHCnd8dXqXu/02POs9hpDA0rcvCpZ0jEwLrbpkUWRF
	Ne/96IZJ6bj40vJdJzvy2c0O2oDDuYcccBjIZtJo6GMM0keTf4VB3ATRnSfG7/go3KI4UNP5kVS
	X0VVeVfby/4B6ZTO0Pvt5o4csHQYk+XsD+pNP49J8qxUynj8k1eUrIfrrUOXGCtWAzP0ErSf2eU
	GpBA92ujZBJWuQfIXQI+zZXTbo/Hz4B+ffFVmIsREi4scyWPgpyMtTVOOJHIaYoOlN/BrSBD9CE
	pbRmYFL4nphYYUKOdPq5O/1EqEEOkc9FEj9cmxE7gBrqfI
X-Received: by 2002:a05:6871:8a5:b0:422:ba93:2150 with SMTP id 586e51a60fabf-423e0dcd14cmr6537796fac.4.1776059084209;
        Sun, 12 Apr 2026 22:44:44 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-423dcf9726fsm8520703fac.0.2026.04.12.22.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:44:43 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Neuling <mikey@neuling.org>
Subject: [PATCH] riscv: KVM: Fix memory leak in vector context allocation
Date: Mon, 13 Apr 2026 05:44:39 +0000
Message-ID: <20260413054439.1715082-1-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_224445_947653_338BD7FD 
X-CRM114-Status: GOOD (  10.52  )
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

V2hlbiB0aGUgc2Vjb25kIGt6YWxsb2MoKSBmb3IgaG9zdF9jb250ZXh0IHZlY3RvciBkYXRhIGZh
aWxzLAp0aGUgYWxyZWFkeS1hbGxvY2F0ZWQgZ3Vlc3RfY29udGV4dCB2ZWN0b3IgZGF0YSBpcyBu
b3QgZnJlZWQsCmNhdXNpbmcgYSBtZW1vcnkgbGVhay4gVGhpcyBpcyB0cmlnZ2VyYWJsZSBmcm9t
IHVzZXJzcGFjZSB2aWE6CgogIGlvY3RsKHZtX2ZkLCBLVk1fQ1JFQVRFX1ZDUFUpCiAgICDihpIg
a3ZtX3ZtX2lvY3RsX2NyZWF0ZV92Y3B1KCkKICAgICAg4oaSIGt2bV9hcmNoX3ZjcHVfY3JlYXRl
KCkKICAgICAgICDihpIga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoKQoKTm90
ZSBhbHNvIHRoYXQga3ZtX3ZtX2lvY3RsX2NyZWF0ZV92Y3B1KCkgZG9lcyBub3QgY2FsbAprdm1f
YXJjaF92Y3B1X2Rlc3Ryb3koKSBvbiBrdm1fYXJjaF92Y3B1X2NyZWF0ZSgpIGZhaWx1cmU6Cgog
IGt2bV9hcmNoX3ZjcHVfY3JlYXRlKCkgICAgICAgICAgIOKGkCBmYWlscywgcmV0dXJucyBlcnJv
cgogICAgICBnb3RvIHZjcHVfZnJlZV9ydW5fcGFnZTsgICAgIOKGkCBsaW5lIDQyMDkKCiAgLi4u
CiAgYXJjaF92Y3B1X2Rlc3Ryb3k6ICAgICAgICAgICAgICAg4oaQIFNLSVBQRUQKICAgICAga3Zt
X2FyY2hfdmNwdV9kZXN0cm95KHZjcHUpOyDihpAgd2hpY2ggd291bGQgY2FsbCBmcmVlX3ZlY3Rv
cl9jb250ZXh0CiAgdmNwdV9mcmVlX3J1bl9wYWdlOiAgICAgICAgICAgICAg4oaQIGxhbmRzIEhF
UkUsIGJlbG93IGFyY2hfdmNwdV9kZXN0cm95CiAgICAgIGZyZWVfcGFnZSh2Y3B1LT5ydW4pOwog
IHZjcHVfZnJlZToKICAgICAga21lbV9jYWNoZV9mcmVlKHZjcHUpOwoKc28ga3ZtX3Jpc2N2X3Zj
cHVfZnJlZV92ZWN0b3JfY29udGV4dCgpIGlzIG5ldmVyIGNhbGxlZCB0bwpjbGVhbiB1cCB0aGUg
cGFydGlhbCBhbGxvY2F0aW9uLgoKRml4ZXM6IDBmNGI4MjU3OTcxNiAoIlJJU0MtVjogS1ZNOiBB
ZGQgdmVjdG9yIGxhenkgc2F2ZS9yZXN0b3JlIHN1cHBvcnQiKQpBc3Npc3RlZC1CeTogQ2xhdWRl
IE9wdXMgNC42ICgxTSBjb250ZXh0KQpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIE5ldWxpbmcgPG1p
a2V5QG5ldWxpbmcub3JnPgotLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV92ZWN0b3IuYwppbmRleCAwNWYzY2MyZDhlLi40NmZiZjQ4ZjI1IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMKQEAgLTgwLDggKzgwLDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29u
dGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJdmNwdS0+
YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwID0ga3phbGxvYyhyaXNjdl92X3ZzaXplLCBH
RlBfS0VSTkVMKTsKLQlpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkK
KwlpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgeworCQlrZnJlZSh2
Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKTsKIAkJcmV0dXJuIC1FTk9NRU07
CisJfQogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
