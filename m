Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B984CFA44E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC2K4hgXgJdv+udUEplQebPj0d9ZQVTa/jpkceu7s1c=; b=1pWuVv3bduoVW6
	Y5PvolBVloyiLYtCDoiBzAJX0qGtfqgHUCxXiA8WVr9qh8NyO2X4UCjke8QXBmmgmc28IWmnSVj9I
	l+Et+X+sozKHP8i4uI4IWtixOqd2BkdAPjiiwyAmdht0PZSaSAsgMKy0dTjkJzjQD5FhY5VvvGHAR
	4i8c0tYLDMM9bod1O3tF4AmXmUlUVYtBJhYZRBOzVIbn4rPtgrLIvlBGQ+aNu5uuL+1J20Na0FHcJ
	q7WFLzMYTUPdW7ujjAj0gUJvRr1MpLOI/j9J1nZVtXDQQ5Lbe6WusWzwmqwvZ/ufHpeHVZS4cVqCi
	QtEl7NJpFgQkXX3yl6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7C-0000000F7WA-43B5;
	Wed, 23 Oct 2024 16:21:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dSi-0000000Ezfx-29BD
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 15:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EA42A40A22;
	Wed, 23 Oct 2024 15:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94B1C4CEC6;
	Wed, 23 Oct 2024 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729697991;
	bh=hs0lXbcOH7c9T/cGcTNkAHvTScTMvbdw0SB7nKBj1RE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CLXkRVYMKhLzKMnLaS5EdZKHPPcUn+76PrLIXutI7U7lnmOtG7xAlx/T6eUgfP9Lf
	 iRnHCzrrhQzMSO30G8hyKYGiQlNWbYQe1UdjYh5qk3fEm4Sw4L9HlRQUGDG92IZIdR
	 1lPKPE9Z580GvVAMZTQ2iKxapj4MdVIlSXR425bYdCaYVAPgEfK2iu+wAQ7G9XtgXr
	 zCWqbwuHW48kEEQtTny3dFmZrnujNEy13djB4XQ2HLJ4x+ZB3GdEHZ1J5QqqCeu5rB
	 DdlQrflJp4OHqetFDcsmUWeCSGAL94qex3lkro+Q2P8LUDd/4rOvs7STpUIijFgyoU
	 HbU94z2on57xA==
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
Subject: [PATCH bpf-next v2 2/4] bpf: bpf_csum_diff: optimize and homogenize for all archs
Date: Wed, 23 Oct 2024 15:39:20 +0000
Message-Id: <20241023153922.86909-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241023153922.86909-1-puranjay@kernel.org>
References: <20241023153922.86909-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_083952_716353_C64A6AA4 
X-CRM114-Status: GOOD (  19.62  )
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
Ci0tLQogbmV0L2NvcmUvZmlsdGVyLmMgfCAzNyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9uZXQvY29yZS9maWx0ZXIuYyBiL25ldC9jb3JlL2ZpbHRlci5jCmlu
ZGV4IGJkMGQwOGJmNzZiYjguLmUwMGJlYzdkZTllZGQgMTAwNjQ0Ci0tLSBhL25ldC9jb3JlL2Zp
bHRlci5jCisrKyBiL25ldC9jb3JlL2ZpbHRlci5jCkBAIC0xNjU0LDE4ICsxNjU0LDYgQEAgdm9p
ZCBza19yZXVzZXBvcnRfcHJvZ19mcmVlKHN0cnVjdCBicGZfcHJvZyAqcHJvZykKIAkJYnBmX3By
b2dfZGVzdHJveShwcm9nKTsKIH0KIAotc3RydWN0IGJwZl9zY3JhdGNocGFkIHsKLQl1bmlvbiB7
Ci0JCV9fYmUzMiBkaWZmW01BWF9CUEZfU1RBQ0sgLyBzaXplb2YoX19iZTMyKV07Ci0JCXU4ICAg
ICBidWZmW01BWF9CUEZfU1RBQ0tdOwotCX07Ci0JbG9jYWxfbG9ja190CWJoX2xvY2s7Ci19Owot
Ci1zdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGJwZl9zY3JhdGNocGFkLCBicGZfc3ApID0g
ewotCS5iaF9sb2NrCT0gSU5JVF9MT0NBTF9MT0NLKGJoX2xvY2spLAotfTsKLQogc3RhdGljIGlu
bGluZSBpbnQgX19icGZfdHJ5X21ha2Vfd3JpdGFibGUoc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAkJ
CQkJICB1bnNpZ25lZCBpbnQgd3JpdGVfbGVuKQogewpAQCAtMjAyMiwxMSArMjAxMCw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYnBmX2Z1bmNfcHJvdG8gYnBmX2w0X2NzdW1fcmVwbGFjZV9wcm90
byA9IHsKIEJQRl9DQUxMXzUoYnBmX2NzdW1fZGlmZiwgX19iZTMyICosIGZyb20sIHUzMiwgZnJv
bV9zaXplLAogCSAgIF9fYmUzMiAqLCB0bywgdTMyLCB0b19zaXplLCBfX3dzdW0sIHNlZWQpCiB7
Ci0Jc3RydWN0IGJwZl9zY3JhdGNocGFkICpzcCA9IHRoaXNfY3B1X3B0cigmYnBmX3NwKTsKLQl1
MzIgZGlmZl9zaXplID0gZnJvbV9zaXplICsgdG9fc2l6ZTsKLQlpbnQgaSwgaiA9IDA7Ci0JX193
c3VtIHJldDsKLQogCS8qIFRoaXMgaXMgcXVpdGUgZmxleGlibGUsIHNvbWUgZXhhbXBsZXM6CiAJ
ICoKIAkgKiBmcm9tX3NpemUgPT0gMCwgdG9fc2l6ZSA+IDAsICBzZWVkIDo9IGNzdW0gLS0+IHB1
c2hpbmcgZGF0YQpAQCAtMjAzNSwxOSArMjAxOCwxNyBAQCBCUEZfQ0FMTF81KGJwZl9jc3VtX2Rp
ZmYsIF9fYmUzMiAqLCBmcm9tLCB1MzIsIGZyb21fc2l6ZSwKIAkgKgogCSAqIEV2ZW4gZm9yIGRp
ZmZpbmcsIGZyb21fc2l6ZSBhbmQgdG9fc2l6ZSBkb24ndCBuZWVkIHRvIGJlIGVxdWFsLgogCSAq
LwotCWlmICh1bmxpa2VseSgoKGZyb21fc2l6ZSB8IHRvX3NpemUpICYgKHNpemVvZihfX2JlMzIp
IC0gMSkpIHx8Ci0JCSAgICAgZGlmZl9zaXplID4gc2l6ZW9mKHNwLT5kaWZmKSkpCi0JCXJldHVy
biAtRUlOVkFMOwogCi0JbG9jYWxfbG9ja19uZXN0ZWRfYmgoJmJwZl9zcC5iaF9sb2NrKTsKLQlm
b3IgKGkgPSAwOyBpIDwgZnJvbV9zaXplIC8gc2l6ZW9mKF9fYmUzMik7IGkrKywgaisrKQotCQlz
cC0+ZGlmZltqXSA9IH5mcm9tW2ldOwotCWZvciAoaSA9IDA7IGkgPCAgIHRvX3NpemUgLyBzaXpl
b2YoX19iZTMyKTsgaSsrLCBqKyspCi0JCXNwLT5kaWZmW2pdID0gdG9baV07CisJaWYgKGZyb21f
c2l6ZSAmJiB0b19zaXplKQorCQlyZXR1cm4gY3N1bV9mcm9tMzJ0bzE2KGNzdW1fc3ViKGNzdW1f
cGFydGlhbCh0bywgdG9fc2l6ZSwgc2VlZCksCisJCQkJCQljc3VtX3BhcnRpYWwoZnJvbSwgZnJv
bV9zaXplLCAwKSkpOworCWlmICh0b19zaXplKQorCQlyZXR1cm4gY3N1bV9mcm9tMzJ0bzE2KGNz
dW1fcGFydGlhbCh0bywgdG9fc2l6ZSwgc2VlZCkpOwogCi0JcmV0ID0gY3N1bV9wYXJ0aWFsKHNw
LT5kaWZmLCBkaWZmX3NpemUsIHNlZWQpOwotCWxvY2FsX3VubG9ja19uZXN0ZWRfYmgoJmJwZl9z
cC5iaF9sb2NrKTsKLQlyZXR1cm4gcmV0OworCWlmIChmcm9tX3NpemUpCisJCXJldHVybiBjc3Vt
X2Zyb20zMnRvMTYofmNzdW1fcGFydGlhbChmcm9tLCBmcm9tX3NpemUsIH5zZWVkKSk7CisKKwly
ZXR1cm4gc2VlZDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBicGZfZnVuY19wcm90byBicGZf
Y3N1bV9kaWZmX3Byb3RvID0gewotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
