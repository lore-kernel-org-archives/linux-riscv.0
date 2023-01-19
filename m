Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3908C38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvSUjEZxL8Cv22ogiXWCnlfuXgM+FUepV+Pz/zhBCqQ=; b=DZ4hK/c+kyBGmN
	zTrxzQOvW/cn72xFDVvLgGfZzErw41ul8VVwaekD6Xabnx0YBXTYiA/uyrOGCIxDY+LfhepfYuIyB
	P1H3kiGGjiWo0mQE+G+72kMaXahoaY+v/JwpWJSol0UevQdIXTeoE90ECuSvJoEUYTBU3P09OvBcQ
	F1PI0T1PKWFgNsFs23NcPgR8zuT37ZypEYwuBU0YrsWFv5JyNCv/ldgRCqCDvTwQkO9URlHi6dewH
	qS+YIDrZTeqbxnekjx/kj/rbxPfx8J5O4BgLFO28FVjkLTwKLzKTot1J6vkxEtUJU/gVcPPsgXCqX
	CheO6jp0yaSDzUAOr+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPfi-003wKK-1y; Thu, 19 Jan 2023 07:49:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPeg-003vvt-6J
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 07:48:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC612615A4;
	Thu, 19 Jan 2023 07:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94ACC433EF;
	Thu, 19 Jan 2023 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674114493;
	bh=PBE0PpRXIlt2qCDFtsjgADfP4kD6JxkZrkUXxW7Tmuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F+9OmwVL6lX48jOEAysQTK3qhLt3mSeXbLlVru28JnzuovuPCuTdiTQtUoSwjB+ps
	 Wd56KDxsYagdWgG7gH83veEO34aLJf1+lkkB+UiWSJNfo6/PjRS/8mC2UhNxayL4zd
	 IgN54fSBcVNOm9GvIGHQNc93olFcrzVMmY9NNju/K2PCXIGrFao/mbWzEnZNvbYRXx
	 sY+bzGVxz6VFYL4ptncHJMFnLQASifnFjX4RfFyNh//oPXdrR75K8pyaFMAcjPHMhb
	 MknCw6cEnu9oYlXUsnlFTfWIGVxga+Ni5GgCbBg/Jieh2Q2WpeR7nVxD2m+G0goBIe
	 LV5rrCkiwU1bg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] scripts/decodecode: Add support for RISC-V
