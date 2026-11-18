Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D3606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zwa8oGPh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=asrSSb3w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pdBjWfeB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Z2lufpjaM8o8Hvp1n2YCVSfRQmRfYJv8Pte/MHh+xI=; b=Zwa8oGPh/AqAmNH1yiuOmHN6qm
	gtO0oXNCl5vfUAFUDev0UYxkFY3DDcsmvZ9bFgzoH4bicJ0A/KgOM59KkfLFdJPhYM1D7V7wuxyss
	vFthmUX3gsVZqGfb7r2GI8csXcDYpMWPv8vKOkC4u016avUCAv8wzVqFYDeSgNhNQU4rU15DcRXZn
	FKlx+XULZyIissZ1OrrLh8jPNnOUdC8hLxwCQyEwYvqCgys1ve4CL4cmlEHWykhSHwg7B+PGFBW+s
	Xnly/FeI9FVxN2Dt1BhvA1iLVCLeYpxL4nTdOZa38mqK8gvXuGEsZK8GK0zycjmSaaf0kkfMIla5n
	LhdcX/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToNL-0000000AQs3-0g5n;
	Wed, 18 Nov 2026 22:43:35 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToNI-0000000AQrB-0jxt
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:43:33 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E130A7A02E2
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 17:43:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 18 Nov 2026 17:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795041806;
	 x=1795128206; bh=LVFpBiSldhBpOT4aalFMDp92Mf27FRvVEVVqeNA+pDw=; b=
	asrSSb3wlfSIirjY1E5hDgRoJ9UALX2wV5IyuaZS88ByhVDiOXUPsujFihoV5gsT
	T9YqPVbiXsAHZtV8S4zI+3AvQT1dRxmhHLJK4xSZXciJuQMcKRTrsCFHf/Un2VR3
	2at5xgVE2cMMuRgQI1PA0pxbpnoytCKkHPePJbfxonx3BNxbny5dgsV10vSxYs8W
	srQE5RB5DitCdcm9ELqcFzVUAOdnx2wffwqBHO1LSxOeo4T8sro8YOLE11EdF1XL
	fQrDhnjm3x9uDsqS9Y/Ozpc2jytPUcS+Vl1QNsZ5zh4SZ/aOgBeanGAizRO4m4tc
	OdkTyAXrWV5duaA6AzPV8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795041806; x=
	1795128206; bh=LVFpBiSldhBpOT4aalFMDp92Mf27FRvVEVVqeNA+pDw=; b=p
	dBjWfeBt3RUXwmh0xJ95VS8iv0YJI2dutCR6cs+OqMSpjnWwQtKvh/tQWptDIPT+
	43XIud1FgXZmcbMaSgQrJR4/vs+6CURRo0va2l3f6KsNwcUKN0vUHH49mm2Mj1UW
	eRK5U8ytWhBGjzm+WkSDiDJWjQObQsP8lOdFwGz079JrwqY03hqSGZ/zAdc5KXnu
	tR5EmWAGAVY2B3RQMwQFZigqB82NxNEbr70hfKXNBbgNrjgMvnLj10dAzszqqil8
	qHHeyhvDk6NbC1EBIOOJjfCjgaGJT7rPUzE136O1cV0l1RQeTZEZROX3YleoRD7a
	uj/0OYrM1dkipw54ob4KQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795041806; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:X7WajtzmFqCi0YPEAmrXVBxXYko5ureUgtHAckBE3yVNsGW
	PsGQBSry8XLtqH99H8K48iwaWQGquqygAeze4olRyvwy3Ro7uZreMgNBZ6gJ8RK3
	pZnCjZJXpHQdEN7eQd6yVMUJCkae6cyNB8sJq+jK7A8XqYCN3Ba8xyNTnIO9/QHK
	YJ06e0047+KcNlSYTl/X/iixsEeVdaUPxKAGIjEkFuN8HlPglJoUZERPy4hdd4IJ
	X5L9lp1I46q55RSARaLw+NbLEvPztQEIBSwFOijWrdnp0RTEDyj8XT2y+KvD7Zyf
	eCfCB5v3edKGryjkKrNfVaA/VVvWmG+VxgAZE1w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:9cnubcK1SIEWPR6abCvHPYen5ibxlcZdEVUGvNc/i0g=:WwyAxMqjlwUsaSLsIXEljbX1IqrG0u36O6DcGIs9kjk=;
