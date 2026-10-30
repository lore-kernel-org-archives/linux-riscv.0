Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CA0606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L/ItQ6Ui;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=CS9+kCg8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ThxInMuZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dCrzVjG3C82M+pInAKTbH5HPpfVrptwhVmxoQFpAHsw=; b=L/ItQ6UiiSInWjQC1VtUP83BuE
	Vj2qJ2FjgfcTw0ClDBlN0n9/5e3hLmFv/4msKSuld1WGWpv2Jg2QL6p69NnoTmYCLsjsj1wtJvID6
	K4k2QYTA7ij5kXhJmARKEqOwSAFF9aLzreYAZxbJs3YufrSdUMxd5NljOHqrhnny6FB4CpAoRcHyf
	Lt3WqJZ82nVH3EL1MEuTeh8HGxZ/2pkpRd1MdXKcrDj3jEGcjrxYnlKzvpjrvUZZIButmjXFelHPJ
	LUpL2zL0yRg86tfOSIe0LTPG8v6wg5Uk7Q2P3Unu+rZdSe65BQZQLl+qIxagUS20rq8cK9FTXCLCx
	9tdJS45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbxL-0000000AeGo-1ibz;
	Fri, 30 Oct 2026 02:02:59 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbxH-0000000AeFh-2Wvq
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 02:02:57 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id D0B1CEC0582
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 22:02:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Oct 2026 22:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793325774;
	 x=1793412174; bh=jGCqEVzR8T1S5Te8Lz5QXH3GsyVWL8IhPNvqqtIcotg=; b=
	CS9+kCg80UFquvnQJvnWu1yUSwczvy/s3xZCDCMjt2ODUqwXljno7+gGdVODhEWE
	kzXgdv9vpaLIjfeYlXXaxakJJbGzXNuZdXAWTiDAg1HJRyUbhyq+sBB0X5hKmu0x
	EKchhNdbgC3fON7K5XyqpU449Ex79gkVvqC+kOomlOm6ij8MwlW77Ao8gOBfO4Z8
	pwbRl8MucHywt+DLezeXkG5Yp9hrIDWxZpUm4upmVoqUSLJkrtNt+l/RK/FczF7M
	57HWabY2Ewgd5bEzGNLtHclMA3NVBw5hPtHICZR5a0JxUYE6EP+CW07TmxED3g/N
	LFAcn4bpI5KspkEMServXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793325774; x=
	1793412174; bh=jGCqEVzR8T1S5Te8Lz5QXH3GsyVWL8IhPNvqqtIcotg=; b=T
	hxInMuZodVHh9qTpSdZOUF0OCUDmQ2agEfFKHrr2ktMZ+eUdUBGYv6P/L+brf5Zr
	LYhnlIqGD5XyIhITOkXRrhQoK6Rt/GfS6Wv7pOLoFCXmtivKjzND5QrlVGWz9Kck
	xcf3mf443ZTNOg0qtvoRXEHlxnhASMGlqKbdNJgkxQOWtBTO8m59mHiIoln3N3CP
	ItfL6CiGdFIXpfIheeIP5odHGIxTiuQO4xMm9K8ahDzqYsrD60UIvT1UnN4ZRomV
	1LH49QcZqVKcNs7pa4O1DZ23TWWRORmDvFrhEx9OyLRzxGL6fISF+KVdNrQLbjH5
	Qj+beA2/8OminfvhY4F+g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793325774; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm1:rsa-sha256:D8MVxrDwHJPABEeYhrjFBddAitQi7LByyqjRxAJcBS7YPQp
	jvVV4Ce2F/bpympMT7fAr1TvZKm5f9FXwkjn2q7s813aormfGoHBuE9mb2phYSLX
	PRCgnhahRdJZtycBC2fVtCHPfPFXXBUsgblXIPROlqbrtT9t0MFRHe0Bwd2ybYgo
	/Zj0UhV8AKI6xmCUOGquG5j8+MNAOYlICIhXUQUJ/jnfR1AmoxMWFG2ReE5+K3Rk
	7GZNx1368xCQ3qq0UEw0r1WF5qXUdCxfKmpFfHZgWnVguJGUKu/nIj4tH/4KUSLM
	edbBsMUuduetToVIFBXj2K1pNhT/PaQb7wrSA7Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BHAQ4FGcV0vC5kZ+s1eHL1VLTD9CCd8qzVcPUVp7oyA=:WXN9aA2uAcweQ3W0QdkUDtUrqZiXSYHVf6/pF7LdZ+I=;
