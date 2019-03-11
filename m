Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9414EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:35:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D5D205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngcoEi/F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otYKz0gh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D5D205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/v6ub80tT6B9ANGAfoDMv6mm2+IcnXmVTXFI44Vczg=; b=ngcoEi/F/yNah2
	inneCYccPJ955ktnaA72YS09immnXNH30HSGOk8TqC0ST7RVDMTK8UIQlSMr3nN2BGMKIDDed1IhG
	3Ouk1elMCnHZPqbqOoMr65DxxWarLpEVOW8+R88wdCkp+Rx2XXHCPQSQs5am+uXyD18gZ3pgOMqEE
	88eJLvLzBYmhx3E0ZOQvWVLSDw5ub0jMj4xx4PQbKVwTLr0zznPp9YQNzI5eZQ5b6hFtZxP/y8gma
	nG4yWLnZzYMFSr0fJ4ANOEeedAAm4TX567dKaJsFsYYblLHrha+5i1GtchdtIsj+kYwr9euNp44oM
	EdaXbOeOX/reyvu33eow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Ntu-0000zR-Qe; Mon, 11 Mar 2019 16:35:42 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Ntr-0000z2-G9
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 16:35:40 +0000
Received: by mail-qt1-x841.google.com with SMTP id f11so5769512qti.7
 for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2019 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1Diu3dSoQ2XdzOpX5rzgqKD6efyUtmkLvv8No83Lf58=;
 b=otYKz0ghtHUUaMWeqr1EEwter/uDs5U+k47kLdF32y1rIYXfaRykCOw+HUu6pPH97n
 eT93FUYUvdxFogzq2+xjV/2m7CmfytKiV75oVIgjXapxmnoP67+XzMQ1EZJdp41b/L8W
 QiNlSxc4F7ikZDPCPAM4W2xBf0QqFYATIhe6qCmgtrjLe+XoOvjQORFp6f34b4uBSXX5
 /ZOli9UKJfDCd/CvbtIXGKh/WRcoZmr8UowJhgMsRH1bXulXfB3lyyq1wT+NVddashaz
 TQzhosllsudLd7BeTLjpOmbbNLQtD+VQp8lH5o/f3cvvCk9XMV6iR22Mtg7mR7SPVHZd
 f6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1Diu3dSoQ2XdzOpX5rzgqKD6efyUtmkLvv8No83Lf58=;
 b=nQjDh5mHtPk1zxeg2QfhVmsojV/+kXSeFZHOlbYh53xJAy1uAh2qmDOK5WOTzIJ3Xq
 qNYCIybHTWGZvM/ZK6/nzGPA6zXXkNKjLcnUA9FmLLwcrYyG2vRWlEN/LsxRFgescn5i
 FN+GT8D9scc0R5JkpcBXcOazPRbgZf4RPPfn4rGPG3Yk51Vi0L2al0hd6Hp7802WHgMe
 Qztqi13pUWxj5edRLx+v8r4ucBwo67kQNCkXElxZO+BwEK2/w3jPFTDmKg5wxjYlLjCb
 pLkNjiZA4HZbgX2p7LYF9nn5Onzob8rZhNTVhQrYo9mK6c/X9rnR+KnFu07ZgBVpS9tC
 tEpw==
X-Gm-Message-State: APjAAAVP4KSvRhppieIMg32vmKo7sqj3fKnwaweC5zqTaRZPkzd+XWEE
 x8b1kyMlU0aE1Hm8K6LVJaYYh6lgtRseSRJm89IXVnkstIk5uA==
X-Google-Smtp-Source: APXvYqxCzFthYgIepTz3lB/f4tFId/xWts9S46s5kt8s7THQHjCWuBAudfHwdicd28LPo6AICX3lZ9Rlf9LeBakKoEw=
X-Received: by 2002:aed:3783:: with SMTP id j3mr26951642qtb.16.1552322138007; 
 Mon, 11 Mar 2019 09:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <010001696d73c925-5f894cf1-aa67-4e05-8e76-123a4b4c6904-000000@email.amazonses.com>
