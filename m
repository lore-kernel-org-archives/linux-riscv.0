Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3032FC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 19:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936AA2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 19:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WZad8djO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936AA2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=packi.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6R3bEPVK8WY8i9L2yNWRrQVv0Tilrna9JAOnQvjN42g=; b=WZad8djONFr9TP
	7FiZUm5xNZkJO8jqK+p5LbB+c6u+Zw7XaoCFNXgB54XGI6o5v6oCQ1uikSyt4nxoquRHAAllaa+Rx
	zXcl51nMt64NOT/3f0Mozum0GIIR/kRYTVNKJ8x0wxPDv0j+k7wZ/duedjoPIvaoTPvb2X4p8LgT3
	CAT8DBE4MRoGnM8dy1/+fupVhL7uZrDLqOkuagVgElFLUxCSWmBwD2b3XAPwURgcdykTVnNYvwECQ
	NsUCeYbrnya6FNiWMUH9M6wbcPr0gWn7JPUH1WZfFFANJKtiuUpV8ec2+gXFNQjAlqKxU1nmXXQv0
	sZoQVLbqkMnKMPJtxv4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLCYW-00035O-7N; Fri, 09 Nov 2018 19:35:00 +0000
Received: from mail.binarylogic.ch ([2a01:4f8:222:24c1::ff02])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLCYR-00033j-FA
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 19:34:57 +0000
Received: from fortknox.localdomain (unknown [192.168.122.1])
 by mail.binarylogic.ch (Postfix) with ESMTP id 417D8DF386;
 Fri,  9 Nov 2018 20:34:35 +0100 (CET)
From: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: recognize S/U mode bits in print_isa
Date: Fri,  9 Nov 2018 20:33:47 +0100
Message-Id: <20181109193349.28179-1-me@packi.ch>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_113455_662046_81E1D2AA 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109193347.SHJG-B0Cnq21WkyRPJtFc6lEmQmd5EGAUk_eR1rQlkk@z>

UmVtb3ZlcyB0aGUgd2FybmluZyBhYm91dCBhbiB1bnN1cHBvcnRlZCBJU0Egd2hlbiByZWFkaW5n
IC9wcm9jL2NwdWluZm8Kb24gUUVNVS4KClNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgU3TDpGhsaW4g
PG1lQHBhY2tpLmNoPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwppbmRleCAzYTVh
MmVlMzE1NDcuLjQwMjljN2U2ODcyYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKQEAgLTY0LDcgKzY0LDcgQEAgaW50IHJp
c2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCiBzdGF0
aWMgdm9pZCBwcmludF9pc2Eoc3RydWN0IHNlcV9maWxlICpmLCBjb25zdCBjaGFyICpvcmlnX2lz
YSkKIHsKLQlzdGF0aWMgY29uc3QgY2hhciAqZXh0ID0gIm1hZmRjIjsKKwlzdGF0aWMgY29uc3Qg
Y2hhciAqZXh0ID0gIm1hZmRjc3UiOwogCWNvbnN0IGNoYXIgKmlzYSA9IG9yaWdfaXNhOwogCWNv
bnN0IGNoYXIgKmU7CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
