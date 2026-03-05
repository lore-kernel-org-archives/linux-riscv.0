Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE29F3D334
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dS+AAc2uKKtx6nx8S2NtBd7OmxNfW1mqlxsCxEzEhA=; b=YMkzoDdjSaztuj
	rtfA8KNGLIAlYvHo9GE+yqpG0pAF4QlH1F3AlzlRYtDYzABr1Xx1KP3smGlCwxpkP+jq4EJxHQKNP
	mwpJBefEVMu6C8X32XWp8Re8QkqLmBplw4upOeduPfpSPVav/6Lwtv8MA9aTuex2XcMecEsOn5rWs
	qOtaW+DJFX5augmUzRRc1uCFNRfoBic9FdXkvhx7Lh8QQG65xO5r4vkiURwNZpnyzNqyKXPpoMAwb
	b3tt6VKsffofMgjeqdpqsz4LwTBU3cPBCkAZbu6iXGJHLW653+kxNQvf22WGP+ijZmzFtKVaj60/Y
	wo/FA22GhQ5HDq8+ZZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyC8r-00000002Fga-2Ilu;
	Thu, 05 Mar 2026 17:05:41 +0000
Received: from mail.bix.bg ([193.105.196.21])
	by bombadil.infradead.org with smtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyC8i-00000002FfP-3qp3
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:05:40 +0000
Received: (qmail 8053 invoked from network); 5 Mar 2026 17:05:05 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 5 Mar 2026 17:05:05 -0000
Message-ID: <9634c8ceb2815d8100e270e5bd80581e32020706.camel@declera.com>
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
From: Yanko Kaneti <yaneti@declera.com>
To: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Yixun Lan <dlan@gentoo.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Mar 2026 19:05:05 +0200
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
	 <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
User-Agent: Evolution 3.59.3 (3.59.3-1.fc45) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_090538_867749_2F13AD90 
X-CRM114-Status: UNSURE (   6.91  )
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

SGVsbG8sCgpPbiBNb24sIDIwMjYtMDEtMTkgYXQgMTA6NDEgKzA4MDAsIFNodXdlaSBXdSB3cm90
ZToKPiBUaGUgdGhlcm1hbCBzZW5zb3Igb24gSzEgc3VwcG9ydHMgbW9uaXRvcmluZyBmaXZlIHRl
bXBlcmF0dXJlIHpvbmVzLgo+IFRoZSBkcml2ZXIgcmVnaXN0ZXJzIHRoZXNlIHNlbnNvcnMgd2l0
aCB0aGUgdGhlcm1hbCBmcmFtZXdvcmsKPiBhbmQgc3VwcG9ydHMgc3RhbmRhcmQgb3BlcmF0aW9u
czoKPiAtIFJlYWRpbmcgdGVtcGVyYXR1cmUgKG1pbGxpZGVncmVlIENlbHNpdXMpCj4gLSBTZXR0
aW5nIGhpZ2gvbG93IHRocmVzaG9sZHMgZm9yIGludGVycnVwdHMKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBTaHV3ZWkgV3UgPHNodXdlaXdvb0AxNjMuY29tPgouLi4KCj4gK2NvbmZpZyBTUEFDRU1JVF9L
MV9UU0VOU09SCj4gKwl0cmlzdGF0ZSAiU3BhY2VtaVQgSzEgdGhlcm1hbCBzZW5zb3IgZHJpdmVy
Igo+ICsJZGVwZW5kcyBvbiBBUkNIX1NQQUNFTUlUIHx8IENPTVBJTEVfVEVTVAoKCnRoaXMgc2hv
dWxkIGFsc2/CoAogICAgICAgICBkZXBlbmRzIG9uIFRIRVJNQUxfT0YKCk5vPwoKCkkgdGVzdGVk
IHRoZSBzZXJpZXMgb24gT3JhbmdlUGkgUlMyIGFuZCBpdCBzZWVtcyB0byB3b3JrCgpyb290QG9w
aXIyczp+IyBzZW5zb3JzCmNsdXN0ZXIxX3RoZXJtYWwtdmlydHVhbC0wCkFkYXB0ZXI6IFZpcnR1
YWwgZGV2aWNlCnRlbXAxOiAgICAgICAgKzUyLjDCsEMgIAoKZ3B1X3RoZXJtYWwtdmlydHVhbC0w
CkFkYXB0ZXI6IFZpcnR1YWwgZGV2aWNlCnRlbXAxOiAgICAgICAgKzUyLjDCsEMgIAoKc29jX3Ro
ZXJtYWwtdmlydHVhbC0wCkFkYXB0ZXI6IFZpcnR1YWwgZGV2aWNlCnRlbXAxOiAgICAgICAgKzUw
LjDCsEMgIAoKY2x1c3RlcjBfdGhlcm1hbC12aXJ0dWFsLTAKQWRhcHRlcjogVmlydHVhbCBkZXZp
Y2UKdGVtcDE6ICAgICAgICArNTMuMMKwQyAgCgpwYWNrYWdlX3RoZXJtYWwtdmlydHVhbC0wCkFk
YXB0ZXI6IFZpcnR1YWwgZGV2aWNlCnRlbXAxOiAgICAgICAgKzUyLjDCsEMgIAoKUmVnYXJkcwpZ
YW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
