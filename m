Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD4560A2602
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s3cXNHPJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S2X6qFq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnyN8ItJ5kWwig/6KQ3EOZdFV9PE5NISj0UO+MCsrAU=; b=s3cXNHPJjcJCEf
	LTnj/QcsSh0TglcPA2/RtsRMts/8z9U9rDI/EQq8OEa3dEBcS+ADLfADIaYx1/RaLLCtunCjczJ4m
	sxSBjZnzzl5lrsXFhLjVlgRgJaT8tksFy4sAOIFsLanA0psGaa8onpzkknaa/hpdRZZDmLykE7lZy
	la+ROHsbd7k1bauAnBEcVewJ2xtWHiXdCq57MBcphcO9IkpTfY5mXaP6Y2ueAeQCxbeBbsud9yPx9
	rf4/QXdVubC25hca79KRwPevnCAoCbhRoDT6kQHzbomKUbhlykmphFfkfNBlf1J37HwmyuIvGiCXY
	IUj7j6WfClQJ06lImZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER6-0000000AQGb-1ecW;
	Tue, 20 Oct 2026 18:19:44 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJER4-0000000AQFb-1Pli
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:43 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3535a54bed9so4863218eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520381; x=1793125181; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=S2X6qFq06noW+f4bw4ub5BHxiw39zRGOAYBaBRZrwyKtqllz9koEOZ2IZxzf9dXwz6
         QKMKWc4kE968wMwwIQGmiW2wsvDRDTYD+L8RJ+IcYwwL5o51YvK+JbWEPlm0dKw91iXY
         Ncx4itcYdLKyX6X8cr6kWy1xfH6n0oWkl94YGjVFRL+YD5W8PAEsetUvhyUpLeMoV5ti
         N+eAV8dwe+xiCHl7yt+EQWqF71+V6pz09KQRaibWa459tU3syziTyI1hRlnY02Sew/oR
         epr/iXRMNfPHiUZR/absNshcoBGw4vYICjhlDtkFjygyHpVxC36Uk/cFSAlvwaPcVHlV
         qVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520381; x=1793125181;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAgJAbuVXKrl/2XmWKq188uudjDScblSy5jf6BBIQNg=;
        b=o9mkcdidv8iNXK50laQvq3lg9gR3+LZVYqwE+zhxqqXMEk9nRzUUSCna7l3pbIp5L+
         H1Mm5ebEGdLWPfb8F/e4NRQcKvdO4xUHAUQMX88yr+8J+FdUa4k47pbd4sCXWKnX0qax
         Wm6yoBcfTYPmNW5FXhqwuNjerPrbDtACIFvcivGLSCp5iyNu1lGH5WhZLqhL5qf+Qh+O
         f6ziP4JmRgdv2XcQGUu4Of6oh+pky+5g/d9P0FwWb/z0HrrENnAbbgIFxac7T9T2jQg5
         Jcg6ZAqNGxJcEtr++4hl2CzldTZ3viqNSE8xRh1uk2PQkyI4KaC1AjR3JRSVrG6Y/A1H
         BMKg==
X-Forwarded-Encrypted: i=1; AKwUvBxBYRv2Wl3/ZUBBtwwnXT+XdAC/OaN88qzS1gt7a8rJFdSgzEcXZFdfRoJkfIJgNsPySzD7/fIbm3PREg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJvccG47WGMzx2EPCwvk5X3q+u3+k+4pSoEaP8uRimjZ1UG2fRR
	MynQ4ro+h0OwOu/5QvDc5TinGNz0p16qdo1CRd+pWEwCc24i80j85wNs
X-Gm-Gg: AYBFou1lgZhJuehAT2qVyGYvMFHPaywc8iYkYsyqllrdZ5aEqPBbdwDuObAG/W7t7K8
	KtsPNwuDUDilICMnZtAZPdot0xRTne9L1xmzXqnzUccj60b//qMphzRtfZZDwfRmv7QIgEB+sdJ
	cWYK/F86kV82jCh0QmT5RLytUMqU9nOWj7ecznAMjiSB4XdBt+iQNBohJjcUG+sQ9Cupi7x0iUm
	dp3mnVwY8k1g+AlGZU2g5IIsmE1j9KDvD5tEjs0seu3bFs5xx01AtD1Iecel2DDiyONacc9NGLU
	88/30RlMIy8S3vHe/qfbdlmiIs7Zx4Clw/SauD0ZstzuIkAy4rxL5iba06zLzQSfNIR0IU68kA/
	RRJCuf6SEbZrzQdu7NnYJ2g1AtppI+z5nye0EjmJDKhgpOVmPtexfqLxynn5bh8yNwa1JgJQv1K
	ZZAjTnATzRpqOfHNnSWSFlCbopWm8a6eOO8t4tcwFibSFbFW5TRvVdYbuUiR2FeOUI
