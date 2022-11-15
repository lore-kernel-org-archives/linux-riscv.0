Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 18:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWC500yYZuffYsbzHQLj0cYJw1CgoFrtOZHvjPqHcJ4=; b=tunTj9WYD7736z
	acUIm8aNHufMuVVv6AZwL2pReIH20fBKMwVudFcdRG5onv7o2/zsnsPWOgHoJbiirgpLPw+F5Fjdg
	cFRj5qA71i6tj3USdkzVZps7RBuPwwM/+cGHJerPAv0eMNNTqNJdhmByeFcNc+PAeigZvKl1XynEN
	D4eec1RnqVD1iMJBcivLAh6Kwc6jWcM7DzOJeECM6ruY1iRcUDjl0S/0lajvxFZsbQ1phnp7vWMWU
	Cy3TgKkaPhiqyvxpB6Q1fBI2YHC/S2xN84aA1WnT2NOHKtqD3XtL43BirvGVPUED/E+SiyTT0h8ap
	e6/bIAFqBjIZp+AMR4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Ym-00Dh8l-Kl; Tue, 15 Nov 2022 18:21:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Yk-00Dh83-F1
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 18:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF979B81A16;
	Tue, 15 Nov 2022 18:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258E5C4347C;
	Tue, 15 Nov 2022 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668536479;
	bh=kVzmN1nhvJ7rXQ8CtIjwZxxIsXnCovpfzTGFioT4v9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ma3yBe1TSehHWYD1ASpuWsoYAedQbCS84Xf7g4d9vwu4EvXET9EAEnphGu15H5K70
	 qKydZKkbHbfgNIFWIi8eL8SFvTG0lGFS7Ynyzqfl7jl+v8pWSbTEupW1NGTZM4nfj6
	 cyq70hQGLPgmd/JaHe29ZGXUphBTPqYRvMXA7Kw5k/Pmywv8mOQEffIiaWWGWxz8PY
	 RaSC5f2rq3BnV0EzOacujI1/bx4gTUuylISxwjNhMLGIFoRn8k3XkTixoXQ3vgZ2JW
	 5UJaoDMGfE7gED5rGXdVY0YySZhG3DS4zeo8JhvcUVymdJNrYJS7i/IDl0lZ9Jf/S1
	 vnnvIuaaDepYQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Mykola Lysenko <mykolal@fb.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: Pass target triple to get_sys_includes macro
