Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC8606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JruJSTv/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJ2YKlIv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6x8QY0b1pGWlwAFWmKCDHb+KN/8zSplQGwLFD543akQ=; b=JruJSTv/09TzdfeNzxTU8u3/Fo
	dERwRqTaBmIaFy1eLWBVB4l632HSi8JvB9S0zLH33YFtjHjfKA6KxRozAPzf+5TeGEOr04REZDStK
	LtUigbA4Bh+JxDG6rz8c8wyqUNubJVkTnNMxEXiTkICmZ/1ObOk5eNJCY/AAr573D35a8GHdIVcrq
	G9kMveeUJhQZm245Mt5SO5ng5iJU3sw87z59epTLIOe+gOgntXItLaAD9RNU8x5zmTHHLzyWTjmg6
	MFK5TfCsT9tVaAVueUWvk9cK3CJcMdf+dZUsZWNveLoZ/I8dUNz+YkN7rxvyJpzxXpFA4iQxzrIgu
	x00sq2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZr5-0000000DR5G-3eQg;
	Thu, 26 Nov 2026 13:49:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZr4-0000000DR4f-32L2
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 13:49:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E9FC4144D;
	Thu, 26 Nov 2026 13:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542181F000E6;
	Thu, 26 Nov 2026 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700981;
	bh=aXLXQaTVxzvHfzZ5Xw8BhaYQpUv8mWSspk4W8GeUq/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XJ2YKlIvFRz4Ehyv0qJvJsMvxnTVXauatKJFQKD9pPsOJd3A3JPqry7THZMpEufoQ
	 6QdmtRNCTFLOlEDkm4tKKGxQ87H7jMiMjlTwk3IidUJ9u6WAU0t8qWBuIKeVItASr4
	 C59v+waqbxcuCZoExbO+wF4oOgYQKO9LsPgRNZ5A6zqmN9stC2nrwGnQNsxiL1/trb
	 OgDC9BKiDRK7IBBcseATmGk4Om6NN11Z3ML3jDovTiv7CWmsSgFy0vWRR/tajbHu08
	 XPgOofJG8bxqnXcF/xtmS6rninRGv4WqOlkvRnZ3w1WYWqNQnRDZUlwR1rpT+0ia8/
	 NcP/jgaTHW10w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
In-Reply-To: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
References: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: syscon: add T-Head
 TH1520 compatibles
Message-Id: <179570097389.79319.5412421374255035653.b4-ty@b4>
Date: Thu, 26 Nov 2026 13:49:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAxNyBOb3YgMjAyNiAxMzoyNDo1NiArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiBULUhlYWQgVEgxNTIwIGhhcyBtdWx0aXBsZSBzeXN0ZW0gY29udHJvbGxlcnMgZm9yIHRoZSAi
c3Vic3lzdGVtcyIgb24KPiB0aGUgY2hpcC4KPiAKPiBBZGQgdGhlbSB0byB0aGUgc3lzY29uIGJp
bmRpbmcuCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczogbWZkOiBzeXNjb246
IGFkZCBULUhlYWQgVEgxNTIwIGNvbXBhdGlibGVzCiAgICAgIGNvbW1pdDogM2YzYmUwNGNjMzQw
MWE2ZDA5MTNlN2Q0NTA0MTA5ZjRiMzYzNWRhZgoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
