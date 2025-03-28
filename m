Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF7C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gTOFtJA3FsKHQ0VXmelysz0eKfiSud3Gqo7dkQjfTqQ=; b=fxbQUhknqbJLyP
	VC4NK+bLwR7oKS9bAwc0ieom/HT13oMKA8EECVEGcfUaHDIGBhWSuolEhFzLOnmlkx6DlHPtDyTfH
	a7iM2CgiHof06H8L8tQF1NduEzK/cgNaHuzBpUOis3fS2CPXyKyh8B+SyYyVGdBSk3R44zBqPQ7s0
	MowbTjKv83gEUU8gLLqErBI3+fy706umUQ5TeBseUaxWVUj0IGYWoT3fF9oj3H1GMCAadjbLKPujJ
	CGMrrRX3zhwLhbQAqhcjDiFtodBlkEYMntLnrco5xnQUUG/XsIbNZze/YL/0U10gWbA804yCmolyg
	aVykTCbNQOesthXlIgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6kx-0000000D6cR-2yNY;
	Fri, 28 Mar 2025 10:16:07 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6kV-0000000D6ZH-04Fc
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 10:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743156923; bh=EcuiC7xJsstU7iMIVfSBPGIrko8IzU16J1B4XmArQFQ=;
	h=From:To:Cc:Subject:Date;
	b=cZAaOH9nPWadR1hgx+L69Kx3fTN4bcm3UOtzBk6BgN0t7T2l6qYti1WuHDTUbEH5t
	 GLuUmvfg77+RxRqFS5gADYvnEZCMoGciUX2xVb3adY48f7XxQ7KuH6LWSD21MsUUJ9
	 YO7001qSx5EC5CXSezNJwG7Ucq84XM2cp9LAntPc=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 3C52C2E7; Fri, 28 Mar 2025 18:15:05 +0800
X-QQ-mid: xmsmtpt1743156905traegrmkl
Message-ID: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
X-QQ-XMAILINFO: N2zgDHximsrq6XAvK1wKKG3gsLhFL0nvP/GWnZbACO7itADC08NUfqDnGjqbo+
	 /m/BCrc7k4rCDdFU47S0uG5BJkDkMjnHTmi+PbrjajzIw9tIfORusIAa+MwyROTQ8NqjEOD6WpBC
	 enbtYB9kpkrBXrSsRMiTWCKoln2962f+Ebh9gOJvsQrujgHJr+A2q691wjE2XnQ4S+88QWp6pzJw
	 20twSRMP475SqKs8PMm9HnQgvv+NIBgesF0IncKWSah2MxZb9H3pzkwsKDT5iSMiIa4Tda3D8o7t
	 Wllva/NGZWaEX7UcfZbnEfxB5xG1i8TMZ1jsLkBZy0kNlXI+yGkUWFJtSzCRTiQTq6y6e2BBWd2E
	 OsaCUdVJVdreyqhe45roscWbTrj2gujYKYNEmdn0zOmIoj3ctXlnLfC4pLkUQXdRNbOqfL2GPErs
	 K8AnY5uSdA+2WFILIB9/8wOM0NTovlVZKzAqA/EVCJ6FI13Lxh2UJieriRjaVQduGlv6lxb1eDgr
	 cYPgRXLUsE5AWjlG6BvHLLZd3rKKEELEWS47ccRaooWpfqCcID+jvErsFsbUQ8cHFcZfa9GM98fv
	 d4m9+bpOI0qLpbiGqrnt21ShHAFjoiQoCB24felJDzo7WcJmTW0lJtD6OZ0jIKoaDjZbJsB+WS9+
	 YY5LrVYzN/J2EPFi/yLCZvMF59knYOw1gPPC0mGYIWuGwS+92JchDEhem/gmkRKvAqLJfhraLnMY
	 mIE2a960p/fufP0rG5wKpwU2tEv9SGMV8OywoaNxnWXDdnwIGQb09aOIKRcALtYXMNDXhRymWD8p
	 eXzg+cQ4vGM51By4YXD3+4pZowOJbCY+D1C+lBjcaHYilGm7yeUbGx5y6wRvVqTN3YOc23lJ4GuW
	 5XGLmIX/A0joo5Q6HCrQXh+EV6l7GVAvDA7yY+vLxGojOxG+TTV1tr9kE3rdF8oX9a95lsmTFInQ
	 wo2gTaJH1JFTYdUimHk2nKbn3dfbVfVE1lwmBEGsQCd9ud00sIXJc0f2tU8KZLXTORezgUcqbp8E
	 /0dGwUZhYJq40GrGPk
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Yeking@Red54.com
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Debbie Maliotaki <dmaliotaki@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:14:22 +0000
X-OQ-MSGID: <20250328101422.52851-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_031603_820458_0D86BE46 
X-CRM114-Status: GOOD (  10.05  )
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

RnJvbTog6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0BSZWQ1NC5jb20+CgpJdCBpcyB0
aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGFwcGVuZGVkIHRvIHRoZSBib290bG9hZGVyIGNvbW1h
bmQgbGluZSwKbm90IHRoZSBib290bG9hZGVyIGNvbW1hbmQgbGluZSBhcHBlbmRlZCB0byB0aGUg
YnVpbHQtaW4gY29tbWFuZCBsaW5lLgoKRml4ZXM6IDNhZWQ4YzQzMjY3ZSAoIlJJU0MtVjogVXBk
YXRlIEtjb25maWcgdG8gYmV0dGVyIGhhbmRsZSBDTURMSU5FIikKU2lnbmVkLW9mZi1ieTog6LCi
6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0BSZWQ1NC5jb20+Ci0tLQogYXJjaC9yaXNjdi9L
Y29uZmlnIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCA1NGVkMmE4Y2Q3YWYuLjRjZDE4ZDBkMDdiMyAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTE0NCw4ICsxMTQ0LDgg
QEAgY29uZmlnIENNRExJTkVfRkFMTEJBQ0sKIGNvbmZpZyBDTURMSU5FX0VYVEVORAogCWJvb2wg
IkV4dGVuZCBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMiCiAJaGVscAotCSAgVGhlIGNvbW1h
bmQtbGluZSBhcmd1bWVudHMgcHJvdmlkZWQgZHVyaW5nIGJvb3Qgd2lsbCBiZQotCSAgYXBwZW5k
ZWQgdG8gdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZS4gVGhpcyBpcyB1c2VmdWwgaW4KKwkgIFRo
ZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgd2lsbCBiZSBhcHBlbmRlZCB0byB0aGUgY29tbWFuZC0K
KwkgIGxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGR1cmluZyBib290LiBUaGlzIGlzIHVzZWZ1bCBp
bgogCSAgY2FzZXMgd2hlcmUgdGhlIHByb3ZpZGVkIGFyZ3VtZW50cyBhcmUgaW5zdWZmaWNpZW50
IGFuZAogCSAgeW91IGRvbid0IHdhbnQgdG8gb3IgY2Fubm90IG1vZGlmeSB0aGVtLgogCi0tIAoy
LjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
