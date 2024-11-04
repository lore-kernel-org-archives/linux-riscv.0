Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0177D1BDE7
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ADElOVsxwIIC8Rj8Eeyd37AF7YFbDPER97irh9fGxH4=; b=CzwyG4XEy42ZAH
	K8zZCFzOuz5w+1U/AwC1l83uWjIKsoTzTkBgA6z/pzLpF80eJuuupbx2Dw0/QVtYbqpVi9La5xwFu
	hSlX7ubWEuHjAKrob/sO1QD9F8HJ5PAHtTq36fakZAUzKMS9wA8mTb0qjlSEzWF0188ahx7AqDTa/
	Sw598gD5rL23Bh3z0krdeb/tMnOF/kYAgN/fhSiZnLCKDULNdySRJy3uJXH39yTCaE+r4nqjeFvjN
	L2F8uekQPrZNNi8jzFfSO1EzZtegXVw40Fv6HdcYB3EPKwmUADxN+a6tDXbI3SJiW6wzXNOdy9df3
	ti3eT55T/ncqynl2wyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82i5-0000000EtL1-2esN;
	Mon, 04 Nov 2024 19:25:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Xn-0000000Es2R-3Fdp;
	Mon, 04 Nov 2024 19:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52D3A5C54B8;
	Mon,  4 Nov 2024 19:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A51EC4CECE;
	Mon,  4 Nov 2024 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747718;
	bh=ynCoOheYITSrvR0l1B39csTWu2Mu+AVasOWlOaMf7pE=;
	h=From:To:Cc:Subject:Date:From;
	b=UckN6poH2bAbu2sww/PQHNDSlbChui8JoY02ti74E41RmREqtVFhEk9KW8sjW2uVB
	 gaq0mUMB6NbOeFFIfkomR3RwnCxSkrhgLetGEO2sGj+xLFA3ncO4YFCsCaNCGTZU1T
	 +Z0gS78hM3T0Njfvo9eDqJFrFso7XI7hOAsaiF3J440t7eEz+4CODWT2a75ZKLF7j5
	 EhluggIvLloouuuOp0kp/DBGjLTZ6OMrC/tU+pFChydMkzsQb5G1mzn4irrSbvbdpn
	 uRRGSvuK+xE+rJV9QKt53Yi+C5AGyMpJkH7So48HlGjLwaSnzals1PSBottuj8cc0g
	 KZJw9kQ21AYTA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kvm: Fix out-of-bounds array access
Date: Mon,  4 Nov 2024 20:15:01 +0100
Message-ID: <20241104191503.74725-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_111519_891702_F2CAA614 
X-CRM114-Status: GOOD (  11.22  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKSW4ga3ZtX3Jpc2N2X3Zj
cHVfc2JpX2luaXQoKSB0aGUgZW50cnktPmV4dF9pZHggY2FuIGNvbnRhaW4gYW4Kb3V0LW9mLWJv
dW5kIGluZGV4LiBUaGlzIGlzIHVzZWQgYXMgYSBzcGVjaWFsIG1hcmtlciBmb3IgdGhlIGJhc2UK
ZXh0ZW5zaW9ucywgdGhhdCBjYW5ub3QgYmUgZGlzYWJsZWQuIEhvd2V2ZXIsIHdoZW4gdHJhdmVy
c2luZyB0aGUKZXh0ZW5zaW9ucywgdGhhdCBzcGVjaWFsIG1hcmtlciBpcyBub3QgY2hlY2tlZCBw
cmlvciBpbmRleGluZyB0aGUKYXJyYXkuCgpBZGQgYW4gb3V0LW9mLWJvdW5kcyBjaGVjayB0byB0
aGUgZnVuY3Rpb24uCgpGaXhlczogNTZkOGEzODViNjA1ICgiUklTQy1WOiBLVk06IEFsbG93IHNv
bWUgU0JJIGV4dGVuc2lvbnMgdG8gYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCIpClNpZ25lZC1vZmYt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCkRvbid0IGtub3cgaWYg
aXQgbWF0dGVycywgYnV0IEkgaGl0IHRoaXMgd2hlbiB0cnlpbmcga3ZtdG9vbC4KCgpCasO2cm4K
LS0tCmFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwppbmRleCA3
ZGUxMjhiZThkYjkuLjZlNzA0ZWQ4NmE4MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCkBAIC00ODYsMTkgKzQ4Niwy
MiBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IAlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2Jp
X2NvbnRleHQ7CiAJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICpl
bnRyeTsKIAljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0OwotCWludCBp
OworCWludCBpZHgsIGk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsg
aSsrKSB7CiAJCWVudHJ5ID0gJnNiaV9leHRbaV07CiAJCWV4dCA9IGVudHJ5LT5leHRfcHRyOwor
CQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKworCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlf
U0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykpCisJCQljb250aW51ZTsKIAogCQlpZiAoZXh0LT5w
cm9iZSAmJiAhZXh0LT5wcm9iZSh2Y3B1KSkgewotCQkJc2NvbnRleHQtPmV4dF9zdGF0dXNbZW50
cnktPmV4dF9pZHhdID0KLQkJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5BVkFJTEFCTEU7
CisJCQlzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVT
X1VOQVZBSUxBQkxFOwogCQkJY29udGludWU7CiAJCX0KIAotCQlzY29udGV4dC0+ZXh0X3N0YXR1
c1tlbnRyeS0+ZXh0X2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPworCQlzY29udGV4dC0+
ZXh0X3N0YXR1c1tpZHhdID0gZXh0LT5kZWZhdWx0X2Rpc2FibGVkID8KIAkJCQkJS1ZNX1JJU0NW
X1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEIDoKIAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVT
X0VOQUJMRUQ7CiAJfQoKYmFzZS1jb21taXQ6IDU5YjcyM2NkMmFkYmFjMmEzNGZjOGUxMmM3NGFl
MjZhZTQ1YmYyMzAKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
