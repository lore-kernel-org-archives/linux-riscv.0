Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7065CF532DD
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWx9qDYbjYkoV20WDCzkaJf6u4awcHQHiMRrg+XoWOw=; b=czzbxInJiI4q8o
	cE5OID5XNyOw70rWJ0PWt7f+9G2dvigoKEKuyPFbLxzhs4G5jq4ZFdriiniPija7ddA4oSZAZdCoZ
	7syGThqkpo5ogDzLaxaWWl0t/xi9XIOMa/xoYiqqIrZAGL4Pu8JYJogRhKRabtymr5x35zoyEx/gY
	fVghOQbsWIJNGAG7Vx//4shgJcakFPWB3IOGP66Xhtx/5uuGuUVPelLKeFc1bAnN0dIy/w9vf//a7
	0rQj3KEWZE3UYpMa5nmmdSlLkgIBPgdMmHEYmllLwfNyKvgVAdAsusMqv6Z/ACqWGoJlYs/B3JkFQ
	iH196VqVZhJthHVq4new==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvk-00000000dbc-2wop;
	Tue, 24 Mar 2026 06:07:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uve-00000000dRQ-3Thn
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9684B60132;
	Tue, 24 Mar 2026 06:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C37C19424;
	Tue, 24 Mar 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332470;
	bh=Y4QMrZV4zVS/5aSDdfNfhdu9cZMEiIqeRxLv1R4adrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ro/3ARx1DnKEPiQSha/t39M4WDVDC+lnHyDefwbPFBt3WF4OIG0KNwx+qRu9Ici3C
	 Vgh6wCYUjAfEL1ArOxivtsYyD9cj1Y880h/ZZesN4vNhY+je4tuDxmZsWExzuY0h6E
	 2uAeFKaIN+fBbaxqIg1sHlmlvZb4likMx3PQky0JOw3cwqa6DjWab7JP57TEVv9f+j
	 mkHK7+086lY8lw83TpsnmilHXH1B1yOdCT9vE/ms54D0mZaG2qyohvlH06bCnUgV29
	 iT+BDPOR8J6fKNsPPbTleXXPWSakrur201PwC2JgQARAX9JYkZfWWshyyNV2GIbhbi
	 WbxsmKqfZGKZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F913808200;
	Tue, 24 Mar 2026 06:07:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] perf vendor events riscv: Add CVA6 JSON file
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245828.469836.18293790832033550028.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:38 +0000
References: <20251204163854.10318-1-manuel.hernandez@openchip.com>
In-Reply-To: <20251204163854.10318-1-manuel.hernandez@openchip.com>
To: =?utf-8?q?Manuel_Hern=C3=A1ndez_=7C_OPENCHIP_=3Cmanuel=2Ehernandez=40openchi?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?p=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, irogers@google.com, acme@kernel.org,
 acme@redhat.com, adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, aou@eecs.berkeley.edu,
 eric.lin@sifive.com, inochiama@gmail.com, jolsa@kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mark.rutland@arm.com, mingo@redhat.com, namhyung@kernel.org,
 palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
 samuel.holland@sifive.com
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUByZWRoYXQuY29tPjoKCk9uIFRo
dSwgNCBEZWMgMjAyNSAxNjo0MDozOCArMDAwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogTWFudWVsIEhl
cm7DoW5kZXogTcOpbmRleiA8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hpcC5jb20+Cj4gCj4gVGhp
cyBwYXRjaCBhZGQgdGhlIENWQTYgSlNPTiBmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hbnVl
bCBIZXJuw6FuZGV6IE3DqW5kZXogPG1hbnVlbC5oZXJuYW5kZXpAb3BlbmNoaXAuY29tPgo+IC0t
LQo+IEhpIElhbiwgdGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjJdIHBlcmYgdmVuZG9yIGV2ZW50cyByaXNjdjog
QWRkIENWQTYgSlNPTiBmaWxlCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvMjQw
MTU2YjI1YTM5CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3Qs
IEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90
Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
