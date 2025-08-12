Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654CBC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGf/6OVXiabQrxGnsnRUnNoZPaaw9//pO/yKoq+FoKE=; b=jN7bczTDeYogXZ
	uyUzuAUZQ/PmTuyVPnrHZnrpmoaUwe8N6U7lvpcVBfN6Tu3VeICCsB4WsFG8TSQW9xFSQ6VZein7G
	+1A+br/gGZKMPqJ2kSuJx2Y6hYGtJt25/GFkb7e84DrULkgb0bqVCTlmjQoFqG8gZhgEAo3jevazO
	TjI7ypjuaJZ9JAd/t8oJb5oVB6PV6XCCLLmolHgjjE6aF2zACuzBdlRF4zDuzyJSSwp1xofJrWyru
	788DdPJaApWgYJjEj5Eu3qeddsVdDoTctYfIzseq50+w/aS7hZJo7njd9uwvLA6u/XuSbjSBOrPVa
	xpCn6B6dJjhHQhsOQIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloI4-0000000AmD5-3BBC;
	Tue, 12 Aug 2025 12:39:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkvW-0000000AKEj-1O39
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=itAcwp1tL7JmEvs/VclPDqKZmFhrZKHjpN5MTKoCPt8=; b=UFya8iT7x36CUfzK+njC2im9JH
	9Ge4hpPG22SUHJhAadBQzv31uWfltfD27FyYauPrm2mXysNrgcmoPyMxY/4X5+YgAEjBBuB7Q4XAh
	wGVcRSgFcBQFFjN0z3Ttg6ipAL5lzbdPeWeJnvXvebzYvEovQz0t0rJQEXyUw2LzDVEAONSWVTSIH
	JmVcJLp8C6zDRO4c86cUa58vOf7MbZUwOeINwm+WGbXBgEPixGeS6OQddrP2syU6f9DT5IJsEzh9m
	nF4A871H0yxvTIQ1nV7Yph52/1IpRgK6pCzV+eMfQkFZx83eeXSrqskVyVSoYOM9NMNEh/ENcQ3zj
	sXGkjUUA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkvT-0000000FldG-1bf6
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:04:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-459ddb41887so6766545e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754989449; x=1755594249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itAcwp1tL7JmEvs/VclPDqKZmFhrZKHjpN5MTKoCPt8=;
        b=K0NN4qKr/wpemn5pfJmC+1LjwCE5EtFdiCmtjX/ZPldFLPdy+0ouxAt6I21aANXM7b
         zTrIBGdOpQOA6i+wA79AhIeJUSR76OEkMTpEHDfMy0uymNbZ6nhxxzOO1+0EyDlOiBLD
         fROtBAryo9dfah+5fIIfu7KTPz8Irs7IIUn9fUyoRE0d6vNCwNT8CxKmKJmpCQN/n89g
         c6yJN2SejsMP6nm70YPhOIoM7//qsueIc4LP7r5L/gHyWCtRrxmb+ElxY5e4fdL/x0tX
         DwSNAD8XkOXIzmE09KIMlzfqAV4KF8v0RXBOJ8VcHr+ROZo+aKmM+JFaoyABpPoZoPXY
         DYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989449; x=1755594249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itAcwp1tL7JmEvs/VclPDqKZmFhrZKHjpN5MTKoCPt8=;
        b=j+DyjQ59NS4TjHdPdcdP2FasfKjg1OL5idlasuX5LjTL6gMrQOkbWT10LgidVMPKs2
         9u1B4s96NUWLIbvnp5eq5QKQy8y88EhE8pFp8LxeGjXPqaKNBFgnMZ3CXJ1R/i9G3fUo
         sAdBF0BlDyV9v7/eUS+4m9MkYG6iU71PW2qaj7afVeavqgx1WZ7DIkfaMLS8UpSy7kGb
         VLs8/ULwwK+vberjWDx6XqdkNZW120/5WitFlCdIjWNRSDt2aNevZhDonNc/pzPP+tjV
         Q34OP4vbmhHxoVSNKYs+M4dUyTECKR5TiAv408EtJHBuNAIbsg1Jyl+37MECSLNQyeY/
         SwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdvFKNzj/uAFvNaocLWvcl0nyA4AC2k+qD/5BzxqOj+5Ywa5EZc9JHbXDhz9GzwRlLmnrtKS1Y9KglRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBALbGj5NB03jN/mxlEO9ep2J5glwPtztSPrqg13zujXOVHk0e
	JKFhRWaQqDay/ryqOzuSfizsBebSEfRcPkDiKNJ86wLiFs8PJ39wJ+VDjmPjrulysKM=
