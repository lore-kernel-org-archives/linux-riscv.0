Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03DDC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5PuSdZWFYBBLA/MyzS5NoYoon+pnaoGSm9W4sdMaSI8=; b=4HcV8Zi0v7TgEx
	j9/k/JoHClenSghI2+PhGsW9u6cITUkFCQHh6sWYI8GwvZDqxxis9XbPRy4fwL+WeDMbcfljwxnxu
	D5CyrofmvXNfipjzDvBKQ5ZKrtGEokFnizzLu+A+HVCYzqv51qoKojTfPstHnewOdSOKmfuHOTAUa
	PrboNmk0B5GGBnoLGYycxQIQ/uKjGlev/uDkqhEzkyML4YiVAaaqMxGs4V6VdDQZcbiHKbuuzs21m
	TmhixSLZxbz2DZkaYCWQFWVLEjtLao9buydK5uCEve1rhRpdFa5vM0E5fBRBemP61wxuEPMWv0Kmi
	8aMNKQF0NMyhFTE5+CuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbyh-003mMy-1n;
	Fri, 24 Mar 2023 07:36:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbyd-003mM7-1s
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 07:36:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED0E1B81FDA;
	Fri, 24 Mar 2023 07:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC356C433D2;
	Fri, 24 Mar 2023 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679643400;
	bh=BBS9cSTname+Z1/k6YNt/nmdj4wvYmKElUY7I0mcqBI=;
	h=From:To:Cc:Subject:Date:From;
	b=rDQrw1PN087BeT3VrGtecrJalaSgojkdpf8sH9ycPAcc0VFY6USfYCuXf+HzgvtnY
	 ZBKrIykAz+2aq/t8xLXZCtuXq9cyOQ5KRfH6pwn+9h633cZ19+Kegx48iGbQvPX2a/
	 rPUaVZ0+3vvBrOat7/3QV/XC+xOkLSjUwBrLH3uPGL43Q0zkskOYaj0XMx439stJcp
	 8NfnYd9S7Haxb5Kni2pjf3swk6A8VWJysCTx5ktEE1jbEKPdukR2n65lkpzX1PZYe4
	 pH7foapRz5RZa4b16jkHjNxWpRB+XNZypEGbI8+wqD/xgA5hQ2ucUf4furLV82OnoD
	 RI4dApSC69dsQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	esyr@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH V3] uapi: Fixup strace compile error
