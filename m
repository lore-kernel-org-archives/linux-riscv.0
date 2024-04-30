Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88785C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0u6GAlqrQSqz/hRdZFcVr4VPYzPlupXRfxJ4OI5tRRs=; b=K9VbBNA1KMI1Xc
	cqtQN0dsNr7aadCjm4YHkPyr6NbYtsjAi6pEV5k3sytqOXZBLpeMWKZD987oUMx8gwcROxwnIJHv2
	8y5VrYmL4vO2NUz2ceKZ7MP1M2s4yI0S17MHepCeRsTB7qrbUUhLHAuWg67YuQyEe3aGlGk43f/ZZ
	3QoMUFWukAfnGtwId4R54+zZG+Lu08pPc8AybqZHKvYmM/KzaV/mS6xbZawuBZIGYYUuSiCRIpuVl
	rlGSqGUP67SgFH3Y2u7zJjbBLS08s0scUfQFngnztHQLk0ygYbEPcteyyLtTAWQG6I0R+oZDHSCeD
	nARY1bjfHEzTOyBu65/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rkt-00000007VpW-2a6T;
	Tue, 30 Apr 2024 17:59:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rkp-00000007Vng-3klE
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 17:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05C3B61708;
	Tue, 30 Apr 2024 17:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CE2C2BBFC;
	Tue, 30 Apr 2024 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714499938;
	bh=eHohNKUJ8gktcKY/SDrEgIVgWq28MJ3xFbE63jC9Zfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n39BbP4/RjSdiaYkMkbUKnjWCuQE5zpUjaxYb66SePT8XXWDzJV6tH7Y04JRex6PA
	 f2SL1E13ERB13DCFWFVv9gCUSMEJl2e+yEZZLxUmzZRvhd0+cAo1xFliKM6Q5k/Enc
	 jy0tOy+D2QiWx25t+wKbD2gLt5k0QYpCRrJLf7QN4WNKqK6DFrcQBCGDo++ukWqCBm
	 HyiI5Sc+t8lwbAxn1AkX22ISaRIB2y9nVgiv+UNA5VWRScpSJen5w+pmtvuP7/8Y9I
	 qgxRNru11IwaAyXzPvHFvaxmzPxtrHYSXm2FIjpkl9FvjJo2tuV4wISGxq2F/9eBX6
	 4721KRaPsi+/A==
From: Puranjay Mohan <puranjay@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 1/2] riscv, bpf: add internal-only MOV instruction to resolve per-CPU addrs
Date: Tue, 30 Apr 2024 17:58:33 +0000
Message-Id: <20240430175834.33152-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430175834.33152-1-puranjay@kernel.org>
References: <20240430175834.33152-1-puranjay@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_105900_307669_B9E61231 
X-CRM114-Status: GOOD (  13.24  )
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

