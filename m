Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F485C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA9420E65
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V9Q57Vmg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV+6FPCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA9420E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4uYYwVXZdNtPVMb5bYdRR6i/1cm83pnJiChnWFa+vDo=; b=V9Q57VmgDbbW4Sd8MBIABx3eL+
	qTjvJo5EfBBlz0F4pDeENO2j6JMidMWnn17vJMqiyemPvu5owlN0scfyHPlcJdrUDG1GvPq/EB7+l
	GkpLksOwXFj6UB8V7JjeX8+FmI+YC7QQKu44W5XJgVbsOy3H39XVRnEofbHYLFBjsBSvNs+e76UlA
	u9AOdRvKIDlXU13d41hh/EWVlTbc5Gj95fBtnkCRiKeF71vXRyJmKAO1Vl00t2ToSz5rjALqp0whO
	L7tloWkR67H0213EghOxzAUd14KcCJzw8HqUnucoJ+ItGRf+/8zRyQZtH/jMrRC1Id/wFZzfcBN2w
	H7UOsvew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpDZm-0005rm-0D; Sat, 27 Jun 2020 16:21:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpDZi-0005qm-3u
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 16:21:08 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 315E220720;
 Sat, 27 Jun 2020 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593274865;
 bh=Xk8MgSMAWg+6GPcCp7ny9qf8M1piZpQfBkx7+eVVJJc=;
 h=From:To:Cc:Subject:Date:From;
 b=IV+6FPCBPulGj+ZXnqXoKcI4g3Sc/sUC2/CrFbxiKWF0IYt7hqKOUX/Y1h4k8IUMf
 TpIeeHk6iRG7noRyfYxxa4SfErUKjl+m0aA4f9w0le7KHIDReHpdHCdIjzwFglM1MU
 zrMIPXhpkZbeGimEgHPweh2dNDWnWkcCdLb3jh6A=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com
Subject: [PATCH] riscv: Fixup compile error BUILD_BUG_ON failed
Date: Sat, 27 Jun 2020 16:20:02 +0000
Message-Id: <1593274802-46332-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVW5mb3J0dW5hdGVseSwg
dGhlIGN1cnJlbnQgY29kZSBjb3VsZG4ndCBiZSBjb21waWxlZCwgYmVjYXVzZQpCVUlMRF9CVUdf
T04gbmVlZHMgYSBzdGF0aWMgZGVmaW5lZCB2YWx1ZSwgbm90IGEgZHluYW1pYwp2YXJpYWJsZSB3
aXRoIGEwIHJlZ3MuIEp1c3QgdXNlIGl0IGlubGluZSBhcyBhIHNvbHV0aW9uLgoKICBDQyAgICAg
IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm8KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVk
ZS9saW51eC9rZXJuZWwuaDoxMSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC9saXN0Lmg6OSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9wcmVlbXB0
Lmg6MTEsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvc3BpbmxvY2suaDo1
MSwKICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmM6NjoKSW4g
ZnVuY3Rpb24g4oCYZml4X3RvX3ZpcnTigJksCiAgICBpbmxpbmVkIGZyb20g4oCYcGF0Y2hfbWFw
4oCZIGF0IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmM6Mzc6MTc6Ci4vaW5jbHVkZS9saW51eC9j
b21waWxlci5oOjM5MjozODogZXJyb3I6IGNhbGwgdG8g4oCYX19jb21waWxldGltZV9hc3NlcnRf
MjA14oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUdfT04gZmFpbGVk
OiBpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzCiAgX2NvbXBpbGV0aW1lX2Fzc2VydChj
b25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4vaW5jbHVkZS9saW51eC9jb21waWxl
ci5oOjM3Mzo0OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVf
YXNzZXJ04oCZCiAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgIFwKICAgIF5+fn5+fgouL2luY2x1
ZGUvbGludXgvY29tcGlsZXIuaDozOTI6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mF9jb21waWxldGltZV9hc3NlcnTigJkKICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwg
bXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQogIF5+fn5+fn5+fn5+fn5+
fn5+fn4KLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjM5OjM3OiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8g4oCYY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAjZGVmaW5lIEJVSUxEX0JVR19P
Tl9NU0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Ci4vaW5jbHVk
ZS9saW51eC9idWlsZF9idWcuaDo1MDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
QlVJTERfQlVHX09OX01TR+KAmQogIEJVSUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJTERf
QlVHX09OIGZhaWxlZDogIiAjY29uZGl0aW9uKQogIF5+fn5+fn5+fn5+fn5+fn4KLi9pbmNsdWRl
L2FzbS1nZW5lcmljL2ZpeG1hcC5oOjMyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhCVUlMRF9CVUdfT07igJkKICBCVUlMRF9CVUdfT04oaWR4ID49IF9fZW5kX29mX2ZpeGVkX2Fk
ZHJlc3Nlcyk7CiAgXn5+fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+CkNjOiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwu
b3JnPgpDYzogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgotLS0KIGFyY2gvcmlzY3Yva2Vy
bmVsL3BhdGNoLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCmluZGV4IGQ0YTY0ZGYuLmY4ZTg0ZjIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gu
YwpAQCAtMjAsNyArMjAsNyBAQCBzdHJ1Y3QgcGF0Y2hfaW5zbiB7CiB9OwogCiAjaWZkZWYgQ09O
RklHX01NVQotc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQor
c3RhdGljIGlubGluZSB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwgaW50IGZpeG1hcCkKIHsK
IAl1aW50cHRyX3QgdWludGFkZHIgPSAodWludHB0cl90KSBhZGRyOwogCXN0cnVjdCBwYWdlICpw
YWdlOwpAQCAtMzcsNyArMzcsNiBAQCBzdGF0aWMgdm9pZCAqcGF0Y2hfbWFwKHZvaWQgKmFkZHIs
IGludCBmaXhtYXApCiAJcmV0dXJuICh2b2lkICopc2V0X2ZpeG1hcF9vZmZzZXQoZml4bWFwLCBw
YWdlX3RvX3BoeXMocGFnZSkgKwogCQkJCQkgKHVpbnRhZGRyICYgflBBR0VfTUFTSykpOwogfQot
Tk9LUFJPQkVfU1lNQk9MKHBhdGNoX21hcCk7CiAKIHN0YXRpYyB2b2lkIHBhdGNoX3VubWFwKGlu
dCBmaXhtYXApCiB7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
