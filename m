Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A217D10BF8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7u9dDbhS2i8KQRjRUGiLXta2+R/L9q4GGSG6j/DsLE=; b=Kt/qdvKKiqyLHs
	REgs6kY+1/V2+0SJj7WizM5squulleYzGIn4BFo8UaUoAoQLKQpkq0YbMIWcN9jSzPIdqUoV820J8
	lk/+J0bVwW7yF1IOMRXEGqyZVXS+6vRs5Zl4zbXf92G6HwqouOs49WJm6GIxJKAFN6A1wzkVB7A6Y
	V7Yb4PHsS5TjNQm0YV1Wg7veYY9lp4BwyJpvWm4BSExn4JPSkOQZ0NktNbJr9jofT1BkjA9Oh4Wnk
	Z2GbD2ZjDlrUkBscIu+mV2WXuO+IgnUUIpy52GzfM3Lz4wixPYlk8nUTlhEYHdIKdy9/FWy1CkCa6
	7EQ0ZJmi9jF/dRjHOIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4gJ8-00000006eI4-1XNU;
	Sat, 26 Oct 2024 12:54:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4gJ4-00000006eGZ-2tDm
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:54:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD9D35C5597;
	Sat, 26 Oct 2024 12:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E49C4CEC7;
	Sat, 26 Oct 2024 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729947253;
	bh=Ujw2Hx9DD5sP6nD9PmVq0gKu17NlxlXnL4Y7yK16U4k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=btyTjR7CoXrnFn9lB6V/WCvaEzBKts+Yl58SYsB/qjtH3KczdDkseAvEsdbL/fSND
	 Jy2DnH0yhW+Pw0bC2EqUmQAc+xP/auYt7/P+AD4leNL7UwvNeVnVUDjEwqNICpu9ny
	 RjiuuuXYpKAAwN224/coLKOktsO2NQ+E+CRrA17rCYhrMcv/xL9K5A9S5GMxLzaqEO
	 aCxCco/gPRlGAuc6cGtXte3F9d78sO+/dVg3M47YGGc4/5q957oXncR6d7EUWvgW8/
	 4IODCmz/VJjGlkK+t/rZ8b7VAblnCK8VuTQ+IZU3gan+ckCtvjkMq9mvfiapYk4s8q
	 zAe5Utsh+YuRg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Hao Luo <haoluo@google.com>,
	Helge Deller <deller@gmx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykola Lysenko <mykolal@fb.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next v3 2/4] bpf: bpf_csum_diff: optimize and homogenize for all archs
Date: Sat, 26 Oct 2024 12:53:37 +0000
Message-Id: <20241026125339.26459-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241026125339.26459-1-puranjay@kernel.org>
References: <20241026125339.26459-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_055414_840661_40DE5BAB 
X-CRM114-Status: GOOD (  19.66  )
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

