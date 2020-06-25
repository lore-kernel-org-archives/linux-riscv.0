Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7E5C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C042053B
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lziGxqgn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76C042053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GwjeIgTJBilWnuSuSyFoUZgLGUyNjvbnmZhSjPQNKRE=; b=lziGxqgnP0eQZpLeX7rrJmVqEU
	00i1CGQeK6/qHAMhPl0o0L0oKla0qAkx7MkFusFTDBHy0j+fRAfRwUzVNi2cFBnXTnureE3QaATg0
	U6bpgo5UaRbrVG9ib/lZ/FKyjgMdHf+guKeDUOUjXxSHL0GpLIVPllXRNCoSgvO51LYy8vBoPllTk
	M25kRR9WiqNB+x+gUrusj1DWFm4Y9caEYnc+Eera4a4hdlsRoKbdhj7QRBU0nbTBdAwniiba264LL
	0Tp8vNF+tPu0zr/p5bjGY5QFrGlq4BDPN5RvhAYEID8+kq4qia8fejDI/lSicAwlAaHQUkO6KA15Y
	Tp2S/yWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomDX-0003W0-Mc; Fri, 26 Jun 2020 11:08:23 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jol58-0005Ek-S6
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 09:55:52 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49t82602ZQzvjc1; Thu, 25 Jun 2020 20:39:41 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: enable kcov
Date: Thu, 25 Jun 2020 20:39:41 +0200
Message-Id: <20200625183941.23093-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIEFSQ0hfSEFTX0tDT1YgYW5kIEhBVkVfR0NDX1BMVUdJTlMgdG8gdGhlIHJpc2N2IEtjb25m
aWcuCkFsc28gZGlzYWJsZSBpbnN0cnVtZW50YXRpb24gb2YgdmRzby4KCkNjOiBCasO2cm4gVMO2
cGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+CkNjOiBEbWl0cnkgVnl1a292IDxkdnl1a292QGdv
b2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRvYmlhcyBLbGF1c2VyIDx0a2xhdXNlckBkaXN0YW56
LmNoPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAyICsrCiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCAwODkyOTNlNGFkNDYuLmE3ZDdmODE4NGYxNSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTksNiArMTksNyBAQCBj
b25maWcgUklTQ1YKIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdfV1gKIAlzZWxlY3QgQVJDSF9IQVNf
R0NPVl9QUk9GSUxFX0FMTAogCXNlbGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCisJc2VsZWN0
IEFSQ0hfSEFTX0tDT1YKIAlzZWxlY3QgQVJDSF9IQVNfTU1JT1dCCiAJc2VsZWN0IEFSQ0hfSEFT
X1BURV9TUEVDSUFMCiAJc2VsZWN0IEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQCkBAIC01Nyw2ICs1
OCw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBIQVZFX0RNQV9DT05USUdVT1VTIGlmIE1NVQog
CXNlbGVjdCBIQVZFX0VCUEZfSklUIGlmIE1NVQogCXNlbGVjdCBIQVZFX0ZVVEVYX0NNUFhDSEcg
aWYgRlVURVgKKwlzZWxlY3QgSEFWRV9HQ0NfUExVR0lOUwogCXNlbGVjdCBIQVZFX0dFTkVSSUNf
VkRTTyBpZiBNTVUgJiYgNjRCSVQKIAlzZWxlY3QgSEFWRV9QQ0kKIAlzZWxlY3QgSEFWRV9QRVJG
X0VWRU5UUwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKaW5kZXggMzhiYTU1YjBlYjlkLi45ZGViYmFh
YjM5M2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQpAQCAtMjksNiArMjksNyBAQCBDUFBGTEFH
U192ZHNvLmxkcyArPSAtUCAtQyAtVSQoQVJDSCkKIAogIyBEaXNhYmxlIGdjb3YgcHJvZmlsaW5n
IGZvciBWRFNPIGNvZGUKIEdDT1ZfUFJPRklMRSA6PSBuCitLQ09WX0lOU1RSVU1FTlQgOj0gbgog
CiAjIEZvcmNlIGRlcGVuZGVuY3kKICQob2JqKS92ZHNvLm86ICQob2JqKS92ZHNvLnNvCi0tIAoy
LjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