U3VwcG9ydCBhbiBpbnN0cnVjdGlvbiBmb3IgcmVzb2x2aW5nIGFic29sdXRlIGFkZHJlc3NlcyBv
ZiBwZXItQ1BVCmRhdGEgZnJvbSB0aGVpciBwZXItQ1BVIG9mZnNldHMuIFRoaXMgaW5zdHJ1Y3Rp
b24gaXMgaW50ZXJuYWwtb25seSBhbmQKdXNlcnMgYXJlIG5vdCBhbGxvd2VkIHRvIHVzZSB0aGVt
IGRpcmVjdGx5LiBUaGV5IHdpbGwgb25seSBiZSB1c2VkIGZvcgppbnRlcm5hbCBpbmxpbmluZyBv
cHRpbWl6YXRpb25zIGZvciBub3cgYmV0d2VlbiBCUEYgdmVyaWZpZXIgYW5kIEJQRgpKSVRzLgoK
UklTQy1WIHVzZXMgZ2VuZXJpYyBwZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBvZmZz
ZXRzIGZvciBDUFVzCmFyZSBrZXB0IGluIGFuIGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0
W2NwdV9udW1iZXJdLiBSSVNDViBzdG9yZXMKdGhlIGFkZHJlc3Mgb2YgdGhlIHRhc2tfc3RydWN0
IGluIFRQIHJlZ2lzdGVyLiBUaGUgZmlyc3QgZWxlbWVudCBpbgp0YXNrX3N0cnVjdCBpcyBzdHJ1
Y3QgdGhyZWFkX2luZm8sIGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5CnJlYWRpbmcg
ZnJvbSB0aGUgVFAgcmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSku
CgpPbmNlIHdlIGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRoZSBv
ZmZzZXQgZm9yIHRoYXQKY3B1IGZyb20gYWRkcmVzczogJl9fcGVyX2NwdV9vZmZzZXQgKyBjcHVf
bnVtYmVyIDw8IDMuIFRoZW4gd2UgYWRkIHRoaXMKb2Zmc2V0IHRvIHRoZSBkZXN0aW5hdGlvbiBy
ZWdpc3Rlci4KClRvIG1lYXN1cmUgdGhlIGltcHJvdmVtZW50IGZyb20gdGhpcyBjaGFuZ2UsIHRo
ZSBiZW5jaG1hcmsgaW4gWzFdIHdhcwp1c2VkIG9uIFFlbXU6CgpCZWZvcmU6Cmdsb2ItYXJyLWlu
YyAgIDogICAgMS4xMjcgwrEgMC4wMTNNL3MKYXJyLWluYyAgICAgICAgOiAgICAxLjEyMSDCsSAw
LjAwNE0vcwpoYXNoLWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCgpBZnRlcjoKZ2xv
Yi1hcnItaW5jICAgOiAgICAxLjEzOCDCsSAwLjAxMU0vcwphcnItaW5jICAgICAgICA6ICAgIDEu
MzY2IMKxIDAuMDA2TS9zCmhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEgMC4wMDFNL3MKClsx
XSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4L2NvbW1pdC84ZGVjOTAwOTc1ZWYK
ClNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgotLS0K
IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyNCArKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMKaW5kZXggMTVlNDgyZjJjNjU3Li45OWQ3MDA2ZjE0MjAgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwpAQCAtMTIsNiArMTIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5o
PgogI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgogI2luY2x1ZGUgPGFzbS9jZmkuaD4KKyNpbmNsdWRl
IDxhc20vcGVyY3B1Lmg+CiAjaW5jbHVkZSAiYnBmX2ppdC5oIgogCiAjZGVmaW5lIFJWX0ZFTlRS
WV9OSU5TTlMgMgpAQCAtMTA4OSw2ICsxMDkwLDI0IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihj
b25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAog
CQkJZW1pdF9vcihSVl9SRUdfVDEsIHJkLCBSVl9SRUdfVDEsIGN0eCk7CiAJCQllbWl0X212KHJk
LCBSVl9SRUdfVDEsIGN0eCk7CiAJCQlicmVhazsKKwkJfSBlbHNlIGlmIChpbnNuX2lzX21vdl9w
ZXJjcHVfYWRkcihpbnNuKSkgeworCQkJaWYgKHJkICE9IHJzKQorCQkJCWVtaXRfbXYocmQsIHJz
LCBjdHgpOworI2lmZGVmIENPTkZJR19TTVAKKwkJCQkvKiBMb2FkIGN1cnJlbnQgQ1BVIG51bWJl
ciBpbiBUMSAqLworCQkJCWVtaXRfbGQoUlZfUkVHX1QxLCBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFk
X2luZm8sIGNwdSksCisJCQkJCVJWX1JFR19UUCwgY3R4KTsKKwkJCQkvKiA8PCAzIGJlY2F1c2Ug
b2Zmc2V0cyBhcmUgOCBieXRlcyAqLworCQkJCWVtaXRfc2xsaShSVl9SRUdfVDEsIFJWX1JFR19U
MSwgMywgY3R4KTsKKwkJCQkvKiBMb2FkIGFkZHJlc3Mgb2YgX19wZXJfY3B1X29mZnNldCBhcnJh
eSBpbiBUMiAqLworCQkJCWVtaXRfYWRkcihSVl9SRUdfVDIsICh1NjQpJl9fcGVyX2NwdV9vZmZz
ZXQsIGV4dHJhX3Bhc3MsIGN0eCk7CisJCQkJLyogQWRkIG9mZnNldCBvZiBjdXJyZW50IENQVSB0
byAgX19wZXJfY3B1X29mZnNldCAqLworCQkJCWVtaXRfYWRkKFJWX1JFR19UMSwgUlZfUkVHX1Qy
LCBSVl9SRUdfVDEsIGN0eCk7CisJCQkJLyogTG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4g
VDEgKi8KKwkJCQllbWl0X2xkKFJWX1JFR19UMSwgMCwgUlZfUkVHX1QxLCBjdHgpOworCQkJCS8q
IEFkZCB0aGUgb2Zmc2V0IHRvIFJkICovCisJCQkJZW1pdF9hZGQocmQsIHJkLCBSVl9SRUdfVDEs
IGN0eCk7CisjZW5kaWYKIAkJfQogCQlpZiAoaW1tID09IDEpIHsKIAkJCS8qIFNwZWNpYWwgbW92
MzIgZm9yIHpleHQgKi8KQEAgLTIwMzgsMyArMjA1Nyw4IEBAIGJvb2wgYnBmX2ppdF9zdXBwb3J0
c19hcmVuYSh2b2lkKQogewogCXJldHVybiB0cnVlOwogfQorCitib29sIGJwZl9qaXRfc3VwcG9y
dHNfcGVyY3B1X2luc24odm9pZCkKK3sKKwlyZXR1cm4gdHJ1ZTsKK30KLS0gCjIuNDAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