X-ME-Sender: <xms:zvrjav6Aiwzg7MuWCZ2M_cjrHsSxbi5X9aUrsIcYfesNkKzAv2OGFw>
    <xme:zvrjamgnO_GIPZjV7O9KttJpRjPRG4vdrFAzaebcXEXSvVv9gx4n3BZJbfOSa0qYQ
    ASQ7g8bz6kwRiFzzKAcw9bDDRgd9nZ97twKdHtBOXGP0Ydo7xZFSet1Jg>
X-ME-Received: <xmr:zvrjaqgcOcYfH9tpZDXT_SOiyXocRQg8hg4aqbGmrkRYBNyZsHuOdc__NJgrlD2dMHNv8Jwn8WT6kGhqmdg>
X-ME-Proxy-Cause: dmFkZTFfgFyuGgAj/l0WtMGSZ5mlCRXFY7BbGhK3fHRqzV+g0zIjieft2/feh1wXq7p0Cd
    YhkJgIwt18g+bpyc9psrGGoi9jNfRrd0kmTvZQNXK1u0H/sIu0NTwbkgnxwGLihEs8cRl7
    QEM4bOaiYXoYZf/fGxFvGhGPsAVwWrIsCISNkGr0Xx7GQYTjY+kMZe3o4tz082o3MS18hW
    Sf+aWHqcG5i+X+2yNrTD+DKWpt6e7d3p1IdFI8OycVRCKTtjpj8I/51U0mCW/BNLvMHN4g
    t8LyjQnTMtyyrLfWM7t6agciETihO18Qo29x0eEvSAOBLhCX3wQrfpMx3nSpEsLeash6CH
    X8lLuuYT8DPQq78PtjhtRO0O0m0Gn6YzjaU6QHfuIwn3idtG7NBezhhekHnC5iITDp74mW
    AOsvRcqTUpx0P7KjjaQsCDGoYdv94gYR4D+QI4AP6ePw3Uz/6yBnBp9qkBEXOrBsrf6EWQ
    BuiTgDsKROxofZWF426AOnEZI51T/K2y1BEBb+90thT+o99sDynRy/p4xTdgIJPjFgqbUq
    ZPrP6sXTuOrU/Nr727gWVmdwApl9TCuUpxR697Exz7IcSHNc8IFZfs+Al6718j/H1ppb+e
    S7RUoYNMksvfOo8CgJefPTkKAhhGn98PWpSCYn56jNWgACLv5hIVDIjPnMTQ
X-ME-Proxy: <xmx:zvrjamnKAZeeXCj4l6sRQbuAaW7znQdCPJMWuf0yETolb5NIuOMJuA>
    <xmx:zvrjaiEhZFwYu6g8k7oxXnlj3APYbb74vs_BfHB1f_03hp1uPywcAQ>
    <xmx:zvrjaoO0Infry5XymrPR6duqeu8bvT78GM_-m_lAPFsB-Vv83BL48w>
    <xmx:zvrjapue5EKJ5Sewr9H4P-L2xWIOh108ZkcinIj2S4VKac91hmVjyw>
    <xmx:zvrjarFSqxAmObBIIMYto-D8vqYF2yomjH72e9UGBcFriVx6e0H2iNmu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 22:02:49 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v3 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Fri, 30 Oct 2026 11:02:09 +0900
