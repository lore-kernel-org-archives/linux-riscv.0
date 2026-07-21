Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C28AC4452F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOKsyk5ka8+7aCg15q8esJVWnUn8osrmUfScQqSOGHo=; b=I1v6POoEjU6r4b
	a1a77KixsE4SFKJq8zHUc/41Wyg5O66dF8xvNcVu8hMjlLtdgIGxJXaQjDQkeyq0KuRBGjKFysTV2
	aIIdAtT35Ep8UIMcDspI1zaIyGDft4hisqXfzUXGszhgCXOa69fbt45kDvdelAc7FeGhduYeS7QPj
	Ono6sjG/NRqCLayxYGvtDU7NL1DB/GcmuCC9oHecqVYUo7U0PzA8VboKkdvJpxM8uqVUKYx40XWC1
	5CPKtiF9JqrNgQQvIevFtyMvV00qIvirvNReervXbq6Ie8DyKms6YaF7hRB8FH3CuH1lSwrV7RHqx
	iny9JdsUjJsLj1irlGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9jA-00000009R1C-0ctJ;
	Tue, 21 Jul 2026 12:37:40 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9j5-00000009Qzx-3uir
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 12:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784637419;
	bh=Q3WVCZdvhuzyHyhwodqX72fDjFGew7fzT/sycGPfkAg=;
	h=Date:Message-Id:Subject:From:To:MIME-Version;
	b=ddw+IOn4Z1IxGNo827TTOcA+zo+Q+to9R0k3LDcjnGaUHh/cDeZIKYgyBCA42Ar4B
	 8sXAufBFF8gOxzFRuFbFHlKcYFtKDrObT/WJjwTMJDaNoeucGmSbTztMG/HF1tJJNd
	 fIRIAdt74fiza5NInm3MyPo7IijxG6dMTQPCXJTc=
X-QQ-mid: zesmtpgz3t1784637417te9d389f1
X-QQ-Originating-IP: njHsgAYR90QJ38EFUoM52TrKnqiRhrriBDg10lgkAhg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:36:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6462590554883498070
EX-QQ-RecipientCnt: 15
Date: Tue, 21 Jul 2026 05:36:54 -0700
Message-Id: <DK495Y6IBTSP.B55YW3KSSPL2@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <sashiko-reviews@lists.linux.dev>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20260717073330.3CC8B1F000E9@smtp.kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
	<20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
	<20260717073330.3CC8B1F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MpO6L0LObisWp8Fdvp153dHVOrxO43BDAzAf9lw1P+hBYQqaPgGyMW+g
	d9SVm2T1W61ScaEhgVHZ2aTvUoEh1A94cVJDBpQWNH1vaPN1xfv7cojiipphv4evFgV9KBk
	IzOrIlSaDxKoCfq0jkn5WdkL9t5ihEuuLdu23Gs/AgQepOPBz8TtMXKGpUXUMaEg/o0MXYj
	b+WkaIOXtcCvNQaBBkcOFoJpmZ6pXYXttzVq6aImQEHAXNVCKHU2GHyJVKxzDf09smXjQ+Y
	UnTEtghmk2Z18uJyukHXzM6MWFe0UuY9ZZkhXHFHIoss5PjBRTj093vTQzreH1lk5rh9dBJ
	2OmhnYgE4nlZbB6Kgm6h11TLdg8gYGV6w+hIYcTXKn/Q0Oj3X1kDHaOaH+QIcvYB6FkNvBB
	gsAQlN8AN4KP6+qnCLE5PtnUNGPFYUgwMUnEx8RT12j7/XAfS5/mU08fDKQnoD9I31UwxdE
	csYA2dwR9pdXvDT75soVS4jZfv4mW5Fz/Fs39kg7Ss6j+jNDFZuY2l3EwjFy3dw5lbLMfO8
	3/j62SWkeAeJlYcV9cMaJOuetEGDy6i5JgtXiXCLpD9pZ22uiFTpWwdft248fWWoQ+tiW3j
	dO/qtorJvLyDr7XuSOXoz7jM5siUiJUWPEJtSg0/pr8mCw/IdYrjrVhiNFekhV+18wVOR2v
	2+aQWUKhH+ZMeLsBkxhBHdMUGNcDtws41m8e6Za3y5u8lR9HLY4RLCVfCsn97nkXWq5tbKW
	KtgtJTuQgD+IvGmb3i/9bfqnuHYzm4QKZxBz/YRKGEtlXRcWKlBCX1d7E1IEWmz4N6V1kKb
	veiqGotT4qh2vVcwWxC40N4EF1NRfwRMU+xPOHPMQt5D9IIAQWypfOD8EKfnF6f5mPclKra
	33v27ajhFXCUNpUFu/fDGxtarPQfoI1YdaEo8nsulpoH03pufc/MHx/Y2qISlihqroXq19N
	iQlct0ZBNFN0i3qS3JG8SfeAuY/IhnWm7gEuZ2I+hE1PTeFgMFAtniKhusZiePF5uY0wGZs
	frjQ4R1M3v1Z/u0/gFc26e9ZOnN/JPWTGneCcT9N21kfjCq5JQe/HzsVXZ6TY=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_053737_495740_A6395FB9 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
> the real per-instance i2s1 clock in a subsequent patch. No in-tree user
> references this ID so the semantic change is contained.
>
> [Severity: Medium]
> Does the commit message reference the correct clock ID here?
>
> Looking at include/dt-bindings/clock/spacemit,k3-clocks.h, 47 is actually
> assigned to a different clock:
>
> #define CLK_MPMU_I2S1_SYSCLK     34
> ...
> #define CLK_MPMU_I2S2_SYSCLK     47
>
> Could the commit message be updated to reflect the accurate existing ID for
> CLK_MPMU_I2S1_SYSCLK?

Good catch. CLK_MPMU_I2S1_SYSCLK has ID 34, while ID 47 belongs to
CLK_MPMU_I2S2_SYSCLK. I will correct the commit message in the next
version.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
