Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6574C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776DC20840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 21:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmlMAgQx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776DC20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=packi.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4F3wJgw4WAKwYKSkBhsgboupMB/DxIppmG8no1Hncs=; b=rmlMAgQxOhYCAm
	QupNh68c1L64k0IOIzD9zTgyco8z8DX3sZoRhKFLGYtHGvf1MnrL5SKBpLWNqUKHlg61fhU7ml/FL
	4ttZFk73+ruJa/OUAaVl/kV+3GV4/3VnHNJ4xeyIt0lxFkkUgwFXJbofGesLyYXBDVZJFAn/Hy8aj
	l/pgdwKtpK4PnJeeHskfAeBf+EfkUQ7L0rFiE/5VflzdtZoA57G9gbd9JXyGQYHPslCEBy+FOG09P
	dNRk7t3TqMClJxy8woVdkdyzm/di6gwDCyR83xYgG7PGDBx68kWiM4pcLMftD3SHqaFm9FZ557wtc
	CftDIV82NQl6v0JUAJ4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLEZ4-0004m8-W2; Fri, 09 Nov 2018 21:43:42 +0000
Received: from mail.binarylogic.ch ([2a01:4f8:222:24c1::ff02])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLEZ2-0004l8-MV
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 21:43:42 +0000
Received: from fortknox.localdomain (unknown [192.168.122.1])
 by mail.binarylogic.ch (Postfix) with ESMTP id 40681DF386;
 Fri,  9 Nov 2018 22:43:25 +0100 (CET)
From: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2] RISC-V: recognize S/U mode bits in print_isa
Date: Fri,  9 Nov 2018 22:42:16 +0100
Message-Id: <20181109214217.27494-1-me@packi.ch>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
References: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_134341_058822_F2AA726A 
X-CRM114-Status: UNSURE (   9.27  )
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
Message-ID: <20181109214216.W8z8AW7cq0G57aG8kz10tbgkK6DTMfRNSUML3YVD7lQ@z>

UmVtb3ZlcyB0aGUgd2FybmluZyBhYm91dCBhbiB1bnN1cHBvcnRlZCBJU0Egd2hlbiByZWFkaW5n
IC9wcm9jL2NwdWluZm8Kb24gUUVNVS4gVGhlICJTIiBleHRlbnNpb24gaXMgbm90IGJlaW5nIHJl
dHVybmVkIGFzIGl0IGlzIG5vdCBhY2Nlc3NpYmxlCmZyb20gdXNlcnNwYWNlLgoKU2lnbmVkLW9m
Zi1ieTogUGF0cmljayBTdMOkaGxpbiA8bWVAcGFja2kuY2g+Ci0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdS5jCmluZGV4IDNhNWEyZWUzMTU0Ny4uYjRhN2Q0NDI3ZmJiIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHUuYwpAQCAtNjQsNyArNjQsNyBAQCBpbnQgcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiAKIHN0YXRpYyB2b2lkIHByaW50X2lzYShzdHJ1Y3Qg
c2VxX2ZpbGUgKmYsIGNvbnN0IGNoYXIgKm9yaWdfaXNhKQogewotCXN0YXRpYyBjb25zdCBjaGFy
ICpleHQgPSAibWFmZGMiOworCXN0YXRpYyBjb25zdCBjaGFyICpleHQgPSAibWFmZGNzdSI7CiAJ
Y29uc3QgY2hhciAqaXNhID0gb3JpZ19pc2E7CiAJY29uc3QgY2hhciAqZTsKIApAQCAtODgsMTEg
Kzg4LDE0IEBAIHN0YXRpYyB2b2lkIHByaW50X2lzYShzdHJ1Y3Qgc2VxX2ZpbGUgKmYsIGNvbnN0
IGNoYXIgKm9yaWdfaXNhKQogCS8qCiAJICogQ2hlY2sgdGhlIHJlc3Qgb2YgdGhlIElTQSBzdHJp
bmcgZm9yIHZhbGlkIGV4dGVuc2lvbnMsIHByaW50aW5nIHRob3NlCiAJICogd2UgZmluZC4gIFJJ
U0MtViBJU0Egc3RyaW5ncyBkZWZpbmUgYW4gb3JkZXIsIHNvIHdlIG9ubHkgcHJpbnQgdGhlCi0J
ICogZXh0ZW5zaW9uIGJpdHMgd2hlbiB0aGV5J3JlIGluIG9yZGVyLgorCSAqIGV4dGVuc2lvbiBi
aXRzIHdoZW4gdGhleSdyZSBpbiBvcmRlci4gSGlkZSB0aGUgc3VwZXJ2aXNvciAoUykKKwkgKiBl
eHRlbnNpb24gZnJvbSB1c2Vyc3BhY2UgYXMgaXQncyBub3QgYWNjZXNzaWJsZSBmcm9tIHRoZXJl
LgogCSAqLwogCWZvciAoZSA9IGV4dDsgKmUgIT0gJ1wwJzsgKytlKSB7CiAJCWlmIChpc2FbMF0g
PT0gZVswXSkgewotCQkJc2VxX3dyaXRlKGYsIGlzYSwgMSk7CisJCQlpZiAoaXNhWzBdICE9ICdz
JykKKwkJCQlzZXFfd3JpdGUoZiwgaXNhLCAxKTsKKwogCQkJaXNhKys7CiAJCX0KIAl9Ci0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