Message-ID: <20261030020209.3833766-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030020209.3833766-1-tomo@flapping.org>
References: <20261030020209.3833766-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_190255_721707_98754777 
X-CRM114-Status: GOOD (  10.03  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPgoKRml4IHRo
ZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Igb24gMzItYml0IEFSTSB3aXRoIENPTVBJTEVfVEVTVDoK
CiAgRVJST1I6IG1vZHBvc3Q6IGRyaXZlcnMvcHdtL3B3bV90aDE1MjAua286IHN5bWJvbCAnX19h
ZWFiaV91bGRpdm1vZCcgdW5kZWZpbmVkIQoKVGhlIGRyaXZlciBkaXZpZGVzIHU2NCB2YWx1ZXMg
d2hlbiBpdCBjb252ZXJ0cyBiZXR3ZWVuIG5hbm9zZWNvbmRzIGFuZApjbG9jayBjeWNsZXMuIE9u
IDMyLWJpdCBBUk0sIHRoZXNlIGRpdmlzaW9ucyBhcmUgY29tcGlsZWQgdG8gY2FsbHMgdG8KX19h
ZWFiaV91bGRpdm1vZCwgd2hpY2ggdGhlIGtlcm5lbCBkb2VzIG5vdCBwcm92aWRlLgoKVXNlIGRp
djY0X3U2NCgpIGFuZCBkaXY2NF91NjRfcm91bmRfdXAoKSBmb3IgdGhlc2UgZGl2aXNpb25zLCBp
biB0aGUKc2FtZSB3YXkgYXMgQyBkcml2ZXJzIHVzZSBkaXY2NF91NjQoKSBhbmQgRElWNjRfVTY0
X1JPVU5EX1VQKCkuIFRoZQpyZXN1bHRzIGRvIG5vdCBjaGFuZ2UuCgpGaXhlczogM2MxODAwMDNk
ZmZiICgicHdtOiB0aDE1MjA6IEZpeCBtaXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIikKUmVw
b3J0ZWQtYnk6IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4KQ2xvc2Vz
OiBodHRwczovL3J1c3QtZm9yLWxpbnV4Lnp1bGlwY2hhdC5jb20vI25hcnJvdy9jaGFubmVsLzI5
MTU2NS1IZWxwL3RvcGljLzY0Yml0LjIwZGl2aXNpb24uMjBpbi4yMC42MHB3bV90aDE1MjAuMkVy
cy42MC9uZWFyLzYyNjgyNTU5OQpTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPgpBc3Npc3RlZC1ieTogTExNClNpZ25lZC1vZmYtYnk6IEZVSklUQSBU
b21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd21f
dGgxNTIwLnJzIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIGIv
ZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwppbmRleCA3Mjg5OTM5OTg0NDYuLmJkMDVmZTQ5NjUw
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycworKysgYi9kcml2ZXJzL3B3
bS9wd21fdGgxNTIwLnJzCkBAIC0zMSw2ICszMSwxMCBAQAogICAgICAgICBtZW06OkRldnJlc0lv
TWVtLAogICAgICAgICBJbywgLy8KICAgICB9LAorICAgIG1hdGg6OnsKKyAgICAgICAgZGl2NjRf
dTY0LAorICAgICAgICBkaXY2NF91NjRfcm91bmRfdXAsIC8vCisgICAgfSwKICAgICBvZiwKICAg
ICBwbGF0Zm9ybSwKICAgICBwcmVsdWRlOjoqLApAQCAtNjgsMTMgKzcyLDEzIEBAIGNvbnN0IGZu
IHRoMTUyMF9wd21fZnAobjogdTMyKSAtPiB1c2l6ZSB7CiBmbiBuc190b19jeWNsZXMobnM6IHU2
NCwgcmF0ZV9oejogdTY0KSAtPiB1NjQgewogICAgIGNvbnN0IE5TRUNfUEVSX1NFQ19VNjQ6IHU2
NCA9IHRpbWU6Ok5TRUNfUEVSX1NFQyBhcyB1NjQ7CiAKLSAgICBucy5zYXR1cmF0aW5nX211bChy
YXRlX2h6KSAvIE5TRUNfUEVSX1NFQ19VNjQKKyAgICBkaXY2NF91NjQobnMuc2F0dXJhdGluZ19t
dWwocmF0ZV9oeiksIE5TRUNfUEVSX1NFQ19VNjQpCiB9CiAKIGZuIGN5Y2xlc190b19ucyhjeWNs
ZXM6IHUzMiwgcmF0ZV9oejogdTY0KSAtPiB1NjQgewogICAgIGNvbnN0IE5TRUNfUEVSX1NFQ19V
NjQ6IHU2NCA9IHRpbWU6Ok5TRUNfUEVSX1NFQyBhcyB1NjQ7CiAKLSAgICAodTY0Ojpmcm9tKGN5
Y2xlcykgKiBOU0VDX1BFUl9TRUNfVTY0KS5kaXZfY2VpbChyYXRlX2h6KQorICAgIGRpdjY0X3U2
NF9yb3VuZF91cCh1NjQ6OmZyb20oY3ljbGVzKSAqIE5TRUNfUEVSX1NFQ19VNjQsIHJhdGVfaHop
CiB9CiAKIC8vLyBIYXJkd2FyZS1zcGVjaWZpYyB3YXZlZm9ybSByZXByZXNlbnRhdGlvbiBmb3Ig
VEgxNTIwLgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
