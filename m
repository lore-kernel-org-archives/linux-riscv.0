Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF08CEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EiNGXVqlCaMEUv7OvFbaUyh9/stKJt930Fp1uIhdTas=; b=ZBWvOBd2R7jDvF
	MJ6VLQHk+xgIDpLhlds4MGDgaiQJm52bR7PwjgQFHkVZVjorOKx0Di/NvsjqV4jWyeBlWAsXzsGoV
	H9LZSYYesND73bWGiWYjv3nBsZGpev6g9bXF+IVHDOqkKMsK7c2ySSGZoi9ojroScMpiTEbJ7J1RA
	HD1po2jGAs49H0gumqxkMLCpO0NbvBY7jdUEvPo2b4a177mOqxDaE2+Og6KWeRX2tqbPMrsYyPQxs
	WD0IUvIeSUP4BGE4lnNStLUtdt1D0rRUtOneGoLkiygnycjcks2EaejaNFaYLI2Rc+5BjQcRqj96b
	3P3IWhMnxWOvZu642OpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQN-001WMT-2G;
	Thu, 29 Jun 2023 16:23:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQL-001WM3-1O
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 16:23:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0CD861500;
	Thu, 29 Jun 2023 16:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4D1C433C9;
	Thu, 29 Jun 2023 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688055792;
	bh=ovjigv8qptlynrOEsJvCtRFFDOTknNKzUCTNiWi4Fhg=;
	h=From:To:Cc:Subject:Date:From;
	b=tBnEB2TL3BB1Za5i/ByduAiLyL/ZliIq28Qn4IhJXGD/Ez+EW7LDroGAZsfSt29pj
	 ju/1u5PQyOHWfUhqJGMoah0RtfvbOTonrRZmLaR3sSo4mnZGMlB8PLLweNoCHwa2mN
	 dX7MJQR60ASzeLe1ncvYJf9w26a4B+UzmmWd/XGZuCQ7k4fqO1ShEwU9VJfO2S2scg
	 sN5Ip423GVFs3DonU7VwYnGzJjYKYcw8DYZefF1/jD6vmLlX6HlcSLr4RWtW0qFbcD
	 925hPZ12KLkG4qi9bXbgh8IM+9p5Fy61kg8m/SjxcdrGQpD3v2unRwOGNNLRpmubBN
	 AkV0ttTgjsy6g==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 0/2] Two cross-compilation kselftest fixes
Date: Thu, 29 Jun 2023 18:22:58 +0200
Message-Id: <20230629162301.1234157-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_092313_511048_68B77C62 
X-CRM114-Status: UNSURE (   8.00  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKV2hlbiB5b3UncmUgY3Jv
c3MtYnVpbGRpbmcga3NlbGZ0ZXN0LCBpbiB0aGlzIGNhc2UgUklTQy1WOgoKICB8IG1ha2UgQVJD
SD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBPPS90bXAva3NlbGZ0ZXN0
IFwKICB8ICAgSE9TVENDPWdjYyBGT1JNQVQ9IFNLSVBfVEFSR0VUUz0iYXJtNjQgaWE2NCBwb3dl
cnBjIHNwYXJjNjQgeDg2IFwKICB8ICAgc2d4IiAtQyB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cyBn
ZW5fdGFyCgp0aGUgY29tcG9uZW50cyAocGF0aHMpIHRoYXQgZmFpbCB0byBidWlsZCBhcmUgc2tp
cHBlZC4gSW4gdGhpcyBjYXNlLApvcGVuYXQyIGZhaWxlZCBkdWUgdG8gbWlzc2luZyBsaWJyYXJ5
IHN1cHBvcnQsIGFuZCBwcm9jIGR1ZSB0byBhbgp4ODYtNjQgb25seSB0ZXN0LgoKVGhpcyB0aW55
IHNlcmllcyBhZGRyZXNzZXMgdGhlIHByb2JsZW1zIGFib3ZlLgoKCkJqw7ZybgoKQmrDtnJuIFTD
tnBlbCAoMik6CiAgc2VsZnRlc3RzL29wZW5hdDI6IFJ1bi10aW1lIGNoZWNrIGZvciAtZnNhbml0
aXplPXVuZGVmaW5lZAogIHNlbGZ0ZXN0cy9wcm9jOiBEbyBub3QgYnVpbGQgeDg2LTY0IHRlc3Rz
IG9uIG5vbi14ODYtNjQgYnVpbGRzCgogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvb3BlbmF0Mi9N
YWtlZmlsZSB8IDkgKysrKysrKystCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9wcm9jL01ha2Vm
aWxlICAgIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCgpiYXNlLWNvbW1pdDogM2E4YTY3MGVlZWFhNDBkODdiZDM4YTU4NzQzODk1Mjc0
MTk4MGMxOAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
