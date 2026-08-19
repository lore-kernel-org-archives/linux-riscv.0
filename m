Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC61C5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 02:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKsv0kjJP8fn+6RF43gOwGjWBOANBKwTMT1ulJfnCV0=; b=MAhTd46N0RqUnm
	n/6ub5g5wsKvHeyogmA5od3F64PI4OSY/aYQMqLCIQcXzLTskG6W4hBmgA2qU4HD4M+tnxva0TEh1
	m+HBeNZW1+op4W8wNoEeVrrg9+iBGGqAgTcwdY7ioOuPUP5bS7b0UkVm1RB4618Ql0YeJ8bCPONUN
	TEyqInqU+oLEfFBTl0Vp6IEkfCQ+MNgAtXKGQSx+337LmEOJkduOeoLhjh4D82FTPWFtHq+9/uzeZ
	gYZ7KFjwTdrDWIbVvTUa7WTuiLGN+dCq8VoUchfdmDMxj511MUPtlcCwapv0+6UPNtKUdAI8+HgSS
	eLSiGyCD1zhLd3MQV59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW3P-00000008s2r-2wO5;
	Wed, 19 Aug 2026 02:29:23 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwW3L-00000008s1Q-0lcX
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 02:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=gXUB1QrnxsrjbOi4xhXBQHCEC2KmzTwW0NuAmy9Ikto=; b=n2z84/Bkg38wflHDu1N8jwEOo2
	ZhL3oGXbc/uFEJNt0XoVhkQqsRre2N2fOyTCQuNQcmupM5U4xH/zfSaLtYI1aRIDo/YO0g1gqt4Ju
	7p9NoN2QQbxE+l00ISPoz7HIP+7oCZcG92EJgUl3QzGaqJjQh9auxNr8bS4ZA9nATHJaFhzpDvRmO
	UlKyIzG3ehc7I51bRyD7vFd+x0m4H27sXkgltjUagvY3qf8XeMChZzB0feZbvbrgL7xapazL7ucBq
	NhoOXUbeOhAb812rK3zQurHa3LPJNqJjitOwEpKMCimzS3v+RLDXhGMeQuH+MLoIeR1UI6irvfMur
	sXWvDxfA==;
