Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5006FEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfZFCN4UEiecEKW2XOFukKFOaV+tuJnRAMKAMdTyEnA=; b=NqbnUAt/rJjVjH
	EGzlowiMLE39Q3b3sXCId6x/80mhJa2TsDh4ejY+6Gy6AX0kXSDmMCM/BD+1l41WFCZ5Xh7gn3yra
	PJ1E9UL8lzBAVoiTBkdOeDH1dh4PplQoN7hKQbm1OlzKT0blXtKk/x6ljZcM4huQeFGhfHpRkcktk
	mwlDav0vn12ZAgHxuufIxp69qEsbmX2vJhJJOIvFK6Bal6IQf73LE4qBuEdxwY/XF9PiRzRdlb6jH
	bpIpYatXC4mlXhRWSWqWTMDW/YzDygi9zQPY+9BrtpbkeOZWkVEKMJrTpd1m4b0hYs4MnqEG1oFMw
	Yn53oxzZDAIXdkqkVpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBM1-003Mly-2x;
	Fri, 30 Jun 2023 10:27:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFBLz-003MlM-0F
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 10:27:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60E2F6167E;
	Fri, 30 Jun 2023 10:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DCEC433C0;
	Fri, 30 Jun 2023 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688120867;
	bh=fqgWG9xEz9LQRlu2zsrFniOCeXMiZg/S9PLfSW2fGh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gK9Sul1y7wSUOD//OnFlTmuL1Z12y07fplacQhMdrwiwnwCMIxcu2bNI2szihZ9Ni
	 cXghbtAgxsYhVRwvGAhzCt4Hnf933TTtEI0Xn1vFmnrigwoP+HQzrJ3E1lZufSmY2j
	 3aZBmvhyZzCmCH7Ynw8BkMs+AYcyR5fMov0l6Smh4vhZcjnDmAk8bjtapJ4rMv2hrg
	 zj6PGIR02SNSGhAAK+8Hn84AYsJ3HPevOF761Q/OHOmnrC4xQEHVpG896laIGsneJu
	 EMXyKzsfXz4jxlcGynInxZWO2HLGSt+T6fIeUtM4IIqXf7ed8R3560m7h0s39KwTnB
	 8nQX/CfnmoBvw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Anders
 Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 2/2] selftests/proc: Do not build x86-64 tests on
 non-x86-64 builds
In-Reply-To: <fd61fd96-f06f-4a2d-8707-0e1e395c9e51@p183>
References: <20230629162301.1234157-1-bjorn@kernel.org>
 <20230629162301.1234157-3-bjorn@kernel.org>
 <fd61fd96-f06f-4a2d-8707-0e1e395c9e51@p183>
Date: Fri, 30 Jun 2023 12:27:44 +0200
Message-ID: <871qhttfbz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_032751_174852_55AF5B2E 
X-CRM114-Status: UNSURE (   5.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxleGV5IERvYnJpeWFuIDxhZG9icml5YW5AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIFRodSwg
SnVuIDI5LCAyMDIzIGF0IDA2OjIzOjAwUE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+
IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IFRoZSBwcm9j
LWVtcHR5LXZtIHRlc3QgaXMgeDg2LTY0IG9ubHkuIFJlbW92ZSB0aGF0IHRlc3QgZnJvbQo+PiBu
b24teDg2LTY0IGJ1aWxkcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPgo+IFdoYXQncyB0aGUgYWRkcmVzcyBzcGFjZSBzaXplIG9uIHJp
c2Mtdj8KCkRpZmZlcmVudCBzaXplcyBhcmUgc3VwcG9ydGVkLCAzOWIsIDQ4YiwgYW5kIDU3YjoK
RG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0CgpEaWQgeW91IGhhdmUgYW55dGhpbmcg
cGFydGljdWxhciBpbiBtaW5kPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
