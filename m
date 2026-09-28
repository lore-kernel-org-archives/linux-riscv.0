Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749E5C9830E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 02:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PH2aS4KxOtIKGzRCPOq0Xkgd90Z0rRjFR9Yqu7SYees=; b=bxQ5Q5p4taU5LL
	6tEylaxaIZlN9cIgFYVh7h33IfM/Mf7Wad3oaqGFLfQvMleqIZKBXFPzt6pFGbsG65CEqeYvxN7aG
	3KDJiRU1b4LmSoZwksLRZ/XjOBmQX1oJmTI7/NsZFRMos+EsI+Vkfb6sqImvjZSx88Q2M9F/a4cUr
	9oYINszMw+k6mKdtHhEBiplOsoIjlDKbVfykLT6UbdUHHabt0u+Ej+yiqX+1UI+STzqRQLobQgpYZ
	DB7DyGQeh4e2nPZ1IezXTufB4Qui+DyAwIjQlZqLq2HLdufhWdgiPk87fBmMmoHOVxRzf5R40e/+7
	YEgAxlx2nz/U+a7TXTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zy-0000000HAEu-125h;
	Mon, 28 Sep 2026 02:21:46 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zs-0000000HADY-1kzn
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 02:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790562094; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=X3FxpV9hdjJFYmi4djMcIYOFyHUGcAiMBxxXsjrwS8c=;
	b=BJ1mxbYURObi2H3/hWvSqzIDFUr3PGqrpngPbNk8rgJfxL4pTFdoqPCUs2x7Gy+MOuELtwI3Sp2t2v0a1SNuz3MY9UWU7eqEAqklflA8gHY144FH+dfJQpuIgxxO0tt5QljZPPI7aCwqj3vEbAUisqmtxWvZ4VxrVtRWhCJJs+k=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBgzgOz_1790562092;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBgzgOz_1790562092 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 10:21:32 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Enable gotox tests for riscv64
Date: Mon, 28 Sep 2026 10:21:09 +0800
Message-ID: <20260928022109.1093-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928022109.1093-1-cp0613@linux.alibaba.com>
References: <20260928022109.1093-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_192141_196618_16EFD6E6 
X-CRM114-Status: UNSURE (   7.49  )
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

VGhlIHJpc2N2NjQgSklUIG5vdyBzdXBwb3J0cyB0aGUgZ290b3ggaW5zdHJ1Y3Rpb24gYW5kIGp1
bXAgdGFibGVzLCBzbwpydW4gdGhlIHRlc3RzIGluIHZlcmlmaWVyX2dvdG94LmMgb24gcmlzY3Y2
NCB0b28sIG1pcnJvcmluZyB3aGF0IHdhcyBkb25lCmZvciBhcm02NCBhbmQgcG93ZXJwYy4KClRo
ZSBndWFyZCBpcyA2NC1iaXQgb25seSBiZWNhdXNlIHRoZSBSVjMyIEpJVCBkb2VzIG5vdCBpbXBs
ZW1lbnQgZ290b3guCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJh
YmEuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNr
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBzaW5j
ZSB2MToKLSBDb2xsYXBzZSB0aGUgbXVsdGktbGluZSAjZW5kaWYgbWFya2VyIHRvIGEgc2luZ2xl
IGxpbmUuCgogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2dvdG94
LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVy
aWZpZXJfZ290b3guYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmll
cl9nb3RveC5jCmluZGV4IGY1YTk4NzhjN2I4ZC4uOTZhOWQ5MTQ5MzBlIDEwMDY0NAotLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfZ290b3guYworKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfZ290b3guYwpAQCAtNiw3
ICs2LDkgQEAKICNpbmNsdWRlICJicGZfbWlzYy5oIgogI2luY2x1ZGUgIi4uLy4uLy4uL2luY2x1
ZGUvbGludXgvZmlsdGVyLmgiCiAKLSNpZiBkZWZpbmVkKF9fVEFSR0VUX0FSQ0hfeDg2KSB8fCBk
ZWZpbmVkKF9fVEFSR0VUX0FSQ0hfYXJtNjQpIHx8IGRlZmluZWQoX19UQVJHRVRfQVJDSF9wb3dl
cnBjKQorI2lmIGRlZmluZWQoX19UQVJHRVRfQVJDSF94ODYpIHx8IGRlZmluZWQoX19UQVJHRVRf
QVJDSF9hcm02NCkgfHwgXAorCWRlZmluZWQoX19UQVJHRVRfQVJDSF9wb3dlcnBjKSB8fCBcCisJ
KGRlZmluZWQoX19UQVJHRVRfQVJDSF9yaXNjdikgJiYgX19yaXNjdl94bGVuID09IDY0KQogCiAj
ZGVmaW5lIERFRklORV9TSU1QTEVfSlVNUF9UQUJMRV9QUk9HKE5BTUUsIFNSQ19SRUcsIE9GRiwg
SU1NLCBPVVRDT01FKQlcCiAJCQkJCQkJCQlcCkBAIC01ODAsNiArNTgyLDYgQEAgbm9wXyU9OgkJ
CQkJCQkJXAogCTogX19jbG9iYmVyX2FsbCk7CiB9CiAKLSNlbmRpZiAvKiBfX1RBUkdFVF9BUkNI
X3g4NiB8fCBfX1RBUkdFVF9BUkNIX2FybTY0IHx8IF9fVEFSR0VUX0FSQ0hfcG93ZXJwYyovCisj
ZW5kaWYgLyogZ290b3g6IHg4NiwgYXJtNjQsIHBvd2VycGMsIHJpc2N2NjQgKi8KIAogY2hhciBf
bGljZW5zZVtdIFNFQygibGljZW5zZSIpID0gIkdQTCI7Ci0tIAoyLjUwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