Received: from 186-249-144-28.shared.desktop.com.br ([186.249.144.28] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwW39-005tfG-1g; Wed, 19 Aug 2026 04:29:07 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Tue, 18 Aug 2026 23:28:00 -0300
Subject: [PATCH RFC v2 01/13] keys, pidns, fs/verity, riscv/vector: reorder
 '#include <linux/sysctl.h>'
MIME-Version: 1.0
Message-Id: <20260818-sysctl-module-aliases-v2-1-d5a69dae5798@igalia.com>
References: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
In-Reply-To: <20260818-sysctl-module-aliases-v2-0-d5a69dae5798@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_192919_583072_F2664190 
X-CRM114-Status: GOOD (  12.60  )
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

Rml4IGFuIGluY2x1ZGUgbG9vcCBlcnJvciBpbiBwcmVwYXJhdGlvbiBmb3Igc3lzY3RsLmggdG8g
aW5jbHVkZSBtb2R1bGUuaDoKCiAgICBDQyBbTV0gIGFyY2gveDg2L2V2ZW50cy9hbWQvdW5jb3Jl
Lm8KICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4uL2luY2x1ZGUvbGludXgvZnMuaDo0NCwgICAg
ICAgICA8PDwKICAgICAgICAgICAgICAgICAgIGZyb20gLi4uL2luY2x1ZGUvbGludXgvY29tcGF0
Lmg6MTcsCiAgICAgICAgICAgICAgICAgICBmcm9tIC4uLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9p
YTMyLmg6NywKICAgICAgICAgICAgICAgICAgIGZyb20gLi4uL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2VsZi5oOjEwLAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVkZS9saW51eC9lbGYu
aDo2LAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVkZS9saW51eC9tb2R1bGUuaDoy
MCwgICAgIDw8PAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVkZS9saW51eC9zeXNj
dGwuaDoyNDUsICAgIDw8PAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVkZS9saW51
eC9rZXkuaDoxNywgICAgICAgIDw8PAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVk
ZS9saW51eC9jcmVkLmg6MTMsICAgICAgIDw8PAogICAgICAgICAgICAgICAgICAgZnJvbSAuLi4v
aW5jbHVkZS9saW51eC9zY2hlZC9zaWduYWwuaDoxMCwKICAgICAgICAgICAgICAgICAgIGZyb20g
Li4uL2luY2x1ZGUvbGludXgvcHRyYWNlLmg6NywKICAgICAgICAgICAgICAgICAgIGZyb20gLi4u
L2luY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy9icGZfcGVyZl9ldmVudC5oOjQsCiAgICAgICAgICAg
ICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9nZW5lcmF0ZWQvdWFwaS9hc20vCiAgICAg
ICAgICAgICAgICAgICAgICAgIGJwZl9wZXJmX2V2ZW50Lmg6MSwKICAgICAgICAgICAgICAgICAg
IGZyb20gLi4uL2luY2x1ZGUvdWFwaS9saW51eC9icGZfcGVyZl9ldmVudC5oOjExLAogICAgICAg
ICAgICAgICAgICAgZnJvbSAuLi4vaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50Lmg6MTgsCiAgICAg
ICAgICAgICAgICAgICBmcm9tIC4uLi9hcmNoL3g4Ni9ldmVudHMvYW1kL3VuY29yZS5jOjg6CiAg
Li4uL2luY2x1ZGUvbGludXgvbW50X2lkbWFwcGluZy5oOiBJbiBmdW5jdGlvbiDigJhtYXBwZWRf
ZnN1aWTigJk6CiAgLi4uL2luY2x1ZGUvbGludXgvbW50X2lkbWFwcGluZy5oOjIzMTo1OTogZXJy
b3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uCiAgICBvZiBmdW5jdGlvbiDigJhjdXJyZW50X2ZzdWlk
4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKUmVhc29uOgogLSBjcmVkLmgg
aW5jbHVkZXMga2V5LmggKmJlZm9yZSogZGVmaW5pbmcgY3VycmVudF9mc3VpZCgpOwogLSBrZXku
aCBpbmNsdWRlcyBzeXNjdGwuaDsKIC0gc3lzY3RsLmggaW5jbHVkZXMgbW9kdWxlLmg7CiAtIG1v
ZHVsZS5oIGluY2x1ZGVzIGZzLmggdmlhIGVsZi5oID4gYXNtL2VsZi5oID4gYXNtL2lhMzIuaCA+
IGNvbXBhdC5oOwogLSBmcy5oIGluY2x1ZGVzIG1udF9pZG1hcHBpbmcuaCwgd2hpY2ggdXNlcyAq
dW5kZWZpbmVkKiBjdXJyZW50X2ZzdWlkKCkuCgpOb3RlIHRoYXQgZnMuaCBkb2VzIGluY2x1ZGUg
Y3JlZC5oICh3aGljaCBkZWZpbmVzIGN1cnJlbnRfZnN1aWQoKSkgcmlnaHQKYmVmb3JlIG1udF9p
ZG1hcHBpbmcuaCAod2hpY2ggdXNlcyBpdCksIGJ1dCBpdCBpcyBub3QgcGFyc2VkIGJlY2F1c2Ug
dGhlCmluY2x1ZGUgZ3VhcmQgb2YgY3JlZC5oIGlzIGRlZmluZWQgZWFybGllci4KCkFkZHJlc3Mg
dGhpcyBieSByZW1vdmluZyBzeXNjdGwuaCBmcm9tIGtleS5oLCB3aGljaCBkb2VzIG5vdCBuZWVk
IGl0LAphbmQgYWRkaW5nIGl0IHRvIGZpbGVzIHRoYXQgYWN0dWFsbHkgbmVlZCBpdC4KClNpZ25l
ZC1vZmYtYnk6IE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIDxtZm9AaWdhbGlhLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICB8IDEgKwogZnMvdmVyaXR5L2luaXQuYyAg
ICAgICAgICAgICAgfCAxICsKIGluY2x1ZGUvbGludXgva2V5LmggICAgICAgICAgIHwgMSAtCiBp
bmNsdWRlL2xpbnV4L3BpZF9uYW1lc3BhY2UuaCB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IGIxMTIxNjZkNTFl
OWY1ODRmODRjNTJkMGY4NGZlYjkyY2NkNjBkZjEuLjllYWM0N2M5OWYxMTQzMDQ1MjFmZGM1Mzkw
MThmM2Y4NDUwN2U3NWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCisr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvc2NoZWQuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAjaW5jbHVkZSA8
bGludXgvcHJjdGwuaD4KKyNpbmNsdWRlIDxsaW51eC9zeXNjdGwuaD4KIAogI2luY2x1ZGUgPGFz
bS90aHJlYWRfaW5mby5oPgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KZGlmZiAtLWdpdCBh
L2ZzL3Zlcml0eS9pbml0LmMgYi9mcy92ZXJpdHkvaW5pdC5jCmluZGV4IDNhYTU1ZGVjODhmYzkx
OTc5MmEyY2I0YmU0NzZmODQ4MWVmNzhhOWUuLmQ0NjBlZWY3NGZjZmU0OWY2Y2Y2OTk3NGE4MTk0
YTY1ZGU0ODY4MTkgMTAwNjQ0Ci0tLSBhL2ZzL3Zlcml0eS9pbml0LmMKKysrIGIvZnMvdmVyaXR5
L2luaXQuYwpAQCAtOSw2ICs5LDcgQEAKICNpbmNsdWRlICJmc3Zlcml0eV9wcml2YXRlLmgiCiAK
ICNpbmNsdWRlIDxsaW51eC9yYXRlbGltaXQuaD4KKyNpbmNsdWRlIDxsaW51eC9zeXNjdGwuaD4K
IAogI2lmZGVmIENPTkZJR19TWVNDVEwKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3RsX3RhYmxlIGZz
dmVyaXR5X3N5c2N0bF90YWJsZVtdID0gewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZXku
aCBiL2luY2x1ZGUvbGludXgva2V5LmgKaW5kZXggODFiOGYwNWM2ODk4NWM2ZjBhNWM1YmJlMGYx
ZmQ2NjYxOTEyYzYxOC4uYTc0ZjhmMWI3OTM2ZDZlZGU1ODRjMGE4Y2Q1MjBmODU4ZjZhOTc1OCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rZXkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2tleS5o
CkBAIC0xNCw3ICsxNCw2IEBACiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgogI2luY2x1ZGUgPGxp
bnV4L3JidHJlZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JjdXBkYXRlLmg+Ci0jaW5jbHVkZSA8bGlu
dXgvc3lzY3RsLmg+CiAjaW5jbHVkZSA8bGludXgvcndzZW0uaD4KICNpbmNsdWRlIDxsaW51eC9h
dG9taWMuaD4KICNpbmNsdWRlIDxsaW51eC9hc3NvY19hcnJheS5oPgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9waWRfbmFtZXNwYWNlLmggYi9pbmNsdWRlL2xpbnV4L3BpZF9uYW1lc3BhY2Uu
aAppbmRleCBiMjBiYWFhN2U2MmI3NTVlN2U1NjFmY2Q4MDE4ZTJiNjEyMTM1MDNlLi45NGIyMzQ3
MWM3ZGVjMTM1ZTI0YzRjMGMxZmRiZjg0MWNlYTJlNWRlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L3BpZF9uYW1lc3BhY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L3BpZF9uYW1lc3BhY2UuaApA
QCAtMTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L25zcHJveHkuaD4KICNpbmNsdWRlIDxs
aW51eC9uc19jb21tb24uaD4KICNpbmNsdWRlIDxsaW51eC9pZHIuaD4KKyNpbmNsdWRlIDxsaW51
eC9zeXNjdGwuaD4KIAogLyogTUFYX1BJRF9OU19MRVZFTCBpcyBuZWVkZWQgZm9yIGxpbWl0aW5n
IHNpemUgb2YgJ3N0cnVjdCBwaWQnICovCiAjZGVmaW5lIE1BWF9QSURfTlNfTEVWRUwgMzIKCi0t
IAoyLjQ3LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