Date: Fri, 24 Mar 2023 03:36:30 -0400
Message-Id: <20230324073630.161034-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_003643_919862_AB54E5FF 
X-CRM114-Status: GOOD (  13.55  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKRXhwb3J0IEZfKjY0IGRl
ZmluaXRpb25zIHRvIHVzZXJzcGFjZSBwZXJtYW5lbnRseS4gImlmbmRlZiIgdXNhZ2UgbWFkZSBp
dAp2YWlsYWJsZSBhdCBhbGwgdGltZXMgdG8gdGhlIHVzZXJzcGFjZSwgYW5kIHRoaXMgY2hhbmdl
IGhhcyBhY3R1YWxseSBicm9rZW4KYnVpbGRpbmcgc3RyYWNlIHdpdGggdGhlIGxhdGVzdCBrZXJu
ZWwgaGVhZGVycy4gVGhlcmUgY291bGQgYmUgc29tZSBkZWJhdGUKd2hldGhlciBoYXZpbmcgdGhl
c2UgRl8qNjQgZGVmaW5pdGlvbnMgZXhwb3NlZCB0byB0aGUgdXNlciBzcGFjZSA2NC1iaXQKYXBw
bGljYXRpb25zLCBidXQgaXQgc2VlbXMgdGhhdCB3ZXJlIG5vIGhhcm0gKGFzIHRoZXkgd2VyZSBl
eHBvc2VkIGFscmVhZHkKZm9yIHF1aXRlIHNvbWUgdGltZSksIGFuZCB0aGV5IGFyZSB1c2VmdWwg
YXQgbGVhc3QgZm9yIHN0cmFjZSBmb3IgY29tcGF0CmFwcGxpY2F0aW9uIHRyYWNpbmcgcHVycG9z
ZXMuCgpIZXJlIGlzIHRoZSBjb21waWxlIGVycm9yIGxvZzoKLi4vLi4vLi4vc3JjL3hsYXQvZmNu
dGxjbWRzLmg6NTQ6NzogZXJyb3I6IOKAmEZfR0VUTEs2NOKAmSB1bmRlY2xhcmVkIGhlcmUKKG5v
dCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEZfR0VUTEvigJk/CiAgIDU0IHwgIFhM
QVQoRl9HRVRMSzY0KSwKICAgICAgfCAgICAgICBefn5+fn5+fn4KLi4vLi4vLi4vc3JjL3hsYXQu
aDo2NDo1NDogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhYTEFU4oCZCiAgIDY0IHwg
IyBkZWZpbmUgWExBVCh2YWwpICAgICAgICAgICAgICAgICAgICAgIHsgKHVuc2lnbmVkKSh2YWwp
LCAjdmFsCiAgICAgIH0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fgouLi8uLi8uLi9zcmMveGxhdC9mY250bGNtZHMuaDo1Nzo3
OiBlcnJvcjog4oCYRl9TRVRMSzY04oCZIHVuZGVjbGFyZWQgaGVyZQoobm90IGluIGEgZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4g4oCYRl9TRVRMS+KAmT8KICAgNTcgfCAgWExBVChGX1NFVExLNjQp
LAogICAgICB8ICAgICAgIF5+fn5+fn5+fgouLi8uLi8uLi9zcmMveGxhdC5oOjY0OjU0OiBub3Rl
OiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFhMQVTigJkKICAgNjQgfCAjIGRlZmluZSBYTEFU
KHZhbCkgICAgICAgICAgICAgICAgICAgICAgeyAodW5zaWduZWQpKHZhbCksICN2YWwKICAgICAg
fQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+Ci4uLy4uLy4uL3NyYy94bGF0L2ZjbnRsY21kcy5oOjYwOjc6IGVycm9yOiDigJhG
X1NFVExLVzY04oCZIHVuZGVjbGFyZWQgaGVyZQoobm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYRl9TRVRMS1figJk/CiAgIDYwIHwgIFhMQVQoRl9TRVRMS1c2NCksCiAgICAgIHwg
ICAgICAgXn5+fn5+fn5+fgouLi8uLi8uLi9zcmMveGxhdC5oOjY0OjU0OiBub3RlOiBpbiBkZWZp
bml0aW9uIG9mIG1hY3JvIOKAmFhMQVTigJkKICAgNjQgfCAjIGRlZmluZSBYTEFUKHZhbCkgICAg
ICAgICAgICAgICAgICAgICAgeyAodW5zaWduZWQpKHZhbCksICN2YWwKICAgICAgfQoKRml4ZXM6
IDMwNmY3Y2MxZTkwNjEgInVhcGk6IGFsd2F5cyBkZWZpbmUgRl9HRVRMSzY0L0ZfU0VUTEs2NC9G
X1NFVExLVzY0IGluIGZjbnRsLmgiClNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
ClJlcG9ydGVkLWJ5OiBFdWdlbmUgU3lyb21pYXRuaWtvdiA8ZXN5ckByZWRoYXQuY29tPgpBY2tl
ZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CkNjOiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CkNj
OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgotLS0KQ2hhbmdlbG9nCnYzOgogLSBB
ZGQgZXJyb3IgbG9nCgp2MjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDgwNDAy
NTQ0OC4xMjQwNzgwLTEtZ3VvcmVuQGtlcm5lbC5vcmcvCiAtIE9wdGltaXplIGNvbW1pdCBsb2cK
CnYxOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwNjEzMDEzMDUxLjE3NDE0MzQt
MS1ndW9yZW5Aa2VybmVsLm9yZy8KLS0tCiBpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwu
aCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9mY250bC5oIGIvaW5jbHVkZS91YXBpL2FzbS1nZW5lcmlj
L2ZjbnRsLmgKaW5kZXggMWVjZGI5MTFhZGQ4Li4zYTM4OTg5NTMyOGEgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9mY250bC5oCisrKyBiL2luY2x1ZGUvdWFwaS9hc20tZ2Vu
ZXJpYy9mY250bC5oCkBAIC0xMTYsMTMgKzExNiwxMSBAQAogI2RlZmluZSBGX0dFVFNJRwkxMQkv
KiBmb3Igc29ja2V0cy4gKi8KICNlbmRpZgogCi0jaWYgX19CSVRTX1BFUl9MT05HID09IDMyIHx8
IGRlZmluZWQoX19LRVJORUxfXykKICNpZm5kZWYgRl9HRVRMSzY0CiAjZGVmaW5lIEZfR0VUTEs2
NAkxMgkvKiAgdXNpbmcgJ3N0cnVjdCBmbG9jazY0JyAqLwogI2RlZmluZSBGX1NFVExLNjQJMTMK
ICNkZWZpbmUgRl9TRVRMS1c2NAkxNAogI2VuZGlmCi0jZW5kaWYgLyogX19CSVRTX1BFUl9MT05H
ID09IDMyIHx8IGRlZmluZWQoX19LRVJORUxfXykgKi8KIAogI2lmbmRlZiBGX1NFVE9XTl9FWAog
I2RlZmluZSBGX1NFVE9XTl9FWAkxNQotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
