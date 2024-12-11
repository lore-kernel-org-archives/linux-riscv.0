Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33E5E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtIPqvPdAV14hsFJ5b4kkHAmMhPv/HAbKNMjFVh3Pm8=; b=agSWdHvsHMNkko
	vMnIKk6lDwzLKryoTJ+6TW4PcmLI6jGKaOTsQARyq6K3PR//uWqId83cMwjH09K+n2QMxIZBmp9fA
	WSBB1xqAF2RLg4Bl2GkqIBXYRkNXjOFepA7L2dA7hvVx+jULlSwO8mjsBNVZLCR3qn30dTXNcW/93
	r0RmbmEKtMjxbHv34QR2HjoaDhdOEJP468ZhqwfRIGRPxVHTUWZ97yiofxkjrTgANiR3IlOWMvg18
	UBJgWgzI4jbSUjzMjpbueauXCwizQUuhWFx/ZyOFi1DWWZMb4BD98IldeJm66+O4R0RPGQpvT/sTe
	e7vjLUqtP88Tg6oyT0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOn-0000000GX23-2VLI;
	Wed, 11 Dec 2024 23:45:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGU-0000000GKxi-1oz6
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FF475C5F7B;
	Wed, 11 Dec 2024 22:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CB6C4CED2;
	Wed, 11 Dec 2024 22:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956385;
	bh=BQx5g38MiMqbRkVexhZZjvYaNed5OXR/zfHMkJHDPQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=inlR6bAm7WQYJIQEmpSkRhblsgJZHnayLs4YjKOF+R1EchCBO/2+6ACaOBekxCOke
	 LAAZmH5uSnKupJdGy/u9N17XWtnr7hvZroeu7sbD83rh7qy3rEKoDQRdDGG0/Agfmq
	 6PMrzuEXRAjB5pSRZFc/oKSIL+1IbsLpMhwByfWt3h4KjoJDYJGBmgGDO64c2dsLqb
	 v4fPf7RVPXRcb+Oz0GH5sAh+uiT9oT6swGnR1DKOPLILa0m2uoDikkwbEiNc8LTSLB
	 LKWX4SR9SL1sW74acq+eCy0QZLomZN8OEDnHaYDDKbdXbCL/Ycug8vrlbaoXm06gY8
	 tRyC/PdTnFHwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE05380A965;
	Wed, 11 Dec 2024 22:33:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] perf, riscv: Wire up perf trace support for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395640149.1729195.11467040098314252452.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:21 +0000
References: <20241024190353.46737-1-bjorn@kernel.org>
In-Reply-To: <20241024190353.46737-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 bjorn@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143306_512236_B29100B6 
X-CRM114-Status: UNSURE (   7.10  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IE5hbWh5dW5nIEtpbSA8bmFtaHl1bmdAa2VybmVsLm9yZz46CgpPbiBUaHUsIDI0IE9jdCAy
MDI0IDEyOjAzOjUxIC0wNzAwIHlvdSB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4gCj4gUklTQy1WIGRvZXMgbm90IGN1cnJlbnRseSBzdXBwb3J0IHBl
cmYgdHJhY2UsIHNpbmNlIHRoZSBzeXN0ZW0gY2FsbAo+IHRhYmxlIGlzIG5vdCBnZW5lcmF0ZWQu
Cj4gCj4gUGVyZm9ybSB0aGUgY29weS9wYXN0ZSBleGVyY2lzZSwgd2lyaW5nIHVwIFJJU0MtViBz
eXN0ZW0gY2FsbCB0YWJsZQo+IGdlbmVyYXRpb24uCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1
bW1hcnkgd2l0aCBsaW5rczoKICAtIHBlcmYsIHJpc2N2OiBXaXJlIHVwIHBlcmYgdHJhY2Ugc3Vw
cG9ydCBmb3IgUklTQy1WCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvOGMwZDEy
MDJiYWQzCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkg
YW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0
bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