X-ME-Sender: <xms:Dir-ap3E5zb3lOKKLt7hf-IAOTECez_3ixK2F6s0fI__2CZv35pSdA>
    <xme:Dir-ahvM2BfPDnMs1x1BeyZBN3D20LV41iuw9oXjmk_opN5ao2Y3aJx8PznH3fOlG
    UiT2ZJ1oLhWNdcgIul7Ixn7PESkeP2dND8o8sN0YWJK27gDJUHWMJ9a>
X-ME-Received: <xmr:Dir-at8OVegvHPRiVsw148prPS6JPDL9UnR0tpwvFw0vXYZqSiu5Bclx90EH2ET2fstvz-1dOAp583P3B-T-RdzY>
X-ME-Proxy-Cause: dmFkZTEcdeQwH8S6Bno21oPU5H7a24y1Ylu+BiRxhM9gyYuKnO8BrrrKrSlS9zLXDJmihU
    A0DJznSgS9Rs0qOW2HrcSh3vMW0ll91T+4ui1fOWgm6rr5wzy9CyMxBtMoZCzKgj+xUM5n
    btAqcpOykbRccnQLfvIIe6YAWd/jnZmrfa/lpFXErtNIoPefX/E547W6fc6/HORMwRToql
    qcYNJ8Nng2pzObJvsCRKq9cd4xts8ym9T/kwNfutIjnJB7mgkMcTDQ3LVCRjtJwQgjZMJR
    b8VTGpZ5gwtfSEIDl0Ipl4Ial9P0+kT65vpV6D1JdyVpB6REDCUCDuAjqTPxaGeWhTwpJV
    /FTpbNJLRL5jyNFU8uP5kDeL+4JJqkCCgK1RrmokopWOhsSAuZm4HVNjfbUu8bSWm0DcA2
    prYIhljICbVliAbrjvWvfoZ+PKwGODW9LiCZeXkyXNBUJdRyspyeQ3NCr8NGM6bLruid3R
    XmR38KHmtSd6uJR0MrZvL03xghseTX3f0nQs1Bv7Q12XagM7llEXAJQOco/DBoja1kdMPz
    kC4VVf0Ge83RH08F0Y3Gq92b0agrEEaPXtmnBvIr3UGYQFMoFePJxGjGUZqlV4WXh7Xx1U
    DS6+bBwZ8DrZ3ocoyHj+UNx1r4yQZy6sP/0KDI5kiaNXOU5LitJwYnqjjZxQ
X-ME-Proxy: <xmx:Dir-atRVOTVYU9u68vzqO3M0HsnhskhyuGG7y6LszXmRSxc9Kxpnfg>
    <xmx:Dir-arCf8PEiVKm2AF3qfn4NtwndtJrv-3bc-kawulCF2x7lkhqHPQ>
    <xmx:Dir-amYRfQutIwOSPLDF_sU0SRMiqze5TNnnV9HD_UOsdEyNlTI67g>
    <xmx:Dir-akIdFhh6vP1UGssHF8ObzIoiXOo9xhZx45y7kU4g0Xup80xGqQ>
    <xmx:Dir-ajzSYTo1terEkcQS9jq1NfrHfZ9DaHxwT17lgnoitDHS5s5Dzzin>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:43:21 -0500 (EST)
Date: Thu, 19 Nov 2026 07:43:18 +0900 (JST)
Message-Id: <20261119.074318.1203722168764358962.tomo@flapping.org>
To: aliceryhl@google.com
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org,
 ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org,
 acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3 1/2] rust: math: add div64_u64() and
 div64_u64_round_up()
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CAH5fLghd2at_rzqi6YU2MWFHK-r7S0VfpxrJ-dFsu0P7=2egCw@mail.gmail.com>
References: <20261030020209.3833766-1-tomo@flapping.org>
	<20261030020209.3833766-2-tomo@flapping.org>
	<CAH5fLghd2at_rzqi6YU2MWFHK-r7S0VfpxrJ-dFsu0P7=2egCw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_144332_391354_38D45819 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 21:52:36 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Oct 30, 2026 at 3:02 AM FUJITA Tomonori <tomo@flapping.org> wrote:
>> +#[inline]
>> +pub fn div64_u64(dividend: u64, divisor: u64) -> u64 {
> 
> You're missing #[track_caller] on both functions.
> 
>> +    if divisor == 0 {
>> +        panic!("attempt to divide by zero");
>> +    }
> 
> I suspect the panic built-in to the / operator may be more efficient,
> so please move this panic inside #[cfg(not(CONFIG_64BIT))].

Thanks, both make sense. I will fix them in v4.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
