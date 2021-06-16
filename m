Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF8C48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 18:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA395613BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 18:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA395613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU+MnL2jzEBKqw0DOgiKHLGCrVUbyx8YamyRBYLrF1o=; b=im2hkHzgBGpq4K4fNx1fXNhgv8
	LMMWwTJmIhJ5ijG6AdGoPNfRSUNQcK49SzbL5ME8YXYaXmxW39NZClg4fEfrJRdQnJvOraW0S+QKL
	rm5NfMDaL5yQoduymdT9/I+EeLyLxRNhUAFrMt0zL06KVYQTOVq1BoXB21RiZ84/dzP4JzGJV28MS
	CmhfpfvbJ8Eon4yVKLAbwOs4PhmmYX++8ksqcoW1sbij95VlgiVEC+bfHsi9nyryMNsemig5qlT16
	bVYappHJyCSJ/kJYEi0rv+ei9cDTbAi1Qpwt2QbJUs2kpUvTgipv2Ia4bYiDHl312g1TarjHLoPjG
	YQUkJyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltaaC-007S8W-VV; Wed, 16 Jun 2021 18:48:12 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltaaA-007S7u-Fe
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 18:48:11 +0000
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MxV8b-1l5MSc34zR-00xpsk; Wed, 16 Jun 2021 20:47:19 +0200
Subject: banned on virtio list ? [Re: [PATCH] drivers: gpio: add virtio-gpio
 guest driver]
To: Linus Walleij <linus.walleij@linaro.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 virtio-dev@lists.oasis-open.org
References: <20210615174911.973-1-info@metux.net>
 <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c4b3b9b1-7665-c4a1-8a53-33f9481d7488@metux.net>
Date: Wed, 16 Jun 2021 20:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:4yTTdnazCcdy51jXTnobM/EDbzQ0FTisHwufr8IqLM8oiF1UqT1
 I1TntUBxemNc/sD5f/b1HKBIqzscRv/b/XtX1jBxPSmWG4fQJGIQd++zbEqrCIU+W8nriUP
 PVYNGmrtm2dFlN5quMrwoPh20SrEZhrBrPvQYGyO3I2XeuWYgdYOL7CwFJQdn6mfo2LERrf
 oJ1aeZd1sVqkIHjG8dKnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Qp8Up1RRuQ=:e91Fbxp/OzeC2u2BBR/OlC
 YHafT4/nqGJuwNL4mTZ3zSuDXkbn8f2oztj2aWuu/LNfIdcKvUCtT1yArgaSDo7ik6XVn64Bi
 561L0jHopMWNoOmYRLCiKmcN2ALhXiUSkihQ+X2+zg8iOpKGP0L4us4z+TtDKo3hJexYANPYR
 /YxXqzX8UCwzyaUkcGgNsBgJbDEMsYitzPfs+aQtFzPsThsv+GYNm81WVd9993CXXzzYl5YbX
 0nFwiuRuaPSIJbIHMVpx5vypmA9mqO6meBz1tVccg/yr12Pwhc+Xhhqjn5x2RkvsMnDmjU5p2
 XKllbyTrWtEu46bi1WFox1t56cfviIQQFx8ILvctOejlR4erh7hz4bHpdGpd/iPmxEavLx38A
 q7zm+7az6RBtnvTWrU5HSZ3G8/2o/fyEGHMKYDlnUoIbKR0my508CY+qMONznmIYk3YE/NmGu
 P9qlELNWL098mu7UhUSiMNn+FspntTOadZCiRvYLKEKOR2fKPji6llyibHMG2rlRVzQV+I4Xf
 7Il+76VvJlCT+kYeyvxSvU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_114810_863112_1C6E26B0 
X-CRM114-Status: UNSURE (   7.62  )
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

T24gMTYuMDYuMjEgMTA6MzEsIExpbnVzIFdhbGxlaWogd3JvdGU6CgpIaSBmb2xrcywKCgo8c25p
cD4KCmludGVyZXN0aW5nOiB0cnlpbmcgdG8gcG9zdCBteSB0ZXgnZmllZCBzcGVjIHRvIHZpcnRp
by1kZXYgYW5kCnZpcnRpby1jb21tZW50IHF1aXRlIHNvbWUgdGltZSBub3csIGJ1dCBhbHdheXMg
YmVpbmcgYmxvY2tlZC4gV2hhdCdzIApnb2luZyBvbiB0aGVyZSA/CgoKLS1tdHgKCi0tIAotLS0K
SGlud2VpczogdW52ZXJzY2hsw7xzc2VsdGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2
cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVu
aWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0t
CkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4
IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