X-Gm-Gg: ASbGnctL1uMubtGJCcHFobvxBvZBGa+mgRxBLNhk8IKqV32+g3ez0GlvM4Gav0DSHgl
	AbQ+q/OraOxhm4oAHRgMWFSbn2WmtCGfhKJAtkM2TdyBkAl2XFW5IqQR59DhGUisv4OzUc0c2Dy
	6x1/G0PXq4dBHfHu9n6s+L54dB7lEoFRrFdxmOysbFFj+HZN3a7NIxYbf73lUfiHBlLF40QyZGk
	v2HYbwUwvzzf2rFGPhb2oHGRNnwXvi8N1zRfbqV9BrsV/IE2P3X0qBX7XiKJiotW1Qlo3tuuckN
	aKqjyjX/2es+vTyHolUGKcm4TR690Qe2ypr0P3Whxm4oQnZaHP0GKpr44pEmC4RRuaNvsA8tPmD
	t2tBZWcDcL12FCAcnyxElIUE408mjww==
X-Google-Smtp-Source: AGHT+IEKfx5/IibgOl7zdUM/KxazaaZ9Kt824Zr9oOR+gNUohGNLWWuXxmaBUI2dt+CetFzava53Sw==
X-Received: by 2002:a05:6000:2c10:b0:3b7:99a8:bf6d with SMTP id ffacd0b85a97d-3b9142bcf85mr298562f8f.11.1754989449200;
        Tue, 12 Aug 2025 02:04:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8113:2b11:8f42:672f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e5887b7fsm287090205e9.30.2025.08.12.02.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:04:08 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: bpf@vger.kernel.org
Cc: stable@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv, bpf: use lw when reading int cpu in BPF_MOV64_PERCPU_REG
Date: Tue, 12 Aug 2025 11:02:55 +0200
Message-ID: <20250812090256.757273-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_100411_579686_3976F66C 
X-CRM114-Status: GOOD (  10.38  )
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

ZW1pdF9sZCBpcyB3cm9uZywgYmVjYXVzZSB0aHJlYWRfaW5mby5jcHUgaXMgMzItYml0LCBub3Qg
eGxlbi1iaXQgd2lkZS4KVGhlIHN0cnVjdCBjdXJyZW50bHkgaGFzIGEgaG9sZSBhZnRlciBjcHUs
IHNvIGxpdHRsZSBlbmRpYW4gYWNjZXNzZXMKc2VlbWVkIGZpbmUuCgpGaXhlczogMTljNTZkNGU1
YmUxICgicmlzY3YsIGJwZjogYWRkIGludGVybmFsLW9ubHkgTU9WIGluc3RydWN0aW9uIHRvIHJl
c29sdmUgcGVyLUNQVSBhZGRycyIpCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVk
LW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQog
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4
IDEwZTAxZmYwNjMxMi4uNmUxNTU0ZDg5NjgxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAg
LTEzNTYsNyArMTM1Niw3IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBm
X2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAogCQkJCWVtaXRfbXYocmQs
IHJzLCBjdHgpOwogI2lmZGVmIENPTkZJR19TTVAKIAkJCS8qIExvYWQgY3VycmVudCBDUFUgbnVt
YmVyIGluIFQxICovCi0JCQllbWl0X2xkKFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVh
ZF9pbmZvLCBjcHUpLAorCQkJZW1pdF9sdyhSVl9SRUdfVDEsIG9mZnNldG9mKHN0cnVjdCB0aHJl
YWRfaW5mbywgY3B1KSwKIAkJCQlSVl9SRUdfVFAsIGN0eCk7CiAJCQkvKiBMb2FkIGFkZHJlc3Mg
b2YgX19wZXJfY3B1X29mZnNldCBhcnJheSBpbiBUMiAqLwogCQkJZW1pdF9hZGRyKFJWX1JFR19U
MiwgKHU2NCkmX19wZXJfY3B1X29mZnNldCwgZXh0cmFfcGFzcywgY3R4KTsKLS0gCjIuNTAuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
