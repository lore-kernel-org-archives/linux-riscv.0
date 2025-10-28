Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458A9CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRRo9TNjVnOe4k7c1imhAtV4h7TORs/T4UuyfilsrXY=; b=LoC0npPuiTmbd7
	yHQr3h6NIC4hWgEsdMHbljJBLk2cHAm26LUYho20OAYw2vaa+GYGqBikh5JECPQMeq4P41tHAmcAY
	jhfJz83MKJpm68g/AAVAquENJR+SJMOnRi8yYnRv2YLePBB/xyvlPSal6NwBR+ozWNwjA4tdPDZy3
	xPkvLep5F1GgF+dG0+NKwJjHqxJW5svEof4711EU141e0GWM6qRBKCNcqSDqSV9BolZt0xT+Wr0t3
	PF3ZdS3EVsWkyM8Q3zrhiN7r1xC7Qr/7JpcPAZns1vrbgVDCRuWX1xrmV+AVvfrsFwXIQPEEwDSnE
	4qCPm7nSUVHkMNxfkaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsFO-0000000GkVw-1mMN;
	Tue, 28 Oct 2025 22:32:58 +0000
Received: from mx-out1.startmail.com ([2a02:22a0:bbb6:1d00::1001:2525])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsFL-0000000GkVG-3aqC
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1761690773;
	bh=ovS3F4Ji8YIzTXUX3iGcqGh38VGc/zziXtLpzHf6TiE=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=RsrNvQPrL+hBoTA6C+XNlXTAxw+GaoY9JCiSMj/KjG7Qiq7MZmjhDZhbXMZNy76BQ
	 wl3La5/8iDB2+9GqE2QOWt7wAleWti9tUVD/2LelRPgzmREwKtF7FE7p3QLh+xUtDV
	 cOFgkD9GKWHJx1m41az/TXYKTPjVcTcCP8o3POc3efyieUx/QWYAU3UuMl95e4gORS
	 pUsYTye0cK56+pJ5HhFt3Y9NFO4Fww2WRMvfwuzQWxkcEU/3efm1M7yrc8Kjqu5TUH
	 pIgcrgUy2nefisESGS+OwH+CKmWJpXXkiLSGlVKeduBI+UoiI9/VqUovunINDRTerz
	 4NzvUzDHWq2eA==
Date: Tue, 28 Oct 2025 22:32:50 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] rust: pwm: Add module_pwm_platform_driver! macro
Message-ID: <aQFEkm532VZo_QIM@archiso>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122317eucas1p1e7c925502a83dd3324478c0209de08c3@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-2-25a532d31998@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-pwm_fixes-v1-2-25a532d31998@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153256_032239_0C8FCE21 
X-CRM114-Status: UNSURE (   4.09  )
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

On Tue, Oct 28, 2025 at 01:22:33PM +0100, Michal Wilczynski wrote:
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
