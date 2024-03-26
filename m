Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C0AC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 19:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPZc7ZcIzCoDeqjAfi1bJ2vYTOdrQlC3ce1S9FYg6lM=; b=ZA77LgJqbcqG0w
	26qh/upwq7bhVUls2nmWEko60citskUcoZiIxh8Q7+dWzkRqrhA3L2kdLFaYjo1N6pUr8olRFO1Fi
	PKuLVOPmF8mTQ8qadGfXZzocmim5L1wXL9Yhsduvb6U3xX4oqlpvIpmUpPxAjemZa6KzFb+Ej/Mjn
	V4oF1xuCBi671RKasRKkCzbf5clyeiJbX3PPQT57om7Ux7sW12oEOag5ar4gE8HyvG07cdrpZM5FS
	ugou+MAgTz1KSoPWEhDYFI868qIbpnTXI/pXWxiLhi9m/jv8qmxRhqOM8r1RmA1a7hOYoXLMxmjN6
	2SOBDDe6JoH3Y/yO8LVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCuS-00000006E4C-1TFQ;
	Tue, 26 Mar 2024 19:56:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCuO-00000006Dzf-29EG
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 19:56:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E89B340002;
	Tue, 26 Mar 2024 19:56:24 +0000 (UTC)
Message-ID: <485d2bc5-37f5-42a7-a3f8-bd53641c0d83@ghiti.fr>
Date: Tue, 26 Mar 2024 20:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?Q?Daniel_D=C3=ADaz?= <daniel.diaz@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20240326153712.1839482-2-samitolvanen@google.com>
 <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
 <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_125632_929386_2B357459 
X-CRM114-Status: UNSURE (   7.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjYvMDMvMjAyNCAxOTo1NSwgU2FtaSBUb2x2YW5lbiB3cm90ZToKPiBPbiBUdWUsIE1hciAy
NiwgMjAyNCBhdCA2OjQz4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90
ZToKPj4gRG8geW91IGhhdmUgdGhlIGxpbmsgb2YgdGhlIHJlcG9ydD8gU28gd2UgY2FuIGFkZCBh
IENsb3NlcyB0YWcuCj4gU3VyZSwgdGhpcyB3YXMgcmVwb3J0ZWQgaGVyZToKPgo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvNTZkMzI4NWEtZWQyMi00NGJkLThjMjItY2U1MWFkMTU5YTgx
QGxpbmFyby5vcmcvCgoKRm9yIGI0OgoKQ2xvc2VzOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC81NmQzMjg1YS1lZDIyLTQ0YmQtOGMyMi1jZTUxYWQxNTlhODFAbGluYXJvLm9yZy8KCkkg
d2FzIGV4cGVjdGluZyB0aGUgImRpcmVjdCIgbGtmdCBsaW5rIHRob3VnaCwgQERhbmllbCBkbyB5
b3UgaGF2ZSBhbnk/CgpUaGFua3MsCgpBbGV4CgoKPgo+IFNhbWkKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
