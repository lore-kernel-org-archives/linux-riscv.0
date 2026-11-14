Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFDD606A32E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Koa/GxNM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=KyzszYdF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TgfhIzt+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V26ZiUczgKboqQ19qu5HZcWYNffJ5QpkgpRd+qW070c=; b=Koa/GxNMPelk5xSC4ovlV/YTDe
	TwK1bXrwmThkldJFnzMJjU/t8a7gy1voZorxAOyCqK35fIe2nVZffty77hCEMzlAx9P9Jr5mWwNJo
	qkmKmUZ+3+8Xb2wyGUdtfxm/4jbv5bLnMN3xe2lLvhpnaqTHts/2Ji2TZCpAYDgly62wrWcfr8C3H
	QOEHheo28ImTerAzBmyU8e8Vl1YxvmoLhZ2Im0bJlgN30wXJftzXu6ELAVTwdVIP8rOrzzQNXOq3z
	LUF+NVcfzX677IAreHN78syGioIO251LSQYl0tEhzMYLRcamHNjJQYIw8ZbFVjz1EkgVT4BXmdeXX
	mc5XIpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE5M-0000000GA9p-23nx;
	Sat, 14 Nov 2026 13:46:28 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE5I-0000000GA95-0jjH
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:46:26 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D6F13EC017D
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 08:46:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 14 Nov 2026 08:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794663980;
	 x=1794750380; bh=hxhKKH7II1y8GERDF5iah/4uc1VaD2sdq/KeGrQB7zM=; b=
	KyzszYdF00F/c0LxZZ3Y15eS1Z5M9hGilrb6G9zQkelrC99UIPiXh9Y+8waRZmDg
	ks3cdwtIG/m9vuur8eITFNrVRBzX59YkamS2EzUsBqbQpxm6lCNhK/994DwifXcz
	uoTOuMJlHtJWamPUNtnQn3TRYM+yk6c4Dr5+VSO6hQ6UsmHjfePG3AspBBGvYH8T
	XFmcCR5ud8uWGzCJ0NnQpPoQfQ6TL9tlrRrBMu8gU70OAAgEb9cLhuRJao1lhcg5
	ug4a0v7QpXWqfBtusNjGN/dU8+MV3rXmWycWbN6eEJGavcrrGeCpG/BZIhwQibwj
	85DB58xP8mo59ibYq4hFrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794663980; x=
	1794750380; bh=hxhKKH7II1y8GERDF5iah/4uc1VaD2sdq/KeGrQB7zM=; b=T
	gfhIzt+kwtUME3A5jpJ/pnxEE6yi44aKMcGMY9cYEGXaquuwy5VDYGk5OkcaCXK6
	snM5tLj+Ws9t1CKzFet+Yb/Pq9EXgmv3PTTi+sP/nVQgKameVrnFMoD04BI0MYlZ
	G1Hy3Xolwff6RKrFwBCzPCDLZuMjbpEfB04pw47RhcTfuTXohQk92Fea5WjttFTv
	DlnCirVFyRe01aXfWpVJAUBDGBTfXngOOq8QIgTN9GpHnFcFTPPadoBIBYUq8IIH
	AtFlvSmJlhJNvCGU8E213NyNHzmaVcONurl586lUEvVtbEwIFvk9tTZdzbSE2n3A
	mgwQPRtmWLM7epgPSxiRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794663980; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:Wf3YfLtkRj0o4hyp7FQvYS3C5HJLMKzFCEk/8FTx9MOhSUQ
	80dFDb6T/juwgkI27Hnq9Vx+guLLhgOjHro4mpIU6LOy9r6sK84BpKgSzdDlQ524
	AQsqazaIOpMzcT/8NHKaB8i8NGpM0gC22w4bVrHHK1FRUekAF+TgjgD6dWwE1dML
	ncU/3q9fys6KyCZZTgh5QXSFFGNjcnhAMgufaYcVkwmtD+AczDbg2Hba+unm1aC/
	QiESSc7JNJkmDdHTe0RTk8iCLWFMCK6BJrOOk0f4iGrugR+gmeB60uUc9epEpVZp
	KhWZTRQcfxlDAU/cTnTYAQ0aFVGbdh1isB/axxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:snB4EXilH1Gf6GI5LPdyrG0HIWBFLR5A9TIZbIeREqY=:j+eEPBMHstwFyCQ5gSQRfcc2+DkJ95TFBdMoixoDrOs=;
X-ME-Sender: <xms:LGb4au3Qx9YUsVpypEOKJ2aBHeUpkRBLlXy8E42aU4qJUkStwGRMzA>
    <xme:LGb4aivqDS9FcEOkaFHw5JXQU36IxU270ZgXCM1qNcXCMvbAT4jmHuWu2jNlcYiwr
    POkcogoz8jsVJQ9_nkvhoNvhR_Fl6vdAdyO4WxCriBd2hr6xaKoy5Cr>
