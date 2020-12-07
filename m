Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6048CC4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 11:23:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0772310B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 11:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0772310B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FCBIdkQLLD5TPfc83u+LQslWcfCnOhGOjvzPmc64YnM=; b=T/V1dnPT3Ji67AWIjKnYfNNa8
	7N6VJGrx3hbmtsYPpiq+JRyS6r4lTPnsOa/OHXNvLU5Ujig9N4vdwwdwdYG9Nxh5RFyF0BqNdEqd5
	Vn7ErAEO4a2DhFMrjVUSDTWtGLPPOWUL4iInZB2Q88yiJ/Jf4qJ40onGtXQp0ImbK+mmGKsaeVcJX
	Hpa1DR4e5d9y2+NuYOIYem0e6OXj4Tyx/V+FjxfUE6U0Q3R8aI8rY0xo/xE85eoNSRzh22m7t1xRp
	+gJkRzo7GAc0RjHMf8grycONPkbIg/YC6p6TkSfzhp+zsjutF3rzboJE7+hsk441ARfV2VfQO/ywX
	0/TO9CV+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEbg-0008DJ-4N; Mon, 07 Dec 2020 11:23:04 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEbd-0008Cd-EK
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 11:23:02 +0000
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMY9X-1kTKyR0ddv-00JXzz; Mon, 07 Dec 2020 12:22:52 +0100
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201203191135.21576-1-info@metux.net>
 <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <169ead3f-8d6a-5de2-772e-707b7cbab635@metux.net>
Date: Mon, 7 Dec 2020 12:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:ln1Vk8aZ+xYN6SKVVwyXg/icq2rUNG6aQh3VOfQKle0ytH4nyGl
 AuDiIa1NR1CbTBRsRm1LRT8KMgL3tFtW9Sd+dTB7zyjB+BP3wlWe5i7vdCN2/uorFtn7n2x
 +WEAQiCGcEG8YNQDrUbqzJQAzB3/0CfHFk6Sg4QaNVJ2idBfoTvlWDAgcKHlVD5jm6Solmb
 wmb2e+WBXCjyEjVi2rBnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ja1UYl5fJlI=:TnURbpt5+bz13c3bg+gtyg
 QDkV/NyH+je8tGZeHnHcwpToLOhMMMw0bXBq6apc4/rUVNALaCHRSo+VTgD7TWlm8PyM1IByL
 6dZRjL2FX2FVOCqnDwFKbIbBUaAiaq/PnlczOkN3vXSs0EVgo+581eD2uLZOdrz8zG1oejWvr
 sX94szIess39b9Y5QpCzY/5zjSj6h9QOhvKoQjfrk3jW1cRMwojvQnk08ShSkdRq4khvkh6PP
 srsVXie4+zDVG51ML0m8fLyNfV4GbaXKHNX7+KMg7z/0oE4doQ58XiV8qFDD5zH5TH0HI/yWG
 5cSQ2BjAJ5uyvnUcvItsha4f2IiCCeMkiEyBwDBItAfYC5/+izHrh7XIG3FOk+M/mWuMBqQBo
 1pI+60cPNqll7ACVHSVxEh2aVxMVEXBiTiajkIFF8OIyTsOznG1j9om4iFvjP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_062301_708341_D9C8F94B 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-doc <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcuMTIuMjAgMTE6MzEsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cgo+IEknZCBjYWxs
IHRoaXMgc2VjdGlvbiAiVmlydHVhbCBHUElPIGRyaXZlcnMiIGJlY2F1c2UgdGhlIGNvZGUgY29u
dGFpbnMKPiBkcml2ZXJzIG5vdCBkZXZpY2VzLgoKZml4ZWQgaW4gdjIuCgoKLS1tdHgKCi0tIAot
LS0KSGlud2VpczogdW52ZXJzY2hsw7xzc2VsdGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdl
aMO2cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29t
bXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4K
LS0tCkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExp
bnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUy
ODcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
