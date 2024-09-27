Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60039CDD1B0
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LMFXGnHB4DcLooWkWG914IEj7/C746sG+wr8zzCrZw=; b=m2MUUQMdedRmwP
	cBqeIW8/LylpVay+WyBN65sPZM6vFpPGI2gqBhB/SptzetTnS/ueQNDKhlFN6P86M6lXaPq/NGRgN
	Wp2fhW35tcSHD0hVAbZ9eCJjyDcGJJ8V59YA8LtEoQb2unn3f2lpZ9RHL5Lepcz4b0u5BqKqYo6d5
	PecEbiUDwvl6Jqwrz0lHotUFRSH14JEfjkzdrw1f176p9NON3zqfAfabWYI3UHoJVdfLH0Fjor0eR
	0Wpkzbtr9vPvAhZxZ3Ai8r+UeKMEcgkVhVmlpHR7LOJvikeCI9Jz8ARA2PR6tVnkeWboAd4bP5bwx
	ir2/8spJbFxaoNwuRQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suAtS-0000000BGHj-019J;
	Fri, 27 Sep 2024 13:20:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suAnV-0000000BF2C-2P6u
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 099685C5BF4;
	Fri, 27 Sep 2024 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F07C4CEC6;
	Fri, 27 Sep 2024 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727442851;
	bh=8pMZwnUpWYbMv5a6Ys7FBJs8RZEhlrFBSSH8QX77gP4=;
	h=From:To:Cc:Subject:Date:From;
	b=NAuzruMaylwxNLXYEombG2Q63XYZuh7ra2rE41KnwWlD+3OY2aUP8oDj1p8SNEj2d
	 mgZpRubwXSN4IH/noP/GcjUA8swurAkiJJNsT7XQbhtGThlSZimsNRY2szPjj8Zrse
	 fa/v/cs52p0ghTTQMxbXpa2Cg27wjCAg1bqMGHLq2KozgJWlSjOLcFEDa6ZPsIBlI4
	 pe5FLNHI+LEveVLIqDHWoG3/z4KYBTumN15mYCYSpNnBAq9rg4PCL1oxRsKqnw11Mo
	 vug3zOxvrRbxtcDtTE5DPFGHXlueB0l1FJDFv1tM5YKl/Kw3ac46aS8fWFxRh8MSmb
	 TPGT0AUvT651A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
Date: Fri, 27 Sep 2024 15:13:52 +0200
Message-ID: <20240927131355.350918-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_061413_685579_F7E6ADBB 
X-CRM114-Status: UNSURE (   7.48  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKbGliYnBmIGRvZXMgbm90
IGluY2x1ZGUgdGhlIHBlci1hcmNoIHRvb2xzIGluY2x1ZGUgcGF0aCwgZS5nLgp0b29scy9hcmNo
L3Jpc2N2L2luY2x1ZGUuIFNvbWUgYXJjaGl0ZWN0dXJlcyBkZXBlbmQgdGhvc2UgZmlsZXMgdG8K
YnVpbGQgcHJvcGVybHkuCgpJbmNsdWRlIHRvb2xzL2FyY2gvJChTVUJBUkNIKS9pbmNsdWRlIGlu
IHRoZSBsaWJicGYgYnVpbGQuCgpGaXhlczogNmQ3NGQxNzhmZTZlICgidG9vbHM6IEFkZCByaXNj
diBiYXJyaWVyIGltcGxlbWVudGF0aW9uIikKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIHRvb2xzL2xpYi9icGYvTWFrZWZpbGUgfCAzICsrLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYi9icGYvTWFrZWZpbGUgYi90b29scy9saWIvYnBmL01ha2VmaWxlCmluZGV4
IDFiMjJmMGYzNzI4OC4uODU3YTVmN2I0MTNkIDEwMDY0NAotLS0gYS90b29scy9saWIvYnBmL01h
a2VmaWxlCisrKyBiL3Rvb2xzL2xpYi9icGYvTWFrZWZpbGUKQEAgLTYxLDcgKzYxLDggQEAgaWZu
ZGVmIFZFUkJPU0UKIGVuZGlmCiAKIElOQ0xVREVTID0gLUkkKG9yICQoT1VUUFVUKSwuKSBcCi0J
ICAgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUv
dWFwaQorCSAgIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9p
bmNsdWRlL3VhcGkgXAorCSAgIC1JJChzcmN0cmVlKS90b29scy9hcmNoLyQoU1JDQVJDSCkvaW5j
bHVkZQogCiBleHBvcnQgcHJlZml4IGxpYmRpciBzcmMgb2JqCiAKCmJhc2UtY29tbWl0OiBkYjVj
YTI2NWUzMzM0YjQ4YzRlM2ZhMDdlZWY3OWU4YmM1NzhjNDMwCi0tIAoyLjQzLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