MS4gT3B0aW1pemF0aW9uCiAgIC0tLS0tLS0tLS0tLQoKVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gY29waWVzIHRoZSAnZnJvbScgYW5kICd0bycgYnVmZmVycyB0byBhCnNjcmF0Y2hwYWQgYW5k
IGl0IHRha2VzIHRoZSBiaXR3aXNlIE5PVCBvZiAnZnJvbScgYnVmZmVyIHdoaWxlIGNvcHlpbmcu
CkluIHRoZSBuZXh0IHN0ZXAgY3N1bV9wYXJ0aWFsKCkgaXMgY2FsbGVkIHdpdGggdGhpcyBzY3Jh
dGNocGFkLgoKc28sIG1hdGhlbWF0aWNhbGx5LCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBp
cyBkb2luZzoKCglyZXN1bHQgPSBjc3VtKHRvIC0gZnJvbSkKCkhlcmUsICd0bycgIGFuZCAnfiBm
cm9tJyBhcmUgY29waWVkIGluIHRvIHRoZSBzY3JhdGNocGFkIGJ1ZmZlciwgd2UgbmVlZAppdCBp
biB0aGUgc2NyYXRjaHBhZCBidWZmZXIgYmVjYXVzZSBjc3VtX3BhcnRpYWwoKSB0YWtlcyBhIHNp
bmdsZQpjb250aWd1b3VzIGJ1ZmZlciBhbmQgbm90IHR3byBkaXNqb2ludCBidWZmZXJzIGxpa2Ug
J3RvJyBhbmQgJ2Zyb20nLgoKV2UgY2FuIHJlIHdyaXRlIHRoaXMgZXF1YXRpb24gdG86CgoJcmVz
dWx0ID0gY3N1bSh0bykgLSBjc3VtKGZyb20pCgp1c2luZyB0aGUgZGlzdHJpYnV0aXZlIHByb3Bl
cnR5IG9mIGNzdW0oKS4KCnRoaXMgYWxsb3dzICd0bycgYW5kICdmcm9tJyB0byBiZSBhdCBkaWZm
ZXJlbnQgbG9jYXRpb25zIGFuZCB0aGVyZWZvcmUKdGhpcyBzY3JhdGNocGFkIGFuZCBjb3B5aW5n
IGlzIG5vdCBuZWVkZWQuCgpUaGlzIGluIEMgY29kZSB3aWxsIGxvb2sgbGlrZToKCnJlc3VsdCA9
IGNzdW1fc3ViKGNzdW1fcGFydGlhbCh0bywgdG9fc2l6ZSwgc2VlZCksCiAgICAgICAgICAgICAg
ICAgIGNzdW1fcGFydGlhbChmcm9tLCBmcm9tX3NpemUsIDApKTsKCjIuIEhvbW9nZW5pemF0aW9u
CiAgIC0tLS0tLS0tLS0tLS0tCgpUaGUgYnBmX2NzdW1fZGlmZigpIGhlbHBlciBjYWxscyBjc3Vt
X3BhcnRpYWwoKSB3aGljaCBpcyBpbXBsZW1lbnRlZCBieQpzb21lIGFyY2hpdGVjdHVyZXMgbGlr
ZSBhcm0gYW5kIHg4NiBidXQgb3RoZXIgYXJjaGl0ZWN0dXJlcyByZWx5IG9uIHRoZQpnZW5lcmlj
IGltcGxlbWVudGF0aW9uIGluIGxpYi9jaGVja3N1bS5jCgpUaGUgZ2VuZXJpYyBpbXBsZW1lbnRh
dGlvbiBpbiBsaWIvY2hlY2tzdW0uYyByZXR1cm5zIGEgMTYgYml0IHZhbHVlIGJ1dAp0aGUgYXJj
aCBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMgY2FuIHJldHVybiBtb3JlIHRoYW4gMTYgYml0cywg
dGhpcwp3b3JrcyBvdXQgaW4gbW9zdCBwbGFjZXMgYmVjYXVzZSBiZWZvcmUgdGhlIHJlc3VsdCBp
cyB1c2VkLCBpdCBpcyBwYXNzZWQKdGhyb3VnaCBjc3VtX2ZvbGQoKSB0aGF0IHR1cm5zIGl0IGlu
dG8gYSAxNi1iaXQgdmFsdWUuCgpicGZfY3N1bV9kaWZmKCkgZGlyZWN0bHkgcmV0dXJucyB0aGUg
dmFsdWUgZnJvbSBjc3VtX3BhcnRpYWwoKSBhbmQKdGhlcmVmb3JlIHRoZSByZXR1cm5lZCB2YWx1
ZXMgY291bGQgYmUgZGlmZmVyZW50IG9uIGRpZmZlcmVudAphcmNoaXRlY3R1cmVzLiBzZWUgZGlz
Y3Vzc2lvbiBpbiBbMV06Cgpmb3IgdGhlIGludCB2YWx1ZSAyOCB0aGUgY2FsY3VsYXRlZCBjaGVj
a3N1bXMgYXJlOgoKeDg2ICAgICAgICAgICAgICAgICAgICA6ICAgIC0yOSA6IDB4ZmZmZmZmZTMK
Z2VuZXJpYyAoYXJtNjQsIHJpc2N2KSA6ICA2NTUwNyA6IDB4MDAwMGZmZTMKYXJtICAgICAgICAg
ICAgICAgICAgICA6IDEzMTA0MiA6IDB4MDAwMWZmZTIKClBhc3MgdGhlIHJlc3VsdCBvZiBicGZf
Y3N1bV9kaWZmKCkgdGhyb3VnaCBmcm9tMzJ0bzE2KCkgYmVmb3JlIHJldHVybmluZwp0byBob21v
Z2VuaXplIHRoaXMgcmVzdWx0IGZvciBhbGwgYXJjaGl0ZWN0dXJlcy4KCk5PVEU6IGZyb20zMnRv
MTYoKSBpcyB1c2VkIGluc3RlYWQgb2YgY3N1bV9mb2xkKCkgYmVjYXVzZSBjc3VtX2ZvbGQoKQpk
b2VzIGZyb20zMnRvMTYoKSArIGJpdHdpc2UgTk9UIG9mIHRoZSByZXN1bHQsIHdoaWNoIGlzIG5v
dCB3aGF0IHdlIHdhbnQKdG8gZG8gaGVyZS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
cGYvQ0FKK0hmTmlRYk9jcUNMeEZVUDJGTW01UXJMWFVVYWo4NTJGeGUzaG5fMkpOaXVjbjZnQG1h
aWwuZ21haWwuY29tLwoKU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtl
cm5lbC5vcmc+CkFja2VkLWJ5OiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0
PgpSZXZpZXdlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+
Ci0tLQogbmV0L2NvcmUvZmlsdGVyLmMgfCAzOSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9uZXQvY29yZS9maWx0ZXIuYyBiL25ldC9jb3JlL2ZpbHRlci5j
CmluZGV4IGUzMWVlOGJlMmRlMDcuLmYyZjhlNjRmMTkwNjYgMTAwNjQ0Ci0tLSBhL25ldC9jb3Jl
L2ZpbHRlci5jCisrKyBiL25ldC9jb3JlL2ZpbHRlci5jCkBAIC0xNjU0LDE4ICsxNjU0LDYgQEAg
dm9pZCBza19yZXVzZXBvcnRfcHJvZ19mcmVlKHN0cnVjdCBicGZfcHJvZyAqcHJvZykKIAkJYnBm
X3Byb2dfZGVzdHJveShwcm9nKTsKIH0KIAotc3RydWN0IGJwZl9zY3JhdGNocGFkIHsKLQl1bmlv
biB7Ci0JCV9fYmUzMiBkaWZmW01BWF9CUEZfU1RBQ0sgLyBzaXplb2YoX19iZTMyKV07Ci0JCXU4
ICAgICBidWZmW01BWF9CUEZfU1RBQ0tdOwotCX07Ci0JbG9jYWxfbG9ja190CWJoX2xvY2s7Ci19
OwotCi1zdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGJwZl9zY3JhdGNocGFkLCBicGZfc3Ap
ID0gewotCS5iaF9sb2NrCT0gSU5JVF9MT0NBTF9MT0NLKGJoX2xvY2spLAotfTsKLQogc3RhdGlj
IGlubGluZSBpbnQgX19icGZfdHJ5X21ha2Vfd3JpdGFibGUoc3RydWN0IHNrX2J1ZmYgKnNrYiwK
IAkJCQkJICB1bnNpZ25lZCBpbnQgd3JpdGVfbGVuKQogewpAQCAtMjAyMiwxMSArMjAxMCw2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYnBmX2Z1bmNfcHJvdG8gYnBmX2w0X2NzdW1fcmVwbGFjZV9w
cm90byA9IHsKIEJQRl9DQUxMXzUoYnBmX2NzdW1fZGlmZiwgX19iZTMyICosIGZyb20sIHUzMiwg
ZnJvbV9zaXplLAogCSAgIF9fYmUzMiAqLCB0bywgdTMyLCB0b19zaXplLCBfX3dzdW0sIHNlZWQp
CiB7Ci0Jc3RydWN0IGJwZl9zY3JhdGNocGFkICpzcCA9IHRoaXNfY3B1X3B0cigmYnBmX3NwKTsK
LQl1MzIgZGlmZl9zaXplID0gZnJvbV9zaXplICsgdG9fc2l6ZTsKLQlpbnQgaSwgaiA9IDA7Ci0J
X193c3VtIHJldDsKLQogCS8qIFRoaXMgaXMgcXVpdGUgZmxleGlibGUsIHNvbWUgZXhhbXBsZXM6
CiAJICoKIAkgKiBmcm9tX3NpemUgPT0gMCwgdG9fc2l6ZSA+IDAsICBzZWVkIDo9IGNzdW0gLS0+
IHB1c2hpbmcgZGF0YQpAQCAtMjAzNSwxOSArMjAxOCwxOSBAQCBCUEZfQ0FMTF81KGJwZl9jc3Vt
X2RpZmYsIF9fYmUzMiAqLCBmcm9tLCB1MzIsIGZyb21fc2l6ZSwKIAkgKgogCSAqIEV2ZW4gZm9y
IGRpZmZpbmcsIGZyb21fc2l6ZSBhbmQgdG9fc2l6ZSBkb24ndCBuZWVkIHRvIGJlIGVxdWFsLgog
CSAqLwotCWlmICh1bmxpa2VseSgoKGZyb21fc2l6ZSB8IHRvX3NpemUpICYgKHNpemVvZihfX2Jl
MzIpIC0gMSkpIHx8Ci0JCSAgICAgZGlmZl9zaXplID4gc2l6ZW9mKHNwLT5kaWZmKSkpCi0JCXJl
dHVybiAtRUlOVkFMOwogCi0JbG9jYWxfbG9ja19uZXN0ZWRfYmgoJmJwZl9zcC5iaF9sb2NrKTsK
LQlmb3IgKGkgPSAwOyBpIDwgZnJvbV9zaXplIC8gc2l6ZW9mKF9fYmUzMik7IGkrKywgaisrKQot
CQlzcC0+ZGlmZltqXSA9IH5mcm9tW2ldOwotCWZvciAoaSA9IDA7IGkgPCAgIHRvX3NpemUgLyBz
aXplb2YoX19iZTMyKTsgaSsrLCBqKyspCi0JCXNwLT5kaWZmW2pdID0gdG9baV07CisJX193c3Vt
IHJldCA9IHNlZWQ7CiAKLQlyZXQgPSBjc3VtX3BhcnRpYWwoc3AtPmRpZmYsIGRpZmZfc2l6ZSwg
c2VlZCk7Ci0JbG9jYWxfdW5sb2NrX25lc3RlZF9iaCgmYnBmX3NwLmJoX2xvY2spOwotCXJldHVy
biByZXQ7CisJaWYgKGZyb21fc2l6ZSAmJiB0b19zaXplKQorCQlyZXQgPSBjc3VtX3N1Yihjc3Vt
X3BhcnRpYWwodG8sIHRvX3NpemUsIHJldCksCisJCQkgICAgICAgY3N1bV9wYXJ0aWFsKGZyb20s
IGZyb21fc2l6ZSwgMCkpOworCWVsc2UgaWYgKHRvX3NpemUpCisJCXJldCA9IGNzdW1fcGFydGlh
bCh0bywgdG9fc2l6ZSwgcmV0KTsKKworCWVsc2UgaWYgKGZyb21fc2l6ZSkKKwkJcmV0ID0gfmNz
dW1fcGFydGlhbChmcm9tLCBmcm9tX3NpemUsIH5yZXQpOworCisJcmV0dXJuIGNzdW1fZnJvbTMy
dG8xNigoX19mb3JjZSB1bnNpZ25lZCBpbnQpcmV0KTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBicGZfZnVuY19wcm90byBicGZfY3N1bV9kaWZmX3Byb3RvID0gewotLSAKMi40MC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