X-ME-Received: <xmr:LGb4aq87tRmiJ1_gXvFoTwtTlEk6qQngB0lH82WKSG4mQ1LKKoNK9_2Gdjb4440XQcgMXup2ra85k9kSrdwwz68n>
X-ME-Proxy-Cause: dmFkZTGPyd099gFp6IoEh+SqiSCQACv4zvizj1DwHPte5hKiSVJP1TnbPevudWmZd0JrDK
    CLlS8AEAuLK3z+Qa1AJDYWjuRBzbzzZ/QZmHlUgX5lmtCvtDkEJvtBhp+/FLYTf5W1KrPG
    /w3ywMgpPLA/Skddnq+qp43vlsitQt9dd/uiru0XSnI069mVHDuVXZRp33P3x1O3hqq4R3
    2odw9rdPyqcWQQk6/BZEHKXRHOPrV3p1Hg9TxYf27qml3azOJyrSJ2ZMY+5KjZhBCab7OC
    eF9nUNaLHnQ1xpyuN0kJ3UR/Jl5FJxCKGoj1vhXsGIK+v/b/DKbEZH/AwrWSeISaUeN7WX
    VMUZdUfY9AYg++q7hsHGO2vDyTVvqjDFR/ynYjP70kW2SD4lpfQ5BPTKLYaTTKDhUAXaUZ
    QzLWepMTF6nE3aF8lmjoBZOOSiheU+Sx7dOuKRy+jyF1bIvwtauPjWcD7ECtQ9ZoeLoMh7
    uiuNZUn0rGJH45lWAwe3zTKhCnV1vjatV7mx5YM+DaVGqQ8yHn8ArXUcnNVT9zjE5N/yh5
    amebZ8HocGz9XOHrRdkIe53LMjX38CQd96uFiQzF1IoCKRSxKwuQ0GyMm/ly5+SmjFw5oH
    NUfN4ffFsnhl7/tV+UHx9f13dpWKWNobdooaCqSxbIAzgx4MiuXHGj0NNcwA
X-ME-Proxy: <xmx:LGb4amRKL1NMjOylVW704EulToRDB5S4gPt06T3Mu1mbFvhYH6jKxw>
    <xmx:LGb4agAhIwKMTed3wsMCRfq4i7rN6vb0qU-5Z8BAKXYPmTrTctFrzQ>
    <xmx:LGb4anYA7OaLb6abg9cH746HGeu0mUpj6au2bjix0ggKpn_FoUSFlg>
    <xmx:LGb4ahJH2nMVrND9HkJ0iwOhLr-DaXjPkOo-hdeNcUXzrzlcK1mPEg>
    <xmx:LGb4asy8VY94PhwJz1CEzUeMKD-6_80kNHtkbWnxHGjoYK_z44eNttjw>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 08:46:14 -0500 (EST)
Date: Sat, 14 Nov 2026 22:46:12 +0900 (JST)
Message-Id: <20261114.224612.1895277862836640234.tomo@flapping.org>
To: ukleinek@kernel.org
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org,
 wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org,
 m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3 0/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261030020209.3833766-1-tomo@flapping.org>
References: <20261030020209.3833766-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_054624_303297_3087BEE2 
X-CRM114-Status: GOOD (  19.64  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Uwe,

On Fri, 30 Oct 2026 11:02:07 +0900
FUJITA Tomonori <tomo@flapping.org> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This series fixes the 32-bit build of the TH1520 PWM driver with
> COMPILE_TEST. v2 limited COMPILE_TEST to 64BIT. Uwe asked to use the
> div helpers instead, so v3 does that.
> 
> Patch 1 adds a math module to the kernel crate with Rust versions of
> div64_u64() and DIV64_U64_ROUND_UP(). Patch 2 uses them in the driver.
> 
> The driver only needs u64 by u64 division. It does not need a 128-bit
> intermediate value like mul_u64_u64_div_u64().
> 
> Uwe, are you OK with this series going through the Rust tree?
> 
> chenhan's series [1] also adds rust/kernel/math.rs, with signed
> division helpers. Both series use the same module header, so whichever
> is applied later needs only a small rebase.
> 
> Tested with the doctests on x86_64 and 32-bit ARM QEMU.
> 
> [1] https://lore.kernel.org/rust-for-linux/20261023130413.178487-1-chenhan0017.work@gmail.com/
> 
> v3:
> - Use div helpers instead of limiting COMPILE_TEST to 64BIT (Uwe)
> - Add a math module with div64_u64() and div64_u64_round_up()
> - Drop Cc: stable and the Reviewed-by tags, since the change is different
> v2: https://lore.kernel.org/rust-for-linux/20260930101257.1649945-1-tomo@flapping.org/
> - Fix a typo in the commit message
> - Add Cc: stable, Reported-by and Closes tags
> - Add Reviewed-by tags from Andreas and Gary
> - Rebase on v7.3-rc5
> v1: https://lore.kernel.org/all/20260929095612.1072417-1-tomo@flapping.org/
> 
> FUJITA Tomonori (2):
>   rust: math: add div64_u64() and div64_u64_round_up()
>   pwm: th1520: Fix 32-bit build with COMPILE_TEST
> 
>  drivers/pwm/pwm_th1520.rs |  8 +++--
>  rust/kernel/lib.rs        |  1 +
>  rust/kernel/math.rs       | 71 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+), 2 deletions(-)
>  create mode 100644 rust/kernel/math.rs

Gentle ping.

Could you take a look at patch 2? Are you OK with this series going
through the Rust tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
