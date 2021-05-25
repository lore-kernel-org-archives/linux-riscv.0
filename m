Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B012C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 13:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF0C6141C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 13:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF0C6141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELHri5X9KI157fByEoNT02f8MopC0XaBmgHEo2hpwpw=; b=b2pZmtWFZIjyjH+6Ne4ZQexvP4
	CZeQXGr0ncioGhMRXULJ0/HSSv+8cltEbz2Bh0itqLsncLHYqO78Iy520ZCC6fL06KoykBlYm+i3u
	nRvI4MI0ZIrgwkh5ajhgUsMx7urV9zd5wtMA7gVP0hfgvDctWxtEGKmdxtfcgUSd8pk/bhmoUiqJM
	MTp+LzgMk96RoWHNSXFCo79guJUtiiJ7R/pA+mvIwE1cF8DBb6sfQ8Osz3VQQ7fYK6CsVRhzHY46r
	H0IgTq7ogeEJ5fh+klAXCeD3Kc0CmL1KDKdhV0vqgJBj5zVOTmKqVP7Wd0XMck7SF53FhWHhWAoe+
	lpDTrK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llWfI-005BZz-N1; Tue, 25 May 2021 13:00:08 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llWfF-005BXb-Rm
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 13:00:07 +0000
Received: from [192.168.1.155] ([77.2.164.130]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Md6V3-1lD1Bp2l7b-00aGKe; Tue, 25 May 2021 14:59:54 +0200
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 bgolaszewski@baylibre.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Linux Documentation <linux-doc@vger.kernel.org>, linux-gpio@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
Date: Tue, 25 May 2021 14:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:P+C+8jE7h8AIU2+P4QAc0bNMwt+Y7MdaM1X7ydHqfxe9je0tPYy
 be3w5uTCFWkLcxmoBlru5+W4Tk2mr/voJuWycO84rHSYafupt3Uq1xWjFMNW3F03qmqIeo3
 cTkcoPXdGz06y+TYfDTAeOgojJpIJezE0d1fhIopLlIyWOsuvtrqhqZJNb5hcmgo5hMAS2V
 S2cQMbRYoxbMBNMEpWoFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RbO7NUknbTY=:HjhTGnKuau+6zb9Ta6G1Yh
 VzrJdmQ911+bCR6R5e9wvAcOFl/7wBWYHrYhRqtFvRVTd83T+WlNL0DWFZAEPaSEU2ttLc2FK
 9/cmPPiOBLP6XfSEBMusNIoq+ZDrmgZTI7hxa0TZmkq4k1Xngkr6fCsy7WF25OeETPCaR1mBQ
 K6VZKRIfQfvIBwF/v1jTPvIjPvYEMu+rIk1AhegdZibK/mnIiDyrVQWQ4yiMFEGK13bHBEoxf
 SKmxkahtwNrpOP+R9KtOmG+DY6saa01i9Bfy6/8VTX4cV6mZCtuito1iNurgHq76etXrvUnTe
 CTxBDc6tGp61htLU6taesJY6WUUZMC+R3jOvsPgY/VnzYxLxShmRAMH7jg3arQ0w00/GQQ8aE
 haTTOXh3rQC7a5R7OjC/Y83HbrVdJqRQiRXllD3Jgr1EYKyc/o1DkpT+4eYUMMRfB+BfB7XJ7
 2MWr61dYb2hBdvERcNIBllN4rrEzRtrxHZIzouhQ0NJ5sEvmhkmh892Iz81zBjgnawxLsrjjn
 E1gqPSNvOPVPkxwZXrp8HU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_060006_231164_68201360 
X-CRM114-Status: GOOD (  13.27  )
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

T24gMjQuMDUuMjEgMTM6MjcsIFZpcmVzaCBLdW1hciB3cm90ZToKCkhpLAoKCj4gV2UgKExpbmFy
bydzIFByb2plY3QgU3RyYXRvcwo+IGh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lraS9z
cGFjZXMvU1RSL292ZXJ2aWV3KQo+ICAgYXJlIGludGVyZXN0ZWQgaW4gdGhpcyBzdHVmZi4gSSB3
YXMgdHJ5aW5nIHRvIGxvb2sgYXQgdGhlIGxhc3Qgc3RhdHVzCj4gb2YgYWxsIHRoaXMuIEZldwo+
IHF1ZXN0aW9ucyBmb3IgeW91Ogo+IAo+IC0gV2FzIHRoZSBzcGVjIGV2ZXIgcG9zdGVkIHRvIHZp
cnRpby1kZXYgbGlzdCA/IEkgdGhvdWdodCB0aGF0J3MgdGhlCj4gdmVyeSBmaXJzdCBzdGVwIGJl
Zm9yZQo+IHdlIG1lcmdlIHRoZSBjb2RlLgoKSSBoYWQgcG9zdGVkIHNvbWUgc3BlYyBxdWl0ZSBz
b21lIHRpbWUgYWdvLCBidXQgaXQgd2Fzbid0IGluIHRoZSBmb3JtCm9mIHBhdGNoZXMgYWdhaW5z
dCB0aGUgLnRleCBkb2N1bWVudGF0aW9uIGZpbGVzIHlldC4gSXQncyBiZWVuIGxheWluZwphc2lk
ZSBmb3IgcXVpdGUgYSB3aGlsZSwgc2luY2UgSSd2ZSBiZWVuIGJ1c3kgdy8gb3RoZXIgdGhpbmdz
LgoKCi0tbXR4CgotLSAKLS0tCkhpbndlaXM6IHVudmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2
bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVuZCBtYW5pcHVsaWVydAp3ZXJkZW4gISBGw7xyIGVpbmUg
dmVydHJhdWxpY2hlIEtvbW11bmlrYXRpb24gc2VuZGVuIFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQ
LVNjaGzDvHNzZWwgenUuCi0tLQpFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdApGcmVl
IHNvZnR3YXJlIGFuZCBMaW51eCBlbWJlZGRlZCBlbmdpbmVlcmluZwppbmZvQG1ldHV4Lm5ldCAt
LSArNDktMTUxLTI3NTY1Mjg3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