Date: Thu, 19 Jan 2023 08:47:38 +0100
Message-Id: <20230119074738.708301-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230119074738.708301-1-bjorn@kernel.org>
References: <20230119074738.708301-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_234814_346434_7878AFBF 
X-CRM114-Status: GOOD (  13.34  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUklTQy1WIGhhcyBzb21l
IEdOVSBkaXNhc3NlbWJseSBxdWlya3MsIGUuZy4gaXQgcmVxdWlyZXMgJy1EJyB0bwpwcm9wZXJs
eSBkaXNhc3NlbWJsZSAuMmJ5dGUgZGlyZWN0aXZlcyBzaW1pbGFyIHRvIEFybSBbMV0uIEZ1cnRo
ZXIsCkdOVSBvYmpkdW1wIGdyb3VwcyBSSVNDLVYgaW5zdHJ1Y3Rpb24gYnkgMiBvciA0IGJ5dGUg
Y2h1bmtzLCBpbnN0ZWFkCmRvaW5nIGJ5dGUtZm9yLWJ5dGUuCgpBZGQgdGhlIHJlcXVpcmVkIHN3
aXRjaGVzLCBhbmQgdHJhbnNsYXRlIGZyb20gc2hvcnQvd29yZCB0byBieXRlcyB3aGVuCkFSQ0gg
aXMgInJpc2N2Ii4KCkFuIGV4YW1wbGUgaG93IHRvIGludm9rZSBkZWNvZGVjb2RlIGZvciBSSVND
LVY6CiAgJCBlY2hvICdDb2RlOiBiZjQ1IGY3OTMgMTAwNyBmN2Q5IDUwZWYgMzdhZiBkNTQxIGI3
ZDkgNzA5NyAwMGM4ICg4MGU3KQogIDYxNDAnIHwgQUZMQUdTPSItbWFyY2g9cnY2NGltYWNfemlj
Ym9tX3ppaGludHBhdXNlIiAgXAogIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxp
bnV4LWdudS0gLi9zY3JpcHRzL2RlY29kZWNvZGUKICBDb2RlOiBiZjQ1IGY3OTMgMTAwNyBmN2Q5
IDUwZWYgMzdhZiBkNTQxIGI3ZDkgNzA5NyAwMGM4ICg4MGU3KSA2MTQwCiAgQWxsIGNvZGUKICA9
PT09PT09PQogICAgIDA6ICAgYmY0NSAgICAgICAgICAgICAgICAgICAgYy5qICAgICAweGZmZmZm
ZmZmZmZmZmZmYjAKICAgICAyOiAgIDEwMDdmNzkzICAgICAgICAgICAgICAgIGFuZGkgICAgYTUs
YTUsMjU2CiAgICAgNjogICBmN2Q5ICAgICAgICAgICAgICAgICAgICBjLmJuZXogIGE1LDB4ZmZm
ZmZmZmZmZmZmZmY5NAogICAgIDg6ICAgMzdhZjUwZWYgICAgICAgICAgICAgICAgamFsICAgICBy
YSwweGY1MzgyCiAgICAgYzogICBkNTQxICAgICAgICAgICAgICAgICAgICBjLmJlcXogIGEwLDB4
ZmZmZmZmZmZmZmZmZmY5NAogICAgIGU6ICAgYjdkOSAgICAgICAgICAgICAgICAgICAgYy5qICAg
ICAweGZmZmZmZmZmZmZmZmZmZDQKICAgIDEwOiAgIDAwYzg3MDk3ICAgICAgICAgICAgICAgIGF1
aXBjICAgcmEsMHhjODcKICAgIDE0OiogIDYxNDA4MGU3ICAgICAgICAgICAgICAgIGphbHIgICAg
cmEsMTU1NihyYSkgIyAweGM4NzYyNCAgICAgICAgICA8LS0gdHJhcHBpbmcgaW5zdHJ1Y3Rpb24K
CiAgQ29kZSBzdGFydGluZyB3aXRoIHRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbgogID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAgICAwOiAgIDYxNDA4MGU3ICAg
ICAgICAgICAgICAgIGphbHIgICAgcmEsMTU1NihyYSkKClsxXSBodHRwczovL3NvdXJjZXdhcmUu
b3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMDI2MwoKU2lnbmVkLW9mZi1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIHNjcmlwdHMvZGVjb2RlY29kZSB8IDEy
ICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2RlY29kZWNvZGUgYi9zY3JpcHRzL2RlY29kZWNv
ZGUKaW5kZXggYjI4ZmQyNjg2NTYxLi44ZmU3MWMyOTIzODEgMTAwNzU1Ci0tLSBhL3NjcmlwdHMv
ZGVjb2RlY29kZQorKysgYi9zY3JpcHRzL2RlY29kZWNvZGUKQEAgLTkzLDYgKzkzLDExIEBAIGRp
c2FzKCkgewogCQkke0NST1NTX0NPTVBJTEV9c3RyaXAgJHQubwogCWZpCiAKKwlpZiBbICIkQVJD
SCIgPSAicmlzY3YiIF07IHRoZW4KKwkJT0JKRFVNUEZMQUdTPSItTSBuby1hbGlhc2VzIC0tc2Vj
dGlvbj0udGV4dCAtRCIKKwkJJHtDUk9TU19DT01QSUxFfXN0cmlwICR0Lm8KKwlmaQorCiAJaWYg
WyAkcGNfc3ViIC1uZSAwIF07IHRoZW4KIAkJaWYgWyAkUEMgXTsgdGhlbgogCQkJYWRqX3ZtYT0k
KCggJFBDIC0gJHBjX3N1YiApKQpAQCAtMTI2LDggKzEzMSwxMyBAQCBnZXRfc3Vic3RyX29wY29k
ZV9ieXRlc19udW0oKQogCWRvCiAJCXN1YnN0cis9IiRvcGMiCiAKKwkJb3Bjb2RlPSIkc3Vic3Ry
IgorCQlpZiBbICIkQVJDSCIgPSAicmlzY3YiIF07IHRoZW4KKwkJCW9wY29kZT0kKGVjaG8gJG9w
Y29kZSB8IHRyICcgJyAnXG4nIHwgdGFjIHwgdHIgLWQgJ1xuJykKKwkJZmkKKwogCQkjIHJldHVy
biBpZiBvcGNvZGUgYnl0ZXMgZG8gbm90IG1hdGNoIEBvcGxpbmUgYW55bW9yZQotCQlpZiAhIGVj
aG8gJG9wbGluZSB8IGdyZXAgLXEgIiRzdWJzdHIiOworCQlpZiAhIGVjaG8gJG9wbGluZSB8IGdy
ZXAgLXEgIiRvcGNvZGUiOwogCQl0aGVuCiAJCQlicmVhawogCQlmaQotLSAKMi4zNy4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
