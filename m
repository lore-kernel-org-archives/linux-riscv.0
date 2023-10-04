Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2017AE7B601
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvcm4Gc3FZNH5fCcQuBGEXOCwA1EaArmt1Mf//0LSfU=; b=p1dTJ9HzTQy8cE
	wg6WWVnGOb2zjdxh6K5+Id7EqE+zDwcjwDk9jwtx0X1Pn4PYbVVEJgF6jfWCcdPVR0kG4QQgUiW48
	rZ/+BGY+6UE/5unxOpxFK4xsItTXmsNugAOq62mWDxycMHWcjkJz95QIxkE4rzO7L6y82Y40/Ge1d
	J/SxswQ/DHywzVgchGFUjnKl/4cWKo8M1KOrEP1ckWtIF7zG8/F8KAIVnDMgqC3C86CPucz3FNMET
	J3XVG2ImwGyPxbI2b553YDHmnita+eb/zhxec9uVhSR48x4cbVJ4k5Ybww82Qb5Yyi1masmhX8mdg
	N/SIQDqD963/XQch1A0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yT-00005v-26;
	Wed, 04 Oct 2023 12:27:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yR-00Hb6D-0C
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AE19AB81D0C;
	Wed,  4 Oct 2023 12:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0494AC433C7;
	Wed,  4 Oct 2023 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422449;
	bh=vZdeekHmX6PRJrot+PinxMvY1FiWo7fqDKl0jsBzl+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ImQPHdN5Vej8ZQgiOvsRoxKhp/zQ4Hl2xHXEjV4iyS98p1zFUHKHL50ytHlMRK484
	 9hzk0/ouyrOenAmjzEdDDnUHYfH6QmpzDmo1bL4rmj8feQ7JTPlFiv8OU0V9caUc61
	 IC3WjJiR2dah3NRJhNL5VcKtF0magsuCqJAVTnNZmhxEysDJC+p0Rfvb2uT2R9h1s1
	 ns7MX2dQ183fjYtbfCOPvPfvlf0BA4j9YQr/LxGTtCjjYa3UicdOf3eqrUunR1dZh9
	 QL5CYN/+QLMn8L1zku2UjN0HmQ/AjQeLhR9bQK0bMQArhxh3LGzK95NdheiCoQbN12
	 z4jEO4wgv/U8g==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 1/3] selftests/bpf: Add cross-build support for urandom_read et al
Date: Wed,  4 Oct 2023 14:27:19 +0200
Message-Id: <20231004122721.54525-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004122721.54525-1-bjorn@kernel.org>
References: <20231004122721.54525-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_052731_282764_6D79CDFE 
X-CRM114-Status: UNSURE (   9.57  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKU29tZSB1c2VybGFuZCBw
cm9ncmFtcyBpbiB0aGUgQlBGIHRlc3Qgc3VpdGUsIGUuZy4gdXJhbmRvbV9yZWFkLCBpcwptaXNz
aW5nIGNyb3NzLWJ1aWxkIHN1cHBvcnQuIEFkZCBjcm9zcy1idWlsZCBzdXBwb3J0IGZvciB0aGVz
ZQpwcm9ncmFtcwoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKaW5kZXggNDczNjUxNjFiNmZjLi5hOWNiYjg1ZmExODAg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQorKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKQEAgLTE5OCw3ICsxOTgsNyBAQCBl
bmRpZgogIyBkbyBub3QgZmFpbC4gU3RhdGljIGJ1aWxkcyBsZWF2ZSB1cmFuZG9tX3JlYWQgcmVs
eWluZyBvbiBzeXN0ZW0td2lkZSBzaGFyZWQgbGlicmFyaWVzLgogJChPVVRQVVQpL2xpYnVyYW5k
b21fcmVhZC5zbzogdXJhbmRvbV9yZWFkX2xpYjEuYyB1cmFuZG9tX3JlYWRfbGliMi5jIGxpYnVy
YW5kb21fcmVhZC5tYXAKIAkkKGNhbGwgbXNnLExJQiwsJEApCi0JJChRKSQoQ0xBTkcpICQoZmls
dGVyLW91dCAtc3RhdGljLCQoQ0ZMQUdTKSAkKExERkxBR1MpKSAgIFwKKwkkKFEpJChDTEFORykg
JChDTEFOR19UQVJHRVRfQVJDSCkgJChmaWx0ZXItb3V0IC1zdGF0aWMsJChDRkxBR1MpICQoTERG
TEFHUykpICAgXAogCQkgICAgICQoZmlsdGVyICUuYywkXikgJChmaWx0ZXItb3V0IC1zdGF0aWMs
JChMRExJQlMpKSBcCiAJCSAgICAgLWZ1c2UtbGQ9JChMTEQpIC1XbCwtem5vc2VwYXJhdGUtY29k
ZSAtV2wsLS1idWlsZC1pZD1zaGExIFwKIAkJICAgICAtV2wsLS12ZXJzaW9uLXNjcmlwdD1saWJ1
cmFuZG9tX3JlYWQubWFwIFwKQEAgLTIwNiw3ICsyMDYsNyBAQCAkKE9VVFBVVCkvbGlidXJhbmRv
bV9yZWFkLnNvOiB1cmFuZG9tX3JlYWRfbGliMS5jIHVyYW5kb21fcmVhZF9saWIyLmMgbGlidXJh
bmRvbQogCiAkKE9VVFBVVCkvdXJhbmRvbV9yZWFkOiB1cmFuZG9tX3JlYWQuYyB1cmFuZG9tX3Jl
YWRfYXV4LmMgJChPVVRQVVQpL2xpYnVyYW5kb21fcmVhZC5zbwogCSQoY2FsbCBtc2csQklOQVJZ
LCwkQCkKLQkkKFEpJChDTEFORykgJChmaWx0ZXItb3V0IC1zdGF0aWMsJChDRkxBR1MpICQoTERG
TEFHUykpICQoZmlsdGVyICUuYywkXikgXAorCSQoUSkkKENMQU5HKSAkKENMQU5HX1RBUkdFVF9B
UkNIKSAkKGZpbHRlci1vdXQgLXN0YXRpYywkKENGTEFHUykgJChMREZMQUdTKSkgJChmaWx0ZXIg
JS5jLCReKSBcCiAJCSAgICAgLWx1cmFuZG9tX3JlYWQgJChmaWx0ZXItb3V0IC1zdGF0aWMsJChM
RExJQlMpKSAtTCQoT1VUUFVUKSAgXAogCQkgICAgIC1mdXNlLWxkPSQoTExEKSAtV2wsLXpub3Nl
cGFyYXRlLWNvZGUgLVdsLC0tYnVpbGQtaWQ9c2hhMSBcCiAJCSAgICAgLVdsLC1ycGF0aD0uIC1v
ICRACi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
