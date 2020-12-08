Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6921C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:03:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E71B23A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E71B23A6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yA/+9y5nb6g/hZoHNFog2b17krbnZ5uN+kxOqIoabj0=; b=E3a2+Pnz98+PIigRqJ33ne4J+
	ttSpI0/X53Th+yDEUcCH09OwGuThSM4exBxkKVWHQUn+uDbuitORjUTVWWR86IjTdLHrfJqVcn7S3
	SHLEaPdGg6VCV6+n1UJw9L1HnWpV0zvndBGceaT51ygVI1waneY3VdCbZw3UcNfM6i4pYQpgDsuEP
	IIXcbQRI+P9moZXFwVrkvZD75cdTW1npO1VlszdJqvq5ZhdTyHfi5rs8UKWWjiiN6BUZJCWWHjnVY
	22I1nng1f7u4AQASuXyvaUXpx5Z54hyiTzLeX2IXh1aoa8WNffcQAPComUPmRVEpXK14EDmPewR3T
	EEz9UrcXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmX1Q-0003OV-94; Tue, 08 Dec 2020 07:02:52 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmX1N-0003Nw-Tg
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:02:50 +0000
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N1gac-1k2W2w0CRk-0122tg; Tue, 08 Dec 2020 08:02:38 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
 <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
Date: Tue, 8 Dec 2020 08:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
Content-Language: tl
X-Provags-ID: V03:K1:yN/BLdqz0Vt6Gc78kBHQubmPRXCo+73gjuzZ/FFo2aygJNFdokw
 bIFudmapyFmrSTiIyDb+aUPLo4yjgmjzlZMHyY524wcRKwqJq6WUoQuYl0k5Pj+8yTyR84y
 vzIM/cQCfW0r7jZgN8QvC1Wc8KV3kJ84BqpcGGXAv4vtZ2kMN43JYtqtkbJ/w0CRh6eQyeu
 CxLLWsOi5p/z4+EPl66hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6pWCIG+eKA=:YbDwb0QlpqYTg8o6ISKAj2
 2nx0ApszFX4DE52Hscm8BkPNFR0h/2Fr+oZcQFep2yDc08ctJ8p3fmYPuNV0jI70LoAD5gsmZ
 UxJi4zgWgNmSEvnNeoGRSVyAPJzxpqhOYJlqrEfs6XBgcCp4H31ur0WIKnKawxt5XmNQaEbyU
 Rd1swVS5bTy3atV1TPcwwydDrVdZEbmA90gVpyvuZVgeJqSAU/BNLajbH7aJTMgwe+L9AD1TU
 atTQxHBFZtuKkB6bOLxKMt0WimiYKuxTkIqGHJUnP832C47aTjMj9ATICWRI1Lt8a0McjrO0T
 9tPJ17odptw/ER8zz/fYEcdCYQV1gkbJatZw3JfUkDE3zbSJphmhDX4SyLdWuI/DPlFWqZi+K
 5tuNk+qVAyf10TKOHLGmyg6s05gRd1Kdo0Mt3jgjYDktLNgL9yI5eZAWfZ8U9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_020250_189425_A2BFD636 
X-CRM114-Status: UNSURE (   9.83  )
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
Cc: stefanha@redhat.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDguMTIuMjAgMDM6MzYsIEphc29uIFdhbmcgd3JvdGU6CgpIaSwKCj4gU28gd2UgZW5kdXAg
d2l0aCB0d28gc29sdXRpb25zICh3aXRob3V0IGEgcHJvbXB0KToKPiAKPiAxKSB1c2luZyBzZWxl
Y3QsIHVzZXIgbWF5IGVuZCB1cCB3aXRoIGRyaXZlciB3aXRob3V0IHRyYW5zcG9ydAoKSU1ITyBu
b3QgYW4gZW50aXJlbHkgdW51c3VhbCBzaXR1YXRpb24gaW4gb3RoZXIgcGxhY2VzIG9mIHRoZSBr
ZXJuZWwsCmVnLiBvbmUgY2FuIGVuYWJsZSBVU0IgZGV2aWNlcywgdy9vIGhhdmluZyBhbiB1c2Ig
aG9zdCBhZGFwdGVyIGVuYWJsZWQuCgpBbmQgZXZlbiBpZiBzb21lIFVTQi1IQSBkcml2ZXIgaXMg
ZW5hYmxlZCwgdGhlIGFjdHVhbHkgbWFjaGluZSBkb2Vzbid0Cm5lY2Vzc2FyaWx5IGhhdmUgdGhl
IGNvcnJlc3BvbmRpbmcgZGV2aWNlLgoKPiAyKSB1c2luZyBkZXBlbmRzLCB1c2VyIG5lZWQgdG8g
ZW5hYmxlIGF0IGxlYXN0IG9uZSB0cmFuc3BvcnQKPiAKPiAyKSBsb29rcyBhIGxpdHRsZSBiaXQg
YmV0dGVyIEkgYWRtaXQuCgpTbywgYWxsIHZpcnRpbyBkZXZpY2VzIHNob3VsZCBkZXBlbmQgb24g
VFJBTlNQT1JUX0EgfHwgVFJBTlNQT1JUX0IgfHwKVFJBTlNQT1JUX0MgfHwgLi4uID8gKGFuZCBh
bHNvIGNoYW5nZSBhbGwgdGhlc2UgcGxhY2VzIGlmIGFub3RoZXIKdHJhbnNwb3J0IGlzIGFkZGVk
KSA/CgotLW10eAoKLS0gCi0tLQpIaW53ZWlzOiB1bnZlcnNjaGzDvHNzZWx0ZSBFLU1haWxzIGvD
tm5uZW4gbGVpY2h0IGFiZ2Vow7ZydCB1bmQgbWFuaXB1bGllcnQKd2VyZGVuICEgRsO8ciBlaW5l
IHZlcnRyYXVsaWNoZSBLb21tdW5pa2F0aW9uIHNlbmRlbiBTaWUgYml0dGUgaWhyZW4KR1BHL1BH
UC1TY2hsw7xzc2VsIHp1LgotLS0KRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQKRnJl
ZSBzb2Z0d2FyZSBhbmQgTGludXggZW1iZWRkZWQgZW5naW5lZXJpbmcKaW5mb0BtZXR1eC5uZXQg
LS0gKzQ5LTE1MS0yNzU2NTI4NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