X-Received: by 2002:a05:693c:8399:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3674a40738emr116407eec.5.1792520380928;
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:40 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Tue, 20 Oct 2026 15:19:29 -0300
Message-ID: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111942_370066_C1BDC8AC 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBpcyBub3QgYSBwb3J0IG9mIHRoZSB4ODYgVExTIGZpeC4gVGhhdCBsZWFrIHdhcyBpbnNp
ZGUKY29weV90aHJlYWQoKSB3aGVuIHNldF9uZXdfdGxzKCkgZmFpbGVkLCBzbyBjb3B5X3Byb2Nl
c3MoKSBza2lwcGVkCmV4aXRfdGhyZWFkKCkuIEhlcmUgY29weV90aHJlYWQoKSByZXR1cm5zIDAg
YW5kIGEgbGF0ZXIKY29weV9wcm9jZXNzKCkgc3RlcCBmYWlscy4gVGhlIGNvbmNyZXRlIGhvbGUg
aXMgY2xvbmUzKCkgd2l0aApDTE9ORV9WTXxDTE9ORV9QSURGRCBhbmQgYW4gdW53cml0YWJsZSBw
aWRmZCBwb2ludGVyOiBwdXRfdXNlcigpCnJldHVybnMgLUVGQVVMVCBhZnRlciB0aGUgYXJjaGl0
ZWN0dXJlIGhhcyBtYXBwZWQgYSBzaGFkb3cgc3RhY2suCmV4aXRfdGhyZWFkKCkgZG9lcyBydW4s
IGJ1dCBhcm02NCBhbmQgcmlzY3YgZGlkIG5vdCBpbXBsZW1lbnQgaXQsIHNvCnRoYXQgbWFwcGlu
ZyBzdGF5cyBpbiB0aGUgcGFyZW50J3MgbW0uCgpOb3JtYWwgZXhpdCBhbHJlYWR5IGZyZWVzIHZp
YSBkZWFjdGl2YXRlX21tKCkuIFRoZSBmYWlsZWQtZm9yayBwYXRoCm5ldmVyIHJlYWNoZXMgdGhh
dC4gVGhlIGZyZWUgaGVscGVycyBhbHJlYWR5IHJlZnVzZSBhIGZvcmVpZ24gbW0KYW5kIGEgY2xl
YXJlZCBiYXNlLCBzbyB3aXJpbmcgdGhlbSB0byBleGl0X3RocmVhZCgpIGRvZXMgbm90IHVubWFw
CnRoZSBwYXJlbnQgb24gIUNMT05FX1ZNIG9yIGRvdWJsZS1mcmVlIG9uIGEgbm9ybWFsIGV4aXQu
IEEKc3VjY2Vzc2Z1bCBjbG9uZTMoKSBjaGlsZCB3aXRoIHRoZSBzYW1lIGZsYWdzIGV4aXRzIHRo
cm91Z2gKZGVhY3RpdmF0ZV9tbSgpIGFuZCB0aGVuIGV4aXRfdGhyZWFkKCk7IHRoYXQgaXMgdGhl
IHVzdWFsIHRlYXJkb3duCm9yZGVyIHRoaXMgc2VyaWVzIGFsc28gZW5hYmxlcy4KCnJpc2N2J3Mg
c2hzdGtfcmVsZWFzZSgpIGNvbW1lbnQgYWxyZWFkeSBkZXNjcmliZWQgdGhpcwpleGl0X3RocmVh
ZCgpIGNhbGwuIFRoZSBhcmNoaXRlY3R1cmUgbmV2ZXIgc2VsZWN0ZWQKSEFWRV9FWElUX1RIUkVB
RCwgc28gdGhlIGRvY3VtZW50ZWQgcGF0aCB3YXMgbm90IGNvbm5lY3RlZC4KCkRvIG5vdCBhZGQg
Y2xlYW51cCBmb3IgYSBjb3B5X3RocmVhZCgpIGFsbG9jYXRpb24gZXJyb3I6CmNvcHlfcHJvY2Vz
cygpIHNraXBzIGV4aXRfdGhyZWFkKCkgd2hlbiBjb3B5X3RocmVhZCgpIGZhaWxzLiBhcm02NApj
bGVhcnMgaW5oZXJpdGVkIGFsbG9jYXRpb24gdHJhY2tpbmcgYmVmb3JlIGF0dGVtcHRpbmcgdGhl
CmFsbG9jYXRpb247IG9uIHJpc2N2IGEgZmFpbGVkIGFsbG9jYXRpb24gY2FuIHN0aWxsIGxlYXZl
IHRoZQppbmhlcml0ZWQgcGFyZW50IGJhc2UgaW4gcGxhY2UuIFRhc2tzIGNyZWF0ZWQgdGhyb3Vn
aCB0aGUgYXJncy0+Zm4KcGF0aCBkbyBub3QgYWxsb2NhdGUgYSB1c2VyIHNoYWRvdyBzdGFjayBp
biBjb3B5X3RocmVhZCgpOyB3aXRoCkNMT05FX1ZNIGEgbGF0ZXIgZmFpbGVkIGNvcHlfcHJvY2Vz
cygpIHN0aWxsIHNoYXJlcyB0aGUgY2FsbGVyJ3MKbW0sIHNvIHRoYXQgcGF0aCBjbGVhcnMgaW5o
ZXJpdGVkIHRyYWNraW5nIGJlZm9yZSByZXR1cm4uCgp4ODYgZG9lcyBub3QgbmVlZCB0aGUgc2Ft
ZSBhcmdzLT5mbiBjbGVhcjogY29weV90aHJlYWQoKSBydW5zCnNoc3RrX2FsbG9jX3RocmVhZF9z
dGFjaygpIGJlZm9yZSBib3RoIHRoZSBQRl9LVEhSRUFEIGFuZCBsYXRlcgphcmdzLT5mbiByZXR1
cm4gcGF0aHMsIHNvIENMT05FX1ZNIHJlcGxhY2VzIHRoZSBpbmhlcml0ZWQgdHJhY2tpbmcKZmly
c3QuCgpUaGUgc2VsZnRlc3RzIGFzc3VtZSAvcHJvYyBpcyBtb3VudGVkLiBUaGV5IHVzZSBrc2Vs
ZnRlc3QuaCAvIEtUQVAuCkZlYXR1cmUgYW5kIGNsb25lMyBhdmFpbGFiaWxpdHkgc2tpcHMgcnVu
IGJlZm9yZSBrc2Z0X3NldF9wbGFuKCkuClRoZSBwbGFuIGlzIHRocmVlIHRlc3RzOiBhIHZhbGlk
IGNsb25lMyB3cml0ZXMgYSBwaWRmZCwgc2l4dGVlbgpiYWQtcGlkZmQgY2xvbmVzIHJldHVybiAt
RUZBVUxULCBhbmQgdGhlIHNoYWRvdy1zdGFjayBWTUEgY291bnQgaXMKdW5jaGFuZ2VkLgoKQmFz
ZWQgb24gY29tbWl0IGY0N2QyMjM2MjdmOCAoIk1lcmdlIHRhZyAndmZzLTcuNC1yYzEuc3luY19j
bG9zZScgb2YKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zm
cy92ZnMiKS4KCmFybTY0OiBRRU1VIDExLjEuMiAtbWFjaGluZSB2aXJ0IC1jcHUgbWF4LCBDT05G
SUdfQVJNNjRfR0NTLCBvbmUKdkNQVS4gVW5wYXRjaGVkIFZNQSBjb3VudCAxLT4xNy4gUGF0Y2hl
ZCAxLT4xLCAzLzMgS1RBUCBwYXNzLgoKcmlzY3Y6IFFFTVUgMTEuMS4yIC1tYWNoaW5lIHZpcnQK
LWNwdSBydjY0LHppbW9wPW9uLHpjbW9wPW9uLHppY2Zpc3M9b24sIENPTkZJR19SSVNDVl9VU0VS
X0NGSSwgb25lCnZDUFUuIFVucGF0Y2hlZCBWTUEgY291bnQgMS0+MTcuIFBhdGNoZWQgMS0+MSwg
My8zIEtUQVAgcGFzcy4KCkNoYW5nZXMgc2luY2UgdjE6Ci0gYXJtNjQ6IGludHJvZHVjZSBnY3Nf
cmVzZXRfdGhyZWFkKCkgKGVtcHR5IHN0dWIgd2l0aG91dAogIENPTkZJR19BUk02NF9HQ1MpLiBE
b2N1bWVudCB3aHkgeDg2IGRvZXMgbm90IG5lZWQgdGhlIHNhbWUKICBhcmdzLT5mbiBjbGVhci4g
Q29tbWVudCB0aGUgcHJvcGVydHkgb2YgdGhlIGFyZ3MtPmZuIHBhdGgsIG5vdAogIG9ubHkga2Vy
bmVsX3RocmVhZCgpLgotIHJpc2N2OiBzYW1lIGFyZ3MtPmZuIHdvcmRpbmc7IGNsYXJpZnkgdGhh
dCBub3JtYWwgZXhpdCByZWFjaGVzCiAgc2hzdGtfcmVsZWFzZSgpIHRocm91Z2ggZGVhY3RpdmF0
ZV9tbSgpIHdoaWxlIGZhaWxlZC1mb3JrIGRpZCBub3QuCi0gc2VsZnRlc3RzOiByZXdyaXRlIG9u
IGtzZWxmdGVzdC5oIC8gS1RBUC4gRHJvcCBvcGVuLWNvZGVkCiAgW09LXS9bRkFJTF0sIGV4Y2x1
c2l2ZS1lbmQgVk1BIG1hdGNoaW5nLCBzc19rYiwgZGVwdGgoMTYpLCBhbmQKICBwYXJlbnQgR0NT
UFIvU1NQIHBpbmcgY2hlY2tzLiBDb3VudCBvbmx5IFZtRmxhZ3MgbGluZXMgd2l0aCAiIHNzIi4K
ICBTa2lwIGJlZm9yZSBrc2Z0X3NldF9wbGFuKCkuIEZhY3RvciBteV9zeXNjYWxsMiBpbnRvIGdj
cy11dGlsLmguCgpBc3Npc3RlZC1ieTogTExNCgpJdsOhbiBFemVxdWllbCBSb2RyaWd1ZXogKDQp
OgogIGFybTY0L2djczogcmVsZWFzZSBHQ1Mgb24gZmFpbGVkIGZvcmsKICByaXNjdi9zaHN0azog
cmVsZWFzZSBzaGFkb3cgc3RhY2sgb24gZmFpbGVkIGZvcmsKICBzZWxmdGVzdHMvYXJtNjQ6IEdD
UyBtdXN0IG5vdCBsZWFrIG9uIGEgZmFpbGVkIGNsb25lMwogIHNlbGZ0ZXN0cy9yaXNjdjogc2hh
ZG93IHN0YWNrIG11c3Qgbm90IGxlYWsgb24gYSBmYWlsZWQgY2xvbmUzCgogYXJjaC9hcm02NC9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvYXJtNjQvaW5j
bHVkZS9hc20vZ2NzLmggICAgICAgICAgICAgICAgICB8ICAgOCArCiBhcmNoL2FybTY0L2tlcm5l
bC9wcm9jZXNzLmMgICAgICAgICAgICAgICAgICAgfCAgMTkgKysKIGFyY2gvcmlzY3YvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMgICAgICAgICAgICAgICAgICAgfCAgMjAgKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0L2djcy9NYWtlZmlsZSAgICB8ICAgMyArLQogLi4uL3NlbGZ0ZXN0cy9hcm02NC9n
Y3MvZ2NzLWNsb25lLXBpZGZkLmMgICAgIHwgMTY4ICsrKysrKysrKysrKysrKysrCiAuLi4vdGVz
dGluZy9zZWxmdGVzdHMvYXJtNjQvZ2NzL2djcy1sb2NraW5nLmMgfCAgMjAgLS0KIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0L2djcy9nY3MtdXRpbC5oICB8ICAyNCArKysKIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0L2djcy9saWJjLWdjcy5jICB8ICAyMCAtLQogdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlICAgIHwgICA1ICstCiAuLi4vc2VsZnRl
c3RzL3Jpc2N2L2NmaS9zaHN0ay1jbG9uZS1waWRmZC5jICAgfCAxNzMgKysrKysrKysrKysrKysr
KysrCiAxMiBmaWxlcyBjaGFuZ2VkLCA0MjAgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvZ2NzL2dj
cy1jbG9uZS1waWRmZC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvY2ZpL3Noc3RrLWNsb25lLXBpZGZkLmMKCgpiYXNlLWNvbW1pdDogZjQ3ZDIyMzYy
N2Y4MGNiN2ExZWIxNGM1ODVmZTZjYjM1ZGU1ZTk4NAotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
