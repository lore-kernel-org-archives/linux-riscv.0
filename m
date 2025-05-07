Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2624C369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7Fa3ao2Pbe10YB3CNUbboJgypkBkIfDtwCr+jmj85gE=; b=FjXiXhrSVpxZnRNTC9/lOR45aW
	jMU8c4BsZsIQ4W4XcHdi2S3sYpgAAg2qtKsXPEXp2Nhe0ceakIqzPzlyN2FN3xPB2J9/uANmSawiM
	+UyHyFKo/DEmt7ytkq5OEJHMAZAu6yRZ3KYmBMIRZ6R6STdgt+H7vNd0rVN3lIzBe+/R7EhavMlRM
	sj9otfC3LqlM7IzeuSOACGHMc1E1qBy4b5+higgI/vYKkDRzi6EzZYGgnr/lyGnRnXOxmlisXSpxd
	iDT8VyvbBLREh1jr/sjmGcB8oCbU54EwwXTiJG/Q8sJKCtc4+ekZJrDVuiIuDe2oKzNic1mzNY4X6
	l2HJv2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVh4-0000000E615-3EBj;
	Wed, 07 May 2025 03:43:38 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVh2-0000000E5yC-2yBM
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:38 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2cca2c52dd9so4380164fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589414; x=1747194214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZn1GgGAG7mdxhx9lSWnDHMjgG27axMC/yttL1kxmb4=;
        b=VA3o2Z0LqdKHd2Q6tuNA8pBb88axt8fMdJexzm6iscWQQRIIEtubSOMzHsvOlAbSDj
         5qvYgX9r9APxKQfp2qqEFUxEVp4XLg2vpi6sJ1f7XJQxPUWhOfs7le9f7soGO9caLsUh
         03iAAJaRzKrJidbJIh3lpsfOVCu2KA3cBJUqhgrXEWOU+oVRiI+e+K/qntVKzaYYBSgy
         rd6QHjQK8PlVOXg8DQ4R9lBWQls6pqpXjfnf8Fam0DQqFlQZNEoIr86tqLAHZKW/hLZY
         WOBua0auAMHLOomeipdqrHrPZQGA65uS7PPYwAbyT/y43BmMEqtgqlwBtT6H/gDwKYsD
         LNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589414; x=1747194214;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iZn1GgGAG7mdxhx9lSWnDHMjgG27axMC/yttL1kxmb4=;
        b=BLmG5SwP8+sVNi8EGUuDtgVqckOFPtCEJ3+4PvvoZ3oAE5ygNeCNH7Psz/ATPfTD25
         MqnWRGgzOgweoXep6JyTrVQpnWUoAc8RV13Sz7PnfeezQR+gALffgw5bfo6+EUYKyYVt
         /7Dp6o7sTY+3LYihiSYx1X4JhL/GaAY9/Kav30eBIz588TnRTbm594OvYyZwOhtR6zR3
         X0kl5pAlmPc3ivcbBKWTOwkXXGsIf/9cDFMRSVOXw3H1KBr+YAbRI5k8MYvebs/wmcMY
         XwO0ESdowpmlWzHPCtReYnDbip9Dkz+kXmY+KRRGarNFvmjxkjao3WLHKzKLDSxgXjqi
         jPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVheSDaCSUblyFSrRehstoeYYyyNJ74MZtLD+ECI8zmHX1isv6rL9/qfuXIFP7kqpaHCtf+m2lYkxIhxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy00Fwsn9y8A5C7MrWEGMSuNolNudYU04a22OSQ1dflj8wMMv32
	nGMuJZkLiOzRKYhiIp6uZMgb8+bKPsGyjK5vY5jk1OleIIAbqqJ78TKIh/kzmm0jrGmb522w1YO
	gzKs+aHPopA==
X-Google-Smtp-Source: AGHT+IGifRIHZ6qcU64u73ukgqSP22FlKicCrm9bweMfqYF2kqYgj7WzkdgP+PxImBJxxCpzzgu9q1HpZCCfVQ==
X-Received: from oabrb11.prod.google.com ([2002:a05:6871:618b:b0:2da:6d76:b15c])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:e243:b0:29e:24c7:2861 with SMTP id 586e51a60fabf-2db5be312b8mr1163209fac.13.1746589414619;
 Tue, 06 May 2025 20:43:34 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:31 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <9d878fa99a72626208a8eed3c04c4140caf77fda.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 8/8] selftests/bpf: Enable non-arena
 load-acquire/store-release selftests for riscv64
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204336_778048_BEC3EE4D 
X-CRM114-Status: UNSURE (   9.75  )
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

Rm9yIHJpc2N2NjQsIGVuYWJsZSBhbGwgQlBGX3tMT0FEX0FDUSxTVE9SRV9SRUx9IHNlbGZ0ZXN0
cyBleGNlcHQgdGhlCmFyZW5hX2F0b21pY3MvKiBvbmVzIChub3QgZ3VhcmRlZCBiZWhpbmQgQ0FO
X1VTRV9MT0FEX0FDUV9TVE9SRV9SRUwpLApzaW5jZSBhcmVuYSBhY2Nlc3MgaXMgbm90IHlldCBz
dXBwb3J0ZWQuCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KUmV2
aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+ClRlc3RlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPiAjIFFFTVUvUlZBMjMKU2lnbmVkLW9mZi1ieTog
UGVpbGluIFllIDx5ZXBlaWxpbkBnb29nbGUuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9wcm9ncy9icGZfbWlzYy5oIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvcHJvZ3MvYnBmX21pc2MuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9wcm9ncy9icGZfbWlzYy5oCmluZGV4IDg2M2RmN2MwZmRkMC4uNmUyMDhlMjRiYTNiIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvYnBmX21pc2MuaAorKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvYnBmX21pc2MuaApAQCAtMjI1LDgg
KzIyNSw5IEBACiAjZGVmaW5lIENBTl9VU0VfQlBGX1NUCiAjZW5kaWYKIAotI2lmIF9fY2xhbmdf
bWFqb3JfXyA+PSAxOCAmJiBkZWZpbmVkKEVOQUJMRV9BVE9NSUNTX1RFU1RTKSAmJiBcCi0JKGRl
ZmluZWQoX19UQVJHRVRfQVJDSF9hcm02NCkgfHwgZGVmaW5lZChfX1RBUkdFVF9BUkNIX3g4Nikp
CisjaWYgX19jbGFuZ19tYWpvcl9fID49IDE4ICYmIGRlZmluZWQoRU5BQkxFX0FUT01JQ1NfVEVT
VFMpICYmCQlcCisJKGRlZmluZWQoX19UQVJHRVRfQVJDSF9hcm02NCkgfHwgZGVmaW5lZChfX1RB
UkdFVF9BUkNIX3g4NikgfHwJXAorCSAoZGVmaW5lZChfX1RBUkdFVF9BUkNIX3Jpc2N2KSAmJiBf
X3Jpc2N2X3hsZW4gPT0gNjQpKQogI2RlZmluZSBDQU5fVVNFX0xPQURfQUNRX1NUT1JFX1JFTAog
I2VuZGlmCiAKLS0gCjIuNDkuMC45NjcuZzZhMGRmM2VjYzMtZ29vZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
