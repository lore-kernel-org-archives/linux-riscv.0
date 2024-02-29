Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC5CC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 19:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4NXsUU2/OsHXj0JsaJVYrTsdhFonp/eo4SPcLe4IMsg=; b=zwtHOoua/lOeIN
	DB/DJzPjmeg/LDRLvxCAX90C+Q/2WstIsrCd0igr50PzXxD0ITZlp3yNeFq5gEpmuM55wbZtp+dRq
	Uo+YGdMSkAHr9vi7qfcvMDEKbTSBCtU4wg9Z7FV9l1yYEL5pQBYFfqn5vMLTswvlOputPXGhDyGKP
	ZbgobNpcUw4saHrN8EKFQiECXut7SK5ud+cE6FF0dKrQhHPhMlu340qX9YFLQUr+7QvDUulWS96uS
	aa+rhz/61wUjNy5zdCeI2wRWlBILK339/taoiDQ3CoXEyjAbT2WeQz7ZtCADkrUzFQemI69eJwiYt
	rdltXDA1lYcmV2xiV2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflud-0000000EqJO-1qx4;
	Thu, 29 Feb 2024 19:17:47 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflub-0000000EqIx-0ugC
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 19:17:46 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 41TJHc53009359
	for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 21:17:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1709234253; x=1711826253;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rRXx9P2fyWPVK8sV8uJDbjnXN7ir2je1z7JiOtduc5E=;
	b=gYOL+XtNrBpNzN3U4R08zOgYYjq7OJGSI0FAUc7Ds5BFAe1uGxztFtSq2Bf+t33+
	06AeFOtAPEcA6X4E59LB/CCSO5rVUBc0r87SLIb7CP2DH5+zPMH0OEJdd1e5ZYPh
	QEgpXuUa6nN2nEXffPI95/AR9lTtr+2sIOTSJAJ2+qGgLIObeBYPiWi0fNd9qWB/
	+6ZuNFwuBQSm+RQFT3Bi19TP81SBJm2Kk9zALrBY0aVggJkjc5512mnX7oRB+zGh
	vjxb8jw4Tb4zzqAvw3XI6ozac2gzIHg4it4Qub/CyDFRUDDfTaH4/Cf/de5s/ZQF
	FI+fK8HtKed5sCPuLMitJA==;
X-AuditID: 8b5b014d-a17eb70000002178-80-65e0d84d3c1c
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 49.7E.08568.D48D0E56; Thu, 29 Feb 2024 21:17:33 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: dvlachos at ics.forth.gr
From: Dimitris Vlachos <dvlachos@ics.forth.gr>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        palmer@dabbelt.com, alexghiti@rivosinc.com, paul.walmsley@sifive.com
Cc: clameter@sgi.com, akpm@linux-foundation.org, rppt@kernel.org,
        arnd@arndb.de, mick@ics.forth.gr, csd4492@csd.uoc.gr,
        maraz@ics.forth.gr
Subject: [PATCH -fixes v2] riscv: Sparse-Memory/vmemmap out-of-bounds fix
Date: Thu, 29 Feb 2024 21:17:23 +0200
Message-Id: <20240229191723.32779-1-dvlachos@ics.forth.gr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsXSHT1dWdf3xoNUg+N3lSzmrF/DZvG48Tij
	xd9Jx9gt1jeuY7dY8zTE4vKuOWwW2z63sFnM6P/PatH87hy7xcvLPcwWbbP4LY6s387kwOPx
	+9ckRo9Pl3+xeLx5+ZLF4+GmS0wem1Z1snmcmPGbxWPzknqPG7MiPO5ef8nkcan5OrvH501y
	AdxRXDYpqTmZZalF+nYJXBm3dzYyF/RwV8x9vZK5gXEvZxcjJ4eEgInE/75mpi5GLg4hgaOM
	Ev+f/WCFSNhK7F1wnAnEZhPQk1g/fw87SJGIwARGiV/vDzODOMwCcxglbrzqBspwcAgLeEpc
	P+oA0sAioCrxu+kiC4jNK2AlsfXlUyaQEgkBeYnFDyQgwoISJ2c+YQEJMwuoS6yfJwQSZgaq
	aN46m3kCI+8sJFWzEKpmIalawMi8ilEgscxYLzO5WC8tv6gkQy+9aBMjOOgZfXcw3t78Vu8Q
	IxMH4yFGCQ5mJRFeGcG7qUK8KYmVValF+fFFpTmpxYcYpTlYlMR5T9guSBYSSE8sSc1OTS1I
	LYLJMnFwSjUwCVpGr3xR84O7+JyGQ5jcQtZ3U+ymBXxp4kni+v1f+tW99NVVDDpSXLtDPW5n
	Fv/ok+KYxTPpeol05GVBpz86NiIbJhR0M3exp70S3xinVqqw78GFnoxHvx69WRpTEZ4avZn9
	0wTDeaFy8/Rj5R8EL3j+NHPp+Q1FEWZvg7UZ06NvTHo8w1iuYJoz844DIeaGHyeVXQn2WxPW
	qPc2LTYydWeawJeK9xLGd9IvXXiWvO9k6stjWsV359vs/LZl2Uphbev62nmLntTKLyyvvHU1
	94pb/Zc0+3kBFjPs+GcmdWot/ZUd4V60JH/d9AMXr2ae+SoU9/jXDt9ZbqvcDlk2fDmpdy78
	vn7Fne7b1hwuSizFGYmGWsxFxYkA01WTUOkCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_111745_634303_882269C7 