In-Reply-To: <010001696d73c925-5f894cf1-aa67-4e05-8e76-123a4b4c6904-000000@email.amazonses.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Mon, 11 Mar 2019 17:35:26 +0100
Message-ID: <CAJ+HfNigK=FiWDtNaJm5-8QP1MEa9M+=B1PnFLGTPX5oXZRm+g@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Christopher Lameter <cl@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_093539_531940_A371A918 
X-CRM114-Status: GOOD (  14.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBNYXIgMjAxOSBhdCAxNjo1MSwgQ2hyaXN0b3BoZXIgTGFtZXRlciA8Y2xAbGlu
dXguY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMTEgTWFyIDIwMTksIEJqw6/Cv8WTcm4gVMOvwr/F
k3BlbCB3cm90ZToKPgo+ID4gPiA+IEhtbSwgeW91IG1lYW4gQU1PICp3aXRoKiBwcmVlbXB0X3tk
aXMsZW59YWJsZSwgcmlnaHQ/IChObywgaW50ZXJydXB0Cj4gPiA+ID4gZGlzYWJsZSwgb25seSBw
cmVlbXB0aW9uLikKPiA+ID4KPiA+ID4gSWYgeW91IGRpc2FibGUgcHJlZW1wdGlvbiB0aGVuIHlv
dSBkb250IG5lZWQgQU1PIGFueW1vcmUuIEluIGZhY3QgdGhhdCBpcwo+ID4gPiB0aGUgZGVmYXVs
dCBmYWxsYmFjayBnZW5lcmljIGltcGxlbWVudGF0aW9uLiBKdXN0IGRvbnQgZG8gYW55dGhpbmcg
YW5kIHlvdQo+ID4gPiBhbHJlYWR5IGhhdmUgdGhhdCBzb2x1dGlvbi4KPiA+Cj4gPiBCdXQgdGhl
IGdlbmVyaWMgb25lIGRpc2FibGVzIGludGVycnVwdHMsIHJpZ2h0Pwo+Cj4gTm8gaXQgZG9lc250
Lgo+CgpPaywgcGxlYXNlIGVkdWNhdGUgbWUgd2hhdCBJJ20gbWlzc2luZyBoZXJlLgoKRnJvbSBh
c20tZ2VuZXJpYy9wZXJjcHUuaDoKCiNkZWZpbmUgdGhpc19jcHVfZ2VuZXJpY190b19vcChwY3As
IHZhbCwgb3ApICAgICAgICAgICAgICAgIFwKZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKICAgIHVuc2lnbmVkIGxvbmcgX19mbGFnczsgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAgICByYXdfbG9jYWxfaXJxX3NhdmUoX19mbGFncyk7ICAgICAgICAgICAgICAgICAg
ICBcCiAgICByYXdfY3B1X2dlbmVyaWNfdG9fb3AocGNwLCB2YWwsIG9wKTsgICAgICAgICAgICAg
ICAgXAogICAgcmF3X2xvY2FsX2lycV9yZXN0b3JlKF9fZmxhZ3MpOyAgICAgICAgICAgICAgICAg
ICAgXAp9IHdoaWxlICgwKQoKQW5kIHRoZSBkaXNhc3NlbWJseSBmcm9tIG15IGJ1aWxkIGRvZXMg
aW5kZWVkIGhhdmUgaW50ZXJydXB0IGRpc2FibGVkIHJlZ2lvbnMuCgpTb3JyeSBmb3IgYmVpbmcg
YSBiaXQgc2xvdyBoZXJlLiA6LSkKCgpCasO2cm4KCj4gPiBJIGJlbGlldmUgdGhlIHJhdGlvbmFs
IGZvciBSViBpcyBzaW1pbGFyIHRvIEFSTSdzOyBBTU8rcHJlZW1wdGlvbgo+ID4gZGlzYWJsZSBy
ZWdpb25zIGlzICpzbGlnaHRseSogYmV0dGVyIHRoYW4gdGhlIGdlbmVyaWMsIGJ1dCBub3QgYXMg
Z29vZAo+ID4gYXMgdGhlIElBIG9uZS4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8+Cj4KPiBM
b29rcyB0byBtZSB0aGF0IHRoZSBiZXR0ZXIgc29sdXRpb24gZm9yICBBUk0gbWF5IGJlIHRvIGRy
b3AgaXRzCj4gaW1wbGVtZW50YXRpb24gYW5kIHJldmVydCB0byB0aGUgZ2VuZXJpYyBvbmUuCj4K
PiBUaGUgb3ZlcmhlYWQgb2YgQU1PcyBpcyBsaWtlbHkgdG9vIGhpZ2ggdG8ganVzdGlmeSB1c2lu
ZyB0aG9zZS4gQW5kIHRoZQo+IExDL1NDIG92ZXJoZWFkIGlzIGFsc28gZ2VuZXJhdGluZyB1c2Vs
ZXNzIG92ZXJoZWFkLgo+Cj4gSWYgeW91IGJlbmNobWFyayB0aG9zZSB0aGVuIHBsZWFzZSBiZSBh
d2FyZSB0aGF0IHRoZSBrZXJuZWwgdXNlcwo+IF9fdGhpc194eHggb3BzIGluIHBsYWNlcyB3aGVy
ZSB0aGUgcHJlZW1wdCBkaXNhYmxlIGlzIG5vdCBuZWVkZWQuIFRoZQo+IHNhdmluZ3MgY29tZSBp
biB0aGUgZm9ybSBvZiB0aGlzX3h4eCBvcHMgd2hlcmUgd2UgYXZvaWQgdGhlIG92ZXJoZWFkIG9m
Cj4gZW5hYmxpbmcgYW5kIGRpc2FibGluZyBwcmVlbXB0aW9uICh3aGljaCBjYW4gYmUgc2lnbmlm
aWNhbnQgZXNwZWNpYWx5Cj4gZ2l2ZW4gdGhlIHNjaGVkdWxlciBhY3Rpb25zKS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
