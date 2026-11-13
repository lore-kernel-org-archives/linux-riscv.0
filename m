Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10388606A8B5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pXX8E+g0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HrQW+y5Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wa4I9dX9YRKvCbG8DcVPaUF8kMEQq+rR8wBN3sXw1bQ=; b=pXX8E+g0CfecV4yP/r/sx9DHit
	oQYDrHT5ivOtZrBJECyTyjRZxCk2rskef+DhAdW4DltlvWMHj0vuxNyeCLgGYzlhEywbCgvdaR/Te
	SJBKd0WU4x4C68RNkPSIapGocZwp9t/JTnF6mgnbqKkWmrarQ36n11Am34vb27go1CJNOIzpPjiny
	tRiwFmeOr6O98WsUXTj/D68dsv82+TcUZJXl6FqvgjQzIwAx8f9lmx+82nB1jKnuGBHyfZM2WcxsY
	bAUoFAfN4IKNZ1usZuEwDCS1imKhDD4E5Oe/aZwwoQz1QvDN1Mu7wZ9tz8Jc1HePI9Tu1q+gpDpka
	BZHPFq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWu-0000000Brsn-2NJe;
	Fri, 13 Nov 2026 07:17:00 +0000
Received: from out-134.mta0.migadu.com ([2001:41d0:1004:224b::86] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlWg-0000000BrnT-0S6w
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:16:59 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RQ8pA60G+MeCru45VDvMKHyN9yX33rvbO0twB8IXd74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794554201; v=1; x=1795159001;
 b=HrQW+y5QO8vDTKAsYV89vMRox6nntGzm8OdLlVtRs/Sid3j/8LzLUG6vyjA2mLzXM5XR2cAp
 UdK3wBOwwKR5LAYG6akoZsmC4N5sn1/iNhjiy+KzjmytkpqSsqPgRUG8BRwEzpZKIfxVcCmhkDX
 v4qAncDQRc4nguv+KYghDYAA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7f7d0d625172132b;
	Fri, 13 Nov 2026 07:16:41 +0000
X-Mizu-Trace-ID: 7f7d0d625172132b
X-Migadu-Flow: FLOW_OUT
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	WangYuli <wangyuli@uniontech.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: kgdb: Fix break size, insn patch and masking
Date: Fri, 13 Nov 2026 08:16:11 +0100
Message-ID: <20261113071616.219623-1-clement.leger@linux.dev>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231646_288717_E1D19850 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzbWFsbCBzZXJpZXMgZml4ZXMgYSBmZXcgcHJvYmxlbXMgdGhhdCB3ZXJlIHNwb3R0ZWQg
d2l0aCBrZ2RiLgoKRmlyc3QgcGF0Y2ggaXMgdGhlIHVzZSBvZiBwYXRjaF9pbnNuX3dyaXRlKCkg
dG8gc2V0IGJyZWFrcG9pbnRzIGluc3RlYWQKb2YgY29weV90b19rZXJuZWxfbm9mYXVsdCgpLiBU
aGlzIGZpeGVzIHRoZSB1c2Ugb2Yga2dkYiB3aXRoCkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCB3
aGljaCBtYXBzIHRleHQgYXMgUlguCgpTZWNvbmQgcGF0Y2ggcmVtb3ZlcyB0aGUgaGFyZGNvZGVk
IGVwYyArPSA0IHdpdGggQlJFQUtfSU5TVFJfU0laRSBzbwp0aGF0IGl0IHdvcmtzIHdpdGggQ09O
RklHX1JJU0NWX0lTQV9DLgoKTGFzdCBvbmUgaXMgbW9yZSBvZiBhIGNvcnJlY3RuZXNzIGZpeCB3
aXRoIHJlc3BlY3QgdG8gamFsciBpbnN0cnVjdGlvbnMuCklTQSBzcGVjaWZpZXMgdGhhdCB0aGUg
dGFyZ2V0IGFkZHJlc3MgaXMgY29tcHV0ZWQgYnkgbWFza2luZyB0aGUgTFNCIHRvCjAuCgpDbMOp
bWVudCBMw6lnZXIgKDMpOgogIHJpc2N2OiBrZ2RiOiB1c2UgcGF0Y2hfaW5zbl93cml0ZSgpIHRv
IHNldCBicmVha3BvaW50cwogIHJpc2N2OiBrZ2RiOiB1c2UgQlJFQUtfSU5TVFJfU0laRSBpbnN0
ZWFkIG9mIGhhcmRjb2RlZCB2YWx1ZQogIHJpc2N2OiBrZ2RiOiBjbGVhciBiaXQgMCBvZiBzaW5n
bGUtc3RlcCBqdW1wIHRhcmdldHMKCiBhcmNoL3Jpc2N2L2tlcm5lbC9rZ2RiLmMgfCAzOSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCkNsw6ltZW50IEzDqWdlcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