X-CRM114-Status: UNSURE (   8.35  )
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

T2Zmc2V0IHZtZW1tYXAgc28gdGhhdCB0aGUgZmlyc3QgcGFnZSBvZiB2bWVtbWFwIHdpbGwgYmUg
bWFwcGVkCnRvIHRoZSBmaXJzdCBwYWdlIG9mIHBoeXNpY2FsIG1lbW9yeSBpbiBvcmRlciB0byBl
bnN1cmUgdGhhdAp2bWVtbWFw4oCZcyBib3VuZHMgd2lsbCBiZSByZXNwZWN0ZWQgZHVyaW5nCnBm
bl90b19wYWdlKCkvcGFnZV90b19wZm4oKSBvcGVyYXRpb25zLgpUaGUgY29udmVyc2lvbiBtYWNy
b3Mgd2lsbCBwcm9kdWNlIGNvcnJlY3QgU1YzOS80OC81NyBhZGRyZXNzZXMKZm9yIGV2ZXJ5IHBv
c3NpYmxlL3ZhbGlkIERSQU1fQkFTRSBpbnNpZGUgdGhlIHBoeXNpY2FsIG1lbW9yeSBsaW1pdHMu
Cgp2MjpBZGRyZXNzIEFsZXgncyBjb21tZW50cwoKU3VnZ2VzdGVkLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IERpbWl0cmlzIFZsYWNo
b3MgPGR2bGFjaG9zQGljcy5mb3J0aC5ncj4KUmVwb3J0ZWQtYnk6IERpbWl0cmlzIFZsYWNob3Mg
PGR2bGFjaG9zQGljcy5mb3J0aC5ncj4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI0MDIwMjEzNTAzMC40MjI2NS0xLWNzZDQ0OTJAY3NkLnVvYy5ncgpGaXhl
czogZDk1ZjFhNTQyYzNkICgiUklTQy1WOiBJbXBsZW1lbnQgc3BhcnNlbWVtIikKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggMGM5
NDI2MGI1Li44NzVjOWEwNzkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NCw3ICs4
NCw3IEBACiAgKiBEZWZpbmUgdm1lbW1hcCBmb3IgcGZuX3RvX3BhZ2UgJiBwYWdlX3RvX3BmbiBj
YWxscy4gTmVlZGVkIGlmIGtlcm5lbAogICogaXMgY29uZmlndXJlZCB3aXRoIENPTkZJR19TUEFS
U0VNRU1fVk1FTU1BUCBlbmFibGVkLgogICovCi0jZGVmaW5lIHZtZW1tYXAJCSgoc3RydWN0IHBh
Z2UgKilWTUVNTUFQX1NUQVJUKQorI2RlZmluZSB2bWVtbWFwCQkoKHN0cnVjdCBwYWdlICopVk1F
TU1BUF9TVEFSVCAtIChwaHlzX3JhbV9iYXNlID4+IFBBR0VfU0hJRlQpKQogCiAjZGVmaW5lIFBD
SV9JT19TSVpFICAgICAgU1pfMTZNCiAjZGVmaW5lIFBDSV9JT19FTkQgICAgICAgVk1FTU1BUF9T
VEFSVAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
