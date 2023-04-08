Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3FCC77B61
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 04:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P2Y3rlzUfivVwEIAeWPTcQRAExKtulY1E1SWj7IQck=; b=zfhPGmiNiZom0y
	3ltqF9XtDcBSYRZF5Dc3iHGso0otU+wAY6oyn+LmU33EPwUleFyrHqV8QlPjse051dnYo0e3JA/Vg
	6zuAcAxsfhqOwRSTOEDH1ASDfViqeVCoKAd2UnEDk7itBqR6wuNVCCyBMHjDZSij0Njq7osyd+GhP
	qr+3MVbpp8j3AKyAnILXah1KPVhpxTnKrLCDzcwNyC//Q9aEVeAyHti7uFhIG6SANynKLkMa3yTAn
	Yhlw7ZDHh54TkOk3ZXdk0yW6aj2QHbOVk6FD4eT9mHqt2u7essagvgVo6JJCaCai9vgq9DZIbHskn
	YvSSOf677mv1vRw/HDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl0fc-00BjvN-22;
	Sat, 08 Apr 2023 04:59:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl0fZ-00Bjuy-0I
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 04:59:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7295E61642
	for <linux-riscv@lists.infradead.org>; Sat,  8 Apr 2023 04:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F61C433A0
	for <linux-riscv@lists.infradead.org>; Sat,  8 Apr 2023 04:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680929959;
	bh=AlwkfAgnvwz9uzFPB7ksufol3k1SPjuw/DEy9f4kJPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJ7a55yd5fQFqoKocMPnw6K+HHIVqnOHay8j2SfUTUa5Qxfy2dzTw3bSIWLgu98fc
	 zxtvzTPb9BnE7jwL4rYPTgYyi7kELFsvMIbxR/GS6be6rON+Q9xJnvaeGo10in2zH5
	 ztHERD287ZdNHbv9i+pEpSe81nV7AyTfiJesznilW6qpeKelSOSVOSZMz4yohm+VLO
	 YWS0FNZo7tegVynUtC/DX5/qe8kMGi3TBs5IFCwAfBXJDShim/qtZbGVlpPKux1vCQ
	 2lMhlmO4ar9myyKDEN9DD0cHEQvltnRIRyRW3ijNg6zxNIxQk56e5fMUIArBaz63ME
	 tRqhV9rqJgNzw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50489ad8a62so132071a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 21:59:19 -0700 (PDT)
X-Gm-Message-State: AAQBX9dt9igQHxIEAQmkIPgrRWtvNPHz6KxbQs4fQeHy+IRr5le0wNZ6
	tKFpAaLQ5uQCntDkggzoLSsV+YcPE8KhwmOF4z4=
X-Google-Smtp-Source: AKy350bzbSMsSo+21DJsxdtIscMCCxM/YBwWqx18n2qCLGhOkuAIkX/ygV0fvOnnMrBXGwl6EEfOwd3wgJFxpNdXmXc=
X-Received: by 2002:aa7:c787:0:b0:500:5627:a20b with SMTP id
 n7-20020aa7c787000000b005005627a20bmr4219801eds.1.1680929958020; Fri, 07 Apr
 2023 21:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <87edp3loai.fsf@all.your.base.are.belong.to.us>
 <878rfblkee.fsf@all.your.base.are.belong.to.us> <2173635.1BCLMh4Saa@diego>
 <874jpzla20.fsf@all.your.base.are.belong.to.us> <CAJF2gTRuqtxiNMwH9T3gvHMSJ1EBAEtOXNvFoCufjJrQgqk6Dw@mail.gmail.com>
 <e9f4594e-78a0-fd1c-c0ad-845bf78fda48@microchip.com>
In-Reply-To: <e9f4594e-78a0-fd1c-c0ad-845bf78fda48@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Apr 2023 00:59:06 -0400
X-Gmail-Original-Message-ID: <CAJF2gTQx-X_n=3q9F-+gFT6qOEAkMXXMwk=+OyDKMBMyLxxOvQ@mail.gmail.com>
Message-ID: <CAJF2gTQx-X_n=3q9F-+gFT6qOEAkMXXMwk=+OyDKMBMyLxxOvQ@mail.gmail.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
To: Conor.Dooley@microchip.com
Cc: bjorn@kernel.org, heiko@sntech.de, conor@kernel.org, palmer@rivosinc.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com, bjorn@rivosinc.com, 
	zouyipeng@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_215921_168311_9BE5B559 
X-CRM114-Status: GOOD (  10.56  )
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

T24gRnJpLCBBcHIgNywgMjAyMyBhdCA1OjE44oCvQU0gPENvbm9yLkRvb2xleUBtaWNyb2NoaXAu
Y29tPiB3cm90ZToKPgo+IE9uIDA3LzA0LzIwMjMgMTA6MTMsIEd1byBSZW4gd3JvdGU6Cj4gPj4g
T24gU3VuLCBBcHIgMiwgMjAyMyBhdCAyOjQx4oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiA+PiBDb29sLCBhbmQgdGhhbmtzIGZvciB0ZXN0aW5nL3Zlcmlm
eWluZyEgSSdsbCBjb29rIGEgcHJvcGVyIHBhdGNoIG9uCj4gPj4gTW9uZGF5Lgo+Cj4gPiBKdXN0
IHBpbmcgZ2VudGx5IDopIEhhdmUgeW91IGRvbmUgaXQ/Cj4KPiBZdXAsIGhlIGRpZCEKPgo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIz
MDQwMzA2NTIwNy4xMDcwOTc0LTEtYmpvcm5Aa2VybmVsLm9yZy8KPgpHcmVhdCwgdGh4LgoKCi0t
IApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
