Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF872606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lnx0I6BO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O5kEdMP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7Pi5OFLbc4HV73sFiEA3dAlLHp4j8d1zpPOluh5aZ/0=; b=lnx0I6BOm6Zu4rgPC5sREdnIV6
	vqP8P4JDjxAMJ55uEv9Z8MU8Uf3JwM1zXXWqkagj7klFqzWw0y0MCr5LEvoT75cm3aWb7SWNPYK7r
	QMrQzJ/9qP48Wy0iDvBbSdgDqxAcUKCw/BIGo6BXlSj/71LfCqMexIgCObo0QDPzZPvYtCanQtlne
	GVeVuk9YZ3KNuPX9en7qj0rZk01RTv3fK+/zDaDET9Vw6FbI9oRwzZq5TcBUTPvwm/NvkJ7qyovFo
	xHmhDKwOikrMA/gkmvArkTq3A1M0hVSLndB9GvTrzdRnXxmU/wgRB9x6ZkrG1EeIan9bUor/pAajC
	ycHXDczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbSW-0000000ELwu-2FkO;
	Sat, 07 Nov 2026 08:07:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbSG-0000000ELoF-08v7
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 08:07:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492f563d1c6so377854f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038834; x=1794643634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=O5kEdMP3yj36zn2nKsG+uW3/U/LkeMs4UQTSvQKBygIyGMj3yMY4eYMFRuJJlI2lF/
         PwNsmWx1/8XDZXL57cSYrUXSWGHIE/zg/uwDDvq28c8NXBPZ88nNj6QxG8OT9L5ez55y
         8kXVwJrUmR0Q7C3UW54/08amqDXroX1gqAvPm55O+uRI6o/R9wKeq6A3sQakF5wcALS/
         kVXNlh8kSkRf5GoStHyyNXVTYWPNvbchKMwUGHH5yXiN46su+FJPdZmdTTVt2uqCTFMc
         JUviGeYzQhaVxZsG+EuOFCVD9G1l2DJDP0wPuqTqms4ACnnv7YSVrYUYZiapUomPt86D
         lhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038834; x=1794643634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=gmL+wfwMF7h0gJbotuCMrh5J8/SWufh9D+kq9pt8MXmiXfSDIvJE899Y0dGRUxpthj
         iyAhgklZZu7MllXkFvXqyqz/aPMipwgm/I1U7feB2NnOJ4mhCq9sXQzWZqcIn00ImPzu
         /BvWiWH8uQUWtlkkZH/gHJGYHje1GhvCsSxRhb7kDzomBUw859DlOn0lnaagOsBHFHSg
         I9LCAfSPnpjup1t0FN4JIIk592SsWQ9rIuSo6m3PaKv1mXl0XM+Pk2CHwwiz31/DlaWT
         nt18ntLhibb9Gm/na3T9AkwACCv9YTcBsf5gEDyOCMTWvfRaq6kBAne7QX2stIFsrI58
         lZhg==
X-Forwarded-Encrypted: i=1; AKwUvBx6y+xJv7ViTVRdfwoKteDuq4o0GUnnhVUMqdUQxf8MwQSSiiiLExMJa/xctSV6Mh6BCOYwzOAANHTThA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/GPtTk0ISsCkFfF6mOo8pq0Eo7f8pNhzNmNYnR8t0iHNSmPkhH
	hSQx4eaH1i01RjNxcBEGZ3/PZOJVrXJ9Yh3CkFet4U2m3zl/pDiyXVc3jo0pH2pJzopt
X-Gm-Gg: AYBFou0Nx+NMxv7+YI0bvmJGHaykwj7H/sy/Lbv5yN4YOEUiAJGoOpfsSLRBwwJ71bM
	2Mv3ZW7ehzrYHMpXB2y1obBrr2aqqaL4tZ+hc2sO+UIpD7aEIDfIVcbwej3L+FLkTGIphr/sPwp
	Xfw76mkmKQVgdeQbrl+AaReUsWu1OhvZbkQUXgmA7D0mG1YwXWzC3CVooUKwMUVM/TAg5J/L8o7
	5Mjnng0cGMPvNpB/Jl3aYiRS07h518BP8A3hwHJ3lVCOywsTQFzwPcdABp7muovTItgQ0qZKfmm
	ggUHFBlPm/GPYBCmj7kos9ctVnGn+sWCv1S3z7pSDOfgdCegj/xLn04Vy0yHjYvpfmVHoaku4ue
	b5Zr6pU5WUGuLDBGLCpIrvTABU8avOmrkgjKjVOHcoWwcvLREkVBaxqT2KO84WnHI1KP4JLN2wI
	H2b6DH1LpEW9EwY1ag5n5tnja5iCKLFkyCBNqfRyrf3PoVmDSOKnEOYeytIMlcGD6kq8k2ArUuU
	K700CIsGxXYJuwgnEhi3QeSUskaETA2KhGqS+t6pWJh0MdrrUhPz9gzKXIJTBuyUQRN97cx3pQL
	tWGkZDQNoYqMpCYU1yM/ZcXMc5+lDAYR5BhFipvoP9NPOU3r4X6Z
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr83181085e9.2.1794038834255;
        Sat, 07 Nov 2026 00:07:14 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:13 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat,  7 Nov 2026 08:06:52 +0000
Message-ID: <418eb111fc016706fb64ec91cbfb077ce31e4577.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_000716_094773_4AFEF170 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

QWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgY292ZXJpbmcgdGhlIEJhbyBoeXBlcnZpc29yIGRyaXZl
cnMgYW5kIHRoZWlyClVBUEkgaGVhZGVyLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gUGVpeG90byA8
anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjU6Ci0gTm8gY2hhbmdlLgp2NDoKLSBEcm9wIHRoZSBh
cmNoLyovaW5jbHVkZS9hc20vYmFvLmggYW5kIGluY2x1ZGUvbGludXgvYmFvLmggZW50cmllcyAo
dGhlCiAgZmlsZXMgYXJlIGdvbmUpOyB1c2UgdGhlIGRpcmVjdG9yeSBmb3JtIGZvciBkcml2ZXJz
L3ZpcnQvYmFvLy4KCiBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmlu
ZGV4IDkzYWJiYjMxNTA2NS4uZGJlYTA4MTQ0N2UyIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUwor
KysgYi9NQUlOVEFJTkVSUwpAQCAtNDcxMiw2ICs0NzEyLDE0IEBAIEY6CWRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0LwogRjoJaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaAogRjoJaW5jbHVkZS9saW51
eC9wd21fYmFja2xpZ2h0LmgKIAorQkFPIEhZUEVSVklTT1IKK006CUpvc8OpIE1hcnRpbnMgPGpv
c2VAb3N5eC50ZWNoPgorTToJRGF2aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVj
aD4KK006CUpvw6NvIFBlaXhvdG8gPGpwZWl4b3RvQG9zeXgudGVjaD4KK1M6CU1haW50YWluZWQK
K0Y6CWRyaXZlcnMvdmlydC9iYW8vCitGOglpbmNsdWRlL3VhcGkvbGludXgvYmFvLmgKKwogQkFS
Q08gUDUwIEdQSU8gRFJJVkVSCiBNOglTYW50b3NoIEt1bWFyIFlhZGF2IDxzYW50b3Noa3VtYXIu
eWFkYXZAYmFyY28uY29tPgogTToJUGV0ZXIgS29yc2dhYXJkIDxwZXRlci5rb3JzZ2FhcmRAYmFy
Y28uY29tPgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