Date: Tue, 15 Nov 2022 19:20:51 +0100
Message-Id: <20221115182051.582962-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221115182051.582962-1-bjorn@kernel.org>
References: <20221115182051.582962-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_102122_828031_9B1082AC 
X-CRM114-Status: GOOD (  10.50  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKV2hlbiBjcm9zcy1jb21w
aWxpbmcgWzFdLCB0aGUgZ2V0X3N5c19pbmNsdWRlcyBtYWtlIG1hY3JvIHNob3VsZCB1c2UKdGhl
IHRhcmdldCBzeXN0ZW0gaW5jbHVkZSBwYXRoLCBhbmQgbm90IHRoZSBidWlsZCBob3N0cyBzeXN0
ZW0gaW5jbHVkZQpwYXRoLgoKTWFrZSBjbGFuZyBob25vciB0aGUgQ1JPU1NfQ09NUElMRSB0cmlw
bGUuCgpbMV0gZS5nLiAiQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251
LSBtYWtlIgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSB8IDEyICsrKysrKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKaW5kZXggOGY4ZWRlMzBlOTRlLi5hMmExZWFl
NzU4MjAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQor
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKQEAgLTMwOSw5ICszMDks
OSBAQCAkKFJFU09MVkVfQlRGSURTKTogJChIT1NUX0JQRk9CSikgfCAkKEhPU1RfQlVJTERfRElS
KS9yZXNvbHZlX2J0ZmlkcwlcCiAjIFVzZSAnLWlkaXJhZnRlcic6IERvbid0IGludGVyZmVyZSB3
aXRoIGluY2x1ZGUgbWVjaGFuaWNzIGV4Y2VwdCB3aGVyZSB0aGUKICMgYnVpbGQgd291bGQgaGF2
ZSBmYWlsZWQgYW55d2F5cy4KIGRlZmluZSBnZXRfc3lzX2luY2x1ZGVzCi0kKHNoZWxsICQoMSkg
LXYgLUUgLSA8L2Rldi9udWxsIDI+JjEgXAorJChzaGVsbCAkKDEpICQoMikgLXYgLUUgLSA8L2Rl
di9udWxsIDI+JjEgXAogCXwgc2VkIC1uICcvPC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0Vu
ZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8uKlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykgXAotJChz
aGVsbCAkKDEpIC1kTSAtRSAtIDwvZGV2L251bGwgfCBncmVwICdfX3Jpc2N2X3hsZW4gJyB8IGF3
ayAne3ByaW50ZigiLURfX3Jpc2N2X3hsZW49JWQgLURfX0JJVFNfUEVSX0xPTkc9JWQiLCAkJDMs
ICQkMyl9JykKKyQoc2hlbGwgJCgxKSAkKDIpIC1kTSAtRSAtIDwvZGV2L251bGwgfCBncmVwICdf
X3Jpc2N2X3hsZW4gJyB8IGF3ayAne3ByaW50ZigiLURfX3Jpc2N2X3hsZW49JWQgLURfX0JJVFNf
UEVSX0xPTkc9JWQiLCAkJDMsICQkMyl9JykKIGVuZGVmCiAKICMgRGV0ZXJtaW5lIHRhcmdldCBl
bmRpYW5uZXNzLgpAQCAtMzE5LDcgKzMxOSwxMSBAQCBJU19MSVRUTEVfRU5ESUFOID0gJChzaGVs
bCAkKENDKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgXAogCQkJZ3JlcCAnZGVmaW5lIF9fQllURV9P
UkRFUl9fIF9fT1JERVJfTElUVExFX0VORElBTl9fJykKIE1FTkRJQU49JChpZiAkKElTX0xJVFRM
RV9FTkRJQU4pLC1tbGl0dGxlLWVuZGlhbiwtbWJpZy1lbmRpYW4pCiAKLUNMQU5HX1NZU19JTkNM
VURFUyA9ICQoY2FsbCBnZXRfc3lzX2luY2x1ZGVzLCQoQ0xBTkcpKQoraWZuZXEgKCQoQ1JPU1Nf
Q09NUElMRSksKQorQ0xBTkdfVEFSR0VUX0FSQ0ggPSAtLXRhcmdldD0kKG5vdGRpciAkKENST1NT
X0NPTVBJTEU6JS09JSkpCitlbmRpZgorCitDTEFOR19TWVNfSU5DTFVERVMgPSAkKGNhbGwgZ2V0
X3N5c19pbmNsdWRlcywkKENMQU5HKSwkKENMQU5HX1RBUkdFVF9BUkNIKSkKIEJQRl9DRkxBR1Mg
PSAtZyAtV2Vycm9yIC1EX19UQVJHRVRfQVJDSF8kKFNSQ0FSQ0gpICQoTUVORElBTikgCQlcCiAJ
ICAgICAtSSQoSU5DTFVERV9ESVIpIC1JJChDVVJESVIpIC1JJChBUElESVIpCQkJXAogCSAgICAg
LUkkKGFic3BhdGggJChPVVRQVVQpLy4uL3Vzci9pbmNsdWRlKQpAQCAtNTM5LDcgKzU0Myw3IEBA
ICQoZXZhbCAkKGNhbGwgREVGSU5FX1RFU1RfUlVOTkVSLHRlc3RfcHJvZ3Msbm9fYWx1MzIpKQog
IyBEZWZpbmUgdGVzdF9wcm9ncyBCUEYtR0NDLWZsYXZvcmVkIHRlc3QgcnVubmVyLgogaWZuZXEg
KCQoQlBGX0dDQyksKQogVFJVTk5FUl9CUEZfQlVJTERfUlVMRSA6PSBHQ0NfQlBGX0JVSUxEX1JV
TEUKLVRSVU5ORVJfQlBGX0NGTEFHUyA6PSAkKEJQRl9DRkxBR1MpICQoY2FsbCBnZXRfc3lzX2lu
Y2x1ZGVzLGdjYykKK1RSVU5ORVJfQlBGX0NGTEFHUyA6PSAkKEJQRl9DRkxBR1MpICQoY2FsbCBn
ZXRfc3lzX2luY2x1ZGVzLGdjYywpCiAkKGV2YWwgJChjYWxsIERFRklORV9URVNUX1JVTk5FUix0
ZXN0X3Byb2dzLGJwZl9nY2MpKQogZW5kaWYKIAotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
