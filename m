Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043CEE67A91
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7Jc2c5hvls4zxLN+mtMAeXQB68yLMj287W9Q8Dihug=; b=lLe+wzmLPU6d/e
	tCL1ZpQsHAZ1Ea1QQaR8wD2nzt0dATRqDK0yyJeeh3bNn+cj7iGSileC9GlLn+Oe+Ltm7crEayfDs
	TG/fwdTanaQSgneA20ZHvu9prsmLPnqz4f8miNIUuhXa9lWOLUEtGbywMySlHQFT/YS8/mO58AwHy
	emjQDdMB5uMa1btCEasK5hQflRtvhKuHekjb7KScQ9Qpv2b1WFrcVYSgGXOLIcSBzsv/Q3jy2BbcP
	3HMfiTcB1m5KeJWTIMzX+isF+4Kep4sFIH37cMpL6ZOqY2xf0o7Q9RmniHFB6sm2bneplz0YTdsVn
	ckex+EF3J2qr2FpUnRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKug-0000000ElXw-0FrZ;
	Tue, 03 Mar 2026 08:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKud-0000000ElX1-2n5E
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 08:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 109A9419A0
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 08:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5477C116C6
	for <linux-riscv@lists.infradead.org>; Tue,  3 Mar 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772525726;
	bh=9wxhZFyadDWhgu+mqTQiylyLBH3aaNALj+RSiOFtSE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h0mBJ8ciy9eXVsiCXzNcr/6WWC3N9ju2gTysfhAVtJew7mJ7ZOl+slQyoZAaFZTtn
	 ktm9O5P6daBJqbmiVa/6Tnvi3Z4WP9KRMg7HGrJk7wwEePoHUy5tPpNKkcyo5YxJUn
	 0CbKdm+qKy01a+1pFOrPnjUeNPtgy3F8KjeidYQ4Rwg3RV/n0VbN67m9ifS8nudmg8
	 P7MkURPGw7odt2c4cfvL9YyVqRRfzGc1efc6R4UbfQjpExudaMPIB9T/bMcg3RigUB
	 c5KNSJYqSP2AA7spwAAeKGLtWeVzGjruxKStjDkQmDHP+MQ4w9vVeTQCpsAg2/hS/M
	 snUewqmrxKVMA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ae222d978so5010717d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 00:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUMNK7AEz/jwy6M3nb75nQffY1OVycY7qo8qXtl0SgTqrGlDfWLVzCiu2uAQUIJXmcoYJ1lM8iXz1ysQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+8CHzwBjjcGEW/hMfjc7EJ9UYhiXgSGEqlNj6oGUeAAwFuv+
	C4jkZWZxuBmOERkaqyKEHZFV0LVE0H4QkY3C0b+qtO4v3sSK9a8el3ftGcPki6Z12NR/Jsskanr
	/JIELdqJGCBywkHTmi+nDOPm6T8Aaw1M=
X-Received: by 2002:a05:690e:e8b:b0:64c:ed24:13da with SMTP id
 956f58d0204a3-64ced2418bcmr1143119d50.57.1772525726251; Tue, 03 Mar 2026
 00:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20260213-stole-economist-d5b0ac711d42@spud>
In-Reply-To: <20260213-stole-economist-d5b0ac711d42@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 09:15:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
X-Gm-Features: AaiRm52G_V9-_ujFenWeUWpFlzIbDTP9l4vvm7MAbjZjHcSBGU3uCwJQd8F52m4
Message-ID: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_001527_722234_F2D5C4B7 
X-CRM114-Status: UNSURE (   7.97  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEZlYiAxMywgMjAyNiBhdCAxOjIw4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKCj4gQ29ub3IgRG9vbGV5ICgxKToKPiAgICAgICBy
aXNjdjogZHRzOiBtaWNyb2NoaXA6IGFkZCBjYW4gcmVzZXRzIHRvIG1wZnMKPgo+IEZlbGl4IEd1
ICgyKToKPiAgICAgICBjYWNoZTogc3RhcmZpdmU6IGZpeCBkZXZpY2Ugbm9kZSBsZWFrIGluIHN0
YXJsaW5rX2NhY2hlX2luaXQoKQo+ICAgICAgIGNhY2hlOiBheDQ1bXA6IEZpeCBkZXZpY2Ugbm9k
ZSByZWZlcmVuY2UgbGVhayBpbiBheDQ1bXBfY2FjaGVfaW5pdCgpCj4KPiBaaWxpbiBHdWFuICgx
KToKPiAgICAgICBzb2M6IG1pY3JvY2hpcDogbXBmczogRml4IG1lbW9yeSBsZWFrIGluIG1wZnNf
c3lzX2NvbnRyb2xsZXJfcHJvYmUoKQoKWW91IGhhdmUgRFRTIGZpeGVzIG1peGVkIHVwIHdpdGgg
Y2FjaGUvU29DIGZpeGVzLCB0aGlzIGlzCmEgYml0IHVub3J0aG9kb3gsIGlzIHRoZXJlIHNvbWUg
aGFyZCBkZXBlbmRlbmN5IG9yIGNhbiB5b3Ugc2VuZAp0aGUgRFRTIGZpeCBzZXBhcmF0ZWx5PwoK
SSBndWVzcyB3ZSBjb3VsZCBhbHNvIHNwbGl0IGl0IG9mZiBtYW51YWxseSAuLi4gSSdtIGp1c3Qg
YSBiaXQgaW5zZWN1cmUKd2l0aCB0aGF0LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
